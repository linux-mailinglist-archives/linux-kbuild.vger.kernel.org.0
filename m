Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FADE21740C
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 18:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgGGQf6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 12:35:58 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:41914 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgGGQf6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 12:35:58 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 067GZBhP024676;
        Wed, 8 Jul 2020 01:35:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 067GZBhP024676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1594139711;
        bh=Z7GDlYHkzBXkrrr5njoj7vSAxyMLh9VxFTcJmiipgQc=;
        h=From:To:Cc:Subject:Date:From;
        b=yrjdBlh2uYYEYpsif49lXGJrty+acA7R8ghKFFso/LrhlVuarwE+Q4M+6K/J6b/pX
         QicqdzQ7Zr62FaCY6Stj1JBUJduWeThE0jBGdOzyOoV9Tl/ZZ+Ut9k9Ivv/TsZtMkr
         KtL/K26dDzLTmAoo3hfBly/N89JBy5uQwiebV1J87QshFMwXA7ifzzo+sT3hOjv3we
         AGUfZzqL5o2pyAeAk8bVgdM5OxkCcgAh8Km8cRweCymIaA4i5D7/bFOTr6RsHfqk6J
         VqN7hOl/LjM/iHMFApoiTBVorsUJlCQIBB+K3+bE/ydMwyyoe16ak3pS/XDSuuoSLI
         ISQPLMDdGv2eA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     =?UTF-8?q?Bj=8F=A9=CCrn=20Mork?= <bjorn@mork.no>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: fix single target builds for external modules
Date:   Wed,  8 Jul 2020 01:35:08 +0900
Message-Id: <20200707163508.1191105-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit f566e1fbadb6 ("kbuild: make multiple directory targets work")
broke single target builds for external modules. Fix this.

Fixes: f566e1fbadb6 ("kbuild: make multiple directory targets work")
Reported-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fe0164a654c7..676f1cfb1d56 100644
--- a/Makefile
+++ b/Makefile
@@ -1754,7 +1754,7 @@ PHONY += descend $(build-dirs)
 descend: $(build-dirs)
 $(build-dirs): prepare
 	$(Q)$(MAKE) $(build)=$@ \
-	single-build=$(if $(filter-out $@/, $(filter $@/%, $(single-no-ko))),1) \
+	single-build=$(if $(filter-out $@/, $(filter $@/%, $(KBUILD_SINGLE_TARGETS))),1) \
 	need-builtin=1 need-modorder=1
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))
-- 
2.25.1

