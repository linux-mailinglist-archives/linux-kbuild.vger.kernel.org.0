Return-Path: <linux-kbuild+bounces-7842-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF02AF5A47
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD2F07AFB46
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CBF28469A;
	Wed,  2 Jul 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ju7IdGKH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9E27A10A;
	Wed,  2 Jul 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464469; cv=none; b=QWRAUC7OVEU8+eCJAhSvNZTygxMWvgNsgFtcVJi7hCxCPKmcKgE9k+9KPrZjk7pCzT3bvohOkUxtE3I5qFloLjmwBQSBNLVU5oguRbL04XzrJFywecVS6NdCsn2eqG3FpDtOB+P83l4pheNL2OhgM5e/x5m5tI9xzjzpfdr5W0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464469; c=relaxed/simple;
	bh=kBgzh2+fqwzDciyqJNrK1fk8cDdbFE2K5Dy495Oc5g4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YDmmZdjtxa8Y3L50X5GsnM6B7cYQvg51vSRQqSWcV1ilRE6E2gibssGJFBh/LKD5BEzVIy/5j2ukbBG8seLgxzY3TfE1EYquSEYgyjmgrB3BsysTOgrRvsuQELmFLGYiYbYNqYPA5lu963bLb3KNnYbealuW+blaw4zvbMYYxks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ju7IdGKH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5A4C4CEF3;
	Wed,  2 Jul 2025 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751464468;
	bh=kBgzh2+fqwzDciyqJNrK1fk8cDdbFE2K5Dy495Oc5g4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ju7IdGKH1LQ5POT+7RjJKtenTKMGXPv09aLY+GX+gO0vkcEvbzP+HDtiPhIcV6blv
	 VvVdajUBDVFfC3XFchODN4Fj0D4hPcsICasmMZKt4iQ+a9G9Jr1O0faG2OGJzGEUi1
	 GL+SeaR1JeNio8puuOxI+3XuTF/wyawGutRnuYcaxVE+Fs+L6pVl4KoMqNuSD8lEFV
	 IDdH5zrrK7Zgb1mUen3P8WWEdCAwVeAYcOlLQVgeEDIJSjkbgMMLy3FgG1SviQzUX5
	 XDjijTgVOh32JCnyNOalSQQuGDtrCCyuq8FbGS3vENA6YZaZ09AQGyakjKKs67CREr
	 3Ll1n0cACUz6w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Luis Chamberlain" <mcgrof@kernel.org>,  "Danilo
 Krummrich" <dakr@kernel.org>,  "Benno Lossin" <lossin@kernel.org>,
  "Nicolas Schier" <nicolas.schier@linux.dev>,  "Trevor Gross"
 <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
In-Reply-To: <CAH5fLghw5TDrzmFZB=tORR5Lxx4WoG4wer6y5NuFdod2_tb6zg@mail.gmail.com>
 (Alice
	Ryhl's message of "Wed, 02 Jul 2025 15:32:05 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
	<QU7IDrQqnXyNZDFF_jgZ4qTsRLPmUeeWedU_T1i11uOyc1E83Zo4tETj_oPxSfJySNZZ4-XEVBlkZJ-MZech4g==@protonmail.internalid>
	<CAH5fLghw5TDrzmFZB=tORR5Lxx4WoG4wer6y5NuFdod2_tb6zg@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 15:54:11 +0200
Message-ID: <87ms9mvgu4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Wed, Jul 2, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Introduce the `OnceLock` type, a container that can only be written once.
>> The container uses an internal atomic to synchronize writes to the inter=
nal
>> value.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> This type provides no way to wait for initialization to finish if it's
> ongoing. Do you not need that?

I don't, and in my use case it would cause a deadlock to wait. Anyway,
it might be useful to others. Would you add it now, or wait for a user?

>
>> ---
>>  rust/kernel/sync.rs           |   1 +
>>  rust/kernel/sync/once_lock.rs | 104 +++++++++++++++++++++++++++++++++++=
+++++++
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
> I would add a re-export so that users can import this as kernel::sync::On=
ceLock.

OK.

>
>>  pub mod poll;
>>  pub mod rcu;
>>
>> diff --git a/rust/kernel/sync/once_lock.rs b/rust/kernel/sync/once_lock.=
rs
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
>> +/// Once the a [`OnceLock`] is populated, it remains populated by the s=
ame object for the
>> +/// lifetime `Self`.
>> +///
>> +/// # Invariants
>> +///
>> +/// `init` tracks the state of the container:
>> +///
>> +/// - If the container is empty, `init` is `0`.
>> +/// - If the container is mutably accessed, `init` is `1`.
>
> I would phrase this as "being initialized" instead of "mutably
> accessed". I initially thought this was talking about someone calling
> a &mut self method.

Makes sense, I will change that.

>
>> +/// - If the container is populated and ready for shared access, `init`=
 is `2`.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// # use kernel::sync::once_lock::OnceLock;
>> +/// let value =3D OnceLock::new();
>> +/// assert_eq!(None, value.as_ref());
>> +///
>> +/// let status =3D value.populate(42u8);
>> +/// assert_eq!(true, status);
>> +/// assert_eq!(Some(&42u8), value.as_ref());
>> +/// assert_eq!(Some(42u8), value.copy());
>> +///
>> +/// let status =3D value.populate(101u8);
>> +/// assert_eq!(false, status);
>> +/// assert_eq!(Some(&42u8), value.as_ref());
>> +/// assert_eq!(Some(42u8), value.copy());
>> +/// ```
>> +pub struct OnceLock<T> {
>> +    init: Atomic<u32>,
>> +    value: Opaque<T>,
>
> Opaque does not destroy the inner value. You are missing a destructor.

Oops.

>
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
>> +        if self.init.load(Acquire) =3D=3D 2 {
>> +            // SAFETY: As determined by the load above, the object is r=
eady for shared access.
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
>> +        // INVARIANT: We obtain exclusive access to the contained alloc=
ation and write 1 to
>> +        // `init`.
>> +        if let Ok(0) =3D self.init.cmpxchg(0, 1, Acquire) {
>
> This acquire can be Relaxed. All other accesses to self.value
> synchronize with the release store below, so you do not need acquire
> here to obtain exclusive access.

Right, thanks.


Best regards,
Andreas Hindborg




