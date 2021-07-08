Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0415F3BF54E
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 07:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhGHFwV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 01:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhGHFwU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 01:52:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C2DC061574;
        Wed,  7 Jul 2021 22:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=mWfljA4QruRpBEIi5sIMdGx5T82sFFv30vncfANMf1g=; b=MJOHj97MGASie+OP4yLR4gsDaP
        JUN0nm34hL4c6b+ZuugumECiSKrCDv4ro/y2PsEnmXIuSFUVZDg0Ym/01JhkduvQ5P1XcBaRjv30B
        mRL50AfbSbCW/s5S+pfkD+j3jeY0r6funfeUAOrvaLVEdgPiTX3ZDXoy75YSNbYNz1LtRM+xOYKCu
        /R11f5sIhoOBlTS4Xp5AQFqY+iSgJD+mriVHZZGyyalnvy9tn+0P7MCGzI+VlUaIcXNRUk4F3muR0
        eAnpb+NG2iWAOzaBwZrJhc3yyvp/xmMp8LNsQkzBp7MI71UPyOq9CXe5zdLOtpU1cjW1QBjNGMsPn
        MwXBe/cg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1MuL-00D80v-2u; Thu, 08 Jul 2021 05:49:16 +0000
Date:   Thu, 8 Jul 2021 06:49:09 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 0/2] infer CROSS_COMPILE from ARCH for LLVM=1 LLVM_IAS=1
Message-ID: <YOaR1ZjToP/kgNsC@infradead.org>
References: <20210707224310.1403944-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707224310.1403944-1-ndesaulniers@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 07, 2021 at 03:43:08PM -0700, Nick Desaulniers wrote:
> We get constant feedback that the command line invocation of make is too
> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> target triple, or is an absolute path outside of $PATH, but it's mostly
> redundant for a given ARCH.
> 
> Instead, let's infer it from ARCH, and move some flag handling into a
> new file included from the top level Makefile.

Why only for LLVM?  I really hate the mess we currently have with
ARCH and CROSS_COMPILE.  Being able to set both in .config (and maybe
even inferring CROSS_COMPILE where possible) would make my life so
much easier.
