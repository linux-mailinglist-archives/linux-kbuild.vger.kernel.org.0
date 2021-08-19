Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3123F0F0E
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbhHSAMh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:12:37 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36870 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234119AbhHSAMh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:12:37 -0400
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17J0BlF3024466;
        Thu, 19 Aug 2021 09:11:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17J0BlF3024466
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629331908;
        bh=8M03MRw2TuofOPMeylniQhhiTzksWPSL5VyD0yUEHAo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ARuw9aHUWhWX/2y2Znz/w34ONhOj82FQJV+L4vkS2eKmf5KEUdM2RIM76wy50QENQ
         Q4mJ1osmBT2QWuCIGkdqRGaNAfVwbmj49USHbT6D6VBA3E+NxMkEyV/a/N3XwUNrCH
         +b2P14BpHXfoFPqBmQ/3HrNaNYjsj0x8RcgoUHgAMdhhhilXGsSLhu+jdmBlC+yteJ
         RnKxVSZ4/7eqoUODzrnecSRD/ciPCBJGvdazDaoycruZfC6s+04+j77ayBQOxxTxuo
         AWd+cPYSmtYiavucOcapgphM9uuXH/LkaNXq3fdAW3MhMWelEGeIEm+54b5GGxaoEh
         I+nfVd+CCX1YA==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id d17so2855326plr.12;
        Wed, 18 Aug 2021 17:11:48 -0700 (PDT)
X-Gm-Message-State: AOAM533PzHvsRY4SdTSfVY/9eEsYsDqKwUOkV7dRyCASUIE70BwzQUhS
        80DX/lM4S6df8WNvAwZv8FOiSzZmmKC1bjbpHTQ=
X-Google-Smtp-Source: ABdhPJwmPhf3PVSXjM93fDzxPZ52+VAiJzhe7cktP1Gt22Y83mK0jG8ZCiE0ObANRCxLIRkcKLkvLikRnRv23Wd3BKA=
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr11896409pjt.198.1629331907468;
 Wed, 18 Aug 2021 17:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210816180519.1021311-1-samitolvanen@google.com>
 <CAK7LNASAHN=-uj73Uwk10aXbsR8AkUM_P=3NX_dq2SiFTqUctg@mail.gmail.com> <CABCJKudQhagwdb-UfGE2JQN8H29NSpMd5PgVoftJYRp5ZwpRrA@mail.gmail.com>
In-Reply-To: <CABCJKudQhagwdb-UfGE2JQN8H29NSpMd5PgVoftJYRp5ZwpRrA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Aug 2021 09:11:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFdB9=bV+X6nYzkrpvO-2FtOu5oxg6Ch3r=AROa1atVA@mail.gmail.com>
Message-ID: <CAK7LNARFdB9=bV+X6nYzkrpvO-2FtOu5oxg6Ch3r=AROa1atVA@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Alexander Lobakin <alobakin@pm.me>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 12:06 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Tue, Aug 17, 2021 at 7:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Aug 17, 2021 at 3:05 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
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
> > > Reviewed-by: Alexander Lobakin <alobakin@pm.me>
> > > Tested-by: Alexander Lobakin <alobakin@pm.me>
> > > ---
> > > Changes in v4:
> > > - Added .lto.o to targets to actually fix the use of if_changed.
> > > - Replaced an unnecessary mod-prelink-ext with .lto.
> > >
> > > Changes in v3:
> > > - Added missing FORCE.
> > >
> > > Changes in v2:
> > > - Fixed a couple of typos.
> > > - Fixed objtool arguments for .lto.o to always include --module.
> > >
> > > ---
> > >  scripts/Makefile.build    | 28 +++++++++++++++++++++++++++-
> > >  scripts/Makefile.lib      |  7 +++++++
> > >  scripts/Makefile.modfinal | 21 ++-------------------
> > >  scripts/Makefile.modpost  | 22 +++-------------------
> > >  scripts/gen_autoksyms.sh  | 12 ------------
> > >  5 files changed, 39 insertions(+), 51 deletions(-)
> > >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 02197cb8e3a7..a6f43afd09bb 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -88,6 +88,10 @@ endif
> > >
> > >  targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > >
> > > +ifdef CONFIG_LTO_CLANG
> > > +targets-for-modules += $(patsubst %.o, %.lto.o, $(filter %.o, $(obj-m)))
> > > +endif
> > > +
> > >  ifdef need-modorder
> > >  targets-for-modules += $(obj)/modules.order
> > >  endif
> > > @@ -271,12 +275,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
> > >         $(call if_changed_rule,cc_o_c)
> > >         $(call cmd,force_checksrc)
> > >
> > > +ifdef CONFIG_LTO_CLANG
> > > +# Module .o files may contain LLVM bitcode, compile them into native code
> > > +# before ELF processing
> > > +quiet_cmd_cc_lto_link_modules = LTO [M] $@
> > > +cmd_cc_lto_link_modules =                                              \
> > > +       $(LD) $(ld_flags) -r -o $@                                      \
> > > +               $(shell [ -s $(@:.lto.o=.o.symversions) ] &&            \
> > > +                       echo -T $(@:.lto.o=.o.symversions))             \
> > > +               --whole-archive $(filter-out FORCE,$^)
> > > +
> > > +ifdef CONFIG_STACK_VALIDATION
> > > +# objtool was skipped for LLVM bitcode, run it now that we have compiled
> > > +# modules into native code
> > > +cmd_cc_lto_link_modules += ;                                           \
> > > +       $(objtree)/tools/objtool/objtool $(objtool_args) --module       \
> > > +               $(@:.ko=.lto.o)
> >
> >
> > What is this "$(@:.ko=.lto.o)" doing ?
> >
> > The target is already suffixed with .lto.o
> > so $(@:.ko=.lto.o) should be the same as $@
>
> Good catch, probably a leftover from an earlier iteration.
>
> > Shall I fix it locally unless
> > I find more questionable code?
>
> Please do.
>
> Sami


Applied with $(@:.ko=.lto.o)  ->  $@

Thanks.


-- 
Best Regards
Masahiro Yamada
