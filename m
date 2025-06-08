Return-Path: <linux-kbuild+bounces-7399-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398FAD137E
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 19:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F5A43A80D8
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 17:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0328A18CC1C;
	Sun,  8 Jun 2025 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDkDfv3w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD36818786A;
	Sun,  8 Jun 2025 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749402472; cv=none; b=MVPGhm4pnAh1LWnuFitO5He499aO5UgW+5kOlpuBALxwnP9RY1FhcGrnHNYj5+BbNKwJrAzSSHN7TDHLoPhhGw3nB5k8sEWAiHTAsIgV97ItcHp+b+/xvFCgACTopxpeE6VHrGL2PnADswx+VvJlCApl9vHUoAnrmCTt34je3uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749402472; c=relaxed/simple;
	bh=M5lbAQD+3t/dvGeFh0k07xz23ulsbUK5mMp8gEEaZ64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNb1BQYNEXObKeyPLVgjY/4Wxm3zBl5/LsPpiZVW/K4SNSid/ecQcxG4k0CX7/QmVUkont5F9ZVYIxMOIDqo/OZoZJJ4o8S3MwdSOmp8clUtUsGtar0E6S4kTpsFqe06BgJigEZQNDLDUAQTi2fb8gEyF12OhzpFKX/WXnyRWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDkDfv3w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713C3C4CEEE;
	Sun,  8 Jun 2025 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749402472;
	bh=M5lbAQD+3t/dvGeFh0k07xz23ulsbUK5mMp8gEEaZ64=;
	h=From:To:Cc:Subject:Date:From;
	b=LDkDfv3w5BE5NnTrrNWth/bIiPxDfUYCsLn8uu2GdTnU1q7GZLIFxHYIRp8nfGkrM
	 iij2QkIBinTD79EUBObQoL7bN7BvtO4gREqMe2zqwIEJJhXHU3FnCAJh/gD05sd6oc
	 KgThwJ1yOVQTB23Y/UY1cwz/1HzdIrrL3I+firfDHiRT1GAvHwJWnXy1t3HXbg5bD5
	 YWr7fSZjXJ4f9Nla5ogrpoXMkBCT2vfkFwBiqAsNk1VwPOEYc/4+A91U4JKoqrsghU
	 R00RwRZfWXPTGNmFxrvfqptSTp32PzjW4i0EXYRSLX05uTsX4Gi+Tiby9kg5anweR4
	 qePzcrHMnYPlw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kheaders: rebuild kheaders_data.tar.xz when a file is modified within a minute
Date: Mon,  9 Jun 2025 01:59:55 +0900
Message-ID: <20250608170746.3480391-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a header file is changed, kernel/gen_kheaders.sh may fail to update
kernel/kheaders_data.tar.xz.

[steps to reproduce]

[1] Build kernel/kheaders_data.tar.xz

  $ make -j$(nproc) kernel/kheaders.o
    DESCEND objtool
    INSTALL libsubcmd_headers
    CALL    scripts/checksyscalls.sh
    CHK     kernel/kheaders_data.tar.xz
    GEN     kernel/kheaders_data.tar.xz
    CC      kernel/kheaders.o

[2] Modify a header without changing the file size

  $ sed -i s/0xdeadbeef/0xfeedbeef/ include/linux/elfnote.h

[3] Rebuild kernel/kheaders_data.tar.xz

  $ make -j$(nproc) kernel/kheaders.o
    DESCEND objtool
    INSTALL libsubcmd_headers
    CALL    scripts/checksyscalls.sh
    CHK     kernel/kheaders_data.tar.xz

kernel/kheaders_data.tar.xz is not updated if steps [1] - [3] are run
within the same minute.

The headers_md5 variable stores the MD5 hash of the 'ls -l' output
for all header files. This hash value is used to determine whether
kheaders_data.tar.xz needs to be rebuilt. However, 'ls -l' prints the
modification times with minute-level granularity. If a file is modified
within the same minute and its size remains the same, the MD5 hash does
not change.

