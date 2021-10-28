Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3CD43DD28
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 10:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhJ1Iui (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 04:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1Iuh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 04:50:37 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30175C061570;
        Thu, 28 Oct 2021 01:48:11 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id l203so5334800pfd.2;
        Thu, 28 Oct 2021 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnZbb1LgEtjD+lLvgrA/r4CJ3eRXCWu/NWnD2vck82k=;
        b=TlSuHYHThnh0hYkTXbL7v2hgztvT9M12+VssPMESGtSEQgTyH8TUc2+HDUTWxOyauj
         ilZnOcOKcOtH/Y6zRh6pdnTLXuddNG5EUji2sp2zcAzEs1lgY1JE1PmEYV4MRD2CJOyu
         SmkbpLPoRTMDaEHqNkOarRwZy/NM8Q94cgWE0zHxbP+6W7Oxwj0CzbY6gC7Zn5dQ+J+W
         NV6WmgldEcjzWk43un+AMUfE5SrfLKXVZyEMhQVlRyTHt61nOYBYRMzSCO4VluT6AjCl
         lOMHcd4gLVCRqAT9Z7J/NabtVjcJqumG2jGJtJ+g11bBMOjx3AlkKXHBrD0x2vUQN4tb
         0iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnZbb1LgEtjD+lLvgrA/r4CJ3eRXCWu/NWnD2vck82k=;
        b=015rGpY+DNCWLP1dZWZIxGB62vxu2dX9wSQTkGaG3PosToVy0iu1GWeoA4nt7JfVcv
         p72i2VLRJKIiXJdIdyqeZwlLcJz1crRcVc8qST/LxlRgXLYP0T8391ekiyibN4o4jllV
         tGYdHzsyVeGQpVUlJgFo3wU1klVvB5hEYglOixQF5I9TZ2QclzaxK2R+LOh1Z/i0t7EU
         u8cIP5fBD7z3QPdq6fI1oah8+QjAd4bx1OeaG46WdjAocdcycfBjmUL2olhHtSpvNpz2
         65v6rXPw9IgbOGgKlPcx9jbijTnic742wEF3PvsYiDnT7vQLSJqNx6qp55YJOdZ3ZFSH
         Bsfg==
X-Gm-Message-State: AOAM531EVYRQ3SXKPTil6uMIY5yutrR80uTGonTz6Y98o2TR7QOWe58g
        VzPfeQafYOEMY0dQLCWOtvVRaWn5E0c=
X-Google-Smtp-Source: ABdhPJwGl3PNGyJ5pvYvceo8iluvNydOww8LE5P6Gbs6juRrzydI70ePwGD09/YlfyFe7J9DV81VKg==
X-Received: by 2002:a63:2bc4:: with SMTP id r187mr2210539pgr.98.1635410890746;
        Thu, 28 Oct 2021 01:48:10 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id l11sm2854498pfu.55.2021.10.28.01.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 01:48:10 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To:     song@kernel.org
Cc:     pmenzel@molgen.mpg.de, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, zealci@zte.com.cn,
        yang.guang5@zte.com.cn
Subject: [PATCH v2] raid5-ppl: use swap() to make code cleaner
Date:   Thu, 28 Oct 2021 08:48:05 +0000
Message-Id: <7e805797dd70bc40aac9343f82548324ba28cd72.1635407415.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Yang Guang <yang.guang5@zte.com.cn>

Use the macro `swap()` defined in `include/linux/minmax.h` to avoid
opencoding it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/md/raid5-ppl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index 3ddc2aa0b530..4ab417915d7f 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -1081,7 +1081,7 @@ static int ppl_load_distributed(struct ppl_log *log)
 	struct ppl_conf *ppl_conf = log->ppl_conf;
 	struct md_rdev *rdev = log->rdev;
 	struct mddev *mddev = rdev->mddev;
-	struct page *page, *page2, *tmp;
+	struct page *page, *page2;
 	struct ppl_header *pplhdr = NULL, *prev_pplhdr = NULL;
 	u32 crc, crc_stored;
 	u32 signature;
@@ -1156,9 +1156,7 @@ static int ppl_load_distributed(struct ppl_log *log)
 		prev_pplhdr_offset = pplhdr_offset;
 		prev_pplhdr = pplhdr;
 
-		tmp = page;
-		page = page2;
-		page2 = tmp;
+		swap(page, page2);
 
 		/* calculate next potential ppl offset */
 		for (i = 0; i < le32_to_cpu(pplhdr->entries_count); i++)
-- 
2.30.2

