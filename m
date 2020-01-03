Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA77012FBFC
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 19:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgACSAi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 13:00:38 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:16475 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgACSAi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 13:00:38 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 003HxSJ9022724;
        Sat, 4 Jan 2020 02:59:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 003HxSJ9022724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578074373;
        bh=MBmHV2xb8S5ncyo4FHxT28EH/0BPBlVbQ3cUU9l9rsY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PPpXtuA9FFiHxw8mGhI9/Z6mjyyatPIma8H2WPyfAd3BFQp+XR0M/t9jzLyHpGIZB
         9eemzq3j28MWOUQWvyc1HVAU568Xs9BRWS++gQ6Ep5/jgv8bXu9cO27QWzQAcCcChm
         FfS6dMJxwWk6pK1XBaDg57ichgwTUYWT/2V7EwZCUPeW4PyoPQ9+zMe+U2MYYznWZt
         ACaKWG7cu9aJET8SMXamSVobLJJ7ekBDf3maYGLAkL3WrYQGW/VblEyUHIQK9r3Ejd
         Cnj5Hl3TRP5LxTiloV7Bag/y/lT/uI7VJAoTiNjuf8gQ3TPRay4Bw94ZvzefuqEqvb
         vGomppjyhEsOg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] initramfs: generate dependency list and cpio at the same time
Date:   Sat,  4 Jan 2020 02:59:11 +0900
Message-Id: <20200103175915.26663-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, this script is run twice, for the dependency list, and then
for the cpio archive.

The first one is re-run every time although its build log is suppressed
so nobody notices it.

Make it work more efficiently by generating the cpio and the dependency
list at the same time.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/Makefile         |   3 +-
 usr/gen_initramfs.sh | 108 ++++++++++++++++++-------------------------
 2 files changed, 47 insertions(+), 64 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index 7df6559f0f30..3ae8b45bfc61 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -39,7 +39,7 @@ ifneq ($(wildcard $(obj)/$(datafile_d_y)),)
 endif
 
 quiet_cmd_initfs = GEN     $@
-      cmd_initfs = $< -o $@ $(ramfs-args) $(ramfs-input)
+      cmd_initfs = $< -o $@ -l $(obj)/$(datafile_d_y) $(ramfs-args) $(ramfs-input)
 
 targets := $(datafile_y)
 
@@ -52,7 +52,6 @@ $(deps_initramfs): ;
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
 $(obj)/$(datafile_y): $(src)/gen_initramfs.sh $(obj)/gen_init_cpio $(deps_initramfs) FORCE
-	$(Q)$< -l $(ramfs-input) > $(obj)/$(datafile_d_y)
 	$(call if_changed,initfs)
 
 subdir-$(CONFIG_UAPI_HEADER_TEST) += include
diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 68b6ddfd5f96..49a4e22147b5 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -15,9 +15,10 @@ set -e
 usage() {
 cat << EOF
 Usage:
-$0 [-o <file>] [-u <uid>] [-g <gid>] {-d | <cpio_source>} ...
+$0 [-o <file>] [-l <dep_list>] [-u <uid>] [-g <gid>] {-d | <cpio_source>} ...
 	-o <file>      Create compressed initramfs file named <file> using
 		       gen_init_cpio and compressor depending on the extension
+	-l <dep_list>  Create dependency list named <dep_list>
 	-u <uid>       User ID to map to user ID 0 (root).
 		       <uid> is only meaningful if <cpio_source> is a
 		       directory.  "squash" forces all files to uid 0.
@@ -42,11 +43,6 @@ field() {
 	shift $1 ; echo $1
 }
 
-list_default_initramfs() {
-	# echo usr/kinit/kinit
-	:
-}
-
 default_initramfs() {
 	cat <<-EOF >> ${output}
 		# This is a very simple, default initramfs
@@ -81,10 +77,6 @@ filetype() {
 	return 0
 }
 
-list_print_mtime() {
-	:
-}
-
 print_mtime() {
 	local my_mtime="0"
 
@@ -97,10 +89,10 @@ print_mtime() {
 }
 
 list_parse() {
-	if [ -L "$1" ]; then
+	if [ -z "$dep_list" -o -L "$1" ]; then
 		return
 	fi
-	echo "$1" | sed 's/:/\\:/g; s/$/ \\/'
+	echo "$1" | sed 's/:/\\:/g; s/$/ \\/' >> $dep_list
 }
 
 # for each file print a line in following format
@@ -161,28 +153,25 @@ unknown_option() {
 	exit 1
 }
 
-list_header() {
-	:
-}
-
 header() {
 	printf "\n#####################\n# $1\n" >> ${output}
 }
 
 # process one directory (incl sub-directories)
 dir_filelist() {
-	${dep_list}header "$1"
+	header "$1"
 
 	srcdir=$(echo "$1" | sed -e 's://*:/:g')
 	dirlist=$(find "${srcdir}" -printf "%p %m %U %G\n" | LANG=C sort)
 
 	# If $dirlist is only one line, then the directory is empty
 	if [  "$(echo "${dirlist}" | wc -l)" -gt 1 ]; then
-		${dep_list}print_mtime "$1"
+		print_mtime "$1"
 
 		echo "${dirlist}" | \
 		while read x; do
-			${dep_list}parse ${x}
+			list_parse $x
+			parse $x
 		done
 	fi
 }
@@ -193,22 +182,21 @@ dir_filelist() {
 input_file() {
 	source="$1"
 	if [ -f "$1" ]; then
-		${dep_list}header "$1"
+		header "$1"
 		is_cpio="$(echo "$1" | sed 's/^.*\.cpio\(\..*\)\{0,1\}/cpio/')"
 		if [ $2 -eq 0 -a ${is_cpio} = "cpio" ]; then
 			cpio_file=$1
 			echo "$1" | grep -q '^.*\.cpio\..*' && is_cpio_compressed="compressed"
-			[ ! -z ${dep_list} ] && echo "$1"
+			[ -n "$dep_list" ] && echo "$1" >> $dep_list
 			return 0
 		fi
-		if [ -z ${dep_list} ]; then
-			print_mtime "$1" >> ${output}
-			cat "$1"         >> ${output}
-		else
-		        echo "$1 \\"
+		print_mtime "$1" >> ${output}
+		cat "$1"         >> ${output}
+		if [ -n "$dep_list" ]; then
+		        echo "$1 \\"  >> $dep_list
 			cat "$1" | while read type dir file perm ; do
 				if [ "$type" = "file" ]; then
-					echo "$file \\";
+					echo "$file \\" >> $dep_list
 				fi
 			done
 		fi
@@ -231,44 +219,40 @@ output_file=""
 is_cpio_compressed=
 compr="gzip -n -9 -f"
 
-arg="$1"
-case "$arg" in
-	"-l")	# files included in initramfs - used by kbuild
-		dep_list="list_"
-		echo "deps_initramfs := \\"
-		shift
-		;;
-	"-o")	# generate compressed cpio image named $1
-		shift
-		output_file="$1"
-		cpio_list="$(mktemp ${TMPDIR:-/tmp}/cpiolist.XXXXXX)"
-		output=${cpio_list}
-		echo "$output_file" | grep -q "\.gz$" \
-                && [ -x "`which gzip 2> /dev/null`" ] \
-                && compr="gzip -n -9 -f"
-		echo "$output_file" | grep -q "\.bz2$" \
-                && [ -x "`which bzip2 2> /dev/null`" ] \
-                && compr="bzip2 -9 -f"
-		echo "$output_file" | grep -q "\.lzma$" \
-                && [ -x "`which lzma 2> /dev/null`" ] \
-                && compr="lzma -9 -f"
-		echo "$output_file" | grep -q "\.xz$" \
-                && [ -x "`which xz 2> /dev/null`" ] \
-                && compr="xz --check=crc32 --lzma2=dict=1MiB"
-		echo "$output_file" | grep -q "\.lzo$" \
-                && [ -x "`which lzop 2> /dev/null`" ] \
-                && compr="lzop -9 -f"
-		echo "$output_file" | grep -q "\.lz4$" \
-                && [ -x "`which lz4 2> /dev/null`" ] \
-                && compr="lz4 -l -9 -f"
-		echo "$output_file" | grep -q "\.cpio$" && compr="cat"
-		shift
-		;;
-esac
 while [ $# -gt 0 ]; do
 	arg="$1"
 	shift
 	case "$arg" in
+		"-l")	# files included in initramfs - used by kbuild
+			dep_list="$1"
+			echo "deps_initramfs := \\" > $dep_list
+			shift
+			;;
+		"-o")	# generate compressed cpio image named $1
+			output_file="$1"
+			cpio_list="$(mktemp ${TMPDIR:-/tmp}/cpiolist.XXXXXX)"
+			output=${cpio_list}
+			echo "$output_file" | grep -q "\.gz$" \
+			&& [ -x "`which gzip 2> /dev/null`" ] \
+			&& compr="gzip -n -9 -f"
+			echo "$output_file" | grep -q "\.bz2$" \
+			&& [ -x "`which bzip2 2> /dev/null`" ] \
+			&& compr="bzip2 -9 -f"
+			echo "$output_file" | grep -q "\.lzma$" \
+			&& [ -x "`which lzma 2> /dev/null`" ] \
+			&& compr="lzma -9 -f"
+			echo "$output_file" | grep -q "\.xz$" \
+			&& [ -x "`which xz 2> /dev/null`" ] \
+			&& compr="xz --check=crc32 --lzma2=dict=1MiB"
+			echo "$output_file" | grep -q "\.lzo$" \
+			&& [ -x "`which lzop 2> /dev/null`" ] \
+			&& compr="lzop -9 -f"
+			echo "$output_file" | grep -q "\.lz4$" \
+			&& [ -x "`which lz4 2> /dev/null`" ] \
+			&& compr="lz4 -l -9 -f"
+			echo "$output_file" | grep -q "\.cpio$" && compr="cat"
+			shift
+			;;
 		"-u")	# map $1 to uid=0 (root)
 			root_uid="$1"
 			[ "$root_uid" = "-1" ] && root_uid=$(id -u || echo 0)
@@ -280,7 +264,7 @@ while [ $# -gt 0 ]; do
 			shift
 			;;
 		"-d")	# display default initramfs list
-			${dep_list}default_initramfs
+			default_initramfs
 			;;
 		"-h")
 			usage
-- 
2.17.1

