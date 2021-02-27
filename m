Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1DC5326BD4
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 06:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhB0Fgb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 00:36:31 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:51707 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhB0Fga (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 00:36:30 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 11R5ZDse026671;
        Sat, 27 Feb 2021 14:35:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 11R5ZDse026671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614404114;
        bh=TduGFtwZZPVaeV3OB2S4YDYQxvIPlX4odQXnYkY81ww=;
        h=From:To:Cc:Subject:Date:From;
        b=NyD8h15BMEqB1sGlYfxpohbqNsyM+GqqvKk/azrBDpXSKaqzGmrMBAcSfA89l5yob
         LCaObOrmdCdwkE6cIXrcfQLpTx9xhNJrDKzwRqcC4L0FpEucDcK6S4zkKLSAmYELYK
         uksBfZGR1uBHY8BUWbC6qvIToPC4Lw5bNpTbRh5dlpxXXEURRyGJoLWhQlRnyBA4a0
         KDB1E38yqGvAi7rhwjBQPqb6niv2+Cj/aEoDnjThXtojcLbeO6sl6dnhryDYGk1ND2
         AzZXkk/NunSLAz+FUNj+OSmQqmzMfinbNdgGeuK4ZcolW47D5PCC0pHrQfO5lrSBv4
         eByoq2ebf8b5Q==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-ia64@vger.kernel.org
Subject: [PATCH] ia64: add arch/ia64/Kbuild
Date:   Sat, 27 Feb 2021 14:35:12 +0900
Message-Id: <20210227053512.4073366-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use the standard obj-y form to specify the sub-directories under
arch/ia64/. No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/ia64/Kbuild   | 3 +++
 arch/ia64/Makefile | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 arch/ia64/Kbuild

diff --git a/arch/ia64/Kbuild b/arch/ia64/Kbuild
new file mode 100644
index 000000000000..e77cc76d228c
--- /dev/null
+++ b/arch/ia64/Kbuild
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y				+= kernel/ mm/
+obj-$(CONFIG_IA64_SGI_UV)	+= uv/
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 467b7e7f967c..096d5500e6a4 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -47,8 +47,7 @@ KBUILD_CFLAGS += $(cflags-y)
 head-y := arch/ia64/kernel/head.o
 
 libs-y				+= arch/ia64/lib/
-core-y				+= arch/ia64/kernel/ arch/ia64/mm/
-core-$(CONFIG_IA64_SGI_UV)	+= arch/ia64/uv/
+core-y				+= arch/ia64/
 
 drivers-y			+= arch/ia64/pci/ arch/ia64/hp/common/
 
-- 
2.27.0

