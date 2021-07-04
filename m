Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D193BAED8
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhGDUbV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:31:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhGDUbU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:31:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE5466115C;
        Sun,  4 Jul 2021 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430524;
        bh=9sHxSofkyts3lBEKvreHLTsKUIXAeirgJMCP+4zsqes=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Usx3CccbvuHYIGN72WFhDCC3dDydQtYIvfsi4NoBzNKDCPS8QRtRkBk4Cyk50Inln
         QQLbsMfRT86Pa10e/mL8atPMTDvFem1bRLMLvmL8wJC4i0rd1ctYFjJMK45EBtTsjG
         ySSbciM5yk5HqipOXlDNdMaeZkpgtOhxtug4f+CeCQQZ3tTB087ZfKEh6Rqf1U0OHH
         1xQWhY7Iek+h8W2w2Zi0TrI2Cz/+R0U1n9zX9WinMFdVyUE6pYBD5E84LCmU/En6nf
         prb5rgfEco3P/JDEpVWcNum6P01OPmtXdaksCchpUn8qjeFOufE6uIQ6DeBfhHQjsk
         Kzbc5Gn9BNQWw==
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
Subject: [PATCH 03/17] Makefile: generate `CLANG_FLAGS` even in GCC builds
Date:   Sun,  4 Jul 2021 22:27:42 +0200
Message-Id: <20210704202756.29107-4-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

To support Rust under GCC-built kernels, we need to save the flags that
would have been passed if the kernel was being compiled with Clang.

The reason is that `bindgen` -- the tool we use to generate Rust
bindings to the C side of the kernel -- relies on `libclang` to
parse C. Ideally:

  - `bindgen` would support a GCC backend (requested at [1]),

  - or the Clang driver would be perfectly compatible with GCC,
    including plugins. Unlikely, of course, but perhaps a big
    subset of configs may be possible to guarantee to be kept
    compatible nevertheless.

This is also the reason why GCC builds are very experimental and some
configurations may not work (e.g. `GCC_PLUGIN_RANDSTRUCT`). However,
we keep GCC builds working (for some example configs) in the CI
to avoid diverging/regressing further, so that we are better prepared
for the future when a solution might become available.

[1] https://github.com/rust-lang/rust-bindgen/issues/1949

Link: https://github.com/Rust-for-Linux/linux/issues/167
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
 Makefile | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 0565caea036..6e823d8bd64 100644
--- a/Makefile
+++ b/Makefile
@@ -573,18 +573,23 @@ endif
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
 
-ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
+TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option
+
 ifneq ($(CROSS_COMPILE),)
-CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
+TENTATIVE_CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 endif
 ifeq ($(LLVM_IAS),1)
-CLANG_FLAGS	+= -integrated-as
+TENTATIVE_CLANG_FLAGS	+= -integrated-as
 else
-CLANG_FLAGS	+= -no-integrated-as
+TENTATIVE_CLANG_FLAGS	+= -no-integrated-as
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
-CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
+TENTATIVE_CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 endif
-CLANG_FLAGS	+= -Werror=unknown-warning-option
+
+export TENTATIVE_CLANG_FLAGS
+
+ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
+CLANG_FLAGS	+= $(TENTATIVE_CLANG_FLAGS)
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
-- 
2.32.0

