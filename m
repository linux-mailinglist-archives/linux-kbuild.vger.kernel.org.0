Return-Path: <linux-kbuild+bounces-7804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D8AEF194
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 10:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 447E217F716
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 08:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545C126B09D;
	Tue,  1 Jul 2025 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5FB23ln"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1031D7989;
	Tue,  1 Jul 2025 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359448; cv=none; b=lJ4oMhOUIrdjTOIK4tiyzU/s+zPUbWdbcgSSva4oYKYzvxJjEuk5dRZPwp0dNILoZj9Tsx4jFJOq8CARI+U8vwrFAFVpOIJYq6G5A2mIt2VBVmI5EM4EzIk9RmLNGPCUIbq64i8Z36M1XXV7f/dlIBKmCXPbpCegWllEaSHkMdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359448; c=relaxed/simple;
	bh=JQnJ50WwtWPmuUmhqUal++GEN46ier5irpKnyb6pzhk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AIt+ApAqQKorU/heenE2hWNmo7aa1sOElvDgiS2sYL5gMNUXW2NdH+7LmNssW3RvTLsOp8dmhjb1z7WeFtuUpiattq3jES8s1K0Ks1bcrdP1xxta6lDIZW+EEPQ4WQ10l11eJ8PRQB+gF4zvagTgscsR9N4Az4zXBlPG/Rj+1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5FB23ln; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF3AC4CEEB;
	Tue,  1 Jul 2025 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751359447;
	bh=JQnJ50WwtWPmuUmhqUal++GEN46ier5irpKnyb6pzhk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W5FB23lnRmqMblxQRYfHg3U8Cb96WoRZP9N91S7HABOR21skwzV5IaYGRpc3SMCED
	 0jmWPuRHRM9Of1mZsV142+GoRxobrpP+f2JUis8pCQX8jsHc2hToAqMlDSA4cEQc6W
	 7zmUtc+x8mJc0qKbiE5E/u17/kIbXirUJOaHd88F33v/Qv43qtn6ngBW8W5yiZw2qc
	 +zBd1BXmKL1Fr/5+eieLu+o+5OhUZ8nVt1L6qP3xR+StIRlCaLYZ75R6+sguURrD8a
	 VJpWu8tLOa/LXp4BPDOKn97dd/kfB7eDKmTmFb5/nEKuMmcejKsXNuueOLc3ZdR+GD
	 KAXHLMCtD9EHw==
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
In-Reply-To: <DB03MZI2FCOW.2JBFL3TY38FK@kernel.org> (Benno Lossin's message of
	"Mon, 30 Jun 2025 21:02:37 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
	<smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid>
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
	<DB03MZI2FCOW.2JBFL3TY38FK@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 01 Jul 2025 10:43:56 +0200
Message-ID: <87bjq4xpv7.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Mon Jun 30, 2025 at 3:15 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Mon Jun 30, 2025 at 1:18 PM CEST, Andreas Hindborg wrote:
>>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>>> (no idea if the orderings are correct, I always have to think way to
>>>>> much about that... especially since our atomics seem to only take one
>>>>> ordering in compare_exchange?)
>>>>>
>>>>>> As far as I can tell, atomics may not land in v6.17, so this series
>>>>>> will probably not be ready for merge until v6.18 at the earliest.
>>>>>
>>>>> Yeah, sorry about that :(
>>>>
>>>> Actually, perhaps we could aim at merging this code without this
>>>> synchronization?
>>>
>>> I won't remember this issue in a few weeks and I fear that it will just
>>> get buried. In fact, I already had to re-read now what the actual issue
>>> was...
>>>
>>>> The lack of synchronization is only a problem if we
>>>> support custom parsing. This patch set does not allow custom parsing
>>>> code, so it does not suffer this issue.
>>>
>>> ... In doing that, I saw my original example of UB:
>>>
>>>     module! {
>>>         // ...
>>>         params: {
>>>             my_param: i64 {
>>>                 default: 0,
>>>                 description: "",
>>>             },
>>>         },
>>>     }
>>>
>>>     static BAD: &'static i64 = module_parameters::my_param.get();
>>>
>>> That can happen without custom parsing, so it's still a problem...
>>
>> Ah, got it. Thanks.
>
> On second thought, we *could* just make the accessor function `unsafe`.
> Of course with a pinky promise to make the implementation safe once
> atomics land. But I think if it helps you get your driver faster along,
> then we should do it.

No, I am OK for now with configfs.

But, progress is still great. How about if we add a copy accessor
instead for now, I think you proposed that a few million emails ago:

    pub fn get(&self) -> T;

or maybe rename:

    pub fn copy(&self) -> T;

Then we are fine safety wise for now, right? It is even sensible for
these `T: Copy` types.


Best regards,
Andreas Hindborg




