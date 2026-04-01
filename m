Return-Path: <linux-kbuild+bounces-12554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKupKASRzWklfAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12554-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 23:41:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A3789380A7B
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 23:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9583301CA8F
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 21:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E97138B7A7;
	Wed,  1 Apr 2026 21:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjZ4krda"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AD133C507;
	Wed,  1 Apr 2026 21:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775079662; cv=none; b=F0TkNseV/v8G6mmjFfbWkPxCkWBbMcQAII2dALYjuQXIv4x1Av9Jo0OTEqMscApYC/XuiHSUClltxsbcefMXYVYo5h8mqPxzaksQE/P1QAa8UVUnKn42EY2Mjx+2+5qV/yS6md2JJnJugv9/n1v7wzvBPpvN4WTuokKMfIltuwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775079662; c=relaxed/simple;
	bh=pDwgJl6Fh9R0ESyyzZwZ3nyL/1KbhhNvMwGXe/yD3k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOoPOhbCBewe5mpVrDQi/YbJu8znlTnrq6G7uJzKaw1iCcZFnhxuNNNRZH8D5fSUBhAC+khSYqb3mdQWtvTjqL0ZIsEyj6Hnw6PSij66JjyfFGf9JA/704BYiil3Dc/5wCAHqTYoEGbizJlH7MRC+hRvZwU0aKchdi/nNMdEaKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjZ4krda; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78247C4CEF7;
	Wed,  1 Apr 2026 21:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775079661;
	bh=pDwgJl6Fh9R0ESyyzZwZ3nyL/1KbhhNvMwGXe/yD3k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjZ4krdarwjCTk3lcfRgblqKEGSYvMlE4Ub7PB8ZhtVDNHJU53EvsLHOqIa783mjS
	 uh1Ye5ifYSc+2lJDlHDbyCO1JC4udIlqGMyo95ZakDYbnYiWtqS5FyW0hIoidj/qen
	 euu68aHI4r+tt1y/ZW63ZJiZ4im12Cq7kvxhAeaFT0Bk5vG9kUopONhOl2i1Kl7x1K
	 SYxvvMSN1EGRjhFwvZ4L++cQMIxATWc83jCSm1elVC3UFuAoMNGQ+Sdm/JZuUkYqkC
	 NLdK0LTq7V2d5cfKjTF3ejhgpUSuPge2iqLHnRnctbC7k57HMb0LIt8rHdrO17qxgq
	 hi+/R+7AcOy4Q==
Date: Wed, 1 Apr 2026 14:41:00 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <202604011438.E5D2335@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook>
 <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook>
 <20260401093820.GX3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401093820.GX3738786@noisy.programming.kicks-ass.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12554-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3789380A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 11:38:20AM +0200, Peter Zijlstra wrote:
> On Tue, Mar 31, 2026 at 01:31:16PM -0700, Kees Cook wrote:
> 
> > int func()
> > {
> > 	...
> > 	u8 __ob_trap product = 5;
> > 	...
> > 	product = a * b; // if store is truncated, goto __overflow
> > 	...
> > 	return product;
> > 
> > __overflow:
> > 	pr_info("%u\n", product); // shows "5"
> > 	return -1;
> > }
> > 
> > (Isn't this just an implicit "try"?)
> 
> So I like this implicit try with a default label, and mostly I expect
> this will be fine.
> 
> But as Linus already mentioned, sometimes you might want more. Could we
> perhaps also have an explicit version, something along the lines of:
> 
> int func()
> {
> 	int __ob_trap size;
> 
> 	size = try(count * flex_size, __mul_overflow);
> 	size = try(size + base_size, __add_overflow);
> 
> 	obj = kzalloc(size,...);
> 
> }
> 
> where we have something like:
> 
> #define try(stmt, _label) ({		\
> 	__label __overflow; 		\
> 	if (0) {			\
> __overflow:				\
> 		goto _label;		\
> 	}				\
> 	stmt; })
> 
> That is, have the overflow trapped and confined in the
> statement-expression by using the overflow label as a local label and
> use this little trampoline to re-direct to a custom label.

Yeah, that should work, and gives us a nice way to create handler
overrides. We've have to make sure the "locally defined" labels (with
__label__) and __ob_trap worked together sanely.

-- 
Kees Cook

