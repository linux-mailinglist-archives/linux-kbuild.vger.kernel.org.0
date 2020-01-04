Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA5031302DC
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgADPDz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:03:55 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:54707 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgADPDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:54 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 004F2gcc018492;
        Sun, 5 Jan 2020 00:02:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 004F2gcc018492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578150171;
        bh=uOb/kJmsNjx5J7aD9SoFAKQAr0MTxGej4A365YtD1Uk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x5HJJhlR+20cJHrysyYcsww5jJL+9hYCfZECsDAsSgxqlJbGfx/UiiTGFNDhAxVBF
         wjFqFJaKV4+NAtQi6mN5h/sKA8+67gAGl6LpP2ZHN5WAotzsztafbXN8ImstJ6ZtMg
         F2CK0LfsfvDUF9AIuj20jq8HrkAn0f7x1LLmoe94XPcjtxTg41cyi3pQpUus9BUli3
         kn1hEtS/i2eCA297St26aAZwlXCcVTXsvncyfs5ZY2oZwZZZYoJqWhjeX2US1Qp0/5
         bwyn827AYi6lRyHm/gpouz4iq+xdh+tcMr5TvI/bMcvu75Rhso4c5btwlfcrN+y5b4
         aXtQorxl8vm/A==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] initramfs: refactor the initramfs build rules
Date:   Sun,  5 Jan 2020 00:02:37 +0900
Message-Id: <20200104150238.19834-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, usr/gen_initramfs.sh takes care of all the use-cases:

 [1] generates a cpio file unless CONFIG_INITRAMFS_SOURCE points to
     a single cpio archive

 [2] If CONFIG_INITRAMFS_SOURCE is the path to a cpio archive,
     use it as-is.

 [3] Compress the cpio file according to CONFIG_INITRAMFS_COMPRESSION_*
     unless it is passed a compressed archive.

To simplify the script, move [2] and [3] to usr/Makefile.

If CONFIG_INITRAMFS_SOURCE is the path to a cpio archive, there is
no need to run this shell script.

For the cpio archive compression, you can re-use the rules from
scripts/Makefile.lib .

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - improve the comments so that they match to the code
  - use $(strip ...) instead of $(words ...)
    for the case CONFIG_INITRAMFS_SOURCE is empty

 usr/.gitignore       |  8 +---
 usr/Kconfig          | 10 -----
 usr/Makefile         | 89 +++++++++++++++++++++++++++++---------------
 usr/gen_initramfs.sh | 77 ++++++++------------------------------
 usr/initramfs_data.S |  5 +--
 5 files changed, 78 insertions(+), 111 deletions(-)

diff --git a/usr/.gitignore b/usr/.gitignore
index be5eae1df7eb..610de736b75e 100644
--- a/usr/.gitignore
+++ b/usr/.gitignore
@@ -1,9 +1,3 @@
-#
-# Generated files
-#
 gen_init_cpio
 initramfs_data.cpio
-initramfs_data.cpio.gz
-initramfs_data.cpio.bz2
-initramfs_data.cpio.lzma
-initramfs_list
+/initramfs_inc_data
diff --git a/usr/Kconfig b/usr/Kconfig
index ab61e81165e0..529caab1a328 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -207,13 +207,3 @@ config INITRAMFS_COMPRESSION_LZ4
 	  by default which could cause a build failure.
 
 endchoice
-
-config INITRAMFS_COMPRESSION
-	string
-	default ""      if INITRAMFS_COMPRESSION_NONE
-	default ".gz"   if INITRAMFS_COMPRESSION_GZIP
-	default ".bz2"  if INITRAMFS_COMPRESSION_BZIP2
-	default ".lzma" if INITRAMFS_COMPRESSION_LZMA
-	default ".xz"   if INITRAMFS_COMPRESSION_XZ
-	default ".lzo"  if INITRAMFS_COMPRESSION_LZO
-	default ".lz4"  if INITRAMFS_COMPRESSION_LZ4
diff --git a/usr/Makefile b/usr/Makefile
index 9256a5b189ee..e03753888ad4 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -3,55 +3,86 @@
 # kbuild file for usr/ - including initramfs image
 #
 
