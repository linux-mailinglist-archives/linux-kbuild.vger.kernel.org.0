Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD46833D7BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 16:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhCPPhe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 11:37:34 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:65366 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234498AbhCPPhL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 11:37:11 -0400
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 12GFamML011503;
        Wed, 17 Mar 2021 00:36:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 12GFamML011503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615909009;
        bh=jHrK45JAsa4ty6YFTk/lmdroBH+RYTF+p5pe53mqFZk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=U9WvGSGrCvxKB3Qs6xgLsmYJ8gZXFA0vqADoncsfo7jQpjfmuPuT2IAwktIv+B9/1
         GbYGJnXP90RkLgxb9AB4Era/kfL1K8fErpKAZyP+kT4xiyhGXpFCyBOv5kMLCC/MMY
         09K1ndjqGZf63rS5SYHgOj1jrTwu7cmqyD72X6nxX2vvYRvQ+gRBTpA+A5gk7Ew+kS
         dldBwO6SqH8wO4rGG7/0cBLo8hlF7i14JfPaL2dc2uchRGZtt6KoJBb8sfxj87HXjH
         pygHzg2PMGdkZuR84P896ClZZFW9JIW0ut0URv+1CVU66PivraOcH3sIgHDeBWecIm
         ylXxWeKCf+fjA==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id o10so22851034pgg.4;
        Tue, 16 Mar 2021 08:36:49 -0700 (PDT)
X-Gm-Message-State: AOAM5309yWmvAkK6gNS9h5wPy3gBNgGHmgRlq55B6qL88CbJdwtHcklw
        F4q9BjAT3Is8vAJEPMmboInkfrGTGjIxdubBcwY=
X-Google-Smtp-Source: ABdhPJxWWs8IFo6gDWHe6dYM9zFmcJT7GrNpOatf85eFb/MrDPl+LWyKpsZ7Gn0QLoX9CRtchrlygc43PEq0lLSBla0=
X-Received: by 2002:a63:dd49:: with SMTP id g9mr225426pgj.175.1615909008535;
 Tue, 16 Mar 2021 08:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org> <20210309205915.2340265-1-nathan@kernel.org>
 <CAK7LNAQ6goFdV=HuCdiCsr-PSUGxtafHZAa=p=96ieFyFHL8yg@mail.gmail.com> <CA+icZUVRyEGnLnRBiZjmZqmvCLkR8AZR8tihho83Lrr_F9A2BA@mail.gmail.com>
In-Reply-To: <CA+icZUVRyEGnLnRBiZjmZqmvCLkR8AZR8tihho83Lrr_F9A2BA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 17 Mar 2021 00:36:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNATADzwnJt8vBQADGJjGe8jscRTAwvrLNc8AFgZ9SoWDUQ@mail.gmail.com>
Message-ID: <CAK7LNATADzwnJt8vBQADGJjGe8jscRTAwvrLNc8AFgZ9SoWDUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 16, 2021 at 1:42 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, Mar 15, 2021 at 5:22 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, Mar 10, 2021 at 5:59 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > This flag was originally added to allow clang to find the GNU cross
> > > tools in commit 785f11aa595b ("kbuild: Add better clang cross build
> > > support"). This flag was not enough to find the tools at times so
> > > '--prefix' was added to the list in commit ef8c4ed9db80 ("kbuild: allow
> > > to use GCC toolchain not in Clang search path") and improved upon in
> > > commit ca9b31f6bb9c ("Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang
> > > cross compilation"). Now that '--prefix' specifies a full path and
> > > prefix, '--gcc-toolchain' serves no purpose because the kernel builds
> > > with '-nostdinc' and '-nostdlib'.
> > >
> > > This has been verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as
> > > well as a distribution version of LLVM 11.1.0 without binutils in the
> > > LLVM toolchain locations.
> > >
> > > Link: https://reviews.llvm.org/D97902
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > >
> > > v1 -> v2:
> > >
> > > * Improve commit message (add history behind flag and link to Fangrui's
> > >   documentation improvement).
> >
> >
> > Both applied to linux-kbuild. Thanks.
> >
>
> Sorry for being pedantic: This misses my Tested-by#s (see [1]).
>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v13-git
>
> AFAICS v2 changes some comments in the commit only but not code?


For 1/2, yes. The difference is only comments.


For 2/2, the code was changed.
Actually, v1 was wrong.
That is why the tags were dropped.


I will re-add the tags to 1/2
since there is no code diff.


If you re-test 2/2, I will add your tag again.







> - Sedat -
>
> [1] https://marc.info/?l=linux-kernel&m=161480031518629&w=2
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=d4aa405bc9cd506532f075456645716cdd1739c1
>
> >
> >
> >
> >
> > > I did not carry tags forward so that people could re-review and test.
> > >
> > >  Makefile | 4 ----
> > >  1 file changed, 4 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 31dcdb3d61fa..182e93d91198 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
> > >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> > >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > >  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> > > -GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> > > -endif
> > > -ifneq ($(GCC_TOOLCHAIN),)
> > > -CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> > >  endif
> > >  ifneq ($(LLVM_IAS),1)
> > >  CLANG_FLAGS    += -no-integrated-as
> > >
> > > base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
> > > --
> > > 2.31.0.rc1
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
