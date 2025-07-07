Return-Path: <linux-kbuild+bounces-7899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2338BAFB496
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB1997A9E7B
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 13:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4A229DB68;
	Mon,  7 Jul 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kov3HeIU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEED7E9;
	Mon,  7 Jul 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895122; cv=none; b=a0oABNSY7/a1ejXLIpLVp+aZnMAvO/0Bc1vkCkkUJlbqv0gWOnsejoL4Gt+LzArstBAEj5ktb7M54uqqoZDVFFfILeWUsClGsM2y4n29UY5W2ACHDixrphRY7o1bbIQJnTm1JskTkLNwidHGFgqW+PauokpwpRvZ/cPjO8ipgHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895122; c=relaxed/simple;
	bh=Oicv1zaY1KiQez2F3xOz3tFMueOgAoKspr8/HpnHCEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbvhvv2Hm9Sb2ZKq4uSyMRrvEYdpalHnLZTHZzMaBAcEEdwChBvxJvKpEQd9rI+U0zfamIF928jkqUJWWgFnJ/TKvSx1/b1Km5gHy+xsXHGWJ0ws9Fs3k98XtTtET3BOZuxRMAS44oHPlyB2Wgu1K4ga1C/8xdfVID7dS+0jSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kov3HeIU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3F1C4CEE3;
	Mon,  7 Jul 2025 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895122;
	bh=Oicv1zaY1KiQez2F3xOz3tFMueOgAoKspr8/HpnHCEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kov3HeIU+C5qVhA5SoWYLZtbzPdRqIerqiv3o3W5ToAArz9Gf9nAfk9UPmaBKxIOo
	 A5ZF0076DY1WI4EEMZ47vwtJyah9ajNYpjrjLJ5mfaISvm4BUiQZmEypO00fKHnMTc
	 WQg2M0oqieZ8Y3SQmslQGJhOm/oj4V+JRx9Z+Fz6wTmeE8zA/ru6OV4tvV3ALSMhij
	 TW8jh7oDkgpbTfnG5tnRlR0g1Jh/6n1O1E3OjBNAeDTCH7XOUaV7NQLJ+KfpRui1bq
	 BWj1sv750Q8j7V/6xcXqHv4QcoNWMNjMgkTUMnFpe+6Duxaf3HIfpcU6akYZ76Ru7m
	 20hTdmRwwCUPQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 07 Jul 2025 15:29:05 +0200
Subject: [PATCH v15 1/7] rust: sync: add `SetOnce`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5358; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Oicv1zaY1KiQez2F3xOz3tFMueOgAoKspr8/HpnHCEA=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoa8uzVqlbyRCs/KcL2GwyQ1fhSJroQImbn+yOh
 bTlmrNMEr6JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGvLswAKCRDhuBo+eShj
 d8VWEACAJ3x26Gk1uTQPE6NLKy/wpIIq/9IZTv7FfACSd7BC+XgDo3TWxNN30cZiHT8/cF4jRy8
 MT2uOStfC4IiVLVsi/+GUH6WX5TJFVNX5wSrfdqUYz4PXlEkAuGacg9cKiyB2pPcz2+QkviZCmP
 gHQuQd8MT2DEbkIwts8cbv2uIHnZ0M/V8Mm/mIIJm3t3WChuzu2VmXb1oKrmgNKq0IWJkcFhvVN
 TVwDSpKn7qfynze2Q9pyioouezP4yNVF5TRCns+JIbN7PBBGtmN+1ciEHaxEPPgMqAEhj2WXRB3
 6h0gQX/BbjTKsbFA9DFTCaDJCMaOSU+5fi2v7JiZJnoTESuWCc7InNL9yhLKUz37TYbT79J39xz
 V1p9o0ynjqueScbyc0SW8QUEdBHGnrZwEyez5CFLkFyq68evco1Iq3IjjO6+bXrt7rjryA39JMR
 flmky1escAmIUDh5O9OcUXZ/4F5NEYhjnTYXgJUZ9CP9UT0ye1tM5saihue5WYZ1CU1JRFtOi7W
 G8QGaWn1rjvSGUPmRdUM5Q8worY5+6x6TX6NS3JAhpLRevDcvo4zPnOX8Zgn3qoSFqthqIVzY88
 w/PVqafIqUTzLa+SBGUJdQIAi6ksfVAkbJ19AqYV+rrLjuo6PdBRUKJcVkjrnCChaCPvB099xMx
 4stsum3WPEMSRNg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Introduce the `SetOnce` type, a container that can only be written once.
