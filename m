Return-Path: <linux-kbuild+bounces-7853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08801AF6F02
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 11:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A930D16CB21
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 09:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C6428ECD1;
	Thu,  3 Jul 2025 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+8pTfm1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C3226CF8;
	Thu,  3 Jul 2025 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535786; cv=none; b=lTM86eHQw7Fi2KZ/YgcDbCUEikhHfCz+8ysilSa4xQWwOf7MQOj1clTfVBf1VRuHtio9rhyBga6/UPDdNrG/p/DedalUszoFXV67gwbNOaAXG1nMT36EsVs64PEv1bYZQfTdXhDXk2KRzU7lsWuzAjsij/61/TyDi8x4a9HlbQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535786; c=relaxed/simple;
	bh=x7llXm1Wc1Knju/eXnjIz5voqe0e0IahnlFOhVrt2cQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=X8LPDYoIldXDhGRHhjIgpBjgNLyhpbRUMXXEWB7Th8J0gCb0FEmbDqecuwvaB9398ZrRlv6k0zyq8lhh3She2PiHNt4PczV/4CN5pOIqgQZ1KvuWXsffftxekYppEB43334I+ZTx5dMGGCDrvOE5twX/ny5oKtqisDDBgcx/tgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+8pTfm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EF0C4CEEB;
	Thu,  3 Jul 2025 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751535785;
	bh=x7llXm1Wc1Knju/eXnjIz5voqe0e0IahnlFOhVrt2cQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=S+8pTfm1iFBwFfXg7bmM6ffdRoVHbLeyb5LLuNb+kMBbOt4pVR/BBn2AefrnafS6S
	 4eqhQc5ZfvxRVzQ10FNcOcIITlalQELD0P3xhs0L6Abdp9rn9gZaW2Zh7+XaxTwdgp
	 XH1tacsJm/VA3aRfjfIkpIHS8PMZGJWvlf2BFhQbtdHhMkAHHxjRVMHL7uHGUKB4D1
	 R0bkL4kKW0zxZycOjvR5/1NxjWub41d6tl/fVMHyrq5Mj7XueQZx1zyKfND6SI8LqK
	 Dlo5PvwxOF0472ERAhRFBraxna3u7GZy57e+AGoc7vCfblntF6kZUhBuzw2SFZD96H
	 qIy4r52JCMiSA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 11:42:59 +0200
Message-Id: <DB2BM4UMCFQR.3SQWIRF7HDP09@kernel.org>
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
 <dO7tJL6M4FKz_QOo-Vbb0bZOybyXa9CkBI0SIIKeCGBHIjNHlpElEV0iPbNeXBa6elnsQXqrGS5AGXdGU5hefQ==@protonmail.internalid> <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org> <87bjq1ve6t.fsf@kernel.org>
In-Reply-To: <87bjq1ve6t.fsf@kernel.org>

On Thu Jul 3, 2025 at 11:03 AM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>>> +///
>>> +/// # Example
>>> +///
>>> +/// ```
>>> +/// # use kernel::sync::once_lock::OnceLock;
>>> +/// let value =3D OnceLock::new();
>>> +/// assert_eq!(None, value.as_ref());
>>> +///
>>> +/// let status =3D value.populate(42u8);
>>> +/// assert_eq!(true, status);
>>> +/// assert_eq!(Some(&42u8), value.as_ref());
>>> +/// assert_eq!(Some(42u8), value.copy());
>>> +///
>>> +/// let status =3D value.populate(101u8);
>>> +/// assert_eq!(false, status);
>>> +/// assert_eq!(Some(&42u8), value.as_ref());
>>> +/// assert_eq!(Some(42u8), value.copy());
>>> +/// ```
>>> +pub struct OnceLock<T> {
>>> +    init: Atomic<u32>,
>>> +    value: Opaque<T>,
>>> +}
>>> +
>>> +impl<T> Default for OnceLock<T> {
>>> +    fn default() -> Self {
>>> +        Self::new()
>>> +    }
>>> +}
>>> +
>>> +impl<T> OnceLock<T> {
>>> +    /// Create a new [`OnceLock`].
>>> +    ///
>>> +    /// The returned instance will be empty.
>>> +    pub const fn new() -> Self {
>>> +        // INVARIANT: The container is empty and we set `init` to `0`.
>>> +        Self {
>>> +            value: Opaque::uninit(),
>>> +            init: Atomic::new(0),
>>> +        }
>>> +    }
>>> +
>>> +    /// Get a reference to the contained object.
>>> +    ///
>>> +    /// Returns [`None`] if this [`OnceLock`] is empty.
>>> +    pub fn as_ref(&self) -> Option<&T> {
>>> +        if self.init.load(Acquire) =3D=3D 2 {
>>> +            // SAFETY: As determined by the load above, the object is =
ready for shared access.
>>
>>     // SAFETY: By the safety requirements of `Self`, `self.init =3D=3D 2=
` means that `self.value` contains
>>     // a valid value.
>
> By the *type invariants* I guess?

Oh yeah.

>>> +            Some(unsafe { &*self.value.get() })
>>> +        } else {
>>> +            None
>>> +        }
>>> +    }
>>> +
>>> +    /// Populate the [`OnceLock`].
>>> +    ///
>>> +    /// Returns `true` if the [`OnceLock`] was successfully populated.
>>> +    pub fn populate(&self, value: T) -> bool {
>>> +        // INVARIANT: We obtain exclusive access to the contained allo=
cation and write 1 to
>>> +        // `init`.
>>> +        if let Ok(0) =3D self.init.cmpxchg(0, 1, Acquire) {
>>> +            // SAFETY: We obtained exclusive access to the contained o=
bject.
>>> +            unsafe { core::ptr::write(self.value.get(), value) };
>>> +            // INVARIANT: We release our exclusive access and transiti=
on the object to shared
>>> +            // access.
>>> +            self.init.store(2, Release);
>>> +            true
>>> +        } else {
>>> +            false
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +impl<T: Copy> OnceLock<T> {
>>> +    /// Get a copy of the contained object.
>>> +    ///
>>> +    /// Returns [`None`] if the [`OnceLock`] is empty.
>>> +    pub fn copy(&self) -> Option<T> {
>>> +        if self.init.load(Acquire) =3D=3D 2 {
>>> +            // SAFETY: As determined by the load above, the object is =
ready for shared access.
>>> +            Some(unsafe { *self.value.get() })
>>> +        } else {
>>> +            None
>>> +        }
>>
>> The impl can just be:
>>
>>     self.as_ref().copied()
>
> Nice. I was thinking of dropping this method and just have callers do
>
>  my_once_lock.as_ref().map(|v| v.copied())
>
> What do you think?

There is `Option::copied`, so no need for the `.map` call. I don't
really have a preference, if users always want to access it by-value,
then we should have `copy`.

---
Cheers,
Benno

