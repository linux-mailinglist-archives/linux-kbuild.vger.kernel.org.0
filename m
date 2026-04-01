Return-Path: <linux-kbuild+bounces-12548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GdVKQ52zWnYdgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12548-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 21:46:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD4237FEEA
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 21:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDAC93005640
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 19:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753D13630AE;
	Wed,  1 Apr 2026 19:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVOB1TcH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE9A33064D;
	Wed,  1 Apr 2026 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775072640; cv=none; b=jGrUY7bs6ZfDNhmElyLqzxw1AQCi/Q0z2W9cYbvDwXL/2f3P5ZnBiaA+3SRdM8AIAIMuGJ+6vBr2FaDeJTL25oSlCZ8FjLPk8J/SL5X8QT0CqDbcqAqjkv8DGhvFW/E1JhtwbEHm6pA+x3OxfoffhzFnt4WWFjtb9oI1LtT4nJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775072640; c=relaxed/simple;
	bh=1To5xCj/Euwv8pr6OLe9LCSI7BHddugktrqQ0mZeMp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fy3+4trGJe1rddsh463+sdcNE6jPOYUcqQD4oPJ8eI/Nv0Den6wULVE4zCAzLOlYGj0Rxx2MIhAIRHX9aFWGqsMoFKa3GmAO93zmiCa6663FCqeE/Tc0C5yGSVkX1bVEnZ52Vc5JgtLgYlL64E5PjbolQejc57IQ00cxHmreNx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVOB1TcH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFC6C4CEF7;
	Wed,  1 Apr 2026 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775072639;
	bh=1To5xCj/Euwv8pr6OLe9LCSI7BHddugktrqQ0mZeMp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVOB1TcHVUKd9k/gnI553hVBiTFtwTm1KybDl5S+zpnNkqtvWrmVTMotcFdyrlDul
	 s3SUsTN5h5bfOz+200DOWwUfhFxno2Vxue4RtoJcxnZFHFzMXgP7trFyim/j3NLvFt
	 qYME2Kif8AWTXoyKqWMeRX04GbWJTvG3cbI8wFLX5ghp/QBiNZbZyt06IP18NzkuiS
	 zhz4Rpqb2igFE1anUz18faBvQYXFi4K2CST9m9kcMxYD7//pmBAaOfaH29wHyDGrHu
	 xjthNsDDmRxIngn3YCxoy0gzf1PRVPqRxgDL8o2qIHmM2xQQ0nHkvt56+3wFWBGE1u
	 fYWrAippeO/6Q==
Date: Wed, 1 Apr 2026 12:43:58 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
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
Message-ID: <202604011242.3E8F635CD@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-3-kees@kernel.org>
 <bd0a4235-a7f0-4624-802c-aa49a9d13f29@kernel.org>
 <20260401092027.GW3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401092027.GW3738786@noisy.programming.kicks-ass.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12548-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,lwn.net,linuxfoundation.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DD4237FEEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 11:20:27AM +0200, Peter Zijlstra wrote:
> On Wed, Apr 01, 2026 at 09:19:51AM +0200, Vincent Mailhol wrote:
> > Le 31/03/2026 à 18:37, Kees Cook a écrit :
> 
> > > +  - Saturate (explicitly hold the maximum or minimum representable value)
> > 
> > I just wanted to ask how much consideration was put into this last
> > "saturate" option.
> > 
> > When speaking of "safe" as in "functional safety" this seems a good
> > option to me. The best option is of course proper handling, but as
> > discussed, we are speaking of the scenario in which the code is already
> > buggy and which is the fallout option doing the least damage.
> > 
> > What I have in mind is a new __ob_saturate type qualifier. Something like:
> > 
> > 	void foo(int num)
> > 	{
> > 		int __ob_saturate saturate_var = num;
> > 	
> > 		saturate_var += 42;
> > 	}
> > 
> > would just print a warning and continue execution, thus solving the
> > trapping issue. The above code would generate something equivalent to that:
> > 
> > 	void foo(int num)
> > 	{
> > 		int __ob_saturate saturate_var = num;
> > 	
> > 		if (check_add_overflow(saturate_var, increment,
> > 				       &saturate_var) {
> > 			WARN(true, "saturation occurred");
> > 			saturate_var = type_max(saturate_var);
> > 	}
> 
> So I would like to second this option as being interesting.
> 
> But while pondering it, I did want to note that all of the options, with
> the exception of __ob_wrap (which is effectively what we have today for
> *everything*), will be 'interesting' to compose with _Atomic, another
> one of these qualifiers.
> 
> Now, in the kernel we don't use _Atomic, so strictly speaking I don't
> care ;-) But here goes...
> 
> Something like _Atomic int __ob_wrap, is trivial and good.
> 
> _Atomic int __ob_trap is either doable or impossible depending on how
> you define the result to be on 'trap'. Specifically, the semantics
> proposed where it keeps the old value makes it impossible.
> 
> And _Atomic int __ob_saturate is equally 'challenging', since the
> fundamental thing of 'reset to min/max on under/over-flow' is rather
> a non-atomic kind of thing. Look at the trouble we went through with
> refcount_t to sort of make this work.

Yeah, this is mainly why we didn't spend time working on an
__ob_saturate implementation: the primary place we want it in Linux is
already solved with all the refcount_t work. That said, if the behavior
could be replicated using a future __ob_saturate, that would be very
nice. :)

-- 
Kees Cook

