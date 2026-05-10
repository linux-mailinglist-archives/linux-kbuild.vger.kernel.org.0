Return-Path: <linux-kbuild+bounces-13099-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPD2FY8PAWppQQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13099-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 01:06:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65429506BFD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 01:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C82A301A384
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2026 23:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE04375F80;
	Sun, 10 May 2026 23:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmsmNZsx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9FD33DEFC
	for <linux-kbuild@vger.kernel.org>; Sun, 10 May 2026 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778454395; cv=none; b=e5/kxdnQNnTXfQZ0ddffdINQYZ/Nnunc2P5hNyEhFLAtBwKbt5iK46T7WCNPGr29MLxLMITu97+N/QaDB3NPxNH5f6ZQvl1k4g7ARzUm0e6Kwmm9vdApXlJ3Jda/PkpZ48A52gYzg29Gui7G7H/SLQ9NWKFXODPY7ahPOjURh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778454395; c=relaxed/simple;
	bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+rl+MhFhCFwD5ASCB+4MG5X058UZ8DJdBBWaWySOkQnSuS3jE+vpTc8j60Lrf7oTOni5M+YMXlDRchs/jHFTa4bnoW222WtC+cbD1RJ+cSDw2TvKtNw40DRfOz/5LybsIyADdzFsE0RyaiSYlXIJssSgWLa5VDRN7WKrD3QYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmsmNZsx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso2027191f8f.0
        for <linux-kbuild@vger.kernel.org>; Sun, 10 May 2026 16:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778454391; x=1779059191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
        b=LmsmNZsxlnX0RFrXBAUgz3AdYYmRjtiQ0pY5/vyXLRxHlmF00je4/4S9LQ+1vKMebq
         IUiyDVTrncoW0BUICF7cLnE9sCUfVrd8iugJew5xynHN7rzpGGqrPmnw/YRqWLSzrLmd
         lSNITbfs33K4P28tc9FG+pdWaZosD/h61pZUzpuC8tyTp/OmCGifI48EBRLOcXxi6+q/
         fJnSobTyIBDZwSdkcG+gNKtqBvA0xQrhg9SRMFAveCc+/GpkJjYEqA1WXwhEU/5LyquN
         bUN62Qclos/LBxRGvc280xxAbj6RMZKBGeuSestfgND534w3M1185tma5fvIXbs55fLO
         cS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778454391; x=1779059191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
        b=IQJSF7WBLcnkAWF5ulVkhEpbpbmbZ7j+JG3RsjIaSMOhE+bHhtHwSKl21yJdalbsHi
         zpDW6ddt2dEFC9Hvqx8kxhh9wodo/tiJCagU3UAbJpaLdMZp4iM4JS0W69WMRBPeAW5U
         pZsO9XhKMzzjjAybyI28Od7bxUu9MRUE9kE73Uv6CS1bRW+4HumDs0ZQEtq4C85KB2I5
         kobCPFTX9SOAfiVaWzEgi6yrUhB5mQE7RnOvt0kC8BIjBwBSStP7KMCqVQceKVSye9wh
         zKmiLYhUT4DZSE0oSLarOlQUmRkEPkhfaoVonZ8EkAaWUj1/FImUdeSyGVR4BTo/T7Az
         ln8g==
X-Forwarded-Encrypted: i=1; AFNElJ84hdKnH/SZMKI42Grl6ed3k9V5KogvWQV8JN+WJlJUyOEIQ+kDAPxA4XkJU2XUSaQFPcWCulW3wV+Bo2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMnJxrzS+DomVg0Z82S4ww/dc8c0fu40lMWZkvJt04nBBCFlL
	RH2N1q5sXQticUibK4B13RE+4Efiav4k9h73O7wFgEcXpL0ARvlfwv9n
X-Gm-Gg: Acq92OEZI1n62YLSFVjmOCbyPl+z/Hc7MxFrWF9zD31ChYWihw6ZXE1gxEao3v1TQcw
	7+SpWDeNYR58ddg5arPJyJMdrJ4gU8Vr5fOzpwXKXEWsONuG15lFsojHQYuoxM3J3zdR6qrQtdz
	Xhtukg75ZjB079Ks2BLXOF5R3IU2+SuY093Lvw3xNxP4AJLvrXkP2sIouArpXM+zYbW69xs/Xi6
	kvxRYdvgBMtQvd3dVgtyxC/qQwuj86AzBPMOVwi+xN4yhNawwhPQHFwlnYBonptKAp5rtVJbn/r
	83rCuwC0ewg8ffoJj9RfNy+T1gNO2b6qRAg1d/ieGXzpVLiM/dSXbZzJxanTByYcatVSgnoshhF
	k69kFbZ9Dz2eM9jOqEIaKiU98+ujuetPzkriRo5RQfEgmKW6Lc2umCR1O+vjWD0cy+lY0m0bWjl
	C3NflruLtGYa0gg9ZvJBXg2dxGE8mJD8DAtiAUgVZVdLpPX60xDWIL49M=
X-Received: by 2002:a5d:64c7:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-4515d5c6c70mr34288383f8f.35.1778454391049;
        Sun, 10 May 2026 16:06:31 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm20984879f8f.9.2026.05.10.16.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 16:06:30 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <851ccd3c-d86a-409e-bd73-f0ef10b85879@gmail.com>
Date: Mon, 11 May 2026 00:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/2] add kconfirm
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jan Engelhardt <ej@inai.de>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com,
 akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org,
 corbet@lwn.net, qingfang.deng@linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
 <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 65429506BFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13099-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,inai.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/10/26 10:49, Miguel Ojeda wrote:
> In any case, when we discussed offline building in v1, that did not
> necessarily mean vendoring every dependency manually into the tree,
> but rather let the user set up the dependencies before (i.e.
> connecting is fine) so that then the actual `make` steps can proceed
> offline. For instance, using `cargo vendor`
Hi Miguel, thanks for clarifying. I think I like this path (user
downloads dependencies themselves, outside of `make`) the most. But I'll
wait to see other opinions.

In this second submission, I had attempted to filter out non-linux
platform code and tests, docs, etc. from the dependencies by using
cargo-vendor-filterer, but yeah, it seems to have missed some things.

So in RFC v3, I'll likely use this design of having users run `cargo
vendor` first.

> By the way, another option for that may be using the distribution's
> registry (e.g. Debian and Fedora provide one through the package
> manager).

Unfortunately, it seems that there's no built-in way to fall back for
other distros:
https://github.com/rust-lang/cargo/issues/3066

The workaround could be to create various Cargo config.toml files, and
instruct users that, for example, if they want to use the debian
packages, they can download their dependencies using:
`cargo vendor --config debian.toml`
But I need to test this and confirm first since I don't use any of these
distros.

I appreciate your thorough feedback!

- Julian Braha

