Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6E65B286
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2019 03:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfGABAQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Jun 2019 21:00:16 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:60031 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfGABAP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Jun 2019 21:00:15 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x610x4fx000634;
        Mon, 1 Jul 2019 09:59:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x610x4fx000634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561942751;
        bh=+UpIu10WCEZP6+HNL9px3zwBEqpAxSsMePRRBKj3x4o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nki3gYfhvgkiXFwtL93SL+mwz10BSbkHJh9srmQUWGFUs3hKu+t5Q+dToCV/smjlE
         QvgrZuo5HqN4B5WFWSSIQGBgYPRDsO0dfWdAHrbYAO8qC9lz2U1GfzhVfQSq+Vh5oz
         hlUMFO0543qoGvAQcojYv/tbgFOtNbiFkDB/H2NlMBCSYvZKj1j/HzxIXGqPs2T8Sn
         T0mmsPNHPq0Byd5rN9VT5mdqh1FJbmxjM3qlGBHlQwn7FpQXFI7STuPiFAgdQrA4kT
         UBk/0HMAPGtcnLe9iTFZ5rENISHkbc6uM+mhmLXMxtfLt4N+QivaJNMvs3KI8SPaSF
         EQJsEcpBFtpNA==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] kheaders: include only headers into kheaders_data.tar.xz
Date:   Mon,  1 Jul 2019 09:58:44 +0900
Message-Id: <20190701005845.12475-7-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701005845.12475-1-yamada.masahiro@socionext.com>
References: <20190701005845.12475-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, kheaders_data.tar.xz contains some build scripts as well as
headers. None of them is needed in the header archive.

For ARCH=x86, this commit excludes the following from the archive:

  arch/x86/include/asm/Kbuild
  arch/x86/include/uapi/asm/Kbuild
  include/asm-generic/Kbuild
  include/config/auto.conf
  include/config/kernel.release
  include/config/tristate.conf
  include/uapi/asm-generic/Kbuild
  include/uapi/Kbuild
  kernel/gen_kheaders.sh

This change is actually motivated for the planned header compile-testing
because it will generate more build artifacts, which should not be
included in the archive.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
  - New patch

Changes in v3: None
Changes in v2: None

 kernel/gen_kheaders.sh | 47 ++++++++++++++----------------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 86a666f5cb17..9ff449888d9c 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -4,24 +4,12 @@
 # This script generates an archive consisting of kernel headers
 # for CONFIG_IKHEADERS.
 set -e
-spath="$(dirname "$(readlink -f "$0")")"
-kroot="$spath/.."
+sfile="$(readlink -f "$0")"
 outdir="$(pwd)"
 tarfile=$1
 cpio_dir=$outdir/$tarfile.tmp
 
-# Script filename relative to the kernel source root
-# We add it to the archive because it is small and any changes
-# to this script will also cause a rebuild of the archive.
-sfile="$(realpath --relative-to $kroot "$(readlink -f "$0")")"
-
-src_file_list="
-include/
-arch/$SRCARCH/include/
-$sfile
-"
-
-obj_file_list="
+dir_list="
 include/
 arch/$SRCARCH/include/
 "
@@ -33,33 +21,29 @@ arch/$SRCARCH/include/
 # Uncomment it for debugging.
 # if [ ! -f /tmp/iter ]; then iter=1; echo 1 > /tmp/iter;
 # else iter=$(($(cat /tmp/iter) + 1)); echo $iter > /tmp/iter; fi
-# find $src_file_list -type f | xargs ls -l > /tmp/src-ls-$iter
-# find $obj_file_list -type f | xargs ls -l > /tmp/obj-ls-$iter
+# find $src_file_list -name "*.h" | xargs ls -l > /tmp/src-ls-$iter
+# find $obj_file_list -name "*.h" | xargs ls -l > /tmp/obj-ls-$iter
 
 # include/generated/compile.h is ignored because it is touched even when none
 # of the source files changed. This causes pointless regeneration, so let us
 # ignore them for md5 calculation.
-pushd $kroot > /dev/null
-src_files_md5="$(find $src_file_list -type f                       |
+pushd $srctree > /dev/null
+src_files_md5="$(find $dir_list -name "*.h"			   |
 		grep -v "include/generated/compile.h"		   |
 		grep -v "include/generated/autoconf.h"		   |
-		grep -v "include/config/auto.conf"		   |
-		grep -v "include/config/auto.conf.cmd"		   |
-		grep -v "include/config/tristate.conf"		   |
 		xargs ls -l | md5sum | cut -d ' ' -f1)"
 popd > /dev/null
-obj_files_md5="$(find $obj_file_list -type f                       |
+obj_files_md5="$(find $dir_list -name "*.h"			   |
 		grep -v "include/generated/compile.h"		   |
 		grep -v "include/generated/autoconf.h"		   |
-		grep -v "include/config/auto.conf"                 |
-		grep -v "include/config/auto.conf.cmd"		   |
-		grep -v "include/config/tristate.conf"		   |
 		xargs ls -l | md5sum | cut -d ' ' -f1)"
-
+# Any changes to this script will also cause a rebuild of the archive.
+this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
 if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
 if [ -f kernel/kheaders.md5 ] &&
 	[ "$(cat kernel/kheaders.md5|head -1)" == "$src_files_md5" ] &&
 	[ "$(cat kernel/kheaders.md5|head -2|tail -1)" == "$obj_files_md5" ] &&
+	[ "$(cat kernel/kheaders.md5|head -3|tail -1)" == "$this_file_md5" ] &&
 	[ "$(cat kernel/kheaders.md5|tail -1)" == "$tarfile_md5" ]; then
 		exit
 fi
@@ -71,16 +55,16 @@ fi
 rm -rf $cpio_dir
 mkdir $cpio_dir
 
-pushd $kroot > /dev/null
-for f in $src_file_list;
-	do find "$f" ! -name "*.cmd" ! -name ".*";
+pushd $srctree > /dev/null
+for f in $dir_list;
+	do find "$f" -name "*.h";
 done | cpio --quiet -pd $cpio_dir
 popd > /dev/null
 
 # The second CPIO can complain if files already exist which can
 # happen with out of tree builds. Just silence CPIO for now.
-for f in $obj_file_list;
-	do find "$f" ! -name "*.cmd" ! -name ".*";
+for f in $dir_list;
+	do find "$f" -name "*.h";
 done | cpio --quiet -pd $cpio_dir >/dev/null 2>&1
 
 # Remove comments except SDPX lines
@@ -91,6 +75,7 @@ tar -Jcf $tarfile -C $cpio_dir/ . > /dev/null
 
 echo "$src_files_md5" >  kernel/kheaders.md5
 echo "$obj_files_md5" >> kernel/kheaders.md5
+echo "$this_file_md5" >> kernel/kheaders.md5
 echo "$(md5sum $tarfile | cut -d ' ' -f1)" >> kernel/kheaders.md5
 
 rm -rf $cpio_dir
-- 
2.17.1

