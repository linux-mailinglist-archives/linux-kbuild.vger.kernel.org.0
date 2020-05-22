Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6131DDCE1
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 04:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgEVCA1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 22:00:27 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:37241 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgEVCA1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 22:00:27 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 04M205UX009585;
        Fri, 22 May 2020 11:00:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 04M205UX009585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590112808;
        bh=p68P5aztaSnVFKazuy1uvMsF2Jqe9k7v6DqDJgghFkw=;
        h=From:To:Cc:Subject:Date:From;
        b=xvfyE3QrXaukpL6qiDqUhwERD0uByfY7b4QEhBM0hOxuB3az0SVFKds9IEi+D3sYY
         nT3Tjt0F6eP3cK95/umJQye0pwczlNer+teeF2XGVLDDTIzeGeQQ5MJV4jCeEcdriA
         QXZOC8+l65LD5ocQVJzHRqZOK/LfxEAuySXwCZ+DyX4LxjV1WlUhRuuSZs3r0fU8OW
         3lZPybxoO1ntBETAyUW2b5aHaPL7WY2zslzQrJewiC4fuU66RJRJg1rf/dvgcgaUYf
         /5n7zUb4g9dJM007ifmz7uodeVX0XiDCElMmc28qAd7M+qsA6HgYKch0dXOlgdnq0R
         9fZ9lBjtAukMA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] kbuild: remove ifdef builtin-target / lib-target
Date:   Fri, 22 May 2020 10:59:58 +0900
Message-Id: <20200522020002.504506-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I do not see a good reason to add ifdef here.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3665b1a0bc8e..9af88f4cacb8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -384,16 +384,14 @@ $(obj)/%/built-in.a: $(obj)/% ;
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
 #
-ifdef builtin-target
 
 quiet_cmd_ar_builtin = AR      $@
       cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
 
-$(builtin-target): $(real-obj-y) FORCE
+$(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
 
 targets += $(builtin-target)
-endif # builtin-target
 
 #
 # Rule to create modules.order file
@@ -408,15 +406,11 @@ $(modorder-target): $(subdir-ym) FORCE
 #
 # Rule to compile a set of .o files into one .a file (with symbol table)
 #
-ifdef lib-target
-
-$(lib-target): $(lib-y) FORCE
+$(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
 targets += $(lib-target)
 
-endif
-
 # NOTE:
 # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
 # module is turned into a multi object module, $^ will contain header file
-- 
2.25.1

