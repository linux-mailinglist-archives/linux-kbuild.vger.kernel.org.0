Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3999F2D8876
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Dec 2020 18:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395547AbgLLQzo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Dec 2020 11:55:44 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:45143 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395531AbgLLQzo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Dec 2020 11:55:44 -0500
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 0BCGsX0Q010674;
        Sun, 13 Dec 2020 01:54:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0BCGsX0Q010674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1607792077;
        bh=dpgq5RZvPfHgfloxAHMCr/hKbK6506wPMQVyOXg27a0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eLWAba1xRxtIa7MFfcp2kJuxBE5U0DAYaZ9omDn9VY0Lkc6ytCRVNmtS7NI7RBZoz
         UyFDx7+CBvaw69rlFWbbG9QjazZ3eSLO5lUHTYhG26QsIdw91o6bLg08GGM7n2KbZ4
         BAxIb6YfnDgaBQj1lRs+T9TyyBdTrf81eCl2WV+uHY5ABzzzZYJrrlI6IdMu+xWaKs
         H27OiuWwE/9gFqP0DjLE033cAe95m/Pc34EqELipwyhMB09JYxduapwA9g3Wc+tIzW
         5xmTXSAd2G9LNVSHgPvuWQd6j0gBLzLLXJ5dAkhkLlbndk9gNiI9PgguhvRiiY0T9d
         6HQ97R3ogK6aA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Dominique Martinet <asmadeus@codewreck.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kbuild: rewrite ld-version.sh in shell script
Date:   Sun, 13 Dec 2020 01:54:31 +0900
Message-Id: <20201212165431.150750-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201212165431.150750-1-masahiroy@kernel.org>
References: <20201212165431.150750-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script was written in awk in spite of the file extension '.sh'.
Rewrite it as a shell script.

The code was mostly copy-pasted from scripts/lld-version.sh.
The two scripts can be merged, but I am keeping this as a separate
file for now.

I tested this script for some corner cases reported in the past:

 - GNU ld version 2.25-15.fc23
   as reported by commit 8083013fc320 ("ld-version: Fix it on Fedora")

 - GNU ld (GNU Binutils) 2.20.1.20100303
   as reported by commit 0d61ed17dd30 ("ld-version: Drop the 4th and
   5th version components")

I also cleaned up the macros in scripts/Kbuild.include. Remove
ld-version, which has no direct user. You can use CONFIG_LD_VERSION
if you need the version string in a Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Kconfig           |  2 +-
 scripts/Kbuild.include |  6 +-----
 scripts/ld-version.sh  | 31 +++++++++++++++++++++----------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 0872a5a2e759..a44a13a6b38d 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -35,7 +35,7 @@ config GCC_VERSION
 
 config LD_VERSION
 	int
-	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
+	default $(shell,$(srctree)/scripts/ld-version.sh $(LD))
 
 config CC_IS_CLANG
 	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 08e011175b4c..167a68bbe7be 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -141,13 +141,9 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
 
-# ld-version
-# Note this is mainly for HJ Lu's 3 number binutil versions
-ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
-
 # ld-ifversion
 # Usage:  $(call ld-ifversion, -ge, 22252, y)
-ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
+ld-ifversion = $(shell [ $(CONFIG_LD_VERSION) $(1) $(2) ] && echo $(3) || echo $(4))
 
 ######
 
diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index 0f8a2c0f9502..c214aeb3200d 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -1,11 +1,22 @@
-#!/usr/bin/awk -f
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-# extract linker version number from stdin and turn into single number
-	{
-	gsub(".*\\)", "");
-	gsub(".*version ", "");
-	gsub("-.*", "");
-	split($1,a, ".");
-	print a[1]*10000 + a[2]*100 + a[3];
-	exit
-	}
+#
+# Usage: $ ./scripts/ld-version.sh ld
+#
+# Print the linker version of `ld' in a 5 or 6-digit form
+# such as `23501' for GNU ld 2.35.1 etc.
+
+first_line="$($* --version | head -n 1)"
+
+if ! ( echo $first_line | grep -q "GNU ld"); then
+	echo 0
+	exit 1
+fi
+
+# Distributions may append an extra string like 2.35-15.fc33
+# Take the part that consists of numbers and dots.
+VERSION=$(echo $first_line | sed 's/.* \([^ ]*\)$/\1/' | sed 's/^\(^[0-9.]*\).*/\1/')
+MAJOR=$(echo $VERSION | cut -d . -f 1)
+MINOR=$(echo $VERSION | cut -d . -f 2)
+PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
+printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-- 
2.27.0

