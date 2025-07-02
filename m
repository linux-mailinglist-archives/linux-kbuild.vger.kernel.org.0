Return-Path: <linux-kbuild+bounces-7832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B7AF5878
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89D4E4A0E5E
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F2E284694;
	Wed,  2 Jul 2025 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBmmWh8/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DDD284689;
	Wed,  2 Jul 2025 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462358; cv=none; b=GUseZo4T+HVrGtggFj+SYg2Ori+MjhGN/apEMqhdMj73+2RcAkquvKy5C2cFZYSTOPGa17DgKRFuax4m5I3OpxeXkZw4nj9KWAynlOcGODjqW86OIildCp6agsg9cv3svodhXROxk/eC3hGqg1hEXhSR6Vw0gGbFx6HWGiXXt9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462358; c=relaxed/simple;
	bh=9S3TEgnqLYbIT6Io+nOlVEeblcZ/nrr2prk36tq+oH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrvARwfVlzuIj6WDBA2tWscW42XQD1NnZ0eRJZScXWaQpCfXfM2hzE0NRAVTiH5F9CmWXttcZgjK7fxQe/IWkahe5/sriDAN/6skYPmq+w+KYM9gnJELBlF+1RUX3eOUoqUQsGkSFZKvat+LxCnACCoqUI0mqTr7SHVusnJPqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBmmWh8/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6FFC4CEED;
	Wed,  2 Jul 2025 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462358;
	bh=9S3TEgnqLYbIT6Io+nOlVEeblcZ/nrr2prk36tq+oH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DBmmWh8/GJlFKbvHf+i6gGkybyQTg3g7OJ3ys8wpGBve2Y/hNXZswhx9DQu6bGtXV
	 LYoC/1o3lwwANpTYC1EfIcAv8NRdSGAJN6tOcs+UyUuTfRnXUoNRfFX/iSvxh4Fc6b
	 3RpD0RiCMbwT2rUwPrAaUgkkPLTgJxORHhdD2qdsWi6+KpRKOfNQLsp1tW6MA13aiS
	 XkO7wYdg7ALI2V/EXNih1P3So30XIMYe3Vyb5YBn7UB9+nPDNctgbDGOYV8SByfkSR
	 CkyXnR9BZifVmKlteaOS0zsan8nBk5y5h36slo4BrIiU8N8yhc6jMQtLYZlSGgoS3I
	 ZvL/zxwMqGJAw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 02 Jul 2025 15:18:33 +0200
Subject: [PATCH v14 1/7] rust: sync: add `OnceLock`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4168; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=9S3TEgnqLYbIT6Io+nOlVEeblcZ/nrr2prk36tq+oH8=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoZTGzBIyPCDW6CbV9USY9a6bw3bRnhSdW4qSxa
 icxywq0esCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGUxswAKCRDhuBo+eShj
 d6XhEADFrV+1h2hwOY+GnAAVhukDmoaKdiIjl3+EsCzGbUGDd+KNxnvTas7TVnClCcwjBh9pB1f
 OSfGloxPrcyx2i8KoRaOuzX4CdV6kLtHW4sOM3UAt8PAc4ijjD/kbjuaSKrh5xfiC9KG6HiQa7F
 VeVNeOq/8vI6yYEyvoL4CjEe2TEDr9jQekFTJVe86s8VXrNax1vJ7VlRUu8hDxXzH602c3bHuEJ
 ModCbWl4TdYwtF6t2uKcnL1CkSAeCLCVVXUr853xP5yF4irPYcnwgZTohqpSk/CIEVIByynzSKO
 MMTln11PjDqQaLd9HTLEZwC0UIX6qI2dsjksLmK6NyAwN4z66z3pKyh6NcisN8VaMe06XlgDPMB
 zNcC8mWocCwdO+RhLfKSt2HFpn08egmytCFsISkc8Lq6EMGRacgrFVP8zqFGkPkm86Do97snDyb
 PUPQv+nEbC+deVu/Ih6gdnOgshXevaVFFNLbhwo7ILvdrAb5w0FQqk+GZMr0ixIKl7uDNsKIAk7
 fKt1blLyOHrgtVgxFqcXPvOK+OmPeu49fCoSu9ic1DcaUVWm8rv0JQ1t7ApvBI4DtGr9SGJ38iO
 UHUb3AkstIk4hyNuz9fbo/B5pN4RGDH1Vn59gnZHwk1ubxys63BFZKS8F3DFh+o/NT37naOYGns
 pvjwnmK5Aws25EA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Introduce the `OnceLock` type, a container that can only be written once.
