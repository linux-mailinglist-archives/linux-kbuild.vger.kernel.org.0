Return-Path: <linux-kbuild+bounces-13636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hxV0I2LRJmo2lAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13636-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:27:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E43316572B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:27:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d7PLuXa6;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13636-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13636-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78028307B56F
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493813CC7CC;
	Mon,  8 Jun 2026 14:16:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7403CCFC0;
	Mon,  8 Jun 2026 14:16:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928186; cv=none; b=a6YtAPycYiwOUHJmPXGkkJ60duUal9w9aDAtNvwoBdW2kEKEKoJwTBZUlI+u+6cwGgR5GArvJR3t99zvScOOWDrkvwonsMAIu7luxmi/6cL4O69fZG9FDGhc67e2MSKywdlFFrNVlwm9Z4+DanjqNPSGwVMeecbAdS6+shLnBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928186; c=relaxed/simple;
	bh=e8CIG5+xvBk8oun68iLkEGKVbQmJHE12ThrWtm2KFzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piy/mwO9jPtUGzx7D4aV2+/CrNd/VGF7whZDipv0odaWAfu3sw4TW4U7m5yg8FHDs+HhdXIqzfHlkEWIErxIObVygUQzuwR0uDWphI+5NEti0NopCNKgdfcopWDTaP5WwffRJzEQ9bF2MGSMrrNQjPfbbyfaHgoCyvZdM+6ktUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7PLuXa6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5770D1F00898;
	Mon,  8 Jun 2026 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928184;
	bh=BVvwm9y1Xr7R8adCT0z8Tn7g2yz3VgQO78ilTTz2mC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d7PLuXa6+ws19EaTBCtfeUvHK4usDzaW0kptrM0fdnOQN43UiasvFhTh30NNuWlge
	 QChq1UJt420BXY+LJICpYHDGNufR9dm84AFD3A2PLzPKvfB6AX8RU2hX8moKM2rOwF
	 doXodE6Ii67dWrf0YonWv9e8JYfhITVPeI7cmK6SsNLGNVP4wVUhI10dRZQhX7xh+u
	 5EVbHND44mIP+MWiEKx+O/69EOzblEu1EBV11fZULZSl1w5omiDJv0PLNY5QIuzNUv
	 qingwfWAsnMjDcwkx0jsplOIxGsbVAC1fRl7FjdIzwdl4zd6FHlulbB04nm79ipt6l
	 Ye12bTTJZBKsA==
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
	Jack Wrenn <jswrenn@google.com>
Subject: [PATCH v2 17/19] rust: zerocopy-derive: enable support in kbuild
Date: Mon,  8 Jun 2026 16:14:36 +0200
Message-ID: <20260608141439.182634-18-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
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
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13636-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E43316572B3

With all the new files in place and ready from the new crate, enable
the support for it in the build system.

In addition, skip formatting for this vendored crate.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile                          |  1 +
 rust/Makefile                     | 41 +++++++++++++++++++++++++------
 scripts/Makefile.build            |  2 +-
 scripts/generate_rust_analyzer.py | 10 ++++++--
 4 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 33135f39bbee..c71c43bc3658 100644
--- a/Makefile
+++ b/Makefile
@@ -1957,6 +1957,7 @@ rustfmt:
 			-o -path $(srctree)/rust/quote \
 			-o -path $(srctree)/rust/syn \
 			-o -path $(srctree)/rust/zerocopy \
+			-o -path $(srctree)/rust/zerocopy-derive \
 		\) -prune -o \
 		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
diff --git a/rust/Makefile b/rust/Makefile
index a87b33926cdf..2fbdebb93bf2 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -52,10 +52,11 @@ ifdef CONFIG_RUST
 procmacro-name = $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name $(1) --crate-type proc-macro - </dev/null)
 procmacro-extension := $(patsubst libname.%,%,$(call procmacro-name,name))
 
