Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74286350171
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235758AbhCaNj1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:39:27 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:39529 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbhCaNi6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:38:58 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFec003995;
        Wed, 31 Mar 2021 22:38:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFec003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197897;
        bh=CsrzD+VHMQFiqVVY3z016djKNDznKoCvYX6jCBwlclQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FgIC6CbW3JuqH4Stbt5CDZ+8b8M/VZH9Tep8YtUU38ZdTE7Pf4xwbZrg9D4WNj04M
         FIlchrLMcV9LWL3TZTticIYTk6JLSN8Kosoy3sWL3PcQFj1uRX50Nd1umZTv3NO2jQ
         2u+T8XkrRHjzdkypUZPsLY1E5BOu1g9jQd0lIeZrMJ2yLL/WXyWIcURqrQ2zchWCen
         F9cnAiuyFzHGSFmvZYQStmxnyxjswxHIlpRfj2BeYz6I7ODeWwDb7d3YJtklSSKi+9
         SYwkq/lPcayxguPUn8Ky11xYfmuDXLdaf1BUbV8dtST7j5qsxNdzOF17dQmBF34nGX
         aQm19lc8iSV0g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: [PATCH 5/9] kbuild: rename extmod-prefix to extmod_prefix
Date:   Wed, 31 Mar 2021 22:38:06 +0900
Message-Id: <20210331133811.3221540-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This seems to be useful in sub-make as well. As a preparation of
exporting it, rename extmod-prefix to extmod_prefix because exported
variables cannot contain hyphens.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index b5ff4753eba8..e3c2bd1b6f42 100644
--- a/Makefile
+++ b/Makefile
@@ -919,7 +919,7 @@ endif
 ifdef CONFIG_LTO_CLANG
 ifdef CONFIG_LTO_CLANG_THIN
 CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
-KBUILD_LDFLAGS	+= --thinlto-cache-dir=$(extmod-prefix).thinlto-cache
+KBUILD_LDFLAGS	+= --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
 else
 CC_FLAGS_LTO	:= -flto
 endif
@@ -1141,9 +1141,9 @@ endif # CONFIG_BPF
 
 PHONY += prepare0
 
-extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
-export MODORDER := $(extmod-prefix)modules.order
-export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
+extmod_prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
+export MODORDER := $(extmod_prefix)modules.order
+export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
 
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
@@ -1742,7 +1742,7 @@ build-dirs := $(KBUILD_EXTMOD)
 $(MODORDER): descend
 	@:
 
-compile_commands.json: $(extmod-prefix)compile_commands.json
+compile_commands.json: $(extmod_prefix)compile_commands.json
 PHONY += compile_commands.json
 
 clean-dirs := $(KBUILD_EXTMOD)
@@ -1832,12 +1832,12 @@ endif
 
 PHONY += single_modpost
 single_modpost: $(single-no-ko) modules_prepare
-	$(Q){ $(foreach m, $(single-ko), echo $(extmod-prefix)$m;) } > $(MODORDER)
+	$(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$m;) } > $(MODORDER)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 KBUILD_MODULES := 1
 
-export KBUILD_SINGLE_TARGETS := $(addprefix $(extmod-prefix), $(single-no-ko))
+export KBUILD_SINGLE_TARGETS := $(addprefix $(extmod_prefix), $(single-no-ko))
 
 # trim unrelated directories
 build-dirs := $(foreach d, $(build-dirs), \
@@ -1906,12 +1906,12 @@ nsdeps: modules
 quiet_cmd_gen_compile_commands = GEN     $@
       cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
 
-$(extmod-prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
+$(extmod_prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
 	$(if $(KBUILD_EXTMOD),,$(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)) \
 	$(if $(CONFIG_MODULES), $(MODORDER)) FORCE
 	$(call if_changed,gen_compile_commands)
 
-targets += $(extmod-prefix)compile_commands.json
+targets += $(extmod_prefix)compile_commands.json
 
 PHONY += clang-tidy clang-analyzer
 
@@ -1919,7 +1919,7 @@ ifdef CONFIG_CC_IS_CLANG
 quiet_cmd_clang_tools = CHECK   $<
       cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
 
-clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
+clang-tidy clang-analyzer: $(extmod_prefix)compile_commands.json
 	$(call cmd,clang_tools)
 else
 clang-tidy clang-analyzer:
-- 
2.27.0

