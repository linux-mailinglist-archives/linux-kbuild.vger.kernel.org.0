Return-Path: <linux-kbuild+bounces-7829-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEAAAF0E0D
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 10:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EED234E092F
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 08:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7DE239E9A;
	Wed,  2 Jul 2025 08:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9ym5aiF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240023817D;
	Wed,  2 Jul 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445013; cv=none; b=S6pdp66oe6TEW2d580zDlK3HDhrCCoT0gbd5yCICPh/IzHX4kcsoOcM0n2BCC4vkFhyZAzRJ8mH2lI7NOOA+72qTQXdwPgkG/HoSfzO5xkNzODBwJ0AdEtcc35lfkr30prlZttdhvy8m0hkucRvNxwaUDzXb/A1XBKV8vm8KZ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445013; c=relaxed/simple;
	bh=gn8Zc85bDvq6Yw8JF2nDhKZdd2hRMJcauN+/NgAcs8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gCLzkbarGwMjBeNBLrrlQuRGOi4Nvh1+S6EJl0ZFAgtKg5h6GFfuBrV21neMohoBFcbv9U10n0O+7xmDacT5TTVIjarSvSnvyljGJkqSG2NQv2cPMJGkpzgBNAbLsB057DKhvEjJiJxy2tRPslLI/YE5B4tazDx0+3A84lVKPw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9ym5aiF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50C2C4CEF1;
	Wed,  2 Jul 2025 08:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751445012;
	bh=gn8Zc85bDvq6Yw8JF2nDhKZdd2hRMJcauN+/NgAcs8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a9ym5aiFDlphY7bTPOEHI3m+wdRV61RZgi9V815irDzEy7y72+ZUMLd2+ve6+ufzf
	 7y8p4mu0euNoB1x52LivNm11DSwd9Sa65Hbum8084GbJHE3rN0SpjWrDpNwCDpsOs6
	 Pm3PHHHSrfRhjelqtzFW+n5yW/qbTFsAJDnpuJNkmolklTny1b9xFxIl9qynO5F0Hm
	 BR7Etk53j/KVX5IQF2zeOAKjpxM0zm54MMDeVsnIRAhJVRAjWpeNwJTa60E1xWeeJi
	 yU9WCiIWDD9a2Xgijciy64PEk92flAv2vg9GoAAfJNdWMuExGRHTln0fF8iVkNsJSp
	 4BUSs6vjXDkEw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
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
In-Reply-To: <DB0VJ9HRT0VG.GT9HOT7J29EL@kernel.org> (Benno Lossin's message of
	"Tue, 01 Jul 2025 18:54:16 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
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
	<CANiq72kFUSFgBv7Es3Mhe4HUaSPZk0EVW=JaMdaAGHsQOxYN6w@mail.gmail.com>
	<DLItXbaTBCeUnpS5vUdbrgE6pmpI-SNBpTVnLMea7RLdHat3KNnjpuhSseC9m0X6Nk8q3cCRBLc-Q7IoEcvIog==@protonmail.internalid>
	<DB0VJ9HRT0VG.GT9HOT7J29EL@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 10:30:03 +0200
Message-ID: <87frffvvuc.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Benno Lossin" <lossin@kernel.org> writes:

> On Tue Jul 1, 2025 at 6:27 PM CEST, Miguel Ojeda wrote:
>> On Tue, Jul 1, 2025 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>>
>>> Ultimately this is something for Miguel to decide.
>>
>> Only if you all cannot get to an agreement ;)
>
> :)
>
>> If Andreas wants to have it already added, then I would say just mark
>> it `unsafe` as Benno recommends (possibly with an overbearing
>> precondition), given it has proven subtle/forgettable enough and that,
>> if I understand correctly, it would actually become unsafe if someone
>> "just" added "reasonably-looking code" elsewhere.
>
> Yeah, if we added code that ran at the same time as the parameter
> parsing (such as custom parameter parsing or a way to start a "thread"
> before the parsing is completed) it would be a problem.

Guys, we are not going to accidentally add this. I do not think this is
a valid concern.

>
>> That way we have an incentive to make it safe later on and, more
>> importantly, to think again about it when such a patch lands,
>> justifying it properly. And it could plausibly protect out-of-tree
>> users, too.
>>
>> This is all assuming that we will not have many users of this added
>> right away (in a cycle or two), i.e. assuming it will be easy to
>> change callers later on (if only to remove the `unsafe {}`).
>
> Yeah we would add internal synchronization and could keep the API the
> same (except removing unsafe of course).

That is true. But I am not going to add an unsafe block to a driver just
to read module parameters. If we cannot reach agreement on merging this
with the `copy` access method, I would rather wait on a locking version.


Best regards,
Andreas Hindborg



