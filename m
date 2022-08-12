Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B57591259
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Aug 2022 16:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238764AbiHLOgz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Aug 2022 10:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238822AbiHLOgx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Aug 2022 10:36:53 -0400
Received: from mail.owenrafferty.com (owenrafferty.com [45.76.27.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA4385AB8
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Aug 2022 07:36:51 -0700 (PDT)
Received: from localhost (unknown [184.55.81.148])
        by mail.owenrafferty.com (Postfix) with ESMTPSA id A7E7E80D63;
        Fri, 12 Aug 2022 14:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=owenrafferty.com;
        s=mail; t=1660315010;
        bh=EOT6n0uKAGbpjaxGfBVv1wRR+i+PyOnIzm4hdyZ6zcA=;
        h=From:Date:Subject:To:Cc:From;
        b=hPYHUMay2TidJbqps7bI7WSh4mez+eTGkB5TbnrvdGDECLcuFnFm4GtW2nHXEBw+9
         DPMUCJsMUD2G/ujVTKxfzwGHiHTVDDSQJBXHs83/Y1w1/O3theHKANEpIxLzv3LHke
         2o2pn7zrdokwq2ZSNH5L1fMiKREqrqZFpNZGBojmhqNJZk/quNAIdNnLXIBPZfzV6A
         okYTUPR+MU37FJsiufP28BDfhGlfbUVHwBJwAR70SEyKW8c0uOX5INfXi5HMOTN0Z4
         JuvlXvobkl/r5lKZ3zPfftHHtO8DN9usUY125qgA0CA0f4+A/rL7IrA5SqcdHdWgBy
         8VyI44Bs38IHw==
X-Mailbox-Line: From a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7 Mon Sep 17 00:00:00 2001
Message-Id: <a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7.1660314650.git.owen@owenrafferty.com>
From:   Owen Rafferty <owen@owenrafferty.com>
Date:   Fri, 12 Aug 2022 09:18:40 -0500
Subject: [PATCH v2] kbuild: rewrite check-local-export in sh/awk
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove the bash build dependency for those who otherwise do not
have it installed. This also provides a significant speedup:

$ make defconfig
$ make yes2modconfig

...

$ find  .  -name "*.o" | grep -v vmlinux | wc
     3169      3169     89615
$ export NM=nm
$ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1
./scripts/check-local-export'

Without patch:
    0m15.90s real     0m12.17s user     0m05.28s system

With patch:
dash + nawk
    0m02.16s real     0m02.92s user     0m00.34s system

dash + busybox awk
    0m02.36s real     0m03.36s user     0m00.34s system

dash + gawk
    0m02.07s real     0m03.26s user     0m00.32s system

bash + gawk
    0m03.55s real     0m05.00s user     0m00.54s system

Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
---

Notes:
    [v2] commit message updated

 scripts/check-local-export | 95 ++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 49 deletions(-)

diff --git a/scripts/check-local-export b/scripts/check-local-export
index 6ccc2f467416..67eaa7cf08c0 100755
--- a/scripts/check-local-export
+++ b/scripts/check-local-export
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
@@ -8,19 +8,6 @@
 
 set -e
 
-# catch errors from ${NM}
-set -o pipefail
-
-# Run the last element of a pipeline in the current shell.
-# Without this, the while-loop would be executed in a subshell, and
-# the changes made to 'symbol_types' and 'export_symbols' would be lost.
-shopt -s lastpipe
-
-declare -A symbol_types
-declare -a export_symbols
-
-exit_code=0
-
 # If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
 # 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
 # '2>/dev/null'. However, it suppresses real error messages as well. Add a
@@ -29,43 +16,53 @@ exit_code=0
 # TODO:
 # Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
 # binutils to 2.37, llvm to 13.0.0.
-# Then, the following line will be really simple:
-#   ${NM} --quiet ${1} |
+# Then, the following line will be simpler:
+#   { ${NM} --quiet ${1} || kill 0; } |
+
+{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
+awk -v "file=${1}" '
+BEGIN {
+	exit_code = 0
+	i = 0
+}
+
+# Skip the line if the number of fields is less than 3.
+#
+# case 1)
+#   For undefined symbols, the first field (value) is empty.
+#   The outout looks like this:
+#     "                 U _printk"
+#   It is unneeded to record undefined symbols.
+#
+# case 2)
+#   For Clang LTO, llvm-nm outputs a line with type t but empty name:
+#     "---------------- t"
+!length($3) {
+	next
+}
 
-{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
-while read value type name
-do
-	# Skip the line if the number of fields is less than 3.
-	#
-	# case 1)
-	#   For undefined symbols, the first field (value) is empty.
-	#   The outout looks like this:
-	#     "                 U _printk"
-	#   It is unneeded to record undefined symbols.
-	#
-	# case 2)
-	#   For Clang LTO, llvm-nm outputs a line with type 't' but empty name:
-	#     "---------------- t"
-	if [[ -z ${name} ]]; then
-		continue
-	fi
+# save (name, type) in the associative array
+{ symbol_types[$3]=$2 }
 
-	# save (name, type) in the associative array
-	symbol_types[${name}]=${type}
+# append the exported symbol to the array
+($3 ~ /^__ksymtab_/) {
+	export_symbols[i] = $3
+	sub(/^__ksymtab_/, "", export_symbols[i])
+	i++
+}
 
-	# append the exported symbol to the array
-	if [[ ${name} == __ksymtab_* ]]; then
-		export_symbols+=(${name#__ksymtab_})
-	fi
-done
+END {
+	for (j = 0; j < i; ++j) {
+		name = export_symbols[j]
+		# nm(3) says "If lowercase, the symbol is usually local"
+		if (symbol_types[name] ~ /[a-z]/) {
+			printf "%s: error: local symbol %s was exported\n",
+				file, name | "cat 1>&2"
+			exit_code = 1
+		}
+	}
 
-for name in "${export_symbols[@]}"
-do
-	# nm(3) says "If lowercase, the symbol is usually local"
-	if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
-		echo "$@: error: local symbol '${name}' was exported" >&2
-		exit_code=1
-	fi
-done
+	exit exit_code
+}'
 
-exit ${exit_code}
+exit $?
-- 
2.37.2

