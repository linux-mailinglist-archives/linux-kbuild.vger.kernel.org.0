Return-Path: <linux-kbuild+bounces-7882-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FFFAF94D9
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 16:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8636587D06
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 14:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2AB4501A;
	Fri,  4 Jul 2025 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxImwCjO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46D1273F9;
	Fri,  4 Jul 2025 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637664; cv=none; b=rdDBT7yfEcb1XrP+XCj3MY+Pg/HesObnPIwe8B9YS/GJls0KL5cWm8jL3C3r6sBFxDPGqyQeAUc5+SY7RoBPxKT4+p5R+fGs2T1xUGDchHC20aQ8zZym7ZZFXRilt9bsFg2gg5On5SLl3tYYZdcK/XWa8hfMUHnlo0sHHsUtaOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637664; c=relaxed/simple;
	bh=MH35eF0CmI7L7oslC20HrDk0Bjg9pVK4Ssqj9zI7+rQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JBRU9ynb8cvftIZI6gwzzIwuZh6+UpMT67bppkip4y700C6pVOWtvqCVfs7UTrcsKYsBF2Y3NcH7x7FPP6XCSqTJRlCxnGEtz+U+Sg6Z8ub5bYQ+wpcf2F/mkxJaIR8rQzm8ht656SolFT8fuYnVejssz12kR+X1dNq+MbVBVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxImwCjO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CC6C4CEE3;
	Fri,  4 Jul 2025 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751637664;
	bh=MH35eF0CmI7L7oslC20HrDk0Bjg9pVK4Ssqj9zI7+rQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=gxImwCjOs7DiaSHZ6K+ae9M507FW7V93du2DHvDhsPA+mc5hFEd1Ut6HLd2VtEljS
	 3FOK8L8Jd/8zJu/bpFyVwHaqT/nhDsw3iplgD67lGSEIf+aoQIi95iaMxDe0jL0sno
	 MVL8VZ4RTGmGvC9bbOUXOGlsigJ3anmOHV/TzUkObjCSbJKgx+nx2NFHcYB2DRgOcJ
	 DPJGxj7x6gylXShdHmkFEPDBfts6ockAOjKAczAZV/gaDdTcCd/HVPFn4F/iF34CAp
	 srZNdSgmkKnEUtWkyAA+K2N7bECflbMwC58C/fG9g21D+amyGVhHc9QtCb7FbpyVa5
	 /p2UKNcJzcyJw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Jul 2025 16:00:56 +0200
Message-Id: <DB3BQ6IIFK35.JDQBAJWVQQT6@kernel.org>
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
Subject: Re: [PATCH v14 5/7] rust: module: update the module macro with
 module parameter support
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-5-5b1cc32311af@kernel.org>
 <5fYjUlNFhuBwWOP46ph07KX4CMe0ORT5pZ_pD-l719E0ChkPTI2pV1tYJcN3oxKKcMI8_HGU1InaWBj52Kbbag==@protonmail.internalid> <DB1OK2PQZ790.S317HUWYJR3J@kernel.org> <875xg8rvei.fsf@kernel.org> <32cgJkp6-1w5-FLQMuvqhCiTvKUhR7SiIWtWdQFlkp2UoeAU3YuYmj7EElURj_NxY01OuuWlZ2aNPzX1UksjOg==@protonmail.internalid> <DB3A6GR3TQON.C9N9U4V48R1D@kernel.org> <87zfdkqd28.fsf@kernel.org>
In-Reply-To: <87zfdkqd28.fsf@kernel.org>

On Fri Jul 4, 2025 at 3:51 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Fri Jul 4, 2025 at 2:29 PM CEST, Andreas Hindborg wrote:
>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>>>>> +                            perm: 0, // Will not appear in sysfs
>>>>> +                            level: -1,
>>>>> +                            flags: 0,
>>>>> +                            __bindgen_anon_1:
>>>>> +                                ::kernel::bindings::kernel_param__bi=
ndgen_ty_1 {{
>>>>> +                                    arg: {param_name}.as_void_ptr()
>>>>> +                                }},
>>>>
>>>> Formatting?
>>>>
>>>> +                            __bindgen_anon_1: ::kernel::bindings::ker=
nel_param__bindgen_ty_1 {{
>>>> +                                arg: {param_name}.as_void_ptr()
>>>> +                            }},
>>>
>>>
>>> That makes the line more than 100 characters after changing other
>>> formatting things. Perhaps I should just left shift all this?
>>
>> Not sure what you mean by left shift? When I tried it, it was fine, but
>> it could have changed with the other things... Do you have a branch with
>> your changes?
>
> Move all the code template so the least indented start at column 0.
>
> My WIP branch is here [1].

If you dedent the contents of the string once, then everything fits in
100 columns.

---
Cheers,
Benno

> Best regards,
> Andreas Hindborg
>
>
> [1] https://github.com/metaspace/linux/tree/module-params

