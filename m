Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A7E3FB25C
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Aug 2021 10:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbhH3IWP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Aug 2021 04:22:15 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:41483 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbhH3IWP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Aug 2021 04:22:15 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 17U8Kbif032573;
        Mon, 30 Aug 2021 17:20:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 17U8Kbif032573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630311638;
        bh=LvEHmzb+X2W0U4SCLamG7StPrlQ4w4vUY1BuYtsNmWA=;
        h=From:To:Cc:Subject:Date:From;
        b=KJfxb4mzSIRA+4TrvISz2NYftBjyf2WC58Sihfmcqg57uI3wpyNQTLtvOghhC3ZWy
         cNDhyJBKbWlEi1o9CadFRGcBO9ENzMebcYCRDjR64z9noy9uX2xXw7AVwa4+op9ygn
         v9VCmJqzVzUdMaU4gFsinUcD+Cmt/L4GJYaUv9pbosbCClu/zDUVlyUnikrP/7VwkQ
         1FuWg9749eQcKDZlSpRE4TrXUmw5H6bg590bt1Jgr8+gZxT1YRybK+G3KubrB4fobf
         61OLQO8LYR1k4mRsVVYOPP+iYIkpLyX6TLd0nVVuaGZJacINHyvqvb6PcRo8+SPcIz
         3rvAyOhe96C6w==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <npitre@baylibre.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: redo fake deps at include/ksym/*.h
Date:   Mon, 30 Aug 2021 17:20:33 +0900
Message-Id: <20210830082033.1707588-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 0e0345b77ac4 ("kbuild: redo fake deps at include/config/*.h")
simplified the Kconfig/fixdep interaction a lot.

For CONFIG_FOO_BAR_BAZ, Kconfig now touches include/config/FOO_BAR_BAZ
instead of the previous include/config/foo/bar/baz.h .

This commit simplifies the TRIM_UNUSED_KSYMS feature in a similar way:

  - delete .h suffix
  - delete tolower()
  - put everything in 1 directory

For EXPORT_SYMBOL(FOO_BAR_BAZ), scripts/adjust_autoksyms.sh now touches
include/ksym/FOO_BAR_BAZ instead of include/ksym/foo/bar/baz.h .

This is more precise, avoiding possibly unnecessary rebuilds.

  EXPORT_SYMBOL(FOO_BAR_BAZ)
  EXPORT_SYMBOL(_FOO_BAR_BAZ)
  EXPORT_SYMBOL(__FOO_BAR_BAZ)

were previously mapped to the same header, include/ksym/foo/bar/baz.h
but now are handled separately.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/adjust_autoksyms.sh | 4 ++--
 scripts/gen_ksymdeps.sh     | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index d8f6f9c63043..59fdb875e818 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -42,10 +42,10 @@ $CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
 changed=$(
 count=0
 sort "$cur_ksyms_file" "$new_ksyms_file" | uniq -u |
-sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/" |
+sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' |
 while read sympath; do
 	if [ -z "$sympath" ]; then continue; fi
-	depfile="include/ksym/${sympath}.h"
+	depfile="include/ksym/${sympath}"
 	mkdir -p "$(dirname "$depfile")"
 	touch "$depfile"
 	# Filesystems with coarse time precision may create timestamps
diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
index 725e8c9c1b53..8ee533f33659 100755
--- a/scripts/gen_ksymdeps.sh
+++ b/scripts/gen_ksymdeps.sh
@@ -10,7 +10,7 @@ set -e
 # TODO:
 #   Use -q instead of 2>/dev/null when we upgrade the minimum version of
 #   binutils to 2.37, llvm to 13.0.0.
-ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
+ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p')
 
 if [ -z "$ksyms" ]; then
 	exit 0
@@ -21,8 +21,7 @@ echo "ksymdeps_$1 := \\"
 
 for s in $ksyms
 do
-	echo $s | sed -e 's:^_*:    $(wildcard include/ksym/:' \
-			-e 's:__*:/:g' -e 's/$/.h) \\/'
+	printf '    $(wildcard include/ksym/%s) \\\n' "$s"
 done
 
 echo
-- 
2.30.2

