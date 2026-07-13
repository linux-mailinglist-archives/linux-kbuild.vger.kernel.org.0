Return-Path: <linux-kbuild+bounces-14000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +g0/EyTnVGplgwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14000-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 15:24:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C8474B8A7
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 15:24:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b="R/yMwYvG";
	dkim=pass header.d=linutronix.de header.s=2020e header.b=xTope03g;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14000-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14000-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D41530D662D
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 13:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2DA422546;
	Mon, 13 Jul 2026 13:17:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2EE421EED;
	Mon, 13 Jul 2026 13:17:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948653; cv=none; b=qw6bGfVGzFGWOsLHo+hzZVlFBCAtLGFB1bCy4te2HEtMZOVA2WmlVrv9Z2WjQywU73AQhllXr7c9R3ZfaIuhaoiNOlTI4gXDHvRp2Y9szsv3+pnm67I2Vqp1vMfoGxUPC9u39OQG4qAmYvLHziDUoLOHnvEjP+ZB4jTmI4/JQRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948653; c=relaxed/simple;
	bh=LjAf51U8mqyC9ZnK7neeo1LhTQhTWN6vtBYar+XcRQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qgo62qPffou5GStM0UZ8XC2ZNreTjDzEXHeez/nrmAejyGyfRzT1BOZwEHssyPihtNMV6BczCpQ4TDFh5FtBQ+Cf2iWDQIDE2s+Mq9MgJcO65T3heCJBlvRZfsdl5DIYWsUDFCDH5ls3tCwRWpugk5/xsoWU5WVt5gQzM7A0Jbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R/yMwYvG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xTope03g; arc=none smtp.client-ip=193.142.43.55
Date: Mon, 13 Jul 2026 15:17:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783948644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YW+Okndp8DxJTQJayVXkgT9t6AuGdsczQbIOz6scB1s=;
	b=R/yMwYvGVPoxw3Rhx4+k92W5KoyHulaVrDdV3N2LvZxwOjoHCg3ikRiUgLiZQ/C0kqIxC5
	9MIS/HIcHTIdHmxwU42VUM8pIScHO21pqHQtDcCIoVeBMykLK61WWXcx7sWmyio45X4NH0
	at2e5O0WoN6k14VOlWHqL77R2GyJiwutlQ/ZH1yOFogCjP4FkibfeD8Fu8PoKS6FzJ9qos
	gAlhTjycsyRsOwuE6rALPF9KN6JgZU9LcXSxs78BRwD8AWyE/Qn8hJb3Y6KsAjBMejHzhF
	e49DT5EJb3kj4rA6F4M03dLBvwXRUBY8yNzdjFn7IujcDS9OEfbwL0Xdml7SsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783948644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YW+Okndp8DxJTQJayVXkgT9t6AuGdsczQbIOz6scB1s=;
	b=xTope03gpotsxNm1comWzBGtgzchO+cTgh1LwlPQZ2wShQKuDcmNAMEDWX6bo+D9+CRvUx
	H0ErxyGjbenOUOCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
Message-ID: <20260713150522-86127a79-b4e7-4a0a-b5af-c4262534bffb@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
 <947ba63d-59d5-4f4a-a037-c9de100ced97@arm.com>
 <9131ADF7-6D08-418F-BE2F-2E99CC83FD2E@zytor.com>
 <20260710081440-d355b1fd-c34d-40bb-965c-8bbe2a8c375a@linutronix.de>
 <DC26CD8F-9767-4544-A157-8367439CE0BA@zytor.com>
 <20260710093522-38be8589-5a4d-4476-a2d4-0bb4a6243134@linutronix.de>
 <A2327520-6521-433E-8EE2-8C0773FA998C@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A2327520-6521-433E-8EE2-8C0773FA998C@zytor.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,m:bigeasy@linutronix.de,m:andrealmeid@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-14000-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:mid,linutronix.de:email,linutronix.de:dkim,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94C8474B8A7

On Fri, Jul 10, 2026 at 11:34:48AM -0700, H. Peter Anvin wrote:
> On July 10, 2026 12:41:31 AM PDT, "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de> wrote:
> >On Fri, Jul 10, 2026 at 12:32:55AM -0700, H. Peter Anvin wrote:
> >> On July 9, 2026 11:36:25 PM PDT, "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de> wrote:
> >> >On Thu, Jul 09, 2026 at 12:06:07PM -0700, H. Peter Anvin wrote:
> >> >> On July 9, 2026 2:57:09 AM PDT, Vincenzo Frascino <vincenzo.frascino@arm.com> wrote:
> >> >> >On 08/07/2026 14:56, Thomas Weiﬂschuh wrote:
> >> >> >> Finding the debug version of the vDSO is not trivial as there is no common
> >> >> >> scheme where it is placed. That's especially problematic for CI testing.
> >> >> >> 
> >> >> >> The vDSO futex unlock mechanism requires for testing to have access to the
> >> >> >> inner labels of the unlock assembly, which are only accessible via the
> >> >> >> debug so.
> >> >> >> 
> >> >> >> Also for general debugging purposes it's convenient to have access to the
> >> >> >> debug vDSO at a well defined place.
> >> >> >> 
> >> >> >> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> >> >> >> regular 'make vdso_install' layout, including build-id symlinks to find
> >> >> >> the correct file for each process.
> >> >> >> 
> >> >> >> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> >> >> >> 
> >> >> >> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> >> >> >> explicit dependency to avoid errors due to concurrent builds.
> >> >> >> 
> >> >> >> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> >> >> >> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> >> >> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >> >
> >> >(...)
> >> >
> >> >> Why stuff them into a tarball?
> >> >
> >> >Because it was the easiest solution to implement and has been sufficient
> >> >for IKHEADERS so far. I don't see a clearly winning solution among the
> >> >possibilities to expose a directory:
> >> >
> >> >* Use plain sysfs:
> >> >  Requires a new code generator and potentially changes to sysfs
> >> >
> >> >* Use a read-only filesystem like cramfs/erofs:
> >> >  Introduces new build-time and runtime dependencies
> >> >
> >> >* Add a new filesystem backed by a tarball or cpio archive:
> >> >  Lot's of complexity and work to implement
> >> >
> >> >But I am open to discussions and other ideas.
> >> 
> >> I discussed this with GregKH a while ago, in the context of eventually making
> >> the vdso an actual mapping of a virtual file. According to him it should be
> >> quite simple in sysfs; I got a bit stumped on the necessary hooks (the kernel
> >> needs to keep track of where the vdso lives in the address space.)
> >
> >Interesting idea, I will take a look at it.

What would be the advantages?

How would this handle the fact that the data page mapping needs to be fixed
next to the code one? Should the data page mapping also be a virtual file?

> >Today the vDSO mapped into userspace is a stripped version. For the
> >debugging usecase however we want the unstripped one.

> >Also it won't help with debugging a coredump.
> Why wouldn't it??

I can't reconstruct what I was thinking here. Sorry for the noise.


Thomas

