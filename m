Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9253035FAF9
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 20:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353082AbhDNSrL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 14:47:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:49298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353069AbhDNSrI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 14:47:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B90A61179;
        Wed, 14 Apr 2021 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618426006;
        bh=ghEMDYXSMr60DXNAYd0/tV0Ldo15eYV1g5ZlE1HiFe0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M1kOBIaTQdZfI1wDWca4LFG6y9IWw+gXmBFAI8PaBM9wJ9EKYunmLHRWCPXnOpLii
         GatpvCFPlP2EzLefwpDm0QC/6LVOnFMu5m+Pd5H9Vr8zH8SizNvwCT+fFk2tvmdmvY
         2ktAY7xMnzAF3vFw6SApQwnly64XLEp1fagWpkBpl884qGwEp16d7uBCIjnuXwnDf6
         bvdwK3+LyJAB8qtyLKiRUeIviRIcqfcG47c966lRsqyT3l3p1fqJXZflRSp2Q83It8
         3ifHEbyP+wr9+4Q86U2Q+EnA4Tt8QiAflj6fT8DHLlHxCMD7aufuhyJl0KBjhI9GWR
         uo35OfYSRiHdg==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 05/13] Rust: Compiler builtins crate
Date:   Wed, 14 Apr 2021 20:45:56 +0200
Message-Id: <20210414184604.23473-6-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Rust provides `compiler_builtins` as a port of LLVM's `compiler-rt`.
Since we do not need the vast majority of them, we avoid the
dependency by providing our own crate.

We also need a helpers C source file to contain some forwarders
to C macros and inlined functions. For the moment, we only need it
to call the `BUG()` macro, but we will be adding more later.

This also allows us to build `core` from Rust's standard library.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
Co-developed-by: Finn Behrens <me@kloenk.de>
Signed-off-by: Finn Behrens <me@kloenk.de>
Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile             |   3 +
 rust/compiler_builtins.rs | 146 ++++++++++++++++++++++++++++++++++++++
 rust/helpers.c            |   8 +++
 3 files changed, 157 insertions(+)
 create mode 100644 rust/compiler_builtins.rs
 create mode 100644 rust/helpers.c

diff --git a/rust/Makefile b/rust/Makefile
index ba4b13e4fc7f..5b96462b4fef 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_RUST) += core.o compiler_builtins.o helpers.o
+extra-$(CONFIG_RUST) += exports_core_generated.h
+
 RUSTDOC = rustdoc
 
 quiet_cmd_rustdoc = RUSTDOC $<
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
new file mode 100644
index 000000000000..01f2d905e15f
--- /dev/null
+++ b/rust/compiler_builtins.rs
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Our own `compiler_builtins`.
+//!
+//! Rust provides [`compiler_builtins`] as a port of LLVM's [`compiler-rt`].
+//! Since we do not need the vast majority of them, we avoid the dependency
+//! by providing this file.
+//!
+//! At the moment, some builtins are required that should not be. For instance,
+//! [`core`] has floating-point functionality which we should not be compiling
+//! in. For the moment, we define them to [`panic!`] at runtime for simplicity.
+//! These are actually a superset of the ones we actually need to define,
+//! but it seems simpler to ban entire categories at once. In the future,
+//! we might be able to remove all this by providing our own custom [`core`]
+//! etc., or perhaps [`core`] itself might provide `cfg` options to disable
+//! enough functionality to avoid requiring some of these.
+//!
+//! In any case, all these symbols are weakened to ensure we do not override
+//! those that may be provided by the rest of the kernel.
+//!
+//! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
+//! [`compiler-rt`]: https://compiler-rt.llvm.org/
+
+#![feature(compiler_builtins)]
+#![compiler_builtins]
+#![no_builtins]
+#![no_std]
+#![deny(clippy::complexity)]
+#![deny(clippy::correctness)]
+#![deny(clippy::perf)]
+#![deny(clippy::style)]
+
+macro_rules! define_panicking_intrinsics(
+    ($reason: tt, { $($ident: ident, )* }) => {
+        $(
+            #[doc(hidden)]
+            #[no_mangle]
+            pub extern "C" fn $ident() {
+                panic!($reason);
+            }
+        )*
+    }
+);
+
+define_panicking_intrinsics!("non-inline stack probes should not be used", {
+    __rust_probestack,
+});
+
+define_panicking_intrinsics!("`f32` should not be used", {
+    __addsf3,
+    __addsf3vfp,
+    __divsf3,
+    __divsf3vfp,
+    __eqsf2,
+    __eqsf2vfp,
+    __fixsfdi,
+    __fixsfsi,
+    __fixsfti,
+    __fixunssfdi,
+    __fixunssfsi,
+    __fixunssfti,
+    __floatdisf,
+    __floatsisf,
+    __floattisf,
+    __floatundisf,
+    __floatunsisf,
+    __floatuntisf,
+    __gesf2,
+    __gesf2vfp,
+    __gtsf2,
+    __gtsf2vfp,
+    __lesf2,
+    __lesf2vfp,
+    __ltsf2,
+    __ltsf2vfp,
+    __mulsf3,
+    __mulsf3vfp,
+    __nesf2,
+    __nesf2vfp,
+    __powisf2,
+    __subsf3,
+    __subsf3vfp,
+    __unordsf2,
+});
+
+define_panicking_intrinsics!("`f64` should not be used", {
+    __adddf3,
+    __adddf3vfp,
+    __divdf3,
+    __divdf3vfp,
+    __eqdf2,
+    __eqdf2vfp,
+    __fixdfdi,
+    __fixdfsi,
+    __fixdfti,
+    __fixunsdfdi,
+    __fixunsdfsi,
+    __fixunsdfti,
+    __floatdidf,
+    __floatsidf,
+    __floattidf,
+    __floatundidf,
+    __floatunsidf,
+    __floatuntidf,
+    __gedf2,
+    __gedf2vfp,
+    __gtdf2,
+    __gtdf2vfp,
+    __ledf2,
+    __ledf2vfp,
+    __ltdf2,
+    __ltdf2vfp,
+    __muldf3,
+    __muldf3vfp,
+    __nedf2,
+    __nedf2vfp,
+    __powidf2,
+    __subdf3,
+    __subdf3vfp,
+    __unorddf2,
+});
+
+define_panicking_intrinsics!("`i128` should not be used", {
+    __ashrti3,
+    __muloti4,
+    __multi3,
+});
+
+define_panicking_intrinsics!("`u128` should not be used", {
+    __ashlti3,
+    __lshrti3,
+    __udivmodti4,
+    __udivti3,
+    __umodti3,
+});
+
+extern "C" {
+    fn rust_helper_BUG() -> !;
+}
+
+#[panic_handler]
+fn panic(_info: &core::panic::PanicInfo) -> ! {
+    unsafe {
+        rust_helper_BUG();
+    }
+}
diff --git a/rust/helpers.c b/rust/helpers.c
new file mode 100644
index 000000000000..5c2346dd379b
--- /dev/null
+++ b/rust/helpers.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bug.h>
+
+void rust_helper_BUG(void)
+{
+	BUG();
+}
-- 
2.17.1

