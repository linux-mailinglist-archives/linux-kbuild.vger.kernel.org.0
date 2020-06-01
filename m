Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6811E1E9DA9
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgFAF6V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39995 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgFAF6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:20 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaM8023694;
        Mon, 1 Jun 2020 14:57:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaM8023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991069;
        bh=EEkuqypsPSXsQ9T/zeWNA2J6IytD75K1+COyRh3G20M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EP/cqLp02VyDziXPkOqmlvP8ucNKQEkhLUpJOxgsSQ17XgnoR+mWd1I0MVM4R3qsH
         oQyivlFgd/nP32T5kwX9LOUaqr6zGScLVzkfBVNZL9i1U5xFjz6+9xXx23a1t3l66u
         3kl/IGL6yCo66SNvztSRDahHj6HlnCkUe51c3MK2EQrQrAyBbdGnq6QRYD75oTUMvq
         8Fcy+koYv04ebeWkdJzmLdZkKdkaTWKk/X5JTQpH3hW5qKjCLAjdf7XKMjePentDqv
         xKDKLCXLIQ1mK6MjvzKkRzEE3qxSY547cFyyayxalaa1bRQE98GmugC6dWg/OI3+Su
         4eYcUyAd04N4g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 29/37] modpost: move -d option in scripts/Makefile.modpost
Date:   Mon,  1 Jun 2020 14:57:23 +0900
Message-Id: <20200601055731.3006266-29-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Collect options for modules into a single place.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index bc9a03e8208d..b0c3634ff462 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -62,9 +62,6 @@ __modpost: vmlinux.symvers
 
 else
 
-MODPOST += \
-	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
-
 ifeq ($(KBUILD_EXTMOD),)
 
 input-symdump := vmlinux.symvers
@@ -91,6 +88,7 @@ endif
 # modpost options for modules (both in-kernel and external)
 MODPOST += \
 	$(addprefix -i ,$(wildcard $(input-symdump))) \
+	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS)) \
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
 
 ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
-- 
2.25.1

