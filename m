Return-Path: <linux-kbuild+bounces-5155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E7F9F350E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 16:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8AF81889EAA
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 15:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893A61494C9;
	Mon, 16 Dec 2024 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUrinMkA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15802148FF0;
	Mon, 16 Dec 2024 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364473; cv=none; b=pBsejjEnAGX+yz5mJC+J6kNI3ZxKY1A4ocWpN/p8TeytpvI112rXrL+F5PqHh6+PCnqE+KJ2aG9YVaskQ2Hr8spS7xLX9yzax7SHmLSBRH/9Qgur9KOcpIZB9LIoflf7nlWMEnN6Uu5yqct5DqQAm+89bNysrvOAYO1H90mc3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364473; c=relaxed/simple;
	bh=+83zYRMAF/jP5mKQ7uCW/L+urZDiVwytg7d/dmrTXTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UrUuDUoIseuzLYwhm4r3szoHu1nUkJYk/ocDPq2XzZEb+KrQX4TxgljW98xS9POKJ+WuLsPZV2flwRv046kQXHeKnmEgFP9AWGaYSvBoNcSJR08QHjv932Z8a/SxdNrNy7v94Av+DvdWtjG4c1ifiIlvBt+x9jn9+kSx6q4VbGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUrinMkA; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4678cce3d60so46814961cf.2;
        Mon, 16 Dec 2024 07:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734364470; x=1734969270; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pTggA1bnHvpEMfZwgK1APAxN2uONgVxmwIsfS4Q5qnk=;
        b=QUrinMkAUvoBVCa42wYumz/SvBBVzANvuEORrG/AgA0ozE3tWFQz4inSwaSf2d39gk
         zlKf/69/GxvnWhqARMRo6G0qmSbmeSDpx/tNv1P0iYsfhjeSXdDZkYWUT9PdWaq6pXiA
         6QikX9s7Dwrvwy7F3IjUJpBGEqOL+H4azgJCynim6wuZiVOUlTrEq4eFKaGN9Db78H+R
         NEy9P+dF7PeLaXpsBqCU9DkVcLX56GD4+gv/umHsHsbbAObRTofDofvcc744eIJg+zzR
         mG+echork03XUhbRXrrcg8qHYNhweXx1fGUXDXh/LfXHeTnoyjIhzeFulUncEB6Sx0hy
         XgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364470; x=1734969270;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTggA1bnHvpEMfZwgK1APAxN2uONgVxmwIsfS4Q5qnk=;
        b=dvXnh6VMaVSoZPxFUFb1yCKEvwh9/c0bgkSJmdfHckvXl2uVKFcG8TSdOoTZtN9i/V
         GPRNJm+8oEgKBARe9ag6wGPTSyd6JMEn08eRyuObfo+oGcTHiJUoF6u+daSNlNzPeqbz
         EmOPSauL2qCksy+Lq42BsSdJ2JMczyn7uVmldL7NgnWtwDQWoM1XTJIgzijTRYMArphr
         F/isWmmGLXn4bGuxwBOmrgyDF2fRAwQWKLTwVQJcxC/yOEe3Yrht22m/ndj1fdmDYh6j
         qZcN8AeJFSPg6ljUd4RfDMSIiVTPjdEqnxsHNdDZW96c3KgbyWr+a+g32gcP8rYnKK2e
         oQ5w==
X-Forwarded-Encrypted: i=1; AJvYcCVsICnlZMKuRSe4DySej2Qo7FzHO1zHlkn1N+pEA2ypZnF5nUU6BicsYYL1yBFkEMPqcPETaaNQFB+SPVw=@vger.kernel.org, AJvYcCXPd8Id0eq+Xup+XOHhhBUAiqgSEAElS0odqqemRynlnBALa5kDy0rwdwA2qnCAzfy6EfEnlhmnOL3AwAkrQdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu5cIM5VCjTeLDuLjppMODsezz5//T4VxvgCtIc+YXIFdnipk3
	aSfQeo+IV7axlelBn0ooJCovqbI7OAKEgn59ts7GV1DZcPqplPeL
