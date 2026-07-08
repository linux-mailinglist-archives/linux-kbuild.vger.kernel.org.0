Return-Path: <linux-kbuild+bounces-13954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hARnAHB4TmquNQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13954-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 18:18:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1291D7289B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 18:18:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=BuUS5KN6;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13954-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13954-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72D2330A494F
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2026 16:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811AE2D781B;
	Wed,  8 Jul 2026 16:00:43 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBD379C56;
	Wed,  8 Jul 2026 16:00:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526443; cv=none; b=ShGUftr29ECw1J0J2NPTkI2p6qHDabgusc3lhqA09SJstY2H9ACimJVHGCaAu3DxL4wuYcpvVsicarmvaWx7FAHHAcYUYWrDZHTpz7u4wDIUBSvukZ3l5b3A5HuyQvdzEznvHWfHE2Y9J71xvg0BpVWkAZj87twMiwF8innnrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526443; c=relaxed/simple;
	bh=VGujGP5WfSGg1DBzhD2xC5nPhKvYpnC9HXOiuHjexUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K29vIKiQNlcKjC/gu0EgsM4lm98yklDnq6I5RrUl564YGjgug3l+K5TkTo5pE889QsjgXAdh+WCR/nW1U3+0G6WIvk/cdLETNQ59P58eqkPpVe/bGnR+4sOMWE7S0wWvcxJBURqnbmia8qR9kqrJ4L15rJNE2xUBk8AwN0zpE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BuUS5KN6; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=68dI1IO9MWd8JysrUhD04sni/lC6RHAplfV11xsZtr4=; b=BuUS5KN6Mgd+JJPW384qWt0xn3
	+hTZz7viKUSQqK87c0E4c1mXK9hWYtlJXzJuZMVPFydIx7jIm9Na9NkDNwp9DYpR/8/rVeuHvSAPg
	mSMYtaOhhaQW1MzFS4/tvGbNDGH7e1nC8K6vnuDHf3EHM1A9mJdP20HSZJ6izyQhf1s2X8o2lRBXX
	yJH0hTeG2qfS1EZpGdLnu03C/0zfATk+2oJczlMdihunJzPhkUPyXnWeymE8rmAV3ije9vTB5/bxH
	5oIIxueD4cbGQXpH52/2h76kPmz2P/y6xEDNWH9n19HLoRdzDPO+NsouxIP0SVx3sbMvFeQpkN65l
	xDyz8tYg==;
Received: from 189-68-33-146.dsl.telesp.net.br ([189.68.33.146] helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1whUCU-00BmQO-Jy; Wed, 08 Jul 2026 17:28:38 +0200
Message-ID: <17d3c3f6-f040-45b9-adf7-6ef1d7cf4e3e@igalia.com>
Date: Wed, 8 Jul 2026 12:28:33 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Nam Cao <namcao@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Borislav Petkov
 <bp@alien8.de>, Nicolas Schier <nsc@kernel.org>, kernel-dev@igalia.com
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hpa@zytor.com,m:mingo@redhat.com,m:namcao@linutronix.de,m:luto@kernel.org,m:x86@kernel.org,m:dave.hansen@linux.intel.com,m:bigeasy@linutronix.de,m:nathan@kernel.org,m:vincenzo.frascino@arm.com,m:bp@alien8.de,m:nsc@kernel.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andrealmeid@igalia.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-13954-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrealmeid@igalia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linutronix.de:email,igalia.com:from_mime,igalia.com:email,igalia.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1291D7289B1

Em 08/07/2026 10:56, Thomas Weißschuh escreveu:
> Finding the debug version of the vDSO is not trivial as there is no common
> scheme where it is placed. That's especially problematic for CI testing.
> 
> The vDSO futex unlock mechanism requires for testing to have access to the
> inner labels of the unlock assembly, which are only accessible via the
> debug so.
> 
> Also for general debugging purposes it's convenient to have access to the
> debug vDSO at a well defined place.
> 
> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> regular 'make vdso_install' layout, including build-id symlinks to find
> the correct file for each process.
> 
> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> 
> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> explicit dependency to avoid errors due to concurrent builds.
> 
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---

Thanks for your patch! Tested in arm64 (qemu) and it worked fine. I was 
just expecting that the file would be called "vdso.so.dbg", not "vdso.so".

Tested-by: André Almeida <andrealmeid@igalia.com>

