Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A85A3499C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 19:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCYSzG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 14:55:06 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:40402 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhCYSyi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 14:54:38 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 12PIsD6W025746;
        Fri, 26 Mar 2021 03:54:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 12PIsD6W025746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616698454;
        bh=uiHbK333gwU2gsZYFkshBssdMjJ08FuS6/fFhpW83bg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bsKxdoeESrpd2JqQ93f2SzcwcsJiZ9VbBVbGVCB3gHTXy+vps+svon++wTwypIkmz
         jtB1fJDxHuIR3tTWMg2gA9T4L/Zxu+sjKORyJ/hPDk7fY9QFXrrnCrrtjpLaAkEFOS
         krnA2POk+eGoIhkzZ34nFNqJCoXLi1RX82/slNfNVnq6pT0ixqpj/k6yeQUMRV05w6
         d9coI0VtAVBD7DON8dZQvyX//bS3asAjDxvd63vdbg8bGLOieR5+BAWDOFqz9OuE1l
         vpfTcxkmh4jDkYlwd3Kr4j8zlj2nGp5Fgo0U7wYvKnzeELwfndjAGS9Pb3YD6U49Zu
         zp4QCBeGPuXxQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/3] kbuild: do not set -w for vmlinux.o modpost
Date:   Fri, 26 Mar 2021 03:54:10 +0900
Message-Id: <20210325185412.2352951-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210325185412.2352951-1-masahiroy@kernel.org>
References: <20210325185412.2352951-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The -w option is meaningless for the first pass of modpost (vmlinux.o).

We know there are unresolved symbols in vmlinux.o, hence we skip
check_exports() and other checks when mod->is_vmlinux is set.

See the following part in the for-loop.

    if (mod->is_vmlinux || mod->from_dump)
            continue;

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 3f5b09a09aef..b3e08fb1fd56 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -32,8 +32,6 @@
 # Step 4 is solely used to allow module versioning in external modules,
 # where the CRC of each module is retrieved from the Module.symvers file.
 
-# KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined
-# symbols in the final module linking stage
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 # This is solely useful to speed up test compiles
 
@@ -50,7 +48,6 @@ MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
-	$(if $(KBUILD_MODPOST_WARN),-w) \
 	-o $@
 
 ifdef MODPOST_VMLINUX
@@ -136,6 +133,11 @@ endif
 
 modules := $(sort $(shell cat $(MODORDER)))
 
+# KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined symbols
+ifneq ($(KBUILD_MODPOST_WARN),)
+MODPOST += -w
+endif
+
 # Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 quiet_cmd_modpost = MODPOST $@
-- 
2.27.0

