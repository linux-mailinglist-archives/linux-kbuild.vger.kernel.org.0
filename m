Return-Path: <linux-kbuild+bounces-13692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3n+VI0h1KWqSXAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13692-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 16:31:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DEB66A3BD
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 16:31:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jub2Kb0r;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13692-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13692-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6114A300A5B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 14:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4530833F36D;
	Wed, 10 Jun 2026 14:27:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA4931E835
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 14:27:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101646; cv=pass; b=nBxn5I/1IdKv3L0w3f3dZD7nJaJ8AIaS3dWxI0Mt7LzzWkn4ytGfYOmAqZhH/J5eCrUWYebJGaLUVm/3CasWNsygd78saw5SG0jwGH2W4J0omK367Q3UsUaU5/0jK8ttOEsOyuHvjm6w0WNYKg9BVlXLo4swg6scxSh+AbYOdnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101646; c=relaxed/simple;
	bh=Ok/rbqLeCzI2OFP50FHtyotHAoqNQ7UvvpP27mkh7rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quUvFB8sJ0yMkYGsQ/tgg4phuParoxlsHB9cPMz7/8oz12LS0K9Pap8m3iwz5PLxFC6oroWwtwvV6DXS0w+7+At3ZSP/pbMv5KH09ig2gF/+/K6F0ht1Cts7V1iZA5/jdI8IwxZw2cNzxJB6mVhktkrUB6bp8oI6hkK11PH9k0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jub2Kb0r; arc=pass smtp.client-ip=74.125.82.182
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304cf9a02f9so394295eec.1
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 07:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781101644; cv=none;
        d=google.com; s=arc-20240605;
        b=XT/d+JP1o79i+NeLw4KTozycUt1EbFIFErgz+oRbXcihPAA6v4eSdcnxEpAG+QVGqF
         Lgp57btPGChTK09SkiIPc8lNdVUW/CbohpMyXnGtO6JSII6Q3u4zguzRWNPzJR1Z1N42
         JZyadGgRcZTVsSelf63Zvw3q04dgSgPTeFMpNVKWpmK6ziq0c3uau9a4Y2d1/iFuUWxa
         VF5Acy3Lj6Bgi59vEwa3KVk7Z73xnNiladfrm3NoX7XDFCJZXsgY26Jl7cGJgzEob/VC
         bXHX/8l++UOmZ8Hxkbo98A1qFULzh2yN2KVXVzwJujLXtFYH2+d4guzYwphuo4A2/mYM
         x+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y+ePQdXcu6Ws/M7mxUxyentMKwvQYHKiXci8ZFhewXA=;
        fh=HLomruNqRBpruxxCSmRIeVQwRYae0z8XU825w2aN+lI=;
        b=bDeqINh4gornHM/ADS3WOUBtww+E9nqpXy2jnmDbX1zqfwlMBiGwl+GMNT5tv3hEvZ
         gQIX3TlKNNzyLl/rHdg/Gyd9i6NoNRqYFlDTKQZMHsOL75nQdcuxVLr0pzZ9WdUmpvRo
         Zyy9PtI3UI6bSFbzSX2bo8Qgp2bSlM5hbocNkGw8JUfpxxPJZvWRpztjoQyvKryv1VBg
         K7vFmWzMaCa7ZhN3LAnbL0fCE7R4Kf4zm7AX1SIdgYxpdiZHiosufb2PTUN3DLX/ageM
         PschC0JQw8TsVlcKcC4bFNjaiKjVuSWov9NRpIEo1O5xcARipHW3vAE0zyIu9iyRPddT
         EdRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781101644; x=1781706444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+ePQdXcu6Ws/M7mxUxyentMKwvQYHKiXci8ZFhewXA=;
        b=jub2Kb0rq1eHF2sz1CqwcJN74SSZBsU2qtMBnTRwrSyikyFnrU0gb+C5s1G/ii73Cu
         1bIg6B1dXsNR+pGcv80B5eDZiLGbctnezQ3fwb77DFSXK+SEZMoPmwcTP5TklR/L1qJe
         w3DA+tN/bxqEKmU78lJn7shZitpH31sy2pZeUilfyZl4ots5IZ/LTiqjkOCSqffGj3xy
         DRghVSMQn/x334KFQ/qMbWWceftT88Xnqf4e84iEaBUaeGXK9DCSwahciXiokKgHG1Zu
         SHDPmttWoOoCCNf9hSqKS1JPcD9UpWt2U9AUGAZpnlqZpfDwiIXpGMgUPrtWe8NbqYnY
         050w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101644; x=1781706444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y+ePQdXcu6Ws/M7mxUxyentMKwvQYHKiXci8ZFhewXA=;
        b=mIPimmhb049AxGb9b8ISaILU1jmx2Iu0GZqSh8Zt1c+d1Sxd/nNE0G51IaXIYeDzY4
         OLgeDsTdBBLgbBDRGcBCd8uFN81U/BI+KcaZxSNt4nSAeODf38vT9D0diWpqikC3kush
         mWlH0VhfJ9IP4+uTEZTcsU0WAu8F9hcS6Uwg/tHY5XeQQSGli5Y4C2obLYaXmjwTLx7F
         WDuOMrMWv7K5dVs8bckEZYwQ5iEL6z0RFOVgPusksl6svQej8p04rj49EKryuOGJwaob
         ubncNyEvP9virF9GdHSB+mJkY1+BCWQeR/HIRp/81ikvgQrLDUujosNc/WNc9Xr1zjrn
         gqYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9McTL/FWVMAawHrf0IpExvlwrp1SS+z/bT8lE5Kuiygh73Tbak418v424azcO3KU6Mf5vM3oXYHYYXEpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeu7U4IV1fQ8e0soMuFPYaipLTA/9NuQnmf4sOiSqjvSyAamEt
	v47BCmgTpIURKIfSB95KG0ekg4XufoTFC5WznE8T6R2dRu1uR2PizoC7TiPtM6N/eg6WWWoY9+f
	CuYgTNcjyHnWRLk1gBXbbXakhi61aa3I=
