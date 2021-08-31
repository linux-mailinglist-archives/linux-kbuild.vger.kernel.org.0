Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A237E3FC3D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239957AbhHaHlk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:40 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:65521 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239969AbhHaHlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8Eb031407;
        Tue, 31 Aug 2021 16:40:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8Eb031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395615;
        bh=EjhzrFJMarNytgR4SHwPqcemXUfq9B5Xc6FEMXDfa4Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qngdVA9AB+y2lWwPwItHckjsJdVF0edZvSombTCFbChcdkH57ZsxU4cqHofmYG1Ha
         MHaRcFplUK56NVBQZ46Amu3BUH1Moblnii/yh1DxFH1FeUY6qcdkQIMAZbu7eX4PQ5
         CcjenTEBTOXP4NLqpfbe9+wwNDCt7h3mGGnO0YCUrqBX1A4HDh3k0EpEVDop6yHbid
         cgONpl+VpM893xCvy6XNHmF79I+T5Q+epqKQ7cjVdQr5uYTwcH6KwI+XO62FQe1Mlj
         ki4F+/roP5TEreEIOsZ85JqErkX3M/ZdTYAA7H00pUH+r7dbrbT+iiAJg9bCjzvY0q
         QTtuM65hnYneA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] kbuild: rebuild modules when objtool is updated for CONFIG_LTO_CLANG
Date:   Tue, 31 Aug 2021 16:40:01 +0900
Message-Id: <20210831074004.3195284-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We rebuilt objects when objtool was updated, but only for non LTO
builds.

For CONFIG_LTO_CLANG, the objtool step is postponed by the link time,
and nothing happens even if objtool is updated.

Add the proper objtool dependency to the pre-modpost module link
for CONFIG_LTO_CLANG.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index cdc09e9080ca..b94dfc87b7fa 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -451,10 +451,15 @@ endif
 quiet_cmd_ld_o_a = LD [M]  $@
       cmd_ld_o_a = $(LD) $(ld_flags) -r -o $@ --whole-archive $< $(cmd_objtool)
 
+define rule_ld_o_a
+	$(call cmd_and_savecmd,ld_o_a)
+	$(call cmd,gen_objtooldep)
+endef
+
 $(obj)/%.prelink.o: part-of-module := y
 
 $(obj)/%.prelink.o: $(obj)/%.a $(module-symver) FORCE
-	$(call if_changed,ld_o_a)
+	$(call if_changed_rule,ld_o_a)
 
 quiet_cmd_ar_module = AR [M]  $@
       cmd_ar_module = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
-- 
2.30.2

