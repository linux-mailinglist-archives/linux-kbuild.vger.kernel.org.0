Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD4E3235D2
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 03:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhBXCi6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 21:38:58 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:46540 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbhBXCi4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 21:38:56 -0500
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 11O2buG4011353;
        Wed, 24 Feb 2021 11:37:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 11O2buG4011353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614134276;
        bh=pX9K/vCBClh8oGzPBvXQnUV2yh+cgPFd9eXRxBcBQqc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uDKfRRyrhkh/xOGOhZVTP++JqhCak80BQYw6j6b1afnDPBko+EOWCDAnSBn+wXAQB
         ORLp/2qPynO9sMzzrfnzHU+TPc03au2gYdLPVt0Eir6IlYL49App+a4I5ZgLd8SKkT
         k/8lgAJlu11niis9TeQ9fBJEy9mdFCC4fVMzKNp5FbBOZFALtobp6+ZqAq4X4uUgqN
         W6gLk52N1fJFL0u9+DT6Q0nmPgYbESF0FfYvWE8ulqjTfLzL+OeLUOFnf/+LIXbQBM
         SHK0y9cg4nxEV6msUyVTL/cDo43NzuD3GEWYv3Mecozv0HjWzFz7H33sMB+9e9qPZf
         bb/roqcuPNCmQ==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id o38so489798pgm.9;
        Tue, 23 Feb 2021 18:37:56 -0800 (PST)
X-Gm-Message-State: AOAM5320f4iS51QyZ9QJZM3AdWDLueF1OvDj4+CYSCt13so+qDNJjeXp
        iSNEcVCUmINg5uOsnYeigZ752wcMH6zE47ehUNM=
X-Google-Smtp-Source: ABdhPJwNSidoBD5D9Ei7aEJTeImQSK0VOfcgranFV5uHW4vWpFFasYyfU0+uYnqGGx2UblAPk0T3Lu0p5iS8osSc2ak=
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id
 h22-20020a62b4160000b02901e4fb5a55bbmr28579569pfn.80.1614134275563; Tue, 23
 Feb 2021 18:37:55 -0800 (PST)
MIME-Version: 1.0
References: <20210205220125.2931504-1-ndesaulniers@google.com>
 <CAK7LNARKHvjTcnic=ZKntH3NY5meehQbJuBr34y9_tn8b-Ym0w@mail.gmail.com> <CAKwvOd=qh0=tU9fr60DxcJepUfg6+BkqScwifW4s8A2A=ofKpw@mail.gmail.com>
In-Reply-To: <CAKwvOd=qh0=tU9fr60DxcJepUfg6+BkqScwifW4s8A2A=ofKpw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 24 Feb 2021 11:37:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_4=xaZ71nE5T8V2vEV_7zrEWMrv6n2aRog-sqxjiTLw@mail.gmail.com>
Message-ID: <CAK7LNAQ_4=xaZ71nE5T8V2vEV_7zrEWMrv6n2aRog-sqxjiTLw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: reuse CC_VERSION_TEXT
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 24, 2021 at 5:10 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Fri, Feb 5, 2021 at 5:49 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Sat, Feb 6, 2021 at 7:01 AM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > >
> > > I noticed we're invoking $(CC) via $(shell) more than once to check the
> > > version.  Let's reuse the first string captured in $CC_VERSION_TEXT.
> > >
> > > Fixes: 315bab4e972d ("kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE")
> >
> >
> > I did not touch this hunk because I have a plan
> > for different refactoring, but I have never got
> > around to do it.
> >
> > Anyway, you beat me, and I will pick this up.
> > But, the Fixes tag is questionable because
> > this is code refactoring.
>
> Hi Masahiro,
> A friendly reminder to please pick this up; I don't see it yet in
> linux-next. I'm ok with you dropping the fixes tag when applied.


Sorry, I had completely forgotten to do this.
Thanks for the reminder.

I inserted this before Nathan's "remove # characters" patch.




> (Otherwise, I was about to use `grep -m1` instead of `| head -n1 | grep` here.)
>
> >
> >
> >
> >
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  Makefile | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index a85535eb6a7d..70034d7c1051 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -557,7 +557,13 @@ ifdef building_out_of_srctree
> > >         { echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
> > >  endif
> > >
> > > -ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> > > +# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> > > +# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> > > +# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> > > +# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> > > +CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
> > > +
> > > +ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> > >  ifneq ($(CROSS_COMPILE),)
> > >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> > >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > > @@ -576,12 +582,6 @@ KBUILD_AFLAGS      += $(CLANG_FLAGS)
> > >  export CLANG_FLAGS
> > >  endif
> > >
> > > -# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> > > -# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> > > -# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> > > -# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> > > -CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
> > > -
> > >  ifdef config-build
> > >  # ===========================================================================
> > >  # *config targets only - make sure prerequisites are updated, and descend
> > > --
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOd%3Dqh0%3DtU9fr60DxcJepUfg6%2BBkqScwifW4s8A2A%3DofKpw%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
