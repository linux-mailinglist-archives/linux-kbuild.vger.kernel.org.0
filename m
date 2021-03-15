Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02A033ABD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 07:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhCOGzt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 02:55:49 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:57855 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229965AbhCOGzs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 02:55:48 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0URuxqXP_1615791345;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0URuxqXP_1615791345)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 15 Mar 2021 14:55:45 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] kconfig: use true and false for bool variable
Date:   Mon, 15 Mar 2021 14:55:44 +0800
Message-Id: <1615791344-48675-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

fixed the following coccicheck:
./scripts/kconfig/confdata.c:36:9-10: WARNING: return of 0/1 in function
'is_dir' with return type bool

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 scripts/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 2568dbe..b65b8c3 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -33,7 +33,7 @@ static bool is_dir(const char *path)
 	struct stat st;
 
 	if (stat(path, &st))
-		return 0;
+		return false;
 
 	return S_ISDIR(st.st_mode);
 }
-- 
1.8.3.1

