Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C91326D62
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 15:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhB0OWN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 09:22:13 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:57430 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbhB0OWL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 09:22:11 -0500
Received: from grover.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 11REKQlX016879;
        Sat, 27 Feb 2021 23:20:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 11REKQlX016879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614435627;
        bh=hqwuc663/AcMwLNoYEQHruIpUXyKQVSDyKQphv7Uqi4=;
        h=From:To:Cc:Subject:Date:From;
        b=sPRuuqx5RK2aO3wlwNgsLFk1IcbGurfosxwFp2jSkMWmdn38OUTEco3Aho7o5+xoF
         cym8OGI6vasWI06hPXU74BFz55Y0lzsSDI+vdnabDjUyxjsRPrfQ9nIVfHvHzaDC8o
         P3YILLcU3BUGKE8NhfgbDNYMoOvheraBpmdn5Rpur9mAaXBdYfvZSb853M9jZACiOs
         MK5nWpqITuU9yZVUzFZ+CW5rFG4XJ1x6MaCV3pf95h/jh7DxMRW+HKCDNYTxyUgqII
         hBN79CCu1nPs1Qgwjv2Re3LtYtyaS6gULjmt8tFV6WcQONgkPlu3M0ooi/AIIbANx3
         MqJSSS+OxPtww==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Christian Zigotzky <chzigotzky@xenosoft.de>
Cc:     Sasha Levin <sashal@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Fix <linux/version.h> for empty SUBLEVEL or PATCHLEVEL again
Date:   Sat, 27 Feb 2021 23:20:23 +0900
Message-Id: <20210227142023.63480-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 9b82f13e7ef3 ("kbuild: clamp SUBLEVEL to 255") breaks the build
if SUBLEVEL or PATCHLEVEL is empty.

Commit 78d3bb4483ba ("kbuild: Fix <linux/version.h> for empty SUBLEVEL
or PATCHLEVEL") fixed the issue by prepending a zero.

This time, we cannot take the same approach because we have C code:

  #define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL)
  #define LINUX_VERSION_SUBLEVEL $(SUBLEVEL)

Replace empty SUBLEVEL or PATCHLEVEL with a zero.

Fixes: 9b82f13e7ef3 ("kbuild: clamp SUBLEVEL to 255")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index f2dc2f953e23..14c13b09a9e7 100644
--- a/Makefile
+++ b/Makefile
@@ -1283,10 +1283,10 @@ endef
 define filechk_version.h
 	if [ $(SUBLEVEL) -gt 255 ]; then                                 \
 		echo \#define LINUX_VERSION_CODE $(shell                 \
-		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 255); \
+		expr $(VERSION) \* 65536 + $(PATCHLEVEL) \* 256 + 255); \
 	else                                                             \
 		echo \#define LINUX_VERSION_CODE $(shell                 \
-		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
+		expr $(VERSION) \* 65536 + $(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
 	fi;                                                              \
 	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
 	((c) > 255 ? 255 : (c)))';                                       \
@@ -1295,6 +1295,8 @@ define filechk_version.h
 	echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL)
 endef
 
+$(version_h): PATCHLEVEL := $(if $(PATCHLEVEL), $(PATCHLEVEL), 0)
+$(version_h): SUBLEVEL := $(if $(SUBLEVEL), $(SUBLEVEL), 0)
 $(version_h): FORCE
 	$(call filechk,version.h)
 
-- 
2.27.0

