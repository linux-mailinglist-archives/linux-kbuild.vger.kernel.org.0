Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E006B681
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 08:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfGQGSq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 02:18:46 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:62958 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfGQGS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:26 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6H6I5On009435;
        Wed, 17 Jul 2019 15:18:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6H6I5On009435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563344294;
        bh=JAReFU+lVkqbhjScMSMVCxd0MDAvCgo6xXsG/5QGEaA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fiUZUEF5fl5qklYXBblKJnRbIXqghD8awTynEfSPiby8opkhdmR4tM2/Hafmep9ko
         xuCHkXPFCVunevTa4NVxFr7rRAFT2k0jZnbEXQcARzs8wDQMazoLw0xhDmcWdrUcD1
         rJuvVW3/o2m4t0wCZ2HRJsd4rjk/sqRZeXK6Sqqisv6TglRRJ4CdPGc66lZJtMiPIT
         xKmwYmdHYaY53xAJfK+iYuFw2fD9V+OmbfcctUxqtGYgu3A0CeLO8DbSv997rLQB21
         pZaYdN6jMso7Bv/V5GwM6VBYiasJBf9WoJOB6QwdoydAg10rK4JnyMPamAzUGbJsAJ
         ZOlvPjIt+wymg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/12] kbuild: remove 'prepare1' target
Date:   Wed, 17 Jul 2019 15:17:59 +0900
Message-Id: <20190717061800.10018-12-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that there is no rule for 'prepare1', it can go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 9ad9f8d1130d..14458ab3d6a8 100644
--- a/Makefile
+++ b/Makefile
@@ -1089,7 +1089,7 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare1 prepare3
+PHONY += prepare archprepare prepare3
 
 # prepare3 is used to check if we are building in a separate output directory,
 # and if so do:
@@ -1106,10 +1106,8 @@ ifdef building_out_of_srctree
 	fi;
 endif
 
-prepare1: prepare3 outputmakefile asm-generic $(version_h) $(autoksyms_h) \
-						include/generated/utsrelease.h
-
-archprepare: archheaders archscripts prepare1 scripts
+archprepare: archheaders archscripts scripts prepare3 outputmakefile \
+	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 
 prepare0: archprepare
 	$(Q)$(MAKE) $(build)=scripts/mod
-- 
2.17.1

