Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1473F0FC3
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235541AbhHSA7a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:59:30 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60764 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235445AbhHSA72 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:28 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4v017219;
        Thu, 19 Aug 2021 09:57:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4v017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334675;
        bh=KLWNtWoQX5iPqAI7oX4v3voqgZg5h4Fqa51BzWNUUW8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yWgZRPmbMbnn13jT/bEgVsi3rPpo27UJvvJfS5WltzGWbTj9JTPCObIK9LVy0RxgL
         2imoI94x27iFJAdYVdvk6IEjrYJwLzVL8eyr14ogmMuc8EJkES6hWMxPNAeTV42tdZ
         mj9y5rLM2P5DmQ6jRCpTaJTNuMSvHIswtDLIMgZ7p6EliwUSWEAYRcSE6Z8CPEdfML
         xbkLu8rzaEFwPHwB2N5FMb/sO3jDB3u5c7vIhHE0v1M4LS1JWKgr4IU7j/KYa6df2d
         poBU5i2Zkq3iDmLcJCMrKaxmSAm58gTDL0GynNR0RYHHqga2KFd5Y726a0n/C/DDgH
         XkN+3RwE8olEQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: [PATCH 12/13] kbuild: merge cmd_modversions_c and cmd_modversions_S
Date:   Thu, 19 Aug 2021 09:57:43 +0900
Message-Id: <20210819005744.644908-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now cmd_modversions_c and cmd_modversions_S are similar.

The latter uses $(OBJDUMP) -h, but it can be replaced with $(NM).

$(NM) works for both ELF and LLVM bitcode (if $(NM) is llvm-nm).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 874e84a1f3fc..97392c26ebd7 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -166,13 +166,16 @@ ifdef CONFIG_MODVERSIONS
 
 # Generate .o.symversions files for each .o with exported symbols, and link these
 # to the kernel and/or modules at the end.
-cmd_modversions_c =								\
+cmd_modversions =								\
 	if $(NM) $@ 2>/dev/null | grep -q __ksymtab; then			\
-		$(call cmd_gensymtypes_c,$(KBUILD_SYMTYPES),$(@:.o=.symtypes))	\
+		$(call cmd_gensymtypes_$(1),$(KBUILD_SYMTYPES),$(@:.o=.symtypes)) \
 		    > $@.symversions;						\
 	else									\
 		rm -f $@.symversions;						\
 	fi;
+
+cmd_modversions_c = $(call cmd_modversions,c)
+
 endif
 
 ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
@@ -327,14 +330,8 @@ ifdef CONFIG_ASM_MODVERSIONS
 
 # versioning matches the C process described above, with difference that
 # we parse asm-prototypes.h C header to get function definitions.
+cmd_modversions_S = $(call cmd_modversions,S)
 
-cmd_modversions_S =								\
-	if $(OBJDUMP) -h $@ | grep -q __ksymtab; then				\
-		$(call cmd_gensymtypes_S,$(KBUILD_SYMTYPES),$(@:.o=.symtypes))	\
-		    > $@.symversions;						\
-	else									\
-		rm -rf $@.symversions;						\
-	fi
 endif
 
 $(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
-- 
2.30.2

