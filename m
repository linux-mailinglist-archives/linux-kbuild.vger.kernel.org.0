Return-Path: <linux-kbuild+bounces-14022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R9A4Esx+V2pYTQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14022-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 14:36:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249B75E37A
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 14:36:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=igalia.com header.s=20170329 header.b=eZWsIrxT;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14022-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14022-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=igalia.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2B90311F87F
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 12:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F1C46AF31;
	Wed, 15 Jul 2026 12:30:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CD647A0A7;
	Wed, 15 Jul 2026 12:29:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118603; cv=none; b=KGbQUid7z9E5VO6b2+mqAA8zAmMY9a+Uk0dgzZibK6QiQXVbc0nERF4jucrqC5Tfq+YgPCY6ub9iQ+b9ImMS/a0mnEUgfXdzvfewvzLcvyNL9d34u5mRlZfsrC1WOz/lg2/IMiNZ40rHaZxWkomQ7eKpMn+1JcTRQh9NVf9dmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118603; c=relaxed/simple;
	bh=9I/ZFzgJTj8ULGDDRtNw9ETjLbyBYOaZzkhFzzMAoUQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=c16dsM0LQPx5GMNYM5RHbI7Gbu35RDQ8punZO5QUS+d2VDs6/V4XXmZfeR/Xgy86VX7NrQIUl/JJcHh0RElUAj01N37NqtA02kY2htrJZ/DU7GEM9+eKiiPn2Iyeu4MKllE3iVH86kRzgPs3P3QjlujZHu5aopn4FAz9U3o1gzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=eZWsIrxT; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=FD/Tw50a0xbKjBmmUhMIfCNWGHyUBXREkYd9iJCwS/E=; b=eZWsIrxTZEFEPB4QfguZHkYOS8
	nG6iNqdz7UrkHYk5cOMTtHd34RNuDjhVn9D/QYMX1EuOiQ9hpfIf24bd6RaiamVUcWyy4mf5VSYgL
	j6JNI/jS8p1MBbc2Rw/yPN2faBVVXgI/r2EwH6A3s7MgBORsBW8DvuEEbG2fHQI3yacjsBfDSKSC9
	xYWRQ2l7w6zQ5m2pbf0M8hrjl8VeqaPyElU05MwSbiGW7Vzy7gwIFg9u+/eNeyqFwIrvG6Kd02HNA
	FPSetN/RMU2f/eMe0EmRYliFj3Cn1J0ShXgU73olFPsuNCqU60qb/SY3eIzbiVLD9LS+sJRT31wU4
	fSjTnMJg==;
Received: from [179.118.191.219] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wjyk9-00FSDp-Bx; Wed, 15 Jul 2026 14:29:41 +0200
Message-ID: <e49be8bf-a3f8-4b2f-8e2b-379f4885b194@igalia.com>
Date: Wed, 15 Jul 2026 09:29:35 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
 <17d3c3f6-f040-45b9-adf7-6ef1d7cf4e3e@igalia.com>
Content-Language: en-US
In-Reply-To: <17d3c3f6-f040-45b9-adf7-6ef1d7cf4e3e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[igalia.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[igalia.com:s=20170329];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14022-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andrealmeid@igalia.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hpa@zytor.com,m:mingo@redhat.com,m:namcao@linutronix.de,m:luto@kernel.org,m:x86@kernel.org,m:dave.hansen@linux.intel.com,m:bigeasy@linutronix.de,m:nathan@kernel.org,m:vincenzo.frascino@arm.com,m:bp@alien8.de,m:nsc@kernel.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrealmeid@igalia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5249B75E37A
X-Rspamd-Action: no action

Em 08/07/2026 12:28, André Almeida escreveu:
> Em 08/07/2026 10:56, Thomas Weißschuh escreveu:
>> Finding the debug version of the vDSO is not trivial as there is no 
>> common
>> scheme where it is placed. That's especially problematic for CI testing.
>>
>> The vDSO futex unlock mechanism requires for testing to have access to 
>> the
>> inner labels of the unlock assembly, which are only accessible via the
>> debug so.
>>
>> Also for general debugging purposes it's convenient to have access to the
>> debug vDSO at a well defined place.
>>
>> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
>> regular 'make vdso_install' layout, including build-id symlinks to find
>> the correct file for each process.
>>
>> The design is kept close to the ones of the similar IKCONFIG and 
>> IKHEADERS.
>>
>> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
>> explicit dependency to avoid errors due to concurrent builds.
>>
>> Suggested-by: Thomas Gleixner <tglx@kernel.org>
>> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>> ---
> 
> Thanks for your patch! Tested in arm64 (qemu) and it worked fine. I was 
> just expecting that the file would be called "vdso.so.dbg", not "vdso.so".
> 
> Tested-by: André Almeida <andrealmeid@igalia.com>

Also, how do you suggest to integrate this with kselftests? Maybe adding 
an untar command to futex/functional/run.sh?

