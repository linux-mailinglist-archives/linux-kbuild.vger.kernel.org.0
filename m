Return-Path: <linux-kbuild+bounces-11763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GItbGhjir2nkdAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11763-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:19:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 67818248310
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F7FC30699E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 09:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E05843CEDF;
	Tue, 10 Mar 2026 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zlr24XMu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4v6kkacA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1256743CECD;
	Tue, 10 Mar 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134014; cv=none; b=MTpiCX9K97uKHEcGypoI1ofG4Uvks1q0SylOd05C17Pcc2Jvu6U/nYBh5rNeYmG6N3kY/sFKvz1ec12ZyA7p4164iUsbx5SLXMV76+19W3pZTOd/jOCYMEXwiWMyfMCW0ZuFqAncKuns7ySoyyQ3qW2OvJRECu/k+eRJ7rf2z9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134014; c=relaxed/simple;
	bh=LJvSqmP0Tp3zoxtzHg0q2DSyAkYmZyXeOrrXoeEIYGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KM1BFbkqbHg2jGUIV6ITI0OrLgHP7V06P3PkFI/7TKl3rZw95RnWytqFZakRvPYnJWpowmUm19UCXx2qYkt5S5YIPEDD4WD0hvVmopvKQ+ukPFUOFsneA1IUPt29TlsVetPbeJMgKMklYto0XYdJobU302P7QLPpQ+EcMK2UOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zlr24XMu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4v6kkacA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 10 Mar 2026 10:13:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773134011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmEiFKSlW4Y9KUSJDNNDOD9FOYCsr+HRMQz9yEIiaYM=;
	b=Zlr24XMuLmh7NWhmwfz1K3A5+ouLhVUNHltdDpLWAOfpwa3GFfo7M2GRxpW3A6d10RAFU9
	aBtA53dM2NAzxp75RQYr3l3d2hD8Y1tZ41FkpILHr6k7jTwLsRvTsuHKQbYdcKWaoNQYbf
	onx3Nn63q8TEIw+wLIGe33lua3pzkn3Ja1VbzhEmSXtLJg7NDlwSdzpU2pSV6uE/QIKd/0
	MpGIxfN0QxOPxRbJ23lnKjl/wra3i6nZtXp0lfbUhZ/dL6jl5LwLgMkME/wZXpMbwakr1U
	l8sJqecUBG7VajvF2a7tTcpxVU16HYSiMqUrrmcmnH8Pj9wGpUIzA7D0H5QjYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773134011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmEiFKSlW4Y9KUSJDNNDOD9FOYCsr+HRMQz9yEIiaYM=;
	b=4v6kkacAXZwgC+bVSDQ9KRdGvuA044SUyANZdfd6mpiH2u7hMF3XI4ds3k1gF9gjgSYQ0V
	utBjkwc6WhykKGBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Askar Safin <safinaskar@gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to
 scripts/
Message-ID: <20260310100543-744f324c-5ce6-4326-81fb-8fe1abb58d93@linutronix.de>
References: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
 <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
 <20260309142528-9ad96828-4f07-4cc4-81d6-5aa9b4e9d599@linutronix.de>
 <aa_E3J-iRjUO4ToP@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa_E3J-iRjUO4ToP@derry.ads.avm.de>
X-Rspamd-Queue-Id: 67818248310
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11763-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 08:14:36AM +0100, Nicolas Schier wrote:
> On Mon, Mar 09, 2026 at 02:41:53PM +0100, Thomas Weiﬂschuh wrote:
> > On Mon, Mar 09, 2026 at 08:56:30AM +0100, Nicolas Schier wrote:

(...)

> > > @@ -1437,9 +1437,9 @@ ifdef CONFIG_HEADERS_INSTALL
> > >  prepare: headers
> > >  endif
> > >  
> > > -PHONY += usr_gen_init_cpio
> > > -usr_gen_init_cpio: scripts_basic
> > > -	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
> > > +PHONY += scripts/gen_init_cpio
> > > +scripts/gen_init_cpio: scripts_basic
> > > +	$(Q)$(MAKE) $(build)=scripts scripts/gen_init_cpio
> > 
> > The other proxy targets for scripts/ use the 'scripts_' prefix.
> > Why is this one different?
> 
> Good question; I was ambiguous about that, but I chose 'scripts/' in
> favor of 'scripts_' as
> 
> 1. The $(obj)/initramfs_data.cpio target in usr/Makefile has to depend
>    on 'scripts/gen_init_cpio' regardless of how the top-level target is
>    called, as the sub-make cannot depend on a phony top-level rule.
>    If possible, I like to have the same name for dependencies as for the
>    rule that generates them.
> 
> 2. I cannot see the reason for the 'scripts_' prefix currently used in
>    top-level Makefile for real targets building a single output file.
>    It seems to me that commit bdd7714b6f4c ("kbuild: build all
>    prerequisites of headers_install simultaneously") introduced the
>    'scripts_' prefix due to the historic origin 'scripts_basic'; which
>    itself came with commit 952a0ae394f4 ("[PATCH] Fix early parallel
>    make failures", v2.6.5) [1].  I _guess_ the 'scripts_' prefix was
>    meant to clearly make a difference from the previous 'scripts'
>    target, and the name makes clear that it is a phony target building
>    several things.
> 
> Masahiro, if you are around I'd appreciate a comment from you.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=952a0ae394f4
> 
> Thomas, does the reasoning make sense to you?  Or do you expect troubles
> due to the 'scripts/' prefix?

Sounds reasonable. Personally I would still prefer consistency, but that is
subjective of course.

In any case:
Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>


Thomas

