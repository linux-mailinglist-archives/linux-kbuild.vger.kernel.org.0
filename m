Return-Path: <linux-kbuild+bounces-6013-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E936EA579E6
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 12:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11EBC189994C
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 11:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACE01B4F0B;
	Sat,  8 Mar 2025 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="aipOcFWl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284491B422A;
	Sat,  8 Mar 2025 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741431916; cv=none; b=kY54N7MaXGjQOL5heJxgK9OL7IECNLrylTj9XwbFAyWBH+dZJTdIuxMJx6gYELDwz3PHKvVcpuydm/nl7xPMCESV2wMv4fErp0xZhJv6YylIgRlJXriCEkJ59DRg5ETwNe6KaFPP8HJMSF7ZIksndQeDTtN6IvThy0f4ygZFYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741431916; c=relaxed/simple;
	bh=CEwYSGyqEUebfx7MC/cBo5ZPGIFNSvqer3Pj/K+lL4E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A34g+xkrDlmYyUBAdmRhaR7bBFS0JBg4RVOYQlK7UGfbHcoNHeQHLKfUbSG5JSY8cNYn94p67Nt/NDz2gHaNGogi/pnANybgRM+DrYsau6/jYmCcMHh6E25yIr1WgNOYgg387XTRbT0qR4MIEtFLk1otdn2cTwvlIa99o7atLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=aipOcFWl; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741431906; x=1741691106;
	bh=geZn1X5bw+SSGxxAzxEDNn2DqbGfLlgOCL/jnGpZ/5w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=aipOcFWl1SB/Mz4ln0m2yrWN/hbTmGSZ62vilUhjrR3nSd/Bl8MdqLCHDUAZ06KA5
	 Dlr8Nll1xSaemJukfItc7MnR3OQdRF5aSUm5OC53jVnLMcDT2VDJH8sWjsFuhRLVoz
	 UqmdG3zv5ZWtw2YI6oBbpuFsMKDfLiTZ5OS0yPK0GAne7T++DU+r/JGG/oZSru5vy7
	 xw6IXyOSUHfcboroqd8T2Ih0Srj0nv4UArSM8x1MlTbyHRB82h3XpLUs4fk4jnai1G
	 8Sh96t3dx+KpQEpBpZHr/6vDN7/9FyL2tT8e63muWpc6Q0+Jblo58RsNVmSmHTW3jC
	 QAGTr3/79RB5Q==
Date: Sat, 08 Mar 2025 11:05:01 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2 14/22] rust: add pin-init crate build infrastructure
Message-ID: <20250308110339.2997091-15-benno.lossin@proton.me>
In-Reply-To: <20250308110339.2997091-1-benno.lossin@proton.me>
References: <20250308110339.2997091-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: fe75bbdc6d97a60a7d876d803e4012ce894d3d22
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Miguel Ojeda <ojeda@kernel.org>

Add infrastructure for moving the initialization API to its own crate.
Covers all make targets such as `rust-analyzer` and `rustdoc`. The tests
of pin-init are not added to `rusttest`, as they are already tested in
the user-space repository [1].

Link: https://github.com/Rust-for-Linux/pin-init [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Co-developed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/Makefile                      | 75 +++++++++++++++++++++++-------
 rust/pin-init/internal/src/_lib.rs |  3 ++
 rust/pin-init/internal/src/lib.rs  |  4 ++
 rust/pin-init/src/_lib.rs          |  5 ++
 scripts/Makefile.build             |  2 +-
 scripts/generate_rust_analyzer.py  | 17 ++++++-
 6 files changed, 86 insertions(+), 20 deletions(-)
 create mode 100644 rust/pin-init/internal/src/_lib.rs
 create mode 100644 rust/pin-init/src/_lib.rs

diff --git a/rust/Makefile b/rust/Makefile
index ea3849eb78f6..90310f0620eb 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_RUST) +=3D helpers/helpers.o
 CFLAGS_REMOVE_helpers/helpers.o =3D -Wmissing-prototypes -Wmissing-declara=
tions
=20
 always-$(CONFIG_RUST) +=3D bindings/bindings_generated.rs bindings/binding=
