Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575132430C6
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Aug 2020 00:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgHLWav (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 18:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgHLWav (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 18:30:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5B8C061383
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2020 15:30:50 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id p1so1746008pls.4
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2020 15:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxEYg9DVUBSgHUs53+hvB6vMVJVug19fYQRmxPk9RXQ=;
        b=H10wSzNzHcrUXSBcgxiaWyUq/Fg1XfM//0vXvHe+8Tg3VmtgRCF8AqbJlUVkUb5ETX
         r4i/PAwI9d3YBJRMPKD7aqA/q0QYQVAmSBjGD1Dp0L0hIU3L3gT5BYBuG3dPgjS3UuQC
         ra65aD10UytUv1O5J7US2OpL4WL4c/tepbg63F9TFZkDyjbNVsgLP10IcEG+Ujlb7bk3
         Cwo/swWrDLbrKMvbc7XyngRwU0WzzUAqq8DxcrxjhSclQmAUkwgzPUzOO+y2nZtN8W0E
         xjog9y7CXmStmBciT6kXYupe57+Ibt2+fppZHZjoGXiKdydDeT5eWzthHbsPgRIp1VbY
         Q3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxEYg9DVUBSgHUs53+hvB6vMVJVug19fYQRmxPk9RXQ=;
        b=DjoBB5ai6vyPUQGE1O0utcu1npMDrobp0QAs0KhvUMtsYtoPL6FdmEJAEdaw2JLUl3
         GoIPv6zommwTOhZ3Qji5NWy2LCTrIjHq3gYSt40aAE2Y7kviDwx1FFk9kD6PY2/5OVdC
         57R3U3Yv7rzURzG03VFlOr9t/JjleUTtRkx4QIkrsUBODT7p0X4HhKQgryIsXW2YIo2k
         1Wd39176NogKcYM80eSZIXFac1IH/Ebfk6pSC8wRWw10f53mC33hjDskoaLtlPRGRog6
         lD12rELQRLfMrSzYu4cgvRUGopK6643U2DfJXQu+TetfoieC0ZaXif66KKSUkZx1V0l/
         wjgQ==
X-Gm-Message-State: AOAM5337MRY8zG3JbANK8rhTIU7JnlBoP8WqRiDqTP0TWRmFTKKuVRci
        LJK/s4eeFxPTW17nCmtb4qWiDm0WPfLIONlC58Xmzw==
X-Google-Smtp-Source: ABdhPJwb1Nzga2r/UKpK2qXXlqz11ogC09KD2OCiYELJZKlGmyddZgEXnlAlPRuXNBwKrV+Dk740tbSvfsyXvsslqXM=
X-Received: by 2002:a17:90a:3ad1:: with SMTP id b75mr2020479pjc.25.1597271449631;
 Wed, 12 Aug 2020 15:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200812173958.2307251-1-masahiroy@kernel.org> <20200812173958.2307251-3-masahiroy@kernel.org>
In-Reply-To: <20200812173958.2307251-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 12 Aug 2020 15:30:37 -0700
Message-ID: <CAKwvOdkL=667+cw_Rxq_5zaOKeTTptsMaxkkSXBic9QxozOWVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] gen_compile_commands: wire up build rule to Makefile
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 12, 2020 at 10:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, you need to explicitly run scripts/gen_compile_commands.py
> to create compile_commands.json. It traverses the object tree
> (you need to pass the -d option to deal with a separate output tree),
> and parses all the .*.cmd file found.
>
> If you rebuild the kernel over again without 'make clean', stale
> .*.cmd files from older builds will create invalid entries in
> compile_commands.json.

Definitely a problem; happy to see compile_commands.json added to
`make clean` target, too.

>
> This commit wires up the compile_commands.json rule to the top
> Makefile, and makes it parse .*.cmd files only from the current build
> to avoid stale entries.
>
> It is possible to extract only relevant .*.cmd files by checking
> $(KBUILD_VMLINUX_OBJS), $(KBUILD_VMLINUX_LIBS), and modules.order.
> The objects or archives linked to vmlinux are listed in
> $(KBUILD_VMLINUX_OBJS) or $(KBUILD_VMLINUX_LIBS). All the modules are
> listed in modules.order.
>
> You can create compile_commands.json from Make:
>
>   $ make -j$(nproc) CC=clang compile_commands.json
>
> Of course, you can build vmlinux, modules, and compile_commands.json
> all together in a single command:
>
>   $ make -j$(nproc) CC=clang all compile_commands.json
>
> It works also for M= builds. In this case, compile_commands.json
> is created in the top directory of the external module.
>
> I hope this will be overall improvements, but it has a drawback;
> the coverage of the compile_commands.json is reduced because only
> the objects linked to vmlinux or modules are handled. For example,
> the following C files are not included in compile_commands.json:
>
>  - Decompressor source files (arch/*/boot/compressed/)
>  - VDSO source files
>  - C files used to generate intermediates (e.g. kernel/bounds.c)
>  - standalone host programs

Oof, for an x86_64 defconfig, the difference in line count of
compile_commands.json
before: 12826
after: 12351

That's a loss of 475 (3.7% of 12826) coverage. Is there something more
we can do to preserve this functionality, while avoiding stale .cmd
files?

Is it that those aren't specified by `$(KBUILD_VMLINUX_OBJS)
$(KBUILD_VMLINUX_LIBS)` ?

>
> Here is a note for out-of-tree builds. 'make compile_commands.json'
> works with O= option, but please notice compile_commands.json is
> created in the object tree instead of the source tree.
>
> Some people may want to have compile_commands.json in the source tree
> because Clang Tools searches for it through all parent paths of the
> first input source file.
>
> However, you cannot do it for O= builds. Kbuild should never generate
> any build artifact in the source tree when O= is given because the
> source tree might be read-only. Any write attempt to the source tree
> is monitored and the violation may be reported. See the commit log of
> 8ef14c2c41d9.
>
> So, the only possible way it to create compile_commands.json in the
> object tree, then specify '-p <build-path>' when you use clang-check,
> clang-tidy, etc.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile                        |  29 ++++++-
>  scripts/gen_compile_commands.py | 146 +++++++++++++-------------------
>  2 files changed, 82 insertions(+), 93 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6844b848bfec..4d65affb6917 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -634,7 +634,7 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>
> -ifneq ($(filter all modules nsdeps,$(MAKECMDGOALS)),)
> +ifneq ($(filter all modules nsdeps %compile_commands.json,$(MAKECMDGOALS)),)
>    KBUILD_MODULES := 1
>  endif
>
> @@ -1459,7 +1459,8 @@ endif # CONFIG_MODULES
>
>  # Directories & files removed with 'make clean'
>  CLEAN_FILES += include/ksym vmlinux.symvers \
> -              modules.builtin modules.builtin.modinfo modules.nsdeps
> +              modules.builtin modules.builtin.modinfo modules.nsdeps \
> +              compile_commands.json
>
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \
> @@ -1693,9 +1694,12 @@ KBUILD_MODULES := 1
>
>  build-dirs := $(KBUILD_EXTMOD)
>  PHONY += modules
> -modules: descend
> +modules: $(MODORDER)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>
> +$(MODORDER): descend
> +       @:
> +
>  PHONY += modules_install
>  modules_install: _emodinst_ _emodinst_post
>
> @@ -1709,8 +1713,12 @@ PHONY += _emodinst_post
>  _emodinst_post: _emodinst_
>         $(call cmd,depmod)
>
> +compile_commands.json: $(extmod-prefix)compile_commands.json
> +PHONY += compile_commands.json
> +
>  clean-dirs := $(KBUILD_EXTMOD)
> -clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps
> +clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps \
> +       $(KBUILD_EXTMOD)/compile_commands.json

So the `clean` target doesn't make use of `CLEAN_FILES`? It looks like
there's some duplication there?  Oh, this is dependent on
!KBUILD_EXTMOD, and is a new `clean` target. Do I understand that
correctly?

>
>  PHONY += help
>  help:
> @@ -1823,6 +1831,19 @@ nsdeps: export KBUILD_NSDEPS=1
>  nsdeps: modules
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
>
> +# Clang Tooling
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_gen_compile_commands = GEN     $@
> +      cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
> +
> +$(extmod-prefix)compile_commands.json: scripts/gen_compile_commands.py \
> +       $(if $(KBUILD_EXTMOD),,$(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)) \
> +       $(if $(CONFIG_MODULES), $(MODORDER)) FORCE
> +       $(call if_changed,gen_compile_commands)
> +
> +targets += $(extmod-prefix)compile_commands.json
> +
>  # Scripts to check various things for consistency
>  # ---------------------------------------------------------------------------
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 19c7338740e7..d2ff0d982521 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -9,80 +9,49 @@
>
>  import argparse
>  import json
> -import logging
>  import os
>  import re
> -
> -_DEFAULT_OUTPUT = 'compile_commands.json'
> -_DEFAULT_LOG_LEVEL = 'WARNING'
> -
> -_FILENAME_PATTERN = r'^\..*\.cmd$'
> -_LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
> -_VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
> -
> -# A kernel build generally has over 2000 entries in its compile_commands.json
> -# database. If this code finds 300 or fewer, then warn the user that they might
> -# not have all the .cmd files, and they might need to compile the kernel.
> -_LOW_COUNT_THRESHOLD = 300
> +import subprocess
>
>
>  def parse_arguments():
>      """Sets up and parses command-line arguments.
>
>      Returns:
> -        log_level: A logging level to filter log output.
> -        directory: The directory to search for .cmd files.
> +        ar: Command used for parsing .a archives
>          output: Where to write the compile-commands JSON file.
> +        files: Files to parse
>      """
>      usage = 'Creates a compile_commands.json database from kernel .cmd files'
>      parser = argparse.ArgumentParser(description=usage)
>
> -    directory_help = ('Path to the kernel source directory to search '
> -                      '(defaults to the working directory)')
> -    parser.add_argument('-d', '--directory', type=str, help=directory_help)
> +    ar_help = 'command used for parsing .a archives'
> +    parser.add_argument('-a', '--ar', type=str, default='ar', help=ar_help)

Might be nice to warn if run with no arguments? In case someone does:
$ ./scripts/clang-tools/gen_compile_commands.py

>
> -    output_help = ('The location to write compile_commands.json (defaults to '
> -                   'compile_commands.json in the search directory)')
> -    parser.add_argument('-o', '--output', type=str, help=output_help)
> +    output_help = 'output file for the compilation database'
> +    parser.add_argument('-o', '--output', type=str,
> +                        default='compile_commands.json', help=output_help)
>
> -    log_level_help = ('The level of log messages to produce (one of ' +
> -                      ', '.join(_VALID_LOG_LEVELS) + '; defaults to ' +
> -                      _DEFAULT_LOG_LEVEL + ')')
> -    parser.add_argument(
> -        '--log_level', type=str, default=_DEFAULT_LOG_LEVEL,
> -        help=log_level_help)
> +    files_help='files to parse (should be *.o, *.a, or modules.order)'
> +    parser.add_argument('files', type=str, nargs='*', help=files_help)
>
>      args = parser.parse_args()
>
> -    log_level = args.log_level
> -    if log_level not in _VALID_LOG_LEVELS:
> -        raise ValueError('%s is not a valid log level' % log_level)
> -
> -    directory = args.directory or os.getcwd()
> -    output = args.output or os.path.join(directory, _DEFAULT_OUTPUT)
> -    directory = os.path.abspath(directory)
> -
> -    return log_level, directory, output
> +    return args.ar, args.output, args.files
>
>
> -def process_line(root_directory, file_directory, command_prefix, relative_path):
> +def process_line(root_directory, command_prefix, file_path):
>      """Extracts information from a .cmd line and creates an entry from it.
>
>      Args:
>          root_directory: The directory that was searched for .cmd files. Usually
>              used directly in the "directory" entry in compile_commands.json.
> -        file_directory: The path to the directory the .cmd file was found in.
>          command_prefix: The extracted command line, up to the last element.
> -        relative_path: The .c file from the end of the extracted command.
> -            Usually relative to root_directory, but sometimes relative to
> -            file_directory and sometimes neither.
> +        file_path: The .c file from the end of the extracted command.
> +            It can be either relative or absolute.
>
>      Returns:
>          An entry to append to compile_commands.
> -
> -    Raises:
> -        ValueError: Could not find the extracted file based on relative_path and
> -            root_directory or file_directory.
>      """
>      # The .cmd files are intended to be included directly by Make, so they
>      # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
> @@ -90,60 +59,59 @@ def process_line(root_directory, file_directory, command_prefix, relative_path):
>      # by Make, so this code replaces the escaped version with '#'.
>      prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
>
> -    cur_dir = root_directory
> -    expected_path = os.path.join(cur_dir, relative_path)
> -    if not os.path.exists(expected_path):
> -        # Try using file_directory instead. Some of the tools have a different
> -        # style of .cmd file than the kernel.
> -        cur_dir = file_directory
> -        expected_path = os.path.join(cur_dir, relative_path)
> -        if not os.path.exists(expected_path):
> -            raise ValueError('File %s not in %s or %s' %
> -                             (relative_path, root_directory, file_directory))
>      return {
> -        'directory': cur_dir,
> -        'file': relative_path,
> -        'command': prefix + relative_path,
> +        'directory': root_directory,
> +        'file': file_path,
> +        'command': prefix + file_path,
>      }
>
>
>  def main():
> -    """Walks through the directory and finds and parses .cmd files."""
> -    log_level, directory, output = parse_arguments()
> -
> -    level = getattr(logging, log_level)
> -    logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
> -
> -    filename_matcher = re.compile(_FILENAME_PATTERN)
> -    line_matcher = re.compile(_LINE_PATTERN)
> +    """Find and parse .cmd files for vmlinux and modules"""
> +    ar, output, files = parse_arguments()
> +
> +    line_matcher = re.compile(r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$')
> +
> +    # Collect objects compiled for vmlinux or modules
> +    objects = []
> +    for file in files:
> +        if file.endswith('.o'):
> +            # Some objects (head-y) are linked to vmlinux directly
> +            objects.append(file)
> +        elif file.endswith('.a'):
> +            # Most of built-in objects are linked via built-in.a or lib.a.
> +            # Use 'ar -t' to get the list of the contained objects.
> +            objects += subprocess.check_output([ar, '-t', file]).decode().split()
> +        elif file.endswith('modules.order'):
> +           # modules.order lists all the modules.
> +            with open(file) as f:

`file` is another builtin (or at least was in Python2), perhaps `filename`?

> +                for line in f:
> +                    ko = line.rstrip()
> +                    base, ext = os.path.splitext(ko)
> +                    if ext != '.ko':
> +                        sys.exit('{}: mobule path must end with .ko'.format(ko))
> +                    mod = base + '.mod'
> +                   # The first line of *.mod lists the objects that
> +                   # compose the module.

This comment and the one above it uses tabs for indentation vs spaces
for the rest of the file.  I use
https://github.com/nickdesaulniers/dotfiles/blob/a90865a9ea48bbefa0082f7508607fdeb361e801/.vimrc#L37-L43
to help me catch these.

> +                    with open(mod) as mod_f:
> +                        objects += mod_f.readline().split()
> +        else:
> +            sys.exit('{}: unknown file type'.format(file))

Consider breaking up this one long function into multiple, perhaps the
above could just return `objects`?

>
>      compile_commands = []
> -    for dirpath, _, filenames in os.walk(directory):
> -        for filename in filenames:
> -            if not filename_matcher.match(filename):
> -                continue
> -            filepath = os.path.join(dirpath, filename)
> -
> -            with open(filepath, 'rt') as f:
> -                line = f.readline()
> -                result = line_matcher.match(line)
> -                if result:
> -                    try:
> -                        entry = process_line(directory, dirpath,
> -                                             result.group(1), result.group(2))
> -                        compile_commands.append(entry)
> -                    except ValueError as err:
> -                        logging.info('Could not add line from %s: %s',
> -                                     filepath, err)
> +    cwd = os.getcwd()
> +    for object in objects:
> +        dir, notdir = os.path.split(object)

`object` is a builtin Class in python.  I'm not sure if it's quite
considered a keyword, but maybe a different identifier would be nicer,
like `object_file` or something?

> +        cmd_file = os.path.join(dir, '.' + notdir + '.cmd')
> +        with open(cmd_file, 'rt') as f:
> +            line = f.readline()
> +            result = line_matcher.match(line)

^ combine statements.

> +            if result:
> +                entry = process_line(cwd, result.group(1), result.group(2))
> +                compile_commands.append(entry)
>
>      with open(output, 'wt') as f:
>          json.dump(compile_commands, f, indent=2, sort_keys=True)
>
> -    count = len(compile_commands)
> -    if count < _LOW_COUNT_THRESHOLD:
> -        logging.warning(
> -            'Found %s entries. Have you compiled the kernel?', count)
> -
> -
>  if __name__ == '__main__':
>      main()
> --
> 2.25.1
>

Thank you for your assistance and help enabling these tools.

-- 
Thanks,
~Nick Desaulniers
