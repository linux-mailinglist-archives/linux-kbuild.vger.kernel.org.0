Return-Path: <linux-kbuild+bounces-8579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6BB3468B
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 17:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E50FD4E1AFA
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 15:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912992FE59A;
	Mon, 25 Aug 2025 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k3cgl2Ye"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06B62FE58F;
	Mon, 25 Aug 2025 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756137573; cv=none; b=sTV56EnzfAQP8zeCASQyIrOJTa1U/1JBE67COjlluFo5ta6fUCYH7anflzdaEqrx/HDYbXifBgrlhwp6PhM0u0EsP9NOobSFpprvI0lAlf6kU5McDW4AplC1+NQEX2g9HF9zxevl6DOZ32G6kW9fmAJVEwDdg9EGo38TZ/lB7FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756137573; c=relaxed/simple;
	bh=bQU5x1auMmGx0XG0xYYeyF+2z8gTrjrL5OF2jGIWL1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzaoIAPdoTWFTeqzP40AzfEna7uFt69p6SwLtHROZA5I1wb7VKGY91dXajnDpTiBrtOPsjYN2zVdxd8XnkCdu3JtCthMAqYLB29o8HPHjb/8W3J3057a+Gy5NV9P5Ca5tKmiTToAVZsE3FytZhXapjsQ1Vb3Y6ll+9nRIMeqW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=k3cgl2Ye; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LfZRCUjbcZcYfJqQ1pyJA0w5HiW+vn44jB/PfWRNK2k=; b=k3cgl2Ye2NFhvxXwnrIKo2obgZ
	YlshUQn8PUtAXokUJ2ZeTDTPX1OZB1rL8KKakzcvLH/Ivt8xBTjkrejp7H1KnJf+B0BdzWkHCWeJ/
	hAIHn4fFab6r96A1ITuIHkWRZtJ47iJjqWR+r86xDKFbD1LiJgNG8nTQQvjR/FarVfJjT4KtZrF0U
	/Uqh2pskwapUBZlgpMf4qdNwywYbfAUeSlxFOxy6TM0ZvGOpXaT616hl1VLiSmVZfEitIrqD7j7EE
	L82v3vzVcfZ5sV36P6TVRm/pPrZstYaD0ccOhUx7s8HWnu58N9+b9UASsFh0KGcot30oKrYVptwJu
	QoVk4hkw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZbP-000000004sA-3EoW;
	Mon, 25 Aug 2025 15:59:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 535D23002ED; Mon, 25 Aug 2025 17:59:23 +0200 (CEST)
Date: Mon, 25 Aug 2025 17:59:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Kees Cook <kees@outflux.net>, Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <20250825155923.GY3245006@noisy.programming.kicks-ass.net>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825142603.1907143-3-kees@kernel.org>

On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:


> +	if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)

You could just make that cfi_debug and add:

	if (builtin)
		cfi_debug = false;

at the very end of __apply_fineibt().