s_helpers_generated.rs
-obj-$(CONFIG_RUST) +=3D bindings.o kernel.o
+obj-$(CONFIG_RUST) +=3D bindings.o pin_init.o kernel.o
 always-$(CONFIG_RUST) +=3D exports_helpers_generated.h \
     exports_bindings_generated.h exports_kernel_generated.h
=20
@@ -41,7 +41,10 @@ ifdef CONFIG_RUST
 libmacros_name :=3D $(shell MAKEFLAGS=3D $(RUSTC) --print file-names --cra=
te-name macros --crate-type proc-macro - </dev/null)
 libmacros_extension :=3D $(patsubst libmacros.%,%,$(libmacros_name))
=20
-always-$(CONFIG_RUST) +=3D $(libmacros_name)
+libpin_init_internal_name :=3D $(shell MAKEFLAGS=3D $(RUSTC) --print file-=
names --crate-name pin_init_internal --crate-type proc-macro - </dev/null)
+libpin_init_internal_extension :=3D $(patsubst libpin_init_internal.%,%,$(=
libpin_init_internal_name))
+
+always-$(CONFIG_RUST) +=3D $(libmacros_name) $(libpin_init_internal_name)
=20
 # `$(rust_flags)` is passed in case the user added `--sysroot`.
 rustc_sysroot :=3D $(shell MAKEFLAGS=3D $(RUSTC) $(rust_flags) --print sys=
root)
@@ -80,7 +83,7 @@ quiet_cmd_rustdoc =3D RUSTDOC $(if $(rustdoc_host),H, ) $=
<
 # command-like flags to solve the issue. Meanwhile, we use the non-custom =
case
 # and then retouch the generated files.
 rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
-    rustdoc-kernel
+    rustdoc-kernel rustdoc-pin_init
 =09$(Q)cp $(srctree)/Documentation/images/logo.svg $(rustdoc_output)/stati=
c.files/
 =09$(Q)cp $(srctree)/Documentation/images/COPYING-logo $(rustdoc_output)/s=
tatic.files/
 =09$(Q)find $(rustdoc_output) -name '*.html' -type f -print0 | xargs -0 se=
d -Ei \
@@ -110,11 +113,24 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins.r=
s rustdoc-core FORCE
 rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 =09+$(call if_changed,rustdoc)
=20
-rustdoc-kernel: private rustc_target_flags =3D --extern ffi \
+rustdoc-pin_init_internal: private rustdoc_host =3D yes
+rustdoc-pin_init_internal: private rustc_target_flags =3D --cfg kernel \
+    --extern proc_macro --crate-type proc-macro
+rustdoc-pin_init_internal: $(src)/pin-init/internal/src/_lib.rs FORCE
+=09+$(call if_changed,rustdoc)
+
+rustdoc-pin_init: private rustdoc_host =3D yes
+rustdoc-pin_init: private rustc_target_flags =3D --extern pin_init_interna=
l \
+    --extern macros --extern alloc --cfg kernel --cfg feature=3D\"alloc\"
+rustdoc-pin_init: $(src)/pin-init/src/_lib.rs rustdoc-pin_init_internal \
+    rustdoc-macros FORCE
+=09+$(call if_changed,rustdoc)
+
+rustdoc-kernel: private rustc_target_flags =3D --extern ffi --extern pin_i=
nit \
     --extern build_error --extern macros \
     --extern bindings --extern uapi
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-ffi rustdoc-macr=
os \
-    rustdoc-compiler_builtins $(obj)/$(libmacros_name) \
+    rustdoc-pin_init rustdoc-compiler_builtins $(obj)/$(libmacros_name) \
     $(obj)/bindings.o FORCE
 =09+$(call if_changed,rustdoc)
=20
@@ -139,12 +155,24 @@ rusttestlib-macros: private rustc_test_library_proc =
=3D yes
 rusttestlib-macros: $(src)/macros/lib.rs FORCE
 =09+$(call if_changed,rustc_test_library)
=20
+rusttestlib-pin_init_internal: private rustc_target_flags =3D --cfg kernel=
 \
