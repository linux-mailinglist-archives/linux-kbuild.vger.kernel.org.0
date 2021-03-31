Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF9A350163
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbhCaNix (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:38:53 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38965 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235868AbhCaNid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:38:33 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFeY003995;
        Wed, 31 Mar 2021 22:38:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFeY003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197895;
        bh=UiZEW3rqRh0SNwWW1rLOq+Aj6+EF0XXZrzvwTKkiG0o=;
        h=From:To:Cc:Subject:Date:From;
        b=F2FQWDNVE46BIlcM//q0xQnBn0w/A9HWme5dVAo2auacIowfceVOD/xKzHKYtACqm
         RO1Cc+BGpjWbJ5EeYhf41LfopHcBgtW190Fjp2Zvok5weOJTrYFtnUD1F0LbT2r6wx
         hcQNTsKaplfpIGKT4QQXS526oJp3ZzF6Vz6quKPmd+C9dURTW1x99tYhAsJGhdvvt3
         otNWiJdUtvoueJHGZEttX1POdcu/OjcKiA7DjGmRBRH3mmi69mHukf1F/TcvWw7HES
         WLuY2AvgtvawCWB0wffsMY0sqMrN3WSZmyp2yiIVEsBCfFb2ZJzYWt6hP2dRIvmZXO
         itaaS8G+s4E+w==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 1/9] kbuild: remove unneeded mkdir for external modules_install
Date:   Wed, 31 Mar 2021 22:38:02 +0900
Message-Id: <20210331133811.3221540-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/Makefile.modinst creates directories as needed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Makefile b/Makefile
index ed8bd815e8a3..0e06db5ed9d8 100644
--- a/Makefile
+++ b/Makefile
@@ -1779,10 +1779,8 @@ $(MODORDER): descend
 PHONY += modules_install
 modules_install: _emodinst_ _emodinst_post
 
-install-dir := $(if $(INSTALL_MOD_DIR),$(INSTALL_MOD_DIR),extra)
 PHONY += _emodinst_
 _emodinst_:
-	$(Q)mkdir -p $(MODLIB)/$(install-dir)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
 PHONY += _emodinst_post
-- 
2.27.0

