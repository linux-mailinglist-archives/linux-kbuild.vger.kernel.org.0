Return-Path: <linux-kbuild+bounces-4425-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57F9B6A7D
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE5EAB21C8B
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF23A23AA6F;
	Wed, 30 Oct 2024 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E/yLFwsn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC79F235A0C
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307717; cv=none; b=pfzuDSOHSJbZ4w18BEjSbNgPK/dBuupdarNUkaGtxy504IzWz8DSdvUbFGRNXu/ewOPgYr4BloSS5ckL3Lm/VPvgPYEPYiiHw751YvcLmD97gjGuz03WdydAYLLWHsFQJ6WJtzCBEME6Rb/gzj648jCEGbumn9CQc/og7PgC6mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307717; c=relaxed/simple;
	bh=QeqSbCsPj7qrRhglch9sMXx52tVBAJeYNKhv77vFEtY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KsKm1kXeHAgMWVZg35s8xLG8u2PY7fzxLs7j5baHMMQXK2YF8CNmRk58zEZpSkSdBdcZKxcxiKJJzIFOO7rMw+/qMmn4hQ2M4wLigvsULwYe0YVygefaGSj/C0+dSXcPj20xcBFawvdRX7GLiX7UQQhoAm3B8XwoOrRHV7Lzhmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E/yLFwsn; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7c6a9c1a9b8so97161a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307714; x=1730912514; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vIug+S7emoCYpKR4nFVHSEuFz95qB3OCAjrjCPUc3mI=;
        b=E/yLFwsnPfXkLQ8oO0KVY8rqiMALVcI5cR0jtp9TXF89Ji9Uw0kCRP/2vXNVUq2HBb
         KgK+RJbhqFcbeuJ3AePuf/j6KHtm2H/keV/TLJbLHJMrE2xg1RflPzLm40D45OsCiwkl
         0e3UThmny87lmZaEvFSDJmJzXXe1x+W5o5tpTQV7lo3gcJnC2wwSXIE0Y18JiDk+YrxU
         SLN6KZHRVdgp/s/V0Agg9YvuKXC/vU39fBVpGNwhm4IvinGMB/lFAwU9mIyen/GMbj3v
         /e+u5zuQurYQ8ior8gQahtNL/3Y7qG6aR0zAmji08bK9HlAplCJvVUlJ+UeVAiOTRtUZ
         o3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307714; x=1730912514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIug+S7emoCYpKR4nFVHSEuFz95qB3OCAjrjCPUc3mI=;
        b=TVZ2bdjMgYyFKKw9xF2jKonY63dAgRQGBFGdcfLZWYh3wF7XiERkZilJDdkbWmNm6D
         bBUy/ioFbnLfRNOUX4GMZ9tzTZ/rOG78YylPISwf7epd0tHBCksfkYYz34hI7Uv6aTd3
         EQ61C5SvEsOvsycjCyEVo39QrXTP8wro3wGI85EU5sylg7JGoJXwx3zKD5v2qEf9KLfG
         qztAN2jDSKBQeQuUbbISbNzm/HzSSX+jNPOp1gM32ojwTeKRU1qTSMEzRUrYKMOFlEqQ
         Tn596X8KR6SAnnNFyDxKQDIuGCPWdC6Gt95Il0yhtJ+Ax2nXGu5hGP3G4mjGrFgPEH8p
         a5fw==
X-Forwarded-Encrypted: i=1; AJvYcCVcQTI3oNj51ILS7NNu+WeMnlFBv658QzJEbli6lxVcwgm0aF5+lcyJYqF066nU/YX//H2iyKUDhHO/QMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ZZTWsGBGXD1M6ld0jgS/LoI9R5VhkiEDgLNYZ6mfsxOqAZhT
	ej6EHYL91FNKp3V5JSZYYBOxAvVPnDCcyAYsSlW2aNG1YCgtjcfzo0C/JlM0VILUT9PcJwCFmOK
	xzN4Xplhc8Yd5YwhBJaqJfJZe4Q==
X-Google-Smtp-Source: AGHT+IGkDgNvAc7QgTxnQXGlbFGgIkGE0d3gPCPIyv5YYRky9bix4wE6z0LYzBTK9o7Os12OXUE3m3rVYuFt1FFJpko=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:385c:0:b0:7ea:999a:7930 with SMTP
 id 41be03b00d2f7-7edd7b6c7e8mr24309a12.1.1730307713761; Wed, 30 Oct 2024
 10:01:53 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:25 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5224; i=samitolvanen@google.com;
 h=from:subject; bh=QeqSbCsPj7qrRhglch9sMXx52tVBAJeYNKhv77vFEtY=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKadF1rBc3yhe9XddxbnWVwLU5KVcTNX9bF8fP+PppU
 XPyuUaGjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRx/YM/9TTmtNefL30t+W6
 eoXo54yVemacOnyVt9Ys16uTN742v4CR4VSKdZ5pC+ON3Yz2vtwLlp795LKJfe7E0vKLc6bybFn IzgwA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-39-samitolvanen@google.com>
