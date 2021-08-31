Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C70D3FC3E4
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239463AbhHaHmR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:42:17 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:17449 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239912AbhHaHmQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:42:16 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8Ee031407;
        Tue, 31 Aug 2021 16:40:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8Ee031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395617;
        bh=DDdb7o2pvT2+v+zP+0WGiSNrtyVISLPLptSueHXBp9M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hOLvaAe+KZYP2HO3x3EADfsgJlfaLvt84kES4q066gOs8oBi9Kd6SFyHK8DyPNbel
         oBPiMwbWt09VPYHkK5EpO1qPUZuHe5qvtAzWjigjJmwRL2n88A4M8iC9i7nCH9//gt
         cmHFljLSNBblEn9mcvCZ/A9xrCcen6XrM9uyBxS2tdETnCxeJox6trOx4SbZ8a24M6
         RwCpGFjLj/HM5NcKvRd2Qmi8lvpALz9RqGtwmTQw4O6FQbFZ7CVuk3VpDk5PLNJaoy
         k5EMkW83h/qe2UGp+QyhiG+PVYCYmjej67TG3VnnEy50VFQj96Lfs0gCHxEeHewAfU
         P4OU7PUxRw3dw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] kbuild: merge cmd_ar_builtin and cmd_ar_module
Date:   Tue, 31 Aug 2021 16:40:04 +0900
Message-Id: <20210831074004.3195284-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
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
Reviewed-by: Kees Cook <keescook@chromium.org>
---

 scripts/Makefile.build | 12 +++---------
 scripts/Makefile.lib   |  5 ++++-
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4d12f83389ce..0000b3988464 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -380,11 +380,8 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
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
@@ -438,14 +435,11 @@ $(obj)/%.prelink.o: part-of-module := y
 $(obj)/%.prelink.o: $(obj)/%.a $(module-symver) FORCE
 	$(call if_changed_rule,ld_o_a)
 
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
index 5074922db82d..cc6ff7ffb39d 100644
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

