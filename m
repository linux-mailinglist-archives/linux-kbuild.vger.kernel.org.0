Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF9CB60E93
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 05:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfGFDIG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Jul 2019 23:08:06 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:48657 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfGFDIG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jul 2019 23:08:06 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x6637E3O030660;
        Sat, 6 Jul 2019 12:07:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x6637E3O030660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562382437;
        bh=BXranRnGobQsHmPdkgRbmYAS0JjPT04S0nMG/+Roa7I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WubaS67xUsMj78YonzUEFRxs7Ogw/ltP28Bl+bOOgceIgHJ0CqbRy5zTGeiHsoxS9
         i1a+a3A54Ph5hW/bvFf7EZRKnFArJQMwvz5CNmDFVzcQy0kyofx3l1LNkNBxDxJnk0
         F9sU/q5ZKQDkwHhcfVBOJuhpdSkwYk0p8nRN5e57K/b1UyKSIiF5CXo6Ie3FZqc682
         cl75+fzxeRFpTJNAx+k/w+/Is4tRXsA9RjvjUOKKP1Zl7MQfWo8JjCp6WtLjtZuUFx
         g1LrVFUjK97hgxZbVFmEBFlcqYV0dPPk0he3+No2OC9SD/jOCKyWXLYVMFmNr8b5MR
         IJX3mqdMV9MVQ==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 3/3] kbuild: add a flag to force absolute path for srctree
Date:   Sat,  6 Jul 2019 12:07:13 +0900
Message-Id: <20190706030713.6221-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190706030713.6221-1-yamada.masahiro@socionext.com>
References: <20190706030713.6221-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In old days, Kbuild always used an absolute path for $(srctree).

Since commit 890676c65d69 ("kbuild: Use relative path when building in
the source tree"), $(srctree) is '.' when not using O=.

Yet, using absolute paths is useful in some cases even without O=, for
instance, to create a cscope file with absolute path tags.

O=. was used as an idiom to force Kbuild to use absolute paths even
when you are building in the source tree.

Since commit 25b146c5b8ce ("kbuild: allow Kbuild to start from any
directory"), Kbuild is too clever to be tricked. Even if you pass O=.
Kbuild notices you are building in the source tree, then use '.' for
$(srctree).

So, "make O=. cscope" is no help to create absolute path tags.

We cannot force one or the other according to commit e93bc1a0cab3
("Revert "kbuild: specify absolute paths for cscope""). Both of
relative path and absolute path have pros and cons.

This commit adds a new flag KBUILD_ABS_SRCTREE to allow users to
choose the absolute path for $(srctree).

"make KBUILD_ABS_SRCTREE=1 cscope" will work as a replacement of
"make O=. cscope".

I added Fixes since that commit broke some users' workflow.

Fixes: 25b146c5b8ce ("kbuild: allow Kbuild to start from any directory")
Reported-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/kbuild.txt | 9 +++++++++
 Makefile                        | 4 ++++
 scripts/tags.sh                 | 3 +--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 7a7e2aa2fab5..3ef42f87f275 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -182,6 +182,15 @@ The output directory is often set using "O=..." on the commandline.
 
 The value can be overridden in which case the default value is ignored.
 
+KBUILD_ABS_SRCTREE
+--------------------------------------------------
+Kbuild uses a relative path to point to the tree when possible. For instance,
+when building in the source tree, the source tree path is '.'
+
+Setting this flag requests Kbuild to use absolute path to the source tree.
+There are some useful cases to do so, like when generating tag files with
+absolute path entries etc.
+
 KBUILD_SIGN_PIN
 --------------------------------------------------
 This variable allows a passphrase or PIN to be passed to the sign-file
diff --git a/Makefile b/Makefile
index 534a5dc796b1..6dc453f86f00 100644
--- a/Makefile
+++ b/Makefile
@@ -244,6 +244,10 @@ else
 	building_out_of_srctree := 1
 endif
 
+ifneq ($(KBUILD_ABS_SRCTREE),)
+srctree := $(abs_srctree)
+endif
+
 objtree		:= .
 VPATH		:= $(srctree)
 
diff --git a/scripts/tags.sh b/scripts/tags.sh
index 7fea4044749b..4e18ae5282a6 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -17,8 +17,7 @@ ignore="$(echo "$RCS_FIND_IGNORE" | sed 's|\\||g' )"
 # tags and cscope files should also ignore MODVERSION *.mod.c files
 ignore="$ignore ( -name *.mod.c ) -prune -o"
 
-# Do not use full path if we do not use O=.. builds
-# Use make O=. {tags|cscope}
+# Use make KBUILD_ABS_SRCTREE=1 {tags|cscope}
 # to force full paths for a non-O= build
 if [ "${srctree}" = "." -o -z "${srctree}" ]; then
 	tree=
-- 
2.17.1

