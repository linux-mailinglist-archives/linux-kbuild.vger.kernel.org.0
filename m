Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C7623230F
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 19:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgG2RC7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jul 2020 13:02:59 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:32314 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RC7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jul 2020 13:02:59 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 06TH2fR6004951;
        Thu, 30 Jul 2020 02:02:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 06TH2fR6004951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596042162;
        bh=6QjdEYy6WWIjooAZXModdYVR5d49qOQWKM1ithvZq5E=;
        h=From:To:Cc:Subject:Date:From;
        b=u9xQNPHMThkTKyinWHjUqaJLWZTTXf1trBwE5g+jz+isxupxqVlOtWa2r9yYb30L8
         6C8S80dKvbgm3+Tch+6Q8pZlL+hOoaREoRBYcC3Fa3ACDvoBCyDycFRW0QlFoJsU45
         gAZdcfrNodvI823ggoUs5XzLgID1gNtPAptVgRU+8vm1ptij5hY4d2RrQRSi7Rd/zW
         oos856i7zp2BaZeAAz6B6D0YWZxPujUT7lRn6UtXm5Xty9Qls653xTqeMFIWSlLhHw
         Np16lC++DGa1qy3Pd/EYMwIrqBndosNrygzKv9Y4brPpkLFQ+DszqOrdml4YiEDeAk
         fLdTdMcVTntgQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     David Binderman <dcb314@hotmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] kconfig: qconf: use if_changed for qconf.moc rule
Date:   Thu, 30 Jul 2020 02:02:37 +0900
Message-Id: <20200729170239.160208-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Regenerate qconf.moc when the moc command is changed.

This also allows 'make mrproper' to clean it up. Previously, it was
not cleaned up because 'clean-files += qconf.moc' was missing.
Now 'make mrproper' correctly cleans it up because files listed in
'targets' are cleaned.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Use 'targets' instead of 'clean-files'

 scripts/kconfig/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 426881ea954f..a5e770e75653 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -192,8 +192,10 @@ $(obj)/qconf.o: $(obj)/qconf-cfg $(obj)/qconf.moc
 quiet_cmd_moc = MOC     $@
       cmd_moc = $(shell . $(obj)/qconf-cfg && echo $$moc) -i $< -o $@
 
-$(obj)/%.moc: $(src)/%.h $(obj)/qconf-cfg
-	$(call cmd,moc)
+$(obj)/%.moc: $(src)/%.h $(obj)/qconf-cfg FORCE
+	$(call if_changed,moc)
+
+targets += qconf.moc
 
 # gconf: Used for the gconfig target based on GTK+
 hostprogs	+= gconf
-- 
2.25.1

