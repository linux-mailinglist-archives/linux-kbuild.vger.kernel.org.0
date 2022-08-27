Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF4245A4032
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Aug 2022 01:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiH1X5G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Aug 2022 19:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiH1X5F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Aug 2022 19:57:05 -0400
Received: from mail.owenrafferty.com (owenrafferty.com [45.76.27.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8B921810
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Aug 2022 16:57:02 -0700 (PDT)
Received: from localhost (unknown [184.55.81.148])
        by mail.owenrafferty.com (Postfix) with ESMTPSA id 9344E8076E;
        Sun, 28 Aug 2022 23:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=owenrafferty.com;
        s=mail; t=1661731021;
        bh=bm81IC/S8uemro2MULtQo2FpWS9fBzlH+QUD8GaNG8Y=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=VIty2xoCIi0eIySifTazyWuKSHSzxD7V5i+Cy2uPn/gE1JgaNXplJX+bMQfgvtrCf
         c4cKc2brXSsi2T//9jROHIIOKnubzqwPUMk4a5XCV+pZ/vmN1F/5+Q5qAQdm5aUnnx
         /DqA2Y/oymsDdHMdzS6gHvl9qwjvTVSAVKzom3ZhkOJXfgPkqz1GvQ7uIn3nfsE0Re
         T43Np8WlOicVh1Aqf/qy6Dwc6Cnn6VvKKFO1rf9++lEYw5vCYR3PfGwbIK8Ip1LeBk
         t2VRPR0NrbFayRv9KuIGygMTlgnfb9/4nQcExbzJHazU9G0p/9MCLu+1EVYbecDtoO
         O0BFDhtDV4e8A==
X-Mailbox-Line: From 0e70974912f6b2cd95a18192418a438f9c57f690 Mon Sep 17 00:00:00 2001
Message-Id: <0e70974912f6b2cd95a18192418a438f9c57f690.1661730960.git.owen@owenrafferty.com>
In-Reply-To: <CAK7LNAR+Lp2g1kzGNALoge7_51_PKcOd37ebZTV=X-QJEwCn5w@mail.gmail.com>
References: <CAK7LNAR+Lp2g1kzGNALoge7_51_PKcOd37ebZTV=X-QJEwCn5w@mail.gmail.com>
From:   Owen Rafferty <owen@owenrafferty.com>
Date:   Sat, 27 Aug 2022 11:52:18 -0500
Subject: [PATCH v3] kbuild: rewrite check-local-export in sh/awk
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DATE_IN_PAST_24_48,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

---
 scripts/check-local-export | 96 +++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/scripts/check-local-export b/scripts/check-local-export
index 6ccc2f467416..0c049ff44aca 100755
--- a/scripts/check-local-export
+++ b/scripts/check-local-export
@@ -1,26 +1,14 @@
-#!/usr/bin/env bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
+# Copyright (C) 2022 Owen Rafferty <owen@owenrafferty.com>
 #
 # Exit with error if a local exported symbol is found.
 # EXPORT_SYMBOL should be used for global symbols.
 
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
@@ -29,43 +17,53 @@ exit_code=0
 # TODO:
 # Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
 # binutils to 2.37, llvm to 13.0.0.
-# Then, the following line will be really simple:
-#   ${NM} --quiet ${1} |
+# Then, the following line will be simpler:
+#   { ${NM} --quiet ${1} || kill 0; } |
+
+{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
+${AWK} -v "file=${1}" '
+BEGIN {
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
+	exit_code = 0
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

