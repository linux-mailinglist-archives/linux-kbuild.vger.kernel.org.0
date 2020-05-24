Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E671E0019
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387954AbgEXPoa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:30 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19689 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUv017561;
        Mon, 25 May 2020 00:42:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUv017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334965;
        bh=e5cNZhuJWGjYQhLE3zJEZvqPyhXGtlqsBeU1XazTH3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tnPE8RZMALif53DQzefYiBNlRP3kj8xK/GnBfZl+VFtFfa97wOSc+TAUR2UagNNOp
         FnMR4ZNXjVBYeos/BHoF8DQVa5LjfUESLnaBs4LGSz4MoIfz0oKTlJbc+Kb5Nznzgc
         8ZgB941yntaV2heZ2uZqrewLWLv/slzt+oUxCP8VewlQlPhnouoV2jVRWkwRCtlRVF
         6zs4U2CuIVBmjZe9qKZ0d/Apj/6Rb5LaJsmJQ3OFuDkTGzEKxgwcGF4e6+pHXXK2DQ
         EI7wWiu6DIkJa0cEeefRBrg35I5tki9sFrYIuQzV/gLVXzY4ZzVlclTOL4utthstx3
         AxKePH1sXCiJQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/29] modpost: move external module options
Date:   Mon, 25 May 2020 00:42:18 +0900
Message-Id: <20200524154235.380482-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Separate out the external-only code for readability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/Makefile.modpost | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index bc5561aedb24..8321068abb31 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -44,14 +44,11 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 
 kernelsymfile := $(objtree)/Module.symvers
-modulesymfile := $(KBUILD_EXTMOD)/Module.symvers
 
 MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
-	$(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)					\
-	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))			\
-	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))					\
+	$(if $(KBUILD_EXTMOD),,-o $(kernelsymfile))					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w)
 
@@ -81,6 +78,13 @@ src := $(obj)
 # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
 include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
+
+# modpost options for external modules
+MODPOST += \
+	-i Module.symvers \
+	$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)) \
+	-o $(KBUILD_EXTMOD)/Module.symvers
+
 endif
 
 # find all modules listed in modules.order
-- 
2.25.1

