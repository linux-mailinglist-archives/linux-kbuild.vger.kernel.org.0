Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB0336A171
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Apr 2021 15:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237403AbhDXN43 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Apr 2021 09:56:29 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:63456 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237374AbhDXN40 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Apr 2021 09:56:26 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 13ODtSoM006581;
        Sat, 24 Apr 2021 22:55:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 13ODtSoM006581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619272528;
        bh=hg0YplKCF4cxQYurDZ/zCJxWacDWbwCB7BICXCCa2P8=;
        h=From:To:Cc:Subject:Date:From;
        b=pGKmqv0p0HyTY3zMxOaRQ/EnJXxweUf0cIiYYH8OYl+6KgHJa6LW5pTQreKXLBP61
         w6ubUQrbJGxBTrsmG1Yw5nXlY3OKjMQPvDxPspi/FI0CeRBhHrU5igkKiIn6l2vl82
         uGHs/jcxRWUA2CP0KSlT8sJFfKDdrM7UD03L4D8khCFXs6dsbETbV1Ax1P0cSfA0l8
         OFl5EvvxW8/t53HXvGIf59mTr/mikF5y//wqu3F9HPxtSis8fWDaVf+SQ3BiaxtjmH
         rfoZ/POlWRy4nXZDYbht5NqhuCN2dzWsS0zobvdyOSwf8Y7EKr+rKFOr7lSBC0i2JZ
         b7iXpA0MHmudA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: refactor .gitignore
Date:   Sat, 24 Apr 2021 22:55:24 +0900
Message-Id: <20210424135524.196603-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add '/' prefix to clarify that the generated files exist right under
scripts/kconfig/, but not in the sub-directories.

Replace '*conf-cfg' with '[gmnq]conf-cfg' to make it explicit, but
still short.

Use '[gmnq]conf' to combine gconf, mconf, nconf, and qconf.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/.gitignore | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index c3d537cd0275..500e7424b3ef 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -1,12 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+/conf
+/[gmnq]conf
+/[gmnq]conf-cfg
 /qconf-moc.cc
-*conf-cfg
-
-#
-# configuration programs
-#
-conf
-mconf
-nconf
-qconf
-gconf
-- 
2.27.0

