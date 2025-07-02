Return-Path: <linux-kbuild+bounces-7830-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FCDAF1107
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 12:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 268417A229B
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 10:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D772376E0;
	Wed,  2 Jul 2025 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnhKpsA/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555ADF42;
	Wed,  2 Jul 2025 10:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450500; cv=none; b=kSjGOx1Rz/EgTiQ8ltS4OGvg3GC2rPHeZVPDw9emf+XcnhkHOLwHPOcSYinNAq3jmGsfRx1b3rgahnl5F3vN7DPYOn51grUNd88CxNhJGLftSl43BfrYf1Qn0g/84ZQwcLElujPkn7Mej4oa0TDm8i+5gwM5P9lPmc8j2DEgarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450500; c=relaxed/simple;
	bh=I/1I5NyRVzSpJe49DY0iJKRA4CT2xnDLtwSt04yjusA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VK7mnxWldztCoe3mGUZ+4Ma69L+b5DbHx1Qz/qxcuFLleFBtCTEnaWpOH2+oFbxpOgak6mspkBREOhmm0O79/9awSXvQkJHc8fhh68jlhdAa4MWlYR8MrPzkGzioqn2EziOEh2TDKihjgiNE9aQ0btq7RgfaJqyaxWejya35rL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnhKpsA/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB399C4CEED;
	Wed,  2 Jul 2025 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751450498;
	bh=I/1I5NyRVzSpJe49DY0iJKRA4CT2xnDLtwSt04yjusA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GnhKpsA/lnIUGyA+lLBBgIDrCMjgNNKFl5jp0Mr6k4lw+b+ScMzQi3C321v1tleTo
	 UXfGXroSQ7z7dQrIqMjw/NCxtx+MAINjdxp0IKefYMgggalereJ/DOcWEuoi7x2CDT
	 2ZucnXVotdMTzAnWus5/2pe956AoBFyp+6K3X6uCcC7ktoedAPMQ4zV8WdxHz+H1Ts
	 H0xCijMSecRcVAJQLbIOoHP9WJgxOXGJbd+ua85Zuh7c7cUYKRqbh/9vmdLeDl8LIE
	 +ZKwEuxNp1n5NNUEXdTgbGlbe7SJ73HhrXii0ryBAT5iicRWTcQDGzRmt5VobbWTm9
	 gN0hKbl5kxnPA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 12:01:28 +0200
Message-Id: <DB1HDQS17VOQ.YDFIYGP0NH7K@kernel.org>
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
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <87v7om4jhq.fsf@kernel.org>
 <RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid> <DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org> <87plepzke5.fsf@kernel.org> <xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid> <DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> <87wm8txysl.fsf@kernel.org> <9G3W1seaM7elcwWXaeoaa2nfpFYCf-AmBdvZhACGP13KGUtTPVMwGNYdTQsdtp8ru7GIP3-UYTzXscC1MRUKrg==@protonmail.internalid> <DAZV8OGL8BMH.11SLXBXQ17ZJ9@kernel.org> <87h5zxxtdw.fsf@kernel.org> <H78pT7YnQEhAXdxzl_hhnGVUiQuFpibB21_bjH658fMz_5JYbwsPLYYVh8u1gYnzK3N3ilTEAvqOpkuptVx3rg==@protonmail.internalid> <DB03MZI2FCOW.2JBFL3TY38FK@kernel.org> <87bjq4xpv7.fsf@kernel.org> <ffROWpeKczrWSBlKYov2atJG-QD5l5fUOb2dVCNkWlcT9h6DJpa4joGQpjqtYyLP7HX227fCAayyDQunZ464XQ==@protonmail.internalid> <DB0LKI8BO3HZ.3FF03JN4364RM@kernel.org> <87zfdovvz4.fsf@kernel.org> <DB0U12HAEVZ6.JKFPI2UQHDRY@kernel.org>
 <jq6VMxUkJMyia8e_mnXj5L5vpKZOlx4LUtb7ijLrKZmBYIKpK6HC8yWQFDA-lzKo2yEbjL8Tporv0WVUwe6n7w==@protonmail.internalid> <CANiq72kFUSFgBv7Es3Mhe4HUaSPZk0EVW=JaMdaAGHsQOxYN6w@mail.gmail.com> <87o6u3vw04.fsf@kernel.org>
In-Reply-To: <87o6u3vw04.fsf@kernel.org>

On Wed Jul 2, 2025 at 10:26 AM CEST, Andreas Hindborg wrote:
> "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:
>
>> On Tue, Jul 1, 2025 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>>
>>> Ultimately this is something for Miguel to decide.
>>
>> Only if you all cannot get to an agreement ;)
>
>>
>> If Andreas wants to have it already added, then I would say just mark
>> it `unsafe` as Benno recommends (possibly with an overbearing
>> precondition), given it has proven subtle/forgettable enough and that,
>> if I understand correctly, it would actually become unsafe if someone
>> "just" added "reasonably-looking code" elsewhere.
>
> You are right that if someone added code to the API, the API could
> become unsound. But that is the deal with all our APIs and I don't agree
> that the details are very subtle here. Someone would need to add sysfs
> support or user provided parameter parsing to cause the unsoundness we
> are talking about.

Normally the safety requirements & invariants are *local*. We do have
some global ones, but this one would be another one. And it's not easy
to control IMO (no code is allowed to run before parameter parsing
finished!).

> Anyone attempting such a task should have proper understanding of the
> code first, and given the ample amount of `NOTE` comments I have added,
> it should be clear that the concurrent accesses that this addition would
> introduce, needs to be accounted for, to avoid data races.

Well if I add a way to add a task to a work queue before parameter
parsing, I don't need to touch this file or even know about it.

> I will add myself as a reviewer for the rust module parameter parsing
> code if that is OK with module maintainers.

I think it's a good idea, but it is orthogonal and doesn't address the
issue, since any tree can merge code that breaks the invariant above.

>> That way we have an incentive to make it safe later on and, more
>> importantly, to think again about it when such a patch lands,
>> justifying it properly. And it could plausibly protect out-of-tree
>> users, too.
>
> Again, I do not think it is reasonable to mark this function unsafe.

We mark it `unsafe` only until atomics are merged and then we make it
safe.

You proposed to do it the other way and make it safe, though possibly
unsound when someone adds code breaking the invariant and making it
fully sound later.

I don't think we should have global invariants that are temporary.

---
Cheers,
Benno

