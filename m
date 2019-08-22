Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE8198A82
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2019 06:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730908AbfHVEq3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Aug 2019 00:46:29 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:29726 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730890AbfHVEq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:28 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7M4kEYf001492;
        Thu, 22 Aug 2019 13:46:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7M4kEYf001492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566449175;
        bh=ItuXEcXjS69g1cdGEVKkZEDPDunjHHF2tdkTu2z5CJw=;
        h=From:To:Cc:Subject:Date:From;
        b=bs6YWCXkZLcRsTXzpAE94K/ewaJ6jjHWAZOM601tDS95vV9YgyW4ysGflZwIEwzjk
         6Y/EtDIAqQrkP86p4XNofVBVSKS8DOa/zTPlzVBacPXJGxKAX9+1BI+ncdeOsekrSJ
         S2oEKM3Zr70ppCYecSZ76hDb+FY4k6RsOn6IKX9EgpeV+qLUY4XjB2LP8N3cx7/1JY
         vyBeuus3iusS/nSWhLorhn9c53rQxOAXJTGinR0wwc36A+OwSnx5F3XpQ6ddExQb+y
         Sqp+NQvaao56/TvnPkyOAXznzeVR7obenLZX76SukrQilUBm9w4lPEQ6X05KvgcWDG
         /CICuQeV/wJ9A==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] kbuild: remove 'Using ... as source for kernel' message
Date:   Thu, 22 Aug 2019 13:46:08 +0900
Message-Id: <20190822044613.5349-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

You already know the location of the source tree without this message.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7e54a821b4b0..a77102e4ee90 100644
--- a/Makefile
+++ b/Makefile
@@ -1118,7 +1118,6 @@ PHONY += prepare archprepare prepare3
 # 1) Check that make has not been executed in the kernel src $(srctree)
 prepare3: include/config/kernel.release
 ifdef building_out_of_srctree
-	@$(kecho) '  Using $(srctree) as source for kernel'
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
 		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
-- 
2.17.1

