Return-Path: <linux-kbuild+bounces-13984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bh4jEPWgUGqF2gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13984-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 09:36:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AC173816F
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 09:36:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=zytor.com header.s=2026062701 header.b=g1UIIdk5;
	dmarc=pass (policy=none) header.from=zytor.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13984-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13984-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EB603006B27
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 07:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199C637881D;
	Fri, 10 Jul 2026 07:33:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD514A8B;
	Fri, 10 Jul 2026 07:33:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783668822; cv=none; b=tGMwyGXfRzVXSf8p5Ktr5rUdRpdQ24niWdQMTnG+G56cDQ8OdzljFBLf1cGLoSet0mQEw1JqUIPv4HfCnJY1zT8cls3uskJQI5Vff1j1pjB/mxV5o++K6XaV2neBi8L303zl8ZwvW7mov83bjYgWkpZFZPt5dLPlZEsLLZSZnv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783668822; c=relaxed/simple;
	bh=kNsy/6tv8sfSadwcHSU7jGy9MP7ecHLyHUyiUD9PN+Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=eF/A4lZngZcqOvyraT+thWBw2sk0FoPPyLvYURrl6sz754pD5qQWfcJeovX1coAe2hEtl+ejd1ShZTn40Fb0l7iRFyqa4rrD5zrBAtGsZV687aQqKxSHkz/N87HgLNS/BsM4KIuiYSSd+ZAHBUU7aIeakMPJf1wSgfbRv/yFfO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=g1UIIdk5; arc=none smtp.client-ip=198.137.202.136
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66A7X2x13244461
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 10 Jul 2026 00:33:03 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66A7X2x13244461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783668784;
	bh=R7qHRjvq2LJmHgy6sldSxUlAWJNI91+gaFZFN9Tqg9I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=g1UIIdk5pjqV2N31jmsKpN4koJTZcIovjS1U1+JkReNqzgb8ot9onoFRPREBkTcTh
	 B9yqfm+MwyMqAam2FtNBxLTg/LgVr+iLebT/WYtDRMhrOlvVLYvyGDlPRkR0gV+h13
	 1kzt8aKBAzwWrfH52Z15bhIox2bVdFlQf/Smn4IaW9cj6xn2XO7Lf9kWLAI/MusxzH
	 GwGImpzCCpv3/pmk3srR566CHzEI7wxtdpCQDQPafWF56dPwM7HFeV2CVcsBJxFRLg
	 m7kuq0OXtnsFH7ApgHHPSopN7qL7KHIFp9L/Ou49OahvdiWWW5M2B9giLOAELf9JSk
	 Q0YkMgwIWh3/g==
Date: Fri, 10 Jul 2026 00:32:55 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nam Cao <namcao@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        =?ISO-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
User-Agent: K-9 Mail for Android
In-Reply-To: <20260710081440-d355b1fd-c34d-40bb-965c-8bbe2a8c375a@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de> <947ba63d-59d5-4f4a-a037-c9de100ced97@arm.com> <9131ADF7-6D08-418F-BE2F-2E99CC83FD2E@zytor.com> <20260710081440-d355b1fd-c34d-40bb-965c-8bbe2a8c375a@linutronix.de>
Message-ID: <DC26CD8F-9767-4544-A157-8367439CE0BA@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026062701];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,m:bigeasy@linutronix.de,m:andrealmeid@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hpa@zytor.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-13984-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,linutronix.de:email,vger.kernel.org:from_smtp,zytor.com:from_mime,zytor.com:dkim,zytor.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86AC173816F

On July 9, 2026 11:36:25 PM PDT, "Thomas Wei=C3=9Fschuh" <thomas=2Eweisssch=
uh@linutronix=2Ede> wrote:
>On Thu, Jul 09, 2026 at 12:06:07PM -0700, H=2E Peter Anvin wrote:
>> On July 9, 2026 2:57:09 AM PDT, Vincenzo Frascino <vincenzo=2Efrascino@=
arm=2Ecom> wrote:
>> >On 08/07/2026 14:56, Thomas Wei=C3=9Fschuh wrote:
>> >> Finding the debug version of the vDSO is not trivial as there is no =
common
>> >> scheme where it is placed=2E That's especially problematic for CI te=
sting=2E
>> >>=20
>> >> The vDSO futex unlock mechanism requires for testing to have access =
to the
>> >> inner labels of the unlock assembly, which are only accessible via t=
he
>> >> debug so=2E
>> >>=20
>> >> Also for general debugging purposes it's convenient to have access t=
o the
>> >> debug vDSO at a well defined place=2E
>> >>=20
>> >> The files are placed in /sys/kernel/vdso_debug=2Etar=2Exz=2E They us=
e the
>> >> regular 'make vdso_install' layout, including build-id symlinks to f=
ind
>> >> the correct file for each process=2E
>> >>=20
>> >> The design is kept close to the ones of the similar IKCONFIG and IKH=
EADERS=2E
>> >>=20
>> >> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
>> >> explicit dependency to avoid errors due to concurrent builds=2E
>> >>=20
>> >> Suggested-by: Thomas Gleixner <tglx@kernel=2Eorg>
>> >> Link: https://lore=2Ekernel=2Eorg/lkml/20260602090536=2E045586688@ke=
rnel=2Eorg/
>> >> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas=2Eweissschuh@linutronix=
=2Ede>
>
>(=2E=2E=2E)
>
>> Why stuff them into a tarball?
>
>Because it was the easiest solution to implement and has been sufficient
>for IKHEADERS so far=2E I don't see a clearly winning solution among the
>possibilities to expose a directory:
>
>* Use plain sysfs:
>  Requires a new code generator and potentially changes to sysfs
>
>* Use a read-only filesystem like cramfs/erofs:
>  Introduces new build-time and runtime dependencies
>
>* Add a new filesystem backed by a tarball or cpio archive:
>  Lot's of complexity and work to implement
>
>But I am open to discussions and other ideas=2E
>
>
>Thomas

I discussed this with GregKH a while ago, in the context of eventually mak=
ing the vdso an actual mapping of a virtual file=2E According to him it sho=
uld be quite simple in sysfs; I got a bit stumped on the necessary hooks (t=
he kernel needs to keep track of where the vdso lives in the address space=
=2E)

