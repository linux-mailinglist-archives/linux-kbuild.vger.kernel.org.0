Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9CF249420
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 06:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgHSEaZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 00:30:25 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:22871 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgHSEaV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 00:30:21 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 07J4TruC030125;
        Wed, 19 Aug 2020 13:29:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 07J4TruC030125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597811394;
        bh=tnH/SuU4NrEiRkFzg/a5riUNX3UasG3bSl0KD9O1hi4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DbydqHW4C2TP8uaNyn+m8CYcfEN/6R20qxViYIjalXVR54a0jJjBclhxpxKkh3GYF
         in1w8dD2b2EdkQ5z9LgrXO7h3yQy20DFpwyZoRH5j7aDCGzUQqScxHAqHWh+2xNOGS
         zlT/8pp58+H7aKwXJi1BYfIidtXq+lu8ttdpNBWyT1jPGyC0iHV6Fb0CYbBIK3zjWX
         20P7EGoIUNJLXcThPBtSPHOndR18R44vWMCaGYNXk6MPT4LLd5CPEvEN3uhuIm7npP
         gFkMLgHXSArsAfx/b6eeNvRvH6TGGSI8IPqxEbpzzOgX5XBHJLhvCRBD35VDwHAk0t
         hNx/dd04OeRRQ==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id q68so6512887uaq.0;
        Tue, 18 Aug 2020 21:29:53 -0700 (PDT)
X-Gm-Message-State: AOAM530ZEy2yp3Pk1jZsa71NpxxgFXj29zH0sdaIPVcJBaEEyVj9jsFx
        szvJ7B3xImjFhh/nXBGryZtRbLOmyHd26GEhUm8=
X-Google-Smtp-Source: ABdhPJwAHOdXFDwEsS4dO9yH21gskXjd6JK9Ug0TL9+bdIDhD7nwW+ntzHQTxPTqoUyM1jCd64glJtV29z6VDLb3AD4=
X-Received: by 2002:ab0:623:: with SMTP id f32mr13420750uaf.121.1597811392439;
 Tue, 18 Aug 2020 21:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200812173958.2307251-1-masahiroy@kernel.org>
 <20200812173958.2307251-3-masahiroy@kernel.org> <CAKwvOdkL=667+cw_Rxq_5zaOKeTTptsMaxkkSXBic9QxozOWVg@mail.gmail.com>
 <CAK7LNAS4EjGchNzqhEcTPTU0mOUqAk8nF9QYW3qwfOp572uCHA@mail.gmail.com>
In-Reply-To: <CAK7LNAS4EjGchNzqhEcTPTU0mOUqAk8nF9QYW3qwfOp572uCHA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 19 Aug 2020 13:29:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPAB+UBcYJTauPRksOb1zVbicUt7z39szaO3o70vD1RQ@mail.gmail.com>
Message-ID: <CAK7LNARPAB+UBcYJTauPRksOb1zVbicUt7z39szaO3o70vD1RQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gen_compile_commands: wire up build rule to Makefile
To:     Nick Desaulniers <ndesaulniers@google.com>
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

Hi Nick,

