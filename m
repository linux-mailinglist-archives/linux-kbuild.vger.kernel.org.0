Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531B23118B1
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 03:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhBFCo1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 21:44:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:38110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231128AbhBFClz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 21:41:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1E7E64FBC;
        Fri,  5 Feb 2021 21:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612562133;
        bh=uGtBS7bWINMK3Lh97XHqzAU0AGk6BwnwE/7ThauRS6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sqdwdU7B53/JbjKrAOUl1hl8noNcV/EFpLgVG3JvdbbTcQxBEkjnWyFRzSnyCjxzM
         u3ZYR2lbctEB8rgWfn7/0M0SOJrkEvC18cTrg2fYGUM35J5aYDd+Aohm68PtM3cKLb
         HI7eTQiCT3pCveGutIzuyuhyP27PcCaWyH3+D6EHLc0nYRZ7up5mkzI35eTQJ4ugYg
         CkFl0RmTlo/He3Ol5tbCieZEWBUhZEYGhM0n+FJdt2vkmQ8VCGxRr2PZL9FXd9+pQX
         vKEQcxpXTJ18Fa+KdR9jYSm1KgcJ7QjhpwrUCmKvyZUr+lxGdbw7ms4JGiBlhC+E9O
         3dkpLmEfdtdKw==
Date:   Fri, 5 Feb 2021 14:55:31 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Using GNU AS from a selfmade binutils v2.35.2
Message-ID: <20210205215531.GA8294@ubuntu-m3-large-x86>
References: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
 <20210205213651.GA16907@Ryzen-5-4500U.localdomain>
 <CAKwvOdk8vp5z71pQHG04REENSy15Z3DvY1MehS_GGVxnhXx_cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdk8vp5z71pQHG04REENSy15Z3DvY1MehS_GGVxnhXx_cg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 05, 2021 at 01:44:44PM -0800, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Fri, Feb 5, 2021 at 1:37 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > It is entirely possible that '--prefix=' should always be present though:
> >
> > diff --git a/Makefile b/Makefile
> > index f5842126e89d..409822f45bfd 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -562,10 +562,10 @@ endif
> >  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> >  ifneq ($(CROSS_COMPILE),)
> >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> > +endif
> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> >  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> >  GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> > -endif
> >  ifneq ($(GCC_TOOLCHAIN),)
> >  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> >  endif
> 
> I'm unsure. Consider the case where I'm building with `LLVM=1
> LLVM_IAS=1 CROSS_COMPILE=aarch64-linux-gnu`, ie. no GNU binutils and
> am cross compiling.  In that case, we should not be setting any
> --prefix or --gcc-toolchain, and yet today we are.  Perhaps that is
> orthogonal though?

Yes, we could probably move the 'ifneq ($(LLVM_IAS),1)' block up because
all other build tools should be called directly (really, just "$(LD)")
but I do think that is orthogonal to the issue that is going on here.

I am happy to send patches if you feel this is worthwhile.

Cheers,
Nathan
