Return-Path: <linux-kbuild+bounces-7841-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B0AF596B
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C4F18920DF
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B61277CAE;
	Wed,  2 Jul 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tsgDG4ar"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4927A46E
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Jul 2025 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463143; cv=none; b=l6UoPe3vJHgcEaArh6mhzfZteFSPe2HjsxaW74AWlW3WgHFYFKyZ8MCN/qw0wnN3BhBqQ2hQx2+tqkA0idN1cGttDYWhBORriJZy+xKfTETzlKpAiBVtiCbo7xpWcAJ0bS08mmWyKBIO4r/vJTGcPoDjCM4VM0AMTD1rkP5Kvf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463143; c=relaxed/simple;
	bh=z7Gd2ZV19XvvqLtgd16QId8F4kQS/oThQ6mvOseMOeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxjv5aQOtpPWgW1H9xv3tsTjhI8FZMoQIaHFI/VhMuHXuqCZpiKFX82tnXBG6aZdabJSbMCJQyaQ43Q9PJv4ODt2n1IY5Yp9KWOxBcobuQkNRnBz54i+Ml9807/rMiT2ZrBUFfEctc+UJXCHRLGzar2UVBZEettqxQY+IjUwunY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tsgDG4ar; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3889639a12.3
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Jul 2025 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751463140; x=1752067940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLb/hiHcDswU0D4uNpcn2drPp3SCOUyv9DR9ui8PXlc=;
        b=tsgDG4arB5k0MWH3m6IqSA4JrJ1cE46VRb7JreDK4X/naTp6liVD07yMDgbAi9z+qo
         +9JBqnVawGjIc0Vcx6D0HNxn+uaJmRt4tpyk/gENgCZAkTuyolgL9na3PCiZHqndE+98
         NfJie5wja6L3wRPI0vrOgFCQAswDXyey8Ps1V616s70s9XOkFCMj5uI1wxnXCrO4NL7T
         HBI5Z1tZA+cYUBJKb4dNp8v/OxUx8UfPtcXvUUc7SA1q0p1Ywg9+PX2GEADWNpe//x3r
         DFqsKzCbsLWmCJjG54jhf6f6SD7BlIAvM5BzkND8XepL6/zFGWTn567/tA8TvsIyZiRM
         +/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463140; x=1752067940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLb/hiHcDswU0D4uNpcn2drPp3SCOUyv9DR9ui8PXlc=;
        b=X5SGpTWGoMiV1Z4VDpBVAWMHopb/ifyHpK2WddawukoZ/1voSRajlmMCMMmaLCOdAt
         eYuTfPa/SgNqeXKeVoAbxboAJY72O15tU6VzluKD5rcV4GE96uuljhhlf/Q8FEKFVmQn
         nxzFryPaugJA4Z2YE+uYVxR01pksVrZreNDpzvUHe798tSSHCw7mlXDx+AH0IjbI4mOP
         7qzT/YMsbY7dL/f41AsSGdhyA4WAHMzTrjUqAoDxBJ2TWOUOrg6erzAtZSGpSJ+cdohF
         ny+9m4GjqSmkl9vIYQ0WmUvTchxhrfCaU5mD36bZZtK4UfiYYBlGGWBXkUPldcYm87B4
         c7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2MxT+7b4iN6dRDUx2noYUfwWCBU046f8d9JEsqnNEVkIZGkBw797iYINGKG+7/V+aOpdTVWdH8mIwnh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFpFDA3Rbxm/VZUkWZ7VOrIu6gDWA3BJ/vgSi/O1VqtGcf/RmC
	t+t0IQ5j9eC+0lS0U7FUfVuPx3TdiHJ94D11YdqNTJmdVAjpOUKV30rfscvnQWdRMTs7yhvdH3y
	vNXWZR9EXDLMDT1Zc4yngOuxj0mLfd7WtCngzWia8
X-Gm-Gg: ASbGncumuyFlEVF9JYsGkWlj/ic0F63N5z5Q5o2IqITUl/dxjH+D1MelW1tHGFGl45d
	g3e1utz1NWiYAxtddEKKiHpeFFTyEzGvscOyxc1RUvTJhcHK7+pF/RElz0g4QaqBtKkRa+T1iEJ
	961oco6ar/EK9guoIDxWwtser2mhFc5U/ydFsdMs+s+1LHpeGCMfus2OcrV+bVc2YmMoJlUQ63f
	1iPdbbvEQ==
X-Google-Smtp-Source: AGHT+IGl/TSKdQK7b9WQhHkHUkAL99tfbfmIwoIuqDS1wkyiy3yWj1kqtAXrBjAXrNOeDXSrDfXhNvdyiTqbiD64MZ4=
X-Received: by 2002:a17:90b:5788:b0:312:e91c:e340 with SMTP id
 98e67ed59e1d1-31a90c2f8f3mr4423923a91.35.1751463139949; Wed, 02 Jul 2025
 06:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org> <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 15:32:05 +0200
X-Gm-Features: Ac12FXyWI8bK1guggG5Rvhs0301hdIxUpCmaYFQClmsVD87QxHCiS9wDlqMCJQk
Message-ID: <CAH5fLghw5TDrzmFZB=tORR5Lxx4WoG4wer6y5NuFdod2_tb6zg@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Introduce the `OnceLock` type, a container that can only be written once.
> The container uses an internal atomic to synchronize writes to the intern=
al
> value.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

This type provides no way to wait for initialization to finish if it's
ongoing. Do you not need that?

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

I would add a re-export so that users can import this as kernel::sync::Once=
Lock.

>  pub mod poll;
>  pub mod rcu;
>
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

I would phrase this as "being initialized" instead of "mutably
accessed". I initially thought this was talking about someone calling
a &mut self method.

> +/// - If the container is populated and ready for shared access, `init` =
is `2`.
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

Opaque does not destroy the inner value. You are missing a destructor.

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

This acquire can be Relaxed. All other accesses to self.value
synchronize with the release store below, so you do not need acquire
here to obtain exclusive access.

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
> +    }
> +}
>
> --
> 2.47.2
>
>

