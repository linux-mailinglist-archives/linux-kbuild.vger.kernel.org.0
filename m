Return-Path: <linux-kbuild+bounces-12437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JB3IWAUzGmGOAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12437-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:37:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A18370120
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05CCE3007E26
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F0738425B;
	Tue, 31 Mar 2026 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJLR11sI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459003803FC;
	Tue, 31 Mar 2026 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981921; cv=none; b=A/AwNi9naoAKO1h0ZN2x45la5ddZ42cmKPPrAaQFlX/uSlaX7q6gy6bo90CAsb5KxSykJElu5Qb7DM/8uUjfhA9ItBRvYcftKAEF+X+JDhlTlo8g+niBO0my+vy5vvaAkrD0J1VXHIFHIHX22ZP/sGoadFCd+qaEN2rl3Af6pLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981921; c=relaxed/simple;
	bh=A2t9VhjuxMDE/XMt5PYCBejiat0YUkyfDYUPy8IkQRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds5dbn1p4rDS1vBFcq5MB+ich2/XbjauRy5zFgHSWTm8NOm4/6VVjLMBkyhKLOF9T0vx1uzo7cbd2v6u23C0DWIpH6F7ZCd7TssdRMMcHj4qWNtuwC+2Fqy+bPUAk48Hxalti5pINppH+eos+48gK3ya99rAIB+c5Qtf2O76pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJLR11sI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC90DC19423;
	Tue, 31 Mar 2026 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774981920;
	bh=A2t9VhjuxMDE/XMt5PYCBejiat0YUkyfDYUPy8IkQRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJLR11sIrG+3ZA6DcWQvu5/96VaRX7/phSI67+CYerRFyZa2SDEwcR3llwEvLjI+f
	 wCBcvN0O13jOXpruGlDDUVl6AD1+56DzDiVt32rchEALYDE0mOWsfyNu70xlfEpcnB
	 3iPR5oX6YPHpKPlfkyR05pjVgxL32J/oW7l0hJsV3rvCMduoN4WIITGpmSZuY5QVAy
	 KS0YzxfGnlpa97ewzMIP1s0aMjMCFGX4gyyjsfTCYmR7fXByYpveEkEzjRNv2Xh+/u
	 RMUz3b0iHnRY4NPIuGFp0mF5qCTE6OiM7RSmezbtDi54n3qlnr4vD+PJ1CnNM/x+BT
	 j1u23wH7OpbJw==
Date: Tue, 31 Mar 2026 11:32:00 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <202603311117.454F578@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
 <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12437-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,infradead.org,google.com,kernel.org,linux-foundation.org,linux.intel.com,arndb.de,arm.com,linux-m68k.org,glider.be,linutronix.de,lists.linux.dev,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2A18370120
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:02:03AM -0700, Linus Torvalds wrote:
> On Tue, 31 Mar 2026 at 10:48, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > In the Rust side, even if those "explicit" types like the
> > `wrapping_u32` you suggest exist, we generally use the methods on the
> > normal integers instead, e.g.
> 
> In that case the types in question should always be very much opaque,
> and not usable as-is by existing compilers that don't have attributes.
> 
> My feeling is that that will discourage use enormously for when people
> want to just say "yes, I know this wraps, and it's ok".
> 
> That said, for the *trapping* types, I do think that we likely need an
> opaque type, because I really feel like using
> 
>    trapping_u32 x;
>    ...
>    x++;
> 
> is a complete and utter mis-design. It makes the "x++' have random behavior that
> 
>  (a) cannot be recovered from (maybe we're holding random locks)
> 
>  (b) is completely invisible in the context of the code, because the
> type may be somewhere very different
> 
> and I think both of those are fundamental design mistakes.

This design is specifically what Peter was requesting, and what actually
integrates with C. I agree with you that the core problem is "cannot be
recovered from", but that misses the point of these types. The point is
that all of their uses are _supposed_ to have been written in a way that
no overflow is possible (just like all the other types). But this is
the problem: bugs keep happening, no matter what people try to do. And
in fact, to support these kinds of in-code overflow checking, there are
even idiom exclusions for these types (based on what you pointed out in
the original RFC) to allow for things like:

	if (var + offset < var) { ... }

If the code was written perfectly, then there's no problem. If there was
a bug that allows for overflow then you get a crash instead of totally
insane behavior that is almost always exploitable in a way that the
system gets compromised. That is a net benefit, even if crashes are
still bad.

The point is to make a type that still works with C and all the associated
APIs (e.g. format strings, native arithmetic, etc) without creating the
mess that Jakub, Peter, and others (correctly) balked at around accessors
for doing function based math.

> So I think wrapping and trapping are fundamentally very different. The
> words may look the same. The semantics may often be discussed
> together. But one is explicitly marking something as "overflow is safe
> and expected", and that's the actual real SAFE case.

Right. Mixing the term "safe" between these is certainly a mistake in
the documentation. We can fix all of that.

> The other is saying "overflow needs special handling". And the key
> here is that we need to have some way to *state* what said special
> handling is, and we need to do it at the point where that special
> handling is needed. Not some generic exception handler that has to
> figure things out from some unknown context.

The generic exception handler, right now, is the distant back-stop to
catch exceptional cases that nothing else was written to catch. Like
uncorrectable RAM errors. Using a trapping type isn't there for people
to _intend_ to crash the system. :)

But, yes, I agree that having a way to require in-place overflow
management would be the perfect solution, but no one seems to be able to
agree on it. The trouble with C arithmetic is that the overflow state is
"hidden". It's like the remainder from division: math statements need an
overflow case built in, almost like a ?:, but from a syntax perspective,
there's not been anything that stuck. The state of the art in C is
"make sure you test for overflow manually first", and these types allow
for that.

-Kees

-- 
Kees Cook

