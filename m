Return-Path: <linux-kbuild+bounces-12551-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ii5MgSCzWmaeQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12551-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 22:37:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B50380432
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 22:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F07FC308781D
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 20:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891AF32E72F;
	Wed,  1 Apr 2026 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Bx/ACwfj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3E728371;
	Wed,  1 Apr 2026 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075469; cv=none; b=Ei8x/0EQdNhXonCGK5M7PoQyzt4Fw/0ll/74BgYNBd+3gxwWCqkrN9EwbQK2Zkl/qYoQIv/vjAmzav3dEqvCi1KXilrog1sgkDBVMs9BEU4DLEFuS35sqpoczrJqD72q2+UvbxbhI8N91IU1Qajq/+1yP5DbEzqbXby1u/O+k60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075469; c=relaxed/simple;
	bh=OMpO7q5Ikwm2P3sCxvaabyyTan1JSp9fmJOu9/jKzrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M73T9t6iXdkO7TYP1lX38bZclSEG01HBAU7b1hNYdNaRa/EG+CQZ0mI/MdyNoomd3P8C39W25aLMes9BkKK5Bcwobqi6P3/nhAdyGDSjZTo9BImhNsyTzDNloJZIKSG73C9J5EW83moUzx1TK0/HwympMM+ypbRgbePfLLGNy8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Bx/ACwfj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J4BS40kIwGQqtZf7el/RSn0aMcV3ns6uRRayPq/M+D8=; b=Bx/ACwfjQHdXTB5TBeLORYp4eo
	V5I9JpLXXQhH9GA2PTGDbB2dBCvMKGabCjKiaqfYKBRsArfJUrvRTqcE9bdSr5j+oUGXjoOx8DDYJ
	ly+CaWCAukpSUfZs525/QHDOegkF8O9saRr0h4YwRRqs7nxGXIXcHnsiArkVOPJPxCwliNmk/ocSe
	pVSHGo30nJLeXUotk+oMpap47tYFbSWE1Li+oVE+0276its+4lNdfPVEyYK2gHZ9h89R2qRVE3EOV
	99r27BzdlCxcghaUGrFn7ZD1sPv38gTfoD7lPbxWZPb0k/jzQJZAT7JC9/cHggcS5LKy/5WSl6i0I
	zouDu1+g==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w82DH-00000001F12-1wYg;
	Wed, 01 Apr 2026 20:30:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 257D930301D; Wed, 01 Apr 2026 22:30:54 +0200 (CEST)
Date: Wed, 1 Apr 2026 22:30:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Message-ID: <20260401203053.GC3254421@noisy.programming.kicks-ass.net>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
 <202603311249.30B44C66@keescook>
 <20260401090815.GV3738786@noisy.programming.kicks-ass.net>
 <202604011313.AD471BC8@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604011313.AD471BC8@keescook>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12551-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim,noisy.programming.kicks-ass.net:mid]
X-Rspamd-Queue-Id: 18B50380432
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:21:17PM -0700, Kees Cook wrote:
> On Wed, Apr 01, 2026 at 11:08:15AM +0200, Peter Zijlstra wrote:
> > On Tue, Mar 31, 2026 at 12:52:10PM -0700, Kees Cook wrote:
> > 
> > > I think for this series, __ob_trap/__ob_wrap is what should be used.
> > > 
> > > And for other folks, the background here is that we originally wanted
> > > to use macros for "__trap" and "__wrap", but the powerpc C compiler
> > > (both Clang and GCC) have a builtin macro named "__trap" already. So
> > > I switched to just using the Clang-native type qualifier. We can use
> > > the attribute style too, but there was a lot of confusion during the
> > > Clang development phases where people kept forgetting this was a type
> > > qualifier, not an attribute (i.e. the attribute is an internal alias
> > > for the qualifier, and the qualifier is a new type).
> > 
> > Since you mention qualifiers...
> > 
> > What is the result of __typeof_unqual__(int __ob_trap) ?
> 
> Hmm, it seems like "const" doesn't get peeled off. That can be fixed, if
> that's needed?
> 
> 'typeof_unqual(int)' (aka 'int')
> 'typeof_unqual(__ob_trap int)' (aka '__ob_trap int')
> 'typeof_unqual(const int)' (aka 'int')
> 'typeof_unqual(__ob_trap const int)' (aka '__ob_trap const int')

So how can something be called a qualifier if unqual doesn't strip it?

(We might already have had this discussion, but I can't find the answer
in the LLVM documentation page and didn't search our previous
correspondence on this).


