Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD791D66F9
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgEQJtf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:49:35 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38302 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgEQJtf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:35 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4L6018560;
        Sun, 17 May 2020 18:49:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4L6018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708950;
        bh=4G/LU/whNlt1qcU7HLw7OO1/pSZrdFyVabhepRCEO/Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GI5LEdjPfr2KlWPvSIftDRPwYqgr2RSSRvCJ2TJdqpZHAEzXclb33RXkpuEWF/Arc
         eeNnAOLqPXmr906gADNCHfhbLN5yhLRRRmLLRkc4/sE2m73zzNn5YdVGzwnNUbnum7
         jFB6t0VpdEz/muIbS1xhJ70KqFMASP92Gm/6BnWfOc70dZYEN+lPsz5rpeGD034KeV
         SpqsSFe5eoeUHx2+DQ3mFAS8OC6qIgB1ynCM3d64vPFR4FK8NjJ/p+zOfIbJvyOlyj
         n3vdtEctZlRNy+w1u+w5epcSt9QhfKSSzgCM/eB1g58zYWqqcNp8cGkyqsZSHoDERr
         aWhWatRfEbNHA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
Date:   Sun, 17 May 2020 18:48:39 +0900
Message-Id: <20200517094859.2376211-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

$(firstword ...) in scripts/Makefile.modpost was added by commit
3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
to build multiple external module directories.

This feature has been broken for a while. Remove the bitrotten code, and
stop parsing if M or KBUILD_EXTMOD contains multiple words.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 3 +++
 scripts/Makefile.modpost | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1915630cc24b..aeb690c692ee 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,9 @@ ifeq ("$(origin M)", "command line")
   KBUILD_EXTMOD := $(M)
 endif
 
+$(if $(word 2, $(KBUILD_EXTMOD)), \
+	$(error building multiple external modules is not supported))
+
 export KBUILD_CHECKSRC KBUILD_EXTMOD
 
 extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 957eed6a17a5..b79bf0e30d32 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -44,7 +44,7 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 
 kernelsymfile := $(objtree)/Module.symvers
-modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
+modulesymfile := $(KBUILD_EXTMOD)/Module.symvers
 
 MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
-- 
2.25.1