X-Gm-Gg: ASbGncviuUHaVkpFT+Nsa8CY5Z323Ks3vHXKIJwQkpiWWAQ67gm7ElkksiSl1HQHUFK
	61zm0Mq6mPw3w5RUh/8Z7NhwvbpedzP0yV7CnKDsUmEYVSdCOzGdaKv8vlhTMbNZ3Qm0TH0vcMw
	HYvwx5V0asAyU0jYZyiUoifxNKzCq/3EPJWFrLIEwnARWo/1Ws5RxovI7u6/CsMYbICREXxOuVw
	3rBo6GQQDQE1LpwbcXeU1yBwnddEzO3DsReIZlqrN2DDaHbSgeCwdxmvLtrcead/E1EJoe2CSCH
	WmD+PMrbQKULGUMMXC0I105Gf5WLLlxtWdNEECR/ucTkjiW60iucD/jsWXSn
X-Google-Smtp-Source: AGHT+IGR/JnsvSK+RMw7qH/LPKg98weEdrCbFDB7uG5WpOwgIJbT98+V7unB8Q5oKguCG1wzxqoWQA==
X-Received: by 2002:a05:622a:1181:b0:45f:bc9e:c69c with SMTP id d75a77b69052e-467a57192dbmr188075641cf.7.1734364469722;
        Mon, 16 Dec 2024 07:54:29 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:7214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e8195csm29030611cf.57.2024.12.16.07.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:54:28 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 16 Dec 2024 10:54:22 -0500
Subject: [PATCH v7] rust: use host dylib naming convention
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-b4-dylib-host-macos-v7-1-cfc507681447@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC1NYGcC/33OvQ6DIBiF4VtpmPsZoPhDp95H4wCI8iUiDRhTY
 7z3opNTx3c4T85Gko1oE3neNhLtggnDlKO+34hxahosYJebcMoFo6wCLaBbR9TgQprBKxMSsKo
 ua/MoqRaS5OUn2h6/p/puc/cxeJhdtOpi0YZz0TBaNCI3MJiVx9i9Bq9wLEzwh+QwzSGu572lO
 rz/T5YqQ1pbpUvKJZPywrX7vv8A0zjbb/AAAAA=
X-Change-ID: 20241016-b4-dylib-host-macos-16757c350b49
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
 Fiona Behrens <me@kloenk.dev>, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Because the `macros` crate exposes procedural macros, it must be
compiled as a dynamic library (so it can be loaded by the compiler at
compile-time).

Before this change the resulting artifact was always named
`libmacros.so`, which works on hosts where this matches the naming
convention for dynamic libraries. However the proper name on macOS would
be `libmacros.dylib`.

This turns out to matter even when the dependency is passed with a path
(`--extern macros=path/to/libmacros.so` rather than `--extern macros`)
because rustc uses the file name to infer the type of the library (see
link). This is because there's no way to specify both the path to and
the type of the external library via CLI flags. The compiler could
speculatively parse the file to determine its type, but it does not do
so today.

This means that libraries that match neither rustc's naming convention
for static libraries nor the platform's naming convention for dynamic
libraries are *rejected*.

The only solution I've found is to follow the host platform's naming
convention. This patch does that by querying the compiler to determine
the appropriate name for the artifact. This allows the kernel to build
with CONFIG_RUST=y on macOS.

Link: https://github.com/rust-lang/rust/blob/d829780/compiler/rustc_metadata/src/locator.rs#L728-L752
Tested-by: Daniel Gomez <da.gomez@samsung.com>
Co-developed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v7:
- Rebase on d072acda4862 ("rust: use custom FFI integer types") [0]
- Link: https://lore.kernel.org/all/20240913213041.395655-4-gary@garyguo.net/ [0]
- Link to v6: https://lore.kernel.org/r/20241016-b4-dylib-host-macos-v6-1-bbeab5029199@gmail.com

Changes in V6: Removed setting `no-clean-files`. Rewrote description.

