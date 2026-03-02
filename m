Return-Path: <linux-kbuild+bounces-11498-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBWhFBQVpWmL2QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-11498-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 05:41:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C04E1D2F72
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 05:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D288301224A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 04:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE63425F7A9;
	Mon,  2 Mar 2026 04:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIUGZZRs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9068C1F0E25
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Mar 2026 04:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772426507; cv=none; b=VSrg3Qrk6hCHlQ4EnALu8guEw4cV7mkc5f7aW6mh/UhWncrIv5of0U/SqrN4G5wBu0i8wXI8MMTUKkPUxuc7qRUjWNFp0pqdrsMq5m8IZ2lc+krufZpeM2I660nux48RXiJ6Jm43Y2YfqkXquOHOVK3GOxpjMLtL+d/o9L+YEhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772426507; c=relaxed/simple;
	bh=r12T0BHDr/VgtXY8OdzUiznMupH4NKfZsQudEcgivDw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Vq71WbYV1amlUXAQcgt8lDpsiuIIJaBvSjoZ2HMWTcgbNPyUtpllWWKDGLOMo7eOXEAYamLS7Pj16w2MEC3WJUDzD30ZVNtuHepAL4TelsTI448K+xwUHnF5bUfTLYWZz5hq+V6kQjlgfeErUh2ZOr05z2N2hF2I0hhVBBeAPG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIUGZZRs; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bdfd129c52so976874eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Mar 2026 20:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772426506; x=1773031306; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEdFoO+0diFiw3WTsgvpxOU536f11KaeaBqMvGKLXBw=;
        b=VIUGZZRsFK6sL2HIR5rLWAYfprMTYfUFVWOP0hivMJvVbWbyH8e/gqsm3GybXn7mZH
         siE8KEzqjYUwrlZRDSyafJRNKux/m9S+50E0vJxWnr8EyZNhz2XEOhMm9RTDFhxKotmf
         n/mIa8IhINupTZqmqz9fIGuHT5ZzVOWprcIlsDWHi9YVHrfDFGtJBLK7+7xArJGno+F/
         6DlZWbYKTwZVFN89UjOUyMSQakxE+nn21eMqRhCBLTJCGSHp9OM8xvuvUpTEfRw8HDXF
         WF7lLj8HX+vXGbpJlC5Kl5NJGm9SauVxVUHV04/vBOMNc5oF1MBVQUUV3gHpW1o/LSaA
         1MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772426506; x=1773031306;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEdFoO+0diFiw3WTsgvpxOU536f11KaeaBqMvGKLXBw=;
        b=D6nlAXwtXQqv373bEoNCR9CAeeOrHEGQ82gtXv3TffEuAe9tLqTNbN4v2Ibo9fdIgs
         MZDrN/WRXBsxZWM+aa6MvHYvT/6YtPK84yFE9WatFvxfficdAcMMjDk9GTGvSb7PE4qC
         9cWPz8dhsyuGOJMzhAnVKGLk5G1b5a6zpsC/te20DVTkHYI5Q8J9DgeWzYIUzC/pVPCi
         E7AMW6wG9YGQRfLce6Qvv6LLAlbw8HuEKLW5LhQb8xTvOx265UyW03x3jk9U/+NlZyhW
         a46muPtbDg8N1+IocBMsZj0kHDZRw9DPmidd1dAsi93Sub6EA9LN9HW3Usw5SC7DfEC5
         CRxg==
X-Forwarded-Encrypted: i=1; AJvYcCVahc2Rl/0qzXg62XwmwEwf6tu8h1vJjbXWK7EXQidzeWT9WitL0RyJaJYA2mLw1fG6gPApm8gpGmlVAb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCJKN4BiehJGRUieBCM7rOz2PgZwPPN7LFwHjSh57FlDDv03mC
	pwrBqyHC5GkdQPLEJcOmf8BCTXg5wZzl2d/CWWIyRP1VfYjYmIsjXHUc
X-Gm-Gg: ATEYQzwxU2jPyiSJ8jKiScjTt1SCueoLRBCxzFV6lfh1jNllUYWnL/8nGMLYlBjv/ec
	gEIycttfMML0e/2y7Bz/nZ73XfHwWCJpSqRZBBZDcaDQFzzdA+V0lMqZaYDYBjcy9O8NEUVr3lw
	XJ0yCyLho8nOoiC9O1M+wYtp07qmaJ5tuW/uq1NOWamtmepKH5JVwmuMCig+rMKrE58uAknM1+w
	Jzm+6K2eH2IoGjo+iyg/DWK+wRxkPPLuWBgRZq/9u8NOrJCeKT9ViGAW4tVNfGMhguXJ1jGjVBX
	e18wlcHw94Jy6uTJrYaLOMmMliqxShOvzPNexxsrdwANnO0XODShAbP3pDnGbKt5skai0n8WsHf
	BwRysNzv2FlctDV11uBODevZGUpRYIjSn1BUKOjfkrJkcItNFiVDjfVdS3c+VmzrO/6YXjjLaEv
	L8j9v6GcmixKjy912w8PsUnwcUzHfgyMPE6lscHVw92RTrpH6aRTcAS+A=
X-Received: by 2002:a05:7300:ad2d:b0:2be:171c:5040 with SMTP id 5a478bee46e88-2be171c532emr263438eec.3.1772426505477;
        Sun, 01 Mar 2026 20:41:45 -0800 (PST)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfb3f898asm4442903eec.29.2026.03.01.20.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 20:41:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 20:41:42 -0800
Message-Id: <DGS0RADS6WDW.3L4MGITVFJRJI@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: add projection infrastructure
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226154656.3241736-1-gary@kernel.org>
 <20260226154656.3241736-2-gary@kernel.org>
 <DGQZOLAH72HC.2OE3REDD7M7U7@gmail.com>
 <DGRGYFHZF7PF.1Q3MZ7C1SBRL7@garyguo.net>
In-Reply-To: <DGRGYFHZF7PF.1Q3MZ7C1SBRL7@garyguo.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11498-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[garyguo.net,gmail.com,kernel.org,protonmail.com,google.com,umich.edu];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adidevgithub@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C04E1D2F72
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 5:10 AM PST, Gary Guo wrote:
> On Sat Feb 28, 2026 at 11:38 PM GMT, Aditya Rajan wrote:
>> On Thu Feb 26, 2026 at 7:46 AM PST, Gary Guo wrote:
>
> Good catch!
>
> The code below
>
>     if self.end > slice.len() {
>         return None;
>     }
>
> is rightfully `>` as it's okay to have end being equal to the length. I s=
uppose
> this is what you mean by "somewhere else in the code"?

Yes the second check which i was referring belongs to `core::ops::Range<usi=
ze>`, I agree with you
it makes sense for `Range`.

> This one though should indeed be `>=3D`, and I've obviously messed this o=
ne up.

Patch looks good to me once this is fixed for `usize` :)

Thanks
Aditya

