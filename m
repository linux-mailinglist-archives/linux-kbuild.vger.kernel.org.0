Return-Path: <linux-kbuild+bounces-13130-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJZ5CHasA2oO8wEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13130-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 00:40:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B782F52AFB7
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 00:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4C1930381E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 22:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998503947B5;
	Tue, 12 May 2026 22:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="ql/ITsjx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.freenet.de (mout.freenet.de [194.97.196.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAD3386555;
	Tue, 12 May 2026 22:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.97.196.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625649; cv=none; b=guXh2qz535Al2mHzVbkDSPrq6PeLcdF+80n7SkWka2idOVjiSkfd2PH8tjVMH4TU86cXTK/6M3kAOruKMgov9xxy825qQgmu5n2DDlv42b3jxD9IHaKLxyZJI+2/YR/M78+JPDMMLDN1YcZVZ2oFbgZAYCLFWXR+ZclakE0vdGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625649; c=relaxed/simple;
	bh=ln+VSfl0rnoyCiCHc5pAyPHA5G/184rdV10ayOB+Olo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFhhOXaIGCQzQYDppsoq6Uii/cCaT12TpyfuTGpYVtGI65QsFh5W4B+0E6lGRaCJFwN7La1P0e+RWPPP2I0V2I1J4J0A02ZCiQhpX9qj5MhXj/8ZITmw/YXHcTW1ebckqJprmtQbsvzVs/9IgxG2Np+fD+dFDJvC7TpUWPDkTsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=ql/ITsjx; arc=none smtp.client-ip=194.97.196.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Received: from [2001:748:400:1319::4] (helo=sub4.mail.fnrz.de)
	by mout1.mail.fnrz.de with esmtpa (ID viktor.jaegerskuepper@freenet.de) (port 25) (Exim 4.98.2 #2)
	id 1wMvgt-0000000D49x-0zWv;
	Wed, 13 May 2026 00:35:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Vu/7piTjiRJXK+a4fQBSZ9KRZcRebjxlN3KmWUneMbM=; b=ql/ITsjx4jHCG4PPSvVa+G0YC2
	YUVZFvZbCE0RKEYMCnl/9PYzavaaT/zwXv5XccaoJapVPp5DnT+5A/z7wapUCzxGvhLsvmLC/RSuH
	/WsxUAk8Cksoc5GyxwBFCXRAnD0G6vny7fCfAUc/TkQK04ohidlsipdS2HoDtCe6T2avhRVNLHC3d
	i5Kw5cxnlrz80hP/CYmt9IpSN1vroxHzhR68eRXrgmmatraVPst8r22bKD50gmIzhbaanM/Uiqb1z
	N+EvG2SVt/1bB3xdnGIXzAPVPzbfwr0wy88/JjIruZVcGQ6ZrSiQQbb+ESKYqZUHQp8y2mxG6ZnU+
	CZvrmDog==;
Received: from [2a02:8071:a85:f020:1153:7dee:80c5:1678] (port=37682 helo=[127.0.0.1])
	by sub4.mail.fnrz.de with esmtpsa (ID viktor.jaegerskuepper@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim 4.96 #2)
	id 1wMvgt-001s1W-0K;
	Wed, 13 May 2026 00:35:03 +0200
Message-ID: <4c443339-5aa2-442c-a581-df25cc288468@freenet.de>
Date: Wed, 13 May 2026 00:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: pacman-pkg: package unstripped vDSO libraries
To: Nicolas Schier <nsc@kernel.org>, Christian Heusel <christian@heusel.eu>,
 Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
 <177489899701.2334687.2954985636789986091.b4-ty@b4>
Content-Language: en-US
From: =?UTF-8?B?VmlrdG9yIErDpGdlcnNrw7xwcGVy?=
 <viktor_jaegerskuepper@freenet.de>
In-Reply-To: <177489899701.2334687.2954985636789986091.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 1778625303C22228608349O
X-Scan-TS: Wed, 13 May 2026 00:35:03 +0200
X-Rspamd-Queue-Id: B782F52AFB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[freenet.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[freenet.de:s=mjaymdexmjqk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13130-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[freenet.de:+];
	FREEMAIL_FROM(0.00)[freenet.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viktor_jaegerskuepper@freenet.de,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[freenet.de:mid,freenet.de:dkim]
X-Rspamd-Action: no action

Am 30.03.26 um 21:30 schrieb Nicolas Schier:
> On Wed, 18 Mar 2026 21:37:20 +0100, Thomas Weißschuh wrote:
>> The unstripped vDSO files are useful for debugging.
>> They are provided in the upstream 'linux-headers' package.
>>
>> Also package them as part of 'make pacman-pkg'.
>> Make them part of the '-debug' package, as they fit there best.
>> This differs from the upstream package as that has no '-debug' variant.
>>
>> [...]
> 
> Applied to kbuild/linux.git (kbuild-next-unstable), thanks!
> 
> [1/1] kbuild: pacman-pkg: package unstripped vDSO libraries
>       https://git.kernel.org/kbuild/c/165e86c2

I can't find this patch anywhere (mainline, linux-next, kbuild branches),
but there are no further comments on the mailing lists.

Was the patch dropped or did it get lost?

Best regards,
Viktor

