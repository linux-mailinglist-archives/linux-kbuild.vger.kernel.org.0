Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072A6FD862
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 10:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfKOJHn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 04:07:43 -0500
Received: from merlin.infradead.org ([205.233.59.134]:58230 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOJHn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 04:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Wywu5hu/w55f41qJ3KYVl1DQLx0MMhrbVYtcMb7LQiU=; b=JWRjfXgpPe6mraasyPv85Cjqn
        JaxLy+jW5A0DomqL9rwK1XYh3zaMv41Aba5AOFAijR84ffzJlP1U9rkH3XBBFAT1UfAjU4vBYLv18
        3zrmPWrqyA+zJcXIxPXpw2LznWr5vG4orDqm81t+MXBevKEI3PpOcdeLx7aAD+xfiKdMHaIgGVo1j
        d1MfTT9OJl2Q8GvqGdHguyOHBYuUq+7Ta+m8/2I2wXwoIJSmd9h/m8jnQJxR5rhMowtI6AfPWyH60
        OlGSU9b9hXiZ4IF02OF9e9fYITev46N50c3IElq0NQyJAqnvMwxE9qYWAWjJQu5q+JX/gbCbeSQ1O
        uIbNewhmw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iVXZe-000558-Pg; Fri, 15 Nov 2019 09:07:26 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8A9C1303DDD;
        Fri, 15 Nov 2019 10:06:15 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 96C1F29E4EBA3; Fri, 15 Nov 2019 10:07:23 +0100 (CET)
Date:   Fri, 15 Nov 2019 10:07:23 +0100
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
Message-ID: <20191115090723.GS4114@hirez.programming.kicks-ass.net>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 02:47:49PM +0800, Shile Zhang wrote:

> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
> +/* ORC unwinder only support X86_64 */
> +#include <errno.h>
> +#include <pthread.h>
> +#include <linux/types.h>
> +
> +#define ORC_REG_UNDEFINED	0
> +#define ERRSTRING_MAXSZ		256
> +
> +struct orc_entry {
> +	s16		sp_offset;
> +	s16		bp_offset;
> +	unsigned	sp_reg:4;
> +	unsigned	bp_reg:4;
> +	unsigned	type:2;
> +	unsigned	end:1;
> +} __attribute__((packed));
> +
> +struct orctable_info {
> +	size_t	orc_size;
> +	size_t	orc_ip_size;
> +} orctable;

There's ./arch/x86/include/asm/orc_types.h for this. Please don't
duplicate. objtool uses that same header.

> +/**
> + * sort - sort an array of elements
> + * @base: pointer to data to sort
> + * @num: number of elements
> + * @size: size of each element
> + * @cmp_func: pointer to comparison function
> + * @swap_func: pointer to swap function
> + *
> + * This function does a heapsort on the given array. You may provide a
> + * swap_func function optimized to your element type.
> + *
> + * Sorting time is O(n log n) both on average and worst-case. While
> + * qsort is about 20% faster on average, it suffers from exploitable
> + * O(n*n) worst-case behavior and extra memory requirements that make
> + * it less suitable for kernel use.
> + *
> + * This code token out of /lib/sort.c.
> + */
> +static void sort(void *base, size_t num, size_t size,
> +	  int (*cmp_func)(const void *, const void *),
> +	  void (*swap_func)(void *, void *, int size))
> +{
> +	/* pre-scale counters for performance */
> +	int i = (num/2 - 1) * size, n = num * size, c, r;
> +
> +	/* heapify */
> +	for ( ; i >= 0; i -= size) {
> +		for (r = i; r * 2 + size < n; r  = c) {
> +			c = r * 2 + size;
> +			if (c < n - size &&
> +					cmp_func(base + c, base + c + size) < 0)
> +				c += size;
> +			if (cmp_func(base + r, base + c) >= 0)
> +				break;
> +			swap_func(base + r, base + c, size);
> +		}
> +	}
> +
> +	/* sort */
> +	for (i = n - size; i > 0; i -= size) {
> +		swap_func(base, base + i, size);
> +		for (r = 0; r * 2 + size < i; r = c) {
> +			c = r * 2 + size;
> +			if (c < i - size &&
> +					cmp_func(base + c, base + c + size) < 0)
> +				c += size;
> +			if (cmp_func(base + r, base + c) >= 0)
> +				break;
> +			swap_func(base + r, base + c, size);
> +		}
> +	}
> +}

Do we really need to copy the heapsort implementation? That is, why not
use libc's qsort() ? This is userspace after all.
