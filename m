Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023F136A2D7
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Apr 2021 21:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbhDXTsW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Apr 2021 15:48:22 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60616 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbhDXTsW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Apr 2021 15:48:22 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13OJlLGY006906;
        Sun, 25 Apr 2021 04:47:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13OJlLGY006906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619293642;
        bh=0kHYvMZD5hHvwuknWwBhIIRmtE1gRP4Hgam7dOUMMtg=;
        h=From:To:Cc:Subject:Date:From;
        b=1JNE5V5do0bp5fKST7FtNa9IL+9IeWifk8LZ4FgvcUWifrlVDnt1S2CUi8+ls5ClF
         3GEcjxX5tLa2E27jaB4/b5E4cZz+Nav4WTq6ZjoEkr+wRn891Q8Pcf1IwHIQyFe992
         LIlcAr8XZpfpOFHj11hJbg/FRVQAgCiymtMcNei7HQU6oQqy7ciiF9xYXRrp6iFaXV
         L4j8Uggf1L0Ltf7aV+5+6Dd7QK0d1AaTJqbAHPlpgzuS4w/1mngQTAcZDh0iYevTAP
         9YqysCqX6Tj8PH1TCbvgH2RIy6LGz2+bc4+cAU2ZqMWt8wMdZxQftpD3wAH1Lp9zvp
         /d/6tcEpRUSCQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usr/include: refactor .gitignore
Date:   Sun, 25 Apr 2021 04:47:19 +0900
Message-Id: <20210424194719.1127653-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current .gitignore intends to ignore everything under usr/include/
except .gitignore and Makefile.

A cleaner solution is to use the '/' suffix, which make the pattern match
to only directories. It works well here because exported headers are all
located in sub-directories such as <linux/*.h>, <asm/*.h>, etc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/include/.gitignore | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/usr/include/.gitignore b/usr/include/.gitignore
index d2fab782cb7d..17b0ba1bd325 100644
--- a/usr/include/.gitignore
+++ b/usr/include/.gitignore
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-*
-!.gitignore
-!Makefile
+/*/
-- 
2.27.0

