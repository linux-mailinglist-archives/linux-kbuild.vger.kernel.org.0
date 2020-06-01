Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D1D1E9DC5
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgFAF6k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:40 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40551 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgFAF6k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:40 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLk023694;
        Mon, 1 Jun 2020 14:57:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLk023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991060;
        bh=1ZY49CyuIkrR0Q5lTjivf4ezmBI0pSFT0WVUbhK5B6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kSMD8UIWW7Nl+TRNcsaBmGZVrb2amwWVECR67OsFZsKf0fsIm/vy0b/FjcjjEMViN
         K09jmyRSeStpkejv683jnGmT+t1Gp2SobadNpJLakAw25/psvjiUT6mo9SK8aKMVvG
         pJcyWT3ZpBOAaC11cg3utdErel3KkaqwEsc7rBeDdkufzc98CO4jzYg14j+ABjzgYk
         1Gpf+/1FYkM1xD+ENpsgVOQrchiCHwEzs4xsGJk1XvILdhiViVdaNasnmYQNRiNg/z
         v1u5ZCzbICLOOxuVKXCfCNC3DP+ZOTL5ZwKWSlhBQ/ZZAUYgsFRIxyPcCMPQCvIbml
         m6OcLEfx3mhfg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/37] modpost: fix -i (--ignore-errors) MAKEFLAGS detection
Date:   Mon,  1 Jun 2020 14:57:01 +0900
Message-Id: <20200601055731.3006266-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

$(filter -i,$(MAKEFLAGS)) works only for some cases.

The representation of $(MAKEFLAGS) depends on various factors:
  - GNU Make version (version 3.8x or version 4.x)
  - The context where $(MAKEFLAGS) is expanded (parse stage or recipe)
  - The presence of other flags like -j

In my experiments, $(MAKEFLAGS) is expanded as follows:

  * GNU Make 3.8x:
    * without -j option:
      --no-print-directory -Rri
    * with -j option
      * parse stage
        --no-print-directory -Rri
      * recipe line
        --no-print-directory -Rr --jobserver-fds=3,4 -j -i
  * GNU Make 4.x:
    * without -j option
      irR --no-print-directory
    * with -j option
      * parse stage
        irR --no-print-directory
      * recipe line
        irR -j --jobserver-fds=3,4 --no-print-directory

If you use GNU Make 4.x, the flags are grouped together like 'irR',
which does not work.

For the single thread build with GNU Make 3.8x, the flags are grouped
like '-Rri', which does not work either.

To make it work for all cases, do likewise as commit 6f0fa58e4596
("kbuild: simplify silent build (-s) detection").

BTW, since commit ff9b45c55b26 ("kbuild: modpost: read modules.order
instead of $(MODVERDIR)/*.mod"), you also need to pass -k option to
build final *.ko files. 'make -i -k' ignores compile errors in modules,
and build as many remaining *.ko as possible.

Please note this feature is kind of dangerous because a module may
depend on another module. If the prerequisite module fails to build,
other modules may lack the correct module dependency or CRC.
Honestly, I am not a big fan of it, but I am keeping this feature.

Fixes: eed380f3f593 ("modpost: Optionally ignore secondary errors seen if a single module build fails")
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index b79bf0e30d32..451bbd16c3cd 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,7 +66,7 @@ __modpost:
 
 else
 
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
+MODPOST += -s -T - \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
@@ -82,6 +82,10 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
 endif
 
+ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
+MODPOST += -n
+endif
+
 # find all modules listed in modules.order
 modules := $(sort $(shell cat $(MODORDER)))
 
-- 
2.25.1

