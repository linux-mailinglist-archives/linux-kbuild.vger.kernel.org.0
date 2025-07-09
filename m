Return-Path: <linux-kbuild+bounces-7956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB6AFF03E
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 19:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF845C07FC
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 17:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DA5238C2D;
	Wed,  9 Jul 2025 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cqre8FAw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7E235042;
	Wed,  9 Jul 2025 17:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752083617; cv=none; b=kbBlPIcIW30on2fbx0w8S5dGJs8al0GQzAI/t4b4ldf06x3YfbpXyLXZBhwo4u3f1eepZJBsgxcF/VlBWrtAlClM8HQjmaZ6VAMYOL1QVP8prM5PjlN+017xqSpL0uCrseL03CVCBumOMKjtZ4BU0xhRojzrgC5QrZlqzvPcCco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752083617; c=relaxed/simple;
	bh=ZRLjD2W6uhaXymWrGFzTIhA8R1ZIxNIhAh+LvZBB6fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqtjjW0dXkg6hJ60rvemhd/qvLEI8AGZlU/pNzgjtS87RPrNqqEyiKh8ikdIHxBoiNplCG/DoBj+uJX97nYThqVESn2tvWPrqf6TKNUIZMVaa20mRPUgXI8VfRzwMx+hHpBanjIy+BV5eP216ei/fgicacfh+vivcP2uqrdK6TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cqre8FAw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77ABC4CEEF;
	Wed,  9 Jul 2025 17:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752083615;
	bh=ZRLjD2W6uhaXymWrGFzTIhA8R1ZIxNIhAh+LvZBB6fU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cqre8FAwHpU7XZdkZGEeKFTxM6L4ydZxBEiaBkgLAqEKZ5B7RrHCvIvyhZBgiowxN
	 C+l0NdEhBZJj0A30ccSd1Qn0s3mzOCUKXjsC2/aY4dM2zH2v3KPC1syuTAiYheBLYj
	 JGQUeM0RK5PfpUUh086VMMNruvO5YX0stGnQ+C1avZk4UDQIcd4oK2pyQsPuAIqv+A
	 moXHDS8ddeVkyFfZU48gVyNMV7sJEkOpfk+e54y90d8XnZVHDDJPOhsnvkNdUhebAm
	 NCTSTICm5h+OcLsE07dxX14ij5sca2LoguUXd7mBGsjMd8dV9PCLaQOBghp49up8rP
	 oMhy0uj6lxfBQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 09 Jul 2025 19:52:15 +0200
Subject: [PATCH v16 1/7] rust: sync: add `SetOnce`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-module-params-v3-v16-1-4f926bcccb50@kernel.org>
References: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
In-Reply-To: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5376; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ZRLjD2W6uhaXymWrGFzTIhA8R1ZIxNIhAh+LvZBB6fU=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBobqxZjoOXK9v/fIdnhE/vluSNmdrCUxFKMt/Np
 wp/G3xBQq+JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaG6sWQAKCRDhuBo+eShj
 dxdOD/92wpNNbYWglvU96Xzbrqw+7p38RhiaIT1PO9KceKNswDDcTf/Bw4/PhQ7g4lYXx45w+97
 4EuuIq+FpGJwgnDM5mUvzrmf3oV4wtQuig+dUIi5TrFTgMX0FSN/ue43xHSf5QO8gUB3L/c608x
 ySDGc67vrbduEAt9gKtMw/24Ph5sqrbJDH1oWj/xf7jHht7m3MsG8JOmYTyYi8Gu2LTkG5v18bg
 eeZbcBz3013Fi1Ma4XB3NzRoGb5itq8aY7eb8R0AUTL9AY6JiJbjblYYE86tiaJYYxzMAf1FFrQ
 DkAxma7nildRROUACTlgYnzXP2fb7Qzt0A8TNWNql0KVt9uOdy6RbDtC5+1LRImj1za10RRTAfJ
 /vKHOg0eJ6bFWJ4tEB4ZCG9YeC0Rmk7A2pjvEnerEB2kGVksKrVL3I4BloC4IGRNNE/ClPChPc0
 LKig8f+Yk9GECbCZjY+h1Ane7E/4VWEJ+EIf5vpyT2tt7z7ngUeW19PFEvaBJ1xcuOuc7AWb1EQ
 L9g2LT3MxJYJwGZci8PcaUvO9Zlfdaj/YPGxqJmz2MbFR9KbF7m9XMkP+WN6UdMDHlaLAMVLb8w
 jcbHmtFn7Hbt8GF52JdmycHELXwIfcK8UoJo9UlfI0wlpP+4+EdKr+6zo5zSDt8fosWo/LdjXB0
 T7E1dyTwzsUckgg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Introduce the `SetOnce` type, a container that can only be written once.
The container uses an internal atomic to synchronize writes to the internal
value.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync.rs          |   2 +
 rust/kernel/sync/set_once.rs | 122 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

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
index 0000000000000..73706abfe9991
--- /dev/null
+++ b/rust/kernel/sync/set_once.rs
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A container that can be initialized at most once.
+
+use super::atomic::{
+    ordering::{Acquire, Relaxed, Release},
+    Atomic,
+};
+use core::{cell::UnsafeCell, mem::MaybeUninit, ptr::drop_in_place};
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
+            // contains a valid value.
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
+            // to `self.init` means we obtained exclusive access to the contained object.
+            unsafe { core::ptr::write(self.value.get().cast(), value) };
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
+        if *self.init.get_mut() == 2 {
+            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
+            // contains a valid value. We have exclusive access, as we hold a `mut` reference to
+            // `self`.
+            unsafe { drop_in_place(self.value.get()) };
+        }
+    }
+}

-- 
2.47.2



