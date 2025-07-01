Return-Path: <linux-kbuild+bounces-7810-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A5AEFBEF
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 16:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEDAA1C02172
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 14:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8FD27702B;
	Tue,  1 Jul 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvz7jciY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B498274B2D;
	Tue,  1 Jul 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379306; cv=none; b=nNxdeoN/oRqwUpgKP0AMnblAkthz01Q8DU1ARLsla6JU3wzdn5lnJCnknOtV8Ja/uXcI9dqRhV1F+v5DAwKK6PWOKpkmW6eO6+7CQIXckYgZhrAoaJKPdKvualeQtuOm09f0PnY4C8xBBslCzkxQLruk7DyTKNeG1yby3wc78hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379306; c=relaxed/simple;
	bh=d3jbnlo0yloagQLxKasfaTIoGVOeJedPwxIAjOz5ETo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rJO6J8r4V+ixTTNYRWEKI/r8USlydvY2J0ZgOAEqw4wueuAd4Q1v0cz1hsO6/CQ/DNnMoos+o10bNmzPDN3dYzm4XF8GyQUzfx3CC/CuYevGeF+HfyGVde4Mr0is+U506eHfhcBeDwc9R83I1mcW31tT4y2+JNocJyYVyq0c01Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvz7jciY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CFBC4CEEB;
	Tue,  1 Jul 2025 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751379306;
	bh=d3jbnlo0yloagQLxKasfaTIoGVOeJedPwxIAjOz5ETo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tvz7jciYq7khZaH8OSLQc9tcx4gOsIr7mTHkNRuVVM5/o/JSdziFciDB9OshdCA63
	 4fYz3Mat6l7P86IuypHKtnQJi1G/pIjKy6xpafQBN8X7f4bW3NxIudOpDw6im9hILP
	 c3Egrvoje0aDf2pNV2fUM4an31rDWNXpOWi/OkP28kSt3zEREJ+jBoFw4rb/Ur1Ah2
	 tqBmbPYXh1dLU4VC7vUB/jdRYxVP4pxP2b622/4pAIo3lzCPFP4U6+48GgYywS3ROG
	 JGPHZS6rIFy+LHlRRNdD7nTeLtyEvYo98m0WQyBLSygrs40N4fwoSYd/9YDxhzT7sq
	 hX7t6KWBKN4DQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
In-Reply-To: <DB0LKI8BO3HZ.3FF03JN4364RM@kernel.org> (Benno Lossin's message
	of "Tue, 01 Jul 2025 11:05:43 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org>
	<Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid>
	<DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org>
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
	<DB0LKI8BO3HZ.3FF03JN4364RM@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 01 Jul 2025 16:14:55 +0200
Message-ID: <87zfdovvz4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Tue Jul 1, 2025 at 10:43 AM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Mon Jun 30, 2025 at 3:15 PM CEST, Andreas Hindborg wrote:
>>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>>> On Mon Jun 30, 2025 at 1:18 PM CEST, Andreas Hindborg wrote:
>>>>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>>>>> (no idea if the orderings are correct, I always have to think way to
>>>>>>> much about that... especially since our atomics seem to only take one
>>>>>>> ordering in compare_exchange?)
>>>>>>>
>>>>>>>> As far as I can tell, atomics may not land in v6.17, so this series
>>>>>>>> will probably not be ready for merge until v6.18 at the earliest.
>>>>>>>
>>>>>>> Yeah, sorry about that :(
>>>>>>
>>>>>> Actually, perhaps we could aim at merging this code without this
>>>>>> synchronization?
>>>>>
>>>>> I won't remember this issue in a few weeks and I fear that it will just
>>>>> get buried. In fact, I already had to re-read now what the actual issue
>>>>> was...
>>>>>
>>>>>> The lack of synchronization is only a problem if we
>>>>>> support custom parsing. This patch set does not allow custom parsing
>>>>>> code, so it does not suffer this issue.
>>>>>
>>>>> ... In doing that, I saw my original example of UB:
>>>>>
>>>>>     module! {
>>>>>         // ...
>>>>>         params: {
>>>>>             my_param: i64 {
>>>>>                 default: 0,
>>>>>                 description: "",
>>>>>             },
>>>>>         },
>>>>>     }
>>>>>
>>>>>     static BAD: &'static i64 = module_parameters::my_param.get();
>>>>>
>>>>> That can happen without custom parsing, so it's still a problem...
>>>>
>>>> Ah, got it. Thanks.
>>>
>>> On second thought, we *could* just make the accessor function `unsafe`.
>>> Of course with a pinky promise to make the implementation safe once
>>> atomics land. But I think if it helps you get your driver faster along,
>>> then we should do it.
>>
>> No, I am OK for now with configfs.
>>
>> But, progress is still great. How about if we add a copy accessor
>> instead for now, I think you proposed that a few million emails ago:
>>
>>     pub fn get(&self) -> T;
>>
>> or maybe rename:
>>
>>     pub fn copy(&self) -> T;
>>
>> Then we are fine safety wise for now, right? It is even sensible for
>> these `T: Copy` types.
>
> That is better than getting a reference, but still someone could read at
> the same time that a write is happening (though we need some new
> abstractions AFAIK?). But I fear that we forget about this issue,
> because it'll be some time until we land parameters that are `!Copy` (if
> at all...)

No, that could not happen when we are not allowing custom parsing or
sysfs access. Regarding forgetting, I already added a `NOTE` on `!Copy`,
and I would add one on this issue as well.


Best regards,
Andreas Hindborg




