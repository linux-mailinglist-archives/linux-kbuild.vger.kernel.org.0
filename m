Return-Path: <linux-kbuild+bounces-12439-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDIOFcEZzGnHPgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12439-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:00:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A74103704DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB923301A385
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF313A0E84;
	Tue, 31 Mar 2026 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBHUdc0h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758092FD7D3;
	Tue, 31 Mar 2026 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983564; cv=none; b=l6hEi88h1S4FFkDhDnY7xnSOOglCpseEwKFO5Xl4NRo0G2aoay0e9opxWCdLqNLmQzmM3cwJ0ixNuOfFrnVDdgB/QOSDdZMQNR60TFvKIi7wv99CM7zW2J8f149QoeuUtDkTiVh/o+cTd511iFUZTjy5IqQmWAdYQ/trCDExgdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983564; c=relaxed/simple;
	bh=/LcFsAPWr4vpR7F0s+PhS8Ug1TtQHOIiG1TmD9cEq8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zreba6QXhiMkaSRHbXihVsQbpiwpztIvN6rXwl7gI4PBa/rPSxOkGcoRIn5TZhHWCH7swj+XzRlATxiizNKbkBSN30cS25gfeQvRE4E0vxIGOMx7ydM4jyq4fJ1HVRPWJ5uYkULAwziy/LTyeO9E4PKgHFNzKpGsvm6zHb1NkG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBHUdc0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A616C19423;
	Tue, 31 Mar 2026 18:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774983564;
	bh=/LcFsAPWr4vpR7F0s+PhS8Ug1TtQHOIiG1TmD9cEq8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBHUdc0hKQTF+V47GObNWJvkfUXJ99HyfWKY/m2zPASDSNrKk/r4vKy3U+TWDYoyb
	 L41KstOQwhjmWH0PDH4ch6IZuoHxSTehxI3mo49/GaUL8vyl9BLd7cI7oOqmbbyLZw
	 VYESz5NX857M4RZATPDthfn9tB+FfAAGG3uBc3nqrXyGfe/Ticjp2JzEBQUk4ea0j/
	 B5zCmHurEz6AJbGAvfGWem48EKB9NNpE9iL4UJZ0zlylalFIIVMhdoPxfswyncvBnd
	 3iUboU/7bKhB3eeGNozov4jE6RtbUZCktwjOdaEor7lsPORc7r7Vxq7X02SguhgJ2+
	 H9/jwm4UIHEhg==
Date: Tue, 31 Mar 2026 11:59:23 -0700
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
Message-ID: <202603311155.503B3DA5B@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
 <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
 <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-12439-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: A74103704DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:25:20AM -0700, Linus Torvalds wrote:
> If you want to use the overflow builtins (or our wrappers aorund
> them), you can't just do the math. You have to do crazy crap like
> 
>      int end;
>      if (check_add_overflow(start, len, &end))
>         ... handle overflow ...
>      do_something(start, end);
> 
> which obviously no sane person will do, when they can just write
> 
>    do_something(start, start+len);
> [...]
> So I think overflow handling should do the same. Instead of the bad
> "check_sub_overflow()" model we have now, we should have
> 
>      res = add_overflow(a,b,label);
> 
> and now you can use a trapping operation *without* having to break the
> normal flow of code, ie you can do
> 
>       do_something(start, add_overflow(start, len, overflow))
>       ...
>   overflow:
>       // Maybe needs to release locks, who knows
>       return -EINVAL;
> 
> notice?

The syntax problem (as made clear by many other people, and even you
here in the first half of this email) is that no one will use function
based math primitives. Everyone absolutely hates it. I would have gone
this route (as it is the design of the user-access code), but everyone
so violently rejected functional math that it seemed not even worth the
attempt.

> Wrapping does not need this kind of thing. Wrapping is literally a "I
> know I don't need to care", while trapping is a "I know I need to
> handle it".
> 
> It's just that handling the trapping should not need to be done right
> where the operation is done.

I agree completely. The trouble is how to build that into the existing
arithmetic statement syntax of C. This has been an unsolved problem for
50 years. :(

-- 
Kees Cook

