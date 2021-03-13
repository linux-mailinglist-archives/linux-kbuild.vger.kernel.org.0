Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC90C33A0AF
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbhCMTto (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:44 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39839 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef7018162;
        Sun, 14 Mar 2021 04:48:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef7018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664925;
        bh=HpYH2gRbKkgj4ko71vnfxVKYrDfXGnqNRFYusTPPsSY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oucjrS3+uhGzva2EG+igCitOgF4RalPX/6x/Ka/VeDTDm6qyXBWFi02nlBu/wFtug
         NCoHkRwfko0iayGrWokVCBIIKkGL2vERdrOo5H+7/SQPGBRpNQgQDsBMUnV1rJnNtt
         zaDmP5HvTvkkMOI8+iVf2W+GVt2llcsbqR/bXkUGgf+rOcE0ToGjCzGI6c0tkx8ewj
         c8VPFUA2BLMkCViX2n/ezDT++F1dPucG4yUckCuishKI0eXIb/5T/ibgHcdztaO+Sc
         L/2BvNRDGp/uvuu+rQWSBltubssRU32Clj+Ex+g/UANgHyc0iKv9CSiEYpV3c0xkjT
         n0rXgVKra0G2g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] kconfig: move JUMP_NB to mconf.c
Date:   Sun, 14 Mar 2021 04:48:31 +0900
Message-Id: <20210313194836.372585-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This macro is only used in mconf.c.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.h  | 2 --
 scripts/kconfig/mconf.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 5c3443692f34..bbca80a0dc24 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -281,8 +281,6 @@ struct jump_key {
 	int index;
 };
 
-#define JUMP_NB			9
-
 extern struct file *file_list;
 extern struct file *current_file;
 struct file *lookup_file(const char *name);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 4063dbc1b927..01b6c27224e2 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -22,6 +22,8 @@
 #include "lkc.h"
 #include "lxdialog/dialog.h"
 
+#define JUMP_NB			9
+
 static const char mconf_readme[] =
 "Overview\n"
 "--------\n"
-- 
2.27.0

