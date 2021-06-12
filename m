Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF21C3A5093
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 22:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhFLUdt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 16:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhFLUdt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 16:33:49 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251EFC061574;
        Sat, 12 Jun 2021 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ye0j1hPtMrtorLTQXMFdA47MBQh6LFL8kooJgqW9gwQ=; b=HqC/lKMBoCpd1ZvkELLiU4kuAm
        3Tm/SoRIgOjRipBJp+C7KuEHPTPboXomY/9VYwbEMC0Lswkx4nrmz/8cevvmaESokL193AV9gR2yZ
        ray3FMmxUuN1B3I2jagqHlTYvv4YRC2HjaBlntRO2oQ26PmCKI33n02bwX0NC2jqaZ88PV44tYXQE
        fLf9jG36+43MT4agE4CL97wXpPMT3y2hFt99wt/ilnFXsws9Weh6fRm4r+2gGS2itCV1Kya9mcQ+s
        /uTI/6vZj73GLqdL2rrvb1uXJoIaWMeNu+FZznEkUnGVgAfi6ZgtKFrMyYpllt+fouZqijf4E3jxs
        z0xvZSAg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lsAI7-003zTx-Bf; Sat, 12 Jun 2021 20:31:39 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 1C4DF986F3B; Sat, 12 Jun 2021 22:31:38 +0200 (CEST)
Date:   Sat, 12 Jun 2021 22:31:38 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Fangrui Song <maskray@google.com>
Cc:     Bill Wendling <morbo@google.com>, Kees Cook <keescook@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <20210612203138.GH68208@worktop.programming.kicks-ass.net>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
 <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <20210612202015.s4743sr6d3lv3lgf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612202015.s4743sr6d3lv3lgf@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 12, 2021 at 01:20:15PM -0700, Fangrui Song wrote:

> For applications, I think instrumentation based PGO can be 1%~4% faster
> than sample-based PGO (e.g. AutoFDO) on x86.

Why? What specifically is missed by sample-based? I thought that LBR
augmented samples were very useful for exactly this.

> Sample-based PGO has CPU requirement (e.g. Performance Monitoring Unit).
> (my gut feeling is that there may be larger gap between instrumentation
> based PGO and sample-based PGO for aarch64/ppc64, even though they can
> use sample-based PGO.)
> Instrumentation based PGO can be ported to more architectures.

Every architecture that cares about performance had better have a
hardware PMU. Both argh64 and ppc64 have one.

> In addition, having an infrastructure for instrumentation based PGO
> makes it easy to deploy newer techniques like context-sensitive PGO
> (just changed compile options; it doesn't need new source level
> annotation).

What's this context sensitive stuff you speak of? The link provided
earlier is devoid of useful information.
