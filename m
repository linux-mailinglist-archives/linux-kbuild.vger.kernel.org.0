Return-Path: <linux-kbuild+bounces-12464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDZhKvbYzGnnWwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12464-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 10:36:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70624376E9A
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 10:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A12F305AD78
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 08:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D153AE189;
	Wed,  1 Apr 2026 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XlWtHq93"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A3B38AC99;
	Wed,  1 Apr 2026 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032313; cv=none; b=D6lv9MxFn76dDyIppJVhb9oyN7F1v6b79S2xqqslot3Rb9Utc3H5uHPzpdjUpOnn7su/m6NyhB65oa4pokEuGadj42UmcPWCYtRm738dwZye+hmp2kpk4b+cubqTEprjP0Glr5ifx/lD2RTDQpOvrXmQHuuogPPrQlqxSbREkbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032313; c=relaxed/simple;
	bh=7a44slUpgCLOzBlar2fCsvCpO3HYMlbpOWn8sctsPaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRaXtAcsN47DSvUdChLClB0kSbVQRSseVjETw3uQ4Q9zKpBrW4jDfV70qHiZ2GP6j+wwfIf2iDmSVoa6mg1jOPkwZIwi6r63WAJ6FlflkgS8SoO1F0m7njMyBMiyXdB46B1pN5KXmpLDCDnNIogWBkxvzLKqCPuBhz4b/J57XLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XlWtHq93; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uRLsprxGCyRJMqJHcEPb7n5b3dlx4z0erNrsn6GquF8=; b=XlWtHq93MIrwpCRR7h926GNdco
	CrN1RpPrGIRpaURSoDMtd+iBK4GOA0NWxuc10D5ogR79EXSfw0Gl69VdFIVlqIxZftEMUjSKTMTpQ
	5l3rPEGx7ZGdWlXuhkcXOIWxKkVN3bVOjvpJ8eQrs+F0RYeKM/1L3gDNp4BXi7HT2Til7BCir0xbx
	75jvGLCSn92QtjMRmGdvvkLYIPgc/zTzPc+WKu87Eq69z41hZrI8MtOXk2haLqxEPv5SwSgac4GyU
	cQVHuIeVP0hIIo/iy3FcqWrHmKZPN8LubxhRlpt5iQ0CJu+4NoN74/lruSO9GMt38lF6pqj65purM
	gsv3a8Dw==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qzH-0000000A3p0-3oHE;
	Wed, 01 Apr 2026 08:31:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B80E83032D1; Wed, 01 Apr 2026 10:31:37 +0200 (CEST)
Date: Wed, 1 Apr 2026 10:31:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Finn Thain <fthain@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	llvm@lists.linux.dev, Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nsc@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar
 types
Message-ID: <20260401083137.GT3738786@noisy.programming.kicks-ass.net>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook>
 <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603311321.4EE9FEA@keescook>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12464-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 70624376E9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 01:31:16PM -0700, Kees Cook wrote:

(still slowly digesting the thread)

> Yeah, as you mentioned earlier, I'd agree that nesting is rarely
> useful. The only thing I'd want to be careful about is ordering/scope. I
> *think* it would just operate as a "goto" and things like the cleanup.h
> handlers wouldn't be involved: they operate when a scope is crossed
> like before. And I think the overflow result wouldn't be represented
> anywhere. i.e. the wrapped/truncated value wouldn't be stored:
> 
> int func()
> {
> 	...
> 	u8 __ob_trap product = 5;
> 	...
> 	product = a * b; // if store is truncated, goto __overflow
> 	...
> 	return product;
> 
> __overflow:
> 	pr_info("%u\n", product); // shows "5"
> 	return -1;
> }

Note that there is a 'fun' problem with this in combination with
cleanup.h.

Something like:

int func()
{
	u8 __ob_trap prod = 0;

	scoped_guard (mutex, &my_lock) {
		prod = a * b;
	}

	return prod;

__overflow:
	// whatever
	return -1;
}

is fine. *HOWEVER*, something like:

int func()
{
	int __ob_trap size = base + count * extra;
	int err;

	struct my_obj *obj __cleanup(kfree) = kzalloc(size, GFP_KERNEL);

	err = my_obj_init(obj);
	if (err)
		return ERR_PTR(err);

	return_ptr(obj);

__overflow:
	// what now..
	return NULL;
}

is most terribly broken. Specifically, the goto will jump into the scope
of obj -- and that is not allowed.