The container uses an internal atomic to synchronize writes to the internal
value.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync.rs           |   1 +
 rust/kernel/sync/once_lock.rs | 104 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index c7c0e552bafe..f2ee07315091 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -15,6 +15,7 @@
 mod condvar;
 pub mod lock;
 mod locked_by;
+pub mod once_lock;
 pub mod poll;
 pub mod rcu;
 
diff --git a/rust/kernel/sync/once_lock.rs b/rust/kernel/sync/once_lock.rs
new file mode 100644
index 000000000000..cd311bea3919
--- /dev/null
+++ b/rust/kernel/sync/once_lock.rs
@@ -0,0 +1,104 @@
+//! A container that can be initialized at most once.
+
+use super::atomic::ordering::Acquire;
+use super::atomic::ordering::Release;
+use super::atomic::Atomic;
+use kernel::types::Opaque;
+
+/// A container that can be populated at most once. Thread safe.
+///
+/// Once the a [`OnceLock`] is populated, it remains populated by the same object for the
+/// lifetime `Self`.
+///
+/// # Invariants
+///
+/// `init` tracks the state of the container:
+///
+/// - If the container is empty, `init` is `0`.
+/// - If the container is mutably accessed, `init` is `1`.
+/// - If the container is populated and ready for shared access, `init` is `2`.
+///
+/// # Example
+///
+/// ```
+/// # use kernel::sync::once_lock::OnceLock;
+/// let value = OnceLock::new();
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
+pub struct OnceLock<T> {
+    init: Atomic<u32>,
+    value: Opaque<T>,
+}
+
+impl<T> Default for OnceLock<T> {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl<T> OnceLock<T> {
+    /// Create a new [`OnceLock`].
+    ///
+    /// The returned instance will be empty.
+    pub const fn new() -> Self {
+        // INVARIANT: The container is empty and we set `init` to `0`.
+        Self {
+            value: Opaque::uninit(),
+            init: Atomic::new(0),
+        }
+    }
+
+    /// Get a reference to the contained object.
+    ///
+    /// Returns [`None`] if this [`OnceLock`] is empty.
+    pub fn as_ref(&self) -> Option<&T> {
+        if self.init.load(Acquire) == 2 {
+            // SAFETY: As determined by the load above, the object is ready for shared access.
+            Some(unsafe { &*self.value.get() })
+        } else {
+            None
+        }
+    }
+
+    /// Populate the [`OnceLock`].
+    ///
+    /// Returns `true` if the [`OnceLock`] was successfully populated.
+    pub fn populate(&self, value: T) -> bool {
+        // INVARIANT: We obtain exclusive access to the contained allocation and write 1 to
+        // `init`.
+        if let Ok(0) = self.init.cmpxchg(0, 1, Acquire) {
+            // SAFETY: We obtained exclusive access to the contained object.
+            unsafe { core::ptr::write(self.value.get(), value) };
+            // INVARIANT: We release our exclusive access and transition the object to shared
+            // access.
+            self.init.store(2, Release);
+            true
+        } else {
+            false
+        }
+    }
+}
+
+impl<T: Copy> OnceLock<T> {
+    /// Get a copy of the contained object.
+    ///
+    /// Returns [`None`] if the [`OnceLock`] is empty.
+    pub fn copy(&self) -> Option<T> {
+        if self.init.load(Acquire) == 2 {
+            // SAFETY: As determined by the load above, the object is ready for shared access.
+            Some(unsafe { *self.value.get() })
+        } else {
+            None
+        }
+    }
+}

-- 
2.47.2



