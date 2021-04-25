Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F4536A50E
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Apr 2021 08:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhDYGZW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Apr 2021 02:25:22 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:20871 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhDYGZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Apr 2021 02:25:22 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 13P6OBfI031298;
        Sun, 25 Apr 2021 15:24:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 13P6OBfI031298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619331851;
        bh=PrsXzayPwi2nwArMhsd+aWVtkyJh2Z47XTnVvtEn5x4=;
        h=From:To:Cc:Subject:Date:From;
        b=gBikQ3pXySgICnyU5NT9awZqPz+WtPFqBz+vsKfW8N20wYKry4TjUBUO2wIv9M9AU
         ukJ6yoLhtt+HVtQPr1DT347WnVk2nbOfRi7LLAZ1p5MM2hOXTxwSr+OCI4UqDF5UXM
         g6TyAebzcdqLLADZzqjFc9NBrQDIn8EYfn/ND46tntl+wOogFqS26uFIlDZzewIu8j
         zVBhP6uLT6g76mTPANaRqnpMVCeajqyQ/2hpbaca2ymybqEw4/RAOcQFhCUavikhEs
         JimEOh6h8P0TXmOJpTbAdXSmm8IJ9JTsGCUdSdHdf3yT+2lIogYjWIi1rVSCHVw8D5
         0VGolvbvpoGfQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] kernel/.gitgnore: remove stale timeconst.h and hz.bc
Date:   Sun, 25 Apr 2021 15:24:03 +0900
Message-Id: <20210425062407.1183801-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

timeconst.h and hz.bc used to exist in kernel/.

Commit 5cee96459726 ("time/timers: Move all time(r) related files into
kernel/time") moved them to kernel/time/.

Commit 0a227985d4a9 ("time: Move timeconst.h into include/generated")
moved timeconst.h to include/generated/ and removed hz.bc .

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/.gitignore | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/.gitignore b/kernel/.gitignore
index 78701ea37c97..4abc4e033ed8 100644
--- a/kernel/.gitignore
+++ b/kernel/.gitignore
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
 kheaders.md5
-timeconst.h
-hz.bc
-- 
2.27.0