To reliably detect file modifications, this commit rewrites
kernel/gen_kheaders.sh to output header dependencies to
kernel/.kheaders_data.tar.xz.cmd. Then, Make compares the timestamps
and reruns kernel/gen_kheaders.sh when necessary. This is the standard
mechanism used by Make and Kbuild.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/.gitignore      |  2 +
 kernel/Makefile        | 47 +++++++++++++++++++---
 kernel/gen_kheaders.sh | 88 +++++++++---------------------------------
 3 files changed, 63 insertions(+), 74 deletions(-)

diff --git a/kernel/.gitignore b/kernel/.gitignore
index c6b299a6b786..a501bfc80694 100644
--- a/kernel/.gitignore
+++ b/kernel/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /config_data
 /kheaders.md5
+/kheaders-objlist
+/kheaders-srclist
diff --git a/kernel/Makefile b/kernel/Makefile
index 32e80dd626af..9a9ff405ea89 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -158,11 +158,48 @@ filechk_cat = cat $<
 $(obj)/config_data: $(KCONFIG_CONFIG) FORCE
 	$(call filechk,cat)
 
+# kheaders_data.tar.xz
 $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
 
-quiet_cmd_genikh = CHK     $(obj)/kheaders_data.tar.xz
-      cmd_genikh = $(CONFIG_SHELL) $(srctree)/kernel/gen_kheaders.sh $@
-$(obj)/kheaders_data.tar.xz: FORCE
-	$(call cmd,genikh)
+quiet_cmd_kheaders_data = GEN     $@
+      cmd_kheaders_data = "$<" "$@" "$(obj)/kheaders-srclist" "$(obj)/kheaders-objlist"
+      cmd_kheaders_data_dep = cat $(depfile) >> $(dot-target).cmd; rm -f $(depfile)
 
-clean-files := kheaders_data.tar.xz kheaders.md5
+define rule_kheaders_data
+	$(call cmd_and_savecmd,kheaders_data)
+	$(call cmd,kheaders_data_dep)
+endef
+
+targets += kheaders_data.tar.xz
+$(obj)/kheaders_data.tar.xz: $(src)/gen_kheaders.sh $(obj)/kheaders-srclist $(obj)/kheaders-objlist $(obj)/kheaders.md5 FORCE
+	$(call if_changed_rule,kheaders_data)
+
+# generated headers in objtree
+#
+# include/generated/utsversion.h is ignored because it is generated
+# after gen_kheaders.sh is executed. (utsversion.h is unneeded for kheaders)
+filechk_kheaders_objlist = \
+	for d in include "arch/$(SRCARCH)/include"; do \
+		find "$${d}/generated" ! -path "include/generated/utsversion.h" -a -name "*.h" -print; \
+	done
+
+$(obj)/kheaders-objlist: FORCE
+	$(call filechk,kheaders_objlist)
+
+# non-generated headers in srctree
+filechk_kheaders_srclist = \
+	for d in include "arch/$(SRCARCH)/include"; do \
+		find "$(srctree)/$${d}" -path "$(srctree)/$${d}/generated" -prune -o -name "*.h" -print; \
+	done
+
+$(obj)/kheaders-srclist: FORCE
+	$(call filechk,kheaders_srclist)
+
+# Some files are symlinks. If symlinks are changed, kheaders_data.tar.xz should
+# be rebuilt.
+filechk_kheaders_md5sum = xargs -r -a $< stat -c %N | md5sum
+
+$(obj)/kheaders.md5: $(obj)/kheaders-srclist FORCE
+	$(call filechk,kheaders_md5sum)
+
+clean-files := kheaders.md5 kheaders-srclist kheaders-objlist
diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index c9e5dc068e85..0ff7beabb21a 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -4,79 +4,33 @@
 # This script generates an archive consisting of kernel headers
 # for CONFIG_IKHEADERS.
 set -e
-sfile="$(readlink -f "$0")"
-outdir="$(pwd)"
 tarfile=$1