On Fri, Aug 14, 2020 at 2:10 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Aug 13, 2020 at 7:30 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > On Wed, Aug 12, 2020 at 10:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Currently, you need to explicitly run scripts/gen_compile_commands.py
> > > to create compile_commands.json. It traverses the object tree
> > > (you need to pass the -d option to deal with a separate output tree),
> > > and parses all the .*.cmd file found.
> > >
> > > If you rebuild the kernel over again without 'make clean', stale
> > > .*.cmd files from older builds will create invalid entries in
> > > compile_commands.json.
> >
> > Definitely a problem; happy to see compile_commands.json added to
> > `make clean` target, too.
> >
> > >
> > > This commit wires up the compile_commands.json rule to the top
> > > Makefile, and makes it parse .*.cmd files only from the current build
> > > to avoid stale entries.
> > >
> > > It is possible to extract only relevant .*.cmd files by checking
> > > $(KBUILD_VMLINUX_OBJS), $(KBUILD_VMLINUX_LIBS), and modules.order.
> > > The objects or archives linked to vmlinux are listed in
> > > $(KBUILD_VMLINUX_OBJS) or $(KBUILD_VMLINUX_LIBS). All the modules are
> > > listed in modules.order.
> > >
> > > You can create compile_commands.json from Make:
> > >
> > >   $ make -j$(nproc) CC=clang compile_commands.json
> > >
> > > Of course, you can build vmlinux, modules, and compile_commands.json
> > > all together in a single command:
> > >
> > >   $ make -j$(nproc) CC=clang all compile_commands.json
> > >
> > > It works also for M= builds. In this case, compile_commands.json
> > > is created in the top directory of the external module.
> > >
> > > I hope this will be overall improvements, but it has a drawback;
> > > the coverage of the compile_commands.json is reduced because only
> > > the objects linked to vmlinux or modules are handled. For example,
> > > the following C files are not included in compile_commands.json:
> > >
> > >  - Decompressor source files (arch/*/boot/compressed/)
> > >  - VDSO source files
> > >  - C files used to generate intermediates (e.g. kernel/bounds.c)
> > >  - standalone host programs
> >
> > Oof, for an x86_64 defconfig, the difference in line count of
> > compile_commands.json
> > before: 12826
>
>
> I think some lines of 'before'
> are not so important.
>
> Files suffixed with *.mod.c
> are generated sources for modules.
> There is no point to check them by Clang tools.
>
>
> Some entries appear twice:
>
> For example, 'before' contains two entries of
> "file": "lib/cmdline.c"
> Which entry is used by 'clang-tidy lib/cmdline.c',
> the first one, the second one, or both?
>
>
>
> Having said that, there is still a loss of more than 3%, yes.
>
>
> > after: 12351
> >
> > That's a loss of 475 (3.7% of 12826) coverage. Is there something more
> > we can do to preserve this functionality, while avoiding stale .cmd
> > files?
>
>
> I have no idea how to do this correctly.
>
> > Is it that those aren't specified by `$(KBUILD_VMLINUX_OBJS)
> > $(KBUILD_VMLINUX_LIBS)` ?
>
> These variables contain only objects and archives
> linked to vmlinux.
>
>
>
>
> For example, VDSO is built as a prerequisite of
> another object that wraps it.
>
> See line 61 of arch/arm64/kernel/vdso/Makefile:
> $(obj)/vdso.o : $(obj)/vdso.so
>
>
> I do not know how to get the full list of active objects,
> some of which are built on demand
> in the dependency chain.
>
>
> Idea 1)
> Merge this series, and accept the loss.
>
>
> Idea 2)
> Add Makefile targets,
> and also keep the previous work-flow.
>
> When you run it from Make,
> only objects for vmlinux and modules are handled.
>
> When you need the full coverage, including non-kernel-space
> sources, run scripts manually:
>
> $ scripts/clang-tools/gen_compile_commands.py
> $ scripts/clang-tools/run-clang-tools.py clang-tidy



Do you have any idea to cope with
the 3% loss problem?

If it is a problem, maybe I should try Idea 2).


Thanks.








>
> Idea 3)
> Give up supporting it from Makefile.
> Instead, improve gen_scripts_commands.py
> as a standalone program.
>
>
> Maybe we can check whether the compiler is Clang or not.
> We can run '<compiler> --version' and drop the
> entry if it is GCC.
>
> Usually, the compiler is the first word of
> the "command" field in compile_commands.json,
> but there are exceptions because
> people may do CC="ccache clang".
>
>
> If there are still stale entries causing troubles,
> you need to run 'make clean', and rebuild the tree.
>
>
> We were trying to have separate scripts,
> gen_compile_commands.py and run-clang-tools.py,
> and to add Makefile targets to run them in a row.
>
> I think unifying the two scripts
> might be handier.
>
>
> Add two options, -t, -a,
> to scripts/gen_compile_commands.py
>
> If they are given,
> scripts/gen_compilile_commands.py
> generates compile_commands.json,
> and immediately runs clang-tidy against it.
>
>
> -t, --tidy
>    Run 'clang-tidy -checks=-*,linuxkernel-*' after generating
> compilation database
> -a, --analyzer
>    Run 'clang-tidy -checks=-*,clang-analyzer-*' after generating
> compilation database
>
>
> Both -a and -t are given,
> it runs
> 'clang-tidy -checks=-*,linuxkernel-*,clang-analyzer-*'
>
> This works more efficiently
> if you want to check everything.
>
>
> 'make clang-tidy clang-analyzer'
> will invoke clang-tidy twice for each file,
> which is not very efficient.
>
>
>
>
> > >  clean-dirs := $(KBUILD_EXTMOD)
> > > -clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps
> > > +clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps \
> > > +       $(KBUILD_EXTMOD)/compile_commands.json
> >
> > So the `clean` target doesn't make use of `CLEAN_FILES`? It looks like
> > there's some duplication there?  Oh, this is dependent on
> > !KBUILD_EXTMOD, and is a new `clean` target. Do I understand that
> > correctly?
>
> Correct.
>
> We can move CLEAN_FILES to a common part
> so external module builds can use it.
>
> > >      """
> > >      usage = 'Creates a compile_commands.json database from kernel .cmd files'
> > >      parser = argparse.ArgumentParser(description=usage)
> > >
> > > -    directory_help = ('Path to the kernel source directory to search '
> > > -                      '(defaults to the working directory)')
> > > -    parser.add_argument('-d', '--directory', type=str, help=directory_help)
> > > +    ar_help = 'command used for parsing .a archives'
> > > +    parser.add_argument('-a', '--ar', type=str, default='ar', help=ar_help)
> >
> > Might be nice to warn if run with no arguments? In case someone does:
> > $ ./scripts/clang-tools/gen_compile_commands.py
>
> Right.
>
> nargs='+' seems to work.
>
>
>
> > > +    # Collect objects compiled for vmlinux or modules
> > > +    objects = []
> > > +    for file in files:
> > > +        if file.endswith('.o'):
> > > +            # Some objects (head-y) are linked to vmlinux directly
> > > +            objects.append(file)
> > > +        elif file.endswith('.a'):
> > > +            # Most of built-in objects are linked via built-in.a or lib.a.
> > > +            # Use 'ar -t' to get the list of the contained objects.
> > > +            objects += subprocess.check_output([ar, '-t', file]).decode().split()
> > > +        elif file.endswith('modules.order'):
> > > +           # modules.order lists all the modules.
> > > +            with open(file) as f:
> >
> > `file` is another builtin (or at least was in Python2), perhaps `filename`?
> >
> > > +                for line in f:
> > > +                    ko = line.rstrip()
> > > +                    base, ext = os.path.splitext(ko)
> > > +                    if ext != '.ko':
> > > +                        sys.exit('{}: mobule path must end with .ko'.format(ko))
> > > +                    mod = base + '.mod'
> > > +                   # The first line of *.mod lists the objects that
> > > +                   # compose the module.
> >
> > This comment and the one above it uses tabs for indentation vs spaces
> > for the rest of the file.  I use
> > https://github.com/nickdesaulniers/dotfiles/blob/a90865a9ea48bbefa0082f7508607fdeb361e801/.vimrc#L37-L43
> > to help me catch these.
>
> Awesome. Copied to mine.
>
>
>
> > > +                    with open(mod) as mod_f:
> > > +                        objects += mod_f.readline().split()
> > > +        else:
> > > +            sys.exit('{}: unknown file type'.format(file))
> >
> > Consider breaking up this one long function into multiple, perhaps the
> > above could just return `objects`?
>
>
>
> I thought that returning a big list causes needless memory-copy.
> If we do not need to be worried too much,
> I can make it a helper function.
>
>
> >
> > >
> > >      compile_commands = []
> > > -    for dirpath, _, filenames in os.walk(directory):
> > > -        for filename in filenames:
> > > -            if not filename_matcher.match(filename):
> > > -                continue
> > > -            filepath = os.path.join(dirpath, filename)
> > > -
> > > -            with open(filepath, 'rt') as f:
> > > -                line = f.readline()
> > > -                result = line_matcher.match(line)
> > > -                if result:
> > > -                    try:
> > > -                        entry = process_line(directory, dirpath,
> > > -                                             result.group(1), result.group(2))
> > > -                        compile_commands.append(entry)
> > > -                    except ValueError as err:
> > > -                        logging.info('Could not add line from %s: %s',
> > > -                                     filepath, err)
> > > +    cwd = os.getcwd()
> > > +    for object in objects:
> > > +        dir, notdir = os.path.split(object)
> >
> > `object` is a builtin Class in python.  I'm not sure if it's quite
> > considered a keyword, but maybe a different identifier would be nicer,
> > like `object_file` or something?
>
>
> Not a keyword, but 'object' is a class, yes.
> Not sure about 'file'.
>
>
> $ python
> Python 3.8.2 (default, Jul 16 2020, 14:00:26)
> [GCC 9.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import keyword
> >>> keyword.iskeyword("import")
> True
> >>> keyword.iskeyword("if")
> True
> >>> keyword.iskeyword("file")
> False
> >>> keyword.iskeyword("object")
> False
> >>> object
> <class 'object'>
> >>> file
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
> NameError: name 'file' is not defined
> >>>
>
>
> If this is a problem, I can rename it.
>
>
>
>
> > > +        cmd_file = os.path.join(dir, '.' + notdir + '.cmd')
> > > +        with open(cmd_file, 'rt') as f:
> > > +            line = f.readline()
> > > +            result = line_matcher.match(line)
> >
> > ^ combine statements.
>
> OK.
>
>
> > > +            if result:
> > > +                entry = process_line(cwd, result.group(1), result.group(2))
> > > +                compile_commands.append(entry)
> > >
> > >      with open(output, 'wt') as f:
> > >          json.dump(compile_commands, f, indent=2, sort_keys=True)
> > >
> > > -    count = len(compile_commands)
> > > -    if count < _LOW_COUNT_THRESHOLD:
> > > -        logging.warning(
> > > -            'Found %s entries. Have you compiled the kernel?', count)
> > > -
> > > -
> > >  if __name__ == '__main__':
> > >      main()
> > > --
> > > 2.25.1
> > >
> >
> > Thank you for your assistance and help enabling these tools.
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdkL%3D667%2Bcw_Rxq_5zaOKeTTptsMaxkkSXBic9QxozOWVg%40mail.gmail.com.
>
>
>
> --
> Best Regards
> Masahiro Yamada



--
Best Regards
Masahiro Yamada
