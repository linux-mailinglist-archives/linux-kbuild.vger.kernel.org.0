Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F8833A353
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Mar 2021 07:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhCNGQw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Mar 2021 01:16:52 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:49004 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234231AbhCNGQX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Mar 2021 01:16:23 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 12E6Fqg8003265;
        Sun, 14 Mar 2021 15:15:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 12E6Fqg8003265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615702553;
        bh=utDJTVaXCeHTwLB1yYXftme23M7v9E/X8L8DxsEMQsI=;
        h=From:To:Cc:Subject:Date:From;
        b=tmOiWE2dx3Jql7hOGHc7woxKGvOnJfInpOKiDLSxVg0J9P3dSz2EJA9DNuudDXmCA
         RARsuo+0XcnapClt74XP+DWoELK7KbNnj7khnKJZTWq5vDrmJYB2N5P8knZPmVJ2lR
         lpGXUJn+/Cox2L4EcT/GLoAvGyjTC2tF0S46/XYAbyPXDtHgfQW8ynTlDlnePq5Vxm
         F2cvjBmP2mKRdgzj6mPODekXZ6sk8ZpJDOyLGV95IEjeo3P2RN4I4cXG4lwEejkamC
         XPsH5nul8+CAk216KkyirhhI0WgBnnmygAQgDtYQONAwse4tZeapqyBuUaD5Zpwoz4
         yb3j+Fvd7JRvg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: replace sed with $(subst ) or $(patsubst )
Date:   Sun, 14 Mar 2021 15:15:50 +0900
Message-Id: <20210314061550.401458-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For simple text replacement, it is better to use a built-in function
instead of sed if possible. You can save one process forking.

I do not mean to replace all sed invocations because GNU Make itself
does not support regular expression (unless you use guile).

I just replaced simple ones.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile | 2 +-
 Makefile                                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 780e5618ec0a..ac446c62fbc3 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -48,7 +48,7 @@ define rule_chkdt
 	$(call cmd,mk_schema)
 endef
 
-DT_DOCS = $(shell $(find_cmd) | sed -e 's|^$(srctree)/||')
+DT_DOCS = $(patsubst $(srctree)/%,%,$(shell $(find_cmd)))
 
 override DTC_FLAGS := \
 	-Wno-avoid_unnecessary_addr_size \
diff --git a/Makefile b/Makefile
index 70fc39e6b677..0be138adae74 100644
--- a/Makefile
+++ b/Makefile
@@ -574,7 +574,7 @@ endif
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
-CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g')
+CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
 
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 ifneq ($(CROSS_COMPILE),)
-- 
2.27.0

