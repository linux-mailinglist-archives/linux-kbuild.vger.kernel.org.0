Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD6233C260
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbhCOQmm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhCOQmZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:42:25 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4922FC06174A;
        Mon, 15 Mar 2021 09:42:25 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id n132so34092530iod.0;
        Mon, 15 Mar 2021 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=suo82Wm7Q2Ni3L8PUnv9EFjW8tqvE9ayUdLNwJVj7+c=;
        b=pS8R6CQkEasUaZHCwMCMhsPT3tbRp/QS6uMaq7aHuGKMtL5dcBXWzx7RblXACmYlwS
         +61aeHcCqF6nuLwGdSiA4ZRufOyEp5jrdAIbMZA35OckXTJXv0lflJa0kPHDVc2Lv/nM
         PVT6HmZUAMWGFHD8fLsgO/l1q94tBgvGXGhqYfwu3gi6hNPlpoKIK3in9Zzwyfj+ffDR
         uX6RT7/7x/+8gLCEz3YeSsjuicGfhCYUd7KTy81Au/BKcWGnPIUOswMb3q7nwPzvyEdp
         32azc0a18RSwOxxVzSJzp8PySrfV16x757ndsMJBNnM1MluNTFpw23K/r+tbBNWdMuut
         egLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=suo82Wm7Q2Ni3L8PUnv9EFjW8tqvE9ayUdLNwJVj7+c=;
        b=bJjtY2McQ6mO3Tf8NiLwx9Oho7uU6cqaV26kcpwuM/xEtXXK9XHX4ljR0Qo80rd4Az
         Qdm9c6XK1uP4Emb077YaV7v30o65XIn2Q2hmW+jvaoMQ3nRwtgUvl/sL1k+hK54v0nfq
         0leKv4oTZT/c6ONRJnDRn0GT/5Wvix4uLj8HJuGcZR3c8d+c3HL4A06wO9QYfHjxoOnW
         TSuao7OUlLKx8N0OMkKLwU/KdA8bcz+En3kLlYCTWV9M+6Yl7mo6o2cSdnkXSddo05dx
         ECIwCQSehmRzh7HrdeNn+IEZe7Ne8kobMEldL0z0pJRaoloVW5a+di27WizMqXVIVUBo
         Rwgw==
X-Gm-Message-State: AOAM533GCG7NvU6F7FUM7lby2ciLCxEkqCg09B4y7j0WTkEEWUdeTsJg
        4su9VHXvU/fOvTwlX7uSbNt8Cja38l1uM1JeIqU=
X-Google-Smtp-Source: ABdhPJy4M7AFuZ9fXk3YWkOXHWMyTm5M0r+u+NXPK2z8BW1WLbau1LHz4JM11zjA5k+lTqTRzP9s9elQPtEOHkXiqp8=
X-Received: by 2002:a02:9a0a:: with SMTP id b10mr10259501jal.132.1615826544698;
 Mon, 15 Mar 2021 09:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org> <20210309205915.2340265-1-nathan@kernel.org>
 <CAK7LNAQ6goFdV=HuCdiCsr-PSUGxtafHZAa=p=96ieFyFHL8yg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ6goFdV=HuCdiCsr-PSUGxtafHZAa=p=96ieFyFHL8yg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 15 Mar 2021 17:41:47 +0100
Message-ID: <CA+icZUVRyEGnLnRBiZjmZqmvCLkR8AZR8tihho83Lrr_F9A2BA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Masahiro Yamada <masahiroy@kernel.org>
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

On Mon, Mar 15, 2021 at 5:22 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Mar 10, 2021 at 5:59 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > This flag was originally added to allow clang to find the GNU cross
> > tools in commit 785f11aa595b ("kbuild: Add better clang cross build
> > support"). This flag was not enough to find the tools at times so
> > '--prefix' was added to the list in commit ef8c4ed9db80 ("kbuild: allow
> > to use GCC toolchain not in Clang search path") and improved upon in
> > commit ca9b31f6bb9c ("Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang
> > cross compilation"). Now that '--prefix' specifies a full path and
> > prefix, '--gcc-toolchain' serves no purpose because the kernel builds
> > with '-nostdinc' and '-nostdlib'.
> >
> > This has been verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as
> > well as a distribution version of LLVM 11.1.0 without binutils in the
> > LLVM toolchain locations.
> >
> > Link: https://reviews.llvm.org/D97902
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >
> > v1 -> v2:
> >
> > * Improve commit message (add history behind flag and link to Fangrui's
> >   documentation improvement).
>
>
> Both applied to linux-kbuild. Thanks.
>

Sorry for being pedantic: This misses my Tested-by#s (see [1]).

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v13-git

AFAICS v2 changes some comments in the commit only but not code?

- Sedat -

[1] https://marc.info/?l=linux-kernel&m=161480031518629&w=2
[2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=d4aa405bc9cd506532f075456645716cdd1739c1

>
>
>
>
> > I did not carry tags forward so that people could re-review and test.
> >
> >  Makefile | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 31dcdb3d61fa..182e93d91198 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
> >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> >  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> > -GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> > -endif
> > -ifneq ($(GCC_TOOLCHAIN),)
> > -CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> >  endif
> >  ifneq ($(LLVM_IAS),1)
> >  CLANG_FLAGS    += -no-integrated-as
> >
> > base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
> > --
> > 2.31.0.rc1
> >
>
>
> --
> Best Regards
> Masahiro Yamada
