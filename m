Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164D01D6729
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgEQJvL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:51:11 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38298 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgEQJtf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:35 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4L9018560;
        Sun, 17 May 2020 18:49:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4L9018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708952;
        bh=fKQ2suNbonPmMpy+xo1CkibGOmskSnkybnUC1ujH2W0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OHlez3+wyMKPlWr+X8K+9UOvN4ATUr1THtxYvbI9jU3dZO8plShQFKy9Onx5uvBJj
         vKA2YbzH7iPwEZrs5hjG/WQHOgAOL5yS++JNk1KKRaezmtffCJZqAumw3H6wSeEKby
         2Sfqr/DG5vRgNJSDKPauYNXttGjQbUOxFZU1ZUFwu+iy8xmNJuoPpTuVGa2LF4DDhL
         y5zizcg8aTTJitesUGn4O5gl5RnHnwtV41y3d/qylfwiLdIp2fKKYvAdO+qThe4vG5
         tktYnGiH+IDZmCPNtwDE4+4XZLp3Exrlhujr5+JA5R5k4DAIt0GZbXg426pdMHbxRL
         Yxd/isp9zdDIg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/29] modpost: move external module options
Date:   Sun, 17 May 2020 18:48:42 +0900
Message-Id: <20200517094859.2376211-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Separate out the external-only code for readability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index bc5561aedb24..8321068abb31 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -44,14 +44,11 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 
 kernelsymfile := $(objtree)/Module.symvers
-modulesymfile := $(KBUILD_EXTMOD)/Module.symvers
 
 MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
-	$(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)					\
-	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))			\
-	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))					\
+	$(if $(KBUILD_EXTMOD),,-o $(kernelsymfile))					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w)
 
@@ -81,6 +78,13 @@ src := $(obj)
 # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
 include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
+
+# modpost options for external modules
+MODPOST += \
+	-i Module.symvers \
+	$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)) \
+	-o $(KBUILD_EXTMOD)/Module.symvers
+
 endif
 
 # find all modules listed in modules.order
-- 
2.25.1

