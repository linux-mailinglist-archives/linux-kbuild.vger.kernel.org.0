Return-Path: <linux-kbuild+bounces-7960-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592EAFF2C9
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 22:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99A2A5C083B
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 20:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1568192B96;
	Wed,  9 Jul 2025 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rERbOUVA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04385661;
	Wed,  9 Jul 2025 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092191; cv=none; b=odm99NFtmyE+Ae+aFRISbO5l8rDhQNRTAEQDuHswGN8pvVnGNaSgWo+JUCsqp1JFYE7UFZB3Lj6XZQjoPIHUS3OCeJi9iimwZqnVJKqzHagB1lFcWPmd20j0kn1bYWAH5L8/RZjA0zYYTMTiC9pqXFhqm/zHoWv2uFFvs0cAbdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092191; c=relaxed/simple;
	bh=kzzn1t6koQX/tzZIQ63RKAD8YpnItmKWCPPzxDVRLWQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IscxE9r4OMkT/OV02LeQrtykdcq4asnpX3RCax9bKiTyFsmhvF55+zFFuvpkh2CzH4cEg9/w0yViFIOF2qlWyfL8iDq6TZ4bQPp/pVNAdq7Sc/mg0RFpR358m0ETFiUctTj1adNSrXPyI0vJg624vJKqomqv5flDDLajD7a1jc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rERbOUVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C1EC4CEEF;
	Wed,  9 Jul 2025 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752092191;
	bh=kzzn1t6koQX/tzZIQ63RKAD8YpnItmKWCPPzxDVRLWQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=rERbOUVAgzDxFQ43dSdobSMOk8djih6GT3wb4z1xGjHmxr9kU/wLFdjZ9eJqMTKV2
	 hkgG2wwbIuknhgYJDRqlaKsGr3L/ptojX1VEnDP1cpn4jR5BTkvt5zIPJPJhcqySW4
	 qaI3cd8XFh51aRfVfHEaC+Mg4WpQN+CSBAr2Cexuk8E4qtyv96rXh7UzD7Fn1kQXhy
	 LmQ+9fSbTJLoj6tXEjf7GRJj3+BnUtYETWbDiz2xw/nC4P6elgseQCxqmTzNUzK+2c
	 nH7SPD2/JtxnelwVHa6njwsQUzzhMFHyNcEwSnR8AyEIW61nrtdYawbRcqCJI4/Ibe
	 kr6qsmq/95aOw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 22:16:24 +0200
Message-Id: <DB7SUDRTDJK7.2TXKP6EQJ77FL@kernel.org>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v16 1/7] rust: sync: add `SetOnce`
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
X-Mailer: aerc 0.20.1
References: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
 <20250709-module-params-v3-v16-1-4f926bcccb50@kernel.org>
In-Reply-To: <20250709-module-params-v3-v16-1-4f926bcccb50@kernel.org>

On Wed Jul 9, 2025 at 7:52 PM CEST, Andreas Hindborg wrote:
> Introduce the `SetOnce` type, a container that can only be written once.
> The container uses an internal atomic to synchronize writes to the intern=
al
> value.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

