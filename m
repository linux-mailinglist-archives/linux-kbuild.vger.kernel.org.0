Return-Path: <linux-kbuild+bounces-3084-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E35956512
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 09:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FB01B22D9C
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 07:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A17015ADB2;
	Mon, 19 Aug 2024 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UY7gATLq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9B814A62E
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2024 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724054126; cv=none; b=RxGF12wlKFkRI3l5cZGUFMEoNRLlushco0wLABXUYvYOqdr6IKf/G6ExhymLYF8U50pAYvFuwRA6fNfVALleO+V3+aREIDfUCLbKHe4wgVeRTNCZ77gb293I/SJg3cb4xZA3r32oFosAolW85jbGGC7CERSlaPwv3lNP5y5u62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724054126; c=relaxed/simple;
	bh=Bzj0OBsOyjOq5i/otbgGherJGLxV0e7eeDR5mlqDSWg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d+exCPAaeU98Te+3JNbTsN5vkUse9C5c9/0J3Yw+ptKJdU7CHx5V6UqHo6AWG4XXixL8eeuP2gXDm2LxzWCyDk7agZYblBrdtxfKq72xZGl/5ogH+P1kIBSeGzXzpTdek1Eyviux3GtqsL2LzmzEwASbZUCZkI3Mw927TA7r6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UY7gATLq; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e1169005d9aso6823692276.0
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2024 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724054123; x=1724658923; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7ZCawhzLiT2hbSx/SLoMERFd6MH+WHf7PVQaHlSMho=;
        b=UY7gATLqkPtQIBIRNDpd887DBdtZSXSAJ87JCPEyhlzAbatlXth1VN7qtd9W6KYWc1
         wArVwgCoLeSif+FGY4EYNrlqQRw22j3FfaM8B+PMXFAU7075X0dJQxC4L+zMZqnanyUp
         66gR2KFFn8RaXLSUlCv0XE2b/8r+tg1avDM0+NDIHpkpzy48mpog6ZGCzsBVAL3B/uiQ
         M4dpiBpWiWjoihNShL7X4TCvnoF5E2wNeofeX22SQvYXEIKXDZ0W9ujCfke7PDTlCZcz
         F6gvrr6Z9qruBFyPlQa8RzVKS1q1VfTvkOYxw4Gc0LnM/8pJ3ABucdGR/deGttDqGway
         lMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724054123; x=1724658923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7ZCawhzLiT2hbSx/SLoMERFd6MH+WHf7PVQaHlSMho=;
        b=rbgaImbe6HAV2Bb5BDD/KiAmBmUc287BxjJUTV8keXklRz7bAe7NjwPFxwzUcPOVV/
         ZDmycVxMkB+Lj5e44jQFrA7GVppQjrvgCfQv5EqZaYyXgVmBeld8quXXA0JJ1KDsRNN+
         oEifOJbsfzHZtg4yvmCOGR0EpLD24pkcftgi3I0pPdh4CWQMN8jbPJtodmjsifU4CFmF
         RDPWzxmeotwNUocUATQ1fEKqLh5dDnhnUUiPdVEI32iLVxIhF5QI9NNa8wScy9GbJVAn
         A/PnE+U/XtGEBPIgoIy/hMySjkmb4WH+iXARnwHSeC8sMUhHp8BPvGZIkcTwsOmj1jAu
         kphA==
X-Forwarded-Encrypted: i=1; AJvYcCWS98XGlpM8gSPgQXwn7s6AjtQno8d4LpjqNgQTLFb77Jk5+wKmjx4lISDMTxJB/V1BfgQXxTc6UzJ8SqHsLcO1U5JUx5TzDrsTcXW5
X-Gm-Message-State: AOJu0Yx3jXlddx1ODR3uAdH+lIWrJbbGCDkA6ll8tcoRCQdoEpVaR/Fu
	7mr+aO+2wOa2W2SrZUdLQBHKWXeXr4B7xnfKQmkwpC9uk9BMwm92A4UXB4XHtAAamlkGKcMwO0s
	x3nEU/GPzCQJxpw==
X-Google-Smtp-Source: AGHT+IGrZOKUNkZwEXux57+oz5w6kAirAdl/7hs0EIWBRRT6GxickSOwEbLbevHrku7qKv9XvqgvOq4/QBtrGSY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:1821:b0:e11:57b5:733f with SMTP
 id 3f1490d57ef6-e1180ba5576mr24276276.0.1724054123247; Mon, 19 Aug 2024
 00:55:23 -0700 (PDT)