+libzerocopy_derive_name := $(call procmacro-name,zerocopy_derive)
 libmacros_name := $(call procmacro-name,macros)
 libpin_init_internal_name := $(call procmacro-name,pin_init_internal)
 
-always-$(CONFIG_RUST) += $(libmacros_name) $(libpin_init_internal_name)
+always-$(CONFIG_RUST) += $(libzerocopy_derive_name) $(libmacros_name) $(libpin_init_internal_name)
 
 # `$(rust_flags)` is passed in case the user added `--sysroot`.
 rustc_sysroot := $(shell MAKEFLAGS= $(RUSTC) $(rust_flags) --print sysroot)
@@ -126,6 +127,12 @@ syn-flags := \
     --extern quote \
     $(call cfgs-to-flags,$(syn-cfgs))
 
+zerocopy_derive-flags := \
+    --cap-lints=allow \
+    --extern proc_macro2 \
+    --extern quote \
+    --extern syn
+
 pin_init_internal-cfgs := \
     kernel USE_RUSTC_FEATURES
 
@@ -175,7 +182,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 # command-like flags to solve the issue. Meanwhile, we use the non-custom case
 # and then retouch the generated files.
 rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
-    rustdoc-kernel rustdoc-pin_init rustdoc-zerocopy
+    rustdoc-kernel rustdoc-pin_init rustdoc-zerocopy rustdoc-zerocopy_derive
 	$(Q)grep -Ehro '<a href="srctree/([^"]+)"' $(rustdoc_output) | \
 		cut -d'"' -f2 | cut -d/ -f2- | while read f; do \
 			if [ ! -e "$(srctree)/$$f" ]; then \
@@ -208,6 +215,12 @@ rustdoc-syn: private rustc_target_flags = $(syn-flags)
 rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
 	+$(call if_changed,rustdoc)
 
+rustdoc-zerocopy_derive: private rustdoc_host = yes
+rustdoc-zerocopy_derive: private rustc_target_flags = $(zerocopy_derive-flags) \
+    --extern proc_macro --crate-type proc-macro
+rustdoc-zerocopy_derive: $(src)/zerocopy-derive/lib.rs rustdoc-clean rustdoc-syn FORCE
+	+$(call if_changed,rustdoc)
+
 rustdoc-macros: private rustdoc_host = yes
 rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
     --extern proc_macro --extern proc_macro2 --extern quote --extern syn
@@ -256,7 +269,7 @@ rustdoc-kernel: private is-kernel-object := y
 rustdoc-kernel: private rustc_target_flags = --extern ffi --extern pin_init \
     --extern build_error --extern macros \
     --extern bindings --extern uapi \
-    --extern zerocopy
+    --extern zerocopy --extern zerocopy_derive
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-ffi rustdoc-macros \
     rustdoc-pin_init rustdoc-compiler_builtins $(obj)/$(libmacros_name) \
     $(obj)/bindings.o FORCE
@@ -300,6 +313,12 @@ rusttestlib-syn: private rustc_target_flags = $(syn-flags)
 rusttestlib-syn: $(src)/syn/lib.rs rusttestlib-quote FORCE
 	+$(call if_changed,rustc_test_library)
 
+rusttestlib-zerocopy_derive: private rustc_target_flags = $(zerocopy_derive-flags) \
+    --extern proc_macro
+rusttestlib-zerocopy_derive: private rustc_test_library_proc = yes
+rusttestlib-zerocopy_derive: $(src)/zerocopy-derive/lib.rs rusttestlib-syn FORCE
+	+$(call if_changed,rustc_test_library)
+
 rusttestlib-macros: private rustc_target_flags = --extern proc_macro \
     --extern proc_macro2 --extern quote --extern syn
 rusttestlib-macros: private rustc_test_library_proc = yes
@@ -322,10 +341,10 @@ rusttestlib-pin_init: $(src)/pin-init/src/lib.rs rusttestlib-macros \
 rusttestlib-kernel: private rustc_target_flags = --extern ffi \
     --extern build_error --extern macros --extern pin_init \
     --extern bindings --extern uapi \
