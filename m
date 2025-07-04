Return-Path: <linux-kbuild+bounces-7875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEDAAF8F51
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 11:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4951C42566
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 10:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA582EE962;
	Fri,  4 Jul 2025 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAv/XRZo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91329B790;
	Fri,  4 Jul 2025 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623187; cv=none; b=ZDjITSKtryE9RVaHzoJoZK1X0Rbi1NBwerWguP2rg/U4rlVcikwCgycfpV6znkxIffhYkr1stKaOUm+ooRXgvAz4x9HqXk+sritbxD7Z4g47LAe27nC/wovgAMwEQUoUbtU/b6Qk/01kyL9JY/wCEtIpgLcwPFC/XNTOiwxBEO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623187; c=relaxed/simple;
	bh=i2NX/0XGbvqHv1vq1CFp+VRtaQ0tYwiJJDPkl7hVchI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KVn2jxEyES+gN3JkoHUk1X3Uwr8p5FLXQkpb5xVvj+k4V1AOeClSw40tjaRarXHuey4oOVxlVj2dFvfBiVFnylO7/PTV206dQc1uYSXqE2oEusYMmTy9GA39lo+m7uE0bCTID0AzlVD0Xqefo655RtqQUk2gbNVXDQjE3c5LL0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAv/XRZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06C3C4CEE3;
	Fri,  4 Jul 2025 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751623187;
	bh=i2NX/0XGbvqHv1vq1CFp+VRtaQ0tYwiJJDPkl7hVchI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=NAv/XRZoBqDaKXo52NCJUZhjJlI/0JD6+0jqOmjvc5+n6kUXo8WrgAbTkYNO3lGcw
	 JzhUAj1JSkcypWKhFMT4vnk6wriwxLCOYCe3g1CfeY0MahZaYKV3j4/wpDWZYcHA7N
	 DFkI+FCwSpJcSvF5FAbec2vjjBIDug+QJ2QP6lOmBjH9QaXWqxCzaHCAHvdqHWmMyj
	 OTKJq5B/JLEHe0j5gqwcjJ0+RIgB2mduUspe4Wfzzc0+wnSAMHsN/hmvx5DsuDfpBh
	 Kfs9k8nUXc9LnXxPU7IBdw3jqNPvo8vBEV/r9nlS5pl78dnCiptnkPgHUSq5RwoaO+
	 bEZomn9lhLcYQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Jul 2025 11:59:40 +0200
Message-Id: <DB36LGJOWHZQ.GHXR3VGX7806@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Trevor Gross" <tmgross@umich.edu>, "Adam
 Bratschi-Kaye" <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 3/7] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
 <aOJo8e9FTJikY-WFnv8a7qAvQS6RFIHTU_gb8fa9RD-8SdGo7o56AoSlWUJUG9NTNB1Wgd09N4p5LJEY8HHXvQ==@protonmail.internalid> <0e89892f-103e-4b92-a067-e192cb7b89a6@kernel.org> <875xg8tnv7.fsf@kernel.org> <87zfdks8y2.fsf@kernel.org>
In-Reply-To: <87zfdks8y2.fsf@kernel.org>

On Fri Jul 4, 2025 at 9:37 AM CEST, Andreas Hindborg wrote:
> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
>> "Danilo Krummrich" <dakr@kernel.org> writes:
>>
>>> On 7/2/25 3:18 PM, Andreas Hindborg wrote:
>>>> +    /// Get a shared reference to the parameter value.
>>>> +    // Note: When sysfs access to parameters are enabled, we have to =
pass in a
>>>> +    // held lock guard here.
>>>> +    pub fn get(&self) -> &T {
>>>> +        self.value.as_ref().unwrap_or(&self.default)
>>>> +    }
>>>
>>> I think you forgot to rename this.
>>
>> Yes, thanks for being persistent on this :)
>
> Actually, there is a discussion on whether to keep the API similar to
> `std::sync::OnceLock` [1] but also whether to rename this to something
> other than `OnceLock` [2]. Depending on how that resolves, it might make
> sense to stay with `get` or rename to something else.

But this is for the `ModuleParamAccess`, right? There I think it makes
sense to choose `access` or `value`.

---
Cheers,
Benno

> Best regards,
> Andreas Hindborg
>
>
> [1] https://lore.kernel.org/all/35e1fef4-b715-4827-a498-bdde9b58b51c@peng=
uintechs.org
> [2] https://lore.kernel.org/all/CAH5fLggY2Ei14nVJzLBEoR1Rut1GKU4SZX=3D+14=
tuRH1aSuQVTA@mail.gmail.com

