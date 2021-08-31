Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3750E3FC3E7
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240119AbhHaHma (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:42:30 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:17787 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240078AbhHaHm3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:42:29 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8Ed031407;
        Tue, 31 Aug 2021 16:40:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8Ed031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395617;
        bh=tAsPlkr/bNQw/G1Iv+qMo9y06GVNbopbe8/PtkB/0vM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vuEQ22N8jqwiEBvGpY2t2n+TmHArwE9PPyAoqS66/vZMDsPUePJamSAGlJfwo2mWY
         zyihlQhTy2TOCP+EQtXy++pNNaRN4XV/DzAkpKzGvedR5Gowy4yPHvAB3gyP/0TKu9
         aycUZ1RHltsvw1Pdnu2I+OgOpO8b65pc64lmhM6ibReckSMtVqL0Fd8N60EcQltQn7
         CsDe5PAW4y6CxZvR3nMpE7/kGky99XzLYCOAGM+3CYSVjkL9oX/c/hkpjW4/RSK/JN
         zRo1YMj+zyaf7UJZ5LpHR1b5fzXWzvWXZt/dnQltBFoxzxoXqWCLHvcukIxXenSwwo
         LmypBllKj9dKA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] kbuild: merge cmd_modversions_c and cmd_modversions_S
Date:   Tue, 31 Aug 2021 16:40:03 +0900
Message-Id: <20210831074004.3195284-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now cmd_modversions_c and cmd_modversions_S are similar.

The latter uses $(OBJDUMP) -h, but it can be replaced with $(NM).

$(NM) works for both ELF and LLVM bitcode (if $(NM) is llvm-nm).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
---

 scripts/Makefile.build | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 50a6765c9a14..4d12f83389ce 100644
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
@@ -337,14 +340,8 @@ ifdef CONFIG_ASM_MODVERSIONS
 
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
 
 $(obj)/%.o: $(src)/%.S FORCE
-- 
2.30.2

