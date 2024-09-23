Return-Path: <linux-kbuild+bounces-3687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9185F97F088
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 20:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01F13B21C8F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 18:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA711A7044;
	Mon, 23 Sep 2024 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1DT54jtG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7771A4F11
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115583; cv=none; b=dvTTWSXe3uI5EojgEDF+AgHkgJIbyqXAVeuj2dAqelKm3yCj7WMuvRSsZuoNpHI0xTEeJikjxDxJfsebVPoVCeoosTrHB/tWLjajeyN+78BB3SuHFuVlBIjgI7I4DgU+jbShVxXS65K3Wc91ANTKtk/g9mip59LeRJXVb3KmIWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115583; c=relaxed/simple;
	bh=OH24tQPuDnVpzlK2A4pw7td01bMw79FJr1MczVyAYNk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BwIblG22p/YHRSOHvZszvZctym6kj6HG4KtSVa3/91kUFfAfe+uiNsrNfXE+++OGKLQWWtqHMVlXr0KnvfXdTxO7VxTD94lkwCAC68Ohg74qnXEGkgVydNxatL6F2UuTSIZDiU7atD7H7v59IWQn824h4B/hjo0KbCXsBF/1n0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1DT54jtG; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e165fc5d94fso7385094276.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 11:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115580; x=1727720380; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgepgN3aRhrp+ARvxjN9eiDJ8ZxKyJSzBfNXPMCj9LE=;
        b=1DT54jtGnr+kES2waefeSMhdddasSguEMyfLRwa8f6E2anVxSPC5tpYcza+a3X5Cyq
         dg5GN4P3AeALiiG49/rBzu7B+Tl2tgGP7mAHb2iq6ilyEsSXBgUz5tj4dwGpkBiaS702
         eb8MfiNc9Xem0T201Qn6+kCcwhP2wRYuh13UIbbJuyohqT7fUCWVifDOn4Zjz0KdvB/r
         JFFhBVkEI8s1YrP+XlpVyaNwaflJDpFONp0UY4qr2hggm36XUSgDey5ofW/1EOQAzOO8
         XFefW/Mlb81LmaENdDi9WRv+DAcXQWbgNW0W2/kT8UNXpWEra5Ife5pXbgZYC476PuEP
         lXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115580; x=1727720380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgepgN3aRhrp+ARvxjN9eiDJ8ZxKyJSzBfNXPMCj9LE=;
        b=W4GPDxrHlGlDXrKt2rnb7bPbT5LG8t75Q2Mmon0TL4KIlAXCtaVPi2JVdBSGbPAcFG
         8MVeHvNF2CEQMAW2a79NVi4DbnrBm2yJDJEQxbE8FwrN1JwWnhtLPpCbJc+2xnBCjmcz
         T+HShXvUqFtyKtIvFXauPeXYUETiBMonnxbIuPY+STAfAPobuEJAnkJ8Wvjl1tGvF3JN
         yTnPFLSDIMuN2yWGqrcMa3fapSt25ZquIAmvscRqADCAoQU1I1NEs1VaAfFwD/i/HHqP
         yv4P08BQIY7LB55UG7yRKVzw0k44oAfc/nLhHNPEtEqtHKV0FkBVLLXbaDyQjbV0eAvx
         FGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4R//0UNWqvv5Q7L2Bhqmo+1RP7sNeI49gmZkiUAnbdqEjHoABQLusa7/N/2JTC7U7N4Z/gSQg0h787A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPfWK9uRdMWurGH13UyDr+++wpuJ3F57rH4TvOnuV2Lon1utrh
	mXbwJ2wSf1RUCCGFC8kgzaVqL+eiclpfPRa/UU3kqad7YEtrHZIdl3cs5mq4abM9ip7Q9Y6wWyk
	yZy4RymBTeYAXIfrXiuE+vgfhpA==
X-Google-Smtp-Source: AGHT+IGm8TyRvIoRQAss2gkVdi1286GfP5Qqk6F1uonGTA9V0dZMsunnuESBlFP3IoWyCP3MD6ektydfKaQSmobwhCE=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:690e:0:b0:e1d:21ae:3b95 with SMTP
 id 3f1490d57ef6-e2252fe2127mr32040276.10.1727115579734; Mon, 23 Sep 2024
 11:19:39 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:19:05 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5161; i=samitolvanen@google.com;
 h=from:subject; bh=OH24tQPuDnVpzlK2A4pw7td01bMw79FJr1MczVyAYNk=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN/JHTGAzkBH499+JOzF4Q/GVkLQ6gQNlt85t453Sp
 6H/cV98RykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjI3XZGhmPRhh96pt7a0fG7
 7KDBo02/Wx5ZWjao6OltCGf3YJ1fpMfI8FX6q21dl+311W+zl9351zBjqbvBDtHNW40N2QLd+Kw ceQE=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-41-samitolvanen@google.com>
Subject: [PATCH v3 19/20] kbuild: Add gendwarfksyms as an alternative to genksyms
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
implementation, but default to genksyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
 scripts/Makefile       |  2 +-
 scripts/Makefile.build | 39 +++++++++++++++++++++++++++++++--------
 3 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index c3a0172a909f..804b0b515d04 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -168,13 +168,36 @@ config MODVERSIONS
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
index 8f423a1faf50..ae13afb71123 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -107,18 +107,28 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(obj)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+gendwarfksyms := scripts/gendwarfksyms/gendwarfksyms
+getexportsymbols = $(NM) $(1) | sed -n 's/.* __export_symbol_\(.*\)/$(2)/p'
+
 genksyms = scripts/genksyms/genksyms		\
 	$(if $(1), -T $(2))			\
 	$(if $(KBUILD_PRESERVE), -p)		\
 	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
 
 # These mirror gensymtypes_S and co below, keep them in synch.
+ifdef CONFIG_GENDWARFKSYMS
+symtypes_dep_c = $(obj)/%.o
+cmd_gensymtypes_c = $(if $(skip_gendwarfksyms),,			\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |			\
+	$(gendwarfksyms) $(2:.symtypes=.o) $(if $(1), --symtypes $(2)))
+else
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.c FORCE
+$(obj)/%.symtypes : $(obj)/%.c $(symtypes_dep_c) FORCE
 	$(call cmd,cc_symtypes_c)
 
 # LLVM assembly
@@ -314,19 +324,32 @@ $(obj)/%.ll: $(obj)/%.rs FORCE
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
+	$(gendwarfksyms) $(2:.symtypes=.gendwarfksyms.o)		\
+		$(if $(1), --symtypes $(2))
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
2.46.0.792.g87dc391469-goog


