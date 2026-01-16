Return-Path: <linux-kbuild+bounces-10605-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4539D2E1CA
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 09:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44AFA30204AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 08:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8045E304BB3;
	Fri, 16 Jan 2026 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N8U/kReR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B42F5A12;
	Fri, 16 Jan 2026 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552574; cv=none; b=RkDubVO+WEK3ordyLXlnvvNx8wc1CjkR8Pr6nQJyFtKLiIHdiV8Ll9F2YCGRLsWB2YCGqK/1MmVCrJcM4lTHBpMB0AzlFrE3IR2bo5wquHq90QGlIhWUmQccKqcUyXAQRKnwF9IYULd2szwV4E76vbspIx7/FiDXFiu3Lrhq+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552574; c=relaxed/simple;
	bh=PWMQNk6NsIaOJqlFsxr4gNfT8QvXI57DAFFtAqQpGKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdY7ZvdqygTCaeGHubxOye5H1G51/WeQuXkGDM3ct3jVUhbRA2JOHqKE/g4Chm9jfAUwNOhCDJzm5wdcuWZ0OZqoozMqCWLkvo3tVoDRLNOsmxCjJB2VE0xhi5Yfd9FAN0CAFpiPnFe5JHd/h1by+h1Ii6jUHF/lHiUcZA+8eJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N8U/kReR; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1DJLxs4y7O5J7ezC63DvSZ7vqsn7u/tUV4Hm+64XqVM=; b=N8U/kReRTO4lGC3XxnL8rlXKG7
	Aqnw625jS4q44Y5Fd/nxaYph+/+kveAmY/Bc4bWmENyxClRwJ7wWAooADgDckV/F3G/iMKYXLl+Z6
	+FIBI4x8o5fFPaXiA9NrW/cMm3Q/p65D4ty4rudbCXjQzKWtZBe5yvqx3e3dNUlMlWVUkngrvr+T8
	1G5FImw+EYBiLMlXjuxV/0fGMHSdb6CvEv8BnLKU8ymZMRyffQC50AJk3e1JJLJip0GXzb6J8ata/
	xumVi0uNd9HwF5LfCgAZThAiQe0SNaieUe4DsdRzW2aft4JxW0DnbtaKGn1d73ysGCOAfAp2Bn9WC
	WTZMinRQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfJM-00000008IvF-1t4L;
	Fri, 16 Jan 2026 08:36:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1467E30065D; Fri, 16 Jan 2026 09:36:04 +0100 (CET)
Date: Fri, 16 Jan 2026 09:36:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Bill Wendling <morbo@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Marc Herbert <Marc.Herbert@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brian Gerst <brgerst@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __counted_by_ptr macro
Message-ID: <20260116083604.GJ830755@noisy.programming.kicks-ass.net>
References: <20251121195504.1661783-1-morbo@google.com>
 <20260114193716.1740684-1-morbo@google.com>
 <202601141956.A798BFF@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601141956.A798BFF@keescook>

On Wed, Jan 14, 2026 at 08:00:54PM -0800, Kees Cook wrote:
> On Wed, Jan 14, 2026 at 07:36:47PM +0000, Bill Wendling wrote:
> > Introduce __counted_by_ptr(), which works like __counted_by(), but for
> > pointer struct members.
> > 
> > struct foo {
> > 	int a, b, c;
> > 	char *buffer __counted_by_ptr(bytes);
> > 	short nr_bars;
> > 	struct bar *bars __counted_by_ptr(nr_bars);
> > 	size_t bytes;
> > };
> > 
> > Because "counted_by" can only be applied to pointer members in very
> > recent compiler versions, its application ends up needing to be distinct
> > from flexibe array "counted_by" annotations, hence a separate macro.
> > 
> > Note that Clang's support for "void *" members will be in version 22.
> > So, when using Clang, you'll need to wait until its release before using
> > the feature with "void *". No such restriction applies to GCC's version
> > 16.
> 
> I think to keep operational parity, we should limit counted_ptr on Clang
> to version 22 then, otherwise we'll have problems using it on void *.

Ooh, you got that fixed! Nice!

