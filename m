Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B9B1B5DB1
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 16:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDWOYk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 10:24:40 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:42829 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgDWOYi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 10:24:38 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 03NEO72X028581;
        Thu, 23 Apr 2020 23:24:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 03NEO72X028581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587651849;
        bh=OlCb8frhpY2Za1yj/p2H075SumHInvU8We060i62nwA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oZjBIcd4ohGNjihfaisSdXgwVTujFq+0B8pHpx3EVq04kMZpyRDsbo3haZBTcmB1M
         098HHsN68cll5ysJdxKc8kTIOEQ6sn8czjan0cq00Jux3B4PL9X0XJnvtAALXq5WR5
         PNEFNiQU9Ol8WY+YTKfNHK4EMW1aymqhT08DB01mZeQIu36rMXR9tc5HcfD0GS19yY
         P7KeMJ39RoIIFzmgYoEWG7tQ6ADoxAxYO/Ayfc1iWJ7XPOFHB3Nnz2RAonPKAV36ga
         sP+OOwJSQ2Lbi6RIAg5FzjEeE9L4igdfTgiRvnrNe35AbGbgXpsU6YNdEdzJVjqjdI
         a/kTQPvWWC7mQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] kbuild: use CONFIG_CC_VERSION_TEXT to construct LINUX_COMPILER macro
Date:   Thu, 23 Apr 2020 23:23:54 +0900
Message-Id: <20200423142354.312088-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423142354.312088-1-masahiroy@kernel.org>
References: <20200423142354.312088-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/mkcompile_h runs $(CC) just for getting the version string.
Re-use CONFIG_CC_VERSION_TEXT to optimize it.

For GCC, this slightly changes the version string. I do not think it
is a big deal as we do not have the defined format for LINUX_COMPILER.
In fact, the recent commit 4dcc9a88448a ("kbuild: mkcompile_h:
Include $LD version in /proc/version") added the linker version.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 init/Makefile       | 2 +-
 scripts/mkcompile_h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/init/Makefile b/init/Makefile
index d45e967483b2..30c7345e4fe2 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
 	@$($(quiet)chk_compile.h)
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
-	"$(CONFIG_PREEMPT_RT)" "$(CC)" "$(LD)"
+	"$(CONFIG_PREEMPT_RT)" "$(CONFIG_CC_VERSION_TEXT)" "$(LD)"
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 5b80a4699740..baf3ab8d9d49 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -6,7 +6,7 @@ ARCH=$2
 SMP=$3
 PREEMPT=$4
 PREEMPT_RT=$5
-CC=$6
+CC_VERSION="$6"
 LD=$7
 
 vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
@@ -62,7 +62,6 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
   printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
   echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
 
-  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//')
   LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
 		      | sed 's/[[:space:]]*$//')
   printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
-- 
2.25.1

