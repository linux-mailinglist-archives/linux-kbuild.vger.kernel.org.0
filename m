Return-Path: <linux-kbuild+bounces-7905-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE11AFB4B9
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 15:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AFFC175C54
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 13:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B3A194C96;
	Mon,  7 Jul 2025 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjqnIHLf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492C4194124;
	Mon,  7 Jul 2025 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895336; cv=none; b=NHdIEWR1VMNTg/U6xPPkicbjJqffj1ID54H+g1IqTOPT4fKV5+TTw6nyx9rP5DqA424kdFsCXkNawvPovlTv3nauA5et2kSv1nprYtxqDdufKOvymh/26ZKoBtVwVZXmUk/rVGYlnQgtQRQDRHINHvzB3YKMpj6M+CCj29yhyS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895336; c=relaxed/simple;
	bh=D92G0xCOQXWhfbZv1YtPKsB7cSPH0M+0cxUpw0TZ+vw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E/0pq+H+1a2xRkhSx+2SrZxQccC78eClUkkjcz/VAVgwKJWSxZa6Bp5flh0DnfUlOHyHQi5bakP/b7XyNfDEJyEgHg5NSY/fCVDuSqWLU4KClMaoopuEg/JE1PZpyZN/9peT0e/Rk+juGIT7e8ZHsAR2Qp9TN4irIAPujO/HhRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjqnIHLf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F34C4CEE3;
	Mon,  7 Jul 2025 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895335;
	bh=D92G0xCOQXWhfbZv1YtPKsB7cSPH0M+0cxUpw0TZ+vw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tjqnIHLfO2zMRNVEqE6UzccDAzmhXKnynBa0P0cDpTRiyvXE2Cvt1Trgkmj3gVXed
	 4FJs1Gioht57QKHJKXoP47WzPAhvG3pkmvv3Aptvi4B616HwUAT2Tg8eWZgZvv4GZd
	 Ph94s/Rx87gR3SBl9ct0Dep9ipYKrEtvNXV//Q0BYPPzqPBRVSAbXVcdTqRiA9qsbp
	 /CkwZni+RkpioI3pNUPbeI4281ipK5xH5SUZUwo0fyFgtt29HCs/i7c5bFqWbZWsEg
	 F/qWwhbUFzJyU0Tb6CfUEL8H87rZaT5ienE9P+rbuPV1k5iWYu333+ufgIMP39KSbI
	 Xuk6gK6P9EHtQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Alice Ryhl <aliceryhl@google.com>,  Masahiro Yamada
 <masahiroy@kernel.org>,  Nathan Chancellor <nathan@kernel.org>,  Luis
 Chamberlain <mcgrof@kernel.org>,  Danilo Krummrich <dakr@kernel.org>,
  Benno Lossin <lossin@kernel.org>,  Nicolas Schier
 <nicolas.schier@linux.dev>,  Trevor Gross <tmgross@umich.edu>,  Adam
 Bratschi-Kaye <ark.email@gmail.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kbuild@vger.kernel.org,  Petr Pavlu
 <petr.pavlu@suse.com>,  Sami Tolvanen <samitolvanen@google.com>,  Daniel
 Gomez <da.gomez@samsung.com>,  Simona Vetter <simona.vetter@ffwll.ch>,
  Greg KH <gregkh@linuxfoundation.org>,  Fiona Behrens <me@kloenk.dev>,
  Daniel Almeida <daniel.almeida@collabora.com>,
  linux-modules@vger.kernel.org
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
In-Reply-To: <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
	(Andreas Hindborg's message of "Mon, 07 Jul 2025 15:29:05 +0200")
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
	<20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 07 Jul 2025 15:35:25 +0200
Message-ID: <87tt3op1ia.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Introduce the `SetOnce` type, a container that can only be written once.
> The container uses an internal atomic to synchronize writes to the internal
> value.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/sync.rs          |   2 +
>  rust/kernel/sync/set_once.rs | 125 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 127 insertions(+)
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
>  
>  pub use arc::{Arc, ArcBorrow, UniqueArc};
>  pub use completion::Completion;
> @@ -26,6 +27,7 @@
>  pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
>  pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
>  pub use locked_by::LockedBy;
> +pub use set_once::SetOnce;
>  
>  /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
>  #[repr(transparent)]
> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> new file mode 100644
> index 0000000000000..e1e31f5faed09
> --- /dev/null
> +++ b/rust/kernel/sync/set_once.rs
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A container that can be initialized at most once.
> +
> +use super::atomic::ordering::Acquire;
> +use super::atomic::ordering::Relaxed;
> +use super::atomic::ordering::Release;
> +use super::atomic::Atomic;
> +use core::ptr::drop_in_place;
> +use kernel::types::Opaque;
> +
> +/// A container that can be populated at most once. Thread safe.
> +///
> +/// Once the a [`SetOnce`] is populated, it remains populated by the same object for the
> +/// lifetime `Self`.
> +///
> +/// # Invariants
> +///
> +/// - `init` may only increase in value.
> +/// - `init` may only assume values in the range `0..=2`.
> +/// - `init == 0` if and only if the container is empty.
> +/// - `init == 1` if and only if being initialized.
> +/// - `init == 2` if and only if the container is populated and valid for shared access.
> +///
> +/// # Example
> +///
> +/// ```
> +/// # use kernel::sync::SetOnce;
> +/// let value = SetOnce::new();
> +/// assert_eq!(None, value.as_ref());
> +///
> +/// let status = value.populate(42u8);
> +/// assert_eq!(true, status);
> +/// assert_eq!(Some(&42u8), value.as_ref());
> +/// assert_eq!(Some(42u8), value.copy());
> +///
> +/// let status = value.populate(101u8);
> +/// assert_eq!(false, status);
> +/// assert_eq!(Some(&42u8), value.as_ref());
> +/// assert_eq!(Some(42u8), value.copy());
> +/// ```
> +pub struct SetOnce<T> {
> +    init: Atomic<u32>,
> +    value: Opaque<T>,
> +}
> +
> +impl<T> Default for SetOnce<T> {
> +    fn default() -> Self {
> +        Self::new()
> +    }
> +}
> +
> +// TODO: change names

I just saw that this line decided to stick around, that was obviously
not intentional. Just disregard this line.


Best regards,
Andreas Hindborg



