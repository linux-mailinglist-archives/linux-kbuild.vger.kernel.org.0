Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B9635FAFD
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 20:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353093AbhDNSrS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 14:47:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:49456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353087AbhDNSrQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 14:47:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D470161153;
        Wed, 14 Apr 2021 18:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618426015;
        bh=O0lL9Ycy6w5ZehTDvmANxUVy4sdu6XTD/gExW0gRZqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KpUs7fROxIbk7t+Z0RQoRJ2BBI+72Chp3K8K8SnLqAUGeaVPoIejyEsqskpm24b1v
         FdDtfc4GbDg1iYTWNwUtPYZ6PFoPyzjVdKFxX+nk9VCTyg6oETf1+gJa3akvjegS6H
         RMRfmX76aGvwykiWzAnv5mvDPaW4b3NoO0zk6cTd9ecqWLy7YSgvWPAX4Fe/wp5Smy
         2/Vg5RYoAVfGPKiNg4kvn7nw6jOs5piBDRZ17z+n5cDQUNDtZi3caYCWHvqE1Us2SO
         kUP+ROGN3Yuw0syCqQoiXB8YiTLIv92cyIR3C6g0MuGNv9dUEClW4lDmwPtY/TUEqa
         TFoShQ9EWEoZw==
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
Subject: [PATCH 08/13] Rust: Export generated symbols
Date:   Wed, 14 Apr 2021 20:45:59 +0200
Message-Id: <20210414184604.23473-9-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Now that all the shared Rust infrastructure is in, we export all
the symbols reusing the `EXPORT_SYMBOL_GPL` macro from C. The lists
of symbols are generated on the fly when compiling the crates.

There are three main sets of symbols to distinguish:

  - The ones from the `core` and `alloc` crates (from the Rust
    standard library). The code is licensed as Apache/MIT.

  - The ones from our abstractions in the `kernel` crate.

  - The helpers (already exported since they are not generated).

We export everything as GPL. This ensures we do not mistakenly
expose GPL kernel symbols/features as non-GPL, even indirectly.

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
 rust/Makefile  |  2 ++
 rust/exports.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 rust/exports.c

diff --git a/rust/Makefile b/rust/Makefile
index dbbbdbad6941..2d1d9d7af77c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -9,6 +9,8 @@ extra-$(CONFIG_RUST) += bindings_generated.rs
 obj-$(CONFIG_RUST) += alloc.o kernel.o
 extra-$(CONFIG_RUST) += exports_alloc_generated.h exports_kernel_generated.h
 
+obj-$(CONFIG_RUST) += exports.o
+
 RUSTDOC = rustdoc
 
 quiet_cmd_rustdoc = RUSTDOC $<
diff --git a/rust/exports.c b/rust/exports.c
new file mode 100644
index 000000000000..d7dff1b3b919
--- /dev/null
+++ b/rust/exports.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// A hack to export Rust symbols for loadable modules without having to redo
+// the entire `include/linux/export.h` logic in Rust.
+//
+// This requires the Rust's new/future `v0` mangling scheme because the default
+// one ("legacy") uses invalid characters for C identifiers (thus we cannot use
+// the `EXPORT_SYMBOL_*` macros).
+
+#include <linux/module.h>
+
+#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym);
+
+#include "exports_core_generated.h"
+#include "exports_alloc_generated.h"
+#include "exports_kernel_generated.h"
-- 
2.17.1

