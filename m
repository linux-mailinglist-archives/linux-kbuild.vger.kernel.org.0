Return-Path: <linux-kbuild+bounces-13927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7IXLKvCDR2q2ZwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13927-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 11:42:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06692700BE7
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 11:42:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=sAvN1M4z;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=W+N9SXKp;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13927-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13927-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39974309D200
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2026 09:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48FF3AA1B2;
	Fri,  3 Jul 2026 09:32:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7EE242D67;
	Fri,  3 Jul 2026 09:32:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071159; cv=none; b=geh7YO1+Pz05MCE0jAbRl3/DVAiiyfqK7lrV1VerVqSiF8E2zxbkOssiHew7+joWD4XPq/AE4CzwGSQASnVCvdA+7nNCKUbDBKeJVfaaV4jvy55CUJ1e0MDWn6tB6bhj25hPESjo+5sLWKCfO5RM1PDGAYC89EQCp/ig8sz7Efk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071159; c=relaxed/simple;
	bh=h+swHJU+kP9a3kQzzOuHu6c7ZSbagCYZUPt7GidetRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmSw9suOkZzW6230zV2qES8gvCoTC/0X/DA+Z+k/YFwpgIcKwdmChsWyex/eEDLZi85AH9Yui9zNybTW6dSlp4pfQ4X0nuV1YKakKDwHIABBODLRwmmb+7giAUjyZu+1aqbNsSf+neZdVBXEbniiavX+7rNJFZUuoof8qlftQBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sAvN1M4z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W+N9SXKp; arc=none smtp.client-ip=193.142.43.55
Date: Fri, 3 Jul 2026 11:32:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783071156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjpZIfXrZlR+t1d89jPlKZHQo1kiGuL1mgobKjfZ3fo=;
	b=sAvN1M4zdyyQ/kbjXVRwiEfAvL+0i1erCXfelVpGR3Mi/motuTYsL/T2yePwB9YFv/O/CM
	qUdGjdwka2qLDpqzagg0TxoCGCDF2av83sIqCroR4dcCdVVV1cQyFjgS9qG8LgL7xKYjdP
	PEN0RtmrhtRLRY25G9DHDqTvHs9so6ZRoApmNbDhePpDZbVHhu8redDhhvXIC70TcPrLnj
	q9qCFRKMgypdMRYtlZX5iSIXvzd+iGF5rPRHUdRZlUrGqzHdkREBw1ArdGGAhCrebc8ooE
	0rjYQdhvk2Y9j5drGZH6A2kpDocfjWQaH2z/OyY0vM9LNPOFhXTDcrFeeomZqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783071156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjpZIfXrZlR+t1d89jPlKZHQo1kiGuL1mgobKjfZ3fo=;
	b=W+N9SXKpZo63xincqrikK3HuGifPQtRW7UmEfP0lFXtrCBBbW/y00lqzFeOEGCg/tR9seM
	WZm9sQ4GircSNJBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Petr Mladek <pmladek@suse.com>
Cc: sashiko-reviews@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, shuah@kernel.org, 
	Zelin Deng <zelin.deng@linux.alibaba.com>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <20260703113019-678f1eb6-a061-435e-91a4-c0d76794b2cf@linutronix.de>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <20260703061449.246801F000E9@smtp.kernel.org>
 <akdyH7rRV1WHtBJ3@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akdyH7rRV1WHtBJ3@pathway.suse.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13927-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:sashiko-reviews@lists.linux.dev,m:nathan@kernel.org,m:nsc@kernel.org,m:live-patching@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:mbenes@suse.cz,m:shuah@kernel.org,m:zelin.deng@linux.alibaba.com,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06692700BE7

On Fri, Jul 03, 2026 at 10:26:07AM +0200, Petr Mladek wrote:
> On Fri 2026-07-03 06:14:48, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Incomplete fix and inconsistent state: The patch correctly unsets `sub_make_done` for the `kselftest` targets to allow Kbuild command-line reevaluation when building external kernel modules. However, it fails to apply the same logic to the `tools/` and `tools/%` targets, introducing a discrepancy between build entry points.
> > --
> > 
> > commit 06c418388d65deb3d8494a6e8e7071c0e709186b
> > Author: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 
> > kbuild: unset sub_make_done before calling kselftest build system
> > 
> > This commit unsets sub_make_done before invoking the kselftest build system to
> > ensure Kbuild reevaluates command-line flags when building test modules. It
> > mirrors a previous fix done for scripts/install.sh.
> > 
> > > diff --git a/Makefile b/Makefile
> > > index b9c5792c79e01..f717a4dc96d6a 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1591,10 +1591,10 @@ tools/%: FORCE
> > >  
> > >  PHONY += kselftest
> > >  kselftest: headers
> > > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > 
> > [Severity: Medium]
> > Will make tools/selftests still fail after this change?
> > 
> > The tools/ and tools/% targets in Makefile delegate to the tools build
> > system, which can also trigger external kernel module builds (like bpf_testmod).
> > 
> > Because sub_make_done is not unset for these targets, invoking commands like
> > make tools/selftests or make tools/all will skip Kbuild's M= argument parsing.
> > 
> > Should sub_make_done also be unset in the tools/ and tools/% targets to maintain
> > consistency across the build entry points?
> 
> This might make sense. I see that the tools: and tools/%: targets are
> defined right above the kselftest*: ones. And they are even advertised
> in "make help" or "make tools/help".

I am not sure how the tools/ targets can reach back into kbuild.
The example with bpf_testmod above is bogus, as tools/* is only for
top-level tools directories. Subdirectories in tools/testing/selftests/
don't seem to be reachable.

> Well it probably should be done in a separate patch. It would be better
> for bisecting potential regressions. Thomas, Zelin, what do you think, please?

If we do it for consistency it should be its own patch, agreed.


Thomas

