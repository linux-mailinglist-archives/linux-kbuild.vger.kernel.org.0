Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A7815FD65
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2020 08:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgBOHuf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 Feb 2020 02:50:35 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:26236 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgBOHuf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Feb 2020 02:50:35 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 01F7oMA5009343;
        Sat, 15 Feb 2020 16:50:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 01F7oMA5009343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581753023;
        bh=NWZbgC0y+bTEGb9g9tWKLW6InUUuSS9tlsQWHxubZyk=;
        h=From:To:Cc:Subject:Date:From;
        b=aPmdRKCtbPHkqZtARaPt1YJ2L1SrIQMyz1IMqjBA+Yep3ocv6+8ULjoRA72cRF39C
         vuZ+LNThnL272SZA8vglkWflwBbL+m60RUzgmYOUSLEYMXQeTLwI3Aks+8uquJwQfP
         uQTTfj5hKjZ6tlrHwiGknXfklel64uPhf4dkw7aMpxD+hp185YdcZXBms12WfwOeck
         cRCTI77LYo1LhxJd88fTqFzZ4hoPHRcxVnCJS25EgK9fUzsraP3xKq7yR+YTxENlnP
         Bld1MAtzrnsVvRNAXrSo4ErPhZXpVfMaxOr6pjI8eroPJATh6HjWbRLfDADRCOsMx6
         OpUQp+XNCjZXA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove the owner check in mkcompile_h
Date:   Sat, 15 Feb 2020 16:50:20 +0900
Message-Id: <20200215075020.10426-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts a very old commit, which dates back to the pre-git era:

|commit 5d1cfb5b12f72145d30ba0f53c9f238144b122b8
|Author: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
|Date:   Sat Jul 27 02:53:19 2002 -0500
|
|    kbuild: Fix compiling/installing as different users
|
|    "make bzImage && sudo make install" had the problem that during
|    the "sudo make install" the build system would notice that the information
|    in include/linux/compile.h is not accurate (it says "compiled by <user>",
|    but we are root), thus causing compile.h to be updated and leading to
|    some recompiles.
|
|    We now only update "compile.h" if the current user is the owner of
|    include/linux/autoconf.h, i.e. the user who did the "make *config". So the
|    above sequence will correctly state "compiled by <user>".
|
|diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
|index 6313db96172..cd956380978 100755
|--- a/scripts/mkcompile_h
|+++ b/scripts/mkcompile_h
|@@ -3,6 +3,17 @@ ARCH=$2
| SMP=$3
| CC=$4
|
|+# If compile.h exists already and we don't own autoconf.h
|+# (i.e. we're not the same user who did make *config), don't
|+# modify compile.h
|+# So "sudo make install" won't change the "compiled by <user>"
|+# do "compiled by root"
|+
|+if [ -r $TARGET -a ! -O ../include/linux/autoconf.h ]; then
|+  echo ' (not modified)'
|+  exit 0
|+fi
|+
| if [ -r ../.version ]; then
|   VERSION=`cat ../.version`
| else

The 'make bzImage && sudo make install' problem no longer happens
because commit 1648e4f80506 ("x86, kbuild: make "make install" not
depend on vmlinux") fixed the root cause.

Commit 19514fc665ff ("arm, kbuild: make "make install" not depend on
vmlinux") fixed the similar issue on ARM, with detailed explanation.

So, the rule is that the installation targets should never trigger
the builds of any build artifact. By following it, this check is
unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mkcompile_h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 3a5a4b210c86..3ff26e5b2eac 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -10,17 +10,6 @@ CC=$6
 
 vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
 
-# If compile.h exists already and we don't own autoconf.h
-# (i.e. we're not the same user who did make *config), don't
-# modify compile.h
-# So "sudo make install" won't change the "compiled by <user>"
-# do "compiled by root"
-
-if [ -r $TARGET -a ! -O include/generated/autoconf.h ]; then
-  vecho "  SKIPPED $TARGET"
-  exit 0
-fi
-
 # Do not expand names
 set -f
 
-- 
2.17.1

