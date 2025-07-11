Return-Path: <linux-kbuild+bounces-7984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13156B013C0
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 08:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900F4762D40
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 06:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678B71E261F;
	Fri, 11 Jul 2025 06:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXnHay2l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A81DED57;
	Fri, 11 Jul 2025 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215828; cv=none; b=YZv4jSt7Pd7bbdKeXfabDT4iEXbQFy9VHGCQI1kKYy0DAotpENaGWoo9aSAiD86QzMNb4cZZ3T137fM7e3D8PX8Dm8k1E9A1ItNgbpe96V9ztW1C+gfF9YKthRV2F2pJswYMF2umUUuPREMSZla0RbFl0oxVpRLcAQcvjlurUt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215828; c=relaxed/simple;
	bh=3Z10rATub/nmoS28YjcVnjle0PnnDL4yejK+SVcFUi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDO4SUOUhWNFF3sqoSKQnc6LfWT7Fllr2atxNmlFTdnVW8FUu4un5giYX3MQ7lF/lnGwkdzY3oWmA3w9BcjY3kOENcQcqoWQvQGlrD6XptXUOgTyGtAA7uhR0YI2IzitX+tSdp7FtarkKYs296JUA3O48IoUaFDO/VjJmtG79kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXnHay2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590FCC4CEED;
	Fri, 11 Jul 2025 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752215827;
	bh=3Z10rATub/nmoS28YjcVnjle0PnnDL4yejK+SVcFUi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XXnHay2lhglrp6BFbGiL6tOONKf1MIsv+83sXzGzqoi29wkzJB6rkH4BPUYcYGLpx
	 Hc4Ugc91vZzUzqtBLq407TjsGspqPgVB6ZIE7MxOEX1SdM2W/V3zBydwiUFCoA1fck
	 5g7CIb7++4B1eCJZBPLgOp+52/HUNYrWdFOYjKWr7Znfne92q8FzeYURxwm5VcyxgI
	 1k81DuLKOBn0CopBkELXpM/L67QH8QFv0hHqBN3esJwHZJ56y3ApiIkx6OyDZc6pMt
	 iz9OXme8SskFjLyd46xTvIb4P6xq91tmjR+ZxA9wg0ywgJei4b8tnyxM3CqI6jU7SK
	 owQuRSiJoJPmA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 11 Jul 2025 08:35:43 +0200
Subject: [PATCH v17 1/7] rust: sync: add `SetOnce`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-module-params-v3-v17-1-cf9b10d4923d@kernel.org>
References: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
In-Reply-To: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5498; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=3Z10rATub/nmoS28YjcVnjle0PnnDL4yejK+SVcFUi4=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBocLDV4zgv5/LodT2i6qgI1uaBZn6oyx1mXbwA+
 eexWZjaD82JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaHCw1QAKCRDhuBo+eShj
 dzn4D/9VZiJ0s73aKqos/NqArgIZgETaVh1WS8emNJllgsqcED8UWYiuFd7a8+oEVJPHMcZRosO
 SEOHda0Jbn5fn/QKX7kiA4UnuafwOgKD053nYt8sa0ECXMuW6Cc+B91q87fEbZ1ghYssKn7Yp7N
 cMpMznh0uENWP1HknQOAwNBQ3Sk23Ehc0X7iHh2HWn44MT6eIYk0WEee7KQ8YDdtWdvImqwTnHA
 imEqPiaQL0Z9DoII3PcxVbSsB26WvAKMd1lpUhV/MHqrdVnoBdcdkEt99bCvkY3po6f1EJfl4QA
 OpllES0JtItydu4zAqsJNoVRB8NjrMvsvsjWx3XpjYWQlMLxuuy1Tqjk7M48DvCr1M3GV6SJp6I
 COqmIe0J4XO5XGX+gBfYlNhjt3XYf7NHSqsjM71JRRPA5MoOZ6YjPkG51v2VUM7WL+4mh5cK3NS
 KFjmnWVM/9APFaANKMbqAz434u60Psiq5WAZW5P4JuPMYrzYgwCux2a/tRaC/CHC2QywgzWeugK
 fco5Yt72b3mua25v3mVeyE8V7b9Ps9vRRMxM7cUlW0lb/ZZvCx4O5oAocDyctk/opKCzHspPlSk
 Jbk4S6xFhOZgUm891uyTLifnW+QCZUPQ1dkmEr4W8QcFWPFQOOx1eW6BYvX+kkBwA0u+6EBS+xV
 Rm/P2T3OSJ9aZEA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Introduce the `SetOnce` type, a container that can only be written once.
The container uses an internal atomic to synchronize writes to the internal
value.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync.rs          |   2 +
 rust/kernel/sync/set_once.rs | 125 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 81e3a806e57e..13e6bc7fa87a 100644
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
index 000000000000..bdba601807d8
--- /dev/null
+++ b/rust/kernel/sync/set_once.rs
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A container that can be initialized at most once.
+
+use super::atomic::{
+    ordering::{Acquire, Relaxed, Release},
+    Atomic,
+};
+use core::{cell::UnsafeCell, mem::MaybeUninit};
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
+/// - `init == 0` if and only if `value` is uninitialized.
+/// - `init == 1` if and only if there is exactly one thread with exclusive
+///   access to `self.value`.
+/// - `init == 2` if and only if `value` is initialized and valid for shared
+///   access.
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
+    value: UnsafeCell<MaybeUninit<T>>,
+}
+
+impl<T> Default for SetOnce<T> {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl<T> SetOnce<T> {
+    /// Create a new [`SetOnce`].
+    ///
+    /// The returned instance will be empty.
+    pub const fn new() -> Self {
+        // INVARIANT: The container is empty and we initialize `init` to `0`.
+        Self {
+            value: UnsafeCell::new(MaybeUninit::uninit()),
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
+            // is initialized and valid for shared access.
+            Some(unsafe { &*self.value.get().cast() })
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
+            // to `self.init` means we obtained exclusive access to `self.value`.
+            unsafe { core::ptr::write(self.value.get().cast(), value) };
+            // INVARIANT:
+            //  - We increase `init`.
+            //  - We write the valid value `2` to `init`.
+            //  - We release our exclusive access to `self.value` and it is now valid for shared
+            //    access.
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
+        if *self.init.get_mut() == 2 {
+            let value = self.value.get_mut();
+            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
+            // contains a valid value. We have exclusive access, as we hold a `mut` reference to
+            // `self`.
+            unsafe { value.assume_init_drop() };
+        }
+    }
+}

-- 
2.47.2



