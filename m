Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 395BE169163
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 20:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgBVTEy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Feb 2020 14:04:54 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:23008 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgBVTEy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 14:04:54 -0500
X-Greylist: delayed 11519 seconds by postgrey-1.27 at vger.kernel.org; Sat, 22 Feb 2020 14:04:53 EST
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 01MJ4cZ6012807;
        Sun, 23 Feb 2020 04:04:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 01MJ4cZ6012807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582398281;
        bh=bmT77VUANmQdBakUB1snAYo2YaYV2b/WXJDLs84Hovk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yBsvDE/CYqb/HNefyT+1ZKG3smJf90UvTH//vprBPxgqpAcpFMjIGZNXdWHO3jFHO
         La5hBmQeGJ+LoM62Q6eqG1w+GUNOauaL4wPfmAVUxEjy7DsQFuhOUAKisNfq8UHBdi
         Ypbw+bad/q8L1ccq7X7v3ZguMUV30JQO+ptaKmyO5cREQeI5ZZGavMbkaUDRpXhwio
         fHGtozZ4+YBkhikIIuh+7dfUEhVdQB97Nrtzt5NJGYqJH1I1VrJB8XoX7PryiHFRIV
         5m9kjWxSHHi7/CRjvHQP3kzNRe/H+1iwHL69/1VIOvv/OEndK/tX3XXVoU5QD90lx3
         Ox7EpMRfKqfDw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] kbuild: add dt_binding_check to PHONY in a correct place
Date:   Sun, 23 Feb 2020 04:04:34 +0900
Message-Id: <20200222190435.11767-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222190435.11767-1-masahiroy@kernel.org>
References: <20200222190435.11767-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The dt_binding_check is added to PHONY, but it is visible only
when $(dtstree) is not empty. So, it is not specified as phony
for ARCH=x86 etc.

Add it to PHONY outside the ifneq ... endif block.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 102710a9228c..83f9b8f6fbaf 100644
--- a/Makefile
+++ b/Makefile
@@ -1238,7 +1238,7 @@ ifneq ($(dtstree),)
 %.dtb: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
-PHONY += dtbs dtbs_install dtbs_check dt_binding_check
+PHONY += dtbs dtbs_install dtbs_check
 dtbs dtbs_check: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
@@ -1258,6 +1258,7 @@ PHONY += scripts_dtc
 scripts_dtc: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts/dtc
 
+PHONY += dt_binding_check
 dt_binding_check: scripts_dtc
 	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
 
-- 
2.17.1