Subject: [PATCH v5 18/19] kbuild: Add gendwarfksyms as an alternative to genksyms
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
implementation, but default to genksyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
 scripts/Makefile       |  2 +-
 scripts/Makefile.build | 41 +++++++++++++++++++++++++++++++++--------
 3 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index f9e5f82fa88b..e6b2427e5c19 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -169,13 +169,36 @@ config MODVERSIONS
 	  make them incompatible with the kernel you are running.  If
 	  unsure, say N.
 
+choice
+	prompt "Module versioning implementation"
+	depends on MODVERSIONS
+	default GENKSYMS
+	help
+	  Select the tool used to calculate symbol versions for modules.
+
+	  If unsure, select GENKSYMS.
+
+config GENKSYMS
+	bool "genksyms (from source code)"
+	help
+	  Calculate symbol versions from pre-processed source code using
+	  genksyms.
+
+	  If unsure, say Y.
+
 config GENDWARFKSYMS
-	bool
+	bool "gendwarfksyms (from debugging information)"
 	depends on DEBUG_INFO
 	# Requires full debugging information, split DWARF not supported.
 	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
 	# Requires ELF object files.
 	depends on !LTO
+	help
+	  Calculate symbol versions from DWARF debugging information using
+	  gendwarfksyms. Requires DEBUG_INFO to be enabled.
+
+	  If unsure, say N.
+endchoice
 
 config ASM_MODVERSIONS
 	bool
diff --git a/scripts/Makefile b/scripts/Makefile
index d7fec46d38c0..8533f4498885 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -53,7 +53,7 @@ hostprogs += unifdef
 targets += module.lds
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
-subdir-$(CONFIG_MODVERSIONS) += genksyms
+subdir-$(CONFIG_GENKSYMS) += genksyms
 subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_SECURITY_IPE) += ipe
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f423a1faf50..d2a0440cdb79 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -107,18 +107,31 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(obj)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+getexportsymbols = $(NM) $(1) | sed -n 's/.* __export_symbol_\(.*\)/$(2)/p'
+
+gendwarfksyms = scripts/gendwarfksyms/gendwarfksyms	\
+	$(if $(1), --symtypes $(2))			\
+	$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable)
+
 genksyms = scripts/genksyms/genksyms		\
 	$(if $(1), -T $(2))			\
 	$(if $(KBUILD_PRESERVE), -p)		\
 	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
 
 # These mirror gensymtypes_S and co below, keep them in synch.
+ifdef CONFIG_GENDWARFKSYMS
+symtypes_dep_c = $(obj)/%.o
+cmd_gensymtypes_c = $(if $(skip_gendwarfksyms),,	\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |	\
+	$(gendwarfksyms) $(2:.symtypes=.o))
+else
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.c FORCE
+$(obj)/%.symtypes : $(obj)/%.c $(symtypes_dep_c) FORCE
 	$(call cmd,cc_symtypes_c)
 
 # LLVM assembly
@@ -314,19 +327,31 @@ $(obj)/%.ll: $(obj)/%.rs FORCE
 # This is convoluted. The .S file must first be preprocessed to run guards and
 # expand names, then the resulting exports must be constructed into plain
 # EXPORT_SYMBOL(symbol); to build our dummy C file, and that gets preprocessed
-# to make the genksyms input.
+# to make the genksyms input or compiled into an object for gendwarfksyms.
 #
 # These mirror gensymtypes_c and co above, keep them in synch.
-cmd_gensymtypes_S =                                                         \
-   { echo "\#include <linux/kernel.h>" ;                                    \
-     echo "\#include <asm/asm-prototypes.h>" ;                              \
-     $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);/p' ; } | \
-    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+getasmexports =								\
+   { echo "\#include <linux/kernel.h>" ;				\
+     echo "\#include <linux/string.h>" ;				\
+     echo "\#include <asm/asm-prototypes.h>" ;				\
+     $(call getexportsymbols,$(2:.symtypes=.o),EXPORT_SYMBOL(\1);) ; }
+
+ifdef CONFIG_GENDWARFKSYMS
+cmd_gensymtypes_S =							\
+	$(getasmexports) |						\
+	$(CC) $(c_flags) -c -o $(2:.symtypes=.gendwarfksyms.o) -xc -;	\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |			\
+	$(gendwarfksyms) $(2:.symtypes=.gendwarfksyms.o)
+else
+cmd_gensymtypes_S =							\
+	$(getasmexports) |						\
+	$(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_S = $(call cmd_gensymtypes_S,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.S FORCE
+$(obj)/%.symtypes : $(obj)/%.S $(obj)/%.o FORCE
 	$(call cmd,cc_symtypes_S)
 
 
-- 
2.47.0.163.g1226f6d8fa-goog


