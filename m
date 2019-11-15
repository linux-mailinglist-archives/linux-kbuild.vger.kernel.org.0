Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89731FDB72
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 11:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfKOKdu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 05:33:50 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60518 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfKOKdu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 05:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BQq4rfhZ/qkZrjGi9VrRkJjPTU3IQASdxtk+py8db0M=; b=GmWz2UJQfoWTfLRQgXnDZvK+D
        /bs80r9tjbY+/kCYcNsBmynTY3nzHl4LwSn/tKhnlJowKEWUJBn4kDT/B5x+cBVf44PHMQaqXPbUY
        NEL5MZLwm6m8ByKuq9/K7MRpEbQU8tnkQpEaqZwPF0bNajkdwNcl69p8t2ISEkpHCDkFraGqZ5b9c
        T87fCO8b9dZuXNBr/Y6P0UdHxpGs85fbRzrU/GjGkIFzzyMXqB2uwClJCxwc+5MgfxyHVshPH9LCW
        FVC5aZuaSOomFoV56E4ak3eK7j/MOLQRbgefbN3y7zas1GJvJrf1Ukf8ty8negsSo4SYym/cE85oE
        a2dlz4r5w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iVYv5-0005ss-3g; Fri, 15 Nov 2019 10:33:39 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1412F303D9F;
        Fri, 15 Nov 2019 11:32:28 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2622D2B128BE8; Fri, 15 Nov 2019 11:33:36 +0100 (CET)
Date:   Fri, 15 Nov 2019 11:33:36 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v3 6/7] scripts/sorttable: Add ORC unwind tables sort
 concurrently
Message-ID: <20191115103336.GD4131@hirez.programming.kicks-ass.net>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
 <20191115090723.GS4114@hirez.programming.kicks-ass.net>
 <9594afbc-52bc-5ae7-4a19-8fc4b36a1abd@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9594afbc-52bc-5ae7-4a19-8fc4b36a1abd@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 05:43:49PM +0800, Shile Zhang wrote:
> On 2019/11/15 17:07, Peter Zijlstra wrote:
> > On Fri, Nov 15, 2019 at 02:47:49PM +0800, Shile Zhang wrote:

> > > +/**
> > > + * sort - sort an array of elements
> > > + * @base: pointer to data to sort
> > > + * @num: number of elements
> > > + * @size: size of each element
> > > + * @cmp_func: pointer to comparison function
> > > + * @swap_func: pointer to swap function
> > > + *
> > > + * This function does a heapsort on the given array. You may provide a
> > > + * swap_func function optimized to your element type.
> > > + *
> > > + * Sorting time is O(n log n) both on average and worst-case. While
> > > + * qsort is about 20% faster on average, it suffers from exploitable
> > > + * O(n*n) worst-case behavior and extra memory requirements that make
> > > + * it less suitable for kernel use.
> > > + *
> > > + * This code token out of /lib/sort.c.
> > > + */
> > > +static void sort(void *base, size_t num, size_t size,
> > > +	  int (*cmp_func)(const void *, const void *),
> > > +	  void (*swap_func)(void *, void *, int size))
> > > +{

> > > +}

> > Do we really need to copy the heapsort implementation? That is, why not
> > use libc's qsort() ? This is userspace after all.
> 
> Yes, I think qsort is better choice than copy-paste here. But qsort does not
> support customized swap func, which is needed for ORC unwind swap two tables
> together.
> I think it's hard to do with qsort, so I used sort same with original orc
> unwind table sort.

Urgh, you're right. That's unforunate.
