Return-Path: <linux-kbuild+bounces-2173-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D4B90B8D3
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 20:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21AB3285608
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 18:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDAE19AA61;
	Mon, 17 Jun 2024 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dX/YX/jm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0415F19A2AA
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647134; cv=none; b=PDy+3dSdt6j3qo3MvlvpmvnXduowYGu/6h/fNKHHgC6iHj4/nN1tCDRxJo4f9SS5IKwSXFznJVN4YB3p1nq2+TS3j7OxwNsW66VSJYlTvvV7fFU+1nu5OHZtTmvE4DsHqKiWTzDwIBQQGMKhG8TBaIFDPqV7YS2on0t5fE28SIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647134; c=relaxed/simple;
	bh=fgkHPoIfKV45x9z/FkKUVFWMMp1fQbapxOYrE3e+eC0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RkypiJk8IE1CDGwW/AFvhulNV8sqWz5E8HKpbYFmPLcXDeE8rPDdZXAdtAKQLZT/2smVKIxqtFEXQ1GVcp6H+tQVODNvrAyBvMsswTMT3pjwILj5H9rzsUbKuT45kteKqDi4o/g4EmbhbOCANFQWCPFOgKJ8wpOmtq20kk/23Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dX/YX/jm; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfef7ac17f8so5405685276.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647132; x=1719251932; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bLYk6wjWkl3juH0J6ovTQNRSOAciGZLb1YErRTCUnNY=;
        b=dX/YX/jmYd3sn8Pm4eMUMr9zmf5njHWQXEJKDY14VnL8yfKXGT03KATgH/1uhZ0z4j
         ekgFoIej7jr6trCy75t5T9iUqTQH+88MkT3Z9hkc+6L+OG+6mbEanFp44pNd2cNqHMWZ
         dSSW4YBua3kFRd4DUT6oYPFNaBVdHeyCOJaplPtzr32obEebpkAxkQ3kcjZ60OlCWCYS
         KQ8u3JUDLiYD0pHx065dUx/5L+6DFdprv3xefHXLt7vKaK45zBMWm2DjU7VrVhvQbwUl
         IFBLg82Gq/uvunSht0hos4EszJSNnbOOB5t/g14tUSBMQCRlNGDv8jpkvgYmkBFCuE8J
         8qRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647132; x=1719251932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLYk6wjWkl3juH0J6ovTQNRSOAciGZLb1YErRTCUnNY=;
        b=gT2lIOrDIngNX2pjTo3myX57N86aFpC+4Lh1LZwy9Bc6NQuzUY5K9vIrKDGAXd3FZW
         dAO7xurEAd1uDcqsKyzmobySZgpKGTw6qohBruoGdiRtX4jIINz18pRSbnLc9H69LOQu
         AFaDGi0SJQ4waReSTs6u6vAy2I36jmXpikta8RACbP3HBUjRzK1Dm7o78YNVmwz7RhfY
         GJzfel6HZ+AowgNegZKBrabXuR086GvrPKw4BeOeZ71AS+4jP/s7aqh/akAWQVkhCE30
         WuzgfewB3Ckx9bhv949PFsKTSZLay+J0zYBDV6/RCWBRcM2pOA9ov7+ZzIZcrZFMhCEH
         6V1A==
X-Forwarded-Encrypted: i=1; AJvYcCWELR/9FAczuu1bwVfZsWPDZce64nZAf4N75hrhAwsgzxEQSE59ipI+223ZS4wFYEi++fuKzgE/uVNtUgjFQwQapcaNMqD0HALvwu0s
X-Gm-Message-State: AOJu0Yxf4tG0LCZrhAX9AZjjUlOWHUTkRgdot9gka2zukuNXA1oim7h8
	/glHTTgRlcpUqhZWf5/lymlTvfY/KEaQYhjjElKZfwngpq2LG4M0JVCs2p89oEak8Vow6z1MNzL
	xeQK75/KNUsydNHndKUYYW8jVWA==
