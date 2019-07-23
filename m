Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A49712AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2019 09:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388289AbfGWHU7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Jul 2019 03:20:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38982 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388288AbfGWHU7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jul 2019 03:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=+D4Rc6xmuAUh55cR2qKohR/b4eK3aBjck3vn77Ev0BE=; b=gDIDNVTLTWObmmhFzbCZkwz4N
        O2H/Rco1Agz/j8KmUh8igu1o0otY+dnnMdx6feAz5yqRkAgAof78pzYrjVK5nJk7kOwGLWsoYC5Wu
        Pf2trWWQfH6DiVea0ekcX4jWgtoBYGD3IfwLG9RIgpHwThxEBmuiJ130Z/zQBy3fADENbqX7bXzZH
        14GsJWlkJrABhTL7S8IssCFwPfHe07PZGjBr4Niaqs0pywuhLG5zLsdroS2xk88pUDb3pVOk/7IF+
        AulDtAJ5MW+pRephr6QdWcMYIkYbvtu4dzVV7b8m0l2VAnJlREjUyhGOqeqrGhn+knf90v/sHwA+h
        7pD4//AXg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpp6L-00008X-Kn; Tue, 23 Jul 2019 07:20:45 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2C18C20A291EC; Tue, 23 Jul 2019 09:20:43 +0200 (CEST)
Date:   Tue, 23 Jul 2019 09:20:43 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: Re: [PATCH 2/5] x86_64, -march=native: POPCNT support
Message-ID: <20190723072043.GU3402@hirez.programming.kicks-ass.net>
References: <20190722202723.13408-1-adobriyan@gmail.com>
 <20190722202723.13408-2-adobriyan@gmail.com>
 <20190722211210.GN6698@worktop.programming.kicks-ass.net>
 <20190722211539.GA29979@avx2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722211539.GA29979@avx2>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 23, 2019 at 12:15:39AM +0300, Alexey Dobriyan wrote:
> On Mon, Jul 22, 2019 at 11:12:10PM +0200, Peter Zijlstra wrote:
> > On Mon, Jul 22, 2019 at 11:27:20PM +0300, Alexey Dobriyan wrote:
> > > Detect POPCNT instruction support and inline hweigth*() functions
> > > if it is supported by CPU.
> > > 
> > > Detect POPCNT at boot time and conditionally refuse to boot.
> > > 
> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > ---
> > >  arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
> > >  arch/x86/include/asm/segment.h                |  1 +
> > >  arch/x86/kernel/verify_cpu.S                  |  8 +++++++
> > >  arch/x86/lib/Makefile                         |  5 +++-
> > >  .../drm/i915/display/intel_display_power.c    |  2 +-
> > >  drivers/misc/sgi-gru/grumain.c                |  2 +-
> > >  fs/btrfs/tree-checker.c                       |  4 ++--
> > >  include/linux/bitops.h                        |  2 ++
> > >  lib/Makefile                                  |  2 ++
> > >  scripts/kconfig/cpuid.c                       |  7 ++++++
> > >  scripts/march-native.sh                       |  2 ++
> > >  11 files changed, 54 insertions(+), 5 deletions(-)
> > 
> > *WHY* ?
> > 
> > AFAICT this just adds lines and complexity and wins aboslutely nothing.
> 
> If CPU is know to have POPCNT, it doesn't make sense to go through RDI.
> Additionally some CPUs (still?) have fake dependency on the destination,
> so "popcnt rax, rdi" is suboptimal.

You completely forgot to mention any of that in your Changelog, also I
doubt you can find code where this makes a measurable difference. IOW, I
still doubt it makes any kind of sense.

