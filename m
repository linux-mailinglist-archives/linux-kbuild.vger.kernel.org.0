Return-Path: <linux-kbuild+bounces-10839-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOg+IjVqc2mivQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10839-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 13:31:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 015A675D4A
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 13:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E37F73027366
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD581FF5F9;
	Fri, 23 Jan 2026 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq2R4LlE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF41F4CA9
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171504; cv=pass; b=d2pdSbh2YU7FgubVww/OgWNDENjhQ25ZQC+ay3qaALigdF7O8Gh1UlZXAkJs7Qmqe/WzfYrXAt4u7Ce/j8d/pAqGPfJiOHgK1jr91fF+n+8dXYyY78tppihyqo6LygMvQEtUqoJgXzsprpKvHiS69hcC2akUg6uuEt5jKeKuM0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171504; c=relaxed/simple;
	bh=+GzcYi91BQDSWwlAc4ZNh6qiTOwo9jBo7rD3VEnOcRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeeqD9orIFbsDyXevy+RFckOoHeq2Rn2IgrU7/Ys823Vf7PCq/JQuHfyHlwwx44DIHMr72ATe065oqTT3QgBbSDzYB2CfW5aI/7cwi3JQBwf/Rvqe5L9uWGYKGOzocnCz3L9lMaYumEBiGNyi3Jjdy3KttbKjE/hp+PcpfbjFHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq2R4LlE; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b701d29ddcso60053eec.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 04:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769171503; cv=none;
        d=google.com; s=arc-20240605;
        b=Tx8w5y3xzhl6s8J1WfuJ/UwqLDWnSf8NtX3Q5PjS+qUAiCy/ERY+4BeATCKxmJpn7j
         FsCqbOfYtcICJLxCo2F1iTWptZow+ziAZ14Mzp/Lw8MPuS5sY0fn/uK3iW7Jacg6X6eQ
         zVq3rs2deRy4cYQ5iDqf5Y+amt4ESDAsAkWSCI3Dc8U+NU4nFDWa5A5XrIkpHM72tSGA
         ze1A6+6o/u2qoTNtXV8oDbKuZYmltRRF2U8wO6o71ordmlczcnNELHpXAl0e/Cq+q/+N
         J4tTfPC1UX6vrt6f7SFvIXzRyMCeYTyaL22MRFjx4G8CsMiQuZtJsFwVxmSZ7Kf2Efh6
         R1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+GzcYi91BQDSWwlAc4ZNh6qiTOwo9jBo7rD3VEnOcRo=;
        fh=CHWSUz4edprN8ra3WshtOMYm5gF8B2ueoEnJhwlS/B8=;
        b=KPWPnnRWw/2osgLcm5tuQ9C6uk1m8PzCRIxxY5ucUe4j06rELItj63xFbq8z1ICGhU
         86tp3E784c0gmTsSwwT3mXJGO+qz4VHHWtaLptfJGkD4Bqld7L6kmKLBgnJiTVTX0zdg
         NByju2weS1NplF86NhA0aF0G7CY4bwfz3MsOpYkR6pAd19+790PpIJnXYdkeTg0S+JmO
         rJCC8gEdT+900SqfDISb6hUrQE0zcxismsLE+nnKmeJu6xBvCW9dW7/yBrHWJ1Pbu4Bj
         Cd1BBtKCL38I1s8HPzfB+xFmh0shXbZl9VzOZ8F3qbieOK0ZDfd/o3wdQHPL5U/adNTy
         AbVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769171503; x=1769776303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GzcYi91BQDSWwlAc4ZNh6qiTOwo9jBo7rD3VEnOcRo=;
        b=Nq2R4LlEZezTvdD4MWuUf0q9DrC8UHwzuXK4vIl2i5idOmHdEaGDBXTSMMoUa5bWz2
         ccg2tzEYyjiHZ1rGfNfTch5mf8AzFIisIy0zhmsWNUEH5XR7uZr9H7DoCO7Nvo5NUTFZ
         2jEr5CgqCT2GG6GxOnSKb/OUR4I24r759FDwccjZQrhDDFyAO8ByAezp6Sb1A+0sQEO/
         LmB3qQXYoqCuCyytu1DtnuxEcyLNgMP9ecihucF7XTU95LS00BtoSXKdiCXK7Gia06b6
         iPdmOOA5/SwpytUUsrPQzs3Zpq35G0hac0qZKPuY2g93NDf1mmKhrQBcLclE6b/uP8Ps
         eECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769171503; x=1769776303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+GzcYi91BQDSWwlAc4ZNh6qiTOwo9jBo7rD3VEnOcRo=;
        b=d/twDtXjTThc4D0YHUIP0PpXofUxhxRFlWU8C5jHwXZM3ESz3hb5L20CDrLkHh2vr9
         3UmUAw9FRccbZNR9esqYfy/UbgaXTwKci9AFIh2+ZtSJjVlm6bv8WnBFO+1hHK6yKjxd
         gAEPjE6CWwUfs3Cu0chUd+W1Z4PCedshgdaQ/+Ial6UmXenAabj5WtojXHCvahgMNB1C
         +tRQb6wiVfwvvxxjT+spa/gFDouYaLWg/S98vSo63wjIQ6e2x1IAgalh2kkfOK5YzGO2
         TqtxsNMq0b2aBhy41MnN+xs6hnZ304uO+NbTjxbNaCzXRsycw9c0HGWbbHy9THRqW16n
         0okA==
