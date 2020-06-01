Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425831E9DB8
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgFAF6Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:24 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40022 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLt023694;
        Mon, 1 Jun 2020 14:57:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLt023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991063;
        bh=S7zu9zwrCmIZaiNJwTUCHb4MomgyEqPzr3MvbiVgGGs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IimoL7fuVL8ZsWm1T9xORtD7bR2A2phyZSlUBDgH2d5y550mzv5A57Slf0oeL5zkV
         aUB0Rg5mTLlosgIyVQHdFI78A/xpJMSnK4147vI7JGKTXkFwD6puZIzHDUhwnU0xOz
         +BJxL3i4276Wzzp/VzGxZlXqB2fU7WwfORdMgDN+JaWTZlaA4YcruW+TvC6C48XylY
         FU+zGA35zhtpHCXYpreL57ZGzSnBl4aexA4mpTn1FRLekqKT8r6KapWMpNY2HlaYcC
         xQo9tcnpM65zpHOGsvqZPjGIXslbRwh9Dr8hJ6NcqGkDsT66SiONE52T4gJNCfA2au
         EGonv/xjTeAAQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 16/37] modpost: refactor -i option calculation
Date:   Mon,  1 Jun 2020 14:57:10 +0900
Message-Id: <20200601055731.3006266-16-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Prepare to use -i for in-tree modpost as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 8d000987b201..6808086075b6 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,13 +43,9 @@ __modpost:
 include include/config/auto.conf
 include scripts/Kbuild.include
 
-kernelsymfile := $(objtree)/Module.symvers
-
 MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
-	$(if $(KBUILD_EXTMOD),-i $(kernelsymfile))					\
-	$(if $(KBUILD_EXTMOD),$(addprefix -i ,$(KBUILD_EXTRA_SYMBOLS)))			\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w) \
 	-o $@
@@ -86,12 +82,14 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
 # modpost option for external modules
 MODPOST += -e
 
+input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
 
 endif
 
 # modpost options for modules (both in-kernel and external)
 MODPOST += \
+	$(addprefix -i ,$(input-symdump)) \
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
 
 ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
-- 
2.25.1