+    --extern proc_macro
+rusttestlib-pin_init_internal: private rustc_test_library_proc =3D yes
+rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/_lib.rs FORCE
+=09+$(call if_changed,rustc_test_library)
+
+rusttestlib-pin_init: private rustc_target_flags =3D --extern pin_init_int=
ernal \
+    --extern macros --cfg kernel
+rusttestlib-pin_init: $(src)/pin-init/src/_lib.rs rusttestlib-macros \
+    rusttestlib-pin_init_internal $(obj)/$(libpin_init_internal_name) FORC=
E
+=09+$(call if_changed,rustc_test_library)
+
 rusttestlib-kernel: private rustc_target_flags =3D --extern ffi \
-    --extern build_error --extern macros \
+    --extern build_error --extern macros --extern pin_init \
     --extern bindings --extern uapi
-rusttestlib-kernel: $(src)/kernel/lib.rs \
-    rusttestlib-bindings rusttestlib-uapi rusttestlib-build_error \
-    $(obj)/$(libmacros_name) $(obj)/bindings.o FORCE
+rusttestlib-kernel: $(src)/kernel/lib.rs rusttestlib-bindings rusttestlib-=
uapi \
+    rusttestlib-build_error rusttestlib-pin_init $(obj)/$(libmacros_name) =
\
+    $(obj)/bindings.o FORCE
 =09+$(call if_changed,rustc_test_library)
=20
 rusttestlib-bindings: private rustc_target_flags =3D --extern ffi
@@ -172,8 +200,8 @@ quiet_cmd_rustdoc_test_kernel =3D RUSTDOC TK $<
 =09mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
 =09OBJTREE=3D$(abspath $(objtree)) \
 =09$(RUSTDOC) --test $(rust_flags) \
-=09=09-L$(objtree)/$(obj) --extern ffi --extern kernel \
-=09=09--extern build_error --extern macros \
+=09=09-L$(objtree)/$(obj) --extern ffi --extern pin_init \
+=09=09--extern kernel --extern build_error --extern macros \
 =09=09--extern bindings --extern uapi \
 =09=09--no-run --crate-name kernel -Zunstable-options \
 =09=09--sysroot=3D/dev/null \
@@ -203,18 +231,18 @@ quiet_cmd_rustc_test =3D $(RUSTC_OR_CLIPPY_QUIET) T  =
$<
 rusttest: rusttest-macros rusttest-kernel
=20
 rusttest-macros: private rustc_target_flags =3D --extern proc_macro \
-=09--extern macros --extern kernel
+=09--extern macros --extern kernel --extern pin_init
 rusttest-macros: private rustdoc_test_target_flags =3D --crate-type proc-m=
acro
 rusttest-macros: $(src)/macros/lib.rs \
-    rusttestlib-macros rusttestlib-kernel FORCE
+    rusttestlib-macros rusttestlib-kernel rusttestlib-pin_init FORCE
 =09+$(call if_changed,rustc_test)
 =09+$(call if_changed,rustdoc_test)
=20
-rusttest-kernel: private rustc_target_flags =3D --extern ffi \
+rusttest-kernel: private rustc_target_flags =3D --extern ffi --extern pin_=
init \
     --extern build_error --extern macros --extern bindings --extern uapi
 rusttest-kernel: $(src)/kernel/lib.rs rusttestlib-ffi rusttestlib-kernel \
     rusttestlib-build_error rusttestlib-macros rusttestlib-bindings \
-    rusttestlib-uapi FORCE
+    rusttestlib-uapi rusttestlib-pin_init FORCE
 =09+$(call if_changed,rustc_test)
=20
 ifdef CONFIG_CC_IS_CLANG
@@ -361,7 +389,7 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORC=
E
=20
 quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro =3D \
-=09$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+=09$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
 =09=09-Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
 =09=09-Clink-args=3D'$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 =09=09--emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --extern proc_macr=
o \
@@ -372,6 +400,10 @@ quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET)=
 P $@
 $(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
 =09+$(call if_changed_dep,rustc_procmacro)
=20
+$(obj)/$(libpin_init_internal_name): private rustc_target_flags =3D --cfg =
kernel
+$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/_lib.rs =
FORCE
+=09+$(call if_changed_dep,rustc_procmacro)
+
 quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QU=
IET)) L $@
       cmd_rustc_library =3D \
 =09OBJTREE=3D$(abspath $(objtree)) \
