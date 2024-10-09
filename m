Return-Path: <linux-kbuild+bounces-4003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F63996B37
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 15:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD442898A5
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C67C1A2C25;
	Wed,  9 Oct 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0JMjXfl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5504E198E9E;
	Wed,  9 Oct 2024 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478732; cv=none; b=EhXuHa95qQEsMxMRfFJIEBtl5c7SvRCBqKPY7sVjjmKoOZG1tDCdNlDmxZ/mtz8zvIXI4A/9Umxxj1uIHswEszkAencAXTYA77I9srspsK4mF8CRcYPdXCslZDQYFwQ7YJki0PIvcscXvDNCsE0xq9vS9a8/o30PfzgQ+3nKfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478732; c=relaxed/simple;
	bh=lHk/Ye/JD8W1zknWSkGJAWvgWI0a/P1cjgEgIipHIG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7D/fHAq5I6qRExbyNjOKu740Wt4qVTK2NFr/Mh3J7LSXjjBVGajcTtBqRw1SCm47/nPcNU4thVLh2d0IP72tqNrdH8PlS+5TgaF3MBF8Pa9rRO1zEjbw70iMs0DN6iksls504fvP4FYwpSuwPiiv3DdUHnokl22pUmEGyreNsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0JMjXfl; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50ca1581a1aso1192967e0c.2;
        Wed, 09 Oct 2024 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728478728; x=1729083528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bY+BlcQgjOQia5HyhLmAJ+Ll/LWwOfvtq57kNm+b9Ac=;
        b=I0JMjXfl0zEtWU/F6VizA9cTuCjBVptV1YNRaEXVk0xdLScMwv3T8SOgWJCzDpjy1l
         nEsNuXRa8xhoYlSHmQ3n7tAGjguEhuDjziQx7UvtZfYktijFKzpuBznFlBCFWZ2YL0uN
         Ph+T1nsJ0kEOlXkUF/LNgI5nGMaRY3JCn2PGWQ4+eTvDcqkEVA3+3tDXKrJq0jpfUMDX
         lNcU2j/xdroJ6+Yc2dzV7a6Pk1SUWwkRqxi48iuhJq78JYJVKtEcBiTDmx855MnuRemT
         xV5BWX33popkj1oqBmMHproPo/NycUnC0ZLOsJV7BFDJMW5MUr52LLTWr4W0um+8S0Io
         zVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478728; x=1729083528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY+BlcQgjOQia5HyhLmAJ+Ll/LWwOfvtq57kNm+b9Ac=;
        b=ECqYCOyCdKVKadU9I41Az8YAjZpsjFZppDUa+2YcRKVXCw5P8H3WCNeKR86BoaCEw/
         FL2JeOwdxtQWBv/3mJ0U3n0hUqFfuQcfwdM0roxA6GKzRIrmw95ig54rWuNmTK8xUmFO
         9F2bEzma1ctf6SPGYG6wLjaNZdXtGSiwzoeQcy2J5yxKwohErImcBfs8YXYfoYmQiaVd
         l4MyDcUhsva4COjwiWJyPlzplwZWqQzcozSjxeP6MmA08l0HHnlEA6GfZCmniwI+L/ws
         aunz3Ai827+my1ULhyUKYz41AokNi90clY+pQmbjLp1tfee56bvwa4TXiMQ93slm4497
         +JMg==
X-Forwarded-Encrypted: i=1; AJvYcCVRuXzwoBj+PmLdqWyRnAargiU95mqcDweZVDcvVCr/JU7tIM+iThr/u/SOisg/UDEKv/99n19xsyG9V/E=@vger.kernel.org, AJvYcCX7F3FCnrSYBzL9qt+apqmNnLwyfTmy3BEcu2M+9sa4HH7BvxKq0ma+jyLlGmLCBpdBzBCiO+wcHmt9/qdQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpSA4PzufR0J644opMUfaC2CPvavGDhhPt2M6CC7tR0Kw+kvE
	UAojwFjJtdTq68FpZRO7/diW+QhqyK+s3bEXJ+D226fp9qwXME9Z4XeTL5Cs
X-Google-Smtp-Source: AGHT+IGfd9cHh0Jpe1xaTJHDQ9Zko1tCP53r/zzJSIe61jCrP+ds5C+ZDexZldAPBI67uNaIj0UAnw==
X-Received: by 2002:a05:6122:468d:b0:502:8cca:1313 with SMTP id 71dfb90a1353d-50cf0ca1e3fmr1209411e0c.12.1728478728291;
        Wed, 09 Oct 2024 05:58:48 -0700 (PDT)
Received: from localhost.localdomain ([2620:10d:c091:600::1:6bd1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbbc88d927sm16433126d6.12.2024.10.09.05.58.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Oct 2024 05:58:47 -0700 (PDT)
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
	Nick Alcock <nick.alcock@oracle.com>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	=?UTF-8?q?=C3=8D=C3=B1igo=20Huguet?= <ihuguet@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2] rust: query the compiler for dylib path
Date: Wed,  9 Oct 2024 08:58:37 -0400
Message-ID: <20241009125839.85163-1-tamird@gmail.com>
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

Co-developed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 .gitignore                        |  1 +
 Makefile                          |  2 +-
 rust/Makefile                     | 21 ++++++++++++---------
 scripts/generate_rust_analyzer.py | 15 +++++++++++----
 4 files changed, 25 insertions(+), 14 deletions(-)

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
index d2bc63cde8c6..cc7935df0120 100755
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
+            ).decode('utf-8')
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


