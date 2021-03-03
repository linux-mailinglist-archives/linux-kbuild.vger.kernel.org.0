Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAA732C1F5
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387605AbhCCTbt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383601AbhCCOjc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 09:39:32 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFFFC061788;
        Wed,  3 Mar 2021 06:23:12 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id n132so14025003iod.0;
        Wed, 03 Mar 2021 06:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=qTLKl4WRx8k2U5ZCH5+kS1apZMNxgxTKeDKtO94gMy4=;
        b=nHkmQZrZzdun+B9sIkH371xZnU8fAH1CfNG/niULY+7g6azuJ0S9yKmayfIX5x0dwD
         2kJWdTCSVM0vMOMPhHbtaBgkcoTA6+eZBXXPeb94Cqg4gAqfMzoAXltcl21ZIquHhxbU
         tzkMKZV98QDj0J96lTQ16N54hygZ3cKPljpY05TJLSXwbcRR3GPVL0u2mFe6TVyAVeej
         Rklnp4xnTk1yGJOl6X9Ho30P5EPzxtiguCTY22rZBDYR5qiqD04retU0KJLgnLOKZbTj
         l5o4xwhp+QYFHIEoXv3Oe7aWtSIjCaYVDYjnZ4GvDU4bXJZ434pu76yy48wtvGEsMJkq
         Xw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=qTLKl4WRx8k2U5ZCH5+kS1apZMNxgxTKeDKtO94gMy4=;
        b=EewK3Isge4UiZEjqe0aorapKD7kXA+eOHfSpfWWrHaNTIz8eZNaO48EP3JgvZQ00DK
         YOb19h2LJS/nyh2b4iHE6wviplRdvHYC5wAZP1v8tciMTQRIBsRWJPBVI/fEZZfhHJ+S
         0QA57AozwEv4xDU+tA0lXF+FZTkjeWKznnNxowwIEb+NRSGDQUZnG/OfDOqLmiq2RUMG
         Fx/CgOto19OJHBXg2ghqdMw5uIQ83MbYkc0At7KID5CQuIqFIaPoTbqZZZMVUtUQz3jH
         FuVWhC/E7XSNX7gNFkqPHAqDE83G0odVOy/8irdHl3rftHUfigdOCNbaiGw72MR1AaxP
         4aAg==
X-Gm-Message-State: AOAM532nd2jIZoEYv/1jMNKg8f+/Kavalb3cqlpct+Ff+XilMuupOkN7
        lNge8hBBSuBt177lEOBF7M1s3w+my7mESB8iirA=
X-Google-Smtp-Source: ABdhPJwAnNjfuW9PGE/m8Sm0t5oVVA42p6ra/ApWbj6NP3Rb2/14rkmpdmHuxeb9w1ICsSughaFZgOQo5kn38m1p92w=
X-Received: by 2002:a02:9a0a:: with SMTP id b10mr8435021jal.132.1614781392157;
 Wed, 03 Mar 2021 06:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org> <CA+icZUWKZ+vVTqSkPP0D8MMWuZkNzL1zpm+EkWrNSMM-5H3d1w@mail.gmail.com>
In-Reply-To: <CA+icZUWKZ+vVTqSkPP0D8MMWuZkNzL1zpm+EkWrNSMM-5H3d1w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 3 Mar 2021 15:22:36 +0100
Message-ID: <CA+icZUWqhEJwWs+KJJgDxHYGb+L=yd264hV=LRAzPPipLaMMnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Behan Webster <behanw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 3, 2021 at 4:25 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Tue, Mar 2, 2021 at 10:07 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > This is not necessary anymore now that we specify '--prefix=', which
> > tells clang exactly where to find the GNU cross tools. This has been
> > verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as well as a
> > distribution version of LLVM 11.1.0 without binutils in the LLVM
> > toolchain locations.
> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> [ CC Behan ]
>
> Hahaha, that is a change of a very early commit in times of the
> LLVM/Clang Linux-kernel development.
> So-to-say a historical change :-).
>
> I will try this patchset later with latest Linux -v5.12-rc1+ and my
> custom patchset.
>

I tested these two patches in my build environment.
So far no issues.
NOTE: I have not tested the combo: Clang and GNU AS.

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v13-git

- Sedat -

> > ---
> >  Makefile | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index f9b54da2fca0..c20f0ad8be73 100644
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
> > base-commit: 7a7fd0de4a9804299793e564a555a49c1fc924cb
> > --
> > 2.31.0.rc0.75.gec125d1bc1
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210302210646.3044738-1-nathan%40kernel.org.
