Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4B33D9A01
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jul 2021 02:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhG2ANe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Jul 2021 20:13:34 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:26564 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbhG2ANe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Jul 2021 20:13:34 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 16T0Cuue027152;
        Thu, 29 Jul 2021 09:12:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 16T0Cuue027152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627517577;
        bh=YqJ9c/GjkU+qY5J6Ldxh46l7uiwa/TKEk8lJzU+RyjU=;
        h=From:To:Cc:Subject:Date:From;
        b=o9d66vvFcU3pe4jIt+V8N0R+pPUCN7g3q2lyRq0IZRE8Yl2VY0ZaZxuyGzkebFFdW
         b6AgtVcv+qmsbceOGDPXeT/2p+tbR4meBfGdt6Y+M47duWhst4Y8/6Pz/zdA0Lw5IJ
         cyPxGfTHBqlAAa4djSyd+wsjpJ14Tp2N6ZWB4/f8fJHfciqM2SBmN3unCTlCQbStwb
         ku6qO7Ag3tVsQ3dGETWuktRruGNIIC/qDCSLVOzVh0NwGku44fax4ozqKnC8Gc9kRY
         5XCCGlV0fGhXmYqKwANqOnjEFPAN84aKVAq9m1/AUF+bpNgC5ywd7NclF6EvJIL3cq
         CWD8fZsAFsBOw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        John S Gruber <johnsgruber@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: cancel sub_make_done for the install target to fix DKMS
Date:   Thu, 29 Jul 2021 09:12:54 +0900
Message-Id: <20210729001254.327661-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit bcf637f54f6d ("kbuild: parse C= and M= before changing the
working directory"), external modules invoked by DKMS fail to build
because M= option is not parsed.

I wanted to add 'unset sub_make_done' in install.sh but similar scripts,
arch/*/boot/install.sh, are duplicated, so I set sub_make_done empty
in the top Makefile.

Fixes: bcf637f54f6d ("kbuild: parse C= and M= before changing the working directory")
Reported-by: John S Gruber <johnsgruber@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index bb10a93edf5c..4193092f7c38 100644
--- a/Makefile
+++ b/Makefile
@@ -1316,6 +1316,16 @@ PHONY += scripts_unifdef
 scripts_unifdef: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
 
+# ---------------------------------------------------------------------------
+# Install
+
+# Many distros have the custom install script, /sbin/kernelinstall.
+# If DKMS is installed, 'make install' will eventually recuses back
+# to the this Makefile to build and install external modules.
+# Cancel sub_make_done so that options such as M=, V=, etc. are parsed.
+
+install: sub_make_done=
+
 # ---------------------------------------------------------------------------
 # Tools
 
-- 
2.27.0

