Return-Path: <linux-kbuild+bounces-4010-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F12996E21
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 16:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92600B21D79
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FBF51C4A;
	Wed,  9 Oct 2024 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJBRMXqC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D054126BF1;
	Wed,  9 Oct 2024 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484483; cv=none; b=FrlaTEWZihAkLdnEIh7iwtQBffVZTF+r92FvDA/RuKduaSt9WyR8bRmKAodzGFfqmRMqkVj14s2gjKbTtWyDK6+D6jY6RP3gRsvj6pmgmwMLsrJFFPOreqyihUZL7vaWVKv4HE1dTeS+v8i8hoG9Yo73/g/Um4+i0pn3D5i2tkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484483; c=relaxed/simple;
	bh=7c8gEB50w0/252V8mh0s6JifNpaNfzrvHypAywEgpf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7KXLRFgFSV4s9TyRkY3BrUoFgaPtIBXD4nH7RDCAGuHHRdzB5QXCVHYkIE68FdxLlFEd2XiEZH2SZMp/5/7zyPcnpx/bwxuBbOdebipMGNOukE+eg/1A3o2AMHX/B8GBUl0UFIqZNKfoHsH+zf47udZH011tFc71gwEuJmwtnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJBRMXqC; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7afc592ca19so117959285a.1;
        Wed, 09 Oct 2024 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728484480; x=1729089280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYvTTh3ATKWJOexUuHMRYzN6+ScC1tH/4+UEFE+ph4g=;
        b=aJBRMXqCDWRAXzYVFCBgDyguuRtmTH/PDUH4nU9TYNkD1VmcdqpKGvJKtPmYY2q0GG
         nyCeIO7SeDF2gm2RE7T4uQx4odzZzdygenqFxuplyLSVJYXFjUFQHt9nKPH8aH3Z2Nhu
         SHDSA01EeezjCZlqmKyXuI/b7s6EXTxWO4Rml4/LMyajM69vlccfrFAb5Nk+FvViwZQR
         3v+3e6VCQR9mi7yE1o1Eihqoc4tgjIFRyuO/ODMgWCw1rCtUHGaGwgj6GOTZbys0PtM1
         oCX2VbRNHAaBzZL2KWMXM5dFzOIVRESsv2nJbdn+txx43sDFF6vytPS+kYTwVt/fdNjr
         M0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728484480; x=1729089280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYvTTh3ATKWJOexUuHMRYzN6+ScC1tH/4+UEFE+ph4g=;
        b=s4eC6I4bHz+3HCeZKcYzv+FcbV1dUm+9yOXN7SisqVQG35FPcBSmEM1i9nyOjJFRzN
         xSVR1PO0m86l+9QgsB4Cgy6fCTWCf7Mw3KrwFIqrVxrRi1GyY3pEZMpbPI7iUiw2t12x
         RddymHghXzz6I7QabmAHd8IEyaoLzyLyBn9CyrCZ2anZBvh72rXuRQRXtx0OPrXLT1NM
         sp3d74jeH6oTrm9NU6OLNzJxLlDarpMT5puwGFgv/ljHP/JYj04vxD14/a4uUIDKREtc
         MV84gzlVUQOz5wh6qoQjr78ofJkD9JWKr6fIgYT+tChD/v5pNylZ0SLoFkvg4sV5gTlz
         MqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1H2fpPWYD1rSSW7z/zsdUAN7yQYcWq7J7R6EkWUwWj1WO6cTZxcRji7p2xCxumPRIJP4WJ5GUMn5JcLs=@vger.kernel.org, AJvYcCXxm4BGvPdA9rKJo/wlb4cl6XgTRy5WV+GNr7+fp7Q01BD5IQfVwufQd3F8EVeuCXBdtRhL/Ldhhxk5KrYh@vger.kernel.org
X-Gm-Message-State: AOJu0YwdLuxuMscbR4XRwY4duIXpn64mr2wRxkvIpEhQe5YhDtXsBa+j
	B2PPmGvDR15wAIUTJYTihhPG28eUjQK4w1nN9Np5xkusrHTfhqr9u27wy45M
X-Google-Smtp-Source: AGHT+IG5RPqj6gZKuFlLT24dUR6WuriG1+zrXDTP8sWzVBrqMGv08Q43bbdZNKOrDw2B6g7L4to/ig==
X-Received: by 2002:a05:620a:c4a:b0:7a9:a7b4:57f1 with SMTP id af79cd13be357-7b0874cbe8emr432369485a.59.1728484480402;
        Wed, 09 Oct 2024 07:34:40 -0700 (PDT)
Received: from localhost.localdomain ([2620:10d:c091:600::1:6bd1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7afce7a2bc0sm120989785a.61.2024.10.09.07.34.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Oct 2024 07:34:39 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Tamir Duberstein <tamird@gmail.com>,
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
	Chuck Lever <chuck.lever@oracle.com>,
	=?UTF-8?q?=C3=8D=C3=B1igo=20Huguet?= <ihuguet@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v4] rust: query the compiler for dylib path
Date: Wed,  9 Oct 2024 10:33:00 -0400
Message-ID: <20241009143301.6006-2-tamird@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <CANiq72mS8F98WRsuc82Co6zyw1eYSGSQmr0brGwSkq-Zy4qivA@mail.gmail.com>
References: <CANiq72mS8F98WRsuc82Co6zyw1eYSGSQmr0brGwSkq-Zy4qivA@mail.gmail.com>
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
index 0856fd6bc610..94ae550ae8b3 100644
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
 
+libmacros_name := $($(RUSTC) --print file-names --crate-name macros --crate-type proc-macro - < /dev/null)
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


