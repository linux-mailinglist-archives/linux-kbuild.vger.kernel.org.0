Return-Path: <linux-kbuild+bounces-7851-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C31AF6E1D
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 11:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FAB1188089D
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 09:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31D32D4B51;
	Thu,  3 Jul 2025 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFir1PWd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922282D46D8;
	Thu,  3 Jul 2025 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533432; cv=none; b=Fv5ktQ91EIrB1KEjDz6giEdDk7w1Uy3zkfzIh8JVLHDncWUZbzO9fLzjgKPAyZlfxoMfQC8Dio0SV9ABd79cRB7PBx4IHNKG6MPysr9cOiKzkXbw0ZZFADCLKIO87NqzXP3G/MNwsH3TMbIrNgA0G0NOKQ7fsABjWUpNZssYyjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533432; c=relaxed/simple;
	bh=kbEgVgqK1SbedI67JqjXUQivK0IS/eKmWKgp7Da1LgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XS01QqBXDpu8XvHHMTLjlls1R/TAh9LiS4tX05mRuGhtQ1CmyEM3WvRssiu+KbldhfMdPKPHRx53gQriTOtgcuXcfnc5KLobTAxs16rPOnovCwEMQEZProiu9p035FdTi9APW1QmKvmAeJ24gMY8FMQP6KkrRg7Yo9uoqets0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFir1PWd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC56BC4CEE3;
	Thu,  3 Jul 2025 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751533432;
	bh=kbEgVgqK1SbedI67JqjXUQivK0IS/eKmWKgp7Da1LgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KFir1PWdfnx57ynH5Ssvy6Q/FYYrSFn+apUAt0404VMayA9IrBUE9qKCCf2OHKMpA
	 R5hw91AMpSvIgtS80YnD5QNlOkaw4UbkYx3G96idIocZvApocdrGE2v4Tjd6DFpzPu
	 yyyGcJh2/qj5WuNjz7B6y4kvJIk5Fgb8C71Jpnqm5X7x1j4e0oMxa/4Yjba0Wzdqv5
	 Kd0E0tGP/Xxj+5kjGc21VtRWRXH6TGexMGRggYfKAt34yP8gURe49lkoxF4LFCr/Pr
	 d8R0QnmcFOkpOoROi6bULSDbQcNrErZji4trOSbWPo9ag2dhUTM/6zVET2ewrUp968
	 B4INmb9cxerKw==
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
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
In-Reply-To: <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org> (Benno Lossin's message
	of "Wed, 02 Jul 2025 17:07:12 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
	<dO7tJL6M4FKz_QOo-Vbb0bZOybyXa9CkBI0SIIKeCGBHIjNHlpElEV0iPbNeXBa6elnsQXqrGS5AGXdGU5hefQ==@protonmail.internalid>
	<DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 11:03:38 +0200
Message-ID: <87bjq1ve6t.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>> Introduce the `OnceLock` type, a container that can only be written once.
>> The container uses an internal atomic to synchronize writes to the internal
>> value.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/sync.rs           |   1 +
>>  rust/kernel/sync/once_lock.rs | 104 ++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 105 insertions(+)
>>
>> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
>> index c7c0e552bafe..f2ee07315091 100644
>> --- a/rust/kernel/sync.rs
>> +++ b/rust/kernel/sync.rs
>> @@ -15,6 +15,7 @@
>>  mod condvar;
>>  pub mod lock;
>>  mod locked_by;
>> +pub mod once_lock;
>
> As Alice already said, we should reexport the type. And then make the
> module private, no need to have `kernel::sync::OnceLock` and
> `kernel::sync::once_lock::OnceLock`...

Will do.

>
> Also, I agree with the name change to `SetOnce` or something similar.

I'm OK with that, but please see my comments on Alice suggestion.

>
>>  pub mod poll;
>>  pub mod rcu;
>>
>> diff --git a/rust/kernel/sync/once_lock.rs b/rust/kernel/sync/once_lock.rs
>> new file mode 100644
>> index 000000000000..cd311bea3919
>> --- /dev/null
>> +++ b/rust/kernel/sync/once_lock.rs
>> @@ -0,0 +1,104 @@
>> +//! A container that can be initialized at most once.
>> +
>> +use super::atomic::ordering::Acquire;
>> +use super::atomic::ordering::Release;
>> +use super::atomic::Atomic;
>> +use kernel::types::Opaque;
>> +
>> +/// A container that can be populated at most once. Thread safe.
>> +///
>> +/// Once the a [`OnceLock`] is populated, it remains populated by the same object for the
>> +/// lifetime `Self`.
>> +///
>> +/// # Invariants
>> +///
>> +/// `init` tracks the state of the container:
>> +///
>> +/// - If the container is empty, `init` is `0`.
>> +/// - If the container is mutably accessed, `init` is `1`.
>
> I think we should swap the order and change the ifs to iffs:
>
>     - `init == 0` iff the container is empty.
>     - `init == 1` iff the container is being accessed mutably.

Right, that is better, but I will expand "iff".

>
>> +/// - If the container is populated and ready for shared access, `init` is `2`.
>
> You also need that `init` is only increased and never decreases.
> Otherwise you could read a `2` and then access the value, but `init`
> changed under your nose to `0`.
>
> Then the INVARIANT comments below also need to be updated.

OK.

>
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// # use kernel::sync::once_lock::OnceLock;
>> +/// let value = OnceLock::new();
>> +/// assert_eq!(None, value.as_ref());
>> +///
>> +/// let status = value.populate(42u8);
>> +/// assert_eq!(true, status);
>> +/// assert_eq!(Some(&42u8), value.as_ref());
>> +/// assert_eq!(Some(42u8), value.copy());
>> +///
>> +/// let status = value.populate(101u8);
>> +/// assert_eq!(false, status);
>> +/// assert_eq!(Some(&42u8), value.as_ref());
>> +/// assert_eq!(Some(42u8), value.copy());
>> +/// ```
>> +pub struct OnceLock<T> {
>> +    init: Atomic<u32>,
>> +    value: Opaque<T>,
>> +}
>> +
>> +impl<T> Default for OnceLock<T> {
>> +    fn default() -> Self {
>> +        Self::new()
>> +    }
>> +}
>> +
>> +impl<T> OnceLock<T> {
>> +    /// Create a new [`OnceLock`].
>> +    ///
>> +    /// The returned instance will be empty.
>> +    pub const fn new() -> Self {
>> +        // INVARIANT: The container is empty and we set `init` to `0`.
>> +        Self {
>> +            value: Opaque::uninit(),
>> +            init: Atomic::new(0),
>> +        }
>> +    }
>> +
>> +    /// Get a reference to the contained object.
>> +    ///
>> +    /// Returns [`None`] if this [`OnceLock`] is empty.
>> +    pub fn as_ref(&self) -> Option<&T> {
>> +        if self.init.load(Acquire) == 2 {
>> +            // SAFETY: As determined by the load above, the object is ready for shared access.
>
>     // SAFETY: By the safety requirements of `Self`, `self.init == 2` means that `self.value` contains
>     // a valid value.

By the *type invariants* I guess?

>
>> +            Some(unsafe { &*self.value.get() })
>> +        } else {
>> +            None
>> +        }
>> +    }
>> +
>> +    /// Populate the [`OnceLock`].
>> +    ///
>> +    /// Returns `true` if the [`OnceLock`] was successfully populated.
>> +    pub fn populate(&self, value: T) -> bool {
>> +        // INVARIANT: We obtain exclusive access to the contained allocation and write 1 to
>> +        // `init`.
>> +        if let Ok(0) = self.init.cmpxchg(0, 1, Acquire) {
>> +            // SAFETY: We obtained exclusive access to the contained object.
>> +            unsafe { core::ptr::write(self.value.get(), value) };
>> +            // INVARIANT: We release our exclusive access and transition the object to shared
>> +            // access.
>> +            self.init.store(2, Release);
>> +            true
>> +        } else {
>> +            false
>> +        }
>> +    }
>> +}
>> +
>> +impl<T: Copy> OnceLock<T> {
>> +    /// Get a copy of the contained object.
>> +    ///
>> +    /// Returns [`None`] if the [`OnceLock`] is empty.
>> +    pub fn copy(&self) -> Option<T> {
>> +        if self.init.load(Acquire) == 2 {
>> +            // SAFETY: As determined by the load above, the object is ready for shared access.
>> +            Some(unsafe { *self.value.get() })
>> +        } else {
>> +            None
>> +        }
>
> The impl can just be:
>
>     self.as_ref().copied()

Nice. I was thinking of dropping this method and just have callers do

 my_once_lock.as_ref().map(|v| v.copied())

What do you think?


Best regards,
Andreas Hindborg