Date: Mon, 19 Aug 2024 07:55:18 +0000
In-Reply-To: <20240801-kcfi-v2-2-c93caed3d121@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240801-kcfi-v2-2-c93caed3d121@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5110; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=pk+3xxI+4/FRGOxNmAbyfBM/kYOJSbuUCOFff3jL+zg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmwvoUCyD1jzfv8yeFzpQGCfoS/Xt2RoHkjsMk+
 wTLhk2xixyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZsL6FAAKCRAEWL7uWMY5
 Rp8AD/9r70rHdpDFllqwkTcYqCbGI0NWBMbdytm9LSl5ERftI/jDs5GfFxUzypPyz6/cjMYNlGi
 WEG4n+yX23q/vqYIScj+3Xba+YySXAZTp4ZX9ajL9rQuqutHqcoBdpaXxoS/ntmqlyM1aP1SccM
 MguvNLRg1QwGyb0Ph7AOm9y4iwL1PmPDiMlXnsQ/VkTkGxeU1imRiCD8IBt4AnlxjgIFF/hxdjH
 dHQkWD/9Zaibooo29tzjO99fBkoCREx3EcFjAWVuHDJMf3yi8KXRbBrWIcolMplu3OuVXVRGfru
 uAWQnOO2Ht51oxf+Ze2zbq8cT1MJjYcs+IiffPRS/DpXejQE9p2+y1LKYd7r6ipe6KBKf5NaDQ3
 265v5ALE10me0yy+YzrPMtKmDiHmvb4cHL6r4YMXcK3ycvi6tkwSIRWHebC1go+LSkXX6nz6NfQ
 3DPCl1yAW9vmbCSGoI4fw6IVW+nJBfRM9QTgP0TzK74zphQfEiq1cCSrmA5BqqZ3uhJ0UVQtVkS
 X40vNLrfxxJb4xvijbWnYQ+zFSWsuAjATVgHkU+Ycce/xwBGCqUbDiLqoycQ0faFNBU2/7JPB9F
 ZWsUvDccFRFH3O2aMJuT7zSKmUPZ4RBZrPCHq/Dem1bX5WB5urINn5ZCApdcUqreIpTsTI/Wt81 h+wURc5aV7wbfLA==
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240801-kcfi-v2b-2-c93caed3d121@google.com>
Subject: [PATCH v2b] rust: cfi: add support for CFI_CLANG with Rust
From: Alice Ryhl <aliceryhl@google.com>
To: aliceryhl@google.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	kees@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	masahiroy@kernel.org, mmaurer@google.com, nathan@kernel.org, 
	nicolas@fjasle.eu, ojeda@kernel.org, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"

From: Matthew Maurer <mmaurer@google.com>

Make it possible to use the Control Flow Integrity (CFI) sanitizer when
Rust is enabled. Enabling CFI with Rust requires that CFI is configured
to normalize integer types so that all integer types of the same size
and signedness are compatible under CFI.

Rust and C use the same LLVM backend for code generation, so Rust KCFI
is compatible with the KCFI used in the kernel for C. In the case of
FineIBT, CFI also depends on -Zpatchable-function-entry for rewriting
the function prolouge, so we set that flag for Rust as well. The flag
for FineIBT requires rustc 1.80.0 or later, so include a Kconfig
requirement for that.

Enabling Rust will select CFI_ICALL_NORMALIZE_INTEGERS because the flag
is required to use Rust with CFI. Using select rather than `depends on`
avoids the case where Rust is not visible in menuconfig due to
CFI_ICALL_NORMALIZE_INTEGERS not being enabled. One disadvantage of
select is that RUST must `depends on` all of the things that
CFI_ICALL_NORMALIZE_INTEGERS depends on to avoid invalid configurations.

Alice has been using KCFI on her phone for several months, so it is
reasonably well tested on arm64.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This is an alternate version that shows how to resolve the conflict with
the "rust: fix export of bss symbols" patch [1].

As for the conflict with the KASAN patchset [2], it should be resolved
by adding both strings to the supported-sanitizers list in sorted order.

[1]: https://lore.kernel.org/r/20240815074519.2684107-2-nmi@metaspace.dk
[2]: https://lore.kernel.org/r/20240812232910.2026387-1-mmaurer@google.com

 Makefile                        | 7 +++++++
 arch/x86/Makefile               | 4 ++++
 init/Kconfig                    | 4 +++-
 rust/Makefile                   | 2 +-
 scripts/generate_rust_target.rs | 1 +
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 484c6900337e..2dc39a23005d 100644
--- a/Makefile
+++ b/Makefile
@@ -955,6 +955,13 @@ CC_FLAGS_CFI	:= -fsanitize=kcfi
 ifdef CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
 	CC_FLAGS_CFI	+= -fsanitize-cfi-icall-experimental-normalize-integers
 endif
+ifdef CONFIG_RUST
+	# Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST selects
+	# CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
+	RUSTC_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers
+	KBUILD_RUSTFLAGS += $(RUSTC_FLAGS_CFI)
+	export RUSTC_FLAGS_CFI
+endif
 KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
 export CC_FLAGS_CFI
 endif
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 801fd85c3ef6..e9b2ee3c8a71 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -237,6 +237,10 @@ ifdef CONFIG_CALL_PADDING
 PADDING_CFLAGS := -fpatchable-function-entry=$(CONFIG_FUNCTION_PADDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
 KBUILD_CFLAGS += $(PADDING_CFLAGS)
 export PADDING_CFLAGS
+
+PADDING_RUSTFLAGS := -Zpatchable-function-entry=$(CONFIG_FUNCTION_PADDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
+KBUILD_RUSTFLAGS += $(PADDING_RUSTFLAGS)
+export PADDING_RUSTFLAGS
 endif
 
 KBUILD_LDFLAGS += -m elf_$(UTS_MACHINE)
diff --git a/init/Kconfig b/init/Kconfig
index b0238c4b6e79..306af56a22df 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1905,11 +1905,13 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !CFI_CLANG
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
+	depends on !CFI_CLANG || RUSTC_VERSION >= 107900 && $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
+	select CFI_ICALL_NORMALIZE_INTEGERS if CFI_CLANG
+	depends on !FINEIBT || RUSTC_VERSION >= 108000
 	help
 	  Enables Rust support in the kernel.
 
diff --git a/rust/Makefile b/rust/Makefile
index 26b16c036fe3..53a17d22f5cd 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -305,7 +305,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
 	$(NM) -p --defined-only $< \
-		| awk '/ (T|R|D|B) / {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
+		| awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index c31657380bf9..9b184099278a 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -192,6 +192,7 @@ fn main() {
         }
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
+        ts.push("supported-sanitizers", ["kcfi"]);
         ts.push("target-pointer-width", "64");
     } else if cfg.has("X86_32") {
         // This only works on UML, as i386 otherwise needs regparm support in rustc
-- 
2.46.0.184.g6999bdac58-goog


