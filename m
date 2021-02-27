Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9D5326BF7
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 07:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhB0G1X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 01:27:23 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:23578 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhB0G1W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 01:27:22 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 11R6QMHG007635;
        Sat, 27 Feb 2021 15:26:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 11R6QMHG007635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614407183;
        bh=aKY/yH1zHb7OPSoBCjjFTImuEDgWLl8bijXnPmZ+cNM=;
        h=From:To:Cc:Subject:Date:From;
        b=o/A9YOc94Jz8rKw4xIr7Db38CnPxNjhpDVgZHgDyWEaFmR7l6qhe0jQNqjaldIGAB
         IdGdZDSQZRlbQrJhZw0eJ2saWdAgjV/JjMhntEEmWDccyBs7VFuqw1dB8MZjNErJ91
         cdtHhzhnV9NKC9s1I6OiAFyiTx9L8irJiJv9e6B0oobcFu3J7IVUHd9AHbKs83Cjop
         wiXxkR/9w6GB0F78UuyuKepI18tUSFsmVmuLb86AgsELO8SFwglRlimxNhFk6yT3wV
         5INNAwu8PM4jUIi+yz6zw/0fIvEwBYdotM/n/DPTB8xkF299XbzznkPDLqzYRr33rH
         EJHXSOEAiaZgg==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: make -s option take precedence over V=
Date:   Sat, 27 Feb 2021 15:26:20 +0900
Message-Id: <20210227062620.44708-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make -s' should be really silent. However, 'make -s V=1' prints noisy
log messages from some shell scripts.

Of course, the combination of -s and V=1 is odd, but the build system
needs to do the right thing even if a user gives strange input.

If -s is given, KBUILD_VERBOSE should be forced to 0.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 6ecd0d22e608..0a655469cafb 100644
--- a/Makefile
+++ b/Makefile
@@ -96,6 +96,7 @@ endif
 
 ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
   quiet=silent_
+  KBUILD_VERBOSE = 0
 endif
 
 export quiet Q KBUILD_VERBOSE
-- 
2.27.0

