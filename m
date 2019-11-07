Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71BF1F32E2
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2019 16:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbfKGPXJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Nov 2019 10:23:09 -0500
Received: from merlin.infradead.org ([205.233.59.134]:33804 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfKGPXJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 10:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=2bEBCVEzj/UW4TTeCQCzfwpdXCg8fMIpoINpN+K/OOw=; b=qEmmPweXw7L/1q8f4gh06i9On
        /ueo7gq/0dhyEkAkP6tqn894aUgZRKXLup7jGvLUz/TrKiyx/iWwjuAFO9pP/DrGdUGRebVW3Cc4w
        OwLEPlne+3E9+1roX5A2rNumX1DIWknYRRPlYpeWzrbzMvcVehNu0q8MwQ13nj/TCwfD8erA3S1VT
        NJQECMx+KNAxsQvL0iorTdPnqru2s/XJDD6vc3r8xeL8ZuRNK6CtfuDl8gMqC2laNszOrQs7vYG1O
        czwvqnBznWAclenFOTXpY2B7ahPcapn8CQh+ZgV0QafkH2Uv6f1L6GVykH2jwU9IVGxUrS+FFN9qK
        5VwH7G25g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iSjcU-0000cB-Ms; Thu, 07 Nov 2019 15:22:46 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0AC5C300692;
        Thu,  7 Nov 2019 16:21:40 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8F5CE2B212C1C; Thu,  7 Nov 2019 16:22:44 +0100 (CET)
Date:   Thu, 7 Nov 2019 16:22:44 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     shile.zhang@linux.alibaba.com
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191107152244.GD4114@hirez.programming.kicks-ass.net>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 07, 2019 at 10:32:01PM +0800, shile.zhang@linux.alibaba.com wrote:
> From: Shile Zhang <shile.zhang@linux.alibaba.com>
> 
> Hi,
> 
> I found the unwind_init taken long time (more than 90ms) in kernel
> booting, mainly spent on sorting the two ORC unwind tables, orc_unwind
> and orc_unwind_ip.
> 
> I also noticed that this issued has reported and discussed last year:
> https://lkml.org/lkml/2018/10/8/342
> But seems no final solution until now, I tried to sort the ORC tables at
> build time, followed the helpful hints from Josh and Ingo in that thread.
> And mainly referred the implementation of 'sortextable' tool:
> https://lore.kernel.org/linux-mips/1334872799-14589-1-git-send-email-ddaney.cavm@gmail.com/
> 
> What I did:
> 
> - Add a Kconfig to control build-time sorting or runtime sorting;
> - Referred 'sortextable', create a similar helper tool 'sortorctable',
>   help to sort the ORC unwind tables at vmlinux link process.

What is the build-time cost for doing this? The link phase is already a
fairly big bottleneck for building a kernel.

Can sort{ex,orc}table() be ran concurrently? Do they want to be the same
(threaded) tool?
