Return-Path: <linux-kbuild+bounces-12468-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAAoB1TrzGk/XwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12468-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 11:54:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EED3780D6
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 11:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C1B7303F0A4
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 09:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9AF3CB2CF;
	Wed,  1 Apr 2026 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cOhq5+xc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E39C3BAD89;
	Wed,  1 Apr 2026 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036315; cv=none; b=JnwfpmX4fErUfrucASC5FjtJ9lm7+Thr0QyCSWImjqIiEwZGFLvNc+j2AcisybLEELoxw5YU23VDJN7h3IVgDmb7MVVHLDuE+4AibQ2BhI/11DzB4VkpFGOElkIfbgdcjtHRXwJfZ4D5gipJ7f5vawvxxgXLJH8L5mMTbWgzKRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036315; c=relaxed/simple;
	bh=S5UG8dJ7Ck4Vf/JeKcjjHBUeBzp8hqY3Luo1ezTn8r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIekebq8AoP2FkRmULISs+fDcOyCOrUJSMANa0BowUJCEhk/cv823Aux+9ZDZWzV2xd6ew2FuEoD+wMBTb4HkMHJ/Bppad1+P2Q0zS3pfzTyt361fm+6R+H0NDoD06eKSMn3nj6a2nne12QedVkesZPqcd1N4Xfa2I9E+rE33mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cOhq5+xc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m3TISuomgoe0SUdyDD+xWo6RRl4JcWzzeqjoC2TU2Lk=; b=cOhq5+xc28XN5RXGUt8q+tDp41
	Z+Nl0I2QfNhsFUJSfArRTil+zjOK7CToBs4x75Ae6nzazDnyiXMuoT/BNedZ0ZyibtSTjWh4Vx3o7
	V+SL0PwFr048uWkhBoVE3HWhpidavI14kQ48rnP5sQdvMRwG7/1YTIHFVO9cQAFYfUWGh+6nuCrVz
	JqtyY7ZaDFx9d+i7vcVS4PYKj2YGV9KS+y0KMU6iKNmMiAlI3saus5gyqMUZ5C4XckDX/4dIVVyp+
	WuftGc+5k/Gfx+PRbavzDtxarwgaW0xK/QWK8/QJjTmYyRu2iV5aalcmecrF3QbNfr46ebupefWWA
	AzeZIj7A==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7s1r-0000000A8qA-0g1E;
	Wed, 01 Apr 2026 09:38:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B36763032E1; Wed, 01 Apr 2026 11:38:20 +0200 (CEST)
Date: Wed, 1 Apr 2026 11:38:20 +0200
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
Message-ID: <20260401093820.GX3738786@noisy.programming.kicks-ass.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12468-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,noisy.programming.kicks-ass.net:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: 47EED3780D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 01:31:16PM -0700, Kees Cook wrote:

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
> 
> (Isn't this just an implicit "try"?)

So I like this implicit try with a default label, and mostly I expect
this will be fine.

But as Linus already mentioned, sometimes you might want more. Could we
perhaps also have an explicit version, something along the lines of:

int func()
{
	int __ob_trap size;

	size = try(count * flex_size, __mul_overflow);
	size = try(size + base_size, __add_overflow);

	obj = kzalloc(size,...);

}

where we have something like:

#define try(stmt, _label) ({		\
	__label __overflow; 		\
	if (0) {			\
__overflow:				\
		goto _label;		\
	}				\
	stmt; })

That is, have the overflow trapped and confined in the
statement-expression by using the overflow label as a local label and
use this little trampoline to re-direct to a custom label.



