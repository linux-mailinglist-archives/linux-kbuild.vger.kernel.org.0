Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62D13118AE
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 03:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbhBFCoP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 21:44:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbhBFCcj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 21:32:39 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E225C0617AA
        for <linux-kbuild@vger.kernel.org>; Fri,  5 Feb 2021 14:05:28 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id h7so12045201lfc.6
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Feb 2021 14:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zeFCuwPyZrQo30fqoMpBAnSm+mAPzDuy2Hx9cst86mA=;
        b=bqFTieNLJSzgASCm+qRTv5VPQzBzJflsUPTmvMYITq+CMaUk1U2kxmNhYkquuPxutl
         jywknFAktNdU32+LTgxHZNBwwCD7MMb4SAj8DG15KA9DW6Cc2lhlIYfi9qz7g9LAZ/JF
         Fjzv68Fh7fqq7jTH4AAKZPV6uV38r9qtcC9bFbNCWutSyV+9fm9f08kHC6U0xrb/jmkn
         3105/o8wtobqVora5JDwdbKnT6RaC+ieOfW+O+vhmxbhYAiab5ZS/JKXXiGXjZUcx2k5
         F5ZyZ9VZQr9uN0lgEHYk1drHfl8MrtxqBAK7/wBqYb1vyyyAjmz1ffXO5Vs7rcv3xv8r
         HhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zeFCuwPyZrQo30fqoMpBAnSm+mAPzDuy2Hx9cst86mA=;
        b=jUG7hH2wefQP8+JMkFJ+8tJ1FsaxWr/0YnVSS5JDsHyPDwm8Kn3/TQBZQAUkCrEOPO
         i77xsm9+NfRB8ZM9whc/M7ELsL9vuGnxOiMAwHODQ1+CrZlx9Gr+cZjWwud7FCny9+oB
         BPUA21k9/Ny2pk7cIyTNS3PX5h3dnm+AC8yog42cBuzo/d1C1FNcfLURRtHV8lMg0Gh2
         JmmD66EaWpFBIX3C2M8wMch/QgcLjbQdZI9xCTFGlvfe/YmxferUIDOJiAAy0A5NXyeT
         TeaHtWLxyRyExBZHMREh+aeztW1pRCCYPySkpIX6HOtkde8gelxSFiZkLySbcib4whpL
         0/mg==
X-Gm-Message-State: AOAM530X3vosk1Aur1WQBfSAw6T2jmtRIWffUljssLBmNrwqqg71x0+v
        ghQUfiIQjLZvcnwQX3MQiU+Zjt7KrhWuBmvuNFKXXOIsrqY=
X-Google-Smtp-Source: ABdhPJzsjJ86jybD6y4WMLruoHNnVkApRHddRhG7luk0yUOW1YF202j7pwGy+HVaAh2p2jkLiW8+ttkzvy4LfmWHk4M=
X-Received: by 2002:ac2:5e90:: with SMTP id b16mr3477340lfq.122.1612562726417;
 Fri, 05 Feb 2021 14:05:26 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
 <20210205213651.GA16907@Ryzen-5-4500U.localdomain> <CAKwvOdk8vp5z71pQHG04REENSy15Z3DvY1MehS_GGVxnhXx_cg@mail.gmail.com>
 <20210205215531.GA8294@ubuntu-m3-large-x86>
In-Reply-To: <20210205215531.GA8294@ubuntu-m3-large-x86>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 5 Feb 2021 14:05:13 -0800
Message-ID: <CAKwvOdk51GZ9HtBCNUCKX4mp7NSHvKv_4i_DgtdKciHU6CfiSw@mail.gmail.com>
Subject: Re: Using GNU AS from a selfmade binutils v2.35.2
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 5, 2021 at 1:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 01:44:44PM -0800, 'Nick Desaulniers' via Clang Built Linux wrote:
> > On Fri, Feb 5, 2021 at 1:37 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > It is entirely possible that '--prefix=' should always be present though:
> > >
> > > diff --git a/Makefile b/Makefile
> > > index f5842126e89d..409822f45bfd 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -562,10 +562,10 @@ endif
> > >  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> > >  ifneq ($(CROSS_COMPILE),)
> > >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> > > +endif
> > >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > >  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> > >  GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> > > -endif
> > >  ifneq ($(GCC_TOOLCHAIN),)
> > >  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> > >  endif
> >
> > I'm unsure. Consider the case where I'm building with `LLVM=1
> > LLVM_IAS=1 CROSS_COMPILE=aarch64-linux-gnu`, ie. no GNU binutils and
> > am cross compiling.  In that case, we should not be setting any
> > --prefix or --gcc-toolchain, and yet today we are.  Perhaps that is
> > orthogonal though?
>
> Yes, we could probably move the 'ifneq ($(LLVM_IAS),1)' block up because
> all other build tools should be called directly (really, just "$(LD)")
> but I do think that is orthogonal to the issue that is going on here.
>
> I am happy to send patches if you feel this is worthwhile.

It would be the capstone to hermetic builds, I suspect.
-- 
Thanks,
~Nick Desaulniers
