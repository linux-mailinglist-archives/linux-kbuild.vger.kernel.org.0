Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A810E24E452
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 02:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgHVA7t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 20:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgHVA7r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 20:59:47 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29D5C061573
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:59:47 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id r11so1881301pfl.11
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wMClZMLlnIVxwC0OX/YJqw846WceChHdY8h9nnyWNwk=;
        b=O0MPFknxyxwnjaYELL5AsKcISclqIjVHZwyIqMV6CvXBwfdiKyrijCO1D+s9z07YMv
         carMmTfSiC0QBlztpwDj6OOj0b5NCgh48JCoFg1F1f/yjyZQas5G4KDIdvfF7loBaFxJ
         SNESxXM6R/HSm1Cmxxu92NCT9RcGj7UjfM/d8Lrh0GH1cj2SMAg6SKO9UDRmCV6Y3PPb
         MFM7HRCc3M3s7LDXrF3c4PKr+uGGhbdfXz7i5iG2HvxPnQ52O6ErDLEpPHN3pkxdGaoU
         P4hoiNcKoQzDEq5LEJRCEJaOa96dedqLy8moHFqzhmPrJr0OgM6NDpWvRt+0y+JuFtvv
         iJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wMClZMLlnIVxwC0OX/YJqw846WceChHdY8h9nnyWNwk=;
        b=S0rHDvfm6vTq5G9jV0ARb8kNDwTLphq/ZS1V5i/tlirus2xEej+YHVXnLNKPT/O9wR
         kYxUKf6jCS0alH14APtxwxNhaLm15ca7F5VnLu0ZXVz4mwJPA3Nvy+lhtgBHU0dElt9M
         d2PHxv+elkQTsTlgjFv6d2BxwNG+QupN/6CqFZjQwtZTAW8vQiTd7Twlh2Cny35dCNJW
         MJ0rvIFHAu12K0Z3Wwri7LaxAXxBm/IQf3PxlRsBVZS2HuuzpbQwFOv+wVgjZn0d3YkF
         RPGEG2AbdxokbW5bKohOhdl9Wu0Sh3MqAnwx5oabxvtPf9Tm4k11d4i6xXa45cwvBvbq
         ig/w==
X-Gm-Message-State: AOAM533epKCRmM3G8mUP9T9Xg3VYPqPzJMJ1A+EouqCoG9QPINnTu4T5
        4IWKnjRoCOjXHvF0wMU2K8Q9cYtGJvvXiBGTFb85qWLRGGI=
X-Google-Smtp-Source: ABdhPJzzypM5an0tesYLO2xDp0D/NDrENlucCRy53aLYG/ywXPSsris885MK2sKtvx61gmxWlfhgKIMAE8gm2AGGYac=
X-Received: by 2002:a63:7d8:: with SMTP id 207mr4183460pgh.263.1598057985426;
 Fri, 21 Aug 2020 17:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org> <20200821190159.1033740-8-masahiroy@kernel.org>
In-Reply-To: <20200821190159.1033740-8-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 17:59:33 -0700
Message-ID: <CAKwvOdmR=VeR0=LUgXCwnpK9LH90_itzv627wBEK4hCroBEW9Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] gen_compile_commands: support *.o, *.a,
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

On Fri, Aug 21, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
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
> ---
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
> index 6dec7e2c4098..65859e6044b5 100755
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
>          directory: The work directory where the objects were built
> +        ar: Command used for parsing .a archives
>          output: Where to write the compile-commands JSON file.
> -        paths: The list of directories to handle to find .cmd files
> +        paths: The list of files/directories to handle to find .cmd files
>      """
>      usage = 'Creates a compile_commands.json database from kernel .cmd files'
>      parser = argparse.ArgumentParser(description=usage)
> @@ -53,12 +55,21 @@ def parse_arguments():
>      parser.add_argument('--log_level', choices=_VALID_LOG_LEVELS,
>                          default=_DEFAULT_LOG_LEVEL, help=log_level_help)
>
> +    ar_help = 'command used for parsing .a archives'
> +    parser.add_argument('-a', '--ar', type=str, default='ar', help=ar_help)

If there's a default, doesn't that mean it's no longer required? I
think it should be required.  For a clang specific tool, we'd prefer
the default to be llvm-ar anyways.

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

below in main() you check the file extension with endswith().  Would
it be good to be consistent between the two?

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
> @@ -116,7 +194,7 @@ def process_line(root_directory, command_prefix, file_path):
>
>  def main():
>      """Walks through the directory and finds and parses .cmd files."""
> -    log_level, directory, output, paths = parse_arguments()
> +    log_level, directory, output, ar, paths = parse_arguments()
>
>      level = getattr(logging, log_level)
>      logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
> @@ -126,7 +204,21 @@ def main():
>      compile_commands = []
>
>      for path in paths:
> -        cmdfiles = cmdfiles_in_dir(path)
> +        # If 'path' is a directory, handle all .cmd files under it.
> +        # Otherwise, handle .cmd files associated with the file.
> +        # Most of built-in objects are linked via archives (built-in.a or lib.a)
> +        # but some are linked to vmlinux directly.
> +        # Modules are lis

^ was this comment cut off?


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
