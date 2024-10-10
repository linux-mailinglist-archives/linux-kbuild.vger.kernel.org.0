Return-Path: <linux-kbuild+bounces-4037-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A03998AD6
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 17:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AA1FB22739
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 14:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A461CDFC3;
	Thu, 10 Oct 2024 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjmW4+2l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6AF1CB50C;
	Thu, 10 Oct 2024 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570560; cv=none; b=nujsBTAtq1tNJaBV5KBHaKWpnOAwvaRh+4rxH4rifW8wlxESrGHbt9Q3rfQdcfKgfyVW7KWsiaL5lNBWJiHf1IULtgtcnHo76Dtb2HLdUw3Sr7gZochCT03BbhSUS6f2CvCfUdP+HSQKELsfo0VodBbaQ0pb7ITkmkbnxCA5YKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570560; c=relaxed/simple;
	bh=M1q4cJzDcG2JzTk2//OjAfMLHRUCU+K3iWmOSPHUUIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JM5Bvb3dPL8b/niVI2jgkekADGbv1PXvhM1/iNWwjnxzqtjugGh84+hKJ3j8EtzxjB2MwBAsnIVcsAxg7N9I8vSVisaNIeNjaye5Od8sSw90u6SZiuky5Yw4r/Ojmw/uU2C4kVBAKQmnjIygZXNnodrX4Lzl+pTGOqogv6uxHRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjmW4+2l; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71578c14972so627591a34.3;
        Thu, 10 Oct 2024 07:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728570557; x=1729175357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugrOkdE0cDFQJiTjtrCMxanM3TbJfhzWyPDY2EUayr8=;
        b=BjmW4+2lFbo26C5DZC4vPt6dlM4JNmbZASBUQW8j7rtlqieHv4LIOexyzYakPlxp45
         /yXi1HJrHos9OfYru3maUEjI91WTAUOGmtsH2m4VV01nkehnQb+EZghXjKCvQH8/wnVl
         adzd3BpaVZ9KdDtTNVojPixMuN8QGLEpTcOkZ7MnqRXXWVwzie8vKYZFzKVL/HDf/vJ/
         aTPlDKJKkPMgYkYUOWyqeRi4fCI+xjAvp52wFI9tmJEiP/2k/eVcAefCpfzAg9HIgGwK
         EfRegI/U81ulCfxv8lxa/GfGCDfRITHueF8Do9DPNRtUtyM9pzktx3aZ5n9yS9oBedjH
         axHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728570557; x=1729175357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugrOkdE0cDFQJiTjtrCMxanM3TbJfhzWyPDY2EUayr8=;
        b=veYWXPOmX+OlyV5q/rWBAdt41lhr4MGEtxpQHx7iKe1liWdy2PPGkbBCm3Q6wy9YnX
         4Bf4/75ddqMAjcx7pI8Cer7hWFM5s8qIdqZuNvJWIUbTS4dTudvD1leI8vYPX4dvWeLq
         hwmj0PoGME91MDQwL+RhfPFgyYLPBm1kBbLPEO/lHNWUwZ+EmBkQ6KBeSdPOxrIbfB70
         M+6cHQ76mhvjMxl1N5Ax1UezI3Jn46epDkMsgFxxhGsKv/GjW6LsunRRXM8j9//unAsv
         G3CQuTVc/XJ27XJMJcDePDOiLIucnMEqchi0IgvHA+mAs9ReB4W3ER5tIIPHIitVvL8T
         vP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuCBz9twWSnoidfOmkTIBBHRWZDOgS0GnVVmg71LZAtIG5jiq9i/mFFP0XbBwLop9xxItRmogrkL7TVFw=@vger.kernel.org, AJvYcCXDccZFhFAApWbDmTLgSZSGHYIfBxj42tDLFMruOJ/NPRu7RsGryRJgVcVE2XcGm+hOAa2i6VEM13/LL9ai@vger.kernel.org, AJvYcCXiOYn1mK7xPAgEdGWD0ctid1UQNBwgZvmTqC8omnmZ2HYoEhlOVemiCjYE2RYRy2Z159g0MjQLpzmo5LfpKPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvW1x7HrxM4AO6lLYVrXzwS5uWux6NWDV2KOt2W+2xaM8+XVXh
	2vfDUhSZPjgB3Q9tiw11wszbk1taoNQOHQyTGNdkgxzzSkUjfN9q
X-Google-Smtp-Source: AGHT+IFu+sMCnZlxeOycTGOqARnY2HpQttiubBHM0s5GS6J8IthGZPhQhgU5AY18DhKfHtgDwdHZYg==
X-Received: by 2002:a05:6359:5f8d:b0:1c2:f251:d36d with SMTP id e5c5f4694b2df-1c3081e6360mr147472855d.24.1728570556748;
        Thu, 10 Oct 2024 07:29:16 -0700 (PDT)
