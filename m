Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540C1372885
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 12:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhEDKMX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 06:12:23 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:49883 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbhEDKMV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 06:12:21 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 144AB1SW020452;
        Tue, 4 May 2021 19:11:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 144AB1SW020452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620123063;
        bh=4wQYoBM2sFHMXvUPpDLtOzyPD+TI9yzU+eQp7QziKKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tSJT2WuSZJUmFqtHjC0cqRAHRcB8rYbpirzWG2j2V1RU0rhKtsT3+zjxpKpE0M7Ue
         i+wWhC9GSRP5w3mulpyeG90oxGxQSekLP1a4R+2j33PCEZGEK46p4yEr+XOosX//sq
         Lnmo6PxT1AlFxrorGPw4FiknV8nNHXnk/Abcpce1F87rxAIni3GuFmCpKTFV1HP8C1
         NrwJaGhaSCVqcylRj4jnPWse3l6efOjChQR8UOeFhnsNJgzJBlxwA1m82UwyMmZIZL
         ppA9YQsQPtmqFxNXBmTY1EXGjM+k4RhKZh/DsLx3S4f1xSm8fHYbIEEaESAi5IhsCt
         LXl3dsnX6NdBw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kbuild: remove the unneeded comments for external module builds
Date:   Tue,  4 May 2021 19:10:58 +0900
Message-Id: <20210504101058.96498-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210504101058.96498-1-masahiroy@kernel.org>
References: <20210504101058.96498-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The supported targets for external modules are listed in the help target
a few lines below. Let's not have duplicated information in two places.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 2cbf68dc40b7..9b9a003bd88f 100644
--- a/Makefile
+++ b/Makefile
@@ -1711,17 +1711,7 @@ else # KBUILD_EXTMOD
 # When building external modules the kernel used as basis is considered
 # read-only, and no consistency checks are made and the make
 # system is not used on the basis kernel. If updates are required
-# in the basis kernel ordinary make commands (without M=...) must
-# be used.
-#
-# The following are the only valid targets when building external
-# modules.
-# make M=dir clean     Delete all automatically generated files
-# make M=dir modules   Make all modules in specified dir
-# make M=dir	       Same as 'make M=dir modules'
-# make M=dir modules_install
-#                      Install the modules built in the module directory
-#                      Assumes install directory is already created
+# in the basis kernel ordinary make commands (without M=...) must be used.
 
 # We are always building only modules.
 KBUILD_BUILTIN :=
-- 
2.27.0

