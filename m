Return-Path: <linux-kbuild+bounces-12467-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJIBAHXkzGmjXQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12467-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 11:25:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473B3778B0
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 11:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D45030015BA
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 09:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED76395D8B;
	Wed,  1 Apr 2026 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rId2HBKe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7329E3321A1;
	Wed,  1 Apr 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035253; cv=none; b=mGPfx2YutOG60401a3UmSBS1VD3DkSpz4Be4MZrVcb4z6Z5SipiEwEy65hNmchsCLc1ORC4KcZmer17RgsTnyZ53k5Bggvq+nxrKNcOoaZHjYd92sr7Ebc+PY1HUIPc0WhCt2S2lAyh4G5Hi+obnvJtU565HOSEvuqjKeqZkXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035253; c=relaxed/simple;
	bh=yDASMBfAJe/ptCisCuzZL2b8vNuQnM28uX6vjRAFL0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crk+zLS+bFsi++YFZyhJIMgm4ml3fhBcpDfQDcRrTYN9M6YvBKpEULEAWmeWqB2OUcwySa4Ct48P1oXeYMjiIPjazJJhWbEafv8iIPo5dKG3MIHZsvKVL8KHwoU2gqi14zAmnK897dqwE50AIL4ARgMAtLuDmQpWUpwf1cvbgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rId2HBKe; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kDfDAvCVaaba6UZ49bIrxriXABSNzggdUt8yIJkH2VA=; b=rId2HBKeuhfetqkYzaiId1Ects
	Ts5AYmlQ1fwJ//WGUjqyKAeZBOCBL8N4vAR9WyQm51BR1RCpTiryrx1bMZ7rzQ2kpbxAIQ8uFi3ro
	axFgcZRFIpRBLr26zffxXIffmO8QE8SNqnW6Xu5llRu8jzeHk/q8b6Go/0IWZYETc/7T8POLw0yPS
	hSx9xWOsx2vv3YoQcA22gT/5ImSo5MEsuipyoNRj9oGSpqNiPXI/OVjOjk9Y3R3yA0CBL1XEcPdL8
	uxyIYUjTJtAs8S3EKwqjcmd6rn6/Ym87GXxRII9GpfX6a0CKja4f1peU9VD2nTppj3abGxq2jN++M
	DT6REmLw==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rkl-0000000A7ap-0H5f;
	Wed, 01 Apr 2026 09:20:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AB5793032EA; Wed, 01 Apr 2026 11:20:27 +0200 (CEST)
Date: Wed, 1 Apr 2026 11:20:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Justin Stitt <justinstitt@google.com>,
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
Message-ID: <20260401092027.GW3738786@noisy.programming.kicks-ass.net>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12467-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,lwn.net,linuxfoundation.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:dkim,noisy.programming.kicks-ass.net:mid]
X-Rspamd-Queue-Id: 2473B3778B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 09:19:51AM +0200, Vincent Mailhol wrote:
> Le 31/03/2026 à 18:37, Kees Cook a écrit :

> > +  - Saturate (explicitly hold the maximum or minimum representable value)
> 
> I just wanted to ask how much consideration was put into this last
> "saturate" option.
> 
> When speaking of "safe" as in "functional safety" this seems a good
> option to me. The best option is of course proper handling, but as
> discussed, we are speaking of the scenario in which the code is already
> buggy and which is the fallout option doing the least damage.
> 
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

So I would like to second this option as being interesting.

But while pondering it, I did want to note that all of the options, with
the exception of __ob_wrap (which is effectively what we have today for
*everything*), will be 'interesting' to compose with _Atomic, another
one of these qualifiers.

Now, in the kernel we don't use _Atomic, so strictly speaking I don't
care ;-) But here goes...

Something like _Atomic int __ob_wrap, is trivial and good.

_Atomic int __ob_trap is either doable or impossible depending on how
you define the result to be on 'trap'. Specifically, the semantics
proposed where it keeps the old value makes it impossible.

And _Atomic int __ob_saturate is equally 'challenging', since the
fundamental thing of 'reset to min/max on under/over-flow' is rather
a non-atomic kind of thing. Look at the trouble we went through with
refcount_t to sort of make this work.


