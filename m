Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0D2F169168
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 20:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgBVTEz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Feb 2020 14:04:55 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:23006 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbgBVTEz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 14:04:55 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 01MJ4cZ4012807;
        Sun, 23 Feb 2020 04:04:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 01MJ4cZ4012807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582398280;
        bh=CKV2mLdhn4rZmWRUQWRtoBNfJibOoB2mxoSqdYrpxT8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bXwa5UjtDiDN0ZVWw7SA3NWvmQJDFc2CgBdllAU4YwuemCPVYL/aL/ROECuldUl73
         Cx9wQP7dkqTkwP8pqoF1zSjvptolR/oGB+1sG5o4OVNn4zNhZi/6x9hl+jd5VxHXWA
         f/03VJL5JpRYdkgYo3SBEO+xKvcUeCGXAhJIU+Y+NW+J5Ay3/Bep+TZ4Nx5VViW958
         5MOC0a4/ccTG/3pX9yuCgLthOgczd9KxOz1Y9ZqXNUs4+Rw4xk6fkuOQEDuK+2gLm2
         K/SYxThoDioVsJu7UPHy17fwvQV/j4EoXPPruL6oJy9IgcZDY1pjc9yWh36OlRcN7o
         QlztR3TUqItog==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] kbuild: remove unneeded semicolon at the end of cmd_dtb_check
Date:   Sun, 23 Feb 2020 04:04:32 +0900
Message-Id: <20200222190435.11767-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222190435.11767-1-masahiroy@kernel.org>
References: <20200222190435.11767-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This trailing semicolon is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 64b938c10039..752ff0a225a9 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -300,7 +300,7 @@ DT_BINDING_DIR := Documentation/devicetree/bindings
 DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
 
 quiet_cmd_dtb_check =	CHECK   $@
-      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ ;
+      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
 
 define rule_dtc
 	$(call cmd_and_fixdep,dtc,yaml)
-- 
2.17.1