X-Gm-Gg: Acq92OFPgaJ0w4aPWs2pU+mK+hNkkh7gpUW+fXt22HNNlBoyahsF5EPY/oZaFMbvhgv
	wuEbOgQrMl8Of2g4Hhh+qt5NgP5sGj4Q+H9RKMNXNsrOjvFuYAX0FVsRm4c3NzdGEjPj7xSdyE+
	vJR8cyXa6EbvhzxDvy5edyN2PKEwLFJFXpOo0Ok9jaL8V0Q3TdJVVvYm/kpOmwXlj1QruYct2vC
	N+MoroM/gMNOkpptkuxHGnte1CSG7e9IvAWjnV1m0Qz1q9VCKtndkVoBt/nAPoYy703SMudJ+3e
	4IYNTWZNWrts4ikEDXxvJht1dQAbtxBFoXDIR1cneex9/2ZU9eKWxw1XGDUVbgAp2oNYmpEfm3T
	C2CsMJFRN0FxC4lyx/F6K2TW4F17fJJqfbA==
X-Received: by 2002:a05:7300:7647:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-307d5cee0b8mr2539116eec.2.1781101643966; Wed, 10 Jun 2026
 07:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-6-ojeda@kernel.org>
 <aibUgUSlz-p2oxvX@derry.ads.avm.de> <CANiq72nWBSTXz8VBkMuf_Bcs2MgZ31nocL3o_s7HYv=HbVK_-g@mail.gmail.com>
 <20260609-hungry-rigorous-moth-e9f5ab@l-nschier-z2>
In-Reply-To: <20260609-hungry-rigorous-moth-e9f5ab@l-nschier-z2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 16:27:11 +0200
X-Gm-Features: AVVi8CdNTACvsmFU6UOWLNDhT801et9Gg-2ARDVRjHMqpbCeGAkmYDy9SpFVkkI
Message-ID: <CANiq72nmPPF=6AUp5mcDJVni80ORQr0AQ-4uCZaE+CzB5kV=eg@mail.gmail.com>
Subject: Re: [PATCH 05/18] rust: kbuild: define `procmacro-extension` variable
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:n.schier@fritz.com,m:nsc@kernel.org,m:tamird@kernel.org,m:ojeda@kernel.org,m:nathan@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13692-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70DEB66A3BD

On Tue, Jun 9, 2026 at 1:40=E2=80=AFPM Nicolas Schier <n.schier@fritz.com> =
wrote:
>
> Ah thanks!  If only that filename extension ('so' or 'dylib') is wanted,
> I'd rather expected the use of the '$(suffix)' function instead, as it
> may be easier to understand w/o knowing the name conversion rustc does:
>
>   procmacro-extension :=3D $(suffix $(call procmacro-name,dummy-crate-nam=
e))
>
> but that's bike-shedding.

Good point, I didn't consider `suffix` at all, so we can definitely do
that. Do you want to submit a patch?

Although from a quick test, `suffix` keeps the period, so we need
changes elsewhere (also we cannot use `-` in the crate name, so
`dummy` or the current `name` should suffice).

Thanks!

Cheers,
Miguel

