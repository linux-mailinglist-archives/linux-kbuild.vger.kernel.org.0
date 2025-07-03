Return-Path: <linux-kbuild+bounces-7869-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA0AF820A
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 22:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 069D34861B0
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 20:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D12F2BD59E;
	Thu,  3 Jul 2025 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibt7q1in"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA9224B01;
	Thu,  3 Jul 2025 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575314; cv=none; b=vBvNbThf5CxiRFFiDKdfprdHE1G9KBTn/tLPmNsaeAV/v6Fv0otyZnUNforTtfWBPjjGBOViaAU4w3hY1vsNd7FxMwMKshkyo9/zMZ+rutipLL9V7oFiEHawK26PjUQ7I+36JODpm7ZuG5PnOut9AO8jTwWy/lkQNaYPbokYBlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575314; c=relaxed/simple;
	bh=kfQCrWTU8jF0Wb8PkVzyL3vCnCGGq4Sl58weKgDBXNI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ejv9QX3M1h5sVGBdc8At26gklukLmbaUdEiWVfE6MqYIhiJMCBeq9JhMa1NZOS51c+cy4UWqWtU2lfOXAy9idH7rIQyRv9LuFT/7BFb0cQ0fpRYlkHAhkimNRQbQ+3/Vl6fOSuPreDzGq5EcXy/XRdsMgxLlxy814+MBYODyAjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibt7q1in; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391E1C4CEE3;
	Thu,  3 Jul 2025 20:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751575313;
	bh=kfQCrWTU8jF0Wb8PkVzyL3vCnCGGq4Sl58weKgDBXNI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ibt7q1insR1nFsC3nmwtOtPt2S8QoUreqHzdhiXnaP+1kdgOG1CWm/1PdoSZUN/Hu
	 /O9SZX+I0Qhe5KZckoe4kMnE9/+DiWGHcXbEjhxtxeB7cFCXZpM5Xwo8CrrmChL783
	 DqFJEp+DjM20T3NZdhlte4CHsMYRAoMv4UFlZYmM++nH+dEkwdNkza2ZpHdOo1Pt+U
	 /go0ZezP7aLj3HqGilqBnIOe3LJuNM2wVEtdT05GYh/5ri/eA+OFRXKkbrxh5rBv2U
	 41PZzacjdw953uljPolHeVkJsIm+SYob6QGyMO3b0wsuD6fd6gCL/tNzYDp9DicJnB
	 brzjwCUji7auA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 22:41:47 +0200
Message-Id: <DB2PMJKCP2K6.3SRFFDDXL3CV1@kernel.org>
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
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
 <dO7tJL6M4FKz_QOo-Vbb0bZOybyXa9CkBI0SIIKeCGBHIjNHlpElEV0iPbNeXBa6elnsQXqrGS5AGXdGU5hefQ==@protonmail.internalid> <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org> <87bjq1ve6t.fsf@kernel.org> <vbMLL995UAW3v-0IanP32kkT2-kRHTK21bCbdsgaykKMsJk3gEKRbJk4CegAZWuTR8oAhAI1R-wFgMuezTeNLw==@protonmail.internalid> <DB2BM4UMCFQR.3SQWIRF7HDP09@kernel.org> <87y0t5tf56.fsf@kernel.org>
In-Reply-To: <87y0t5tf56.fsf@kernel.org>

On Thu Jul 3, 2025 at 6:25 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Thu Jul 3, 2025 at 11:03 AM CEST, Andreas Hindborg wrote:
>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>>>>> +impl<T: Copy> OnceLock<T> {
>>>>> +    /// Get a copy of the contained object.
>>>>> +    ///
>>>>> +    /// Returns [`None`] if the [`OnceLock`] is empty.
>>>>> +    pub fn copy(&self) -> Option<T> {
>>>>> +        if self.init.load(Acquire) =3D=3D 2 {
>>>>> +            // SAFETY: As determined by the load above, the object i=
s ready for shared access.
>>>>> +            Some(unsafe { *self.value.get() })
>>>>> +        } else {
>>>>> +            None
>>>>> +        }
>>>>
>>>> The impl can just be:
>>>>
>>>>     self.as_ref().copied()
>>>
>>> Nice. I was thinking of dropping this method and just have callers do
>>>
>>>  my_once_lock.as_ref().map(|v| v.copied())
>>>
>>> What do you think?
>>
>> There is `Option::copied`, so no need for the `.map` call.
>
> Cool.
>
>> I don't
>> really have a preference, if users always want to access it by-value,
>> then we should have `copy`.
>
> But should it be `copy` or `copied` like `Option`?

I'd say `copy`. With `copied` I'm thinking of something that turns
`OnceLock<&T>` into `OnceLock<T>`, which is weird...

---
Cheers,
Benno

