Return-Path: <linux-kbuild+bounces-7796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CF8AEE720
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 21:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C4433B77CE
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 19:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F6F1E570D;
	Mon, 30 Jun 2025 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3HRpiCM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2643151;
	Mon, 30 Jun 2025 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310165; cv=none; b=gg7C4QpgIlrq3hUupYscOMWQzLkkjLH+SXqQOXqfWQ8dXyMh/5zPs/VpqVnNKndFvutszahCVpDLm0VOujGQcsH+WI9S/OHeLQuZTkAroG3WjwVVowS3ppupYWNVnF8wXtN6iQYNgDBty8gy5QyQCfqg7UnXtCVyommiZGnKaH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310165; c=relaxed/simple;
	bh=3ZviabXAPMdMjrA9k+SYU8j0EE5YIyw3lU8BHpP0Ee0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=kltGd0qbsVyrtcp0cWVoUfWrRyw2wiJ/Gq3GGQZgGCc9gxJvSV2ZfHtuhuOHHbHCKKl8OLNTTraeKpg0zlcwfebBbNK9brUPl6S0u4flE83jpr7qybWlUuETfadB8lWmOYrgmygTWXQ4TmwuPWzDNOfI2OR5AGIaX4qVCozhYIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3HRpiCM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAC7C4CEE3;
	Mon, 30 Jun 2025 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751310164;
	bh=3ZviabXAPMdMjrA9k+SYU8j0EE5YIyw3lU8BHpP0Ee0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3HRpiCMZeaha7LTlG3YTPJUXrhyvdpEgyTeZwt1v87WQe+xdqXfnC1jXlNNv2Jla
	 bP2vX8MvmfsagwTgAAySOB3xpDGaGl5h78M3HGhQrQ4Z+wlN0fkmnTEbny1+i0i2xj
	 0cnNnSDrn+PzjX7/i3SFrcbqD/7VYgFsSRTUfmFWx9d+i7oSmjSokW4BOkHQb+Xs2c
	 QNAbGed9RpQPSxXNUtES/EztOB3+v22I3aSdZB42jLbZv/7hL+CP4bSdJAqRGH+1B9
	 aJUdnbowWXoCkoI+yjdcl7+MoS48WqSUZF4KBHZk3V9MKd3n+J2Y9CivoqqCtfMq1f
	 no5Wiy5fsinsA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 21:02:37 +0200
Message-Id: <DB03MZI2FCOW.2JBFL3TY38FK@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
 <COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid> <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org> <smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid> <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org> <Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid> <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org> <RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid> <DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org> <87plepzke5.fsf@kernel.org> <xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid> <DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> <87wm8txysl.fsf@kernel.org>
 <9G3W1seaM7elcwWXaeoaa2nfpFYCf-AmBdvZhACGP13KGUtTPVMwGNYdTQsdtp8ru7GIP3-UYTzXscC1MRUKrg==@protonmail.internalid> <DAZV8OGL8BMH.11SLXBXQ17ZJ9@kernel.org> <87h5zxxtdw.fsf@kernel.org>
In-Reply-To: <87h5zxxtdw.fsf@kernel.org>

On Mon Jun 30, 2025 at 3:15 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Mon Jun 30, 2025 at 1:18 PM CEST, Andreas Hindborg wrote:
>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>> (no idea if the orderings are correct, I always have to think way to
>>>> much about that... especially since our atomics seem to only take one
>>>> ordering in compare_exchange?)
>>>>
>>>>> As far as I can tell, atomics may not land in v6.17, so this series
>>>>> will probably not be ready for merge until v6.18 at the earliest.
>>>>
>>>> Yeah, sorry about that :(
>>>
>>> Actually, perhaps we could aim at merging this code without this
>>> synchronization?
>>
>> I won't remember this issue in a few weeks and I fear that it will just
>> get buried. In fact, I already had to re-read now what the actual issue
>> was...
>>
>>> The lack of synchronization is only a problem if we
>>> support custom parsing. This patch set does not allow custom parsing
>>> code, so it does not suffer this issue.
>>
>> ... In doing that, I saw my original example of UB:
>>
>>     module! {
>>         // ...
>>         params: {
>>             my_param: i64 {
>>                 default: 0,
>>                 description: "",
>>             },
>>         },
>>     }
>>
>>     static BAD: &'static i64 =3D module_parameters::my_param.get();
>>
>> That can happen without custom parsing, so it's still a problem...
>
> Ah, got it. Thanks.

On second thought, we *could* just make the accessor function `unsafe`.
Of course with a pinky promise to make the implementation safe once
atomics land. But I think if it helps you get your driver faster along,
then we should do it.

---
Cheers,
Benno

