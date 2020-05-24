Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782BF1E0027
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388057AbgEXPo4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:56 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19684 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUt017561;
        Mon, 25 May 2020 00:42:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUt017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334964;
        bh=0qCGSzL0D4F+pX/Srg5WEeu7uxvhZLJM/cFCWamCZgI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FF2VCjH7kXx6A0aRRS4jHjlxNSy58Kegd3X9M/LYS+d+7KNWJGqKoyEZQKZb7ccKA
         n4pWK4W5RPNYzxof9FCKmjc89vyj64nVy2xMNiTINADyd+5ADlOc/nXInWXpLfdab/
         TbfyuARCNk1yFGHc7m4TBU+8tEO0DClfzzI6d1q8nBAFujA6Kn9muDXI7cDPBGucHT
         RcSrOdS3yEkKBoJSDcYvQ1l86oD6UOkGy0WJl1XwRM7CfxqOZpyLWsdtrNhuYrNr+E
         CKrCC0jGmOA57U/xTXSF1cltbFgc4tW5+90tUKNB2mDtKcMVfgv3PRLlfjI7Axae6r
         dS/jemv700g7g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/29] modpost: move -T option close to the modpost command
Date:   Mon, 25 May 2020 00:42:16 +0900
Message-Id: <20200524154235.380482-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The '-T -' option reads the file list from stdin.

It is clearer to put it close to the piped command.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/Makefile.modpost | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index b79bf0e30d32..da7730a43819 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,7 +66,7 @@ __modpost:
 
 else
 
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
@@ -88,7 +88,7 @@ modules := $(sort $(shell cat $(MODORDER)))
 # Read out modules.order instead of expanding $(modules) to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 quiet_cmd_modpost = MODPOST $(words $(modules)) modules
-      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST)
+      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST) -T -
 
 __modpost:
 	$(call cmd,modpost)
-- 
2.25.1

