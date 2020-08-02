Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B29235741
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 15:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgHBNzB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 09:55:01 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:17761 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHBNzA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 09:55:00 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 072Dsgea012913;
        Sun, 2 Aug 2020 22:54:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 072Dsgea012913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596376482;
        bh=RdkndB5XJ9WbOLDonCmP4swNinqbwX3r5LJ4jdQxIps=;
        h=From:To:Cc:Subject:Date:From;
        b=chlbue1H5xj0XefuTkfybI6XJm0qG8SwrfihffgCKiRUEVvefFZgESPKUz/BCzZBc
         uQoEY3HHZ7tjbkOAqsUuJW/SSxs+ozGP4b2+FIEKShXNyUeP0haqi0xZMmEVV+fDyX
         8p96cdj9RlN0gR/z+sY4PWLMWBk+ZG7ox/23bbQ/hFyLgU/ZKJcPzP1XB1dB+4XeaG
         2SbDDAK9K2BhQUvUsWApf0PrM4XuJdy+C7SVoXSaZdvvxs+MJ0nGsuOTQ7FGjhA9Bt
         w7UID+OGL4DgKTlpILqZNkEoQf5NOGXVzIiEGa+2UfeQU65taFQn0Jw/FeiOjEq9vw
         uTfowsB56nMOw==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove redundant FORCE definition in scripts/Makefile.modpost
Date:   Sun,  2 Aug 2020 22:54:40 +0900
Message-Id: <20200802135440.908059-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The same code exists a few lines above.

Fixes: 436b2ac603d5 ("modpost: invoke modpost only when input files are updated")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 3651cbf6ad49..f54b6ac37ac2 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -124,9 +124,6 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
-PHONY += FORCE
-FORCE:
-
 endif
 
 .PHONY: $(PHONY)
-- 
2.25.1

