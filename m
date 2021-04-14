Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB6235FAF4
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 20:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353068AbhDNSrH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 14:47:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353052AbhDNSq6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 14:46:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D37961153;
        Wed, 14 Apr 2021 18:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618425997;
        bh=J2a8PS8uFRlQIf9jLGd/pmNX4lflqEQpT2s3wHMzz+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=amBUYURLbySxZCz62sQUdb+yDhXgd5hj4LgkTM+8IsqjDoQgzUY9eKL8pbD5KQUbw
         bQC5yZ2gYNfSOE8Zg4vRq3vK6wqQFhEAfWY+Yl96/ib+y+dj33+ORu/EtTAKg82PDr
         UvHZcOd0fFgtcGX/onLKk+0ZcOs5UZucOZhToLafiM1PNoWfKOOqdocbwZpAom4TZJ
         qXDUidPYwuuXRjMndISFrs7EyMYgsYDhlZhkEIjQGRrW//DdzGCM9L6oHT4jRlM3HT
         DXprJTN1u/nKosoLiuuji74fnrhvwzibN8hM8YRj9BdSkadUvAKu6kKKNFqVscPCYz
         7nVQH/+5uo2CQ==
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
Subject: [PATCH 03/13] Makefile: Generate CLANG_FLAGS even in GCC builds
Date:   Wed, 14 Apr 2021 20:45:54 +0200
Message-Id: <20210414184604.23473-4-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

To support Rust under GCC-built kernels, we need to save the flags that
would have been passed if the kernel was being compiled with Clang.

The reason is that bindgen -- the tool we use to generate Rust bindings
to the C side of the kernel -- relies on libclang to parse C. Ideally:

  - bindgen would support a GCC backend (requested at [1]),

  - or the Clang driver would be perfectly compatible with GCC,
    including plugins. Unlikely, of course, but perhaps a big
    subset of configs may be possible to guarantee to be kept
    compatible nevertheless.

This is also the reason why GCC builds are very experimental and some
configurations may not work (e.g. GCC_PLUGIN_RANDSTRUCT). However,
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
 Makefile | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index d4784d181123..9c75354324ed 100644
--- a/Makefile
+++ b/Makefile
@@ -559,26 +559,31 @@ ifdef building_out_of_srctree
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
 endif
 
-# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
-# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
-# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
-# and from include/config/auto.conf.cmd to detect the compiler upgrade.
-CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g')
+TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option
 
-ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 ifneq ($(CROSS_COMPILE),)
-CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
+TENTATIVE_CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
-CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
+TENTATIVE_CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
 endif
 ifneq ($(GCC_TOOLCHAIN),)
-CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
+TENTATIVE_CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 ifneq ($(LLVM_IAS),1)
-CLANG_FLAGS	+= -no-integrated-as
+TENTATIVE_CLANG_FLAGS	+= -no-integrated-as
 endif
-CLANG_FLAGS	+= -Werror=unknown-warning-option
+
+export TENTATIVE_CLANG_FLAGS
+
+# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
+# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
+# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
+# and from include/config/auto.conf.cmd to detect the compiler upgrade.
+CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g')
+
+ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
+CLANG_FLAGS	+= $(TENTATIVE_CLANG_FLAGS)
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
-- 
2.17.1

