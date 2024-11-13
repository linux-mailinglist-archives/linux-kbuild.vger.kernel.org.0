Return-Path: <linux-kbuild+bounces-4672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D49C7EEA
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 00:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D1921F23102
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 23:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74785193408;
	Wed, 13 Nov 2024 23:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3QF0G66"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA90193061;
	Wed, 13 Nov 2024 23:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731541535; cv=none; b=UFDnKCHfIv71Uz+RJRC6Kmo9/GbUCQFJNbjsPMYnIh2NRhLQENn3lWdcBEkAAJsOnyQE9REpqxtYOt2hAo16so+09w8ZkLP6u/SUqvIat/ptM2sgKhZK01KGD9paKj2rQdpG0yLQwN/PHOHNbnMJGxzb1MIehxD5x//bwlR4cTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731541535; c=relaxed/simple;
	bh=ZsLl0bXqAO1JS0+ecvCCMFS8Q/vLSL1Yq8TvKhkaQBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQS+1RgxOnhzc3l6fQUw61WAoEXN7hLhM8WCftVD0aQpYoBn5GRa5unetBnyw0vznTY/Bj+YUjh4yoeMHjtf7A/dLBzFq45e4ji+IJSiol4YbgqiVnlCFZO7PlhkZ2HRcDacqaeV1fH7pwX3Gmf519WTjo67MVoWEcUNEwBOxVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3QF0G66; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5010CC4CEC3;
	Wed, 13 Nov 2024 23:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731541534;
	bh=ZsLl0bXqAO1JS0+ecvCCMFS8Q/vLSL1Yq8TvKhkaQBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n3QF0G66QRBewRZAEhbQW/2zbk6Kzh/VcvMunKkZpDb3+K57DvTEQSrmqjtf5PTOn
	 S+DJAcOcfPdqZJEn6+BGZvcHG/G4xE5rBQ+jS1MKl9daHO3Wqs0NABzX4H7E1kS3Nt
	 HmdeyTfUnfC58cCNtElvp1Th8ZwXyJJfZHy8SpQpcTYI98k/B8rCCXIA4IG/Voo4rT
	 kwakyLzkEC5RD/cwxRWovtLW120u0FLUWWMxT50S/JEqaSWybyvRTvgHSrLwxe13Fo
	 rV3Bd8FUrJ2gtVBwpbeyMJKyQjO7+ySyc3QnuylyNp1a3MOuIETxxIoMqURGe4JWwY
	 Y9p6dx4R6us5Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Borislav Petkov <bp@alien8.de>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Marco Elver <elver@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kbuild: enable objtool for *.mod.o and additional kernel objects
Date: Thu, 14 Nov 2024 08:45:22 +0900
Message-ID: <20241113234526.402738-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113234526.402738-1-masahiroy@kernel.org>
References: <20241113234526.402738-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, objtool is disabled in scripts/Makefile.{modfinal,vmlinux}.

This commit moves rule_cc_o_c and rule_as_o_S to scripts/Makefile.lib
and set objtool-enabled to y there.

With this change, *.mod.o, .module-common.o,  builtin-dtb.o, and
vmlinux.export.o will now be covered by objtool.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build    | 17 -----------------
 scripts/Makefile.lib      | 19 +++++++++++++++++++
 scripts/Makefile.modfinal |  4 ++--
 scripts/Makefile.vmlinux  |  4 ++--
 4 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 24e10c821461..18b76947fe96 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -202,23 +202,6 @@ ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 cmd_warn_shared_object = $(if $(word 2, $(modname-multi)),$(warning $(kbuild-file): $*.o is added to multiple modules: $(modname-multi)))
 endif
 
-define rule_cc_o_c
-	$(call cmd_and_fixdep,cc_o_c)
-	$(call cmd,checksrc)
-	$(call cmd,checkdoc)
-	$(call cmd,gen_objtooldep)
-	$(call cmd,gen_symversions_c)
-	$(call cmd,record_mcount)
-	$(call cmd,warn_shared_object)
-endef
-
-define rule_as_o_S
-	$(call cmd_and_fixdep,as_o_S)
-	$(call cmd,gen_objtooldep)
-	$(call cmd,gen_symversions_S)
-	$(call cmd,warn_shared_object)
-endef
-
 # Built-in and composite module parts
 $(obj)/%.o: $(obj)/%.c $(recordmcount_source) FORCE
 	$(call if_changed_rule,cc_o_c)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 73e385946855..17c81c346e36 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -302,14 +302,33 @@ endef
 # ===========================================================================
 # These are shared by some Makefile.* files.
 
+objtool-enabled := y
+
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
       cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
 		$(cmd_ld_single_m) \
 		$(cmd_objtool)
 
+define rule_cc_o_c
+	$(call cmd_and_fixdep,cc_o_c)
+	$(call cmd,checksrc)
+	$(call cmd,checkdoc)
+	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_symversions_c)
+	$(call cmd,record_mcount)
+	$(call cmd,warn_shared_object)
+endef
+
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
       cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
 
+define rule_as_o_S
+	$(call cmd_and_fixdep,as_o_S)
+	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_symversions_S)
+	$(call cmd,warn_shared_object)
+endef
+
 # Copy a file
 # ===========================================================================
 # 'cp' preserves permissions. If you use it to copy a file in read-only srctree,
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index d0153d033bbb..0547a4b59f13 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -26,10 +26,10 @@ KCSAN_SANITIZE := n
 ccflags-remove-y := $(CC_FLAGS_CFI)
 
 %.mod.o: %.mod.c FORCE
-	$(call if_changed_dep,cc_o_c)
+	$(call if_changed_rule,cc_o_c)
 
 .module-common.o: $(srctree)/scripts/module-common.c FORCE
-	$(call if_changed_dep,cc_o_c)
+	$(call if_changed_rule,cc_o_c)
 
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o =							\
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 1652561896eb..83fc1a861f41 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -12,10 +12,10 @@ include $(srctree)/scripts/Makefile.lib
 targets :=
 
 %.o: %.c FORCE
-	$(call if_changed_dep,cc_o_c)
+	$(call if_changed_rule,cc_o_c)
 
 %.o: %.S FORCE
-	$(call if_changed_dep,as_o_S)
+	$(call if_changed_rule,as_o_S)
 
 # Built-in dtb
 # ---------------------------------------------------------------------------
-- 
2.43.0


