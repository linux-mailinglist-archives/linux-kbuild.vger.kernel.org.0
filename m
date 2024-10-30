Return-Path: <linux-kbuild+bounces-4433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E59B704B
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 00:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B26561C21639
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 23:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFC31BD9DF;
	Wed, 30 Oct 2024 23:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZlRl9g0J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3670A217655
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 23:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730329515; cv=none; b=WSx6YC+EL81dMuAvNlsgJ5f0F60OXc72Rz4d5oNuEj4u26hikHH2+1Xd5XJX/Sz2zbfTD7fhIE+SCzsw05X2q8+lhgrkV1nd15CIrkLD4vpJ5XITMH+OsnN0Lbzwpp7hxj/Rqw9DFgYD+tsPUVkZNsaIfbQoVZP6smdXunXWv/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730329515; c=relaxed/simple;
	bh=wPil2ZePOaGBCbeMdHPmjyhJDTULE3Tr9nw/1oyU7eE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kfcPWbH73xQwQfFfEd6wwTjuQbHe+78EY3NvIbXVxU7Dn71UTIPftZL9LsSoDMr9vp6ZMGfSA1EqjzANoT/qWeKoI5TrE1teNc4UlPUvMfCBh5Nd1zLMM5uB0EXUMyWSl1TcRd6LP921acA1ECX+GCYUoDh+nMSBVYYkafWkGyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZlRl9g0J; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ea258fe4b6so6876657b3.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 16:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730329511; x=1730934311; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+3KnK+Z0gtSs2Co5ku0tpPq/BkCZXZuUXUNlsOrMro=;
        b=ZlRl9g0JflIDAYJCrbZbY3cXotfqjnsL/rv1hF/KgnZQ2IWG6anFfnDMAXvKltGN8K
         /pjFf7CLsuYJU8WuGulJzLF3PRQRIjKiCQwHLfhu2cL+khjDmap9lwJuyzPTPEELTRGg
         WHz0HdORvestpNHGdiUSv1FHrLDeIXD3sCnr1dWqsGXWr/gb7f0oh2wud336iCiaqzUt
         eSKFWX6BUZma3YgdAiJ38ncGpm4i6lKH9yjBvI4GmrVQv0rrGPkaKxa62pcm7PcgkI9a
         XxZxAQwzH1lpuDmGCQ1oD852B3FWSQTmzWcH6FPINNW2R+SsY7KzHrPf3vCvnT0/NCW3
         N+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730329511; x=1730934311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+3KnK+Z0gtSs2Co5ku0tpPq/BkCZXZuUXUNlsOrMro=;
        b=T1GtzN9ZsSYFJA4M7lBQBs5LK2x+YNVynN8Db1lkfF0/CWy1l3SBPw2KJvYAxTFhlU
         e9B5regYl5YXEEVdsuY2bBdQBlf86XwN/BqL79DMEhiYUB/4ZMLAszVUJwDg7xCaYJ5j
         q2u6h6q3KIDj+wEPGPhD5AdYb1pu/xvpYFm0L31/dH/a5UHEgC3qAS0oAJAOONju9WDb
         Px82uOZMQfHuCAMEz86jByT+Wibxp1n5tmfQQpGrHsQQRfAbfCrlUIsraVWsVLmS6cGd
         in/tktRlRwkpz9kDYaQrZ3gn5JB05fHdLPCaSHRe9/0ZzMVg4obhynhkVSecjSM/FV/f
         VfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuuzXyVDmCU+s1wMUYz2rN7UVXsnr8W/LZhHyXukUOGL4PGxAey1+62Efquwq87eJlmKmAs2dcO7WmNd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSOh4X7N+pMneB7Hhcst3oGHT0HAwirmrFG5aHhaz2pTj9Oka
	AUO6YXJZj9/aRJgTbrCgWr3Ng+Pvd4Ih4hz2PDz3Rn1fbYl4xxvA9G+jg/RKnaxvb0mgFT+wLMF
	c3LeGJA==
X-Google-Smtp-Source: AGHT+IFXDvQAF6rmmyjqCuHXp7247+2WzHwGzszYhdJsIGiPI6HKKDpKzPTAlySRxwxd3AE241ZoGZd587t3
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:d806:0:b0:663:ddc1:eab8 with SMTP id
 00721157ae682-6e9d8b0412emr4041757b3.4.1730329511025; Wed, 30 Oct 2024
 16:05:11 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:05:04 +0000
In-Reply-To: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241030-extended-modversions-v8-3-93acdef62ce8@google.com>
Subject: [PATCH v8 3/3] rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sami Tolvanen <samitolvanen@google.com>

Previously, two things stopped Rust from using MODVERSIONS:
1. Rust symbols are occasionally too long to be represented in the
   original versions table
2. Rust types cannot be properly hashed by the existing genksyms
   approach because:
	* Looking up type definitions in Rust is more complex than C
	* Type layout is potentially dependent on the compiler in Rust,
	  not just the source type declaration.

CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
it to do so by selecting both features.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Co-developed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig  |  3 ++-
 rust/Makefile | 33 +++++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index c521e1421ad4abd80080bce8cf1c68389cb65c69..5e6d9868705ece2b2f6b90d7ce197a4d66240b6b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1946,7 +1946,8 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
+	select EXTENDED_MODVERSIONS if MODVERSIONS
+	depends on !MODVERSIONS || GENDWARFKSYMS
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
diff --git a/rust/Makefile b/rust/Makefile
index b5e0a73b78f3e58fc8fb8c9fab8fb5792406c6d8..0e98590082a1ac88e6ee29c28ce1b1d19982ac10 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -303,10 +303,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
+
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(NM) -p --defined-only $< \
-		| awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
+	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
@@ -378,11 +379,36 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashlti3 __lshrti3
 endif
 
+ifdef CONFIG_MODVERSIONS
+cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
+	$(call rust_exports,$@,"%s\n",$$3) | \
+	scripts/gendwarfksyms/gendwarfksyms \
+		$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable) \
+		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \
+		$@ >> $(dot-target).cmd)
+endif
+
 define rule_rustc_library
 	$(call cmd_and_fixdep,rustc_library)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gendwarfksyms)
 endef
 
+define rule_rust_cc_library
+	$(call if_changed_rule,cc_o_c)
+	$(call cmd,force_checksrc)
+	$(call cmd,gendwarfksyms)
+endef
+
+# helpers.o uses the same export mechanism as Rust libraries, so ensure symbol
+# versions are calculated for the helpers too.
+$(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
+	+$(call if_changed_rule,rust_cc_library)
+
+# Disable symbol versioning for exports.o to avoid conflicts with the actual
+# symbol versions generated from Rust objects.
+$(obj)/exports.o: private skip_gendwarfksyms = 1
+
 $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
@@ -394,6 +420,7 @@ ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
 
+$(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
@@ -404,6 +431,7 @@ $(obj)/alloc.o: private rustc_target_flags = $(alloc-cfgs)
 $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/build_error.o: private skip_gendwarfksyms = 1
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
@@ -413,6 +441,7 @@ $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/compiler_builtins.o \
     $(obj)/uapi/uapi_generated.rs FORCE

-- 
2.47.0.163.g1226f6d8fa-goog


