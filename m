Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF4134421
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfFDKPk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:15:40 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39195 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfFDKPk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:40 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC7H032511;
        Tue, 4 Jun 2019 19:14:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC7H032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643264;
        bh=ZW8oJHHCyujAucqOHf5owysxupf7VvOq0sufCbzCWAs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bbpYgPT74iM32GjIo997UUOMQ9vWoTSw0PoW8PZguSq4D/k4Va2cIhN41x4E1gqUs
         TyHDXxYIBw3dMAdm680pEiOiWDdi6V3+qS1+xCwR+mYrtpQrppDU92JOzHssuABdV0
         8mI/ysv69ZyRQoCZtdqeDFvHMnBRtjSyz0CEj9KWEc8CFZZsiCK2IaIF0WcZ9m1BYs
         Gfn2gx5QOX8qnqhtGKPXgyJ0Em7H+AT95vylOg8HAVkgjXLsWsUcFTi/1GHlvJbMEb
         sygylFj+vTiTtZQCbfEOTVMKaf73xjlVnE2MPUQc7Ya5gm+lnZpVvPPXR2OsvZBYaj
         ittJ4YlSEshHw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/15] kbuild: simplify scripts/headers_install.sh
Date:   Tue,  4 Jun 2019 19:14:05 +0900
Message-Id: <20190604101409.2078-12-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that headers_install.sh is invoked per file, remove the for-loop
in the shell script.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.headersinst |  2 +-
 scripts/headers_install.sh   | 48 +++++++++++++++---------------------
 2 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index c96c4c26e240..d2b572a7a628 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -58,7 +58,7 @@ $(if $(new-dirs), $(shell mkdir -p $(new-dirs)))
 ifndef HDRCHECK
 
 quiet_cmd_install = HDRINST $@
-      cmd_install = $(CONFIG_SHELL) $(srctree)/scripts/headers_install.sh $(@D) $(<D) $(@F)
+      cmd_install = $(CONFIG_SHELL) $(srctree)/scripts/headers_install.sh $< $@
 
 $(src-headers): $(dst)/%.h: $(src)/%.h $(srctree)/scripts/headers_install.sh FORCE
 	$(call if_changed,install)
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 593f8879c641..47f6f3ea0771 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -1,47 +1,39 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
-if [ $# -lt 2 ]
+if [ $# -ne 2 ]
 then
-	echo "Usage: headers_install.sh OUTDIR SRCDIR [FILES...]"
+	echo "Usage: headers_install.sh INFILE OUTFILE"
 	echo
 	echo "Prepares kernel header files for use by user space, by removing"
 	echo "all compiler.h definitions and #includes, removing any"
 	echo "#ifdef __KERNEL__ sections, and putting __underscores__ around"
 	echo "asm/inline/volatile keywords."
 	echo
-	echo "OUTDIR: directory to write each userspace header FILE to."
-	echo "SRCDIR: source directory where files are picked."
-	echo "FILES:  list of header files to operate on."
+	echo "INFILE: header file to operate on"
+	echo "OUTFILE: output file which the processed header is writen to"
 
 	exit 1
 fi
 
 # Grab arguments
+INFILE=$1
+OUTFILE=$2
+TMPFILE=$OUTFILE.tmp
 
-OUTDIR="$1"
-shift
-SRCDIR="$1"
-shift
+trap 'rm -f $OUTFILE $TMPFILE' EXIT
 
-# Iterate through files listed on command line
+sed -E -e '
+	s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
+	s/__attribute_const__([[:space:]]|$)/\1/g
+	s@^#include <linux/compiler(|_types).h>@@
+	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
+	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
+	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
+' $INFILE > $TMPFILE || exit 1
 
-FILE=
-trap 'rm -f "$OUTDIR/$FILE" "$OUTDIR/$FILE.sed"' EXIT
-for i in "$@"
-do
-	FILE="$(basename "$i")"
-	sed -E \
-		-e 's/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g' \
-		-e 's/__attribute_const__([[:space:]]|$)/\1/g' \
-		-e 's@^#include <linux/compiler(|_types).h>@@' \
-		-e 's/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g' \
-		-e 's/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g' \
-		-e 's@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @' \
-		"$SRCDIR/$i" > "$OUTDIR/$FILE.sed" || exit 1
-	scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ "$OUTDIR/$FILE.sed" \
-		> "$OUTDIR/$FILE"
-	[ $? -gt 1 ] && exit 1
-	rm -f "$OUTDIR/$FILE.sed"
-done
+scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
+[ $? -gt 1 ] && exit 1
+
+rm -f $TMPFILE
 trap - EXIT
-- 
2.17.1

