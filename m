Return-Path: <linux-kbuild+bounces-13631-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NsZFL2DRJmo1lAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13631-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:27:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E366572AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:27:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VJZPPNYR;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13631-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13631-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DF89307D3FA
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E4F3CB2C7;
	Mon,  8 Jun 2026 14:16:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4F63CC9EA;
	Mon,  8 Jun 2026 14:16:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928167; cv=none; b=Y3wfsVbYskPR/PEXtpXr1B4FhdxSgf/Qbzfzvo3YB4WO5Nhm6270gKUTH/F4C84woij7PXN0RbwFvajT3KBR70QkuhTj1AUJp6f9Vf7DDQ4iBkbJK7gA2SV0K1FfHqq1wurTM0QhVF+fFLQaGf5ojOLNR7zQXdE+kP9zqcI3L5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928167; c=relaxed/simple;
	bh=srva8HB7eVbJIRysZf4JJ7N/BdgMOtdL2DZBBINCaSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOYDpdtXNj72LQzualgmFWneGpvDTQLSKCpcWpxCE+8Vm57zcNSSF7RJpHSKM/IT4eJGVqEt60cQIasE+W8OXJWuxbpgGT30EMtOCUparWUJhopcmSOLwdVNn+nEPSuKHBX9P1d/mRFiBgk2F5oCuwWi1xjhaPYnk17zi7IQAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJZPPNYR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7551F0089A;
	Mon,  8 Jun 2026 14:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928165;
	bh=rF1H54qh6cTQCWrj20dxDSKZ4D90sLDUNqD3SXg53F8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VJZPPNYRB19qzKx+pgdy6+A+IjvIWZeObPvRCg5JvOGdeoFfFdmveqq2NWu2/CYP5
	 u4El/ozNM+tbdioQJhMFDB0lQK9YmogKUqYwd3XgQMYiomEu5A4ZpD+tIh2yficGML
	 2zenS99xAW2n+NzS0bU0kkgIZnXxTs2E+BS86rMOHTzs8jPeaAi0sPb8qrdHiE3fzL
	 qB7Qu2FGCz6i+dR1GhbQEwxK1WfmkNsZNMY5L4JzvwfVCyZyRycokD7O+WuQL253Ab
	 hY9XPcvGSn5c2HnQ8oRcog2FeyGojgkslflnoDz+HtjX+X6xBY9BD9rNJyHC9HIQi2
	 iFM+CJaQ3u5bA==
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
Subject: [PATCH v2 12/19] rust: zerocopy: enable support in kbuild
Date: Mon,  8 Jun 2026 16:14:31 +0200
Message-ID: <20260608141439.182634-13-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13631-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38E366572AF

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
index 7b1db0d5d423..a87b33926cdf 100644
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
@@ -337,6 +359,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
 		--extern kernel --extern build_error --extern macros \
 		--extern bindings --extern uapi \
+		--extern zerocopy \
 		--no-run --crate-name kernel -Zunstable-options \
 		--sysroot=/dev/null \
 		$(doctests_modifiers_workaround) \
@@ -599,6 +622,7 @@ rust-analyzer:
 		--cfgs='syn=$(syn-cfgs)' \
 		--cfgs='pin_init_internal=$(pin_init_internal-cfgs)' \
 		--cfgs='pin_init=$(pin_init-cfgs)' \
+		--envs='zerocopy=$(zerocopy-envs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
@@ -670,6 +694,13 @@ $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
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
@@ -705,9 +736,11 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
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
index 2477209e1e94..80f7647f633a 100755
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