-suffix_y = $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
-datafile_y = initramfs_data.cpio$(suffix_y)
-datafile_d_y = .$(datafile_y).d
-AFLAGS_initramfs_data.o += -DINITRAMFS_IMAGE="usr/$(datafile_y)"
+# cmd_bzip2, cmd_lzma, cmd_lzo, cmd_lz4 from scripts/Makefile.lib appends the
+# size at the end of the compressed file, which unfortunately does not work
+# with unpack_to_rootfs(). Make size_append no-op.
+override size_append := :
 
-# clean rules do not have CONFIG_INITRAMFS_COMPRESSION.  So clean up after all
-# possible compression formats.
-clean-files += initramfs_data.cpio*
+compress-$(CONFIG_INITRAMFS_COMPRESSION_NONE)	:= shipped
+compress-$(CONFIG_INITRAMFS_COMPRESSION_GZIP)	:= gzip
+compress-$(CONFIG_INITRAMFS_COMPRESSION_BZIP2)	:= bzip2
+compress-$(CONFIG_INITRAMFS_COMPRESSION_LZMA)	:= lzma
+compress-$(CONFIG_INITRAMFS_COMPRESSION_XZ)	:= xzmisc
+compress-$(CONFIG_INITRAMFS_COMPRESSION_LZO)	:= lzo
+compress-$(CONFIG_INITRAMFS_COMPRESSION_LZ4)	:= lz4
 
-# Generate builtin.o based on initramfs_data.o
 obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
 
-# initramfs_data.o contains the compressed initramfs_data.cpio image.
-# The image is included using .incbin, a dependency which is not
-# tracked automatically.
-$(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
+$(obj)/initramfs_data.o: $(obj)/initramfs_inc_data
 
-#####
-# Generate the initramfs cpio archive
+ramfs-input := $(strip $(shell echo $(CONFIG_INITRAMFS_SOURCE)))
+cpio-data :=
+
+# If CONFIG_INITRAMFS_SOURCE is empty, generate a small initramfs with the
+# default contents.
+ifeq ($(ramfs-input),)
+ramfs-input := $(srctree)/$(src)/default_cpio_list
+endif
+
+ifeq ($(words $(ramfs-input)),1)
+
+# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
+# .cpio, use it directly as an initramfs.
+ifneq ($(filter %.cpio,$(ramfs-input)),)
+cpio-data := $(ramfs-input)
+endif
+
+# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
+# .cpio.*, use it directly as an initramfs, and avoid double compression.
+ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
+cpio-data := $(ramfs-input)
+compress-y := shipped
+endif
+
+endif
+
+# For other cases, generate the initramfs cpio archive based on the contents
+# specified by CONFIG_INITRAMFS_SOURCE.
+ifeq ($(cpio-data),)
+
+cpio-data := $(obj)/initramfs_data.cpio
 
 hostprogs-y := gen_init_cpio
-ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
-			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),$(srctree)/$(src)/default_cpio_list)
-ramfs-args  := \
-        $(if $(CONFIG_INITRAMFS_ROOT_UID), -u $(CONFIG_INITRAMFS_ROOT_UID)) \
-        $(if $(CONFIG_INITRAMFS_ROOT_GID), -g $(CONFIG_INITRAMFS_ROOT_GID))
 
-# $(datafile_d_y) is used to identify all files included
+# .initramfs_data.cpio.d is used to identify all files included
 # in initramfs and to detect if any files are added/removed.
 # Removed files are identified by directory timestamp being updated
 # The dependency list is generated by gen_initramfs.sh -l
-ifneq ($(wildcard $(obj)/$(datafile_d_y)),)
-	include $(obj)/$(datafile_d_y)
-endif
-
-quiet_cmd_initfs = GEN     $@
-      cmd_initfs = $< -o $@ -l $(obj)/$(datafile_d_y) $(ramfs-args) $(ramfs-input)
-
-targets := $(datafile_y)
+-include $(obj)/.initramfs_data.cpio.d
 
 # do not try to update files included in initramfs
 $(deps_initramfs): ;
 
