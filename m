Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297ED1B1CF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 05:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgDUDgA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Apr 2020 23:36:00 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:52350 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgDUDf7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Apr 2020 23:35:59 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 03L3ZdWg001233;
        Tue, 21 Apr 2020 12:35:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 03L3ZdWg001233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587440139;
        bh=XyRdHJjb8MoEiKRt48oj/OQ5B9m4bbw7cOjjdMtRtVE=;
        h=From:To:Cc:Subject:Date:From;
        b=0cU3jv+kmbuvcgsDRBo2orNdJvrvp2Ajo1ZOvtehWhvQi8VQAV2y0AwEeadX/hJb+
         6syaGBXmENROHsee++Uqq0K0qyIzWIM8bT82+IlHjU3yBP4vloV+GxU5lm+Mo+WgHb
         YI8eMyROpTuxiEev7pDRxguphe4y3cdl2DON/7aYsl+Nx4vQxcUwuACm16cVNGyU7l
         Bq19pA/dtZ4waL+mYElWnS94UcyEWZ8M/FFm6kt0JCW8YCfM/DcfeGy/bYpwd4Ci9H
         szEnBo8oKPEdRu65BM3x1p2x9KE50JHfpcCO0tStiLcFaQxA+OVYqsC3P5+ql0lx6v
         33Iz/QjZsWTYg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] kbuild: fix DT binding schema rule again to avoid needless rebuilds
Date:   Tue, 21 Apr 2020 12:35:28 +0900
Message-Id: <20200421033529.487366-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 7a0496056064 ("kbuild: fix DT binding schema rule to detect
command line changes"), this rule is every time re-run even if you change
nothing.

cmd_dtc takes one additional parameter to pass to the -O option of dtc.

We need to pass 'yaml' to if_changed_rule. Otherwise, cmd-check invoked
from if_changed_rule is false positive.

Fixes: 7a0496056064 ("kbuild: fix DT binding schema rule to detect command line changes")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 97547108ee7f..4b799737722c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -309,7 +309,7 @@ define rule_dtc
 endef
 
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_rule,dtc)
+	$(call if_changed_rule,dtc,yaml)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
-- 
2.25.1

