Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898A537B740
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 09:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhELH7L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 03:59:11 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42257 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhELH7L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 03:59:11 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 14C7vbPv028192;
        Wed, 12 May 2021 16:57:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 14C7vbPv028192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620806263;
        bh=XTnZp0dklxYATimLXSJ2reqvSr9cCkH20z3gSq6FZjM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ge9jUxdRcyf/fu5QiQH9815oSlmsyLsoDXUsismXQxLsT3T8om0VmcgfhRPqbQbON
         LdoYRF50yEdDpN07kFDp0hDl0dXOFxI8W4FW7Ax6NUR8HGh7qDVo8Gdj6bqAKbYxmv
         v/ciMhBFwKL1+ArMdSWiAfwntp8JNtzWHruQWcaE+5z7BJQBLhIE8HIB+GOukuXgIi
         FQO5xIK6R5n8O0TGJP+IBKUTj+Qx8c/x23PG4rRFqiV1Zc4Q/GaP7LtXo6UISyli7j
         MB+8jhFi4qd4iuc3MGq8UmsW/BGzM2dOW5z0AI4CD6jx4akfDdP1k7WNkPy19EuScQ
         DD+mzGJMHwEiQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] hexagon: move core-y in arch/hexagon/Makefile to arch/hexagon/Kbuild
Date:   Wed, 12 May 2021 16:57:28 +0900
Message-Id: <20210512075729.60291-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512075729.60291-1-masahiroy@kernel.org>
References: <20210512075729.60291-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use obj-y to clean up Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/hexagon/Kbuild   | 1 +
 arch/hexagon/Makefile | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/hexagon/Kbuild b/arch/hexagon/Kbuild
index a4e40e534e6a..d930c2f954d5 100644
--- a/arch/hexagon/Kbuild
+++ b/arch/hexagon/Kbuild
@@ -1 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj += kernel/ mm/ lib/
diff --git a/arch/hexagon/Makefile b/arch/hexagon/Makefile
index 74b644ea8a00..44312bc147d8 100644
--- a/arch/hexagon/Makefile
+++ b/arch/hexagon/Makefile
@@ -34,7 +34,3 @@ KBUILD_CFLAGS += -ffixed-$(TIR_NAME) -DTHREADINFO_REG=$(TIR_NAME) -D__linux__
 KBUILD_AFLAGS += -DTHREADINFO_REG=$(TIR_NAME)
 
 head-y := arch/hexagon/kernel/head.o
-
-core-y += arch/hexagon/kernel/ \
-	arch/hexagon/mm/ \
-	arch/hexagon/lib/
-- 
2.27.0

