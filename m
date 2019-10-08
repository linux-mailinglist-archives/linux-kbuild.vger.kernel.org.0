Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06040CF944
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2019 14:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbfJHMGq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Oct 2019 08:06:46 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:28279 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730751AbfJHMGn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 08:06:43 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x98C6134021176;
        Tue, 8 Oct 2019 21:06:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x98C6134021176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570536362;
        bh=acaNKDKpGidTrv+O/oEz3Pcbxkt2cuge+GJ8iZc9IzI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VDCtBo+R+3yIxcR10B8QSEsv+jIbQLIVF4V1qUYRsI0BIEemLFBbZUaCtOL1U81lb
         xmsRzmXSvcQ8iFUqEH42jXrBt2/kW2n50xJC4jzkexWXzTaCqy2fHURAYaWQlqKaCj
         luoYm8MNCSnIq5J+Zd6pJCHnmPdWHyzuIAeZP6TfOSxmGiF2vJuME9xiawi3YiOwZP
         Mwq4LPzTgB4ypthpepvWZl+n5piaCVlFRws8A8OvQ4p1o/iLJEeuD7Jxi8csQPL7gM
         +iUl6STJUI2r8AR1HfBaFRjp9uwfvWh34Y84Stq0iZjoaiDLbycJ/47FKT0DJK0fcR
         W6Zq44Qoa0wLA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] kheaders: optimize md5sum calculation for in-tree builds
Date:   Tue,  8 Oct 2019 21:05:53 +0900
Message-Id: <20191008120556.4263-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008120556.4263-1-yamada.masahiro@socionext.com>
References: <20191008120556.4263-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script computes md5sum of headers in srctree and in objtree.
However, when we are building in-tree, we know the srctree and the
objtree are the same. That is, we end up with the same computation
twice. In fact, the first two lines of kernel/kheaders.md5 are always
the same for in-tree builds.

Unify the two md5sum calculations.

For in-tree builds ($building_out_of_srctree is empty), we check
only two directories, include, and arch/$SRCARCH/include.

For out-of-tree builds ($building_out_of_srctree is 1), we check
4 directories, $srctree/include, $srctree/arch/$SRCARCH/include,
include, and arch/$SRCARCH/include since we know they are all
different.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/gen_kheaders.sh | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 8aa6d3c37ba7..5f8e664977f8 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -21,29 +21,30 @@ arch/$SRCARCH/include/
 # Uncomment it for debugging.
 # if [ ! -f /tmp/iter ]; then iter=1; echo 1 > /tmp/iter;
 # else iter=$(($(cat /tmp/iter) + 1)); echo $iter > /tmp/iter; fi
-# find $src_file_list -name "*.h" | xargs ls -l > /tmp/src-ls-$iter
-# find $obj_file_list -name "*.h" | xargs ls -l > /tmp/obj-ls-$iter
+# find $all_dirs -name "*.h" | xargs ls -l > /tmp/ls-$iter
+
+all_dirs=
+if [ "$building_out_of_srctree" ]; then
+	for d in $dir_list; do
+		all_dirs="$all_dirs $srctree/$d"
+	done
+fi
+all_dirs="$all_dirs $dir_list"
 
 # include/generated/compile.h is ignored because it is touched even when none
 # of the source files changed. This causes pointless regeneration, so let us
 # ignore them for md5 calculation.
-pushd $srctree > /dev/null
-src_files_md5="$(find $dir_list -name "*.h"			   |
-		grep -v "include/generated/compile.h"		   |
-		grep -v "include/generated/autoconf.h"		   |
-		xargs ls -l | md5sum | cut -d ' ' -f1)"
-popd > /dev/null
-obj_files_md5="$(find $dir_list -name "*.h"			   |
-		grep -v "include/generated/compile.h"		   |
-		grep -v "include/generated/autoconf.h"		   |
+headers_md5="$(find $all_dirs -name "*.h"			|
+		grep -v "include/generated/compile.h"	|
+		grep -v "include/generated/autoconf.h"	|
 		xargs ls -l | md5sum | cut -d ' ' -f1)"
+
 # Any changes to this script will also cause a rebuild of the archive.
 this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
 if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
 if [ -f kernel/kheaders.md5 ] &&
-	[ "$(head -n 1 kernel/kheaders.md5)" = "$src_files_md5" ] &&
-	[ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$obj_files_md5" ] &&
-	[ "$(head -n 3 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
+	[ "$(head -n 1 kernel/kheaders.md5)" = "$headers_md5" ] &&
+	[ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
 	[ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
 		exit
 fi
@@ -76,8 +77,7 @@ tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
     --owner=0 --group=0 --sort=name --numeric-owner \
     -Jcf $tarfile -C $cpio_dir/ . > /dev/null
 
-echo "$src_files_md5" >  kernel/kheaders.md5
-echo "$obj_files_md5" >> kernel/kheaders.md5
+echo $headers_md5 > kernel/kheaders.md5
 echo "$this_file_md5" >> kernel/kheaders.md5
 echo "$(md5sum $tarfile | cut -d ' ' -f1)" >> kernel/kheaders.md5
 
-- 
2.17.1

