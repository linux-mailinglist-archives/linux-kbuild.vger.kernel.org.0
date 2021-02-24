Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FDB32430D
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 18:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbhBXRSY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Feb 2021 12:18:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:50384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234736AbhBXRSX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Feb 2021 12:18:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E7E664F0B;
        Wed, 24 Feb 2021 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614187061;
        bh=u8ZNuqYInVQANFsOD5T+PXy7b7+EOuQxFZ7y03PJ+gw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DPpJPlXn5B7lZRP7yQOHgAs3XfYC7RiXpIbnaySmOlYIIIKeMMBBrsVCSlZLIo/GN
         zKRiqVGnlGlQN8lo2mhYsN1rxU3VDh/bG0Za0x06bXMhwjPGBJvOQBcjz7vkG/PEsD
         IVIQP2jhjzBMH0ALPTXguGEBMfGBal/Kxey6XQOMeVLHtlgSti/gPT9xpdwJWKz+aw
         D5hdb7P84eDsAsLS+MxZqDilZbmo8743PV8dnO/T/qn5hjqdKSjtpPvUSDZMTiL3xh
         9LxWL8GFqibOP53lK6puYLabd4pFuV6gfw6lWY0fSEnLTHKqNz0+y8AX1oaDbGDryS
         GJevlVIOBdulg==
Date:   Wed, 24 Feb 2021 10:17:40 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] Makefile: reuse CC_VERSION_TEXT
Message-ID: <20210224171740.GA7180@24bbad8f3778>
References: <20210205220125.2931504-1-ndesaulniers@google.com>
 <CAK7LNARKHvjTcnic=ZKntH3NY5meehQbJuBr34y9_tn8b-Ym0w@mail.gmail.com>
 <CA+icZUVkFOZq=5K=dKsQAFJPTmEE2gr_hVmYM=Q+rn70bSOh2w@mail.gmail.com>
 <CAK7LNAQGUnzLSOHAwF6ebH7oOuNETAyf3nrdNgNNq7JsDgiFkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQGUnzLSOHAwF6ebH7oOuNETAyf3nrdNgNNq7JsDgiFkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 24, 2021 at 12:14:04PM +0900, Masahiro Yamada wrote:
> On Sat, Feb 6, 2021 at 12:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Sat, Feb 6, 2021 at 2:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Sat, Feb 6, 2021 at 7:01 AM 'Nick Desaulniers' via Clang Built
> > > Linux <clang-built-linux@googlegroups.com> wrote:
> > > >
> > > > I noticed we're invoking $(CC) via $(shell) more than once to check the
> > > > version.  Let's reuse the first string captured in $CC_VERSION_TEXT.
> > > >
> > > > Fixes: 315bab4e972d ("kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE")
> > >
> > >
> > > I did not touch this hunk because I have a plan
> > > for different refactoring, but I have never got
> > > around to do it.
> > >
> > > Anyway, you beat me, and I will pick this up.
> > > But, the Fixes tag is questionable because
> > > this is code refactoring.
> > >
> >
> > When I see this... and hear refactoring... As a suggestion/improvement...
> >
> > Can we have LD_VERSION_TEXT analogue to CC_VERSION_TEXT?
> > Both are shown when doing a `cat /proc/version` (and IIRC in file
> > include/generated/compile.h).
> 
> Sorry, I had forgotten to answer this question.
> 
> Probably, we should do so.
> 
> Feeding it to Kconfig allows us to re-evaluate
> config settings when tools are upgraded.
> 
> One question is where we should draw a line.
> If we record the version text of CC, LD,
> we should do that for more tools?
> 
> For LD, I will be probably OK because
> some features rely on LD_VERSION or $(ld-option ).
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

It probably makes sense to do this for tools that we depend on in
Kconfig, like CC and LD. Those will usually paint a good enough picture
for what tools were used on a whole since CC will tell us about the GCC
or LLVM version used (as well as distribution usually) and LD will tell
us about the binutils or LLVM version.

LTO does check $(AR) and $(NM) but it also depends on LLVM=1 LLVM_IAS=1,
which would get covered by the $(CC) and $(LD) print outs.

Cheers,
Nathan
