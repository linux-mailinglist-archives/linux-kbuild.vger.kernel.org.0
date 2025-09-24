Return-Path: <linux-kbuild+bounces-8948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA59CB99E44
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 14:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C7711B21826
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 12:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29893306B3C;
	Wed, 24 Sep 2025 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5HAFyIM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6692306B24;
	Wed, 24 Sep 2025 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717648; cv=none; b=JfPwPs2f+DXFgGJLIl/N6/7Ogcsvci6lnyMJphTO6f4Y7Sr0yI88Pf9kXKO2Hpgs9AmkxLG1WtK/RAc6trTZrGH8QaehJQQE/KvQMB0cU9Tu8axflaK/qUW32rejt169jdit2PH+wGegYUPdybc9vucm2Y11seudEZTt9VfYhps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717648; c=relaxed/simple;
	bh=FC9GwCkiEibqEuCwLlQ1Q5VQbSyjrJul1CXFpg5by3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7TTrp9Q8PyPzFfvBq16TjE+rCOHeOSiGAMoQjsMXEmuO7xbUurognkIwYO7tC5gg87oFDXtuzqHEtEZk9x/cGkKEO+C3wT6pgHjza4rTjmQA4kE18aj5bsxDvWF6MGF+PCVNLcSAw9yYd8WRvuh16OXZZKecXmppGPmTjvXLGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5HAFyIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B15EC4CEF0;
	Wed, 24 Sep 2025 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758717647;
	bh=FC9GwCkiEibqEuCwLlQ1Q5VQbSyjrJul1CXFpg5by3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L5HAFyIMnrJKI0YA3DWNYV3z9TDtIQWvHydSg6yvATTb72C4OzW4OoNMs5xY7UMMB
	 H5JHERRPXKi4wkzi4OmpnnFiYgGGVL/wq9xiAj5OD1zlHmhC8UsBclCKtfqUDen7yr
	 AM1XbRK0g8LaHUzTESLrXsjl9po+VxrMIyxXMLzgSESJeCqMzqHJ+YzilG1o5waRZw
	 2FEuF12Xd5k0BAaBGqn5KlPHSuanwtrYYdSHcZXFJeQKgrbwBNEdYxYJE0UwexPJb4
	 QkJJWtZPFQgcFgujuAOOWdVEZzko72d9BoJK/dbUJuAwU7E7xpGnf5zPyqYeY9j3bJ
	 5Y8stisbb35qQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 24 Sep 2025 14:39:24 +0200
Subject: [PATCH v18 1/7] rust: sync: add `SetOnce`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-module-params-v3-v18-1-bf512c35d910@kernel.org>
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
In-Reply-To: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Daniel Gomez <da.gomez@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5476; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=FC9GwCkiEibqEuCwLlQ1Q5VQbSyjrJul1CXFpg5by3k=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBo0+ag9/focWPE9Rg4DKUGQq73skp7akVHcvblT
 3OdqR7vPICJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaNPmoAAKCRDhuBo+eShj
 dw9yD/wKMqUnk7VbroVYaods1snwU8Ypzm3zaennrSDK7pIpvEpahMwr3wh97oK0vbUhtmW5RAl
 nRvd1LMyF3QkR6QBuI/w/Lv/eVVGHbjQ3lz8OZ7vr4JJpUp5dvqdpwynk5IDNr5akTfsD3DjzBH
 jsvx5kmitro7Qxa0fLSYiWbFybmW24vwkirJAWEYl/6euVxmq3uIpJRL3HdtWu3WDFETzshSgid
 way1279njlazVdTE5SSKAiH7XaU/YC+P4brNbWoWeObMw+3krrJRIn5zV/vqH/COGKFWecsbPEb
 2u9zuUt+kRc4MyBAIwQZOdQDyF6+qF4AElQxweMkq9nF0plhbsVgvhd1BdTudboLq4ZRKC6II5z
 YQvzxOJPNZvhR5QHjNvbEc0W7cFysxY1E3kNP+CJikP5/hYUkMDrd7NLDMLodyH2Ef0s5vyPpLZ
 QBvyRv5xAUbi7ixiHQCfyolGJQsedLgdNYD2nNUVApIm516lVuz0v6UgVIH+wsIOhkgiFztkz/C
 8FtpJV/2e4ZxaF+UxSDNjSfx4k3xtTryyTGZOpLN6KaofjK9o1i6MyYyxjqi/TmypmUSw8S7Lv8
 o99+uJ/Az//suf+g9EJFJaj3jpFK0xDKWMh6KUSFGcgY2IGwYfAZqF2/CsKPlCP1kBHXH6eMqoq
 lUM8IG5WPYBUYeA==
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
index cf5b638a097d9..3f957ad3a9f0a 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -20,6 +20,7 @@
 pub mod poll;
 pub mod rcu;
 mod refcount;
+mod set_once;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use completion::Completion;
@@ -29,6 +30,7 @@
 pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
 pub use locked_by::LockedBy;
 pub use refcount::Refcount;
+pub use set_once::SetOnce;
 
 /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
 #[repr(transparent)]
diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
new file mode 100644
index 0000000000000..bdba601807d8b
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



