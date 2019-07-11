Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 844F86518C
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbfGKFp5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:45:57 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59588 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbfGKFp4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:56 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8O031345;
        Thu, 11 Jul 2019 14:44:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8O031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823895;
        bh=aRuS7xPLwHQCrWoOTeMolVYBvvu7Tw4KJE4Uze+OyV0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iV9jU60tfKU5vtZ9Py2MycrCttKLlDxXkXYEHJUGLEj2+jU0MkKckEekY5ywAbK0g
         pvQiUQ5DQkRNigrmzpPB4i0tUQh8ms9VfWQXv1uRhAc4+TyiR1OmCeqJqp4o/CQIZe
         YNfUcpLKp8CugcjV3GUl3PO6iCtmOsZ18hyFS7LNWt6gXutm3LH8Lr/p8SoIb+GNzH
         s5MjcMScACopRKuqiZ20qZAwG+ZnFmivNZTm7q77bnnd7QDD2d8Cku7bJ0gazk1/52
         MoYupam9tbvDOGZgG3lUQFZKCUDpmgwnl+I7yKSkPGtLdiERWD9E1MCb1pF3BRehZ5
         J2vx62iLSHKpA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] scsi: remove pointless $(MODVERDIR)/$(obj)/53c700.ver
Date:   Thu, 11 Jul 2019 14:44:27 +0900
Message-Id: <20190711054434.1177-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nothing depends on this, so it is dead code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I will apply this to kbuild tree since it is trivial.


Changes in v2: None

 drivers/scsi/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/Makefile b/drivers/scsi/Makefile
index 8826111fdf4a..acdd57e647f8 100644
--- a/drivers/scsi/Makefile
+++ b/drivers/scsi/Makefile
@@ -183,7 +183,7 @@ zalon7xx-objs	:= zalon.o ncr53c8xx.o
 # Files generated that shall be removed upon make clean
 clean-files :=	53c700_d.h 53c700_u.h scsi_devinfo_tbl.c
 
-$(obj)/53c700.o $(MODVERDIR)/$(obj)/53c700.ver: $(obj)/53c700_d.h
+$(obj)/53c700.o: $(obj)/53c700_d.h
 
 $(obj)/scsi_sysfs.o: $(obj)/scsi_devinfo_tbl.c
 
-- 
2.17.1

