Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDF01F85A
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 18:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfEOQTM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 12:19:12 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:42489 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfEOQTM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 12:19:12 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x4FGIuEA026256;
        Thu, 16 May 2019 01:18:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x4FGIuEA026256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557937137;
        bh=JwM+VF20VSpn7dLHiTgp+GAap4ILLRnNNwQOT5M64YE=;
        h=From:To:Cc:Subject:Date:From;
        b=w6+92amreV8eYZs+R9fP/2VltJfztR1kFu30D+q3uxZ/t14HzfsNf07tT6emXS6pe
         FTg3yxcQELNSGSwd7VmEXAfSGZcZ2UvKlzKgaBPRPQdOmMou34DdtgdlbZeIPyU4pV
         S8EohCigNHf3LIgMmZymh2xd1ZpJFc/FZLa7tvaTxsThw6Fy7HGMmApps7aqv5sYbJ
         yGM8I3L6ByLadhXhYSNg9CuyVFQiPe24kKmY8dIz5st1j6juxVfSWJC1W2xvc5Qfaz
         LkcmYdsJEMn17S743TkV9FWrYyipp/1plqfqEGaovoqjcRWu14a/ay6JNN4f6thj9V
         I5xe67ZLXBPvg==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add LICENSES to KBUILD_ALLDIRS
Date:   Thu, 16 May 2019 01:18:54 +0900
Message-Id: <1557937134-9236-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For *-pkg targets, the LICENSES directory should be included in the
source tarball.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9542165..e5414f7 100644
--- a/Makefile
+++ b/Makefile
@@ -1016,7 +1016,7 @@ export KBUILD_VMLINUX_LIBS := $(libs-y1)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 export LDFLAGS_vmlinux
 # used by scripts/package/Makefile
-export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch include scripts tools)
+export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) LICENSES arch include scripts tools)
 
 vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
 
-- 
2.7.4