-tmpdir=$outdir/${tarfile%/*}/.tmp_dir
+srclist=$2
+objlist=$3
 
-dir_list="
-include/
-arch/$SRCARCH/include/
-"
+dir=$(dirname "${tarfile}")
+tmpdir=${dir}/.tmp_dir
+depfile=${dir}/.$(basename "${tarfile}").d
 
-# Support incremental builds by skipping archive generation
-# if timestamps of files being archived are not changed.
+# generate dependency list.
+{
+	echo
+	echo "deps_${tarfile} := \\"
+	sed 's:\(.*\):  \1 \\:' "${srclist}"
+	sed -n '/^include\/generated\/autoconf\.h$/!s:\(.*\):  \1 \\:p' "${objlist}"
+	echo
+	echo "${tarfile}: \$(deps_${tarfile})"
+	echo
+	echo "\$(deps_${tarfile}):"
 
-# This block is useful for debugging the incremental builds.
-# Uncomment it for debugging.
-# if [ ! -f /tmp/iter ]; then iter=1; echo 1 > /tmp/iter;
-# else iter=$(($(cat /tmp/iter) + 1)); echo $iter > /tmp/iter; fi
-# find $all_dirs -name "*.h" | xargs ls -l > /tmp/ls-$iter
-
-all_dirs=
-if [ "$building_out_of_srctree" ]; then
-	for d in $dir_list; do
-		all_dirs="$all_dirs $srctree/$d"
-	done
-fi
-all_dirs="$all_dirs $dir_list"
-
-# include/generated/utsversion.h is ignored because it is generated after this
-# script is executed. (utsversion.h is unneeded for kheaders)
-#
-# When Kconfig regenerates include/generated/autoconf.h, its timestamp is
-# updated, but the contents might be still the same. When any CONFIG option is
-# changed, Kconfig touches the corresponding timestamp file include/config/*.
-# Hence, the md5sum detects the configuration change anyway. We do not need to
-# check include/generated/autoconf.h explicitly.
-#
-# Ignore them for md5 calculation to avoid pointless regeneration.
-headers_md5="$(find $all_dirs -name "*.h" -a			\
-		! -path include/generated/utsversion.h -a	\
-		! -path include/generated/autoconf.h		|
-		xargs ls -l | md5sum | cut -d ' ' -f1)"
-
-# Any changes to this script will also cause a rebuild of the archive.
-this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
-if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
-if [ -f kernel/kheaders.md5 ] &&
-	[ "$(head -n 1 kernel/kheaders.md5)" = "$headers_md5" ] &&
-	[ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
-	[ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
-		exit
-fi
-
-echo "  GEN     $tarfile"
+} > "${depfile}"
 
 rm -rf "${tmpdir}"
 mkdir "${tmpdir}"
 
-if [ "$building_out_of_srctree" ]; then
-	(
-		cd $srctree
-		for f in $dir_list
-			do find "$f" -name "*.h";
-		done | tar -c -f - -T - | tar -xf - -C "${tmpdir}"
-	)
-fi
-
-for f in $dir_list;
-	do find "$f" -name "*.h";
-done | tar -c -f - -T - | tar -xf - -C "${tmpdir}"
-
-# Always exclude include/generated/utsversion.h
-# Otherwise, the contents of the tarball may vary depending on the build steps.
-rm -f "${tmpdir}/include/generated/utsversion.h"
+# shellcheck disable=SC2154 # srctree is passed as an env variable
+sed "s:^${srctree}/::" "${srclist}" | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${tmpdir}"
+tar -c -f - -T "${objlist}" | tar -xf - -C "${tmpdir}"
 
 # Remove comments except SDPX lines
 # Use a temporary file to store directory contents to prevent find/xargs from
@@ -92,8 +46,4 @@ tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
     --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
     -I $XZ -cf $tarfile -C "${tmpdir}/" . > /dev/null
 
-echo $headers_md5 > kernel/kheaders.md5
-echo "$this_file_md5" >> kernel/kheaders.md5
-echo "$(md5sum $tarfile | cut -d ' ' -f1)" >> kernel/kheaders.md5
-
 rm -rf "${tmpdir}"
-- 
2.43.0


