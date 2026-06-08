Return-Path: <linux-kbuild+bounces-13616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id slRZB+9pJmqiWAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13616-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 09:06:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AB653625
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 09:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GoPfLaQN;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13616-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13616-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB27C3020A51
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 07:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F05E38F64C;
	Mon,  8 Jun 2026 07:05:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F83859CE
	for <linux-kbuild@vger.kernel.org>; Mon,  8 Jun 2026 07:05:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902336; cv=pass; b=O/2wttg5M0r046sUONqP7g4/u8azZ5EyQg+vCy6d/CssAmpghFg7k9He9eX6pHtR0ZxtPy+3ol/ljIdlEBN7WB0fFdoPby+2AoQiAw36AkPgRn+lMsGBX2uRBABsbQiqUB0zVtc91laa9mPX7tWeOXU03w+nG3EgQJsVKBYgBVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902336; c=relaxed/simple;
	bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtkXXo0Fhgyzx48YCaCAuO8+hW2P4cl9mUC63+fcA3dPmbIHbc0LZO3rQyuiGtl43UpvaUbwmABNnFCWAC1z+YRcc2b4gRpfkW7XMY4A6smupV5LGKLvgQCdyTMC/QYcuwQUds9obqCHzbS8rsW/jE4hOAzq32rCZESQBINVhsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoPfLaQN; arc=pass smtp.client-ip=74.125.82.170
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304dc707c7eso341463eec.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jun 2026 00:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902334; cv=none;
        d=google.com; s=arc-20240605;
        b=UZwYCZ6U2/2lH87xddpZWdASDsCgQKrAvpjBTKfTeWeOAlZ16+svNUXZGYCgYhe9bF
         zJgBxhxu8eRmvtVs1WAZKRsfRo7Qa7L02lRJWlDB8zUglVDuA6diNfy7vwLnsJp2eL1B
         gfuLbnjJKboXfNlCNysxpmJSPiP0o3iP6JSiUapqnltSvCSnOMiwlZ4haa7ZMUH4533c
         B/o8xi5Nn4kaTlGikblraGemzISSzmTM2BTyx+8MupsRTwzYsuFqA8rvNz9BBWfBilJh
         Ud3JtHRTKod/isemMRjrpXXrbLu6N302SuIIiiwLl0S90BpmtfKufDp7yMZgqqYfzeUh
         +Q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        fh=G9MSrwH9DtDGsmzgLdT5nbFXlILPrIY4tADehz9V1B0=;
        b=j2XAcXSpnic3KWHVlmf8B+qR0kGU1dme+GEZ9uYMoV2xPZ9Vw9cK4ylbAnU6z4BuLw
         idaibM1LfWItw6kaDEgIRVnxRwY/2gsc4NvZqBpbIdqFc8KFnVPFxbF0wqQjcuMmp8P2
         pzEBHc46aykk6B7ZksQtQfLpJkLiUb9XRXc2WMdsZTLlpnBpIrbFACURLWLat1LXkVht
         sGULoCt4HQYRCXE45OFsLISZOB8WLfKPxpdmxhgvf+vkZN2eUj/Leo2rNr/Nikd7Zi4M
         /Gf9pBmLUaIr/loc0h2DvcRMUJg+0zKSPXgULOwkmXQr0HXXRXqUPxZfixJ5SxmDD72T
         SWHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902334; x=1781507134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        b=GoPfLaQN6cRrkfeQW9ATXrOyQ+KQr1NqYzBgYP1pEpkvLeZVBcC1+SCyHdCfA2NcTn
         CU5H6EB6E8BSA3HvmtDdCdWlLGXXFS4IFZBLu6cE/BjqaQCT6wGNBjAmw1S3UaxagKka
         Fy6TzTO0oreImyB+KZeCULHwosywZaVcIzZa5jmk0ctbpWY26/16xsinRp5zWtVOZoeV
         /9R3EzUb4xUBQz29rlrpjjdlg/SFCslEQNr9/xPF4ZPQh3khYmlc+/FqfIMn/hbOCzXJ
         qEyKb4h1EzZYoKjv/al4pFqy+3+xcADW0MqmnItGde2HGtW6ZzWC/uM04CUqN5nGj4gI
         wCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902334; x=1781507134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        b=XKst4WF4+hFhLKFCFREAhuavXIA83TBgbTByLYIAtvL4bAfgX3BjA4r5B3+/65wu8Z
         VrcM3rHvASgE54OWCr7rg+ooqVAdCDrHNph0C3vL1k8HT+voJuj85ZI9PTOWw1ikcA7S
         3zxPfbsEiML0NNopswvxWG/bXiMEkVypNALIcfQ2mIRhDo+VyEF4+nuqvPIwHghveKIa
         F0mepN73oHRZD3CZGCSmdr0SEICIYl5yRCDfaSFhn9mv4ALimqkLIobAyxpERDlLglCp
         E4RsHw/h5jM0yp9ZGKB8S22LBioJ1TSzsw/BqdIBv2vG969OkxXmILwA3Z+BNP+o6Afd
         3W6A==
X-Forwarded-Encrypted: i=1; AFNElJ+5D7rMpRBBk6z4bzVllLaXVbbyPLbTv5nAlvYvtAJUgHbA5N7ZlJ5YwfsUJS5SVwWiUFbriLECQaPLNGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44lXRqdZpIr/1uu1KP7hp5vNCxPlZi605ooCwQs4RzP6EKlsp
	e/AXZqtMKJgO0AA3sZdgYtktwKbwc43va7d6DlsMZYtY0huCn/G6LS/HTnFum3dWwZ3JGhXHCVW
	L4Hq2X4fIy5kkEIJYXYyyuDXnKzkVczo=
X-Gm-Gg: Acq92OGuBe/H9zkMmBCjCaCwuPZWsa8dLwE2Olg7EDQj2fX22TmjEaF4fo1xvQne8V/
	xAteUgenRmswmmuJ44EkAgOczic0K7iLKHx6n5MB68NlEqLf79v6J5LyU2FMdEn4l9w5UPd1D9Z
	9ikNyQRuATnTkIISnlcruibewoAmqhC4k0xqHJ9O62er7mvmY0Qec88pXsUAGVa1R78WC6C/v3b
	hEgZkSsVL9Kn4BQtdcdRdVvRAD7OyZZKreuhMkOMk48mFgO3oE9ipm5qmz3eO4lxCBJ2x4cxA1B
	ANfY8XYoo2kIhI0F9fNqK01K/v2kOPJnsr3R5CbIkyaHBpC0xDvI5xIPSVHVuP9A5ldKRfEO+BM
	tMtDvlkctA6GwyKosLZErnqIPEP43tpaPnVY34XE/oEFs
X-Received: by 2002:a05:693c:3945:b0:2da:a813:a629 with SMTP id
 5a478bee46e88-3077b223afdmr3473571eec.2.1780902334313; Mon, 08 Jun 2026
 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com> <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:19 +0200
X-Gm-Features: AVVi8CeF1bmJ1otTtbNunaCFacq0cljAH1ygtuYHCVlQ1ktOIpRSg0gpBxWAiuo
Message-ID: <CANiq72=ceH60sCPs7UWDXQiV8GLznjDWsCKFa6k8O4exFEkW1g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] rust: inline some init methods
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13616-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:ojeda@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 842AB653625

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> These methods should be inlined for optimization reasons. Failure to do
> so can also produce symbol names larger than what `modpost` or `objtool`
> can handle.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` (just this one) -- thanks everyone!

Cheers,
Miguel

