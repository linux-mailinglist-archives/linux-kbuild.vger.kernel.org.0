Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319CD3BAEE4
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhGDUbf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:31:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230085AbhGDUbe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:31:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB67B613F1;
        Sun,  4 Jul 2021 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430539;
        bh=5IkH6k57x0wQb/2rxknod94WvBdKBrDhSDQRHRqz02o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lt+8b4/T5pa/QK+60/9K1nxKFduCfTeJAIn5OhECkM988lh1qnwLbWxyPwK2x1JvU
         NTXBn0g7WkSs2t9ebNBDrvCpC2q1HimRMBPcCK3qEZV1wmn3C0tIPbv8LZQiHPz09G
         pWJuy+jzHRh0gP4HrQxL7KEFCUzUqTGfqKFspguhMUj+ewBeMUaGGLS0qyR0OsvH8A
         agkX+nyadmMilWcdc84ktdDYKUenKRkn+HSub+rBitRK6CPUOuhY2xWPf3N3ZqZG91
         wYL60BtYGt0Us+vBzypVSr2JDkVEDQsbCNs5w7PLeJj7TH6ApRrHPqyszsGXNRcLYa
         Dyh4CesXSMb6Q==
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
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Subject: [PATCH 06/17] rust: add `compiler_builtins` crate
Date:   Sun,  4 Jul 2021 22:27:45 +0200
Message-Id: <20210704202756.29107-7-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Rust provides `compiler_builtins` as a port of LLVM's `compiler-rt`.
Since we do not need the vast majority of them, we avoid the
dependency by providing our own crate.

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
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Co-developed-by: Fox Chen <foxhlchen@gmail.com>
Signed-off-by: Fox Chen <foxhlchen@gmail.com>
Co-developed-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
Signed-off-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
Co-developed-by: Douglas Su <d0u9.su@outlook.com>
Signed-off-by: Douglas Su <d0u9.su@outlook.com>
Co-developed-by: Yuki Okushi <jtitor@2k36.org>
Signed-off-by: Yuki Okushi <jtitor@2k36.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/compiler_builtins.rs | 146 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 rust/compiler_builtins.rs

diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
new file mode 100644
index 00000000000..cb4bbf7be4e
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
+//! in. We will work with upstream [`core`] to provide feature flags to disable
+//! the parts we do not need. For the moment, we define them to [`panic!`] at
+//! runtime for simplicity to catch mistakes, instead of performing surgery
+//! on `core.o`.
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
+define_panicking_intrinsics!("`f32` should not be used", {
+    __addsf3,
+    __addsf3vfp,
+    __aeabi_fcmpeq,
+    __aeabi_ul2f,
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
+    __aeabi_dcmpeq,
+    __aeabi_ul2d,
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
+#[cfg(target_arch = "arm")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __aeabi_uldivmod,
+    __mulodi4,
+});
+
+extern "C" {
+    fn rust_helper_BUG() -> !;
+}
+
+#[panic_handler]
+fn panic(_info: &core::panic::PanicInfo<'_>) -> ! {
+    unsafe {
+        rust_helper_BUG();
+    }
+}
-- 
2.32.0