Changes in V5: Added missing `shell` in rust/Makefile.

Changes in V4: Added motivation. Added missing Signed-off-by.

Changes in V3: Added .strip() to rustc output to remove errant newline.

Changes in V2:
- De-duplicated and sorted imports.
- Changed Signed-off-by to Co-developed-by.
---
 .gitignore                        |  1 +
 Makefile                          |  2 +-
 rust/Makefile                     | 20 +++++++++++---------
 scripts/generate_rust_analyzer.py | 15 +++++++++++----
 4 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/.gitignore b/.gitignore
index 6839cf84acda0d2d3c236a2e42b0cb0fe1b14965..5937c74d3dc1e4ca56d93ea0b8d5ff9fc64ec839 100644
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
index e5b8a8832c0caa16fa05159611dc2529066095c1..80d9943d9744f8288d3fc88bed8213988b0d15c2 100644
--- a/Makefile
+++ b/Makefile
@@ -1571,7 +1571,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
 		  rpmbuild \
-		  rust/libmacros.so
+		  rust/libmacros.so rust/libmacros.dylib
 
 # clean - Delete most, but leave enough to build external modules
 #
diff --git a/rust/Makefile b/rust/Makefile
index a40a3936126d603836e0ec9b42a1285916b60e45..c95d7294f4425a7875a177d005bf0b28d0a9cfb2 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -11,9 +11,6 @@ always-$(CONFIG_RUST) += exports_core_generated.h
 obj-$(CONFIG_RUST) += helpers/helpers.o
 CFLAGS_REMOVE_helpers/helpers.o = -Wmissing-prototypes -Wmissing-declarations
 
-always-$(CONFIG_RUST) += libmacros.so
-no-clean-files += libmacros.so
-
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
 obj-$(CONFIG_RUST) += bindings.o kernel.o
 always-$(CONFIG_RUST) += exports_helpers_generated.h \
@@ -38,9 +35,14 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
 
-# Avoids running `$(RUSTC)` for the sysroot when it may not be available.
+# Avoids running `$(RUSTC)` when it may not be available.
 ifdef CONFIG_RUST
 
+libmacros_name := $(shell $(RUSTC) --print file-names --crate-name macros --crate-type proc-macro - < /dev/null)
+libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
+
+always-$(CONFIG_RUST) += $(libmacros_name)
+
 # `$(rust_flags)` is passed in case the user added `--sysroot`.
 rustc_sysroot := $(shell MAKEFLAGS= $(RUSTC) $(rust_flags) --print sysroot)
 rustc_host_target := $(shell $(RUSTC) --version --verbose | grep -F 'host: ' | cut -d' ' -f2)
@@ -109,10 +111,10 @@ rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-kernel: private rustc_target_flags = --extern ffi \
-    --extern build_error --extern macros=$(objtree)/$(obj)/libmacros.so \
+    --extern build_error --extern macros \
     --extern bindings --extern uapi
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-ffi rustdoc-macros \
-    rustdoc-compiler_builtins $(obj)/libmacros.so \
+    rustdoc-compiler_builtins $(obj)/$(libmacros_name) \
     $(obj)/bindings.o FORCE
 	+$(call if_changed,rustdoc)
 
@@ -362,10 +364,10 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
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
@@ -443,7 +445,7 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 $(obj)/kernel.o: private rustc_target_flags = --extern ffi \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
-    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 ifdef CONFIG_JUMP_LABEL
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 09e1d166d8d236fcf8c2b2375624b243ebf6e7f7..aa8ea1a4dbe5f9037c8c231d87ddc8d95c297f12 100755
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
@@ -70,7 +78,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         [],
         is_proc_macro=True,
     )
-    crates[-1]["proc_macro_dylib_path"] = f"{objtree}/rust/libmacros.so"
 
     append_crate(
         "build_error",

---
base-commit: 92797e9898f1093641b5b28f6cf5f12da3448a45
change-id: 20241016-b4-dylib-host-macos-16757c350b49

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


