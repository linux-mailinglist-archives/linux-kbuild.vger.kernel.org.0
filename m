Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9046A336C4B
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Mar 2021 07:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhCKGcP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 01:32:15 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:56175 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhCKGbs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 01:31:48 -0500
Received: from localhost.localdomain (133-175-190-164.kyoto.fdn.vectant.ne.jp [133.175.190.164]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 12B6V9T8023841;
        Thu, 11 Mar 2021 15:31:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 12B6V9T8023841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615444270;
        bh=pFK6AvxwZw3F3vXwDKj2ZIdqMuI/H73Ebds8nCytKMw=;
        h=From:To:Cc:Subject:Date:From;
        b=qbCEKd6kFlCtOPCJcxNHX6hBNKCcAclUb3mgPADCPsW+Awl+oag3igTZfT20YCSNh
         75nUtpwSTMOUD8KlSc4eVv+QTfHol/pl6UJWT1rqrNS3qRK6SiqfwR5w72WiCb3k2v
         DWqxtvb0x0Zu4zSZQ0ieCk4S8jflnOiwkCCfhpBO3wXfrhg0iV3jAlWOmRbWDedpdk
         KP8/5pvJyPIqWSOk1AWra9SnyHlZN+vO1+2uguldw3tXtv3xLPzmUGspOWlcGPB8qb
         FS0yI9MYOQC/xa4L26jDtmoIAoL1UcytUPh27igBUWh9pDlhFlK/pSg/VC30304Fvw
         JcjuC25X6k99Q==
X-Nifty-SrcIP: [133.175.190.164]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove meaningless parameter to $(call if_changed_rule,dtc)
Date:   Thu, 11 Mar 2021 15:30:54 +0900
Message-Id: <20210311063054.901232-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a remnant of commit 78046fabe6e7 ("kbuild: determine the output
format of DTC by the target suffix").

The parameter "yaml" is meaningless because cmd_dtc no loner takes $(2).

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 90a4e04cd8f5..8cd67b1b6d15 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -352,7 +352,7 @@ define rule_dtc
 endef
 
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_rule,dtc,yaml)
+	$(call if_changed_rule,dtc)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
-- 
2.27.0