+quiet_cmd_initfs = GEN     $@
+      cmd_initfs = \
+	$< -o $@ -l $(obj)/.initramfs_data.cpio.d \
+	$(if $(CONFIG_INITRAMFS_ROOT_UID), -u $(CONFIG_INITRAMFS_ROOT_UID)) \
+	$(if $(CONFIG_INITRAMFS_ROOT_GID), -g $(CONFIG_INITRAMFS_ROOT_GID)) \
+	$(ramfs-input)
+
 # We rebuild initramfs_data.cpio if:
 # 1) Any included file is newer than initramfs_data.cpio
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
-$(obj)/$(datafile_y): $(src)/gen_initramfs.sh $(obj)/gen_init_cpio $(deps_initramfs) FORCE
+$(obj)/initramfs_data.cpio: $(src)/gen_initramfs.sh $(obj)/gen_init_cpio $(deps_initramfs) FORCE
 	$(call if_changed,initfs)
 
+endif
+
+$(obj)/initramfs_inc_data: $(cpio-data) FORCE
+	$(call if_changed,$(compress-y))
+
+targets += initramfs_data.cpio initramfs_inc_data
+
 subdir-$(CONFIG_UAPI_HEADER_TEST) += include
diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 1efb87bda545..4e6715f8ff7f 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -5,7 +5,7 @@
 # Released under the terms of the GNU GPL
 #
 # Generate a cpio packed initramfs. It uses gen_init_cpio to generate
-# the cpio archive, and then compresses it.
+# the cpio archive.
 # This script assumes that gen_init_cpio is located in usr/ directory
 
 # error out on errors
