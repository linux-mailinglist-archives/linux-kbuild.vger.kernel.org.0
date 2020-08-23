Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7F824EA93
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Aug 2020 02:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgHWAkq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 20:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgHWAko (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 20:40:44 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AD9C061573
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Aug 2020 17:40:43 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id f193so2940069pfa.12
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Aug 2020 17:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eh5sQVyCmH30XYzTZRKBdCm/XGoXbbsyIhSzkPDA3nY=;
        b=KFCVvOGjy3AcOG2bBSkOE+3LCzwwPZotSad1PWFQ4uJDa+qiLx1O6isw2wwjGzte+5
         CMnFYskCCwmtWO5Qt4aw1gHPOCl6EED6k9qUlfe9sQg3y4O7B0G07OU4SyalFCkYJBR9
         sYaDBVnSOeYpbfw8CHJ+fGbd7+adurmOiXd72K4p8AkijCTdm6P9wOnShFY93jbHECFQ
         29maW9D/0Gmk179UdXjnV//yhb0CBBxkjYT7Ag9wXNGziLL7xaJz8aD2vn4FCi2dynrZ
         CQoSUM/sJzKUQk3Zuj3FHSCqPtR99snCR0Z+J2Yk0OB3VtpCjVYAe3kMyth2evKk5Fj9
         cxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eh5sQVyCmH30XYzTZRKBdCm/XGoXbbsyIhSzkPDA3nY=;
        b=BG3/gUbZ5nGPRUOxip3WL9MoUtgr+vzre1oNuauuAAPm/+lDw8jdsmseZvGRLbjI+q
         P4NaZNGJ8oDNrJ3csKlwokydLyYWDepeERGns6MznDynsps1KZE5dR6s+QfJUkVVujwY
         vT0Zf1AEsYCd2p3E9F7TMp2hWLQCOJYr6bb8F59wd4foEY0aLZPHsy0PdX+t+OeciQws
         p323ln/Jk0Jwn2z8tEEBv8rdNSby90MWYggWjRulcRBlCaJB/CW4/fN5ZePqTTCZrjqV
         WSsEzTRoJjlLsnUVJlFIJGGR5+C+gLp7jC63w8tkT3eWC0kUUdQjdubLWinzIC26vOvT
         dqNQ==
X-Gm-Message-State: AOAM531DVZ9s2A7+3KZNFlH0qXJ2cQJOHOlNdLuj9udOd9X6RnjELPWW
        z2CbmXPDZJSQPsAi9OQSFNXwuXXhBkh3QYVI8ZfFjg==
X-Google-Smtp-Source: ABdhPJxbF8iHnyeBqTxIEzJj/7CIIpAKX88fhSnZMq4wcG3PnYETUVS5bin64B/+NXyGy8iKsuroJnqqbRO/M7eNFyY=
X-Received: by 2002:a63:a119:: with SMTP id b25mr6481177pgf.10.1598143242377;
 Sat, 22 Aug 2020 17:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200822145618.1222514-1-masahiroy@kernel.org> <20200822145618.1222514-8-masahiroy@kernel.org>
In-Reply-To: <20200822145618.1222514-8-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Sat, 22 Aug 2020 17:40:31 -0700
Message-ID: <CAKwvOdkbc-NH5-fx7DVOj8=fgo6AmM5ufOSvkVYp3XXVxVdoCQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] gen_compile_commands: support *.o, *.a,
 modules.order in positional argument
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 22, 2020 at 7:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This script currently searches the specified directory for .cmd files.
> One drawback is it may contain stale .cmd files after you rebuild the
> kernel several times without 'make clean'.
>
> This commit supports *.o, *.a, and modules.order as positional
> parameters. If such files are given, they are parsed to collect
> associated .cmd files. I added a generator helper for each of them.
>
> This feature is useful to get the list of active .cmd files from the
> last build, and will be used by the next commit to wire up the
> compile_commands.json rule to the Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v3:
>   - Use 'llvm-ar' instead of 'ar' for the default of -a option
>   - Fix the corrupted comment block
>
> Changes in v2:
>   - Separate the file parser into generator functions
>   - Use 'obj' instead of 'object' because 'object' is a built-in function
>   - I think using 'file' is OK because it is not a built-in function in Python3
>     (https://docs.python.org/3/library/functions.html)
>     Anyway, the variable 'file' is no longer used in this version
>   - Keep the previous work-flow to allow to search the given directory
>
>  scripts/gen_compile_commands.py | 100 ++++++++++++++++++++++++++++++--
>  1 file changed, 96 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index e45f17be8817..f370375b2f70 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -12,6 +12,7 @@ import json
>  import logging
>  import os
>  import re
> +import subprocess
>
>  _DEFAULT_OUTPUT = 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL = 'WARNING'
> @@ -32,8 +33,9 @@ def parse_arguments():
>      Returns:
>          log_level: A logging level to filter log output.
>          directory: The work directory where the objects were built.
> +        ar: Command used for parsing .a archives.
>          output: Where to write the compile-commands JSON file.
> -        paths: The list of directories to handle to find .cmd files.
> +        paths: The list of files/directories to handle to find .cmd files.
>      """
>      usage = 'Creates a compile_commands.json database from kernel .cmd files'
>      parser = argparse.ArgumentParser(description=usage)
> @@ -53,12 +55,21 @@ def parse_arguments():
>      parser.add_argument('--log_level', choices=_VALID_LOG_LEVELS,
>                          default=_DEFAULT_LOG_LEVEL, help=log_level_help)
>
> +    ar_help = 'command used for parsing .a archives'
> +    parser.add_argument('-a', '--ar', type=str, default='llvm-ar', help=ar_help)
> +
> +    paths_help = ('directories to search or files to parse '
> +                  '(files should be *.o, *.a, or modules.order). '
> +                  'If nothing is specified, the current directory is searched')
> +    parser.add_argument('paths', type=str, nargs='*', help=paths_help)
> +
>      args = parser.parse_args()
>
>      return (args.log_level,
>              os.path.abspath(args.directory),
>              args.output,
> -            [args.directory])
> +            args.ar,
> +            args.paths if len(args.paths) > 0 else [args.directory])
>
>
>  def cmdfiles_in_dir(directory):
> @@ -81,6 +92,73 @@ def cmdfiles_in_dir(directory):
>                  yield os.path.join(dirpath, filename)
>
>
> +def to_cmdfile(path):
> +    """Return the path of .cmd file used for the given build artifact
> +
> +    Args:
> +        Path: file path
> +
> +    Returns:
> +        The path to .cmd file
> +    """
> +    dir, base = os.path.split(path)
> +    return os.path.join(dir, '.' + base + '.cmd')
> +
> +
> +def cmdfiles_for_o(obj):
> +    """Generate the iterator of .cmd files associated with the object
> +
> +    Yield the .cmd file used to build the given object
> +
> +    Args:
> +        obj: The object path
> +
> +    Yields:
> +        The path to .cmd file
> +    """
> +    yield to_cmdfile(obj)
> +
> +
> +def cmdfiles_for_a(archive, ar):
> +    """Generate the iterator of .cmd files associated with the archive.
> +
> +    Parse the given archive, and yield every .cmd file used to build it.
> +
> +    Args:
> +        archive: The archive to parse
> +
> +    Yields:
> +        The path to every .cmd file found
> +    """
> +    for obj in subprocess.check_output([ar, '-t', archive]).decode().split():
> +        yield to_cmdfile(obj)
> +
> +
> +def cmdfiles_for_modorder(modorder):
> +    """Generate the iterator of .cmd files associated with the modules.order.
> +
> +    Parse the given modules.order, and yield every .cmd file used to build the
> +    contained modules.
> +
> +    Args:
> +        modorder: The modules.order file to parse
> +
> +    Yields:
> +        The path to every .cmd file found
> +    """
> +    with open(modorder) as f:
> +        for line in f:
> +            ko = line.rstrip()
> +            base, ext = os.path.splitext(ko)
> +            if ext != '.ko':
> +                sys.exit('{}: module path must end with .ko'.format(ko))
> +            mod = base + '.mod'
> +           # The first line of *.mod lists the objects that compose the module.
> +            with open(mod) as m:
> +                for obj in m.readline().split():
> +                    yield to_cmdfile(obj)
> +
> +
>  def process_line(root_directory, command_prefix, file_path):
>      """Extracts information from a .cmd line and creates an entry from it.
>
> @@ -117,7 +195,7 @@ def process_line(root_directory, command_prefix, file_path):
>
>  def main():
>      """Walks through the directory and finds and parses .cmd files."""
> -    log_level, directory, output, paths = parse_arguments()
> +    log_level, directory, output, ar, paths = parse_arguments()
>
>      level = getattr(logging, log_level)
>      logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
> @@ -127,7 +205,21 @@ def main():
>      compile_commands = []
>
>      for path in paths:
> -        cmdfiles = cmdfiles_in_dir(path)
> +        # If 'path' is a directory, handle all .cmd files under it.
> +        # Otherwise, handle .cmd files associated with the file.
> +        # Most of built-in objects are linked via archives (built-in.a or lib.a)
> +        # but some objects are linked to vmlinux directly.
> +        # Modules are listed in modules.order.
> +        if os.path.isdir(path):
> +            cmdfiles = cmdfiles_in_dir(path)
> +        elif path.endswith('.o'):
> +            cmdfiles = cmdfiles_for_o(path)
> +        elif path.endswith('.a'):
> +            cmdfiles = cmdfiles_for_a(path, ar)
> +        elif path.endswith('modules.order'):
> +            cmdfiles = cmdfiles_for_modorder(path)
> +        else:
> +            sys.exit('{}: unknown file type'.format(path))
>
>          for cmdfile in cmdfiles:
>              with open(cmdfile, 'rt') as f:
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
