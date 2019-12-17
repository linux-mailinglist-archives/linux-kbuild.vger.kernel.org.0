Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84DFF12230F
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfLQESj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:18:39 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:56123 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfLQESj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:18:39 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBH4IZc4028568;
        Tue, 17 Dec 2019 13:18:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBH4IZc4028568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556316;
        bh=WdRasutc6Uyv9TaO7y3aMQzJKcAh6B5ft1yyxxZn5Yg=;
        h=From:To:Cc:Subject:Date:From;
        b=AOoZeYUEJ0nthQZvmog6Ad0xws+VpKms9z7neq2LLvtHgjj3Qdgo3aSgGEBhEv1fH
         1nnkIfk9WfL5z55VnyQONLrew7ajY5p9QjmF7e9de2icbVcS4IVvj2VzUswfFyA24/
         GrsTYYJnW1R9ikz6vqtt+bCZnze1q6G//kAbGHkZs6Xy6S5bn1pJxqW5nxT2tI7koF
         R9NnSI9Eg8oRb0/yJDpeiF1od4l82qUpfLKkSdaIkqR+W6mdtFQ+kbQR/3OcGW/fjv
         EHbg+9cgGq3iM8nZT4WcdmS05jZhrjXS0K9zpkzn3B0lOZuL78QJgLhxghC5poIclk
         vxnLRl5XnhdlA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kconfig: fix too deep indentation in Makefile
Date:   Tue, 17 Dec 2019 13:18:18 +0900
Message-Id: <20191217041819.29732-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The indentation for if ... else ... fi is too deep. Fix it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 2f1a59fa5169..f826a257d576 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -48,15 +48,15 @@ build_xconfig: $(obj)/qconf
 
 localyesconfig localmodconfig: $(obj)/conf
 	$(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
-	$(Q)if [ -f .config ]; then 					\
-			cmp -s .tmp.config .config ||			\
-			(mv -f .config .config.old.1;			\
-			 mv -f .tmp.config .config;			\
-			 $< $(silent) --oldconfig $(Kconfig);		\
-			 mv -f .config.old.1 .config.old)		\
-	else								\
-			mv -f .tmp.config .config;			\
-			$< $(silent) --oldconfig $(Kconfig);		\
+	$(Q)if [ -f .config ]; then 				\
+		cmp -s .tmp.config .config ||			\
+		(mv -f .config .config.old.1;			\
+		 mv -f .tmp.config .config;			\
+		 $< $(silent) --oldconfig $(Kconfig);		\
+		 mv -f .config.old.1 .config.old)		\
+	else							\
+		mv -f .tmp.config .config;			\
+		$< $(silent) --oldconfig $(Kconfig);		\
 	fi
 	$(Q)rm -f .tmp.config
 
-- 
2.17.1

