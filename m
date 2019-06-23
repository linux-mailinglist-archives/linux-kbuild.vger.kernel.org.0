Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2454FC9E
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Jun 2019 18:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfFWQNi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 Jun 2019 12:13:38 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:23057 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfFWQNi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Jun 2019 12:13:38 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x5NGDU0x024279;
        Mon, 24 Jun 2019 01:13:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x5NGDU0x024279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561306411;
        bh=meEmv4m9X6eizB8GzJ2MviWJJ0JI6pOOoAMXbmBaZcU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QVWGkYTbzlsmLJsvT0hCaLAXrAk/ju97Hv6WYfmXhx4dz+Oj1w7YGmXDj3tXufIHT
         4iWgSuaLRQ87jU2W0Z5MKumZl1tmVqr/TVzBUOj7bUdaZqI37zkpuLPJ39FNmm7AIX
         Z2TSsKRe5/EgQ23piXwkrvJ+6rwHYseCmSvhStrCEzsZeVgMvQlLftifzN+2SJt/5B
         CZf5Hr0oy92/sS7TPD0XPx3itJr1+cPR+OVE+rHaeIs8sE9zfBr/JOETG+cPztrl8j
         uFss/g+w5FIzXAqTbgwmhsysY9MqY1gxRwKWZtnvK5pmgqrc/0KSLweUEoom3ef5+1
         /caHML3T4zgeA==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: split modules.order build rule out of 'modules' target
Date:   Mon, 24 Jun 2019 01:13:28 +0900
Message-Id: <20190623161328.22461-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190623161328.22461-1-yamada.masahiro@socionext.com>
References: <20190623161328.22461-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Merge the build rules of modules.order and modules.builtin

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 19c33bc69bb1..6bfe22b852f2 100644
--- a/Makefile
+++ b/Makefile
@@ -1283,16 +1283,18 @@ all: modules
 # using awk while concatenating to the final file.
 
 PHONY += modules
-modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
-	$(Q)$(AWK) '!x[$$0]++' $(vmlinux-dirs:%=$(objtree)/%/modules.order) > $(objtree)/modules.order
+modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order modules.builtin
 	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
 
-modbuiltin-dirs := $(addprefix _modbuiltin_, $(vmlinux-dirs))
+modules.order modules.builtin:
+	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
+
+modules.order: $(vmlinux-dirs)
 
+modbuiltin-dirs := $(addprefix _modbuiltin_, $(vmlinux-dirs))
 modules.builtin: $(modbuiltin-dirs)
-	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
 
 PHONY += $(modbuiltin-dirs)
 # tristate.conf is not included from this Makefile. Add it as a prerequisite
-- 
2.17.1

