Return-Path: <linux-kbuild+bounces-4007-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2F996D64
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 16:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C4F4285A12
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F50193073;
	Wed,  9 Oct 2024 14:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALgkL42W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104CD224DC;
	Wed,  9 Oct 2024 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483396; cv=none; b=ffb9HUugidRh/+4ua7f+CADF2AZgzshiBD0vsqgwyyxrR4T3UiLKof07C/YwkTMPbN2E9JfeYyA83ZwQWhOpj2srxf7IcLZE3hIlAdQL9iN7PgEUH0pH+/fl+BJj/4nnLWycZ8DRHZFTEODKNTdRmvxE3n7RgjukwqkxOiPii2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483396; c=relaxed/simple;
	bh=IK1OLhrx9tWJZ2BzoLbXXEsFYlGdVp5fhAhRBn0gU2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uoiy+EclAqnrnAg82nCPNlvkmrnp51CFHuU1C1ZYTgCBsehBtA8abqV4CCZaIXq8oe4KFrq5GX9BemFEKretGuP9tnw2ZszoNJUJSYA7g28Cw8WzXG7GfbHjWhQVHxYXKQozVk4QOaG2iZbkRnGWC0ezWW90FrkoVHfpbqNfBeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALgkL42W; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cbcd8ce5f9so4287356d6.2;
        Wed, 09 Oct 2024 07:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728483392; x=1729088192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwUJ5xd0Av6g1K9sahKQhjBzI47UHsFOKCYr26Xj2dI=;
        b=ALgkL42WMNqMRc1pWq1JqbtqaYmC7bakScHYAUNMCvyJSAbJmEJIgS1dTIioMgf2uK
         GwKAwgHcvJPb/a6BGQdbfPwjoTDO6Rnizsy5X+sbMcA8ADEsHblPs1RGijyOD9YSADBn
         7T1hSoYRjNBK2O0jdcLwUVkYyLMO86JJsPdnImDUJV3nsN7h6R1qZwsYe4dqFdcjVh+2
         TlWtf+R9y20GNv8Uo+l+G8JAcQKTw359pWhYSF1oDvGWVFuBphfKypPtOnEOXPuQC5AK
         VsXKefAcPtZXfwQrnZwmlMZQibxajmYRUeffiTkmCTvHMRjx1zny0eXSczU06PcuNhV6
         ddHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728483392; x=1729088192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwUJ5xd0Av6g1K9sahKQhjBzI47UHsFOKCYr26Xj2dI=;
        b=dkKVG9K1qMi6bGUP+VZ3nSCU9UQ9/M7bYKogM5zHK6c675Goswz2823+HfaYH9vQz5
         fazUYFk3tnoSh9jcKnnyGQ5JTrzJbOZ3YnHada0jYrO3n7GTzxGbRaq0bwHbYSbwuWVq
         k5BS+KTLGxlUXTSuM1Eqw9HvmV6XuDdtswol7LEDuKZrsazOvpVGlvSJ+z5GsVRd1VE4
         0t9LsMMk3oxH8B9OL86VmqTsRmCuU/8QSN7CDmBHTSgd4ieMqE7Tm+XMp9fVjbNXaFV9
         h8YeBPYn4oetR5C5Wb2bOrllf+QEBMgf5CzXE3cUeqb9lpfCtXpiy4ti2KJxsBOBue5O
         9uiA==
X-Forwarded-Encrypted: i=1; AJvYcCWCaD1sh+VdsQ12Dd+Csrpza8mCnPfu4rut1QJszyWNfrcqNVIjG1n5pbXjKaRPREQQ5Oi6ETV2+kn/nq97@vger.kernel.org, AJvYcCWiLL6MYZxI4wcKDE7apQL956RvvX9NK2+vAbLSiPWfEZVRAQ8Mvk865KUw9EJCzXx2pzRJO/PG+reTrRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqF7+DXZiNSwmkkq7M1oWzgGbgVRa4llLLV+oGsj4SXRp4RtGu
	4ns9ddaWKHwfZvu1an2yhFTmZfg3xG36hcoePZg7/Rn0XmdMKXAE+RssME8F
X-Google-Smtp-Source: AGHT+IHmRmowFBDuaTzkupq9utWVBF1+SBX3+EQOOv8UysqXyYt/E8MCpInfQo0leZlNn7EIqjk/Dw==
X-Received: by 2002:a05:6214:449d:b0:6cb:61b0:fa4f with SMTP id 6a1803df08f44-6cbc92ea508mr47314606d6.6.1728483392351;
        Wed, 09 Oct 2024 07:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2620:10d:c091:600::1:6bd1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbc7b81fe9sm10769686d6.64.2024.10.09.07.16.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Oct 2024 07:16:31 -0700 (PDT)
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
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Allison Henderson <allison.henderson@oracle.com>,
	=?UTF-8?q?=C3=8D=C3=B1igo=20Huguet?= <ihuguet@redhat.com>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3] rust: query the compiler for dylib path
Date: Wed,  9 Oct 2024 10:07:49 -0400
Message-ID: <20241009140750.3356-2-tamird@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <CAJ-ks9neMso9pL_LPOeOwLGZG7Wy9RxV-ixKsDv=Wfzy7yKVBA@mail.gmail.com>
References: <CAJ-ks9neMso9pL_LPOeOwLGZG7Wy9RxV-ixKsDv=Wfzy7yKVBA@mail.gmail.com>
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

Co-developed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
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


