Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 537991302CA
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgADPDE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:03:04 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:53556 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgADPDC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:02 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 004F2gcb018492;
        Sun, 5 Jan 2020 00:02:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 004F2gcb018492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578150170;
        bh=Vd/6UVoZeGWFet0wYyglEhVVlg+WMUtxzEuX+5frdFg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sd0MkfPCPviYRg406S2hLQQSN6lW0MrE4rGR88MoyLxdoxpqWKHbtwXpn9O+zdrn7
         Zcn+C9l99TpuGtLUPMWDVpwNFXgQYPFfpyllNxX0BAZDOKsxK8eBi8bIosXbpb1akM
         +ikNX3irEWdW//3aqyerxdJctrf9Hv/OvFDuugQE+TRjjNC/mJUZC3l2UHZ8mhMPOS
         MuIiOI+SOmsYBdn+vx5xQq3krXSD4cAYyVhPzk3hpARDytiWxXC1an3gwQ84UTN8ag
         NIi6NggkJLewDxHEeIc62vFdPVA/0IOKnNgyzgAfK6XirPVM60MjWFWNFUeTQjXVkA
         ioTZB7yiUnVcA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] gen_initramfs.sh: always output cpio even without -o option
Date:   Sun,  5 Jan 2020 00:02:36 +0900
Message-Id: <20200104150238.19834-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
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

Changes in v2: None

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

