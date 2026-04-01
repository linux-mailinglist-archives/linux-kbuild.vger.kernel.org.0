Return-Path: <linux-kbuild+bounces-12503-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEe1GvUMzWlHZwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12503-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:17:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4937A515
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9FD432B8A95
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CDA407582;
	Wed,  1 Apr 2026 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnpTAw+z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA1225791;
	Wed,  1 Apr 2026 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044329; cv=none; b=V6hYlOdMKDPr3GRlhzPlRVSR111mTIWaRebnNbB4AU8lZZIdMMeDdyWBKhwzwJ7UWiMCxI7w9V641EXgFldQIvEXo+M1Mu8MMMDcTlVyqUjv/GwwcT4UYePkxMmbnMq1WB2Y3/8yadWSDjCV0/a1p975aLrZBM473CTSdVVIXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044329; c=relaxed/simple;
	bh=p+eIRLsw7Ht2kqc3WxH3RBV0AlZGw5SEVt3OYrIrUc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HM3YzDjOQGu6++8ZwDg+BPdH2YHwilb+3qfv+OZ6Mpc5afuUg88vTu6UOMd75GJfI3+7cgdPlFdtpHpnExeQ5IRdKuO/LyZaalCSiR9zWU1HKd9onXo7jAc+FqumZV2N7IRK0ckNkdJEmMVrnLGqvQOJKfNMKQh4UwIub52/NVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnpTAw+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D7DC4CEF7;
	Wed,  1 Apr 2026 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044329;
	bh=p+eIRLsw7Ht2kqc3WxH3RBV0AlZGw5SEVt3OYrIrUc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tnpTAw+zyfpSqG/NYpAECXMF/A5Hs4KTeUHMny0KZf81sDUHcF6LI1WigdsMpEd7v
	 5ko9J802N3Ioa9jG1ez62+v8CsSMBcS6Tz/fLW4mlmL086Ky2uo3B+YSzBVdVhELad
	 Y6Rjj7rOuWQYFGyk5X88UD3VUQK8upxhvz46HmbFojIDjJ84UUaSyLNDlYWdnqiIKy
	 ewka9WzjgjPJEKp8GrLSJ3WixASKNMxgFIPOVljiGQlwFojffy5X1BJun/PpM3ypJ8
	 i08pl6ZR10hlLfVtHlHYRzo/sho85zmt7uTFKb+xkhIS0XKWtSlg3dtYQPqdW8e0ww
	 agY9gqQJBOUuw==
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
Subject: [PATCH 31/33] rust: declare cfi_encoding for lru_status
Date: Wed,  1 Apr 2026 13:45:38 +0200
Message-ID: <20260401114540.30108-32-ojeda@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-12503-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[page_range.rs:url,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BBB4937A515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alice Ryhl <aliceryhl@google.com>

By default bindgen will convert 'enum lru_status' into a typedef for an
integer. For the most part, an integer of the same size as the enum
results in the correct ABI, but in the specific case of CFI, that is not
the case. The CFI encoding is supposed to be the same as a struct called
'lru_status' rather than the name of the underlying native integer type.

To fix this, tell bindgen to generate a newtype and set the CFI type
explicitly. Note that we need to set the CFI attribute explicitly as
bindgen is using repr(transparent), which is otherwise identical to the
inner type for ABI purposes.

This allows us to remove the page range helper C function in Binder
without risking a CFI failure when list_lru_walk calls the provided
function pointer.

The --with-attribute-custom-enum argument requires bindgen v0.71 or
greater.

[ In particular, the feature was added in 0.71.0 [1][2].

  In addition, `feature(cfi_encoding)` has been available since
  Rust 1.71.0 [3].

  Link: https://github.com/rust-lang/rust-bindgen/issues/2520 [1]
  Link: https://github.com/rust-lang/rust-bindgen/pull/2866 [2]
  Link: https://github.com/rust-lang/rust/pull/105452 [3]

    - Miguel ]

My testing procedure was to add this to the android17-6.18 branch and
verify that rust_shrink_free_page is successfully called without crash,
and verify that it does in fact crash when the cfi_encoding is set to
other values. Note that I couldn't test this on android16-6.12 as that
branch uses a bindgen version that is too old.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Link: https://patch.msgid.link/20260223-cfi-lru-status-v2-1-89c6448a63a4@google.com
[ Rebased on top of the minimum Rust version bump series which provide
  the required `bindgen` version. - Miguel ]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/android/binder/Makefile            |  3 +--
 drivers/android/binder/page_range.rs       |  6 +++---
 drivers/android/binder/page_range_helper.c | 24 ----------------------
 drivers/android/binder/page_range_helper.h | 15 --------------
 rust/bindgen_parameters                    |  4 ++++
 rust/bindings/bindings_helper.h            |  1 -
 rust/bindings/lib.rs                       |  1 +
 rust/uapi/lib.rs                           |  1 +
 8 files changed, 10 insertions(+), 45 deletions(-)
 delete mode 100644 drivers/android/binder/page_range_helper.c
 delete mode 100644 drivers/android/binder/page_range_helper.h

diff --git a/drivers/android/binder/Makefile b/drivers/android/binder/Makefile
index 09eabb527fa0..7e0cd9782a8b 100644
--- a/drivers/android/binder/Makefile
+++ b/drivers/android/binder/Makefile
@@ -5,5 +5,4 @@ obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) += rust_binder.o
 rust_binder-y := \
 	rust_binder_main.o	\
 	rust_binderfs.o		\
