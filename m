Return-Path: <linux-kbuild+bounces-2645-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038093B4BC
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 18:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419C21C21431
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 16:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7543115B551;
	Wed, 24 Jul 2024 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIWbnI13"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B0171BB;
	Wed, 24 Jul 2024 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837754; cv=none; b=VdzOfs9YBGH+LY0VgbcwnPQcH5PgVeB/dLWsfzO5lTij2TXrQCHDx/DmFKk+QVeXqZCZDjRcOhgkKxjFLh2fKC9kicUIk+nkJ9XuZtMglNJ4FecTSnMW3+UJLXRmGGOPvta2eQHs6lJFji0Ut68FGe9FHGArG6hTQ1jANAZwh2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837754; c=relaxed/simple;
	bh=0/hiCSUjGonwjymNGnxXjWCGKGZIBkbETFeLBJg2AN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iw80zdnRyEr42JVPJypXS/3+Pf5TIQ4IeywzKzGx4z8ECFQ3Ju106WPEhluYGYhhpGu60JAJ5wa6A7y++wsBei86LRotVL2dGCNP26KTxwHeHN2Jt7J0Rn/DXUPn+oB93wpJFL5Ydh8dHC9StT6xpXuSUIFY1aE7uUWOzS9Zou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIWbnI13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD69C32781;
	Wed, 24 Jul 2024 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721837753;
	bh=0/hiCSUjGonwjymNGnxXjWCGKGZIBkbETFeLBJg2AN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iIWbnI13o1EbyQjHmgIKaEm6OVbaYGHQybD2hbT9SGXPbrUlYXjRKib2SOre07brC
	 7FrP0/HqIXgkAVIePValSU28CTaHDG2thvXooKBFllGJzNqqz/Cuu3SszdRubRsLQK
	 BxJK6LLjASoJmsdeuBC0lkJbpz6RJ8REESmzSjdMr1WFuWmzbCTrIGrpMIGBMxmVVe
	 2oK/F7AwbtMZ0x62QWB4tSGFn8/62xvhn3rHut44Csdy8JAawBJJvKYxHylWq8C/Gj
	 91TCEDg6mVCCBvyzHtR3rhQkxAQdWHbR/At5euryV4eIML4QJeaTSEs1OaITZ2QcZV
	 dAE1n2Mb18T1Q==
From: Miguel Ojeda <ojeda@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 6/6] objtool/kbuild/rust: enable objtool for Rust
Date: Wed, 24 Jul 2024 18:14:59 +0200
Message-ID: <20240724161501.1319115-7-ojeda@kernel.org>
In-Reply-To: <20240724161501.1319115-1-ojeda@kernel.org>
References: <20240724161501.1319115-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we should be `objtool`-warning free, enable `objtool` for
Rust too.

Before this patch series, we were already getting warnings under e.g. IBT
builds, since those would see Rust code via `vmlinux`.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile          | 22 ++++++++++++++--------
 scripts/Makefile.build |  9 +++++++--
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index bf05e65365da..1756238b641d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -344,7 +344,8 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
 		--sysroot=/dev/null \
-	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
+	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
+	$(cmd_objtool)
 
 rust-analyzer:
 	$(Q)$(srctree)/scripts/generate_rust_analyzer.py \
@@ -366,44 +367,49 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashlti3 __lshrti3
 endif
 
+define rule_rustc_library
+	$(call cmd_and_fixdep,rustc_library)
+	$(call cmd,gen_objtooldep)
+endef
+
 $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library)
 ifdef CONFIG_X86_64
 $(obj)/core.o: scripts/target.json
 endif
 
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library)
 
 $(obj)/alloc.o: private skip_clippy = 1
 $(obj)/alloc.o: private skip_flags = -Wunreachable_pub
 $(obj)/alloc.o: private rustc_target_flags = $(alloc-cfgs)
 $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_builtins.o FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library)
 
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library)
 
 $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/compiler_builtins.o \
     $(obj)/bindings/bindings_generated.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library)
 
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/compiler_builtins.o \
     $(obj)/uapi/uapi_generated.rs FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library)
 
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
     $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library)
 
 endif # CONFIG_RUST
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index efacca63c897..72b1232b1f7d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -288,10 +288,15 @@ rust_common_cmd = \
 # would not match each other.
 
 quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $<
+      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $< $(cmd_objtool)
+
+define rule_rustc_o_rs
+	$(call cmd_and_fixdep,rustc_o_rs)
+	$(call cmd,gen_objtooldep)
+endef
 
 $(obj)/%.o: $(obj)/%.rs FORCE
-	+$(call if_changed_dep,rustc_o_rs)
+	+$(call if_changed_rule,rustc_o_rs)
 
 quiet_cmd_rustc_rsi_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
       cmd_rustc_rsi_rs = \
-- 
2.45.2


