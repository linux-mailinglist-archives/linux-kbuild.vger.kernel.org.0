Return-Path: <linux-kbuild+bounces-7816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D7AEFE95
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 17:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B243A9C19
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 15:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05A7279359;
	Tue,  1 Jul 2025 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgQ45D4e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6DD1D618E;
	Tue,  1 Jul 2025 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384618; cv=none; b=rpfhKgAm2tn32MS/bP+6uQqPVgXH7B7FPSkCk3Qj47VDt1ugbtTQ2sqxYZJqMrUMrq2cIHifns24Q3/NgD1jkNwnXZrSrWubCuBBAkDVZqfaP/XaAJIRRMHp/fpGKAk7wRjZouClsyog4/7krX3Stdgbkh5iAMJXMCcVaLlnsmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384618; c=relaxed/simple;
	bh=GmFWLrGBSZdojzb5yeGcOhRuy7723mG21OKyyQ30XPY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IK/K5c9pwfaqYHBaQfBKsWdPfCRpMP9ytrj8g2GlIxghLLq9A9/MbRyhgcusR3TBoA9DuUP6SgEjoE3fQp1DK9YJduhnwzZ20IWUD2QaqT6EhzbocELNL2sD9+mMjyLPErYfnTo1Mpz7oaaXLjtzLmIEYUtSvIw0JCTs/pwQizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgQ45D4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E33EC4CEEB;
	Tue,  1 Jul 2025 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751384616;
	bh=GmFWLrGBSZdojzb5yeGcOhRuy7723mG21OKyyQ30XPY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZgQ45D4e9fh85CIBRT85kGukRTNPnT/4oPh38PgpYAwtxwPp5u62ziD5bxmatg6lE
	 uxieHeVivqSp5U0b+zYQxz7pNnvjg1xEdJCnZUyZA4ESRHMLxyAWKQ7ePPhopcdl1z
	 rMStGNl0sF9y9wXv8dbiPwJM/1ZnQweGHlCihqO9hQzjE3sjiZQzFeP/Jt5DWrcfmD
	 sB+/tm3091cYzO4IxHaGGsIjpcjlGHxfovLlkqNUe60xSJG8PXV6YL23BkOgw2L97J
	 Va54TfXLL0eKoVDc7AQg5NIhJshUH2pILknPEPOxe6w2jDQ636ER9+Vn1hIL8vD8Bo
	 KZxbz1yF7fGQw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 17:43:29 +0200
Message-Id: <DB0U12HAEVZ6.JKFPI2UQHDRY@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>, "Trevor
 Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye" <ark.email@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Fiona Behrens" <me@kloenk.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org>
 <Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid> <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org> <RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid> <DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org> <87plepzke5.fsf@kernel.org> <xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid> <DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> <87wm8txysl.fsf@kernel.org> <9G3W1seaM7elcwWXaeoaa2nfpFYCf-AmBdvZhACGP13KGUtTPVMwGNYdTQsdtp8ru7GIP3-UYTzXscC1MRUKrg==@protonmail.internalid> <DAZV8OGL8BMH.11SLXBXQ17ZJ9@kernel.org> <87h5zxxtdw.fsf@kernel.org> <H78pT7YnQEhAXdxzl_hhnGVUiQuFpibB21_bjH658fMz_5JYbwsPLYYVh8u1gYnzK3N3ilTEAvqOpkuptVx3rg==@protonmail.internalid> <DB03MZI2FCOW.2JBFL3TY38FK@kernel.org> <87bjq4xpv7.fsf@kernel.org>
 <ffROWpeKczrWSBlKYov2atJG-QD5l5fUOb2dVCNkWlcT9h6DJpa4joGQpjqtYyLP7HX227fCAayyDQunZ464XQ==@protonmail.internalid> <DB0LKI8BO3HZ.3FF03JN4364RM@kernel.org> <87zfdovvz4.fsf@kernel.org>
In-Reply-To: <87zfdovvz4.fsf@kernel.org>

On Tue Jul 1, 2025 at 4:14 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Tue Jul 1, 2025 at 10:43 AM CEST, Andreas Hindborg wrote:
>>> No, I am OK for now with configfs.
>>>
>>> But, progress is still great. How about if we add a copy accessor
>>> instead for now, I think you proposed that a few million emails ago:
>>>
>>>     pub fn get(&self) -> T;
>>>
>>> or maybe rename:
>>>
>>>     pub fn copy(&self) -> T;
>>>
>>> Then we are fine safety wise for now, right? It is even sensible for
>>> these `T: Copy` types.
>>
>> That is better than getting a reference, but still someone could read at
>> the same time that a write is happening (though we need some new
>> abstractions AFAIK?). But I fear that we forget about this issue,
>> because it'll be some time until we land parameters that are `!Copy` (if
>> at all...)
>
> No, that could not happen when we are not allowing custom parsing or
> sysfs access. Regarding forgetting, I already added a `NOTE` on `!Copy`,
> and I would add one on this issue as well.

Ultimately this is something for Miguel to decide. I would support an
unsafe accessor (we should also make it `-> T`), since there it "can't
go wrong", any UB is the fault of the user of the API. It also serves as
a good reminder, since a `NOTE` comment shouldn't be something
guaranteeing safety (we do have some of these global invariants, but I
feel like this one is too tribal and doesn't usually come up, so I feel
like it's more dangerous).

I think we should also move this patchset along, we could also opt for
no accessor at all :) Then it isn't really useful without the downstream
accessor function, but that can come after.

---
Cheers,
Benno

