Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D68EC7F4F4
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2019 12:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387504AbfHBKYn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Aug 2019 06:24:43 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:16789 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731757AbfHBKYn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Aug 2019 06:24:43 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x72AO3Rx020587;
        Fri, 2 Aug 2019 19:24:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x72AO3Rx020587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564741444;
        bh=n/3z6sxaqwSze/Hh8Zph16qQQC76psZH8+GynZc23WU=;
        h=From:To:Cc:Subject:Date:From;
        b=tGiZVQqGT7EqYbksnJJ0djQ5kZhKsAl/+vab7Wy8U+yKjVTrRKoHaDI+QP9sq5OYa
         jermtuapMlHk1J6BG8rwxv2QXg127jtU8atuvbbB+8PLq56Zi6Lo11vN4xiUlMiz58
         0BIi4Ko7jIkHz/nGl0UUd8kEMjj1pQivGz5wgufwxqmF2ogYB1Ir2qfTTdtYI0rlnn
         9R7ZZC16GSllBQWoeVaNDR32oj4c0aniNu0viO+JFxr9HunUsH7LYocSzQVbT4s4vB
         AeCRdlgDh7j1EBp30qtMksy2E1Aoy11WAJQazcet0kjn1W7cK69FY8Pqp9+5SUTLKM
         FT+z6Pbgw/5AA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Don Brace <don.brace@microsemi.com>,
        Arend Van Spriel <arend.vanspriel@broadcom.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: revive single target %.ko
Date:   Fri,  2 Aug 2019 19:23:58 +0900
Message-Id: <20190802102358.28408-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I removed the single target %.ko in commit ff9b45c55b26 ("kbuild:
modpost: read modules.order instead of $(MODVERDIR)/*.mod") because
the modpost stage does not work reliably. For instance, the module
dependency, modversion, etc. do not work if we lack symbol information
from the other modules.

Yet, some people still want to build only one module in their interest,
and it may be still useful if it is used within those limitations.

Fixes: ff9b45c55b26 ("kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod")
Reported-by: Don Brace <don.brace@microsemi.com>
Reported-by: Arend Van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 571cf862d7a4..e4c7211f5a3b 100644
--- a/Makefile
+++ b/Makefile
@@ -997,6 +997,8 @@ endif
 
 PHONY += prepare0
 
+export MODORDER := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
+
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
@@ -1766,6 +1768,10 @@ build-dir = $(patsubst %/,%,$(dir $(build-target)))
 	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
 %.symtypes: prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+%.ko: prepare FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target:.ko=.mod)
+	$(Q)echo $(build-target) > $(MODORDER)
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost || { rm -f $(MODORDER); false; }
 
 # Modules
 PHONY += /
-- 
2.17.1

