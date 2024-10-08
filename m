Return-Path: <linux-kbuild+bounces-3985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA674995B25
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 00:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E7B1F23EED
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 22:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4429821BAF8;
	Tue,  8 Oct 2024 22:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImmB3Dbh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5221BAEB;
	Tue,  8 Oct 2024 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728427704; cv=none; b=Lyxwc90Z+ILoEyTX+TU9wOeT7ct/AyfVxOFVXDOXnDHdQcwAZQ2N1z8Vexty47Z6405gn3VeGCaG8d9kwFPjWzkpoxXPXahMky3xmUfY7lTXhMZaW+kD+cLTDyLSGZLRWiA2tpDrlNfQqZ5YWTpEvpZbaZmfJ6LJviOQlDCLIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728427704; c=relaxed/simple;
	bh=fZmiMWrnvEU7AtsBXF1xT3bij7HVz3rNHfdt0R1c6is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CK5yzx2OjI+cCK9WzHUHiw1K2HdEvMJbUalU1wELFF4dxdgO/WrmrtmAWF8XIG7N5XTu5GLYVrXKzuvppyHvHaWe3R5hmfuAqFvtnoMPo5Yq4UthkS/zks+0eUypxJbFaiDtILA8JK9HdJL64rx+F58OJkvSFTRYnX2PszkwQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImmB3Dbh; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7afe994d519so20974085a.0;
        Tue, 08 Oct 2024 15:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728427699; x=1729032499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izjsYK/zcMAv1lzo33rnDn/MQlO729XBJLAL6PlACzc=;
        b=ImmB3Dbh39Yg/notQoo0y2Wfd1Osy54h1ZU4ZIyZqilw7XSGobDoXh4/umXdGU57GL
         prfAmB5hqHBQq7vV1zjBNbE9VQLQhaeeqD5U4mknMwIqwYEudNpWoBOWSyppTh/f6IwP
         3NbegxOfJM1kq4tkgkSlS0/sGnX6HYXwWvj2OkKTR7I8ySQhWciuyuidicgsBp4dHYFf
         AHJes9LOF3gfC/868M8P6qsdRSW8jf8myjsfSLQ8UzwHqCJ38rESFEjuVAD1gnt26xGc
         GXIbdEG4QfAPDC+j4Iw4Kmtv4Y1Qy635/NE+liiYp6T8EBR4SyDKDm0QqeEA02UU7pTo
         cc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427699; x=1729032499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izjsYK/zcMAv1lzo33rnDn/MQlO729XBJLAL6PlACzc=;
        b=mbIStJyThENXfGCrRrHgqe+gFZV4LBiFsHjH61UT2WjT7f3N4KezFItbPcxpeXz3pr
         2/87g+NsQJ/JT6W0neEJeIKWVgbIVfoMgZY/TqdfXp/AbboTmPLkbmY4z1p/g+eHEDq4
         x6CgxKnd6ULxMJs66nuPr3yQfIVDXZBCiJDogs025Z4zT4xnWvUb9HC5UHx/8SC0R6tM
         X68C/5uf19ArFWL/RImWSUwgv/dEaE2xnRcuHfL3DP92II1yJeEt2qwrQvahRV05KAXO
         T+nXzI8ZUoi2jha5OvC2/RmiZOSfGausID7xCVyYvCJ4LJQaNRJKlnfTrrW3E1MjTDV5
         9eVg==
X-Forwarded-Encrypted: i=1; AJvYcCVKInqcjLQVBA5gRZmWwfOfkRWdEU1Fd8o1DBPyGqUKywjx9U8ZIAfHghRMmvJstj1zB4WcuXTBm1qsyHw=@vger.kernel.org, AJvYcCXI62fgkeGI8ZX3avf1uNY+XQ3O04PVBXr1pudPrYjrOxd1X9ZqBCuXarUwCIGmWOWrEXP22cVVKVVYdH7v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0y8sRRC/VOQ1rkO5cDFMHCyLawF45qeteBTPQL9s9vJIlUcra
	AKVHhAnO7eyxJl6+8Z0GIcdoCdq8PNDkdfIBA3TZQovBiWWAxnunMrKAciT4
