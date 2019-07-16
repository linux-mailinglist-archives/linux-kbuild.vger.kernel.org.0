Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E416A9A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 15:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfGPNaF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 09:30:05 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:44157 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGPNaF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 09:30:05 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x6GDTm1S024692;
        Tue, 16 Jul 2019 22:29:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x6GDTm1S024692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563283788;
        bh=+Ql6QmDvrdp+YPz0zfjsgOOrr7/q1x9+qidDN9hZVQE=;
        h=From:To:Cc:Subject:Date:From;
        b=Srs4r+fJGQh7PeYfaj5ic1TiOlqEUbckfjjvB0rzCoY2ZFvfDgTva5AYU5LSfPPCm
         8o9mmtiNb1PPy3+xLdoaIA2b3ovB1wEF4J71GgHaJ35doG55+RE31z6Hn3JxVvZ60d
         kEn+cc/+JQHNU5aHwqMJNNAfOjItW1M65E5G4jsKQwoncC+oocGF5cYZxYVbfRCRa1
         gD3JdOiuuaxDLHBP3ezeNgmSE7PNZY8itrZgNdrQrtqA6fbvm/lPYk20HSoQnP70yA
         I0uN4vi/n4k+//r5N46cv5w6ZyCeBGGqy/sP1lCeklTXvGwvGBAFll5OK0cqLwIr+g
         EmEYXpCmm1qWA==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: test headers listed in header-test-m as well
Date:   Tue, 16 Jul 2019 22:29:45 +0900
Message-Id: <20190716132946.1057-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It will be useful to control the header-test by a tristate option.

If CONFIG_FOO is a tristate option, you can write like this:

  header-test-$(CONFIG_FOO) += foo.h

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8c39dade265c..0d434d0afc0b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -291,7 +291,7 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
-# header test (header-test-y target)
+# header test (header-test-y, header-test-m target)
 # ---------------------------------------------------------------------------
 
 quiet_cmd_cc_s_h = CC      $@
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 6cb3aa5cbc79..5241d0751eb0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -78,7 +78,7 @@ header-test-y	+= $(filter-out $(header-test-), \
 		$(wildcard $(addprefix $(srctree)/$(src)/, \
 		$(header-test-pattern-y)))))
 
-extra-$(CONFIG_HEADER_TEST) += $(addsuffix .s, $(header-test-y))
+extra-$(CONFIG_HEADER_TEST) += $(addsuffix .s, $(header-test-y) $(header-test-m))
 
 # Add subdir path
 
-- 
2.17.1