@@ -15,8 +15,7 @@ usage() {
 cat << EOF
 Usage:
 $0 [-o <file>] [-l <dep_list>] [-u <uid>] [-g <gid>] {-d | <cpio_source>} ...
-	-o <file>      Create compressed initramfs file named <file> using
-		       gen_init_cpio and compressor depending on the extension
+	-o <file>      Create initramfs file named <file> by using gen_init_cpio
 	-l <dep_list>  Create dependency list named <dep_list>
 	-u <uid>       User ID to map to user ID 0 (root).
 		       <uid> is only meaningful if <cpio_source> is a
@@ -162,20 +161,12 @@ dir_filelist() {
 	fi
 }
 
-# if only one file is specified and it is .cpio file then use it direct as fs
-# if a directory is specified then add all files in given direcotry to fs
-# if a regular file is specified assume it is in gen_init_cpio format
 input_file() {
 	source="$1"
 	if [ -f "$1" ]; then
+		# If a regular file is specified, assume it is in
+		# gen_init_cpio format
 		header "$1"
-		is_cpio="$(echo "$1" | sed 's/^.*\.cpio\(\..*\)\{0,1\}/cpio/')"
-		if [ $2 -eq 0 -a ${is_cpio} = "cpio" ]; then
-			cpio_file=$1
-			echo "$1" | grep -q '^.*\.cpio\..*' && is_cpio_compressed="compressed"
-			[ -n "$dep_list" ] && echo "$1" >> $dep_list
-			return 0
-		fi
 		print_mtime "$1" >> $cpio_list
 		cat "$1"         >> $cpio_list
 		if [ -n "$dep_list" ]; then
@@ -187,6 +178,7 @@ input_file() {
 			done
 		fi
 	elif [ -d "$1" ]; then
+		# If a directory is specified then add all files in it to fs
 		dir_filelist "$1"
 	else
 		echo "  ${prog}: Cannot open '$1'" >&2
@@ -198,12 +190,8 @@ prog=$0
 root_uid=0
 root_gid=0
 dep_list=
-cpio_file=
 cpio_list=$(mktemp ${TMPDIR:-/tmp}/cpiolist.XXXXXX)
 output="/dev/stdout"
-output_file="/dev/stdout"
-is_cpio_compressed=
-compr="gzip -n -9 -f"
 
 while [ $# -gt 0 ]; do
 	arg="$1"
@@ -214,28 +202,8 @@ while [ $# -gt 0 ]; do
 			echo "deps_initramfs := \\" > $dep_list
 			shift
 			;;
-		"-o")	# generate compressed cpio image named $1
-			output_file="$1"
-			output=$cpio_list
-			echo "$output_file" | grep -q "\.gz$" \
-			&& [ -x "`which gzip 2> /dev/null`" ] \
-			&& compr="gzip -n -9 -f"
-			echo "$output_file" | grep -q "\.bz2$" \
-			&& [ -x "`which bzip2 2> /dev/null`" ] \
-			&& compr="bzip2 -9 -f"
-			echo "$output_file" | grep -q "\.lzma$" \
-			&& [ -x "`which lzma 2> /dev/null`" ] \
-			&& compr="lzma -9 -f"
-			echo "$output_file" | grep -q "\.xz$" \
-			&& [ -x "`which xz 2> /dev/null`" ] \
-			&& compr="xz --check=crc32 --lzma2=dict=1MiB"
-			echo "$output_file" | grep -q "\.lzo$" \
-			&& [ -x "`which lzop 2> /dev/null`" ] \
-			&& compr="lzop -9 -f"
-			echo "$output_file" | grep -q "\.lz4$" \
-			&& [ -x "`which lz4 2> /dev/null`" ] \
-			&& compr="lz4 -l -9 -f"
-			echo "$output_file" | grep -q "\.cpio$" && compr="cat"
+		"-o")	# generate cpio image named $1
+			output="$1"
 			shift
 			;;
 		"-u")	# map $1 to uid=0 (root)
@@ -258,34 +226,21 @@ while [ $# -gt 0 ]; do
 					unknown_option
 					;;
 				*)	# input file/dir - process it
-					input_file "$arg" "$#"
+					input_file "$arg"
 					;;
 			esac
 			;;
 	esac
 done
 
-# If output_file is set we will generate cpio archive and compress it
+# If output_file is set we will generate cpio archive
 # we are careful to delete tmp files
-if [ -z ${cpio_file} ]; then
-	timestamp=
-	if test -n "$KBUILD_BUILD_TIMESTAMP"; then
-		timestamp="$(date -d"$KBUILD_BUILD_TIMESTAMP" +%s || :)"
-		if test -n "$timestamp"; then
-			timestamp="-t $timestamp"
-		fi
+timestamp=
+if test -n "$KBUILD_BUILD_TIMESTAMP"; then
+	timestamp="$(date -d"$KBUILD_BUILD_TIMESTAMP" +%s || :)"
+	if test -n "$timestamp"; then
+		timestamp="-t $timestamp"
 	fi
-	cpio_tfile="$(mktemp ${TMPDIR:-/tmp}/cpiofile.XXXXXX)"
-	usr/gen_init_cpio $timestamp ${cpio_list} > ${cpio_tfile}
-else
-	cpio_tfile=${cpio_file}
-fi
-rm ${cpio_list}
-if [ "${is_cpio_compressed}" = "compressed" ]; then
-	cat ${cpio_tfile} > ${output_file}
-else
-	(cat ${cpio_tfile} | ${compr}  - > ${output_file}) \
-	|| (rm -f ${output_file} ; false)
 fi
-[ -z ${cpio_file} ] && rm ${cpio_tfile}
-exit 0
+usr/gen_init_cpio $timestamp $cpio_list > $output
+rm $cpio_list
diff --git a/usr/initramfs_data.S b/usr/initramfs_data.S
index d07648f05bbf..cd67edc38797 100644
--- a/usr/initramfs_data.S
+++ b/usr/initramfs_data.S
@@ -22,12 +22,9 @@
   in the ELF header, as required by certain architectures.
 */
 
-#include <linux/stringify.h>
-#include <asm-generic/vmlinux.lds.h>
-
 .section .init.ramfs,"a"
 __irf_start:
-.incbin __stringify(INITRAMFS_IMAGE)
+.incbin "usr/initramfs_inc_data"
 __irf_end:
 .section .init.ramfs.info,"a"
 .globl __initramfs_size
-- 
2.17.1

