Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EE258821A
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Aug 2022 20:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiHBSzU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Aug 2022 14:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiHBSzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Aug 2022 14:55:19 -0400
X-Greylist: delayed 355 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 Aug 2022 11:55:17 PDT
Received: from mail.owenrafferty.com (owenrafferty.com [45.76.27.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E895FA5
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Aug 2022 11:55:16 -0700 (PDT)
Received: from localhost (unknown [184.55.81.148])
        by mail.owenrafferty.com (Postfix) with ESMTPSA id E6BDA80CF8;
        Tue,  2 Aug 2022 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=owenrafferty.com;
        s=mail; t=1659466160;
        bh=NTqXy1saBp74YKhgca7OJOS5mwD3aUeBbx1mMiABJF4=;
        h=From:Date:Subject:To:Cc:From;
        b=Jz9eCx4drdoj69Z4SYTmbVbgQHrow4wY1A8Llb6x6QiVdz/2cVuR+MaJGCKReQ/ny
         vogrMsBcJTp+BTvcjnVYMtbxU4xSBkRd6LfPz0rgmCbx8uDNqzeE7IK9axmuQ5VfZL
         mCeO1tf1GQfflUbW+IVRyIBnARrUUl/oAqJgwPNLRdnZekIjpeTeXfRBxfa/TUFCXJ
         h3OmDcOYmrTRI/NjNyvzIEGu3AYXMf6EoHGHTAbEhaXu9cQtGjX+XhIQOHy4+twSWb
         9Oz8ik/2SjrWEBETeLEIHekog0tjL0pIChVjUYQBPzHfVevsmVBSYzvuoyyLHpKi93
         LCnP+h7I5eb2w==
X-Mailbox-Line: From 18a919882d8aa7b8970888a565ebbbeefdce9f12 Mon Sep 17 00:00:00 2001
Message-Id: <18a919882d8aa7b8970888a565ebbbeefdce9f12.1659465303.git.owen@owenrafferty.com>
From:   Owen Rafferty <owen@owenrafferty.com>
Date:   Tue, 2 Aug 2022 13:30:34 -0500
Subject: [PATCH] kbuild: rewrite check-local-export in posix shell
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove the bash build dependency for those who otherwise do not have it
installed. This should also provide a slight speedup.

Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
---
 scripts/check-local-export | 62 +++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/scripts/check-local-export b/scripts/check-local-export
index 6ccc2f467416..08fa4c989244 100755
--- a/scripts/check-local-export
+++ b/scripts/check-local-export
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
@@ -8,31 +8,11 @@
 
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
+symbol_types=""
+export_symbols=""
 
 exit_code=0
 
-# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
-# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
-# '2>/dev/null'. However, it suppresses real error messages as well. Add a
-# hand-crafted error message here.
-#
-# TODO:
-# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
-# binutils to 2.37, llvm to 13.0.0.
-# Then, the following line will be really simple:
-#   ${NM} --quiet ${1} |
-
-{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
 while read value type name
 do
 	# Skip the line if the number of fields is less than 3.
@@ -46,26 +26,40 @@ do
 	# case 2)
 	#   For Clang LTO, llvm-nm outputs a line with type 't' but empty name:
 	#     "---------------- t"
-	if [[ -z ${name} ]]; then
+	if [ -z ${name} ]; then
 		continue
 	fi
 
-	# save (name, type) in the associative array
-	symbol_types[${name}]=${type}
+	# save (name, type) in "associative array"
+	symbol_types="$symbol_types ${name},${type}"
 
 	# append the exported symbol to the array
-	if [[ ${name} == __ksymtab_* ]]; then
-		export_symbols+=(${name#__ksymtab_})
-	fi
-done
+	case ${name} in __ksymtab_*)
+		export_symbols="$export_symbols ${name#__ksymtab_}"
+	esac
 
-for name in "${export_symbols[@]}"
+# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
+# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
+# '2>/dev/null'. However, it suppresses real error messages as well. Add a
+# hand-crafted error message here.
+#
+# TODO:
+# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
+# binutils to 2.37, llvm to 13.0.0.
+# Then, the following line will be simple:
+# $(${NM} --quiet ${1} || kill -INT $$)
+done <<EOF
+$( ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill -INT $$; })
+EOF
+
+for name in $export_symbols
 do
-	# nm(3) says "If lowercase, the symbol is usually local"
-	if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
+	type="${symbol_types##* $name,}"
+	type="${type%% *}"
+	case ${type} in [a-z])
 		echo "$@: error: local symbol '${name}' was exported" >&2
 		exit_code=1
-	fi
+	esac
 done
 
 exit ${exit_code}
-- 
2.37.1

