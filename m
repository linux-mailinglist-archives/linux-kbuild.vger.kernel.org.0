Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464CE3BAEE8
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhGDUbq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:37182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230101AbhGDUbp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:31:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E248613F1;
        Sun,  4 Jul 2021 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430549;
        bh=Xw+YpR7+ODy7bTkSIEvVXZYPVVcCYE52n6l0fRjuwvI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WRVLu3zfWVLBgG6vP5LqmmFgCn+ZErWJeo7M9r20iJk4uT4IdUaftmowuJy3xAXqg
         a21MbJ3zXD58OywxBip5oGWUFzI01C3GIl0FuY1watCL3ckD+ouJVJ+7MVo7UWC4pF
         Deq1wDfHekE0OR+dqmYyVDXuMEECAQEd9zsJhsSigJbxfcvzK89hEc0MbHWEMcok/U
         YN4KxFtIXlaHlmICKBi76QRHBWykEk9hZARn+aeoO88QzzEiGyom+qjOErhrKK3P7I
         4VvHfuZ95sVFtEl3BHIufPwGygr6UZih8P2qrDnJAlwRBqc4ZBKoh8oYW2w4+flJ43
         iqjZPfbOkVoTw==
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
Subject: [PATCH 08/17] rust: add `build_error` crate
Date:   Sun,  4 Jul 2021 22:27:47 +0200
Message-Id: <20210704202756.29107-9-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

The `build_error` crate provides the `build_error` function which
is then used to provide the `build_error!` and the `build_assert!`
macros.

`build_assert!` is intended to be used when `static_assert!` cannot
be used, e.g. when the condition refers to generic parameters or
parameters of an inline function.

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
 rust/build_error.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 rust/build_error.rs

diff --git a/rust/build_error.rs b/rust/build_error.rs
new file mode 100644
index 00000000000..d47fa8393cb
--- /dev/null
+++ b/rust/build_error.rs
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Build-time error.
+//!
+//! This crate provides a function `build_error`, which will panic in
+//! compile-time if executed in const context, and will cause a build error
+//! if not executed at compile time and the optimizer does not optimise away the
+//! call.
+//!
+//! It is used by `build_assert!` in the kernel crate, allowing checking of
+//! conditions that could be checked statically, but could not be enforced in
+//! Rust yet (e.g. perform some checks in const functions, but those
+//! functions could still be called in the runtime).
+
+#![no_std]
+#![feature(const_panic, core_panic)]
+
+/// Panics if executed in const context, or triggers a build error if not.
+#[inline(never)]
+#[cold]
+#[no_mangle]
+#[track_caller]
+pub const fn build_error(msg: &'static str) -> ! {
+    // Could also be `panic!(msg)` to avoid using unstable feature `core_panic`,
+    // but it is not allowed in Rust 2021, while `panic!("{}", msg)` could not
+    // yet be used in const context.
+    core::panicking::panic(msg);
+}
+
+#[cfg(CONFIG_RUST_BUILD_ASSERT_WARN)]
+#[link_section = ".gnu.warning.build_error"]
+#[used]
+static BUILD_ERROR_WARNING: [u8; 45] = *b"call to build_error present after compilation";
-- 
2.32.0

