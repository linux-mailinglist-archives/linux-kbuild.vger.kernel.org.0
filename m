Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 120A5972F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2019 09:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfHUHDy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Aug 2019 03:03:54 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:46625 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfHUHDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 03:03:54 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7L73obt020055;
        Wed, 21 Aug 2019 16:03:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L73obt020055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566371030;
        bh=sMFPtLuGDuqHPGp8bbKvCgqciiiU1yw2wz53C7izrOw=;
        h=From:To:Cc:Subject:Date:From;
        b=iD1FzuN4oVpqcAMVZKMaQTdOJpL+e9O5HkbgvBpZu+ff4KIkRJI8prPuq5ybO6zDt
         3uYDFIXfrhqG+wLskRbc4zFMicClH+YyEpF6AevKXac6K3bv9jYetcIkg2oSK9v/Z9
         df4KvplaBtWLfAIXN0lIVIxFKEDT0ykcD+7b0YCuD5MG8VKDO0q7xkEAsy8JlwSh/i
         QdRMdIsqlwT/oacO70t6AsIqDiBwU2FkcNtw7hgOpXSCtoqooK6ifq4z50ACurEjKs
         vppH+uMj3DJg/mTlctf6vHYMCuzfYXkv93V/+lnPt+kIk6BtE4NWC56BVmbcdY+rFP
         sEQ2Z+w0VDdVQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove unneeded '+' marker from kselftest-merge
Date:   Wed, 21 Aug 2019 16:03:48 +0900
Message-Id: <20190821070348.8596-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This line contains $(MAKE), so Make knows that it will invoke sub-make
without help of the '+' marker.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ec2a6b85a0fa..c0be1a4dbfdd 100644
--- a/Makefile
+++ b/Makefile
@@ -1253,7 +1253,7 @@ kselftest-merge:
 	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
 	$(Q)find $(srctree)/tools/testing/selftests -name config | \
 		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
-	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 # ---------------------------------------------------------------------------
 # Devicetree files
-- 
2.17.1

