Return-Path: <linux-kbuild+bounces-10687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53070D3AB76
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 15:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2582630198B6
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 14:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB7C35E53F;
	Mon, 19 Jan 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aznRGAM4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDF635B15F;
	Mon, 19 Jan 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832171; cv=none; b=VbSQWgOV1p6D7XqXtcBsYc6Ro69Df34TFIVCSuE7CyRhW2OsoW2sgjIK6T5QAy7D1CaO0V0WLazy0iUCLUZbgloJo+0/O4fXHm+0XqBT1tTZSYWBvV0dn5ti++W38HQgpJ+S58YRkgWK+j3i0wPQUevXWwiERobCmyV3oVQsnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832171; c=relaxed/simple;
	bh=y2m5yEKrCk7HPRtGEEUThQzI1L9u73zzuN3kmCbHBkE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=t3VardiDSXoXWUlTZdSsU6ESsixhiRcCWrIZq4yu8RbUbal05y02Rsug8sxsg5XhPEArtzabsdmYyfV+4HIXwjboXEfg2+A3aAXi3i8XdtVNa6m8ZgosS4tMAn2SKISrWv6qb6dvY2kG75nF5tfmvxluPbA3pYJdYb5WMKOSIFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aznRGAM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CC3C116C6;
	Mon, 19 Jan 2026 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832171;
	bh=y2m5yEKrCk7HPRtGEEUThQzI1L9u73zzuN3kmCbHBkE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=aznRGAM4Nd6LYlmzBRuGIAGfJoyUKs0b2Pmvw8aqULbIGkjMRMX/P+trMDFYLFrG9
	 XIFAYO/DLD/AwT7AQU6niJABlGYAB5gF+RVSXnmNaEpdbJO2yqlDsKGSkQiOOt3IH9
	 QDwV6Hv5tr9aSAjUM4FnpFvw0+cNgYdpvyihpbZaRfTaHiguLyr4bl9jmcvax2MO+c
	 oZY+oFhTHn2qmrNVBdfIfAxZmRrcoR88VjESmbXlJAWdMCL4PZSrDg1sqFMz/5Ic29
	 Lll/dkEIvEitnBFSWazyDL+5H1taTpklGhEQcYKXL71081/DUjFXB41QFthDZ7DFjV
	 d7Okth/LCJKdg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 15:16:05 +0100
Message-Id: <DFSMO6VJ3Y0P.18UIZV6LOAGDI@kernel.org>
Cc: <tamird@gmail.com>, <da.gomez@samsung.com>,
 <hust-os-kernel-patches@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Linux Kbuild mailing list"
 <linux-kbuild@vger.kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] Makefile: Remove the product of pin_init cleanly in
 mrporper
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "chenmiao"
 <chenmiao@openatom.club>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club> <CANiq72kDsmkJeS3bGSiD_dA1wSm328nYbbHEZ8HRiMHOirCS+A@mail.gmail.com>
In-Reply-To: <CANiq72kDsmkJeS3bGSiD_dA1wSm328nYbbHEZ8HRiMHOirCS+A@mail.gmail.com>

On Sun Jan 18, 2026 at 11:30 PM CET, Miguel Ojeda wrote:
> On Fri, Oct 31, 2025 at 3:32=E2=80=AFAM chenmiao <chenmiao@openatom.club>=
 wrote:
>>
>> When I enabled Rust compilation, I wanted to clean up its output, so I
>> used make clean and make mrproper. However, I was still able to find tha=
t
>> libpin_init_internal.so in the rust directory was not deleted, while
>> all other corresponding outputs were cleared.
>>
>> Dongliang Mu <dzm91@hust.edu.cn>
>
> This line seems broken. Was this meant to be a Reviewed-by, like in v1?
>
>> Signed-off-by: chenmiao <chenmiao@openatom.club>
>
> I think in another patch/thread you mentioned this should be "Chen Miao",=
 right?
>
> No need for a new patch, I can fix both on apply if you agree.
>
> Adding the relevant people to Cc (pin-init, Kbuild and Rust). And
> Tamir for the `.dylib` side.

Acked-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

