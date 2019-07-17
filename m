Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB2C86B672
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 08:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbfGQGSi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 02:18:38 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:63126 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfGQGSa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:30 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6H6I5Og009435;
        Wed, 17 Jul 2019 15:18:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6H6I5Og009435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563344289;
        bh=f2zDwOw4/cS+Ip24709ZHEFoSqKLnSYLOjK1NOsqn1Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m76ZNMIucs0jE+ici7e2zOKCr/o4vOE36vdBJMv/7gSV/FhoMN1ru8iYWPwcuYrY6
         7l3CNfjjpTubks2R5qrI+1SowXM90fO6sH84la6P9V5SqN5Nipx1HIDaL7EkjBctmz
         3YOZbiYE9W8VqLfoOaPdG2WVLuWvcHU9QmnvUEDy75xqNZahmn3a+nWuTV+Vr0uXGo
         bwj8OwZl41PferYDVcxCT8dNjRIb7z7vKL2EOC0rvN7C29/Dq4YX7OwI+6mQTK6dTZ
         sQT1N0s4YvGdYWg+fLhzHgou4aoVjIA0e2T5UvW6LFcog6iz7HnL1Ij2POXmIAGsz+
         GAb2qUU95tQIw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [PATCH v3 04/12] scsi: remove pointless $(MODVERDIR)/$(obj)/53c700.ver
Date:   Wed, 17 Jul 2019 15:17:52 +0900
Message-Id: <20190717061800.10018-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nothing depends on this, so it is dead code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 drivers/scsi/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/Makefile b/drivers/scsi/Makefile
index aeda53901064..c00e3dd57990 100644
--- a/drivers/scsi/Makefile
+++ b/drivers/scsi/Makefile
@@ -185,7 +185,7 @@ zalon7xx-objs	:= zalon.o ncr53c8xx.o
 # Files generated that shall be removed upon make clean
 clean-files :=	53c700_d.h 53c700_u.h scsi_devinfo_tbl.c
 
-$(obj)/53c700.o $(MODVERDIR)/$(obj)/53c700.ver: $(obj)/53c700_d.h
+$(obj)/53c700.o: $(obj)/53c700_d.h
 
 $(obj)/scsi_sysfs.o: $(obj)/scsi_devinfo_tbl.c
 
-- 
2.17.1

