Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05B11E9DC4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgFAF61 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:27 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40007 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLx023694;
        Mon, 1 Jun 2020 14:57:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLx023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991065;
        bh=ImoqVVy6jnEvNzCO7Q2Smi7Gogn5sA+4zyEr4FkJDYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QckgFaypJIHPk8LmmhthUyviDgdS++KPZsCrrrU/LYhfPdCQmA7pcJtYkguedzRfa
         JSu6gA5sBohtChjtMw/Nbx7RYZLULye765JjgIlLPB2J1eAlkjLDYSejVfhLgaITDn
         9Unt4qVsoO1FBybN9e05G0oB1uGZ/5+g0Q4CCyUPkHgUQ6O7LljAUfOHbFjCkGv/t/
         NLbbUTHJ4rMtkB6qL43ZCyeECgYK4T1UNdouHIDjPFwdnpWwq/g+1di49JiRSwXO/E
         ubFYcp48QVX5CitF+G898/XNrjgdnCz+CjbLnhI7DZ1rb373CtEtmBOa73TULq2D/R
         KfNLYDAgHCOwg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 20/37] modpost: show warning if any of symbol dump files is missing
Date:   Mon,  1 Jun 2020 14:57:14 +0900
Message-Id: <20200601055731.3006266-20-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If modpost fails to load a symbol dump file, it cannot check unresolved
symbols, hence module dependency will not be added. Nor CRCs can be added.

Currently, external module builds check only $(objtree)/Module.symvers,
but it should check files specified by KBUILD_EXTRA_SYMBOLS as well.

Move the warning message from the top Makefile to scripts/Makefile.modpost
and print the warning if any dump file is missing.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 10 +---------
 scripts/Makefile.modpost |  5 ++++-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 6280c7597a2d..f80c4ff93ec9 100644
--- a/Makefile
+++ b/Makefile
@@ -1649,17 +1649,9 @@ else # KBUILD_EXTMOD
 # We are always building modules
 KBUILD_MODULES := 1
 
-PHONY += $(objtree)/Module.symvers
-$(objtree)/Module.symvers:
-	@test -e $(objtree)/Module.symvers || ( \
-	echo; \
-	echo "  WARNING: Symbol version dump $(objtree)/Module.symvers"; \
-	echo "           is missing; modules will have no dependencies and modversions."; \
-	echo )
-
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
-modules: descend $(objtree)/Module.symvers
+modules: descend
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 PHONY += modules_install
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 7d564a39f938..16fe19724c34 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -97,8 +97,11 @@ ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
 MODPOST += -n
 endif
 
+# Clear VPATH to not search for *.symvers in $(srctree). Check only $(objtree).
+VPATH :=
 $(input-symdump):
-	@:
+	@echo >&2 'WARNING: Symbol version dump "$@" is missing.'
+	@echo >&2 '         Modules may not have dependencies or modversions.'
 
 # Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
-- 
2.25.1

