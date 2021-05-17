Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4E43824FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 09:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbhEQHFR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 May 2021 03:05:17 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:58925 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbhEQHFR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 May 2021 03:05:17 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14H73Glv004781;
        Mon, 17 May 2021 16:03:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14H73Glv004781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621234998;
        bh=kVXI+j2T0ByDB3o0Pug8Ic19gAdY1qUzgPdDVuQL27o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ji0UEwNu7FZQdOWrisQour1iw+HTrVTyte1PUanvpHmhGlS7UDYsBo3pfOHnCsz8c
         Agzea5lRsqBX9F7UfBbf8AeBMMTWvyvgGML/+LkbfGcMLCHonH/eLYKxuMFtIa4ayC
         YrqXuB4dan4VQn4dgGBnYD9K871LHkVsFCSL1UIp4d58NhWES4mXjpYKzRaOr63CU7
         TKidIUQ+3KxyPOkKzxtHrsr4XM/AqC+e9FLJnuzy3NlmHaiavWEDHMDI8uQs/NoeDM
         vzFOfTzUE6XoSRd7yH7n1eMUkk9eY6mANCHr215mkppSa/SpyGRlo70AluWQG3yfA6
         lLfDS9A50xRsQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] kbuild: clean up ${quiet} checks in shell scripts
Date:   Mon, 17 May 2021 16:03:14 +0900
Message-Id: <20210517070314.1428091-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210517070314.1428091-1-masahiroy@kernel.org>
References: <20210517070314.1428091-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There were efforts to make 'make -s' really silent when it is a
warning-free build.

The conventional way was to let scripts check ${quiet}, and if it
is 'silent_', suppress the output by their own.

With the previous commit, the 'cmd' takes care of it now. The 'cmd' is
also invoked from if_changed, if_changed_dep, and if_changed_rule.

You can omit ${quiet} checks in shell scripts when they are invoked
from the 'cmd' macro.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/gen_kheaders.sh  | 4 +---
 scripts/link-vmlinux.sh | 4 +---
 scripts/mkcompile_h     | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 34a1dc2abc7d..1966a749e0d9 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -56,9 +56,7 @@ if [ -f kernel/kheaders.md5 ] &&
 		exit
 fi
 
-if [ "${quiet}" != "silent_" ]; then
-       echo "  GEN     $tarfile"
-fi
+echo "  GEN     $tarfile"
 
 rm -rf $cpio_dir
 mkdir $cpio_dir
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f4de4c97015b..3b342b0b0b38 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -38,9 +38,7 @@ LDFLAGS_vmlinux="$3"
 # Will be supressed by "make -s"
 info()
 {
-	if [ "${quiet}" != "silent_" ]; then
-		printf "  %-7s %s\n" "${1}" "${2}"
-	fi
+	printf "  %-7s %s\n" "${1}" "${2}"
 }
 
 # Generate a linker script to ensure correct ordering of initcalls.
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 4ae735039daf..06bbf4c2c66c 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -9,8 +9,6 @@ PREEMPT_RT=$5
 CC_VERSION="$6"
 LD=$7
 
-vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
-
 # Do not expand names
 set -f
 
@@ -82,7 +80,7 @@ if [ -r $TARGET ] && \
       cmp -s .tmpver.1 .tmpver.2; then
    rm -f .tmpcompile
 else
-   vecho "  UPD     $TARGET"
+   echo "  UPD     $TARGET"
    mv -f .tmpcompile $TARGET
 fi
 rm -f .tmpver.1 .tmpver.2
-- 
2.27.0

