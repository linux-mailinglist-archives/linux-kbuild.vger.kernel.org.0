Return-Path: <linux-kbuild+bounces-12477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Dc+HtcOzWnhZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12477-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:25:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B62737A6B0
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA733178431
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451D93FBEA3;
	Wed,  1 Apr 2026 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugWT6S5R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F366324B16;
	Wed,  1 Apr 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044023; cv=none; b=PKfjfAZT7V1qjQ5LRVHztJME0uajZXBqFW4LsRLvm5A28Ap+WvR/UubCUkIKalYarn1/PK6Ctwv6bMsmdnbDeJVstpJHMBNEpiKR4ZOHXUc/t6BuJSTtx3PBmACLV6l3v03OoC08kC0o01nGDQ8BGVGi8WOEMSs/65ZYY+76mFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044023; c=relaxed/simple;
	bh=Mw52drxgGUxVV9g2ax+bN00+Y+DwaOQAPKLe9BmgAy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8Cc8z0CZ4zM37MExkDCppZ05hU0EOfG4zPxFtH/6cRaIUCE7symOyEosLqkiLVxhEvPuHH9wY1WYPMm1bTdGvTYdONUt7MtZTgJBtJFv/KMxlBYfE9gruDj3zztZcSwgEsLW7IDLNbeRZgu3hv3XU7dcaKUJzIWK0CL51tkX7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugWT6S5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DC6C4CEF7;
	Wed,  1 Apr 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044022;
	bh=Mw52drxgGUxVV9g2ax+bN00+Y+DwaOQAPKLe9BmgAy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ugWT6S5Rks7JPny9Cbv3J54JQDqN0ZafIZl0tQRG/BsxkABfq5N56hz+HGTTf4QwF
	 WiRyg2jtIsN33RPoZYMpId+EKAU/CCVoqlxQN7bAyCsVHubJ+dATwyolmxDU4YviB4
	 CD485eQ2RG865GItyQC+jO2K13LW0xStFtW/2mDspeDXwll7+7RMFrp7wAJVqIvOPB
	 3yxUZk54m4wYSUVjV/ZpEBfRxXXEMB2aVcfp87afwcWiqgJaFe1PFleNMQyyYcnIuO
	 K6iyTtLE89a2gaj8ngxnXrUkrvnmoIUYwXrtSpIRfgZzJ33g4NEK+z4JXxJ7jUr7kd
	 C+bsywMkeukpg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 05/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and simplify code
Date: Wed,  1 Apr 2026 13:45:12 +0200
Message-ID: <20260401114540.30108-6-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12477-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B62737A6B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the Rust version bump in place, the `RUSTC_HAS_COERCE_POINTEE`
Kconfig (automatic) option is always true.

Thus remove the option and simplify the code.

In particular, this includes removing our use of the predecessor unstable
features we used with Rust < 1.84.0 (`coerce_unsized`, `dispatch_from_dyn`
and `unsize`).

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig              |  3 ---
 rust/kernel/alloc/kbox.rs | 29 ++---------------------------
 rust/kernel/lib.rs        |  8 +-------
 rust/kernel/list/arc.rs   | 22 +---------------------
 rust/kernel/sync/arc.rs   | 21 ++-------------------
 5 files changed, 6 insertions(+), 77 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index c38f49228157..f9fac458e4d4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -178,9 +178,6 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
-config RUSTC_HAS_COERCE_POINTEE
-	def_bool RUSTC_VERSION >= 108400
-
 config RUSTC_HAS_SPAN_FILE
 	def_bool RUSTC_VERSION >= 108800
 
diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 622b3529edfc..bd6da02c7ab8 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -77,33 +77,8 @@
 /// `self.0` is always properly aligned and either points to memory allocated with `A` or, for
 /// zero-sized types, is a dangling, well aligned pointer.
 #[repr(transparent)]
-#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoercePointee))]
-pub struct Box<#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, pointee)] T: ?Sized, A: Allocator>(
-    NonNull<T>,
-    PhantomData<A>,
-);
-
-// This is to allow coercion from `Box<T, A>` to `Box<U, A>` if `T` can be converted to the
-// dynamically-sized type (DST) `U`.
-#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
-impl<T, U, A> core::ops::CoerceUnsized<Box<U, A>> for Box<T, A>
-where
-    T: ?Sized + core::marker::Unsize<U>,
-    U: ?Sized,
-    A: Allocator,
-{
-}
-
-// This is to allow `Box<U, A>` to be dispatched on when `Box<T, A>` can be coerced into `Box<U,
-// A>`.
-#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
-impl<T, U, A> core::ops::DispatchFromDyn<Box<U, A>> for Box<T, A>
-where
-    T: ?Sized + core::marker::Unsize<U>,
-    U: ?Sized,
-    A: Allocator,
-{
-}
+#[derive(core::marker::CoercePointee)]
+pub struct Box<#[pointee] T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
 
 /// Type alias for [`Box`] with a [`Kmalloc`] allocator.
 ///
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 621cae75030c..66a09d77a2c4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -39,17 +39,11 @@
 //
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
+#![feature(derive_coerce_pointee)]
 //
 // To be determined.
 #![feature(used_with_arg)]
 //