A couple notes on safety documentation below. Also one pretty subtle
functionality change from last version. With everything fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/sync.rs          |   2 +
>  rust/kernel/sync/set_once.rs | 122 +++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 124 insertions(+)
>
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 81e3a806e57e2..13e6bc7fa87ac 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -18,6 +18,7 @@
>  mod locked_by;
>  pub mod poll;
>  pub mod rcu;
> +mod set_once;
> =20
>  pub use arc::{Arc, ArcBorrow, UniqueArc};
>  pub use completion::Completion;
> @@ -26,6 +27,7 @@
>  pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
>  pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
>  pub use locked_by::LockedBy;
> +pub use set_once::SetOnce;
> =20
>  /// Represents a lockdep class. It's a wrapper around C's `lock_class_ke=
y`.
>  #[repr(transparent)]
> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> new file mode 100644
> index 0000000000000..73706abfe9991
> --- /dev/null
> +++ b/rust/kernel/sync/set_once.rs
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A container that can be initialized at most once.
> +
> +use super::atomic::{
> +    ordering::{Acquire, Relaxed, Release},
> +    Atomic,
> +};
> +use core::{cell::UnsafeCell, mem::MaybeUninit, ptr::drop_in_place};
> +
> +/// A container that can be populated at most once. Thread safe.
> +///
> +/// Once the a [`SetOnce`] is populated, it remains populated by the sam=
e object for the
> +/// lifetime `Self`.
> +///
> +/// # Invariants
> +///
> +/// - `init` may only increase in value.
> +/// - `init` may only assume values in the range `0..=3D2`.
> +/// - `init =3D=3D 0` if and only if the container is empty.
> +/// - `init =3D=3D 1` if and only if being initialized.
> +/// - `init =3D=3D 2` if and only if the container is populated and vali=
d for shared access.

I think I have a better idea for the last three invariants:

- `init =3D=3D 0` if and only if `value` is uninitialized.
- `init =3D=3D 1` if and only if there is exactly one thread with exclusive
  access to `self.value`.
- `init =3D=3D 2` if and only if `value` is initialized and valid for share=
d
  access.

> +///
> +/// # Example
> +///
> +/// ```
> +/// # use kernel::sync::SetOnce;
> +/// let value =3D SetOnce::new();
> +/// assert_eq!(None, value.as_ref());
> +///
> +/// let status =3D value.populate(42u8);
> +/// assert_eq!(true, status);
> +/// assert_eq!(Some(&42u8), value.as_ref());
> +/// assert_eq!(Some(42u8), value.copy());
> +///
> +/// let status =3D value.populate(101u8);
> +/// assert_eq!(false, status);
> +/// assert_eq!(Some(&42u8), value.as_ref());
> +/// assert_eq!(Some(42u8), value.copy());
> +/// ```
> +pub struct SetOnce<T> {
> +    init: Atomic<u32>,
> +    value: UnsafeCell<MaybeUninit<T>>,
> +}
> +
> +impl<T> Default for SetOnce<T> {
> +    fn default() -> Self {
> +        Self::new()
> +    }
> +}
> +
> +impl<T> SetOnce<T> {
> +    /// Create a new [`SetOnce`].
> +    ///
> +    /// The returned instance will be empty.
> +    pub const fn new() -> Self {
> +        // INVARIANT: The container is empty and we initialize `init` to=
 `0`.
> +        Self {
> +            value: UnsafeCell::new(MaybeUninit::uninit()),
> +            init: Atomic::new(0),
> +        }
> +    }
> +
> +    /// Get a reference to the contained object.
> +    ///
> +    /// Returns [`None`] if this [`SetOnce`] is empty.
> +    pub fn as_ref(&self) -> Option<&T> {
> +        if self.init.load(Acquire) =3D=3D 2 {
> +            // SAFETY: By the type invariants of `Self`, `self.init =3D=
=3D 2` means that `self.value`
> +            // contains a valid value.

s/contains a valid value/is initialized and valid for shared access/

> +            Some(unsafe { &*self.value.get().cast() })
> +        } else {
> +            None
> +        }
> +    }
> +
> +    /// Populate the [`SetOnce`].
> +    ///
> +    /// Returns `true` if the [`SetOnce`] was successfully populated.
> +    pub fn populate(&self, value: T) -> bool {
> +        // INVARIANT: If the swap succeeds:
> +        //  - We increase `init`.
> +        //  - We write the valid value `1` to `init`.
> +        //  - Only one thread can succeed in this write, so we have excl=
usive access after the
> +        //    write.
> +        if let Ok(0) =3D self.init.cmpxchg(0, 1, Relaxed) {
> +            // SAFETY: By the type invariants of `Self`, the fact that w=
e succeeded in writing `1`
> +            // to `self.init` means we obtained exclusive access to the =
contained object.

s/to the contained object/to `self.value`/

> +            unsafe { core::ptr::write(self.value.get().cast(), value) };
> +            // INVARIANT:
> +            //  - We increase `init`.
> +            //  - We write the valid value `2` to `init`.
> +            //  - We release our exclusive access to the contained objec=
t and the object is now
> +            //    valid for shared access.
> +            self.init.store(2, Release);
> +            true
> +        } else {
> +            false
> +        }
> +    }
> +
> +    /// Get a copy of the contained object.
> +    ///
> +    /// Returns [`None`] if the [`SetOnce`] is empty.
> +    pub fn copy(&self) -> Option<T>
> +    where
> +        T: Copy,
> +    {
> +        self.as_ref().copied()
> +    }
> +}
> +
> +impl<T> Drop for SetOnce<T> {
> +    fn drop(&mut self) {
> +        if *self.init.get_mut() =3D=3D 2 {
> +            // SAFETY: By the type invariants of `Self`, `self.init =3D=
=3D 2` means that `self.value`
> +            // contains a valid value. We have exclusive access, as we h=
old a `mut` reference to
> +            // `self`.
> +            unsafe { drop_in_place(self.value.get()) };

This is sadly doing the wrong thing now since you changed the type of
`value`: `self.value.get()` is of type `MaybeUninit<T>` and dropping
that has (obviously) no effect. So we probably need to do

    let value =3D unsafe { &mut *self.value.get() };
    unsafe { value.assume_init_drop() };

I almost overlooked this :)

---
Cheers,
Benno

> +        }
> +    }
> +}


