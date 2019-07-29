Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B67799FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 22:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbfG2Uap (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 16:30:45 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:34985 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfG2Uap (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 16:30:45 -0400
Received: from orion.localdomain ([77.7.124.62]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mt71D-1igayy3ePp-00tUcR; Mon, 29 Jul 2019 22:30:38 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH v2] Makefile: rules for printing kernel architecture and localversion
Date:   Mon, 29 Jul 2019 22:30:35 +0200
Message-Id: <1564432235-31100-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:nEEbsN3KiCGWuKFxKw2nas0RWAwU6e78j0xFPuvGglYNYOgz4Nz
 qLOEqVCvsznuHHTpuR8RRqAgtq44XbtdftCDmfUJlUweNbQWLHI2vRQR3QeFqGCij+mV1EF
 EPbRHIiSPRhVu0PmOefmKvtEQ90DIOiZeP7LCQUaeFYs0jyc3xKvRJ2qDndhRNwjfAWoa5i
 bzBjW9Z38L9qaol8tKpQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PLoMTIblG+Q=:frUn12OpaNUnF+pJ8jC51v
 80atrUoTk+0CYgAWXrmzZWmiEs6UzDOJ2RlIwcgygWDcod2wWvy1ppxK996AoxZWUiDuu45/3
 vVPs0Xdf4JFUvBvJ9k4pq28zZvCnNAO15UJBA4QPKppguxxI1+Exe7C7/HIJtPzISaxRk4jeb
 XHihFnLf5FwTYpCzTcelZ8plwoZYTb4dEg6er9Zs/7cf0m/f12+lcrLeba2v8SLvu1h61Gz7Q
 WcSZEDcCwWOpABeL3YIj2mx6LLR8w8xR85QNfjj0XkILNvmXLjZBSAO6x9qL64xAgSbYJopAC
 1nYFsQvXzSV6A9GQQ5/5EwK78bmtL+Bc2oSHLFjS3+W2LCdrx521s2ABIFmVZoLJc1OfdMCxt
 vHWgloKT8DefkihiQDrDXDhT1FTDSdby4++jAKjfEbsRftDlwVHo0UrY8dJlUBeVxGxMxQB6V
 7JQLJ3dOALVywSz+pLofdDvwXwSiMPd4BRcE+0ZaZGOcNh2DXksGVYnGE1/gws7OFBoZs05P5
 KBkhO8ZSeAokVuI/Mc/bxMUOl7WcP0wjaQPy94aJSzA5giezD+/OoRKCdVlC22AK/mnaIDf0r
 Jn+riBukpHNkZ7t+fQHLjQ7eyn2ISlIHh9eW7GM0ZuHCsDI1Pv9hgcH2UO6Gk+NPcZF3uIsYk
 jBoSWciiVY+nKhFc9UtE2U+RhVjxL2KPGOk+toKdECeNGogBvluuveAV4UJUvoWhUBtyajA2b
 i2NIiVTMgXjkAu+TrSXAtMaiBG021DgSXH3xWA==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

trivial rule to print out the kernel arch and localversion, so
external tools, like distro packagers, can easily get it.

v2: add help text

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index fa0fbe7..32c8f2a 100644
--- a/Makefile
+++ b/Makefile
@@ -1517,6 +1517,10 @@ help:
 	@echo  'Kernel packaging:'
 	@$(MAKE) $(build)=$(package-dir) help
 	@echo  ''
+	@echo  'Build configuration retrieval:'
+	@echo  '  kernellocalversion  - Print kernel local version (CONFIG_LOCALVERSION)'
+	@echo  '  kernelarch          - Print kernel architecture'
+	@echo  ''
 	@echo  'Documentation targets:'
 	@$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
 	@echo  ''
@@ -1728,6 +1732,12 @@ kernelrelease:
 kernelversion:
 	@echo $(KERNELVERSION)
 
+kernellocalversion:
+	@$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree) | sed -e 's~^\-~~'
+
+kernelarch:
+	@echo $(ARCH)
+
 image_name:
 	@echo $(KBUILD_IMAGE)
 
-- 
1.9.1