@@ -451,6 +483,13 @@ $(obj)/compiler_builtins.o: private rustc_objcopy =3D =
-w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORC=
E
 =09+$(call if_changed_rule,rustc_library)
=20
+$(obj)/pin_init.o: private skip_gendwarfksyms =3D 1
+$(obj)/pin_init.o: private rustc_target_flags =3D --extern pin_init_intern=
al \
+    --extern macros --cfg kernel
+$(obj)/pin_init.o: $(src)/pin-init/src/_lib.rs $(obj)/compiler_builtins.o =
\
+    $(obj)/$(libpin_init_internal_name) $(obj)/$(libmacros_name) FORCE
+=09+$(call if_changed_rule,rustc_library)
+
 $(obj)/build_error.o: private skip_gendwarfksyms =3D 1
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FOR=
CE
 =09+$(call if_changed_rule,rustc_library)
@@ -473,9 +512,9 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/uapi/uapi_generated.rs FORCE
 =09+$(call if_changed_rule,rustc_library)
=20
-$(obj)/kernel.o: private rustc_target_flags =3D --extern ffi \
+$(obj)/kernel.o: private rustc_target_flags =3D --extern ffi --extern pin_=
init \
     --extern build_error --extern macros --extern bindings --extern uapi
-$(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
+$(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init=
.o \
     $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
 =09+$(call if_changed_rule,rustc_library)
=20
diff --git a/rust/pin-init/internal/src/_lib.rs b/rust/pin-init/internal/sr=
c/_lib.rs
new file mode 100644
index 000000000000..0874cf04e4cb
--- /dev/null
+++ b/rust/pin-init/internal/src/_lib.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+//! Will be removed in a future commit, only exists to prevent compilation=
 errors.
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src=
/lib.rs
index bf66cbee2531..3146da5cc47c 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -1,5 +1,9 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
=20
+// When fixdep scans this, it will find this string `CONFIG_RUSTC_VERSION_=
TEXT`
+// and thus add a dependency on `include/config/RUSTC_VERSION_TEXT`, which=
 is
+// touched by Kconfig when the version string from the compiler changes.
+
 #[allow(missing_docs)]
 #[proc_macro_attribute]
 pub fn pin_data(inner: TokenStream, item: TokenStream) -> TokenStream {
diff --git a/rust/pin-init/src/_lib.rs b/rust/pin-init/src/_lib.rs
new file mode 100644
index 000000000000..e0918fd8e9e7
--- /dev/null
+++ b/rust/pin-init/src/_lib.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+//! Will be removed in a future commit, only exists to prevent compilation=
 errors.
+
+#![no_std]
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 993708d11874..08b6380933f5 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -237,7 +237,7 @@ rust_common_cmd =3D \
 =09-Zallow-features=3D$(rust_allowed_features) \
 =09-Zcrate-attr=3Dno_std \
 =09-Zcrate-attr=3D'feature($(rust_allowed_features))' \
-=09-Zunstable-options --extern kernel \
+=09-Zunstable-options --extern pin_init --extern kernel \
 =09--crate-type rlib -L $(objtree)/rust/ \
 =09--crate-name $(basename $(notdir $@)) \
 =09--sysroot=3D/dev/null \
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_anal=
yzer.py
index aa8ea1a4dbe5..a44a4475d11f 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -93,10 +93,25 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs):
     )
     crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
=20
+    append_crate(
+        "pin_init_internal",
+        srctree / "rust" / "pin-init" / "internal" / "src" / "_lib.rs",
+        [],
+        cfg=3D["kernel"],
+        is_proc_macro=3DTrue,
+    )
+
+    append_crate(
+        "pin_init",
+        srctree / "rust" / "pin-init" / "src" / "_lib.rs",
+        ["core", "pin_init_internal", "macros"],
+        cfg=3D["kernel"],
+    )
+
     append_crate(
         "kernel",
         srctree / "rust" / "kernel" / "lib.rs",
-        ["core", "macros", "build_error", "bindings"],
+        ["core", "macros", "build_error", "bindings", "pin_init"],
         cfg=3Dcfg,
     )
     crates[-1]["source"] =3D {
--=20
2.47.2