-    --extern zerocopy
+    --extern zerocopy --extern zerocopy_derive
 rusttestlib-kernel: $(src)/kernel/lib.rs rusttestlib-bindings rusttestlib-uapi \
     rusttestlib-build_error rusttestlib-pin_init $(obj)/$(libmacros_name) \
-    $(obj)/bindings.o rusttestlib-zerocopy FORCE
+    $(obj)/bindings.o rusttestlib-zerocopy rusttestlib-zerocopy_derive FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-bindings: private rustc_target_flags = --extern ffi --extern pin_init
@@ -359,7 +378,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
 		--extern kernel --extern build_error --extern macros \
 		--extern bindings --extern uapi \
-		--extern zerocopy \
+		--extern zerocopy --extern zerocopy_derive \
 		--no-run --crate-name kernel -Zunstable-options \
 		--sysroot=/dev/null \
 		$(doctests_modifiers_workaround) \
@@ -582,6 +601,12 @@ quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET))
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
+$(obj)/$(libzerocopy_derive_name): private skip_clippy = 1
+$(obj)/$(libzerocopy_derive_name): private rustc_target_flags = $(zerocopy_derive-flags)
+$(obj)/$(libzerocopy_derive_name): $(src)/zerocopy-derive/lib.rs $(obj)/libproc_macro2.rlib \
+    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+	+$(call if_changed_dep,rustc_procmacro)
+
 $(obj)/$(libmacros_name): private rustc_target_flags = \
     --extern proc_macro2 --extern quote --extern syn
 $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
@@ -737,10 +762,10 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 
 $(obj)/kernel.o: private rustc_target_flags = --extern ffi --extern pin_init \
     --extern build_error --extern macros --extern bindings --extern uapi \
-    --extern zerocopy
+    --extern zerocopy --extern zerocopy_derive
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
     $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o \
-    $(obj)/zerocopy.o FORCE
+    $(obj)/zerocopy.o $(obj)/$(libzerocopy_derive_name) FORCE
 	+$(call if_changed_rule,rustc_library)
 
 ifdef CONFIG_JUMP_LABEL
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ddf0461dda6a..911745743246 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -329,7 +329,7 @@ rust_common_cmd = \
 	-Zcrate-attr=no_std \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
 	-Zunstable-options --extern pin_init --extern kernel \
-	--extern zerocopy \
+	--extern zerocopy --extern zerocopy_derive \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 80f7647f633a..dc1219736f77 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -252,6 +252,12 @@ def generate_crates(
         [std, proc_macro, proc_macro2, quote, syn],
     )
 
+    zerocopy_derive = append_proc_macro_crate(
+        "zerocopy_derive",
+        srctree / "rust" / "zerocopy-derive" / "lib.rs",
+        [std, proc_macro, proc_macro2, quote, syn],
+    )
+
     build_error = append_crate(
         "build_error",
         srctree / "rust" / "build_error.rs",
@@ -310,7 +316,7 @@ def generate_crates(
     bindings = append_crate_with_generated("bindings", [core, ffi, pin_init])
     uapi = append_crate_with_generated("uapi", [core, ffi, pin_init])
     kernel = append_crate_with_generated(
-        "kernel", [core, macros, build_error, pin_init, ffi, bindings, uapi, zerocopy]
+        "kernel", [core, macros, build_error, pin_init, ffi, bindings, uapi, zerocopy, zerocopy_derive]
     )
 
     scripts = srctree / "scripts"
@@ -355,7 +361,7 @@ def generate_crates(
             append_crate(
                 crate_name,
                 path,
-                [core, kernel, pin_init, zerocopy],
+                [core, kernel, pin_init, zerocopy, zerocopy_derive],
                 cfg=generated_cfg,
             )
 
-- 
2.54.0


