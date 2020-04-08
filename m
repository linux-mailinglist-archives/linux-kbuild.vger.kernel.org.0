Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0901A28B1
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 20:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgDHS3f (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 14:29:35 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:59669 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgDHS3f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 14:29:35 -0400
Received: from grover.flets-west.jp (softbank126125134031.bbtec.net [126.125.134.31]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 038ITNXF030231;
        Thu, 9 Apr 2020 03:29:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 038ITNXF030231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586370564;
        bh=Eq4/l+T0E/L3KtndTU59bHPo7+B9ARP5Xe5aQFVzSa8=;
        h=From:To:Cc:Subject:Date:From;
        b=u43iYfBhxQUxY0c3TyU0OnIiq/vnxmqEs+tSz5naMn1nZ33SkENgeYAzEdgE29yyK
         a4z1zDfVyM2plahXuKDscniqYB74t5kyg8T3UwUyf2n4Cp2UDzX9q3wgOPHgh3Xer/
         Ahp1mx6p+1lLHtQXs85W/GPOiQ/bIu0U7XJKZJ9JZA5ucBbbMZczWat4BJipl/uK32
         gBW8oyC/57PPldXLsZsJgZ6N82vaVGyiN5lF5a1PwXdqsSgkSHvPxEiEKWgcF1fGdm
         HMRWkAXAuxDq06xrBkbsSdtAX+ppg5huB0AWZUKXIewwxxKU/94ORHXVZYmYF6xvCL
         u2ihjqwap3Svw==
X-Nifty-SrcIP: [126.125.134.31]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: fix comment about missing include guard detection
Date:   Thu,  9 Apr 2020 03:29:19 +0900
Message-Id: <20200408182919.5989-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The keyword here is 'twice' to explain the trick.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index a339ef325aa5..b568a95d1f62 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -93,7 +93,7 @@ no-header-test += asm-generic/%
 
 extra-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
-# Include the header to detect missing include guard.
+# Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -S -o /dev/null -x c /dev/null \
-- 
2.17.1

