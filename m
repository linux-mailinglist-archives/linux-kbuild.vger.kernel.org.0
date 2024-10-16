Return-Path: <linux-kbuild+bounces-4148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4059A0BF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 15:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21F41F2430E
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 13:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002B920C003;
	Wed, 16 Oct 2024 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0wsLRcl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F474208218;
	Wed, 16 Oct 2024 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086776; cv=none; b=CB/YY+sAv+PEAy7NtSRcdINM0EHScegKuVl+y5ALvFV7mfBcvmO8XMl+BTXUGnHf7YDooRyd/gUKDzMLqiTUqPGsJ+0wRIoSiVSVWJ2hLJsku96W10DOViVU9vG8RwUOGhfZpGPJDahO/uOME2Kn5QUfkly1HdGIG79L7GDzum0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086776; c=relaxed/simple;
	bh=iVe6daXBjf0FGiLXnlPk68UAkWUxewdyKA6tLNmKIKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P9nfmV0gVJS5FsvlTog3Rptluq89S3O26TQUp77Lmw1dd6Mu9nBRA4fnQldrmH8IJh+eyH38uNglkdXAD+6UzE4p9y7O00ffUDfKohOVr8UpzTN+Yfkp3NTt/45v0OCxIyzScCkasBTK+p/IO9eTTyzTEv753Ba7DU7JfEzKiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0wsLRcl; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4608e389407so11126051cf.2;
        Wed, 16 Oct 2024 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729086774; x=1729691574; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VyiHnDKcK8FI5+FMxl4L18f3GHTxZZjF4Owll8YQ/M=;
        b=h0wsLRclH6YU4cDHhCOhHdP/MXBXSEnS+lkDXyGqyFL1qnf4YfQPFIq3ik8YQUj2Gs
         cL/ZuEN7IWGoPkU6JpaaJr0q7L2Gneq+xBQfH1QvyS4k9AdNN/hxim6Yh8LsSekFQ2jG
         XSh+dnzZjBXgCSZ4sxQORH2a2okiODhoqObroBDR72NkeYyD2Cn3j8jug3povoDyO/DY
         KoYbfVYWvrzVDR081wtA7IpDhMlvdX9vEsUZ5wjjdRjt219d5BScUz1wYTxjfq5MNrHZ
         zXQH2LopVYRqFA153iv3uAyWjYyID9tUaCR5me1SpgqdEDeqT1R82TCl/IMkIoHGU/2z
         +dKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729086774; x=1729691574;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VyiHnDKcK8FI5+FMxl4L18f3GHTxZZjF4Owll8YQ/M=;
        b=i3bxpbUaPcMJMvsvdz2ew45G6+tfJk/2lv/L2dEq8FDhLOcBIL/HJj1GDG2HN3UmNm
         dVTKNyUl5L+N11Pu8laNjAitSZpAcFfKUqNHhpL3Nm2rr2Q5Omxx3w02TLuWBCUWVIwI
         vV6CmPivQffpomCmG7S1uGyT79qum1eevaIVg596L9iSu5WMSPe/RVNOtLA2ZKlGz3b7
         0zVXZCVa3cfyUCbJqA4Ihq1jZEuSmhZrbcutGY3bIlzfN2Xug4n63rEj2vvmCNn66FcH
         cldvoH9ifvDlNMERhcR8JuTab3VqUw37e+xHSTvt49M9A/2KAdNXNKWI7SCaX4wgYIHQ
         4tBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWInJ0GvnjoermAhB4QgPRUyXBBsEqQ7eoss+VWxizXahshz2eCPATivCP3AXZLkQzepg6FM/IZKXC+k2Jk7rk=@vger.kernel.org, AJvYcCXxrZJXE+x0CqkvWhSJhdEbEK0WcuyIKGeUlfGN11x26fV8jxoSFiERJdFCzGvwAiNo9OXazBPSDFvg+FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWE42qmQV+5a1gBE1IqWhamKSDUNjRy5YyZKWV9t1fbrlJNO18
	eZs6sCfjncs5VR+BRc5G4ijElAvdxypH8OcBQpRmBfdzOT6uN8O6
X-Google-Smtp-Source: AGHT+IFzoMUCSj95XrQ3tZCSPHNsQFDpMYkK5gKXJ1TOxMmbQ9xytImxkbswPPfby2sYZaboWD6lEw==
X-Received: by 2002:ac8:58c2:0:b0:460:4e67:d67f with SMTP id d75a77b69052e-4608a430077mr61697731cf.2.1729086773881;
        Wed, 16 Oct 2024 06:52:53 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa (pool-100-37-170-231.nycmny.fios.verizon.net. [100.37.170.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b122260sm18157271cf.50.2024.10.16.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:52:53 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Oct 2024 09:52:51 -0400
Subject: [PATCH v6] rust: use host dylib naming convention
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-b4-dylib-host-macos-v6-1-bbeab5029199@gmail.com>
X-B4-Tracking: v=1; b=H4sIADLFD2cC/03MTQ7CIBBA4as0s3YaQErRlfcwLvhrmaQUA43RN
 L27xJXLb/HeDjUUChWu3Q4lvKhSXhvUqQMXzToHJN8MggnJGVdoJfrPQhZjrhsm43JFrsZhdOe
 BWXmBVj5LmOj9u94fzVPJCbdYgvl7MS2E1Jz1WjYjx80kKv42J0NL73KC4/gCyNorfp8AAAA=
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
 rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.14.2

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
Co-developed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
V5 -> V6: Removed setting `no-clean-files`. Rewrote description.
e4 -> V5: Added missing `shell` in rust/Makefile.
V3 -> V4: Added motivation. Added missing Signed-off-by.
V2 -> V3: Added .strip() to rustc output to remove errant newline.
V1 -> V2: De-duplicated and sorted imports. Changed Signed-off-by to
Co-developed-by.
---
 .gitignore                        |  1 +
 Makefile                          |  2 +-
 rust/Makefile                     | 20 +++++++++++---------
 scripts/generate_rust_analyzer.py | 15 +++++++++++----
 4 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/.gitignore b/.gitignore
index a61e4778d011cf706e6784818a1357f392f3a669..088696a6a46a12fdb77eb9ccab5b6b7b11ef4707 100644
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
index a9e723cb05961877d5e6b50920dcabc78cf4988f..470e6f20c513bf0f90a42c586aa92dd7a8b16fb0 100644
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
index 3678e79317f12d7116ad0c2ac1ca416ee5b969aa..0d882103375aa45be78e22f59c64739c8722fd98 100644
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
@@ -36,9 +33,14 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
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
@@ -104,10 +106,10 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-kernel: private rustc_target_flags = \
-    --extern build_error --extern macros=$(objtree)/$(obj)/libmacros.so \
+    --extern build_error --extern macros \
     --extern bindings --extern uapi
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-macros \
-    rustdoc-compiler_builtins $(obj)/libmacros.so \
+    rustdoc-compiler_builtins $(obj)/$(libmacros_name) \
     $(obj)/bindings.o FORCE
 	+$(call if_changed,rustdoc)
 
@@ -325,10 +327,10 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
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
@@ -401,7 +403,7 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 $(obj)/kernel.o: private rustc_target_flags = \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
-    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 endif # CONFIG_RUST
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
base-commit: 6ce162a002657910104c7a07fb50017681bc476c
change-id: 20241016-b4-dylib-host-macos-16757c350b49

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


