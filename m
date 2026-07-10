Return-Path: <linux-kbuild+bounces-13985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zT+cDjiiUGq62gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13985-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 09:41:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4AF7381E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 09:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=sqrE84Yh;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=iZIIrW85;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13985-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13985-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E166301F49F
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 07:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB013D3D09;
	Fri, 10 Jul 2026 07:41:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535E3BED44;
	Fri, 10 Jul 2026 07:41:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669300; cv=none; b=kjKmWD6JiMgT1sF0XAgDsP7XTQ245CHd10dwMopKqRz1uo4uWrWMwiSjf4x61iIIJvdbhZcGDIiux+jMp/YPcgIfqa97GMmhgVO+ss8OUv6yTt1aj+eL3aOdKM3eODEwQ4O5pIuDtHnP+Wr6AwmA9/gat9S1kDvotJkNEz4SP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669300; c=relaxed/simple;
	bh=U+jA6bKf8hodkJJVcyXQlhqkisKwx2O2udbcfH+A19Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/TeSxl4tPqWVBF9SW9Qeu3LO6byaVafrRLlG3DZXnW4sqbTre6UnzfjbU8jMHRRrhwliWM5IiCPXg92M0tIl1lD79Rhu672SnYuMvor7D8VTy3qtdIT0ZmwJ95sHwufhIiV+jjeqJGJr0MrytZAzr+l0TwNgYfyz3HeH/9jS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sqrE84Yh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iZIIrW85; arc=none smtp.client-ip=193.142.43.55
Date: Fri, 10 Jul 2026 09:41:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783669296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IkkHiSJEiNpNZNHgwRs4PoS6BkTIL7JYLNF87rNr74=;
	b=sqrE84YhHrWx2T4dyoXhU9ogdZgEZs0ubUYKDMEPh/UostcGX4zN1DrENZTpnL/owz6BK9
	SUDWsnR1UB8QFQKXfeObWW4WuqnaY41kBT7H/AZHeEm1cARJk/OSKNxNdBfkePFpHI2b7d
	bFiPkNmfXvuDdY/FIWRF35DMkIU/KcSTBa8hkcJj9ChqwHjjPadKP8tiitwDGT7CI9AISw
	htm8b/ob/gEBfd6hSk6zeofcu8Uf3ZU/lT/fMx3kSzfZ7V2UB/+XCXbbs+2r0jshPAJ2yc
	RfjmnYsJRyk1xXG1neuxjA5R1lj0YWPFx6Sl11Nk8AhCVswBFjGueEXIgaECBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783669296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IkkHiSJEiNpNZNHgwRs4PoS6BkTIL7JYLNF87rNr74=;
	b=iZIIrW85Y9Pn3q3gtxhDIvzd7Y4n9V1vuR8+xQCrlm4nboqAxQNMMTRQWHN+9Z/v1ZrmpF
	5hBU5ju9E1B5wLBQ==
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
Message-ID: <20260710093522-38be8589-5a4d-4476-a2d4-0bb4a6243134@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
 <947ba63d-59d5-4f4a-a037-c9de100ced97@arm.com>
 <9131ADF7-6D08-418F-BE2F-2E99CC83FD2E@zytor.com>
 <20260710081440-d355b1fd-c34d-40bb-965c-8bbe2a8c375a@linutronix.de>
 <DC26CD8F-9767-4544-A157-8367439CE0BA@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DC26CD8F-9767-4544-A157-8367439CE0BA@zytor.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,m:bigeasy@linutronix.de,m:andrealmeid@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-13985-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B4AF7381E8

On Fri, Jul 10, 2026 at 12:32:55AM -0700, H. Peter Anvin wrote:
> On July 9, 2026 11:36:25 PM PDT, "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de> wrote:
> >On Thu, Jul 09, 2026 at 12:06:07PM -0700, H. Peter Anvin wrote:
> >> On July 9, 2026 2:57:09 AM PDT, Vincenzo Frascino <vincenzo.frascino@arm.com> wrote:
> >> >On 08/07/2026 14:56, Thomas Weiﬂschuh wrote:
> >> >> Finding the debug version of the vDSO is not trivial as there is no common
> >> >> scheme where it is placed. That's especially problematic for CI testing.
> >> >> 
> >> >> The vDSO futex unlock mechanism requires for testing to have access to the
> >> >> inner labels of the unlock assembly, which are only accessible via the
> >> >> debug so.
> >> >> 
> >> >> Also for general debugging purposes it's convenient to have access to the
> >> >> debug vDSO at a well defined place.
> >> >> 
> >> >> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> >> >> regular 'make vdso_install' layout, including build-id symlinks to find
> >> >> the correct file for each process.
> >> >> 
> >> >> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> >> >> 
> >> >> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> >> >> explicit dependency to avoid errors due to concurrent builds.
> >> >> 
> >> >> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> >> >> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> >> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >
> >(...)
> >
> >> Why stuff them into a tarball?
> >
> >Because it was the easiest solution to implement and has been sufficient
> >for IKHEADERS so far. I don't see a clearly winning solution among the
> >possibilities to expose a directory:
> >
> >* Use plain sysfs:
> >  Requires a new code generator and potentially changes to sysfs
> >
> >* Use a read-only filesystem like cramfs/erofs:
> >  Introduces new build-time and runtime dependencies
> >
> >* Add a new filesystem backed by a tarball or cpio archive:
> >  Lot's of complexity and work to implement
> >
> >But I am open to discussions and other ideas.
> 
> I discussed this with GregKH a while ago, in the context of eventually making
> the vdso an actual mapping of a virtual file. According to him it should be
> quite simple in sysfs; I got a bit stumped on the necessary hooks (the kernel
> needs to keep track of where the vdso lives in the address space.)

Interesting idea, I will take a look at it.

Today the vDSO mapped into userspace is a stripped version. For the
debugging usecase however we want the unstripped one.
Also it won't help with debugging a coredump.


Thomas

