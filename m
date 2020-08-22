Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0616D24E4C2
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 05:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHVDMX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 23:12:23 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20388 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgHVDMW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 23:12:22 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07M3C6oI009886;
        Sat, 22 Aug 2020 12:12:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07M3C6oI009886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598065927;
        bh=e6RWKtFs9pXYjYTAelrwYfwInM31ujnRzIsZ4gq7lr8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PAglR8Gf4Qpp5orx6k6EYdPounaaKf7hVEUsb6LmAEaeITJ/xGDjOnVvjQOrDCjgo
         hPTpo44GcQSAddHwTeER5P/b2YA7whRzwVhGKQVKOJrKW/5Kext5lIXCrqotqc1i6w
         kKGXjvO0Xmafwxnx2PzlRKc/3rGL6aMSUBPLiFNOakrXWpUq3nuKoyfrmBsa7Cyb//
         6LG+znByYT2v+TezoHdZq2cdfdkCvzgEW4t02y37AckkSozH7TGGXXvbORAq4XjvWc
         w1GQPXHCvb+hPiCKcUDUmAY97HZ8PPtFZEUgSw25lAR/GfvEJp+do/Du8uRWJ3E3xj
         mrJp/DWb90wRQ==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id q68so1108399uaq.0;
        Fri, 21 Aug 2020 20:12:06 -0700 (PDT)
X-Gm-Message-State: AOAM530lDRiGb92zi4cqsmDUfyfjrd+13FGqMJm1ogAMM6dOj1sTw2nJ
        dEpnQNV+HBIQBybgmaF+Ex4UmzegVOe3DDHiaKA=
X-Google-Smtp-Source: ABdhPJxH1FB70/rsWAiTm0tLd5eU9ysIMG2MV5hQEhw9BJb7Zvk08j60pBDUm+v4TgXiTW8ZpZjYdnSGl2DMf6vZUsI=
X-Received: by 2002:ab0:623:: with SMTP id f32mr3507228uaf.121.1598065925547;
 Fri, 21 Aug 2020 20:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org>
 <20200821190159.1033740-8-masahiroy@kernel.org> <CAKwvOdmR=VeR0=LUgXCwnpK9LH90_itzv627wBEK4hCroBEW9Q@mail.gmail.com>
In-Reply-To: <CAKwvOdmR=VeR0=LUgXCwnpK9LH90_itzv627wBEK4hCroBEW9Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 22 Aug 2020 12:11:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6k5zGMHyWa=jCKo6HZf1AXq5_qtMmgY2cvet9y3u-Rg@mail.gmail.com>
Message-ID: <CAK7LNAS6k5zGMHyWa=jCKo6HZf1AXq5_qtMmgY2cvet9y3u-Rg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] gen_compile_commands: support *.o, *.a,
 modules.order in positional argument
To:     Nick Desaulniers <ndesaulniers@google.com>
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

