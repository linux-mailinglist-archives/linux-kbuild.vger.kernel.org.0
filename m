Return-Path: <linux-kbuild+bounces-13325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fZn1EXSlFGrHPAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13325-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 21:39:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3275CE0C0
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 21:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB9073004D8B
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 19:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB25E35E929;
	Mon, 25 May 2026 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=toralf.foerster@gmx.de header.b="SELqpR5R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46DC18050;
	Mon, 25 May 2026 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779737965; cv=none; b=OWNWkMlYHSVe/DUYBwzm2Fc0FZzNMu+dF/YPtmfxhQzjO9JlYy9jKxKAnnSXnR/crJGKQYoOTt+uESJYhleVAKxFGPiEUBGaoqD+Jn2jO0jsuxiKG6Ld4EGc5F94XmmS+04SAYRRxj4WzmiQ2LmSrDrywHybbRvRQfkMbQYx3Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779737965; c=relaxed/simple;
	bh=Nj/hBdoIRB5edQlJ43Y92ck5H236yKTD1DeM7FqH7AM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=k0MTehtmnB8zGZlMUNpbI4doJyWAZzQi4FDf4Ny6uo7MByeoGjjchODiVPTXTKe5F5tSG4wIPRhz0xLUK6zDlj8JtskApL1r7cC4qBaT0T9GQPcJ+NGnO20FwNZdVKLMZ7x7mrpRtnODWs89IL1nqhDNKaxqpDILiWM8Tki39Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=toralf.foerster@gmx.de header.b=SELqpR5R; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779737962; x=1780342762; i=toralf.foerster@gmx.de;
	bh=Nj/hBdoIRB5edQlJ43Y92ck5H236yKTD1DeM7FqH7AM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SELqpR5RSNow80NxukX3TPBvHfBjnwPlBFHw4KzKph//jyk8YdOwKHZEr3xXYVYF
	 Np8w/AWdgzrJ+ph8UyrixxEAnM77RLahqpQAZOZsRX2x1/MxiyOXQBhcf3mNuAa17
	 CJQGWzAhKxm8PvDVF8mdneL4RJ53hc/bZ6lB6YSXofu0CnoagL8L3p5dApBQldYdY
	 cRJw9caXppDUydAcjjKkFCZ9gk59ngjffPxo5scxBJAKGRXcOMLzbmcZCXhXTk8bF
	 Sx1XmWj9BRmYlwroFsJLLPoQJZ0hR2PDFkslSS2Woe41wuhPMBZaeOJ/NzNZEhHwb
	 42U3thnmLepoX3kBDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUGiJ-1wsr9t0BDH-00IiGj; Mon, 25
 May 2026 21:39:22 +0200
Message-ID: <a47f9124-15b3-4dbc-a211-6161eb98406c@gmx.de>
Date: Mon, 25 May 2026 21:39:21 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-modules@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
From: =?UTF-8?Q?Toralf_F=C3=B6rster?= <toralf.foerster@gmx.de>
Subject: build failure for stablerc
Autocrypt: addr=toralf.foerster@gmx.de; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2BXl6XcxQKpR0/QkmyowZjn7lBePf3tz5iJbrGPoMi7595V8jFc
 9NqfsD2WN1L8UjjOLs3wwj9V22/JVp3K/g0Ty+CFDsPGEwAD7UyaOt+fl3kmiohbgtGJnLd
 qsmiH098WVIgZGT6BU3GP1jYVaIW9yMgAVEyVKV9D2wVqYq8++XYIhz/RAYUYm1S+I1aGbd
 HAopM5xo+Fd4md9PGDgBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2G389p6qmOg=;XvaZvK2YSpAm2DT/9igHf4xqTzC
 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
 aXkL9vMq8P36wZeMOu8f+EEQCcos0R+qzHVU=
X-Spamd-Result: default: False [-1.45 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13325-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[toralf.foerster@gmx.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmx.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 4C3275CE0C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

at a small Hetzner VPS at x86 the compilation of the stablerc=20
v7.0.5-1656-ge79d5c5d57c0=C2=A0fails under Ubuntu-26.04=C2=A0with

 =C2=A0WRAP =C2=A0=C2=A0=C2=A0arch/x86/include/generated/asm/mmiowb.h
 =C2=A0WRAP =C2=A0=C2=A0=C2=A0arch/x86/include/generated/asm/module.lds.h
 =C2=A0WRAP =C2=A0=C2=A0=C2=A0arch/x86/include/generated/asm/rwonce.h
 =C2=A0UPD =C2=A0=C2=A0=C2=A0=C2=A0include/generated/utsrelease.h
 =C2=A0CC =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/root/linux/tools/objtool/libsubcm=
d/run-command.o
 =C2=A0HOSTCC =C2=A0scripts/gendwarfksyms/gendwarfksyms.o
In file included from scripts/gendwarfksyms/gendwarfksyms.c:12:
scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: dwarf.h: No=20
such file or directory
 =C2=A0=C2=A0=C2=A06 | #include <dwarf.h>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0^~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.host:131:=20
scripts/gendwarfksyms/gendwarfksyms.o] Error 1
make[2]: *** [scripts/Makefile.build:548: scripts/gendwarfksyms] Error 2
make[1]: *** [/root/linux/Makefile:1325: scripts] Error 2
make[1]: *** Waiting for unfinished jobs....
 =C2=A0CC =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/root/linux/tools/objtool/libsubcm=
d/sigchain.o


The .config was derived from the Hetzner image and tweaked via [1]


[1]=20
https://github.com/toralf/tor-relays/blob/main/playbooks/roles/setup_kerne=
l/defaults/main.yaml#L9=20


=2D-=20
Toralf


