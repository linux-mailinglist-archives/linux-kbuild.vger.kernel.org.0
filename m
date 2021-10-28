Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B163843E346
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 16:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhJ1ORr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 10:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhJ1ORp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 10:17:45 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEBCC061570;
        Thu, 28 Oct 2021 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=bc40OkCZc3qUDZQjfILbCSwNeOqpl7xu1nq2tjombnE=; b=OasiJD/TSM+8sTYgzQS3HNGf4Y
        BPt+VlI7/h1xQuXFHQoMlWvk02dD1LnN72xe2sehiX6aJSttPoR0pnL6g27KAIICkpTmfoecce/uO
        hOas2Wb6v1iiZWcMhIa4Vb04tNAwkjPjse2/GkpP4JpGAAcxS1BGhC8NAfzECJejIOXoSXwqNXLqV
        4bYu2Ce5FADs4o3oDPLN4DmJnxAlEUc3N1pffjh/9PWCALKgKdhJN23s5Vved+cYoIH5wBPRUlOpm
        sQd1894HT9r6V0M8HM3AXalADo3rr6SPuflGYwjBAckY7/i0rRs9WP1ggWynGcW+Da3kpxeEsUBzY
        +e/K0VFA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mg6BL-00Cofl-JY; Thu, 28 Oct 2021 14:15:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 87C0E30022C;
        Thu, 28 Oct 2021 16:15:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6ABB32C41F782; Thu, 28 Oct 2021 16:15:02 +0200 (CEST)
Date:   Thu, 28 Oct 2021 16:15:02 +0200
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
Message-ID: <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 11:07:40PM +0900, Masahiro Yamada wrote:
> On Thu, Oct 28, 2021 at 10:44 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Hi,
> >
> > Debian (and derived) distros ship their compilers as -$ver suffixed
> > binaries. For gcc it is sufficent to use:
> >
> >  $ make CC=gcc-12
> >
> > However, clang builds (esp. clang-lto) need a whole array of tools to be
> > exactly right, leading to unweildy stuff like:
> >
> >  $ make CC=clang-13 LD=ld.lld=14 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1
> >
> > which is, quite franktly, totally insane and unusable. Instead use the
> > already mandatory LLVM variable to convey this, enabling one such as
> > myself to use:
> >
> >  $ make LLVM=-13
> >
> > This also lets one quickly test different clang versions.
> 
> 
> Please read the commit log of
> a0d1c951ef08ed24f35129267e3595d86f57f5d3

That's yuck, I like LLVM=-13 or LLVM=-12 much better to select between
compilers. Means I don't have to remember wth they live and or wreck
PATH.