The container uses an internal atomic to synchronize writes to the internal
value.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync.rs          |   2 +
 rust/kernel/sync/set_once.rs | 125 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 81e3a806e57e2..13e6bc7fa87ac 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -18,6 +18,7 @@
 mod locked_by;
 pub mod poll;
 pub mod rcu;
+mod set_once;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use completion::Completion;
@@ -26,6 +27,7 @@
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
 pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
 pub use locked_by::LockedBy;
+pub use set_once::SetOnce;
 
 /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
 #[repr(transparent)]
diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
new file mode 100644
index 0000000000000..e1e31f5faed09
--- /dev/null
+++ b/rust/kernel/sync/set_once.rs
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A container that can be initialized at most once.
+
+use super::atomic::ordering::Acquire;
+use super::atomic::ordering::Relaxed;
+use super::atomic::ordering::Release;
+use super::atomic::Atomic;
+use core::ptr::drop_in_place;
+use kernel::types::Opaque;
+
+/// A container that can be populated at most once. Thread safe.
+///
+/// Once the a [`SetOnce`] is populated, it remains populated by the same object for the
+/// lifetime `Self`.
+///
+/// # Invariants
+///
+/// - `init` may only increase in value.
+/// - `init` may only assume values in the range `0..=2`.
+/// - `init == 0` if and only if the container is empty.
+/// - `init == 1` if and only if being initialized.
+/// - `init == 2` if and only if the container is populated and valid for shared access.
+///
+/// # Example
+///
+/// ```
+/// # use kernel::sync::SetOnce;
+/// let value = SetOnce::new();
+/// assert_eq!(None, value.as_ref());
+///
+/// let status = value.populate(42u8);
+/// assert_eq!(true, status);
+/// assert_eq!(Some(&42u8), value.as_ref());
+/// assert_eq!(Some(42u8), value.copy());
+///
+/// let status = value.populate(101u8);
+/// assert_eq!(false, status);
+/// assert_eq!(Some(&42u8), value.as_ref());
+/// assert_eq!(Some(42u8), value.copy());
+/// ```
+pub struct SetOnce<T> {
+    init: Atomic<u32>,
+    value: Opaque<T>,
+}
+
+impl<T> Default for SetOnce<T> {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+// TODO: change names
+
+impl<T> SetOnce<T> {
+    /// Create a new [`SetOnce`].
+    ///
+    /// The returned instance will be empty.
+    pub const fn new() -> Self {
+        // INVARIANT: The container is empty and we initialize `init` to `0`.
+        Self {
+            value: Opaque::uninit(),
+            init: Atomic::new(0),
+        }
+    }
+
+    /// Get a reference to the contained object.
+    ///
+    /// Returns [`None`] if this [`SetOnce`] is empty.
+    pub fn as_ref(&self) -> Option<&T> {
+        if self.init.load(Acquire) == 2 {
+            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
+            // contains a valid value.
+            Some(unsafe { &*self.value.get() })
+        } else {
+            None
+        }
+    }
+
+    /// Populate the [`SetOnce`].
+    ///
+    /// Returns `true` if the [`SetOnce`] was successfully populated.
+    pub fn populate(&self, value: T) -> bool {
+        // INVARIANT: If the swap succeeds:
+        //  - We increase `init`.
+        //  - We write the valid value `1` to `init`.
+        //  - Only one thread can succeed in this write, so we have exclusive access after the
+        //    write.
+        if let Ok(0) = self.init.cmpxchg(0, 1, Relaxed) {
+            // SAFETY: By the type invariants of `Self`, the fact that we succeeded in writing `1`
+            // to `self.init` means we obtained exclusive access to the contained object.
+            unsafe { core::ptr::write(self.value.get(), value) };
+            // INVARIANT:
+            //  - We increase `init`.
+            //  - We write the valid value `2` to `init`.
+            //  - We release our exclusive access to the contained object and the object is now
+            //    valid for shared access.
+            self.init.store(2, Release);
+            true
+        } else {
+            false
+        }
+    }
+
+    /// Get a copy of the contained object.
+    ///
+    /// Returns [`None`] if the [`SetOnce`] is empty.
+    pub fn copy(&self) -> Option<T>
+    where
+        T: Copy,
+    {
+        self.as_ref().copied()
+    }
+}
+
+impl<T> Drop for SetOnce<T> {
+    fn drop(&mut self) {
+        if self.init.load(Acquire) == 2 {
+            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
+            // contains a valid value. We have exclusive access, as we hold a `mut` reference to
+            // `self`.
+            unsafe { drop_in_place(self.value.get()) };
+        }
+    }
+}

-- 
2.47.2



