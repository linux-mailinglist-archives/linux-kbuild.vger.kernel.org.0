Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5981C122311
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfLQETB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:19:01 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:56751 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfLQETB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:19:01 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBH4IZc5028568;
        Tue, 17 Dec 2019 13:18:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBH4IZc5028568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556316;
        bh=25xyd3OdDOunsYOF2gLZCqtPxA+eTs4L4gtuLHu79xE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SzqyV8QHiNQY/4+KrpHpC8JJxX0dsPxCyy8v56TRraBnEFT/Ag5AMZ+syLfEE2dgK
         HBoe2ByyzL9zPkZBmZazWuXBAZNHrSdUbQeRQzY1IfQETskQyanZfjPYtVQCPy889+
         iXOt8dWkqqkAucVctXJEjV/gHLrQ19pn81G0Hfu0OE5pErdSlUmwZq58W+GEdj+Su8
         6M/yonnVsxPM6+nDvSt/PYRpeRrbTnTfvC31smgp5f3xqxk6OdaTWGgLidE5+kz3Bb
         RmHpnQOJOxV8v4XX7+7kHv9d6nrnVPb8dF7YqZszLD81SQmaQb99YgjqW+EyI/TvgT
         7AqIpmLa8+dAg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: use $(PERL) in Makefile
Date:   Tue, 17 Dec 2019 13:18:19 +0900
Message-Id: <20191217041819.29732-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217041819.29732-1-masahiroy@kernel.org>
References: <20191217041819.29732-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The top Makefile defines and exports the variable 'PERL'. Use it in
case somebody wants to specify a particular version of perl from the
command line.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index f826a257d576..953a2859302c 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -47,7 +47,7 @@ build_gconfig: $(obj)/gconf
 build_xconfig: $(obj)/qconf
 
 localyesconfig localmodconfig: $(obj)/conf
-	$(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
+	$(Q)$(PERL) $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 				\
 		cmp -s .tmp.config .config ||			\
 		(mv -f .config .config.old.1;			\
-- 
2.17.1

