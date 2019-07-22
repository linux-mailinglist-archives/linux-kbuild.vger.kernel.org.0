Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1DCD70B0A
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2019 23:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731178AbfGVVMY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jul 2019 17:12:24 -0400
Received: from merlin.infradead.org ([205.233.59.134]:38014 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfGVVMY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 17:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=i/9x3f31gEYS7CW2Vj0E4dy56Z7v+/HM1wpK9zDQV10=; b=dKY/2IZD+lIrl+gyGELjMT6LO
        FNj4VZqZsdEDRSR6E7RPxlJHwOqmHfCqgVipV/X5eJrQL8QkrSBCSFT2jZJHZCQRLHcycLQPuCEWs
        DvNLrjUWPXhdoI6ax94OR1Q0QIsfdNFdcQiFR6jcHSbZ5ls2fhMyjOFQ3IuZ7CiKJZ5OnoJyhapKD
        emNZ/zXqOefnvoJFwpzHFyHXiWkDRmMWrZoFMZHAhvqIBT3wpidQPq/5zEDhhVNXaRdnGryWeUmy1
        Tik0usayHeNqmKqanWsVFmG0WSjEHcnjhEt2vfhjqVnxhfz8L+7pNH+cTq04MM7LR3T0lZ06REuO/
        jN4IFTsGw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpfbQ-00078g-15; Mon, 22 Jul 2019 21:12:12 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2D287980D1F; Mon, 22 Jul 2019 23:12:10 +0200 (CEST)
Date:   Mon, 22 Jul 2019 23:12:10 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: Re: [PATCH 2/5] x86_64, -march=native: POPCNT support
Message-ID: <20190722211210.GN6698@worktop.programming.kicks-ass.net>
References: <20190722202723.13408-1-adobriyan@gmail.com>
 <20190722202723.13408-2-adobriyan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722202723.13408-2-adobriyan@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 22, 2019 at 11:27:20PM +0300, Alexey Dobriyan wrote:
> Detect POPCNT instruction support and inline hweigth*() functions
> if it is supported by CPU.
> 
> Detect POPCNT at boot time and conditionally refuse to boot.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
>  arch/x86/include/asm/segment.h                |  1 +
>  arch/x86/kernel/verify_cpu.S                  |  8 +++++++
>  arch/x86/lib/Makefile                         |  5 +++-
>  .../drm/i915/display/intel_display_power.c    |  2 +-
>  drivers/misc/sgi-gru/grumain.c                |  2 +-
>  fs/btrfs/tree-checker.c                       |  4 ++--
>  include/linux/bitops.h                        |  2 ++
>  lib/Makefile                                  |  2 ++
>  scripts/kconfig/cpuid.c                       |  7 ++++++
>  scripts/march-native.sh                       |  2 ++
>  11 files changed, 54 insertions(+), 5 deletions(-)

*WHY* ?

AFAICT this just adds lines and complexity and wins aboslutely nothing.
