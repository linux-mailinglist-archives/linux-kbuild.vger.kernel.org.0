Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329F92BFF39
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 05:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgKWEzU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Nov 2020 23:55:20 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:27299 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgKWEzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Nov 2020 23:55:19 -0500
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 0AN4sGHf016676;
        Mon, 23 Nov 2020 13:54:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 0AN4sGHf016676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606107258;
        bh=XopIql2aS2anUu0DpQO6pJHOB2zl3/ZfY8m2DYF31N0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qBm/pVvO3ug65CHyGgyYKB4nxldUvCx7ElduqOF2wemd/7dTd3P4khC86izWdPPFD
         lFFA5wKxa/vlMNJVdXA0g/SfEOCdZSqZjRZSV7DOuFwMLCsU1hJ3L4llM18RPWiOgo
         VwRrkU6IM15k6zw/YyjxGsPh6Uz6cGFxf3CzYqjdv5lPAUuQiClbtgsBLhj/TLHia/
         knF4KYnSIpRR64PZN4MQXyUR6VGJRjSZkD1iXYpWhrjHZU4Pjs0d7DdpM6cAOLtEm7
         zf0oRSJGeWOS7gZiMVPS28v7/yhQIe64buq1kl9StpyUGJiRZX06FbAHxpmec0G9Sj
         zC3Qj+Rd6F9oQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] kbuild: doc: fix 'List directories to visit when descending' section
Date:   Mon, 23 Nov 2020 13:53:59 +0900
Message-Id: <20201123045403.63402-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123045403.63402-1-masahiroy@kernel.org>
References: <20201123045403.63402-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fix state information:

 - Fix the section number in the reference from 6.4 to 7.4.

 - Remove init-y and net-y. They were removed by commit 23febe375d94
   ("kbuild: merge init-y into core-y") and commit 95fb6317b3ab
   ("kbuild: merge net-y and virt-y into drivers-y"), respectively.

 - Update the example because arch/sparc64/Makefile does not exit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 2a5232b321af..e1aac82ddb9c 100644
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
2.25.1

