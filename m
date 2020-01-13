Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1DC138C52
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2020 08:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbgAMHaY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 02:30:24 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:36298 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgAMHaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 02:30:24 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 00D7UIrF011922;
        Mon, 13 Jan 2020 16:30:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 00D7UIrF011922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578900619;
        bh=tFE14xlK6YNOdWG4RU9WTdn48228b5KwDklZaVE2ovU=;
        h=From:To:Cc:Subject:Date:From;
        b=EmrggIiUGUczEKqpi+vWFJDCOTUO88zPAr+xzZtIEO+kee9YIs0fChHXxbngU4oYO
         w8FoQafRjFp5xXcGK6O9OVEQ7S9SdU9sV+n4WWP+OTGyZSH5Na0ZVaRZzJadFV3cyi
         ByOC+BqUZ3bPj1CRHAmO4vLUUkaLdO8esAfFZiyYvYgkESnElDQ0qRty3pOfxldnhn
         uIo7WKMLyb37X4KCox80SsCvhFao52CQ6oVrO+8vfb9QMnbgSQsnQ6w8pIjg9KdQLc
         AEiCjg2CfghaTa/ZvFNDQfB50QyUw+gL5r/7X3hlO0DeheQ+F7CdwPz2k646rZW/1f
         8kEC7g4B4YGRA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove 'Building modules, stage 2.' log
Date:   Mon, 13 Jan 2020 16:30:17 +0900
Message-Id: <20200113073017.6910-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This log is displayed every time modules are built, but it is not
so important.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 69897d5d3a70..b4d3f2d122ac 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -90,7 +90,6 @@ quiet_cmd_modpost = MODPOST $(words $(modules)) modules
       cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST)
 
 __modpost:
-	@$(kecho) '  Building modules, stage 2.'
 	$(call cmd,modpost)
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
-- 
2.17.1

