Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB5E582F60
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 12:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732586AbfHFKDq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 06:03:46 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:35239 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732543AbfHFKDq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 06:03:46 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x76A3QP5032264;
        Tue, 6 Aug 2019 19:03:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x76A3QP5032264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565085806;
        bh=9NrW6qBmvdU9uW3rAgNep8F0eSYArnBcMnQhTyTwaww=;
        h=From:To:Cc:Subject:Date:From;
        b=MkzGE5LOFyAkFM/mazFokb44Dff7O4BkvljryLLL7l3iGqerSvHAkC2yBhCbFbXhx
         iMOamayOTdszFXjVfyoF9WHSAHB1N9aTN/AB7BJRFAmcLveYUt7bv7Fh0erLeO8ajv
         QJ+7E62gIf4ye3TKPDEkOMLjpOxq9uvfsUrXPm6wNuenjGpYSkLLrMkOIZcXRRJfpW
         xTnPKmuUPOzwYSjCgMx3eGYjB3xGiFM4BPoWbLaN5gprcot7Q2EOF31j3VgXXWnAhA
         vbJuWHkFw3P3xf7fD5Yg2dyRsz3SJblEnBERuFEWqnBi7RIf1pf1yQIfJ00DY8AE2K
         dvzV4ebBlzk2Q==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 1/3] kbuild: fix false-positive need-builtin
Date:   Tue,  6 Aug 2019 19:03:21 +0900
Message-Id: <20190806100323.22919-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current implementation of need-builtin is false-positive,
for example, in the following Makefile:

  obj-m := foo/
  obj-y := foo/bar/

..., where foo/built-in.a is not required.

Fixes: f7adc3124da0 ("kbuild: create built-in.o automatically if parent directory wants it")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0d434d0afc0b..3fe0c73e002c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -487,7 +487,8 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 
 PHONY += $(subdir-ym)
 $(subdir-ym):
-	$(Q)$(MAKE) $(build)=$@ need-builtin=$(if $(findstring $@,$(subdir-obj-y)),1)
+	$(Q)$(MAKE) $(build)=$@ \
+	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
-- 
2.17.1