On Sat, Aug 22, 2020 at 9:59 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Aug 21, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > This script currently searches the specified directory for .cmd files.
> > One drawback is it may contain stale .cmd files after you rebuild the
> > kernel several times without 'make clean'.
> >
> > This commit supports *.o, *.a, and modules.order as positional
> > parameters. If such files are given, they are parsed to collect
> > associated .cmd files. I added a generator helper for each of them.
> >
> > This feature is useful to get the list of active .cmd files from the
> > last build, and will be used by the next commit to wire up the
> > compile_commands.json rule to the Makefile.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >   - Separate the file parser into generator functions
> >   - Use 'obj' instead of 'object' because 'object' is a built-in function
> >   - I think using 'file' is OK because it is not a built-in function in Python3
> >     (https://docs.python.org/3/library/functions.html)
> >     Anyway, the variable 'file' is no longer used in this version
> >   - Keep the previous work-flow to allow to search the given directory
> >
> >  scripts/gen_compile_commands.py | 100 ++++++++++++++++++++++++++++++--
> >  1 file changed, 96 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> > index 6dec7e2c4098..65859e6044b5 100755
> > --- a/scripts/gen_compile_commands.py
> > +++ b/scripts/gen_compile_commands.py
> > @@ -12,6 +12,7 @@ import json
> >  import logging
> >  import os
> >  import re
> > +import subprocess
> >
> >  _DEFAULT_OUTPUT = 'compile_commands.json'
> >  _DEFAULT_LOG_LEVEL = 'WARNING'
> > @@ -32,8 +33,9 @@ def parse_arguments():
> >      Returns:
> >          log_level: A logging level to filter log output.
> >          directory: The work directory where the objects were built
> > +        ar: Command used for parsing .a archives
> >          output: Where to write the compile-commands JSON file.
> > -        paths: The list of directories to handle to find .cmd files
> > +        paths: The list of files/directories to handle to find .cmd files
> >      """
> >      usage = 'Creates a compile_commands.json database from kernel .cmd files'
> >      parser = argparse.ArgumentParser(description=usage)
> > @@ -53,12 +55,21 @@ def parse_arguments():
> >      parser.add_argument('--log_level', choices=_VALID_LOG_LEVELS,
> >                          default=_DEFAULT_LOG_LEVEL, help=log_level_help)
> >
> > +    ar_help = 'command used for parsing .a archives'
> > +    parser.add_argument('-a', '--ar', type=str, default='ar', help=ar_help)
>
> If there's a default, doesn't that mean it's no longer required? I
> think it should be required.  For a clang specific tool, we'd prefer
> the default to be llvm-ar anyways.

A good point.
I want to set reasonable values as default where possible.
'llvm-ar' is better.

I will change it.



> > +
> > +def cmdfiles_for_modorder(modorder):
> > +    """Generate the iterator of .cmd files associated with the modules.order.
> > +
> > +    Parse the given modules.order, and yield every .cmd file used to build the
> > +    contained modules.
> > +
> > +    Args:
> > +        modorder: The modules.order file to parse
> > +
> > +    Yields:
> > +        The path to every .cmd file found
> > +    """
> > +    with open(modorder) as f:
> > +        for line in f:
> > +            ko = line.rstrip()
> > +            base, ext = os.path.splitext(ko)
>
> below in main() you check the file extension with endswith().  Would
> it be good to be consistent between the two?

I want to re-use 'base' to convert
the *.ko into *.mod

path/to/my/driver.ko
-> path/to/my/driver.mod


I think using os.path.split()
is good for checking the valid suffix,
and replaceing it with '.mod'.






> > +            if ext != '.ko':
> > +                sys.exit('{}: module path must end with .ko'.format(ko))
> > +            mod = base + '.mod'
> > +           # The first line of *.mod lists the objects that compose the module.
> > +            with open(mod) as m:
> > +                for obj in m.readline().split():
> > +                    yield to_cmdfile(obj)
> > +
> > +
> >  def process_line(root_directory, command_prefix, file_path):
> >      """Extracts information from a .cmd line and creates an entry from it.
> >
> > @@ -116,7 +194,7 @@ def process_line(root_directory, command_prefix, file_path):
> >
> >  def main():
> >      """Walks through the directory and finds and parses .cmd files."""
> > -    log_level, directory, output, paths = parse_arguments()
> > +    log_level, directory, output, ar, paths = parse_arguments()
> >
> >      level = getattr(logging, log_level)
> >      logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
> > @@ -126,7 +204,21 @@ def main():
> >      compile_commands = []
> >
> >      for path in paths:
> > -        cmdfiles = cmdfiles_in_dir(path)
> > +        # If 'path' is a directory, handle all .cmd files under it.
> > +        # Otherwise, handle .cmd files associated with the file.
> > +        # Most of built-in objects are linked via archives (built-in.a or lib.a)
> > +        # but some are linked to vmlinux directly.
> > +        # Modules are lis
>
> ^ was this comment cut off?

Oops, I will fix it.



-- 
Best Regards
Masahiro Yamada
