Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318373F0FBD
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235348AbhHSA7W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:59:22 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60441 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbhHSA7T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:19 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4w017219;
        Thu, 19 Aug 2021 09:57:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4w017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334676;
        bh=DBA8ZODOzf9FIJUCzgtveE3U7Vc1g/1uNw8IkUnWotA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZXUUkbuBCSKhb65cp9SgZO4y+MbX/32WwqLo0fgIfMyOQUtycS0slYvSfAzCMTGlQ
         69XBqEkXYXwEbFFDXPVrMUK2JYWfl1k3pMlQe7IQ6etIR2lEHIYhOcnRZp8q/hR79g
         z90vxOQ/DQf4dhb+5Hf/q1GuZ+hUAaeDDd5NZsPjJKzlQ92N1l9+hueH/Sxi5QIDz1
         G0C8fyL70jOQ3HM0jNx37c6v6nNBiSPtMPYUuwjMDqwRihhzBWWozFldEqcqjYvqRw
         GpQl3ykOEAjh/hRczX8tezeAYWTumXeMO3PuG9tITuSXAm9jNDq7PzOU/wpWfnEWQb
         oqkIX1X1tGc0A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 13/13] kbuild: merge cmd_ar_builtin and cmd_ar_module
Date:   Thu, 19 Aug 2021 09:57:44 +0900
Message-Id: <20210819005744.644908-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The difference between cmd_ar_builtin and cmd_ar_module is the
'[M]' in the short log.

Merge them into cmd_ar_thin.

$(quiet_modtag) is expanded to '[M]' when it is merging module objects.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 12 +++---------
 scripts/Makefile.lib   |  5 ++++-
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 97392c26ebd7..17ce37c3eceb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -370,11 +370,8 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 # Rule to compile a set of .o files into one .a file (without symbol table)
 #
 
-quiet_cmd_ar_builtin = AR      $@
-      cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
-
 $(obj)/built-in.a: $(real-obj-y) FORCE
-	$(call if_changed,ar_builtin)
+	$(call if_changed,ar_thin)
 
 #
 # Rule to create modules.order file
@@ -434,14 +431,11 @@ cmd_ld_o_a += ; $(objtool) $(objtool_args) --module $@
 endif
 endif
 
-quiet_cmd_ar_module = AR [M]  $@
-      cmd_ar_module = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
-
 $(modules-single): %.a: %.o FORCE
-	$(call if_changed,ar_module)
+	$(call if_changed,ar_thin)
 
 $(modules-multi): FORCE
-	$(call if_changed,ar_module)
+	$(call if_changed,ar_thin)
 $(call multi_depend, $(modules-multi), .a, -objs -y -m)
 
 targets += $(modules-single) $(modules-multi)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f604d2d01cad..bd71a7d6fbc1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -198,7 +198,7 @@ _cpp_flags += -I $(srctree)/$(src) -I $(objtree)/$(obj)
 endif
 endif
 
-part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
+part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m) $(obj-m)),y)
 quiet_modtag = $(if $(part-of-module),[M],   )
 
 modkern_cflags =                                          \
@@ -276,6 +276,9 @@ quiet_cmd_ld = LD      $@
 quiet_cmd_ar = AR      $@
       cmd_ar = rm -f $@; $(AR) cDPrsT $@ $(real-prereqs)
 
+quiet_cmd_ar_thin = AR $(quiet_modtag)  $@
+      cmd_ar_thin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
+
 # Objcopy
 # ---------------------------------------------------------------------------
 
-- 
2.30.2

