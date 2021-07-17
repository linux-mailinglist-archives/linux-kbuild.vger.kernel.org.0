Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0A93CBFEF
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jul 2021 02:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhGQAEq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jul 2021 20:04:46 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:46957 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhGQAEq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jul 2021 20:04:46 -0400
Date:   Sat, 17 Jul 2021 00:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1626480109; bh=r2E7sDKBOZy+lOoF6oEpTdm7rXJRh85I7jVCdPqIxzQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=UEAK77EQBjM4SnpgIoN3010K1t+oFXp/rV9Owy0N+IT9lsTAGfRyi/VumpNDTTDc+
         3+9AW1DEPZuGUhRxkaf4xdri7+uPI/B3ccQ8U8PU7T7rOF3ptgNr7DDveFXRZEobHU
         2bS7y6UQS8LJt/aHmfjDHIAYP0AgXEZ4eoSwCtptqS1VCW3OFkTXESdl7Xt+dzyWe4
         FjLUZo6u1zUoTYSYCpQhk6k9rIa08SM3OPEH5I7eymptUyHeioj0JQsY5dpR1NicrK
         a1gELG0LNQ8I7xTfzfu+gh0WRCNfAHPn9XMEXH5QR47krdJzWtO9p2m8SA9MLm52d6
         989M2EfM6VWZg==
To:     Sami Tolvanen <samitolvanen@google.com>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
Message-ID: <20210716235415.161850-1-alobakin@pm.me>
In-Reply-To: <CABCJKucqW6a8h55tUQ072QMZxzB5O4djjF+TN1-Btb=TY8KE=Q@mail.gmail.com>
References: <20210716204545.3536354-1-samitolvanen@google.com> <20210716225245.67939-1-alobakin@pm.me> <CABCJKucqW6a8h55tUQ072QMZxzB5O4djjF+TN1-Btb=TY8KE=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 16 Jul 2021 16:18:42 -0700

> Hi Al,
>
> On Fri, Jul 16, 2021 at 4:00 PM Alexander Lobakin <alobakin@pm.me> wrote:
> >
> > From:   Sami Tolvanen <samitolvanen@google.com>
> > Date:   Fri, 16 Jul 2021 13:45:45 -0700
> >
> > > With CONFIG_LTO_CLANG, we currently link modules into native
> > > code just before modpost, which means with TRIM_UNUSED_KSYMS
> > > enabled, we still look at the LLVM bitcode in the .o files when
> > > generating the list of used symbols. As the bitcode doesn't
> > > yet have calls to compiler intrinsics and llvm-nm doesn't see
> > > function references that only exist in function-level inline
> > > assembly, we currently need a whitelist for TRIM_UNUSED_KSYMS to
> > > work with LTO.
> > >
> > > This change moves module LTO linking to happen earlier, and
> > > thus avoids the issue with LLVM bitcode and TRIM_UNUSED_KSYMS
> > > entirely, allowing us to also drop the whitelist from
> > > gen_autoksyms.sh.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1369
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > ---
> > >  scripts/Makefile.build    | 25 ++++++++++++++++++++++++-
> > >  scripts/Makefile.lib      |  7 +++++++
> > >  scripts/Makefile.modfinal | 21 ++-------------------
> > >  scripts/Makefile.modpost  | 22 +++-------------------
> > >  scripts/gen_autoksyms.sh  | 12 ------------
> > >  5 files changed, 36 insertions(+), 51 deletions(-)
> > >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 10b2f2380d6f..80e0fa810870 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -202,6 +202,7 @@ sub_cmd_record_mcount =3D                        =
           \
> > >       if [ $(@) !=3D "scripts/mod/empty.o" ]; then      \
> > >               $(objtree)/scripts/recordmcount $(RECORDMCOUNT_FLAGS) "=
$(@)";   \
> > >       fi;
> > > +/
> >
> > Seems like a leftover or a random typo here.
>
> Oops, indeed.
>
> > >  recordmcount_source :=3D $(srctree)/scripts/recordmcount.c \
> > >                   $(srctree)/scripts/recordmcount.h
> > >  else
> > > @@ -271,12 +272,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $=
$(objtool_dep) FORCE
> > >       $(call if_changed_rule,cc_o_c)
> > >       $(call cmd,force_checksrc)
> > >
> > > +ifdef CONFIG_LTO_CLANG
> > > +# Module .o files may contain LLVM bitcode, compile them into native=
 code
> > > +# before ELF processing
> > > +quiet_cmd_cc_lto_link_modules =3D LTO [M] $@
> > > +cmd_cc_lto_link_modules =3D                                         =
   \
> > > +     $(LD) $(ld_flags) -r -o $@                                     =
 \
> > > +             $(shell [ -s $(@:.lto.o=3D.o.symversions) ] &&         =
   \
> > > +                     echo -T $(@:.lto.o=3D.o.symversions))          =
   \
> > > +             --whole-archive $^
> > > +
> > > +ifdef CONFIG_STACK_VALIDATION
> > > +# objtool was skipped for LLVM bitcode, run it now that we have comp=
iled
> > > +# modules into native code
> > > +cmd_cc_lto_link_modules +=3D ;                                      =
   \
> > > +     $(objtree)/tools/objtool/objtool $(objtool_args)               =
 \
> >
> > Now $(part-of-module) inside $(objtool_args) doesn't get expanded
> > properly, because previously it was being called on x.ko, and now
> > it's being called on x.lto.o. $(basename $@) returns "x.lto" instead
> > of "x", and Make doesn't find "x.lto.o" in $(real-objs-m).

To be more precise:

Previously, objtool was being called from Makefile.modfinal, where
part-of-module is hardcoded to 'y'. Now it's being called from
Makefile.build, and part-of-module is being calculated the same
way as for non-LTO build (when objtool is being called on each
object file rather than final composite object).
So, part-of-module and objtool invocation is now correct for modules
with single source file, but wrong for multi-object modules.

The simplest fix is to append '--module' to objtool args
unconditionally when we're trying to process .lto.o file.

> > An example of objtool args dump:
> >
> >   LTO [M] fs/btrfs/btrfs.lto.o
> > Call: ./tools/objtool/objtool orc generate --no-fp --no-unreachable --r=
etpoline --uaccess fs/btrfs/btrfs.lto.o
> > fs/btrfs/btrfs.lto.o: warning: objtool: static_call: can't find static_=
call_key symbol: __SCK__might_resched
>
> Curiously I didn't see objtool warnings when building allmodconfig,
> but you're obviously correct here. I'll fix this in v2.
>
> > As can be seen, objtools command line no longer contains "--module".
> > And this warning about "can't find static_call_key" can appear only
> > in case of !module -> no -m|--module param was given.
> >
> > As a result, modules get broken and the kernel panics after loading
> > initramfs.
>
> Thanks for taking a look!
>
> Sami

Thanks for working on ClangLTO/CFI!
Al

