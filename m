Return-Path: <linux-kbuild+bounces-7844-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D8AF5C46
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 17:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 562864A57AA
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA93A30B997;
	Wed,  2 Jul 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbTC8VmN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4473093CF;
	Wed,  2 Jul 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468839; cv=none; b=bPBvHwWjR+rknS6sSOgkuZxxTtqMYGdsvhRBVM/4WB4CaKSaOu5UfgtRY3zobiDhDVXLwnEv/qCen655Dxe3om9isJk1nMYAbSIZdQMNrT0AcjtE3/sySd16WwINaMizOXRjsvC1XAMAkNlAn6W6ihdG8R4Vebs/1jIg3Aoe4RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468839; c=relaxed/simple;
	bh=07BIaW5fAzrHSMxQBsZV6MlEtvhFBYxqbhT4d+ChSyk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Vqp4hc+b40hcahE87Th1iwLR3YrYKLe88g00iU3srt75zJ/afpbpXJ201H/MSE2Oqiz+07RXMiesYlnscH9qfjVzhlhaFqxY2L40NEvB/lCZX39rQdC11aSvozqhEKydQ/xBeCqFjLlxZu6GdrAVmDsKp2oR0kCZLMDjViJ+WJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbTC8VmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB0CC4CEF1;
	Wed,  2 Jul 2025 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468839;
	bh=07BIaW5fAzrHSMxQBsZV6MlEtvhFBYxqbhT4d+ChSyk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=EbTC8VmN5Y4QzM9FwcP0au4LQ4SwbVlbp8gFL2n41R5wiNGu/t4mr5GDOQ/eXaInI
	 oef23grCvPWGNKrSRFgG2PkVFUhKKMs6aNDlXiaQzwwu+1TuoM37C57W651maPPSMc
	 qd4yPnBrjyLC1iwB5giBnY0NahMUn5ZaTDj//quRMro3IFMRvKcStX2TLxNUgbCVMY
	 FNQX5m2sqKP7256Zau+ZcKYx6zVS3YnCkcpzK4mQFpuD41t407O7b51VPlgMb9AgC1
	 BK04efPYAgPG6qYpJM/QrI+THk6IiWTER4E7TsXZ6RD1BoI8HQNl6oWcbMJLJoMa34
	 APkGQFI5DLAtA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 17:07:12 +0200
Message-Id: <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
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
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>

On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
> Introduce the `OnceLock` type, a container that can only be written once.
> The container uses an internal atomic to synchronize writes to the intern=
al
> value.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/sync.rs           |   1 +
>  rust/kernel/sync/once_lock.rs | 104 ++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 105 insertions(+)
>
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index c7c0e552bafe..f2ee07315091 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -15,6 +15,7 @@
>  mod condvar;
>  pub mod lock;
>  mod locked_by;
> +pub mod once_lock;

As Alice already said, we should reexport the type. And then make the
module private, no need to have `kernel::sync::OnceLock` and
`kernel::sync::once_lock::OnceLock`...

Also, I agree with the name change to `SetOnce` or something similar.

>  pub mod poll;
>  pub mod rcu;
> =20
> diff --git a/rust/kernel/sync/once_lock.rs b/rust/kernel/sync/once_lock.r=
s
> new file mode 100644
> index 000000000000..cd311bea3919
> --- /dev/null
> +++ b/rust/kernel/sync/once_lock.rs
> @@ -0,0 +1,104 @@
> +//! A container that can be initialized at most once.
> +
> +use super::atomic::ordering::Acquire;
> +use super::atomic::ordering::Release;
> +use super::atomic::Atomic;
> +use kernel::types::Opaque;
> +
> +/// A container that can be populated at most once. Thread safe.
> +///
> +/// Once the a [`OnceLock`] is populated, it remains populated by the sa=
me object for the
> +/// lifetime `Self`.
> +///
> +/// # Invariants
> +///
> +/// `init` tracks the state of the container:
> +///
> +/// - If the container is empty, `init` is `0`.
> +/// - If the container is mutably accessed, `init` is `1`.

I think we should swap the order and change the ifs to iffs:

    - `init =3D=3D 0` iff the container is empty.
    - `init =3D=3D 1` iff the container is being accessed mutably.

> +/// - If the container is populated and ready for shared access, `init` =
is `2`.

You also need that `init` is only increased and never decreases.
Otherwise you could read a `2` and then access the value, but `init`
changed under your nose to `0`.

Then the INVARIANT comments below also need to be updated.

> +///
> +/// # Example
> +///
> +/// ```
> +/// # use kernel::sync::once_lock::OnceLock;
> +/// let value =3D OnceLock::new();
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
> +pub struct OnceLock<T> {
> +    init: Atomic<u32>,
> +    value: Opaque<T>,
> +}
> +
> +impl<T> Default for OnceLock<T> {
> +    fn default() -> Self {
> +        Self::new()
> +    }
> +}
> +
> +impl<T> OnceLock<T> {
> +    /// Create a new [`OnceLock`].
> +    ///
> +    /// The returned instance will be empty.
> +    pub const fn new() -> Self {
> +        // INVARIANT: The container is empty and we set `init` to `0`.
> +        Self {
> +            value: Opaque::uninit(),
> +            init: Atomic::new(0),
> +        }
> +    }
> +
> +    /// Get a reference to the contained object.
> +    ///
> +    /// Returns [`None`] if this [`OnceLock`] is empty.
> +    pub fn as_ref(&self) -> Option<&T> {
> +        if self.init.load(Acquire) =3D=3D 2 {
> +            // SAFETY: As determined by the load above, the object is re=
ady for shared access.

    // SAFETY: By the safety requirements of `Self`, `self.init =3D=3D 2` m=
eans that `self.value` contains
    // a valid value.

> +            Some(unsafe { &*self.value.get() })
> +        } else {
> +            None
> +        }
> +    }
> +
> +    /// Populate the [`OnceLock`].
> +    ///
> +    /// Returns `true` if the [`OnceLock`] was successfully populated.
> +    pub fn populate(&self, value: T) -> bool {
> +        // INVARIANT: We obtain exclusive access to the contained alloca=
tion and write 1 to
> +        // `init`.
> +        if let Ok(0) =3D self.init.cmpxchg(0, 1, Acquire) {
> +            // SAFETY: We obtained exclusive access to the contained obj=
ect.
> +            unsafe { core::ptr::write(self.value.get(), value) };
> +            // INVARIANT: We release our exclusive access and transition=
 the object to shared
> +            // access.
> +            self.init.store(2, Release);
> +            true
> +        } else {
> +            false
> +        }
> +    }
> +}
> +
> +impl<T: Copy> OnceLock<T> {
> +    /// Get a copy of the contained object.
> +    ///
> +    /// Returns [`None`] if the [`OnceLock`] is empty.
> +    pub fn copy(&self) -> Option<T> {
> +        if self.init.load(Acquire) =3D=3D 2 {
> +            // SAFETY: As determined by the load above, the object is re=
ady for shared access.
> +            Some(unsafe { *self.value.get() })
> +        } else {
> +            None
> +        }

The impl can just be:

    self.as_ref().copied()

Would it make sense for this function to take `self` instead & we make
the `OnceLock` also `Copy` if `T: Copy`? Maybe not...

> +    }
> +}

You can move this method into the block above and just add `where T:
Copy` on the method.

---
Cheers,
Benno

