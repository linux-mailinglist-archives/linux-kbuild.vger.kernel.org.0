Return-Path: <linux-kbuild+bounces-13649-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H+7NJpPnJmpsmwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13649-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 18:02:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA4658761
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 18:02:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a8tOGT6X;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13649-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13649-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E62AA30D6920
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 15:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B7430675D;
	Mon,  8 Jun 2026 15:30:57 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59D6346FA1
	for <linux-kbuild@vger.kernel.org>; Mon,  8 Jun 2026 15:30:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932656; cv=pass; b=iM9L2F2Y9dwdoh/C7TlgmjABKU2yz8NabJ6FcXFHysO06JlBp2LgFiysTm/ISFMPrGrq4gstRRyfKvg5PVK/4DoVhBKpiZyGsvzLR7p4q/PTiCNDrcskTFK/G0JD8TRDpmG7RWiBAQX92+zQly5QIeva9rncYEKld3gHgnauApk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932656; c=relaxed/simple;
	bh=KoDM1ft57+IHqajAZD3LZL4ag5QYUfsdvyP25IXaXmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpEPtMKG3zkeaMVWPKlM6fZn9R/WTVXIomJ8KP7QxUgi9pmByCjJhEuBNsR5JFT7PTbCXB1LCMRywjVBSAeRIhECYDWD+m/F6MKCgYcHK7cJs8OoT1TFAGcGzfRxWMYVA7zlFa8ddIGZRNiUr6SYO/c61uV0G3jfZ41FVK7gw9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8tOGT6X; arc=pass smtp.client-ip=74.125.82.52
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137dd3b29d5so251737c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jun 2026 08:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780932655; cv=none;
        d=google.com; s=arc-20240605;
        b=Bct9gcqlxRzDlc4T0+Mf9J+lXXnNqsciTDeFJMgBw8cOy3WeRsI1+Y44Osz+8nlL0I
         38ywDE/Dv8WIWesCIgUkET1EmHXBi4RysBDPTLgoHBJvrjptaj/me41rmiD5VfRA0bAU
         MyjOZ3kv4a5M+IE2vAv0mZaxI6vVMLIgDxgK8F24r4AMC5+e5BHoxj8XXHbcygG+rPpl
         4RFS+2JvLJ5pR4RXMqNStHfe3SI2sTraXD2/UjxY+1M7AW4Gvf5rlujOSyA71zq5BEvw
         aVtkh6V/IXvs+KayYeuwfkljhsbTV6TUijnZzFg40VGYxF8Y+/jtCIf0UntVsGJdfWuT
         77RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KoDM1ft57+IHqajAZD3LZL4ag5QYUfsdvyP25IXaXmo=;
        fh=VU1Xgp686CzYFsFt2q/XBxV4T6KLYWe2YbccyQ8/MYQ=;
        b=PyUiy6sFr6nfO/LqBOzmJmsbdjbY6kPmoqbTZKU8LOQ0mVVp48LiKpq1m4gsiAW/hT
         UKAF/+r+j8YwxRB8jC/Mq129hf1JLydewvBQNK3XaNvEWWrrseVxgspTAh+ulGYyfunT
         V5TYLGlhzuBym6DoJ3ASpyWPr2Jq1XpAzMWHjZE3OBo2oIeiys571TkHy4cZDGhvVtED
         64+SMRS/UOWrLMoxzkBh3R9LhuLI6Ihs0BJW3r0RBzZe0v+CHaUr6OV9thwE/o0IcTCU
         J09cw8kzSpfTrCIfMcUQtcjCstbFO2QmrDTTnrd7olxmdZEaehbxekCqLia3Ui7pQZzJ
         SpEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780932655; x=1781537455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoDM1ft57+IHqajAZD3LZL4ag5QYUfsdvyP25IXaXmo=;
        b=a8tOGT6XPL/x3C3vzwy51dDb3hgg9I4w2/y4BYsQif16P0TlVypwUZxBq/kZpwIl+3
         XZtAM00Dclo6i/aCxGNviPt6poRnLijRl/jejWdSd76K7+G+zzeH3PCioEcEcY8ic59y
         op3gepR+eZPCze2TqL9job2x0jCXFyb1F1DuFJNBm+mcXGSLvM2jxpuEmIreF9XyHN2B
         qGha0PC3lfpEbELQ9A+wgKceAfwEiWnrUHFb5Q2gBpBxjfrqWNKPFyauN6PBBKow3GpL
         RyCOP86KYlqyB2QVJtCa5TD5xzFFUbzQpKvuru4DsAMsEzlZkWiwzQuwdfqymdf5YMqO
         S1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932655; x=1781537455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoDM1ft57+IHqajAZD3LZL4ag5QYUfsdvyP25IXaXmo=;
        b=UZ6Zm9leWjnPyh7g9TqMYo7go06H7L6RAenmZT+2ubgiMUyv1FpcjTEmfjSJXJLLol
         FkrTF3eXUs/BsXKKrl4GrMHWeiS9IagRIRbpwRbauej74kXDK7d9SWJDCIiW/uOQb0pq
         dIIQdCxiquSPxCT3PuUJav3A+48ofFu3OEvDX1VHXUso6nvIpkpmipG/Uf+WYxrG8ezS
         gWqPT71TehA/t3OR/Z+iqYrndCo/uQYTM6AjonwWpsu2eRl6LoGsjdpIX6S+nPcjUxvl
         0zX0y7X/z6j+8VyaSuFRRrrC4ZXDlSbo3ZWMTUJNdR1ba30H0eCeQNiGnb2ub0Al1W9C
         zLSw==
