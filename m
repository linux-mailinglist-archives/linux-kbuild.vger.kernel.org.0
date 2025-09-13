Return-Path: <linux-kbuild+bounces-8814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B873DB5602B
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Sep 2025 12:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0B68586999
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Sep 2025 10:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD77D2EF64B;
	Sat, 13 Sep 2025 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="QHMo6+At"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward203a.mail.yandex.net (forward203a.mail.yandex.net [178.154.239.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332512ECEA2;
	Sat, 13 Sep 2025 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757758545; cv=none; b=uCubWkgH8NoO/rDlfjnqW5gBCnl4AF3cDv+GJxYMYX6eht6TDZCacLdiX9vTS9cbwd1ZjaHefP5OsfPzgq79vCQH5B7s+L0+MizDmwSQ+oeuzit85ioq10YInT/oO27zxZajnyPLOzolMpCSTUnetSPWqoyqpZz9ze4/CWZM4xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757758545; c=relaxed/simple;
	bh=Iu/swEEmB+Hs6I3zaqr+oRhAxneTgXl2/QFiCMoPzWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l6kUroA3xLQfj7XuP1YgmZm+HqyyLgrc2+GNEiXDSuQia/bt5/T+RevBULungZAys6UgmiSJCUUldKojADH78QecHJ6JshYcpJnStP0dl8VLPUAY8hjMyER7zGUEJRyBhT9jvWQqjEmnykKCMAp/KeduiKnAaLVouZf20JDW16I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=QHMo6+At; arc=none smtp.client-ip=178.154.239.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward203a.mail.yandex.net (Yandex) with ESMTPS id 80E2F8380E;
	Sat, 13 Sep 2025 13:09:13 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 183E2C0046;
	Sat, 13 Sep 2025 13:09:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id n8KYH8YM1uQ0-IgjFTvHA;
	Sat, 13 Sep 2025 13:09:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1757758143;
	bh=RxGtxuRaOTbPlyv3ZnfRyKDs4haKMxkeGyP//DyFOJo=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=QHMo6+AtP8s3KBHYRw1ZFGvjFLGFI+6vMA+ORwwdNlNK2M4Sv+5dD7WRMrM2hqlcC
	 Hsm1FHBmLowkZqMrTcEG+oKVM4a9YoikVPBOcwrenlWpd7Hl1ctKZPkpjljMN4D0t0
	 pJNLk23q6fyTh8wiQ0jp3Rqhx0iEwzCoQYPR19kc=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	masahiroy@kernel.org,
	aliceryhl@google.com,
	thomas.weissschuh@linutronix.de,
	tamird@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: add `rustcheck` make target for check-only builds
Date: Sat, 13 Sep 2025 13:08:47 +0300
Message-ID: <20250913100847.9234-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds a new `rustcheck` make target to run a check-only build
similar to `cargo check`. This allows us to verify that the Rust
sources can build without building/linking final artifacts,
which speeds up the iteration (a lot) during development.

The target supports the same flags as other Rust build rules, so
it can also be used with `CLIPPY=1` (e.g., `make LLVM=1 rustcheck
CLIPPY=1) to run Clippy in a faster way.

Also, unlike `make LLVM=1`, it doesn't compile large amounts of C
code (on a fresh checkout) when the goal is only to check that
Rust builds are not broken after some changes.

Suggested-by: Benno Losin <lossin@kernel.org>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/539103602
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 Makefile      |  7 +++++
 rust/Makefile | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/Makefile b/Makefile
index cf37b9407821..7812cdc72938 100644
--- a/Makefile
+++ b/Makefile
@@ -1716,6 +1716,8 @@ help:
 	@echo  '		    is formatted, printing a diff otherwise.'
 	@echo  '  rustdoc	  - Generate Rust documentation'
 	@echo  '		    (requires kernel .config)'
+	@echo  '  rustcheck       - Check that the Rust code builds'
+	@echo  '                    (requires kernel .config)'
 	@echo  '  rusttest        - Runs the Rust tests'
 	@echo  '                    (requires kernel .config; downloads external repos)'
 	@echo  '  rust-analyzer	  - Generate rust-project.json rust-analyzer support file'
@@ -1821,6 +1823,11 @@ PHONY += rustdoc
 rustdoc: prepare
 	$(Q)$(MAKE) $(build)=rust $@
 
+# Checking Rust sources.
+PHONY += rustcheck
+rustcheck: prepare0
+	$(Q)$(MAKE) $(build)=rust $@
+
 # Testing target
 PHONY += rusttest
 rusttest: prepare
diff --git a/rust/Makefile b/rust/Makefile
index bfa915b0e588..c148ef4a8c08 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -265,6 +265,79 @@ rusttest-kernel: $(src)/kernel/lib.rs rusttestlib-ffi rusttestlib-kernel \
     rusttestlib-uapi rusttestlib-pin_init FORCE
 	+$(call if_changed,rustc_test)
 
+## Check-only compilation (similar to `cargo check`)
+quiet_cmd_rustc_check_library = $(RUSTC_OR_CLIPPY_QUIET) CHECK $<
+      cmd_rustc_check_library = \
+        OBJTREE=$(abspath $(objtree)) \
+        $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+                @$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
+                --crate-type $(if $(rustc_check_library_proc),proc-macro,rlib) \
+                $(if $(rustc_check_library_proc),,--emit=metadata) \
+                --out-dir $(objtree)/$(obj)/check -L$(objtree)/$(obj)/check \
+                --crate-name $(if $(rustc_check_crate_name),$(rustc_check_crate_name), \
+				$(subst rustcheck-,,$(subst rustchecklib-,,$@))) $<
+
+rustcheck: rustchecklib-build_error rustchecklib-ffi rustchecklib-macros \
+	rustchecklib-compiler_builtins rustchecklib-pin_init_internal \
+	rustchecklib-pin_init rustchecklib-bindings rustchecklib-uapi \
+	rustchecklib-kernel
+
+rustchecklib-build_error: $(src)/build_error.rs FORCE
+	+$(call if_changed,rustc_check_library)
+
+rustchecklib-ffi: $(src)/ffi.rs FORCE
+	+$(call if_changed,rustc_check_library)
+
+rustchecklib-macros: private rustc_target_flags = --extern proc_macro
+rustchecklib-macros: private rustc_check_library_proc = yes
+rustchecklib-macros: $(src)/macros/lib.rs FORCE
+	+$(call if_changed,rustc_check_library)
+
+rustchecklib-compiler_builtins: private rustc_check_crate_name = compiler_builtins_kernel
+rustchecklib-compiler_builtins: $(src)/compiler_builtins.rs FORCE
+	+$(call if_changed,rustc_check_library)
+
+rustchecklib-pin_init_internal: private rustc_target_flags = --cfg kernel \
+	--extern proc_macro
+rustchecklib-pin_init_internal: private rustc_check_library_proc = yes
+rustchecklib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
+	+$(call if_changed,rustc_check_library)
+
+rustchecklib-pin_init: private rustc_target_flags = --extern pin_init_internal \
+	--extern macros --cfg kernel
+rustchecklib-pin_init: $(src)/pin-init/src/lib.rs rustchecklib-macros \
+	rustchecklib-pin_init_internal FORCE
+	+$(call if_changed,rustc_check_library)
+
+rustchecklib-bindings: private rustc_target_flags = --extern ffi
+rustchecklib-bindings: $(src)/bindings/lib.rs \
+    $(obj)/bindings/bindings_generated.rs \
+    $(obj)/bindings/bindings_helpers_generated.rs \
+    rustchecklib-ffi FORCE
+	+$(call if_changed,rustc_check_library)
+
+rustchecklib-uapi: private rustc_target_flags = --extern ffi
+rustchecklib-uapi: $(src)/uapi/lib.rs $(obj)/uapi/uapi_generated.rs \
+    rustchecklib-ffi FORCE
+	+$(call if_changed,rustc_check_library)
+
+ifdef CONFIG_JUMP_LABEL
+rustchecklib-kernel: $(obj)/kernel/generated_arch_static_branch_asm.rs FORCE
+endif
+ifndef CONFIG_UML
+ifdef CONFIG_BUG
+rustchecklib-kernel: $(obj)/kernel/generated_arch_warn_asm.rs \
+	$(obj)/kernel/generated_arch_reachable_asm.rs FORCE
+endif
+endif
+
+rustchecklib-kernel: private rustc_target_flags = --extern ffi --extern pin_init \
+	--extern build_error --extern macros --extern bindings --extern uapi
+rustchecklib-kernel: $(src)/kernel/lib.rs rustchecklib-ffi rustchecklib-pin_init \
+	rustchecklib-build_error rustchecklib-macros rustchecklib-bindings \
+	rustchecklib-uapi FORCE
+	+$(call if_changed,rustc_check_library)
+
 ifdef CONFIG_CC_IS_CLANG
 bindgen_c_flags = $(c_flags)
 else
-- 
2.51.0