X-Google-Smtp-Source: AGHT+IGXhK9Cg0i6JBJr1NS5o3nc52SVkPvomsn47NwVWnzgWY3Ix2lNPS/UeLBbWAVt4u2Ugb09fg==
X-Received: by 2002:a05:620a:2a06:b0:7b0:6e8:9506 with SMTP id af79cd13be357-7b0795536a1mr61356585a.60.1728427699416;
        Tue, 08 Oct 2024 15:48:19 -0700 (PDT)
Received: from Tamirs-MBP.mynetworksettings.com (pool-100-37-170-231.nycmny.fios.verizon.net. [100.37.170.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da763fdecsm40671001cf.84.2024.10.08.15.48.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Oct 2024 15:48:19 -0700 (PDT)
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
	"David S. Miller" <davem@davemloft.net>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	=?UTF-8?q?=C3=8D=C3=B1igo=20Huguet?= <ihuguet@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] rust: query the compiler for dylib path
Date: Tue,  8 Oct 2024 18:48:08 -0400
Message-ID: <20241008224810.84024-1-tamird@gmail.com>
X-Mailer: git-send-email 2.47.0
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

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 .gitignore                        |  1 +
 Makefile                          |  2 +-
 rust/Makefile                     | 21 ++++++++++++---------
 scripts/generate_rust_analyzer.py | 16 ++++++++++++----
 4 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/.gitignore b/.gitignore
index 56972adb5031..7cfe4f70b39a 100644
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
index c5493c0c0ca1..3808869fb95b 100644
--- a/Makefile
+++ b/Makefile
@@ -1506,7 +1506,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
 		  rpmbuild \
-		  rust/libmacros.so
+		  rust/libmacros.so rust/libmacros.dylib
 
 # clean - Delete most, but leave enough to build external modules
 #
diff --git a/rust/Makefile b/rust/Makefile
index b5e0a73b78f3..a185a4d05b08 100644
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
@@ -115,10 +118,10 @@ rustdoc-alloc: $(RUST_LIB_SRC)/alloc/src/lib.rs rustdoc-core rustdoc-compiler_bu
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
 
@@ -339,10 +342,10 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
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
@@ -421,7 +424,7 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
-    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 endif # CONFIG_RUST
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d2bc63cde8c6..3834ab0eea9d 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -9,6 +9,8 @@ import logging
 import os
 import pathlib
 import sys
+import os
+import subprocess
 
 def args_crates_cfgs(cfgs):
     crates_cfgs = {}
@@ -35,8 +37,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     crates_cfgs = args_crates_cfgs(cfgs)
 
     def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
-        crates_indexes[display_name] = len(crates)
-        crates.append({
+        crate = {
             "display_name": display_name,
             "root_module": str(root_module),
             "is_workspace_member": is_workspace_member,
@@ -47,7 +48,15 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
             "env": {
                 "RUST_MODFILE": "This is only for rust-analyzer"
             }
-        })
+        }
+        if is_proc_macro:
+            proc_macro_dylib_name = subprocess.check_output(
+                [os.environ["RUSTC"], "--print", "file-names", "--crate-name", display_name, "--crate-type", "proc-macro", "-"],
+                stdin=subprocess.DEVNULL,
+            ).decode('utf-8')
+            crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
+        crates_indexes[display_name] = len(crates)
+        crates.append(crate)
 
     # First, the ones in `rust/` since they are a bit special.
     append_crate(
@@ -77,7 +86,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         [],
         is_proc_macro=True,
     )
-    crates[-1]["proc_macro_dylib_path"] = f"{objtree}/rust/libmacros.so"
 
     append_crate(
         "build_error",
-- 
2.47.0


