Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FBC3D07F3
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jul 2021 06:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhGUEMz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Jul 2021 00:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbhGUEMh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jul 2021 00:12:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E9DC061574;
        Tue, 20 Jul 2021 21:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=SCwobZ2ergcsP/KBco/dD0SaEMf5ddis2wZxVwFwdGI=; b=te/y9365s06WaIS3mt4ElzUv+J
        S2UFUTT/lrPVCOxnrj3MvKsXeePPPdbccDq08r7qe9OWPsaaPtLbKmGXWWzo3jJsSSJA5DnAc3B7q
        rIV0MRhU5+YUR1+PZtzJfqCU7d3fsKXmp+mBqKKNJe0kd0eT0CZlG6cNe9tVVoHI6R+La+ydqr8IP
        mTOAubjo2r5lWOl3P2p84Dbr7OJubAyHVHu2tVQfm4EX5jpWVrDrFLOcUb6wmV93e9et6lECN5dAT
        qMsk8eCGDErlWIsy1dZ8YigRyFVikL4KPnGo2lliQCmVwXcROJIrGc9hJfr4+0R+jLwYevTrrxtMe
        kDzeBSTA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m64Dq-008no6-Fc; Wed, 21 Jul 2021 04:52:45 +0000
Date:   Wed, 21 Jul 2021 05:52:42 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
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
Message-ID: <YPeoGucPDzFcmJ7p@infradead.org>
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com>
 <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAKwvOdkvju7heeNpk87brsjkhXHbdKFsUgf63KWhXox9rDkQsA@mail.gmail.com>
 <CAHk-=wiZe2FuiAOwhbKR_VMmFBKekz0NFREm4fvik25PEdcK_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiZe2FuiAOwhbKR_VMmFBKekz0NFREm4fvik25PEdcK_g@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 20, 2021 at 02:54:35PM -0700, Linus Torvalds wrote:
> But there are other things that stick around. In particular, I have
> considered simply using git config variables for that.
> 
> Something like this in the main Makefile:
> 
>     ARCH=$(shell git config build.arch)
>     CC=$(shell git config --default=gcc build.cc)
> 
> would actually be optimal for what _I_ do. Then for my clang build tree, I'd do
> 
>     git config build.cc clang
> 
> and it would stick in that tree. If you don't set the option, it would use gcc.
> 
> Maybe that would be an acceptable model these days? We've used git
> long enough that non-git worries aren't a big deal any more, and I
> guess people could use the old-fashioned

I still this only papers around the fact that the architecture is
fundamentally part of the kernel config and should come from .config,
and the toolchain probably as well.

I for one do have a few different tree for different projects, but
need to try cross compiles in each of them.  And unfortunately sometimes
with clang (nothing against clang itself [1], just that having to deal
with multiple toolchains is a pain)

[1] well, except for the sometimes idiotic diagnostics..
