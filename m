Return-Path: <linux-kbuild+bounces-7828-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BA5AF0DEF
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 10:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 842051C251E6
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 08:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402022376F7;
	Wed,  2 Jul 2025 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FV7F8bIY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E47235061;
	Wed,  2 Jul 2025 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444806; cv=none; b=c+BcwE6m376Yd9wWhacIn/tzBBiP4DW9c7oeVXHKTPmBiBW8Lv6ai8fhGPTAZAqnN1jh8vN41Gfq53y5UgGugsbdMpIReBqV9M4AgQZyVJ1WoLeSm81966KE57OzB7BV3uCVfBG3/STwrH4JzFfFqRkUiX2oBFzoR4TbnzN6Hu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444806; c=relaxed/simple;
	bh=3XnLy3M2L8YnxuHjZ5iPyp1yI8zP+oWMIdEBHMf5G5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WMuDsS/+BDyLRUukY55QS9DRmDnlCMXbZJX3+50AN2PcJJOP/LHmOLiFK78e2+3hxaAfkO7RLLflni9eHs2NCo79JotV+wCTSyaFkDYLpQXkBmXMGFtt666QiGqZ7W71IrtMN3jfkYoRdC8Uftcz00mguUVOqYUPZq56UlDc7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FV7F8bIY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC767C4CEF2;
	Wed,  2 Jul 2025 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751444805;
	bh=3XnLy3M2L8YnxuHjZ5iPyp1yI8zP+oWMIdEBHMf5G5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FV7F8bIY60rK1k+UAkDlrsRVpL7nXiSBzC6EWZn4KiNvvw8ZLsm3L1g29QrnfUY3O
	 CIP0m9W4zY/hQ9J5jfhQYt7ScMfdXXlLM2UqVADyl/XuGUe/UTZY6mypPh0/Qd8MEQ
	 YowBkuB2U+kQdd44QebCHFw5EUIgbpi/rVCqYRlumiaW+VrB68Uf/tZCg1EH8IU1cJ
	 XHlPZNby1UtdkmwnXD0A1emj6GabjgTqcSPDj265o+LKcl/U7/9BpSZVrwbuwdQ/4y
	 WcJPoC6Fri12G6HONFQ1aQ83rns7nO5pSoW1vyfUMKVhZDp8BcD6c+wnesJBDCTbvH
	 mdWYi2IcAFrFw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Benno Lossin" <lossin@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Luis Chamberlain" <mcgrof@kernel.org>,  "Danilo
 Krummrich" <dakr@kernel.org>,  "Nicolas Schier"
 <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,  "Fiona
 Behrens" <me@kloenk.dev>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
In-Reply-To: <CANiq72kFUSFgBv7Es3Mhe4HUaSPZk0EVW=JaMdaAGHsQOxYN6w@mail.gmail.com>
 (Miguel
	Ojeda's message of "Tue, 01 Jul 2025 18:27:21 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<87v7om4jhq.fsf@kernel.org>
	<RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid>
	<DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org>
	<87plepzke5.fsf@kernel.org>
	<xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid>
	<DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> <87wm8txysl.fsf@kernel.org>
	<9G3W1seaM7elcwWXaeoaa2nfpFYCf-AmBdvZhACGP13KGUtTPVMwGNYdTQsdtp8ru7GIP3-UYTzXscC1MRUKrg==@protonmail.internalid>
	<DAZV8OGL8BMH.11SLXBXQ17ZJ9@kernel.org> <87h5zxxtdw.fsf@kernel.org>
	<H78pT7YnQEhAXdxzl_hhnGVUiQuFpibB21_bjH658fMz_5JYbwsPLYYVh8u1gYnzK3N3ilTEAvqOpkuptVx3rg==@protonmail.internalid>
	<DB03MZI2FCOW.2JBFL3TY38FK@kernel.org> <87bjq4xpv7.fsf@kernel.org>
	<ffROWpeKczrWSBlKYov2atJG-QD5l5fUOb2dVCNkWlcT9h6DJpa4joGQpjqtYyLP7HX227fCAayyDQunZ464XQ==@protonmail.internalid>
	<DB0LKI8BO3HZ.3FF03JN4364RM@kernel.org> <87zfdovvz4.fsf@kernel.org>
	<DB0U12HAEVZ6.JKFPI2UQHDRY@kernel.org>
	<jq6VMxUkJMyia8e_mnXj5L5vpKZOlx4LUtb7ijLrKZmBYIKpK6HC8yWQFDA-lzKo2yEbjL8Tporv0WVUwe6n7w==@protonmail.internalid>
	<CANiq72kFUSFgBv7Es3Mhe4HUaSPZk0EVW=JaMdaAGHsQOxYN6w@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 10:26:35 +0200
Message-ID: <87o6u3vw04.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Jul 1, 2025 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>>
>> Ultimately this is something for Miguel to decide.
>
> Only if you all cannot get to an agreement ;)

>
> If Andreas wants to have it already added, then I would say just mark
> it `unsafe` as Benno recommends (possibly with an overbearing
> precondition), given it has proven subtle/forgettable enough and that,
> if I understand correctly, it would actually become unsafe if someone
> "just" added "reasonably-looking code" elsewhere.

You are right that if someone added code to the API, the API could
become unsound. But that is the deal with all our APIs and I don't agree
that the details are very subtle here. Someone would need to add sysfs
support or user provided parameter parsing to cause the unsoundness we
are talking about.

Anyone attempting such a task should have proper understanding of the
code first, and given the ample amount of `NOTE` comments I have added,
it should be clear that the concurrent accesses that this addition would
introduce, needs to be accounted for, to avoid data races.

I will add myself as a reviewer for the rust module parameter parsing
code if that is OK with module maintainers.

> That way we have an incentive to make it safe later on and, more
> importantly, to think again about it when such a patch lands,
> justifying it properly. And it could plausibly protect out-of-tree
> users, too.

Again, I do not think it is reasonable to mark this function unsafe.

> This is all assuming that we will not have many users of this added
> right away (in a cycle or two), i.e. assuming it will be easy to
> change callers later on (if only to remove the `unsafe {}`).

rnull will use this the cycle after it is merged.



Best regards,
Andreas Hindborg



