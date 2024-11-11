Return-Path: <linux-kbuild+bounces-4644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6B9C4371
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 18:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4121B26085
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 17:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169741A76C4;
	Mon, 11 Nov 2024 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0bks52g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E471A76BB;
	Mon, 11 Nov 2024 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731345491; cv=none; b=sCdPOMpUsqkHvS/pwwOMiYT9xCLxMR3xZaC/HTIstToq8H/9oaD7vv9d2i6617rX6tR25qHkg4C2mTEkz6D5KKFmTr4HiwQ4xzeOAI4UqMuhhp5YChSAa6S3usa7GfjbKJM4JA7NhyO5RmmuHNxqKAqEMoW8naQbxaasNtQMVKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731345491; c=relaxed/simple;
	bh=HyEOb/ajtvjoLfiZKpME9ST5LNje9cuvxLYuXrgFb5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mB3OAV62XTGMq6xF5+3snuYi/ICZXhXsHcYDpjaN3G8uwfuTSSM8mEyC8wBXNumArLuq4TtgW9msCi0qoCgSSwprFYCvtJ0yLH6x0svIlq3V+dYBR+VBd9FdIFNRIZuzw5deTq1U08FC4vzX9HE46LaBM2o6CvASJsRcn0B7Zao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0bks52g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A334BC4CED5;
	Mon, 11 Nov 2024 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731345490;
	bh=HyEOb/ajtvjoLfiZKpME9ST5LNje9cuvxLYuXrgFb5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z0bks52gnt1bEqRF3aZJ+8iWUlEtClKLKcDGl0L814v25Ug+NYu4J5HcWW3QMwvJy
	 EzFkFKCUMUQDGRb9pAywWmAopbJhTS3u2GJ4dUl0CrWSXJKuc+bslXZeiCXU30hSxq
	 el3ZRGPN0I11tsMlJ9e81W4fW61+iAu+E8xCSKlkdm08CGPOzjBUx1JaVT/iwqVZBb
	 I61GIqdNfayd7WEf1H/74PBk4zXNTcs0vGJr6pJYlIvpdTZw57sKfsGLa9Qf73T5NC
	 DbvamfzfeSKrcotl8/Ix1nMKFAu626WNCc58LtMamS7W24P70quwwOgliRABjGCnau
	 Imqfv6cUKt9hw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: remove support for single %.symtypes build rule
Date: Tue, 12 Nov 2024 02:17:41 +0900
Message-ID: <20241111171753.2917697-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111171753.2917697-1-masahiroy@kernel.org>
References: <20241111171753.2917697-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This rule is unnecessary because you can generate foo/bar.symtypes
as a side effect using:

  $ make KBUILD_SYMTYPES=1 foo/bar.o

While compiling *.o is slower than preprocessing, the impact is
negligible. I prioritize keeping the code simpler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile               |  2 +-
 scripts/Makefile.build | 20 +++-----------------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 8dceb6830486..93fe5d2d6861 100644
--- a/Makefile
+++ b/Makefile
@@ -276,7 +276,7 @@ no-dot-config-targets := $(clean-targets) \
 			 outputmakefile rustavailable rustfmt rustfmtcheck
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
-single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.symtypes %/
+single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
 
 config-build	:=
 mixed-build	:=
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 36eae845a3e3..1a0d3078dac7 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -108,19 +108,13 @@ $(obj)/%.i: $(obj)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
 genksyms = scripts/genksyms/genksyms		\
-	$(if $(1), -T $(2))			\
+	$(if $(KBUILD_SYMTYPES), -T $(@:.o=.symtypes))	\
 	$(if $(KBUILD_PRESERVE), -p)		\
-	$(addprefix -r , $(wildcard $(2:.symtypes=.symref)))
+	$(addprefix -r , $(wildcard $(@:.o=.symref)))
 
 # These mirror gensymtypes_S and co below, keep them in synch.
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
 
-quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
-      cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
-
-$(obj)/%.symtypes : $(obj)/%.c FORCE
-	$(call cmd,cc_symtypes_c)
-
 # LLVM assembly
 # Generate .ll files from .c
 quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
@@ -158,8 +152,7 @@ ifdef CONFIG_MODVERSIONS
 
 gen_symversions =								\
 	if $(NM) $@ 2>/dev/null | grep -q ' __export_symbol_'; then		\
-		$(call cmd_gensymtypes_$(1),$(KBUILD_SYMTYPES),$(@:.o=.symtypes)) \
-			>> $(dot-target).cmd;					\
+		$(cmd_gensymtypes_$1) >> $(dot-target).cmd;			\
 	fi
 
 cmd_gen_symversions_c =	$(call gen_symversions,c)
@@ -323,13 +316,6 @@ cmd_gensymtypes_S =                                                         \
      $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);/p' ; } | \
     $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
 
-quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
-      cmd_cc_symtypes_S = $(call cmd_gensymtypes_S,true,$@) >/dev/null
-
-$(obj)/%.symtypes : $(obj)/%.S FORCE
-	$(call cmd,cc_symtypes_S)
-
-
 quiet_cmd_cpp_s_S = CPP $(quiet_modtag) $@
 cmd_cpp_s_S       = $(CPP) $(a_flags) -o $@ $<
 
-- 
2.43.0


