Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7EF3350162
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235850AbhCaNiy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:38:54 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38971 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235862AbhCaNid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:38:33 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFeb003995;
        Wed, 31 Mar 2021 22:38:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFeb003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197897;
        bh=e5Iad/rqn9fJSaOe+82u8c1xsB2O/dtL0VRK76Ehu/8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nkx1jKZsEcxy822g9h31T5pwkjSWwdgTI9/+pz12d6L9HX7GTvMfEeAexLYQu5WO0
         zdAXa3A06rShV803fhN5+N7hC/zlTbdRQtGE/mgKJXYwikqCJvALWMjQfaS76bkA5m
         vTo7QaibUa/L4deuKvOhxrYI4ZXsh+Q5ZZklC02Q7p5CBlpgpgOpJI6gMPy7HvF+IM
         6idOv3sOfFiyNvEUgzmn1/NHlzwRimCIQn3llvhSqbm8OZDO2srknwb38b9lLBeLoz
         BTDvK80GrFZKR7eL3dEdrh+/mHm7UekSTq+9APTk5dz09QOlEx0GP9ziwAxquYWrLQ
         jQl7e2OgxUdNg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 4/9] kbuild: check module name conflict for external modules as well
Date:   Wed, 31 Mar 2021 22:38:05 +0900
Message-Id: <20210331133811.3221540-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If there are multiple modules with the same name in the same external
module tree, there is ambiguity about which one will be loaded, and
very likely something odd is happening.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 10 +++++-----
 scripts/modules-check.sh |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index a6f73335757d..b5ff4753eba8 100644
--- a/Makefile
+++ b/Makefile
@@ -1459,10 +1459,6 @@ endif
 PHONY += modules
 modules: $(if $(KBUILD_BUILTIN),vmlinux) modules_check modules_prepare
 
-PHONY += modules_check
-modules_check: modules.order
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh $<
-
 cmd_modules_order = $(AWK) '!x[$$0]++' $(real-prereqs) > $@
 
 modules.order: $(subdir-modorder) FORCE
@@ -1775,9 +1771,13 @@ PHONY += modules modules_install
 
 ifdef CONFIG_MODULES
 
-modules: $(MODORDER)
+modules: modules_check
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
+PHONY += modules_check
+modules_check: $(MODORDER)
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh $<
+
 quiet_cmd_depmod = DEPMOD  $(MODLIB)
       cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
                    $(KERNELRELEASE)
diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 43de226071ae..e06327722263 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -13,10 +13,10 @@ exit_code=0
 # Check uniqueness of module names
 check_same_name_modules()
 {
-	for m in $(sed 's:.*/::' $1 | sort | uniq -d)
+	for m in $(sed 's:.*/::' "$1" | sort | uniq -d)
 	do
 		echo "error: the following would cause module name conflict:" >&2
-		sed -n "/\/$m/s:^:  :p" modules.order >&2
+		sed -n "/\/$m/s:^:  :p" "$1" >&2
 		exit_code=1
 	done
 }
-- 
2.27.0