-// `feature(derive_coerce_pointee)` is expected to become stable. Before Rust
-// 1.84.0, it did not exist, so enable the predecessor features.
-#![cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, feature(derive_coerce_pointee))]
-#![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized))]
-#![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_dyn))]
-#![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
-//
 // `feature(file_with_nul)` is expected to become stable. Before Rust 1.89.0, it did not exist, so
 // enable it conditionally.
 #![cfg_attr(CONFIG_RUSTC_HAS_FILE_WITH_NUL, feature(file_with_nul))]
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index e1082423909c..a9a2b0178f65 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -160,7 +160,7 @@ fn try_new_list_arc(&self) -> bool {
 ///
 /// [`List`]: crate::list::List
 #[repr(transparent)]
-#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoercePointee))]
+#[derive(core::marker::CoercePointee)]
 pub struct ListArc<T, const ID: u64 = 0>
 where
     T: ListArcSafe<ID> + ?Sized,
@@ -443,26 +443,6 @@ fn as_ref(&self) -> &Arc<T> {
     }
 }
 
-// This is to allow coercion from `ListArc<T>` to `ListArc<U>` if `T` can be converted to the
-// dynamically-sized type (DST) `U`.
-#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
-impl<T, U, const ID: u64> core::ops::CoerceUnsized<ListArc<U, ID>> for ListArc<T, ID>
-where
-    T: ListArcSafe<ID> + core::marker::Unsize<U> + ?Sized,
-    U: ListArcSafe<ID> + ?Sized,
-{
-}
-
-// This is to allow `ListArc<U>` to be dispatched on when `ListArc<T>` can be coerced into
-// `ListArc<U>`.
-#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
-impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc<T, ID>
-where
-    T: ListArcSafe<ID> + core::marker::Unsize<U> + ?Sized,
-    U: ListArcSafe<ID> + ?Sized,
-{
-}
-
 /// A utility for tracking whether a [`ListArc`] exists using an atomic.
 ///
 /// # Invariants
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 921e19333b89..18d6c0d62ce0 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -128,7 +128,7 @@
 /// # Ok::<(), Error>(())
 /// ```
 #[repr(transparent)]
-#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoercePointee))]
+#[derive(core::marker::CoercePointee)]
 pub struct Arc<T: ?Sized> {
     ptr: NonNull<ArcInner<T>>,
     // NB: this informs dropck that objects of type `ArcInner<T>` may be used in `<Arc<T> as
@@ -182,15 +182,6 @@ unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
     }
 }
 
-// This is to allow coercion from `Arc<T>` to `Arc<U>` if `T` can be converted to the
-// dynamically-sized type (DST) `U`.
-#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
-impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Arc<U>> for Arc<T> {}
-
-// This is to allow `Arc<U>` to be dispatched on when `Arc<T>` can be coerced into `Arc<U>`.
-#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
-impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<U>> for Arc<T> {}
-
 // SAFETY: It is safe to send `Arc<T>` to another thread when the underlying `T` is `Sync` because
 // it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
 // `T` to be `Send` because any thread that has an `Arc<T>` may ultimately access `T` using a
@@ -547,20 +538,12 @@ fn from(item: Pin<UniqueArc<T>>) -> Self {
 /// # Ok::<(), Error>(())
 /// ```
 #[repr(transparent)]
-#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoercePointee))]
+#[derive(core::marker::CoercePointee)]
 pub struct ArcBorrow<'a, T: ?Sized + 'a> {
     inner: NonNull<ArcInner<T>>,
     _p: PhantomData<&'a ()>,
 }
 
-// This is to allow `ArcBorrow<U>` to be dispatched on when `ArcBorrow<T>` can be coerced into
-// `ArcBorrow<U>`.
-#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
-impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<ArcBorrow<'_, U>>
-    for ArcBorrow<'_, T>
-{
-}
-
 impl<T: ?Sized> Clone for ArcBorrow<'_, T> {
     fn clone(&self) -> Self {
         *self
-- 
2.53.0


