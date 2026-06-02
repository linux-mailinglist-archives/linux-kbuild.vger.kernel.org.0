Return-Path: <linux-kbuild+bounces-13516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mo6fH5kWH2pVfQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13516-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:44:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC1630CD9
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:44:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BveVEL2x;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13516-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13516-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48E71309C557
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA7A3FC5D8;
	Tue,  2 Jun 2026 17:30:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE68A3FCB3E;
	Tue,  2 Jun 2026 17:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421435; cv=none; b=E0lrfBA05lNKLdanqsf7qkkxUHDU87VkZb++o2o0tMxx8LPty52H+eel0M3NpjYzgXEJhaGxN/+fuBLT36GXTc272rqSNsuKvF/P/lguM+VoefN6brl+fGzh7oeKweVSBpXdzBgNHw+KIhvSE3TzpKRO22OySNXG7wic0iSTgE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421435; c=relaxed/simple;
	bh=om7ImmCD5AGr8+osUMq65rL+Xq8aprNPW66Q5rXIj/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGyXvvuU4cL9hvarewsz3GItB0slY1iOXazNuAyK6rmNr+PZY5q3S5/DFPKwjkBKZaRcMI6Dyp9rcf04mDv62JWWhnBUo7xgJPDrQwRxNjIn5o5ru+dYcBIJ5wBIzUpaC2J4NXm+lUUzcWcrG+bBqTTOoJIYcNi07YAmLE2lJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BveVEL2x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5423C1F00899;
	Tue,  2 Jun 2026 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421431;
	bh=kmuduTaLEgtH2OUAHIiyemZXnY24WwE1eTTLppm9rdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BveVEL2xx8pbEdzDrpXyj2+RRoJhvOUVvEFnuLqyo+aJRv/P4S8X7rnMihIOWsvt+
	 AbgxnNSJ/P9Xr9maBasRhSm2dUs1uwL/OAEJQVNLJQPWzIRT7+oa858upKWsXOjwW2
	 lw8ftR6O32g+nTCnWU21edne3Ou0lVZ6PbVu8Rm7xDPGcVQ05om7LxSO57qaAnaFGK
	 haMCTMCrICRcSfaxBqZz5iahpYSWSTZf0rERPwv15k1odUlL8SCati8MflF5oo+D8s
	 aO2damh3OeWa5Ox/f89sYyMbF5RxBvI8NpLRCAaOw01mhaJcd6IJSKENZx6vv8usdz
	 L/vzmVPRgvOiQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@amazon.com>
Subject: [PATCH 12/18] rust: zerocopy: enable support in kbuild
Date: Tue,  2 Jun 2026 19:29:13 +0200
Message-ID: <20260602172920.30342-13-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13516-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9DC1630CD9

With all the new files in place and ready from the new crate, enable
the support for it in the build system.

In addition, skip formatting for this vendored crate.

Finally, there are no generated symbols expected from `zerocopy`, thus
skip adding the `exports` generation.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile                          |  1 +
 rust/Makefile                     | 45 ++++++++++++++++++++++++++-----
 scripts/Makefile.build            |  1 +
 scripts/generate_rust_analyzer.py | 10 +++++--
 4 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 3a265e7e3347..33135f39bbee 100644
--- a/Makefile
+++ b/Makefile
@@ -1956,6 +1956,7 @@ rustfmt:
 			-path $(srctree)/rust/proc-macro2 \
 			-o -path $(srctree)/rust/quote \
 			-o -path $(srctree)/rust/syn \
+			-o -path $(srctree)/rust/zerocopy \
 		\) -prune -o \
 		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
diff --git a/rust/Makefile b/rust/Makefile
index b790afc0d371..5246e37fde10 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,6 +6,8 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
+obj-$(CONFIG_RUST) += zerocopy.o
+
 ifdef CONFIG_RUST_INLINE_HELPERS
 always-$(CONFIG_RUST) += helpers/helpers.bc helpers/helpers_module.bc
 else
@@ -81,6 +83,12 @@ core-flags := \
     --edition=$(core-edition) \
     $(call cfgs-to-flags,$(core-cfgs))
 
+zerocopy-flags := \
+    --cap-lints=allow
+
+zerocopy-envs := \
+    CARGO_PKG_VERSION=0.8.50
+
 proc_macro2-cfgs := \
     feature="proc-macro" \
     wrap_proc_macro \
@@ -167,7 +175,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 # command-like flags to solve the issue. Meanwhile, we use the non-custom case
 # and then retouch the generated files.
 rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
-    rustdoc-kernel rustdoc-pin_init
+    rustdoc-kernel rustdoc-pin_init rustdoc-zerocopy
 	$(Q)grep -Ehro '<a href="srctree/([^"]+)"' $(rustdoc_output) | \
 		cut -d'"' -f2 | cut -d/ -f2- | while read f; do \
 			if [ ! -e "$(srctree)/$$f" ]; then \
@@ -219,6 +227,13 @@ rustdoc-compiler_builtins: private is-kernel-object := y
 rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
+rustdoc-zerocopy: private rustc_target_envs := $(zerocopy-envs)
+rustdoc-zerocopy: private is-kernel-object := y
+rustdoc-zerocopy: private rustc_target_flags = $(zerocopy-flags) \
+    --extend-css $(src)/zerocopy/rustdoc/style.css
+rustdoc-zerocopy: $(src)/zerocopy/src/lib.rs rustdoc-clean rustdoc-core FORCE
+	+$(call if_changed,rustdoc)
+
 rustdoc-ffi: private is-kernel-object := y
 rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
