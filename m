Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 728E2F4310
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2019 10:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730616AbfKHJZq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Nov 2019 04:25:46 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:59170 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730144AbfKHJZq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 04:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iOfuQrgwDQHEEc9u8dvBDH4RtXgvlA6VBhp4ub5fX7E=; b=qtpBO4Vl5+z4b3XslqvkmHVCP
        93vG3fG9QiTNctOzPlmdEhvbCGO54U5C6k+2DiOO6ByYnsFYRClscR2i/QV6XTzdWlGY7ROx2+l+1
        xbZCvzAWPlZPkecRey8ZTHrlCMFPiF9dI4FsDGE0nVOT+zLr0KsPdCkxWIrib15ITCSPr3qofmMiW
        19h3xkeHh2Kao+MjwEoPseuk3SNFShk1gGs0OTuYoAgXjeGlTpHVTD2BNw2fciehUQuhjcOZzWa15
        mX8nZZ1tlY/RprWFB5Qy6e0Q0fsSfskSVlrwKLDYNkE7UaK/+n1xk/DEQuuxfcMR6loep2KZoikVc
        TOBJeyu5A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iT0WP-0007MK-N4; Fri, 08 Nov 2019 09:25:37 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2502A301A79;
        Fri,  8 Nov 2019 10:24:29 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 058E12022B9E1; Fri,  8 Nov 2019 10:25:34 +0100 (CET)
Date:   Fri, 8 Nov 2019 10:25:33 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191108092533.GN5671@hirez.programming.kicks-ass.net>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
 <20191107152244.GD4114@hirez.programming.kicks-ass.net>
 <85abe498-f241-4752-81b5-6c0314f5a1e8@linux.alibaba.com>
 <20191108092136.GH4114@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108092136.GH4114@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 08, 2019 at 10:21:36AM +0100, Peter Zijlstra wrote:
> On Fri, Nov 08, 2019 at 09:42:55AM +0800, Shile Zhang wrote:
> 
> > > Can sort{ex,orc}table() be ran concurrently? Do they want to be the same
> > > (threaded) tool?
> 
> > I think it is possible to do those sort work concurrently, likes deferred
> > memory init which is big boot time speed up.
> > But I don't know if the exception table and ORC unwind tables can be
> > deferred, due to those tables might be used in early boot time, for early
> > exception handling and early debugging. I'm not familiar with that.
> 
> I meant at link time, run both sorts concurrently such that we only have
> to wait for the longest, instead of the sum of them.
> 
> They're not changing the same part of the ELF file, so it should be
> possible to have one tool have multiple threads, each sorting a
> different table.
> 
> Aside from the .ex_table and ORC there's also .jump_table that wants
> sorting (see jump_label_sort_entries()).

Oh, and I'll be adding .static_call_sites soon, see:

  https://lkml.kernel.org/r/20191007082708.013939311@infradead.org

(I should repost that)

That gives us 4 tables to sort which we can do concurrently in 4
threads.

> I agree that doing it at link time makes sense, I just hate to do all
> this sorting in sequence and blowing up the link time. I don't build for
> customers, I build for single use boot and linking _SUCKS_.