X-Google-Smtp-Source: AGHT+IGQ0kaxipcpN+AMKyQsL99MKALkBH0wZMe834vcYOvJGUzDPB28UULwwd+JdyoFZzcBb+pYU7AhTng+2Qb9itM=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:ab0d:0:b0:dff:1d27:4b80 with SMTP
 id 3f1490d57ef6-e022392641amr44457276.4.1718647132243; Mon, 17 Jun 2024
 10:58:52 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:34 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4578; i=samitolvanen@google.com;
 h=from:subject; bh=fgkHPoIfKV45x9z/FkKUVFWMMp1fQbapxOYrE3e+eC0=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk8LDHvXIagYgFxknPxDdn8T7FgRTBtTGHds
 CYsT4RaZamJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5PAAKCRBMtfaEi7xW
 7pyDC/wIk2JiSe2ugPHTOqu/njY6MVYno9CbIgmrLTZ0ZnVep6zki2FMFDLiAE29rs9ul7uERoe
 61Q5nEgznEwOdDHFzHScSXRFFoIbNTAZJ8Too04vEMhHatyd3+r0J2sUPSbk5objzs2RBjWXVOJ
 +HJWS9xd2kwA1WEvGODVBo6k9WX26WKsxUR6ug0YZ4DCsBRj8/JdygTUEhnZm3zDlIsh3CChA1Q
 OP24DTzd0veW8UhuU6HasbiKGeld/Zpc++SJ+9CxSycH6XJxzvNyf/t4xVP8K4iBAk3fNxhWNVZ
 dEpMWHA9qOyST2nWwEzUDxDuX6Ops1r74rScwidUizuA1wKxCJKhysN+R87QRIyjdeQ4Wd76LR5
 cC7hwZKIR9/KlC6lKe/HylfxgeRl39fveo5Lf820BN2nuDjjapNM8sf049Fdl+IRJKiEn3zGPgq 1GceOJLEwD2pwfTdrYjejSqR7O7OwIFPUK0Uz8eJtceNHcXGCizMdAadlBQdgE8z/kaXc=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-32-samitolvanen@google.com>
Subject: [PATCH 15/15] kbuild: Use gendwarfksyms to generate Rust symbol versions
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Use gendwarfksyms to generate symbol versions for exported Rust symbols,
and allow CONFIG_MODVERSIONS to be enabled with CONFIG_RUST, assuming the
debugging information needed by gendwarfksyms is also available.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 Makefile      |  6 ++++++
 init/Kconfig  |  2 +-
 rust/Makefile | 30 ++++++++++++++++++++++++------
 3 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 14427547dc1e..0701917c5172 100644
--- a/Makefile
+++ b/Makefile
@@ -1344,6 +1344,12 @@ prepare: tools/bpf/resolve_btfids
 endif
 endif
 
+ifdef CONFIG_MODVERSIONS
+ifdef CONFIG_RUST
+prepare: tools/gendwarfksyms
+endif
+endif
+
 PHONY += resolve_btfids_clean
 
 resolve_btfids_O = $(abspath $(objtree))/tools/bpf/resolve_btfids
diff --git a/init/Kconfig b/init/Kconfig
index 72404c1f2157..ef29f002e932 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1903,7 +1903,7 @@ config RUST
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
 	depends on !CFI_CLANG
-	depends on !MODVERSIONS
+	depends on !MODVERSIONS || (DEBUG_INFO && !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT)
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
diff --git a/rust/Makefile b/rust/Makefile
index f70d5e244fee..385cdf5dc320 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -356,10 +356,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+rust_exports = $(NM) -p --defined-only $(1) | awk '/ (T|R|D) / { printf $(2),$(3) }'
+
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(NM) -p --defined-only $< \
-		| awk '/ (T|R|D) / {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
+	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
@@ -420,12 +421,29 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashlti3 __lshrti3
 endif
 
+ifdef CONFIG_MODVERSIONS
+# When module versioning is enabled, calculate symbol versions from the DWARF
+# debugging information. We can't use a source code parser like genksyms,
+# because the source files don't have information about the final structure
+# layout and emitted symbols.
+gendwarfksyms := $(objtree)/tools/gendwarfksyms/gendwarfksyms
+
+cmd_gendwarfksyms = \
+	$(call rust_exports,$@,"%s %s\n",$$1$(comma)$$3) \
+		| $(gendwarfksyms) $@ >> $(dot-target).cmd
+endif
+
+define rule_rustc_library_with_exports
+	$(call cmd_and_fixdep,rustc_library)
+	$(call cmd,gendwarfksyms)
+endef
+
 $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Dunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library_with_exports)
 ifdef CONFIG_X86_64
 $(obj)/core.o: scripts/target.json
 endif
@@ -438,7 +456,7 @@ $(obj)/alloc.o: private skip_clippy = 1
 $(obj)/alloc.o: private skip_flags = -Dunreachable_pub
 $(obj)/alloc.o: private rustc_target_flags = $(alloc-cfgs)
 $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_builtins.o FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library_with_exports)
 
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_dep,rustc_library)
@@ -447,7 +465,7 @@ $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/compiler_builtins.o \
     $(obj)/bindings/bindings_generated.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library_with_exports)
 
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/compiler_builtins.o \
@@ -458,6 +476,6 @@ $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
     $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
-	+$(call if_changed_dep,rustc_library)
+	+$(call if_changed_rule,rustc_library_with_exports)
 
 endif # CONFIG_RUST
-- 
2.45.2.627.g7a2c4fd464-goog


