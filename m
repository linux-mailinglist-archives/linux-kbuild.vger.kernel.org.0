Return-Path: <linux-kbuild+bounces-12442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJRfGJ0pzGkmQgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12442-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:07:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF1370FEE
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7A1D3053658
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E248A3A3E9A;
	Tue, 31 Mar 2026 20:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1BcSPj5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8DB371D19;
	Tue, 31 Mar 2026 20:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987386; cv=none; b=bhhYkfYrIAZUIKOxelBfTgsvET+3ZlWzkUR/RpMw1SF9SV7hbe8LCbB2PETKB1pXi9X82j63p8WVmoYeSJWBPOK55xMDQSpfuEyksW3bT+Vvtzy/XoA3GzQrFdCdRmU+cr2uL/508rRlS3oKoDMzpF6xcG7LnGCzJ7Q9Y67aH/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987386; c=relaxed/simple;
	bh=xX8PflvEnLDxFDAe0II3o/hEoXyXPKqwR8t9T1TR67Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJVJ+OEPsdzxY2e1t1xkyZugb/nYddvFdbUMXnGsV/Gz1teMj9+gI+bwpXcqjNFb7GtnBy934ZSu8iR8QUjIuCf+nPxZUdzNc1aobCrqYELQ4DPXk4i99r+Y6M/9QcygSTf25OuJ1OE11IljEjWfdaXXsZR8usEnTmVNgoQBKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1BcSPj5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516D3C19423;
	Tue, 31 Mar 2026 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774987386;
	bh=xX8PflvEnLDxFDAe0II3o/hEoXyXPKqwR8t9T1TR67Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1BcSPj5ocGNquHbNBcvPqVWwQhuyXmi8e80E9Ub+5yWjYcKcXY1aG/MuvcL1sI19
	 9tFJZqy9iOG60YiRZ4NmN8AHHGD+UqeRFaO5bQVLQdaTvcXuBpTfa+NCJnOr7b03ih
	 kvfgz9f/dMi1hdjpVxdEdYduOy6rsQjnH/3WijBKukwHXSb8+jly/9k4D05eplapL1
	 eG9ZQTmR5/u0ZUkKvZ4D8beVsasHNlfvvuWuHjADxY3tF3UmlwnsxgVdUSW1/e7Dxb
	 CvMXSDzTZ4B7jm/AQSBfQlt9LWpbBRuaJKzb/comSFOXODi3rU/SOjuakOXCJCZu3Y
	 kX3af3qFmhWww==
Date: Tue, 31 Mar 2026 13:03:05 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <202603311253.95C54588E@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12442-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2FF1370FEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 10:10:52AM -0700, Linus Torvalds wrote:
> On Tue, 31 Mar 2026 at 09:37, Kees Cook <kees@kernel.org> wrote:
> >
> > Current straw-man proposal is single letter suffix because it vaguely
> > felt like the least bad of all choices, and they should be short or
> > everyone will just continue to type "int". :)
> [...]
> If somebody starts using explicitly trapping types, they need to say
> so. Not just *say* so, but scream it at the top of their lungs. No
> hidden subtle behavior changes. This needs to look _very_different_.
> 
> No stupid one-character things. If we go down this path it would need
> to be "wrapping_u32" or whatever.

Yeah, that's fine. I'm fine calling these types whatever we want
(regardless of how we ultimately bolt exception handling to them).

The only reason I had this proposal using a short forms was to make
it "easy" to get counters/indexes/iterators with as few characters as
possible. It all comes back to my "favorite" security flaw where a u8
counter wrapped during post-increment in a while loop. Why was it "u8"?
No good reason besides "it was even less to type than 'int'" AFAICT. :P

> I don't actually see any sane interface. The "unsafe_get_user()" thing
> with actual labels and exception tables works very well, but it would
> require wrapping all trapping operations in a macro.

Mark Rutland had strong reservations about function-level annotations,
but I wonder if the combination of new type _and_ function-level
annotation could get us something near what would be palatable:


int __overflow_label(boom)
something(...)
{
	u8 __ob_trap count;
	...
	take_locks();
	...
	while (thing())
		count++;
	destroy_the_world_if_count_wraps(count);
	...
	return 0;

boom:
	unlock_and_clean_up(...);
	return -EINVAL;
}


This way not _all_ math is covered by the label, only the trapping math.

Or we could make the label a global part of the language itself so it
wouldn't need to be a function annotation, but rather a _required_
element of any function that uses a trapping type?

-Kees

-- 
Kees Cook