Received: from localhost.localdomain ([2620:10d:c091:600::1:e47b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b11497893bsm49765285a.107.2024.10.10.07.29.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Oct 2024 07:29:16 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Fiona Behrens <me@kloenk.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	=?UTF-8?q?=C3=8D=C3=B1igo=20Huguet?= <ihuguet@redhat.com>,
	Danny Lin <danny@kdrag0n.dev>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v5] rust: query the compiler for dylib path
Date: Thu, 10 Oct 2024 10:28:23 -0400
Message-ID: <20241010142833.98528-2-tamird@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com>
References: <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust proc-macro crates are loaded by the compiler at compile-time, so
are always dynamic libraries; on macOS, these artifacts get a .dylib
extension rather than .so.

Replace hardcoded paths ending in .so with paths obtained from the
compiler.

This allows the kernel to build with CONFIG_RUST=y on macOS.

Co-developed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
V4 -> V5: Added missing `shell` in rust/Makefile.
V3 -> V4: Added motivation. Added missing Signed-off-by.
V2 -> V3: Added .strip() to rustc output to remove errant newline.
V1 -> V2: De-duplicated and sorted imports. Changed Signed-off-by to
Co-developed-by.

 .gitignore                        |  1 +
 Makefile                          |  2 +-
 rust/Makefile                     | 21 ++++++++++++---------
 scripts/generate_rust_analyzer.py | 15 +++++++++++----
 4 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/.gitignore b/.gitignore
index a61e4778d011..088696a6a46a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -22,6 +22,7 @@
 *.dtb.S
 *.dtbo.S
 *.dwo
+*.dylib
 *.elf
 *.gcno
 *.gcda
diff --git a/Makefile b/Makefile
index a9e723cb0596..470e6f20c513 100644
--- a/Makefile
+++ b/Makefile
@@ -1513,7 +1513,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
 		  rpmbuild \
-		  rust/libmacros.so
+		  rust/libmacros.so rust/libmacros.dylib
 
 # clean - Delete most, but leave enough to build external modules
 #
diff --git a/rust/Makefile b/rust/Makefile
index 0856fd6bc610..2e9fd151fce4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -11,9 +11,6 @@ always-$(CONFIG_RUST) += exports_core_generated.h
 obj-$(CONFIG_RUST) += helpers/helpers.o
 CFLAGS_REMOVE_helpers/helpers.o = -Wmissing-prototypes -Wmissing-declarations
 
-always-$(CONFIG_RUST) += libmacros.so
-no-clean-files += libmacros.so
-
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
 obj-$(CONFIG_RUST) += alloc.o bindings.o kernel.o
 always-$(CONFIG_RUST) += exports_alloc_generated.h exports_helpers_generated.h \
@@ -36,9 +33,15 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
-# Avoids running `$(RUSTC)` for the sysroot when it may not be available.
+# Avoids running `$(RUSTC)` when it may not be available.
 ifdef CONFIG_RUST
 
+libmacros_name := $(shell $(RUSTC) --print file-names --crate-name macros --crate-type proc-macro - < /dev/null)
+libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
+
+always-$(CONFIG_RUST) += $(libmacros_name)
+no-clean-files += $(libmacros_name)
+
 # `$(rust_flags)` is passed in case the user added `--sysroot`.
 rustc_sysroot := $(shell MAKEFLAGS= $(RUSTC) $(rust_flags) --print sysroot)
 rustc_host_target := $(shell $(RUSTC) --version --verbose | grep -F 'host: ' | cut -d' ' -f2)
@@ -118,10 +121,10 @@ rustdoc-alloc: $(RUST_LIB_SRC)/alloc/src/lib.rs rustdoc-core rustdoc-compiler_bu
 	+$(call if_changed,rustdoc)
 
 rustdoc-kernel: private rustc_target_flags = --extern alloc \
-    --extern build_error --extern macros=$(objtree)/$(obj)/libmacros.so \
+    --extern build_error --extern macros=$(objtree)/$(obj)/$(libmacros_name) \
     --extern bindings --extern uapi
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-macros \
-    rustdoc-compiler_builtins rustdoc-alloc $(obj)/libmacros.so \
+    rustdoc-compiler_builtins rustdoc-alloc $(obj)/$(libmacros_name) \
     $(obj)/bindings.o FORCE
 	+$(call if_changed,rustdoc)
 
@@ -342,10 +345,10 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		-Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
-		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
+		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-$(obj)/libmacros.so: $(src)/macros/lib.rs FORCE
+$(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
@@ -424,7 +427,7 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
-    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 endif # CONFIG_RUST
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d2bc63cde8c6..04ff5b25b851 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -8,6 +8,7 @@ import json
 import logging
 import os
 import pathlib
+import subprocess
 import sys
 
 def args_crates_cfgs(cfgs):
@@ -35,8 +36,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     crates_cfgs = args_crates_cfgs(cfgs)
 
     def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
-        crates_indexes[display_name] = len(crates)
-        crates.append({
+        crate = {
             "display_name": display_name,
             "root_module": str(root_module),
             "is_workspace_member": is_workspace_member,
@@ -47,7 +47,15 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
             "env": {
                 "RUST_MODFILE": "This is only for rust-analyzer"
             }
-        })
+        }
+        if is_proc_macro:
+            proc_macro_dylib_name = subprocess.check_output(
+                [os.environ["RUSTC"], "--print", "file-names", "--crate-name", display_name, "--crate-type", "proc-macro", "-"],
+                stdin=subprocess.DEVNULL,
+            ).decode('utf-8').strip()
+            crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
+        crates_indexes[display_name] = len(crates)
+        crates.append(crate)
 
     # First, the ones in `rust/` since they are a bit special.
     append_crate(
@@ -77,7 +85,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         [],
         is_proc_macro=True,
     )
-    crates[-1]["proc_macro_dylib_path"] = f"{objtree}/rust/libmacros.so"
 
     append_crate(
         "build_error",
-- 
2.47.0


