Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B430E2C759B
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 23:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730659AbgK1VtQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 16:49:16 -0500
Received: from condef-08.nifty.com ([202.248.20.73]:24420 "EHLO
        condef-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732603AbgK1RyS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 12:54:18 -0500
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-08.nifty.com with ESMTP id 0ASBqZ1a006246;
        Sat, 28 Nov 2020 20:52:35 +0900
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0ASBpD6C027804;
        Sat, 28 Nov 2020 20:51:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0ASBpD6C027804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606564276;
        bh=rX5Xp2DQ7Fb1cQZ9EkV0O0kQNgRf2+LwScKyCXET4yg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nWR2a++IXEGtghjl9z0jqeZ7+BR6ExiUmTDFhWNvckXgvnD4xiZM0KCHJtGJmY70l
         BK99VIcJMVGgI95LumCd4Vis5hmm3ntDOuHlAq9lgPbj3ofXTJ6KfCXAFWecQyStJ4
         Ge6EMu9V63gbYdf6TzXq7B4zvutNDOoKU0pemzt+dV8a3sFKQBy0r71a5lVwIcGpKY
         E7u6uKFIE4+ytW0tPEpTUbIGO2CUMdNxiicjqJhxg/eyBRHfZ7mWBf+M+bePrZDPAH
         U987raOwJ0+ETcOrjmu9CkbcKaPMbwm4MV6fDUcGsIvUk+fzvmlFx5moA7L0wSEX9v
         7OVE8uI+DEt5A==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] kbuild: doc: fix 'List directories to visit when descending' section
Date:   Sat, 28 Nov 2020 20:51:04 +0900
Message-Id: <20201128115108.179256-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128115108.179256-1-masahiroy@kernel.org>
References: <20201128115108.179256-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fix stale information:

 - Fix the section number in the reference from 6.4 to 7.4.

 - Remove init-y and net-y. They were removed by commit 23febe375d94
   ("kbuild: merge init-y into core-y") and commit 95fb6317b3ab
   ("kbuild: merge net-y and virt-y into drivers-y"), respectively.

 - Update the example because arch/sparc64/Makefile does not exit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 Documentation/kbuild/makefiles.rst | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 1d4335c7f496..283ccfec7613 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -278,7 +278,7 @@ more details, with real examples.
 	actually recognize that there is a lib.a being built, the directory
 	shall be listed in libs-y.
 
-	See also "6.4 List directories to visit when descending".
+	See also "7.4 List directories to visit when descending".
 
 	Use of lib-y is normally restricted to `lib/` and `arch/*/lib`.
 
@@ -1154,7 +1154,7 @@ When kbuild executes, the following steps are followed (roughly):
 	machinery is all architecture-independent.
 
 
-	head-y, init-y, core-y, libs-y, drivers-y, net-y
+	head-y, core-y, libs-y, drivers-y
 	    $(head-y) lists objects to be linked first in vmlinux.
 
 	    $(libs-y) lists directories where a lib.a archive can be located.
@@ -1162,11 +1162,9 @@ When kbuild executes, the following steps are followed (roughly):
 	    The rest list directories where a built-in.a object file can be
 	    located.
 
-	    $(init-y) objects will be located after $(head-y).
-
 	    Then the rest follows in this order:
 
-		$(core-y), $(libs-y), $(drivers-y) and $(net-y).
+		$(core-y), $(libs-y), $(drivers-y)
 
 	    The top level Makefile defines values for all generic directories,
 	    and arch/$(SRCARCH)/Makefile only adds architecture-specific
@@ -1174,11 +1172,14 @@ When kbuild executes, the following steps are followed (roughly):
 
 	    Example::
 
-		#arch/sparc64/Makefile
-		core-y += arch/sparc64/kernel/
-		libs-y += arch/sparc64/prom/ arch/sparc64/lib/
-		drivers-$(CONFIG_OPROFILE)  += arch/sparc64/oprofile/
+		# arch/sparc/Makefile
+		core-y                 += arch/sparc/
+
+		libs-y                 += arch/sparc/prom/
+		libs-y                 += arch/sparc/lib/
 
+		drivers-$(CONFIG_PM) += arch/sparc/power/
+		drivers-$(CONFIG_OPROFILE)	+= arch/sparc/oprofile/
 
 7.5 Architecture-specific boot images
 -------------------------------------
-- 
2.27.0

