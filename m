Return-Path: <linux-kbuild+bounces-13859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SGnnDGOlOmpGCggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13859-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 17:25:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9D6B846C
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 17:25:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bqRXKUc0;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13859-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13859-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF245303BE92
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 15:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1773F3D891E;
	Tue, 23 Jun 2026 15:25:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF53D7D69
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 15:25:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228320; cv=none; b=t/3afAK4mpCJURhxHKejgZYGcvnouROQfrA5vbmJZciVOqEludeEPvJMtQ9Md5sWhIWnOtuqrrRANWq4LuWFDgv2Eo6WVfOAwjZfx5o5GqVFXaVkU43aGMgOJrrbXPat9rHIE2WYK4ybdsBN3etr+P4X5WDw5p8Vuzqw9bx9j00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228320; c=relaxed/simple;
	bh=1aOFWwkUtYEA+dxV+Ic111WnpJwOUBYT+Ro9zB7ChsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hi+Mncw0OPGCKaf5w2M2teraQKFjy2kqsBdcb4iteo5MscP7w8hOdw7/1lIe8dPfzCtd8eQmUGoXL9dFPt58f0jcoP4YddyWyrax1jxNcxSe7SErIyt40+ZV2PK0xw+okO8rhWC08l3CB+LxFa4DBJy6qmfGYbmyz/zg18nL2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqRXKUc0; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4924593f45dso174185e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782228317; x=1782833117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1aOFWwkUtYEA+dxV+Ic111WnpJwOUBYT+Ro9zB7ChsA=;
        b=bqRXKUc0uZVN+6nbXrY7kO0Hg2r8UjRDdHa8vuczMZZNnpxs3If4Jau437k4Q4woam
         wyAz/CxWbRtMmsRnd7sCONzi9/f68mQrprVMsobeegl+cJCnxmqRv+XXMnX3h8NiZEQ9
         zhxY0e4JPcHSn5vadvpuccA6aixa11MsTONvqSM8Sx1mbloyZdhGygr0Om3wb4ap2wBh
         Gq+NAoiUAGTPtdA2ma7D/UhIaYVRQXk+u5CImRjjGEWsz5ceX7Eo+OaYSYyFxxnaVgaA
         6LCTluuwrXmlm4mS0DkPL7oKnv0d6sFE47nJxLqilSbimr6spG5yhS4pRQFGJCYMbHQb
         f/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782228317; x=1782833117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aOFWwkUtYEA+dxV+Ic111WnpJwOUBYT+Ro9zB7ChsA=;
        b=IQyULwSy3LoJ9O437uKZvBTNRitc2xMjmlmIkwYyjiCZH4UHwAYYwHgW0WUSFK+4mA
         ugoZi48W84AzFkNVEv9y/oe52GTOkg2YAajxpF9rfXIxcQJ3wJ9RpwfENgOPPAs9pHRM
         ReJTAwuuzmgovYi9sECUN0iIgtLAoDS8Xd5V0vcrOAeswWT8L/hMvz59DlObbmY22zrW
         YtpsHek+UjeOkkwgxUXbP+LXGZc6mR4iwb8IRufndi2ig37gIpmhUSNfNpyq1B4i9oF+
         Jza5GHylfQDE8acbCun5xZUuIXOZAas1iXb/KWNlMEtHEc+YnmgOWnuFzlCE2t3hsZR9
         i08Q==
X-Forwarded-Encrypted: i=1; AFNElJ9vg3OzDtaVsbci8+j36OWuqf8Ur+TNRAZc8ZqnkfaGSKbAzc1xM+sGJ1zyq38Cl9Z7lRK9Ps8IFSTeBj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhcmNlhaKvUD5pYhgBWXo2GFMmAVUHwQxqQXf6su2Yf5hTzy4
	waoeKCQkRs327WYWyZLK5V63WnN5a/VdxLsShTMSSJMzDqgevCO4uIyGsHJvEB/hM1U=
X-Gm-Gg: AfdE7cl+s1rxqPkyNALsesCs5CFjSQWgrrtdEG34RU+emJVGynSwCZIsyx7XL9a0ObJ
	KX2GavW/Z95Z5O9L42GZiWdcLHxInGkPLdDycmibXiVZA23HLFTZleGqOPdNSB+2jGkJBr8DkVO
	pIFIGESIE997mi44bhyrrOMioE69JKnICqQbZ4Owvx8pAxUV859lkELNmPyPVvuhGTa58GnczZh
	/+ZChV2GLa8VhmV6DG7kP4yvH3VDQCK8rioxEKzDnYpEPLDGMXq9mtWVIpXkmWGOpWlIXml0zzV
	USvclji1KW6LI90rAirIHx6DAJ/c0O1xGFF0y5BC2j3806+VvM+0NXR9u7BCo4F3yteIA3lpekE
	ZuKQM8Aq6vBUql/i5C1sStqwFn68fPAJsLfNBofeLUDklVvD0+gYFBFe8uO0MaHsitXT1Mt9LPc
	BG/o/pdGpYzSz9Veb1xqXfmhXcBCS3hZJvujDaxu6UXauW2sekE42NxHslysJSTdJHAVcs3LV3l
	7VstRlr
X-Received: by 2002:a05:600d:6443:10b0:492:4e6f:d994 with SMTP id 5b1f17b1804b1-4925b3b7be2mr37785755e9.32.1782228316914;
        Tue, 23 Jun 2026 08:25:16 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm38204783f8f.12.2026.06.23.08.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 08:25:16 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f2520b56-59d8-45d1-8f38-90f2472c96e9@gmail.com>
Date: Tue, 23 Jun 2026 16:25:15 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
To: Andrew Jones <andrew.jones@linux.dev>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: andriy.shevchenko@linux.intel.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org,
 rdunlap@infradead.org, tfiga@chromium.org
References: <ajo4DVWoSaEZtBDa@google.com>
 <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13859-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.jones@linux.dev,m:senozhatsky@chromium.org,m:andriy.shevchenko@linux.intel.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:tfiga@chromium.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBF9D6B846C

Hi all:

On 6/23/26 16:18, Andrew Jones wrote:

>> I wonder if you have seen KCONFIG_WARN_UNKNOWN_SYMBOLS which seem
>> to be addressing the same (or very similar) problem (unless I'm missing
>> something).

> Thanks, Sergey. I wasn't aware of this. Is there a way to combine that

The two tools do not do the same thing. One is a check on .config and
the other is a check on the Kconfig spec.

Drew and Sergey, please try each other's checks.

- Julian Braha

