Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B00A12FBED
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 19:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgACR7n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 12:59:43 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:64707 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728223AbgACR7k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:40 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 003HxSJB022724;
        Sat, 4 Jan 2020 02:59:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 003HxSJB022724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578074374;
        bh=IixOZfomVhBc53dTdWlB8Lij+8LbaLBdC9mPIGrpvkM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0gVEWqJ5DZXHLuErJd43XABaQ/TvJCjwjAmVRPl1WWoWODwGI/aZKM1hY7gQ/cNHv
         NF+UGMjSn8IJRQFHpZp+PnRYC0wUvKOOGTmVlbubFZPs7RYqi0wzwgqmEXo8klzz1o
         a3YO5J1cul0dONVb3IZEnjm7bLVI0YSYru0HBzTQWHNBfnvxUO22XtubxwWVLAiDKd
         o76OnNQrfBTsQ199SJsrPBvT8h/kTxIgGe7sVqR95n3PO4pjVLQhRvf6X5jwcfn5ja
         5G21J5gIDk/i8Kd0N4QiX5CVfGMfbVvx/DEi2ioXMGXNdC+QiCO6ZfQ71G4tOx5nPp
         zwn/YhrTlNqFg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] gen_initramfs.sh: always output cpio even without -o option
Date:   Sat,  4 Jan 2020 02:59:13 +0900
Message-Id: <20200103175915.26663-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, this script outputs a cpio file when -o option is
given, but otherwise a text file in the format recognized by
gen_init_cpio.

This behavior is unclear. Make it always output a cpio file.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/gen_initramfs.sh | 58 +++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index e6808a8c3b2b..1efb87bda545 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -6,7 +6,6 @@
 #
 # Generate a cpio packed initramfs. It uses gen_init_cpio to generate
 # the cpio archive, and then compresses it.
-# The script may also be used to generate the inputfile used for gen_init_cpio
 # This script assumes that gen_init_cpio is located in usr/ directory
 
 # error out on errors
@@ -71,8 +70,8 @@ print_mtime() {
 		my_mtime=$(find "$1" -printf "%T@\n" | sort -r | head -n 1)
 	fi
 
-	echo "# Last modified: ${my_mtime}" >> ${output}
-	echo "" >> ${output}
+	echo "# Last modified: ${my_mtime}" >> $cpio_list
+	echo "" >> $cpio_list
 }
 
 list_parse() {
@@ -125,7 +124,7 @@ parse() {
 			;;
 	esac
 
-	echo "${str}" >> ${output}
+	echo "${str}" >> $cpio_list
 
 	return 0
 }
@@ -141,7 +140,7 @@ unknown_option() {
 }
 
 header() {
-	printf "\n#####################\n# $1\n" >> ${output}
+	printf "\n#####################\n# $1\n" >> $cpio_list
 }
 
 # process one directory (incl sub-directories)
@@ -177,8 +176,8 @@ input_file() {
 			[ -n "$dep_list" ] && echo "$1" >> $dep_list
 			return 0
 		fi
-		print_mtime "$1" >> ${output}
-		cat "$1"         >> ${output}
+		print_mtime "$1" >> $cpio_list
+		cat "$1"         >> $cpio_list
 		if [ -n "$dep_list" ]; then
 		        echo "$1 \\"  >> $dep_list
 			cat "$1" | while read type dir file perm ; do
@@ -200,9 +199,9 @@ root_uid=0
 root_gid=0
 dep_list=
 cpio_file=
-cpio_list=
+cpio_list=$(mktemp ${TMPDIR:-/tmp}/cpiolist.XXXXXX)
 output="/dev/stdout"
-output_file=""
+output_file="/dev/stdout"
 is_cpio_compressed=
 compr="gzip -n -9 -f"
 
@@ -217,8 +216,7 @@ while [ $# -gt 0 ]; do
 			;;
 		"-o")	# generate compressed cpio image named $1
 			output_file="$1"
-			cpio_list="$(mktemp ${TMPDIR:-/tmp}/cpiolist.XXXXXX)"
-			output=${cpio_list}
+			output=$cpio_list
 			echo "$output_file" | grep -q "\.gz$" \
 			&& [ -x "`which gzip 2> /dev/null`" ] \
 			&& compr="gzip -n -9 -f"
@@ -269,27 +267,25 @@ done
 
 # If output_file is set we will generate cpio archive and compress it
 # we are careful to delete tmp files
-if [ ! -z ${output_file} ]; then
-	if [ -z ${cpio_file} ]; then
-		timestamp=
-		if test -n "$KBUILD_BUILD_TIMESTAMP"; then
-			timestamp="$(date -d"$KBUILD_BUILD_TIMESTAMP" +%s || :)"
-			if test -n "$timestamp"; then
-				timestamp="-t $timestamp"
-			fi
+if [ -z ${cpio_file} ]; then
+	timestamp=
+	if test -n "$KBUILD_BUILD_TIMESTAMP"; then
+		timestamp="$(date -d"$KBUILD_BUILD_TIMESTAMP" +%s || :)"
+		if test -n "$timestamp"; then
+			timestamp="-t $timestamp"
 		fi
-		cpio_tfile="$(mktemp ${TMPDIR:-/tmp}/cpiofile.XXXXXX)"
-		usr/gen_init_cpio $timestamp ${cpio_list} > ${cpio_tfile}
-	else
-		cpio_tfile=${cpio_file}
-	fi
-	rm ${cpio_list}
-	if [ "${is_cpio_compressed}" = "compressed" ]; then
-		cat ${cpio_tfile} > ${output_file}
-	else
-		(cat ${cpio_tfile} | ${compr}  - > ${output_file}) \
-		|| (rm -f ${output_file} ; false)
 	fi
-	[ -z ${cpio_file} ] && rm ${cpio_tfile}
+	cpio_tfile="$(mktemp ${TMPDIR:-/tmp}/cpiofile.XXXXXX)"
+	usr/gen_init_cpio $timestamp ${cpio_list} > ${cpio_tfile}
+else
+	cpio_tfile=${cpio_file}
+fi
+rm ${cpio_list}
+if [ "${is_cpio_compressed}" = "compressed" ]; then
+	cat ${cpio_tfile} > ${output_file}
+else
+	(cat ${cpio_tfile} | ${compr}  - > ${output_file}) \
+	|| (rm -f ${output_file} ; false)
 fi
+[ -z ${cpio_file} ] && rm ${cpio_tfile}
 exit 0
-- 
2.17.1

