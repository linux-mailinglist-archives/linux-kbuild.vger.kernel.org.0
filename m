Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 243B55B7EAF
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Sep 2022 03:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiINBwR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Sep 2022 21:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiINBwP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Sep 2022 21:52:15 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728BB6C772
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Sep 2022 18:52:14 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MS3Bl135LzlVjQ;
        Wed, 14 Sep 2022 09:48:15 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 14 Sep
 2022 09:52:12 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <masahiroy@kernel.org>
CC:     <linux-kbuild@vger.kernel.org>, <liwei391@huawei.com>
Subject: [PATCH resend v2] Kconfig: remove sym_set_choice_value
Date:   Wed, 14 Sep 2022 09:59:06 +0800
Message-ID: <20220914015906.3943200-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Following Masahiro's suggestion,
sym_set_choice_value could be removed and directly
call sym_set_tristate_value instead.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
---
 scripts/kconfig/conf.c | 2 +-
 scripts/kconfig/lkc.h  | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 4178065ca27f..33d19e419908 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -551,7 +551,7 @@ static int conf_choice(struct menu *menu)
 			print_help(child);
 			continue;
 		}
-		sym_set_choice_value(sym, child->sym);
+		sym_set_tristate_value(child->sym, yes);
 		for (child = child->list; child; child = child->next) {
 			indent += 2;
 			conf(child);
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index fa8c010aa683..903738a9233a 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -124,11 +124,6 @@ static inline struct symbol *sym_get_choice_value(struct symbol *sym)
 	return (struct symbol *)sym->curr.val;
 }
 
-static inline bool sym_set_choice_value(struct symbol *ch, struct symbol *chval)
-{
-	return sym_set_tristate_value(chval, yes);
-}
-
 static inline bool sym_is_choice(struct symbol *sym)
 {
 	return sym->flags & SYMBOL_CHOICE ? true : false;
-- 
2.25.1