@@ -240,7 +255,8 @@ rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
 rustdoc-kernel: private is-kernel-object := y
 rustdoc-kernel: private rustc_target_flags = --extern ffi --extern pin_init \
     --extern build_error --extern macros \
-    --extern bindings --extern uapi
+    --extern bindings --extern uapi \
+    --extern zerocopy
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-ffi rustdoc-macros \
     rustdoc-pin_init rustdoc-compiler_builtins $(obj)/$(libmacros_name) \
     $(obj)/bindings.o FORCE
@@ -260,6 +276,11 @@ quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
 		-L$(objtree)/$(obj)/test \
 		--crate-name $(subst rusttest-,,$(subst rusttestlib-,,$@)) $<
 
+rusttestlib-zerocopy: private rustc_target_envs := $(zerocopy-envs)
+rusttestlib-zerocopy: private rustc_target_flags = $(zerocopy-flags)
+rusttestlib-zerocopy: $(src)/zerocopy/src/lib.rs FORCE
+	+$(call if_changed,rustc_test_library)
+
 rusttestlib-build_error: $(src)/build_error.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
@@ -300,10 +321,11 @@ rusttestlib-pin_init: $(src)/pin-init/src/lib.rs rusttestlib-macros \
 
 rusttestlib-kernel: private rustc_target_flags = --extern ffi \
     --extern build_error --extern macros --extern pin_init \
-    --extern bindings --extern uapi
+    --extern bindings --extern uapi \
+    --extern zerocopy
 rusttestlib-kernel: $(src)/kernel/lib.rs rusttestlib-bindings rusttestlib-uapi \
     rusttestlib-build_error rusttestlib-pin_init $(obj)/$(libmacros_name) \
-    $(obj)/bindings.o FORCE
+    $(obj)/bindings.o rusttestlib-zerocopy FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-bindings: private rustc_target_flags = --extern ffi --extern pin_init
@@ -335,6 +357,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
 		--extern kernel --extern build_error --extern macros \
 		--extern bindings --extern uapi \
+		--extern zerocopy \
 		--no-run --crate-name kernel -Zunstable-options \
 		--sysroot=/dev/null \
 		$(doctests_modifiers_workaround) \
@@ -594,6 +617,7 @@ rust-analyzer:
 		--cfgs='syn=$(syn-cfgs)' \
 		--cfgs='pin_init_internal=$(pin_init_internal-cfgs)' \
 		--cfgs='pin_init=$(pin_init-cfgs)' \
+		--envs='zerocopy=$(zerocopy-envs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
@@ -665,6 +689,13 @@ $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/zerocopy.o: private skip_clippy = 1
+$(obj)/zerocopy.o: private skip_gendwarfksyms = 1
+$(obj)/zerocopy.o: private rustc_target_envs := $(zerocopy-envs)
+$(obj)/zerocopy.o: private rustc_target_flags = $(zerocopy-flags)
+$(obj)/zerocopy.o: $(src)/zerocopy/src/lib.rs $(obj)/compiler_builtins.o FORCE
+	+$(call if_changed_rule,rustc_library)
+
 $(obj)/pin_init.o: private skip_gendwarfksyms = 1
 $(obj)/pin_init.o: private rustc_target_flags = $(pin_init-flags)
 $(obj)/pin_init.o: $(src)/pin-init/src/lib.rs $(obj)/compiler_builtins.o \
@@ -700,9 +731,11 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/kernel.o: private rustc_target_flags = --extern ffi --extern pin_init \
-    --extern build_error --extern macros --extern bindings --extern uapi
+    --extern build_error --extern macros --extern bindings --extern uapi \
+    --extern zerocopy
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
-    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o \
+    $(obj)/zerocopy.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 ifdef CONFIG_JUMP_LABEL
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3498d25b15e8..ddf0461dda6a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -329,6 +329,7 @@ rust_common_cmd = \
 	-Zcrate-attr=no_std \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
 	-Zunstable-options --extern pin_init --extern kernel \
+	--extern zerocopy \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index cede76af8425..a294cf386c9d 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -276,6 +276,12 @@ def generate_crates(
         [core, compiler_builtins],
     )
 
+    zerocopy = append_crate(
+        "zerocopy",
+        srctree / "rust" / "zerocopy" / "src" / "lib.rs",
+        [core, compiler_builtins],
+    )
+
     def append_crate_with_generated(
         display_name: str,
         deps: List[Dependency],
@@ -304,7 +310,7 @@ def generate_crates(
     bindings = append_crate_with_generated("bindings", [core, ffi, pin_init])
     uapi = append_crate_with_generated("uapi", [core, ffi, pin_init])
     kernel = append_crate_with_generated(
-        "kernel", [core, macros, build_error, pin_init, ffi, bindings, uapi]
+        "kernel", [core, macros, build_error, pin_init, ffi, bindings, uapi, zerocopy]
     )
 
     scripts = srctree / "scripts"
@@ -349,7 +355,7 @@ def generate_crates(
             append_crate(
                 crate_name,
                 path,
-                [core, kernel, pin_init],
+                [core, kernel, pin_init, zerocopy],
                 cfg=generated_cfg,
             )
 
-- 
2.54.0


