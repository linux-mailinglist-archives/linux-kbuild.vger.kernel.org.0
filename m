Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44A043E383
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 16:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhJ1OY4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 10:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhJ1OY4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 10:24:56 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CD0C061570;
        Thu, 28 Oct 2021 07:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=PPSmLuVzoHR88dVTU6Qg/HVOwGDGjDCbEwYUDZUaDlA=; b=EWmPWlMidK03/7dQpQxxc/qwdO
        QFoMaBSAyisgewIWeK58BjR12d/WSMKA1wwas528IOZsZX4b4com9WvWzq8Lg1jB+DhXn/KcO2czD
        DFiHfPluAaQnFr/0Unq0KXCP2T0p4qbz8r/uAyD3nfS/9JuaJemHXeLl3STIYEM1CZK5jJvzsxkuN
        HAl42zEMLvV9cNIPvsZI21dFrBY0Xhche5A3moxcI9Pc5rd+487f2PPXYLQQt+4JnCmZuRzlX5iv0
        zjpbw8XSdI2BWODjnWpUg8Kd44B4wLlr7HGZjI79eWfFiO9YxkUsXCs8yJTFPdWkuGCDTGUwEBUxS
        qeP0TeXw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mg6IR-00Cokj-0q; Thu, 28 Oct 2021 14:22:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A5B533001BF;
        Thu, 28 Oct 2021 16:22:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8961E203BE477; Thu, 28 Oct 2021 16:22:22 +0200 (CEST)
Date:   Thu, 28 Oct 2021 16:22:22 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
Message-ID: <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 04:15:02PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 28, 2021 at 11:07:40PM +0900, Masahiro Yamada wrote:
> > On Thu, Oct 28, 2021 at 10:44 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > Hi,
> > >
> > > Debian (and derived) distros ship their compilers as -$ver suffixed
> > > binaries. For gcc it is sufficent to use:
> > >
> > >  $ make CC=gcc-12
> > >
> > > However, clang builds (esp. clang-lto) need a whole array of tools to be
> > > exactly right, leading to unweildy stuff like:
> > >
> > >  $ make CC=clang-13 LD=ld.lld=14 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1
> > >
> > > which is, quite franktly, totally insane and unusable. Instead use the
> > > already mandatory LLVM variable to convey this, enabling one such as
> > > myself to use:
> > >
> > >  $ make LLVM=-13
> > >
> > > This also lets one quickly test different clang versions.
> > 
> > 
> > Please read the commit log of
> > a0d1c951ef08ed24f35129267e3595d86f57f5d3
> 
> That's yuck, I like LLVM=-13 or LLVM=-12 much better to select between
> compilers. Means I don't have to remember wth they live and or wreck
> PATH.

Even better, why not do something like:

if test "${CC:0:5}" == "clang"
then
	LLVM=1
	LLVM_SFX=${CC:5}
fi

Then we can simply use: make CC=clang-12 and have it all just work.

