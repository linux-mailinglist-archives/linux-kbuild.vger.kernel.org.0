Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05B6311A77
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 04:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhBFDsq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 22:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhBFDqk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 22:46:40 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D6EC06174A;
        Fri,  5 Feb 2021 19:45:59 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id f6so9347924ioz.5;
        Fri, 05 Feb 2021 19:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=AW3d2EZmFwj/kF7+VA9cGyGtPmF7ePTt8chozcmo2aM=;
        b=FSKKfuQNBPTymnP4iaQy28xuLZ6etaLvVhCH1dNlf8zOJ3fZ1yO9/LBicwnua+goJD
         w5NTJrbEgZGXfMl0Sz5F9GPVE9QpAQcm86HuQNn5gfiDYUNSLLSU7G3+N8uSnyvRKsNh
         wkgxaKKIdmeC5vR0ukpybUcbcY4UjehW6rCh0OtQ2MVNE1l4iT0PR8LtU/nH6sOpHNuq
         i41XNiCsE0GPI0wNlXZcwfmQar6WPgVHcXXzJYCQMxspp71z+xfWHefcm9YzlTULldVq
         OscQc39aMOUsJlJUVQGmKUymR5PZLZJxXK9VOBK/qiIngrhUTXvzzUgexg7S7h8lEWA6
         jVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=AW3d2EZmFwj/kF7+VA9cGyGtPmF7ePTt8chozcmo2aM=;
        b=eyysIiYCER8xhen9yYF5wJtWbBlpEtaaOreRUOwlXBAug2zpPvUIrEm/O8Ub7wMOET
         QwXz2M1nixIpoSgcIcpIwHedP4C/CmEYnt/unYfq3j1e8SqKQLTdQRGnKDJ6vo1P0vvu
         xn7is/uq4YCt1eYXqa9kMjTymEAMArA2wtdcfNL9Zxi8z4/WGnI8Bj2IwjjHlo9U+u8N
         QamnMrg+CTLuCz0pWPiDvLfKbK8MDrbdRNmk0gggh4hhP+DrJcRymQPOXqNr1rvo9Z2P
         SJTbe43Ct2DWseLZ4JAGUlX+IvPXdMsoHkuEWMjY+hFwDf4Fw1oNWgu00VzR2B9fJbwr
         4yPQ==
X-Gm-Message-State: AOAM533KtfQAMHlk0xLBudksqgYaDX3pVaoluKe5ro2PxkhN9JxgyEF8
        c3gKbm708g6Wm9tiunxGkSIVhn0MLK5mg32z0NY=
X-Google-Smtp-Source: ABdhPJxLVCB73CNF9AtRl0MXyHsreCEI6oTI0DqaNpHELjeOGoqs4jp778XQVAfEJsF7+i/FoizEiwIQWjLbI5E8m6g=
X-Received: by 2002:a02:1649:: with SMTP id a70mr7800030jaa.97.1612583159323;
 Fri, 05 Feb 2021 19:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20210205220125.2931504-1-ndesaulniers@google.com> <CAK7LNARKHvjTcnic=ZKntH3NY5meehQbJuBr34y9_tn8b-Ym0w@mail.gmail.com>
In-Reply-To: <CAK7LNARKHvjTcnic=ZKntH3NY5meehQbJuBr34y9_tn8b-Ym0w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 6 Feb 2021 04:45:47 +0100
Message-ID: <CA+icZUVkFOZq=5K=dKsQAFJPTmEE2gr_hVmYM=Q+rn70bSOh2w@mail.gmail.com>
Subject: Re: [PATCH] Makefile: reuse CC_VERSION_TEXT
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 6, 2021 at 2:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Feb 6, 2021 at 7:01 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > I noticed we're invoking $(CC) via $(shell) more than once to check the
> > version.  Let's reuse the first string captured in $CC_VERSION_TEXT.
> >
> > Fixes: 315bab4e972d ("kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE")
>
>
> I did not touch this hunk because I have a plan
> for different refactoring, but I have never got
> around to do it.
>
> Anyway, you beat me, and I will pick this up.
> But, the Fixes tag is questionable because
> this is code refactoring.
>

When I see this... and hear refactoring... As a suggestion/improvement...

Can we have LD_VERSION_TEXT analogue to CC_VERSION_TEXT?
Both are shown when doing a `cat /proc/version` (and IIRC in file
include/generated/compile.h).

Thanks.

- Sedat -

>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  Makefile | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index a85535eb6a7d..70034d7c1051 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -557,7 +557,13 @@ ifdef building_out_of_srctree
> >         { echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
> >  endif
> >
> > -ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> > +# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> > +# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> > +# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> > +# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> > +CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
> > +
> > +ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> >  ifneq ($(CROSS_COMPILE),)
> >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > @@ -576,12 +582,6 @@ KBUILD_AFLAGS      += $(CLANG_FLAGS)
> >  export CLANG_FLAGS
> >  endif
> >
> > -# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> > -# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> > -# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> > -# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> > -CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
> > -
> >  ifdef config-build
> >  # ===========================================================================
> >  # *config targets only - make sure prerequisites are updated, and descend
> > --
> > 2.30.0.478.g8a0d178c01-goog
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210205220125.2931504-1-ndesaulniers%40google.com.
>
>
>
> --
> Best Regards
> Masahiro Yamada
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNARKHvjTcnic%3DZKntH3NY5meehQbJuBr34y9_tn8b-Ym0w%40mail.gmail.com.
