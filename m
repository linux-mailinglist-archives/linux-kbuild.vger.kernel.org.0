Return-Path: <linux-kbuild+bounces-12547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDeiLoJ1zWnYdgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12547-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 21:44:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF137FEB5
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 21:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 425AE303275B
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 19:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2029231A7F6;
	Wed,  1 Apr 2026 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFMe9OxE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A522D4E9;
	Wed,  1 Apr 2026 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775072523; cv=none; b=cOpUiMIKVTchHYPcJgdq160wCUS9KSCfZ/mg5KqEwbQUeZTB+4jAO541VWT5PM682PAaTdvfEaaPdGZDF7MsRE2Y4YmBieTFaEnDnUXxE34sRcp2RYWGMv8yN+30i96hA0FYR+sV8eh8YKFRJKv+OY82XI5TgDAUA8n5tKvGr0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775072523; c=relaxed/simple;
	bh=6rRGHVxPREHYm9wPCaHRgKXoqSKaSIjkZI8d+MlPP2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgzOc59DdBFR/npg8wfT+Yht8paqB6t5dTvujD4p8jxt2CFWayMIQnBP432xZSB1Umj6/9CC+xXmDhYXknCGk0GKc6ADtSVKlaaTu1E9XNGruNMIqJauPPtQF7I1bBzSFckqzZg4ykvTwZkq/HJmI8W4MswHqfP5Z8Lfp7qXLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFMe9OxE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A9DC4CEF7;
	Wed,  1 Apr 2026 19:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775072522;
	bh=6rRGHVxPREHYm9wPCaHRgKXoqSKaSIjkZI8d+MlPP2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFMe9OxECJSsnMlfo9ttUe2IwOhM7R+wvb23CSB2DeIAZtMznZLM/8lOwN69yHOOB
	 9taDCyegwySv2LOXo0XGfQHlBnS4XVTNBa8G2cXYWsnUfZTqIu/cNerzXlQp8o79lt
	 aiEigISKNddc8Yq9zM9LUaWxS5z7Nn21/zXtqAPmz4amlTq4JOnEldOLrvS+WhRnkY
	 FRuK/5EJRSFhdOoZ6ZSc7Mm/rfE4CXSrhlzgNM9VqjpWVTsxapSVBZu9UefHfaPG1G
	 3DcBaO8/7fpUlJXbfQTyEGxbv45A3ATev+soKF6lUlkxlrnay4BrU3XpsXs9qvDBxY
	 +R0q0Nb8moVpw==
Date: Wed, 1 Apr 2026 12:42:02 -0700
From: Kees Cook <kees@kernel.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
Message-ID: <202604011231.1D0BAE9A@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-3-kees@kernel.org>
 <bd0a4235-a7f0-4624-802c-aa49a9d13f29@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd0a4235-a7f0-4624-802c-aa49a9d13f29@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-12547-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21CF137FEB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 09:19:51AM +0200, Vincent Mailhol wrote:
> Many thanks for this series. Great work and I am ready it with a lot of
> interest!

Yay! Glad to have folks looking at it all.

> I just wanted to ask how much consideration was put into this last
> "saturate" option.
> 
> When speaking of "safe" as in "functional safety" this seems a good
> option to me. The best option is of course proper handling, but as
> discussed, we are speaking of the scenario in which the code is already
> buggy and which is the fallout option doing the least damage.

Right -- harm reduction. :)

> What I have in mind is a new __ob_saturate type qualifier. Something like:
> 
> 	void foo(int num)
> 	{
> 		int __ob_saturate saturate_var = num;
> 	
> 		saturate_var += 42;
> 	}
> 
> would just print a warning and continue execution, thus solving the
> trapping issue. The above code would generate something equivalent to that:
> 
> 	void foo(int num)
> 	{
> 		int __ob_saturate saturate_var = num;
> 	
> 		if (check_add_overflow(saturate_var, increment,
> 				       &saturate_var) {
> 			WARN(true, "saturation occurred");
> 			saturate_var = type_max(saturate_var);
> 	}

Right, yes. Note that __ob_saturate is entirely unimplemented, but we
wanted to leave the door open for other Overflow Behaviors. (It was
tricky enough to even get the semantics worked out from wrap and trap,
so we wanted to get to a distinct first step landed first.)

For the "warn" part with __ob_trap, we borrowed the Sanitizer
infrastructure since architecturally it's in exactly the same places
that __ob_trap needs to be checking, and already has everything
available. In the case of __ob_saturate, it would only be informational.
(Arguably, there should be no "warn" at all, as it's the "expected"
behavior, just like __ob_wrap has no "warn" on wrap-around. But it seems
sensible to me to make that available by enabling the sanitizers too.)

> People using those saturating integers could then later check that the
> value is still in bound.
> 
> This is basically what your size_add() from overflow.h is already doing.
> If an overflow occurred, the allocation the addition does not trap, it
> just saturates and let the allocation functions properly handle the issue.

Right.

> The saturation can neutralize many security attacks and can mitigate
> some safety issues. Think of the Ariane 5 rocket launch: a saturation
> could have prevented the unintended fireworks.
> 
> The caveat I can think of is that the old overflow check pattern becomes
> invalid. Doing:
> 
> 	if (saturate_var + increment < increment)
> 
> is now bogus and would need to be caught if possible by static analysis.
> So those saturating integers will only be usable in newly written code
> and could not be easily retrofitted.

In theory, the "ignored patterns" (or "idiom exclusions") would already
allow this to continue to behave correctly, though it may be worth trying
to figure out if this is "correct" or not.

> > +In the C standard, three basic types can be involved in arithmetic, and each
> > +has a default strategy for solving the overflow problem:
> > +
> > +  - Signed overflow is undefined
> > +  - Unsigned overflow explicitly wraps around
> > +  - Pointer overflow is undefined
> 
> Nitpick: the C standard uses different definitions than yours. In the
> standard:
> 
>   - overflow is *always* undefined
>   - unsigned integer wraparound
>   - signed integer overflow
> 
> The nuance is that in the standard unsigned integers do not overflow,
> they just wraparound.

I guess that's technically true, but for understanding the "overflow
resolution" properties (from a mathematical perspective), the question
is "what happens when a value cannot be represented by the bit pattern
of the storage?" But I think we understand each other here. :)
So given that under C, signed is undefined and unsigned in wraparound,
this is how we ended up phrasing it.

> I am not asking you to change your terminology, but it could be good to
> state in your document that your definition of overflow differs from the
> standard's definition. Maybe a terminology section could help.

I'm open to whatever you think would make this more clear. :)

-Kees

-- 
Kees Cook

