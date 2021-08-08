Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319923E3CFD
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Aug 2021 00:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhHHWS0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 8 Aug 2021 18:18:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:48760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229662AbhHHWS0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Aug 2021 18:18:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19A7A60F35;
        Sun,  8 Aug 2021 22:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628461086;
        bh=AhkExiTj7NgYDK7oXdA9gqLj35ImbC6c4czHxK2oQn0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QwfCn3KbXf7HgTJBDumrlNYfthmkNhnOhXLzc8c4t0p/DkwRRfmdCn6JiJKG8bFDP
         5gk0EPuc0n4Y5HhJqb6Tub0vLgM/KMVowq/b0Cl8ZeHIbbHHeJnp/IsExIlPny4lMl
         sPsuB289/KGsSSPIbbYmVRSBRCN+OAZgZcNP/i91yfJQnQ0aQPkOI1A6twmRgPW46o
         i5dDSwJLVWdHOJJEr+tyN0W95HSyEoyIalUy3wyDWuBnDX3n+jzkvnOliS8MOlyGAK
         fvondkbzCGNsNV3OqJj9ZkUfGqpoNbmUwvpt/ftG5PEiGadkUCbNf5CscHDb9RvNTH
         PlNA6OHqi/Mjw==
Date:   Sun, 8 Aug 2021 15:18:04 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     natechancellor@gmail.com, ndesaulniers@google.com,
        masahiroy@kernel.org, michal.lkml@markovi.net, nhuck@google.com,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clang-tools: Print information when clang-tidy tool
 is missing
Message-ID: <YRBYHAJSpU5jcTQV@Ryzen-9-3900X.localdomain>
References: <CAK7LNAS=tyS22vk1mO7uCuzZ=YuzgByzC4Aix9JwugdV3xpr-Q@mail.gmail.com>
 <20210807110116.7985-1-maciej.falkowski9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210807110116.7985-1-maciej.falkowski9@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 07, 2021 at 01:01:16PM +0200, Maciej Falkowski wrote:
> When clang-tidy tool is missing in the system, the FileNotFoundError
> exception is raised in the program reporting a stack trace to the user:
> 
> $ ./scripts/clang-tools/run-clang-tools.py clang-tidy ./compile_commands.json
> multiprocessing.pool.RemoteTraceback:
> """
> Traceback (most recent call last):
>   File "/usr/lib64/python3.8/multiprocessing/pool.py", line 125, in worker
>     result = (True, func(*args, **kwds))
>   File "/usr/lib64/python3.8/multiprocessing/pool.py", line 48, in mapstar
>     return list(map(*args))
>   File "./scripts/clang-tools/run-clang-tools.py", line 54, in run_analysis
>     p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
>   File "/usr/lib64/python3.8/subprocess.py", line 489, in run
>     with Popen(*popenargs, **kwargs) as process:
>   File "/usr/lib64/python3.8/subprocess.py", line 854, in __init__
>     self._execute_child(args, executable, preexec_fn, close_fds,
>   File "/usr/lib64/python3.8/subprocess.py", line 1702, in _execute_child
>     raise child_exception_type(errno_num, err_msg, err_filename)
> FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
> """
> 
> The patch adds more user-friendly information about missing tool:
> 
> $ ./scripts/clang-tools/run-clang-tools.py clang-tidy ./compile_commands.json
> Command 'clang-tidy' is missing in the system
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1342

LGTM, I think this is much better than the stacktrace output as above as
it is easier for someone who is not familiar with these scrips to act
on.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Hi Masahiro,
> 
> Thank you for your feedback!
> I am sorry that I haven't replied for so long.
> 
> I agree with your point, based on this I would like
> to propose a second version of the patch.
> 
> changes in v2:
>  - Solution has changed from LBYL style to EAFP
> 
> Best regards,
> Maciej Falkowski
> ---
>  scripts/clang-tools/run-clang-tools.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index fa7655c7cec0..27ebe2f2069a 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -67,7 +67,14 @@ def main():
>      # Read JSON data into the datastore variable
>      with open(args.path, "r") as f:
>          datastore = json.load(f)
> -        pool.map(run_analysis, datastore)
> +        try:
> +            pool.map(run_analysis, datastore)
> +        except FileNotFoundError as err:
> +            if err.filename == 'clang-tidy':
> +                print("Command 'clang-tidy' is missing in the system", file=sys.stderr)
> +                sys.exit(127)
> +            else:
> +                raise err
>  
>  
>  if __name__ == "__main__":
> -- 
> 2.26.3
