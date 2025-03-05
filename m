Return-Path: <linux-kbuild+bounces-5970-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F9A501B5
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 15:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2D13B0DEE
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 14:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE9424EF81;
	Wed,  5 Mar 2025 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSxM59Hs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ABF24EF7E;
	Wed,  5 Mar 2025 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184391; cv=none; b=B55jfXNFGWB/MaoUdJeb7d0890E8lpDXSJwmfgmmHSDo0yHqGVQUc8Yd0LxZCDNRBTlC/I0j8BwP6SfDhXYmER8oOPxhLM8XwN5y2IZEODr0Kf5SsJBh+OSrrjOMhzVyf+UtEnplF9idM8kL1OBTJwmHGVKy3taRtStauWIwbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184391; c=relaxed/simple;
	bh=0l441pr90rzEMH5F4wcsMjav/46G6mCwscD7MDFRGIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QZ7ZkeQMAmLAkuMq3jIsSpPlLgnD1B3BaoQQ8KVWsJVDXvQhommpE7OH3j1uzQsFcnR9CmqlfnIVuH96C72m8ayDjVCICdrR0UKROb/4yJX6euv9oLgMZjh0Tb+TuWejr/qvGCzXzX3kzxVwzA40jenXoVWDwIhgPAFEjmZr1Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSxM59Hs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3BBC4CEE2;
	Wed,  5 Mar 2025 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741184391;
	bh=0l441pr90rzEMH5F4wcsMjav/46G6mCwscD7MDFRGIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sSxM59HsTjZXoDy/ACPrO7P7UxlCUR+pKPK6Pzb4dMTS5so36XW9JT1PSqOfAm981
	 PudC78oLV+67xGWMmmojxoyMqbAspNyCfREioT5xyTze8ljpRXWuVwE7BfkOSWmtFh
	 lcDugb/O03KG97IgZdJXjroeuQqGyeJGjPama2kROC3JDwvTJeZwOgvZmLs+gf/nFe
	 JRmSIZjNJ17FA//P8v3fq+d0t56YV4k0e6JGSCIUDsGXLlbdK5j306bdPxwo5U71CF
	 OnU2kJRS25BS9eMiPwKcTiojX3tzzhQQnpO8CtNcQzNrv0LKReIAHWVv8yWVnTZPYi
	 3sL7EvOXnywVQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Benno Lossin" <benno.lossin@proton.me>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,
  <linux-kernel@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 14/22] rust: add pin-init crate build infrastructure
In-Reply-To: <CANiq72k=KiYhKr9XHU38==Rx0df4rERyOL1abRG_cDo+4NNa0g@mail.gmail.com>
 (Miguel
	Ojeda's message of "Wed, 05 Mar 2025 13:50:36 +0100")
References: <20250304225245.2033120-1-benno.lossin@proton.me>
	<jpQp16UCJ00pInqOI-QFULU6-FKl2bBtAlmnxtXWLgXPVb7gy6d727nr7THeyks3ERF5Yqu3R6bikD0OK4mqXA==@protonmail.internalid>
	<20250304225245.2033120-15-benno.lossin@proton.me>
	<87h647d6xg.fsf@kernel.org>
	<cdfBMmuIl8Wl-KpI-koNDQJOCGBr9z9dOi5fxQvFbgNWQHHw6JtMizaMMbMniNlE841-9b7TdLuZ9Xh_hFsf7w==@protonmail.internalid>
	<D88BLHENDH8Y.HQUKEXN1XB7C@proton.me> <87ldtjbqw2.fsf@kernel.org>
	<okP1iZelIm5t6CfgoFyh0m8LiVEQW3ULUroZHdSQ97ul_BmPr47HBpB3RgHDMtm_2jzF4sTJszuUACsCGBEXcQ==@protonmail.internalid>
	<CANiq72k=KiYhKr9XHU38==Rx0df4rERyOL1abRG_cDo+4NNa0g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 15:19:42 +0100
Message-ID: <878qpja7b5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Mar 5, 2025 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> I _really_ think that the ability to run the tests should be present in
>> the kernel repository. But I also do not want to block this series on it,
>> if it is something that will be easier to achieve with the build system
>> overhaul that is in the pipeline.
>
> No, that is not the plan. Even with the new build system, this is
> supposed to be developed upstream as far as I understand, so you will
> need to run them there anyway.
>
> Unless there is a reason we could catch more bugs here, that is.

I guess it would be no different than `syn`. But I think it is a shame
that we move something that people could contribute to via the kernel
development flow - out of the kernel development flow.

Ultimately I guess this is for the maintainer to decide, and I don't
have to like the decision.


Best regards,
Andreas Hindborg