X-Forwarded-Encrypted: i=1; AFNElJ+RejmklRNZecbnpVy01p9YihYiWFgJDxSjKW6LdTyb7u2JTe515ea4avVy9rbXiwqczSDhmCVTnGhurOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBnXWib1DdafhI2/JwOj/vBks5F4Xg2iDrjhTmKIuSrQiGAtr
	hphH5Afj72DjrMQJJyXT5knwtFwdLJN+7yOPFv79L9sOOr418U953tdtDrAwFcKmR9hHGpae7ee
	FrH8CL5TzVgidZxN85KaPt8J6s9ThCsU=
X-Gm-Gg: Acq92OEDiJp8K4M6pgYlUsdZququ86qxTD7B3fQSWyD4r+mg5kweUlAYVy3+pYnBqnc
	51HbpAGjBP539mHkD07pf04+G2XLLXats4dngqguweTQPfocx8fDDEh1JSo4tg35Sb2yKVMR/38
	ZKG64mmNs4kFBbycXJwKNKtKxJ8yQSuckPdEnZltMUzNYHPM+fyDXh6UqXi+kBh0+I0PuJRzqOV
	2DE/72FCNiQppTnDQPwoi5JK6uyhVaFhtlJ8O5SABr1VxS/1XdYEU3Gw/MzaeEpoTKyk6v6bYPo
	WAZ5D+UFM0xftUdL5A3TKIpnkNE9xH7xRfgZYuRljl+8mcLk7L3oyzg2gUZ8+om2a/3K/jcuGZV
	k2ADgi3ZVBcDj1BQ5JFByxxbdoy317SCcQQ==
X-Received: by 2002:a05:7300:3b06:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-3077ae6b572mr3167623eec.2.1780932654619; Mon, 08 Jun 2026
 08:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org> <20260608141439.182634-20-ojeda@kernel.org>
 <DJ3QP2IPKKZV.2L0CY2KLXP4LD@garyguo.net> <a2079a1c-098f-4f24-bed3-ecd9ab97b868@kernel.org>
In-Reply-To: <a2079a1c-098f-4f24-bed3-ecd9ab97b868@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 17:30:41 +0200
X-Gm-Features: AVVi8Cf_c-DZas1gA5Ce852YBnxXFdgvl49984uxOVbL-bKWanfzmu_gwWxAcQY
Message-ID: <CANiq72k-DOq2b=cr9NshGHyc9mOTv4kpamnKGiSUG9iOhtgMnw@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] gpu: nova-core: firmware: parse
 `FalconUCodeDescV2` via `zerocopy`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>, Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:gary@garyguo.net,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:acourbot@nvidia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13649-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,vger.kernel.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CFA4658761

On Mon, Jun 8, 2026 at 4:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> There are still lots of other places in this file where FromBytes from th=
e
> transmute module is used, thus the file still has an explicit
> transmute::FromBytes import.

Exactly, it gets shadowed and thus the methods (well, associated
functions) are not available in that case.

For files that do not have this, then we don't need it, indeed.

That why I mentioned in the Zulip discussion that this "incentivizes"
developers to remove their old `transmute::`s so that they can remove
the ugly line ;)

Cheers,
Miguel

