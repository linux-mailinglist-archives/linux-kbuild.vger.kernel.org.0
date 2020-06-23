Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC6C204BEA
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2020 10:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731605AbgFWIHZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Jun 2020 04:07:25 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:53668 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgFWIHZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jun 2020 04:07:25 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 05N86kG6004915;
        Tue, 23 Jun 2020 17:06:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 05N86kG6004915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592899607;
        bh=mzwLNlVbc4tN700SeYrthBTYehwSNuisM3RuMNKEncU=;
        h=From:To:Cc:Subject:Date:From;
        b=Vhp1xJ4AsuCaTUX7lrWPWQXqPAKHx8ySfE62u+vOOiGRlJy266d1E7yY9I1nUxvLd
         u+cIRGFDpNG/03FysaUbwoHKydILPc0vCju2zN0psXpcqQs3S6ha4ar+K7yUPSYjrg
         B97lsOZ8OF9XIHC/+ohZO//Ivw8sxfXmXAdkbLXUVCHWNyRr4hSoDyUkhSSTPk8noD
         Pc48dU0oNZtYA8l1Nc5zfz61AAOQ70R7gY4XtnDV08XhJcCOhY5ibuSHppyNNk+w1O
         Omf+PjGWyakZ+VDXSVBeyqaA0lux1LMYH6/SZPp52K2AvLrcCxFAnpBs7HN72ij/Wh
         Mble3EzYLLy4A==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "kbuild: Create directory for target DTB"
Date:   Tue, 23 Jun 2020 17:05:49 +0900
Message-Id: <20200623080549.725632-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 77479b38e2f58890eb221a0418357502a5b41cd6.

Since commit 8a78756eb545 ("kbuild: create object directories simpler
and faster"), all directories for 'targets' are created.

'mkdir -p $(dir ${dtc-tmp})' is no longer needed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 99ac59c59826..94da02a57780 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -298,8 +298,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 	$(call if_changed,dt_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
-cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
-	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-- 
2.25.1

