Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF803190E4
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 18:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhBKRVV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 12:21:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:44578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231860AbhBKRTu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 12:19:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09A2A64E7D;
        Thu, 11 Feb 2021 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613063950;
        bh=CB9nGzI/AeQNscTNyB/VAn3SBkJwUg/HzJ5/zb+R07Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tDhjI/B1hXnJr0dwttH4OLH7fFxUd8iu4SIxRR8bspbrO5R1ndSua/KMYinHddsk/
         QysOPh9WibZvE2jlyT6xizWkuLr1hJeYxvbnqs5i4MyoMEnvOQct4PMMax4BN01aAZ
         FlNwFRdBeofsPtgKL/6i1VYs5ll51ROnr21o/ysDKtVKNcNHjCNqYYwkdwKO4qpEac
         BwSpXIx3vLdYo/8wM39wZBp4SBsELeaxFZ6C0+muvD7URjAMJ9NBB+ulfflb8IEfkE
         QnddslgegsFZiOmNFOuAXLHk6Z1om8/z5qzrSusCUOZNoGkjYBZVYREOjcJh88xl3e
         rgeP0dn2qupCg==
Date:   Thu, 11 Feb 2021 10:19:08 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: prune some directories
Message-ID: <20210211171908.GA3820685@ubuntu-m3-large-x86>
References: <20210211161154.3892836-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211161154.3892836-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 12, 2021 at 01:11:54AM +0900, Masahiro Yamada wrote:
> If directories are passed to gen_compile_commands.py, os.walk() traverses
> all the subdirectories to search for .cmd files, but we know some of them
> are not worth traversing.
> 
> Use the 'topdown' parameter of os.walk to prune them.
> 
> Documentation about the 'topdown' option of os.walk:
>   When topdown is True, the caller can modify the dirnames list
>   in-place (perhaps using del or slice assignment), and walk() will
>   only recurse into the subdirectories whose names remain in dirnames;
>   this can be used to prune the search, impose a specific order of
>   visiting, or even to inform walk() about directories the caller
>   creates or renames before it resumes walk() again. Modifying
>   dirnames when topdown is False has no effect on the behavior of
>   the walk, because in bottom-up mode the directories in dirnames
>   are generated before dirpath itself is generated.
> 
> This commit prunes four directories, .git, Documentation, include, and
> tools.
> 
> The first three do not contain any C files. My main motivation is the
> last one, tools/ directory.
> 
> Commit 6ca4c6d25949 ("gen_compile_commands: do not support .cmd files
> under tools/ directory") stopped supporting the tools/ directory.
> The current code no longer picks up .cmd files from the tools/
> directory.
> 
> If you run:
> 
>   ./scripts/clang-tools/gen_compile_commands.py --log_level=INFO
> 
> then, you will see several "File ... not found" log messages.
> 
> This is expected, and I do not want to support the tools/ directory.
> However, without an explicit comment "do not support tools/", somebody
> might try to get it back. Clarify this.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Sorry, I did not realize that gen_compile_commands.py did not intend to
support. I was only looking at the history for the current location, not
the former one of scripts/gen_compile_commands.py.

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/clang-tools/gen_compile_commands.py | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 19963708bcf8..eb5faefbdf74 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -20,7 +20,9 @@ _DEFAULT_LOG_LEVEL = 'WARNING'
>  _FILENAME_PATTERN = r'^\..*\.cmd$'
>  _LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
>  _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
> -
> +# The tools/ directory adopts a different build system, and produces .cmd
> +# files in a different format. Do not support it.
> +_EXCLUDE_DIRS = ['.git', 'Documentation', 'include', 'tools']
>  
>  def parse_arguments():
>      """Sets up and parses command-line arguments.
> @@ -80,8 +82,14 @@ def cmdfiles_in_dir(directory):
>      """
>  
>      filename_matcher = re.compile(_FILENAME_PATTERN)
> +    exclude_dirs = [ os.path.join(directory, d) for d in _EXCLUDE_DIRS ]
> +
> +    for dirpath, dirnames, filenames in os.walk(directory, topdown=True):
> +        # Prune unwanted directories.
> +        if dirpath in exclude_dirs:
> +            dirnames[:] = []
> +            continue
>  
> -    for dirpath, _, filenames in os.walk(directory):
>          for filename in filenames:
>              if filename_matcher.match(filename):
>                  yield os.path.join(dirpath, filename)
> -- 
> 2.27.0
> 
