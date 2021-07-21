Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5D53D07DE
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jul 2021 06:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhGUEFA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Jul 2021 00:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGUEEl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jul 2021 00:04:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1214BC061574;
        Tue, 20 Jul 2021 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=BOPDngMEwqe+Bsprte7BtdwFnfxHNg8u1HnO9Otn+8k=; b=Ni1XuZLIjb6w4dRjax//wv+xyS
        X5LxMpACMNYHAydM3hPB8WHlhgRtsO1r3I42iCTvmIfbPLIR9vqBJacGBMGpy4c7HlKanfbwAN5zt
        qUxgCzkCOs45ZkNK4z3JAQIOktLHjiDYXWAJCrJCsJ+x1YgEfSVXN6xm0eVeKphrwsDhoiH1GQ/5x
        4yiXM54XQttduwEXl2VhXGk4h8MEjbf28KkR5tRMXHsUPihZu2wHGUbd6Nmwyy3n2Lg/J0seB98ws
        P6oCXjxtCkE4dVP5RLcu3W7FRJTGBH1glgmDKt8o+hMPqX9TlA1sePULkE0ccwd0dPJUYKS26Ast3
        svuLq4ag==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m645r-008nRL-N9; Wed, 21 Jul 2021 04:44:32 +0000
Date:   Wed, 21 Jul 2021 05:44:27 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
Message-ID: <YPemK3wSF6IUUX/s@infradead.org>
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com>
 <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 20, 2021 at 10:42:57AM -0700, Linus Torvalds wrote:
> (It has annoyed me for years that if you want to cross-compile, you
> first have to do "make ARCH=xyz config" and then remember to do "make
> ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> never really cared).

Same here.  I'd so much love to just have ARCH an CROSS_COMPILE in my
.config for cross-builds.  Oterwise I keep forgetting them, or keep
forgetting to unset CROSS_COMPILE and will just waist a lot of time
either way.

The fact the the .config files even mention what architecture they are
for in a comment but don't make use of that information is just hostile
to users.