-	rust_binder_events.o	\
-	page_range_helper.o
+	rust_binder_events.o
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index fdd97112ef5c..8e9f5c4819d0 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -642,15 +642,15 @@ fn drop(self: Pin<&mut Self>) {
     unsafe {
         bindings::list_lru_walk(
             list_lru,
-            Some(bindings::rust_shrink_free_page_wrap),
+            Some(rust_shrink_free_page),
             ptr::null_mut(),
             nr_to_scan,
         )
     }
 }
 
-const LRU_SKIP: bindings::lru_status = bindings::lru_status_LRU_SKIP;
-const LRU_REMOVED_ENTRY: bindings::lru_status = bindings::lru_status_LRU_REMOVED_RETRY;
+const LRU_SKIP: bindings::lru_status = bindings::lru_status::LRU_SKIP;
+const LRU_REMOVED_ENTRY: bindings::lru_status = bindings::lru_status::LRU_REMOVED_RETRY;
 
 /// # Safety
 /// Called by the shrinker.
diff --git a/drivers/android/binder/page_range_helper.c b/drivers/android/binder/page_range_helper.c
deleted file mode 100644
index 496887723ee0..000000000000
--- a/drivers/android/binder/page_range_helper.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/* C helper for page_range.rs to work around a CFI violation.
- *
- * Bindgen currently pretends that `enum lru_status` is the same as an integer.
- * This assumption is fine ABI-wise, but once you add CFI to the mix, it
- * triggers a CFI violation because `enum lru_status` gets a different CFI tag.
- *
- * This file contains a workaround until bindgen can be fixed.
- *
- * Copyright (C) 2025 Google LLC.
- */
-#include "page_range_helper.h"
-
-unsigned int rust_shrink_free_page(struct list_head *item,
-				   struct list_lru_one *list,
-				   void *cb_arg);
-
-enum lru_status
-rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one *list,
-			   void *cb_arg)
-{
-	return rust_shrink_free_page(item, list, cb_arg);
-}
diff --git a/drivers/android/binder/page_range_helper.h b/drivers/android/binder/page_range_helper.h
deleted file mode 100644
index 18dd2dd117b2..000000000000
--- a/drivers/android/binder/page_range_helper.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2025 Google, Inc.
- */
-
-#ifndef _LINUX_PAGE_RANGE_HELPER_H
-#define _LINUX_PAGE_RANGE_HELPER_H
-
-#include <linux/list_lru.h>
-
-enum lru_status
-rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one *list,
-			   void *cb_arg);
-
-#endif /* _LINUX_PAGE_RANGE_HELPER_H */
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 112ec197ef0a..6f02d9720ad2 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -19,6 +19,10 @@
 # warning. We don't need to peek into it anyway.
 --opaque-type spinlock
 
+# enums that appear in indirect function calls should specify a cfi type
+--newtype-enum lru_status
+--with-attribute-custom-enum=lru_status='#[cfi_encoding="10lru_status"]'
+
 # `seccomp`'s comment gets understood as a doctest
 --no-doc-comments
 
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952..faf3ee634ced 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -149,5 +149,4 @@ const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
-#include "../../drivers/android/binder/page_range_helper.h"
 #endif
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index e18c160dad17..854e7c471434 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -19,6 +19,7 @@
     unreachable_pub,
     unsafe_op_in_unsafe_fn
 )]
+#![feature(cfi_encoding)]
 
 #[allow(dead_code)]
 #[allow(clippy::cast_lossless)]
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 821e286e0daa..b8a515de31ca 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -24,6 +24,7 @@
     unsafe_op_in_unsafe_fn
 )]
 #![cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
+#![feature(cfi_encoding)]
 
 // Manual definition of blocklisted types.
 type __kernel_size_t = usize;
-- 
2.53.0