X-Forwarded-Encrypted: i=1; AJvYcCURr7HIFdNsL6av25BQx2+OWjruCnK3BTkpH6VAsvDmEpuPejeVrICXnVlMXJdYbK3ud8cUM8LZe7ZIab4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNGY1PILO9SoJuys80PEBz7l5aEB2l7PZNYXlf+HehBWcH1fJ
	smAZdHZgiDaDxYYl0f+om3FAVE+LE0QCefsuCtBOl2qaMfdP4JjlURlMcUocr27XL8mWBLktHtv
	cfyn8eFlzpoCOFdELwZLqBJ25SIm9rZE=
X-Gm-Gg: AZuq6aLCDKVaukGfAdbPFIMprumnGtwgbvLeyvrrB7ZnqUEvNnjvlskWEsMnFLC32LL
	NmcR3/MUhtnciNW+2vJHymBm9Vp0KoaZuActelK84/Dz41hmMMYQo1tYY9pTdjvb6OZotmKoyVB
	hIA1NjJmwu0kBKz2DANlHQ7cD9mSj4not9v9L26gA0Wc4vkaW18qaMVXb17hf9GHnGVwYO4WKom
	1EKWMvl9XQR92gQhx1czrpPGNaMlhgXplEyH12qpYZXQ8lPj/JZP6d/091HSEvLeH+nHDLit9tl
	puopaDdszsZVc6nhTAvDsLp4mWH18noRDl6PPsY0gAt6leO86eHMXVxhvR3OB8D3ikQIkfCVN5S
	m7Q+yF/cmeeHISz2j4gN9MdI=
X-Received: by 2002:a05:7300:cd87:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b739b6f228mr766445eec.4.1769171502626; Fri, 23 Jan 2026
 04:31:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com> <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
 <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com> <DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com>
 <CANiq72n65eLUmWShvpVBzkbCork_85A8nMZPKdf+rpw-nJ6j_Q@mail.gmail.com> <DFVYSBDDF4L4.24SKCFXJ1M00A@garyguo.net>
In-Reply-To: <DFVYSBDDF4L4.24SKCFXJ1M00A@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 13:31:30 +0100
X-Gm-Features: AZwV_Qjv_kM_Ib87W-Q6Ic8acv_zKWF-fRViP125obbU1YTM7QOJocoA-kwnG9o
Message-ID: <CANiq72=dxV9fLo7--oeAE+5OH7PKSUnwsP60Y31maHpmt6zxVw@mail.gmail.com>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot crates
 to sysroot_project
To: Gary Guo <gary@garyguo.net>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10839-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 015A675D4A
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 1:23=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I would avoid dropping old RA support before we actually bump MSRV.

There is no intentional support for old rust-analyzer at the moment.

i.e. if it works, it is because it still happens to work with the
current output.

That is why I mentioned that -- but if it actually works well today
with the current output, then sure, let's not break it.

Cheers,
Miguel

