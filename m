Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE3F336F2F
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Mar 2021 10:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhCKJsH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 04:48:07 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:17662 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhCKJry (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 04:47:54 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 12B9kUMn003999;
        Thu, 11 Mar 2021 18:46:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 12B9kUMn003999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615455991;
        bh=jjbmnVqKFp76qPOFfjC0GpprElQxdwE0oKx/WiTAwzU=;
        h=From:To:Cc:Subject:Date:From;
        b=Zfc5G9DJXFSRlKbGWPFB33Cnl1FDoT2euLLq1m6aPCEBwQxgh4stpbSHn/u/cylTQ
         rdHIMBHqMBIdQVlJmQv/wduwXo+YVIhRGkwN+RyAMPrcdphXdb7JcwAFk7sMUG2Cof
         bx9Y/0w2e2UlhikbfMbYZDVNqU0s8JTbTWyZiZ+Sl+nZuoxh8Tz8NyrcerpDEJ/68h
         Cmx3a4tt8nrWmRGiusVuquejFwp9x//BHNkMTkX4FDGDgJtSKzzhfWFQDjQqYsJh4W
         wfn3hjL1CYO94YGiGgeRWJ1gz5F0RNueHpTWr787zjj3ViNVlCZ6sNBCswxhG0oRhx
         iuROZhBGD8BFw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: collect minimum tool versions into scripts/min-tool-version.sh
Date:   Thu, 11 Mar 2021 18:46:24 +0900
Message-Id: <20210311094624.923913-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The kernel build uses various tools, many of which are provided by the
same software suite, for example, LLVM and Binutils.

When you raise the minimum version of Clang/LLVM, you need to update
clang_min_version in scripts/cc-version.sh and also lld_min_version in
scripts/ld-version.sh.

Kbuild can handle CC=clang and LD=ld.lld independently, but it does not
make much sense to maintain their versions separately.

Let's make scripts/min-tool-version.sh a central place of minimum tool
versions so you do not need to touch multiple files.

This script prints the minimum version of the given tool.

  $ scripts/min-tool-version.sh gcc
  4.9.0
  $ scripts/min-tool-version.sh llvm
  10.0.1
  $ scripts/min-tool-version.sh binutils
  2.23.0
  $ scripts/min-tool-version.sh foo
  foo: unknown tool

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---

 scripts/cc-version.sh       | 20 +++++---------------
 scripts/ld-version.sh       | 11 ++++-------
 scripts/min-tool-version.sh | 27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 22 deletions(-)
 create mode 100755 scripts/min-tool-version.sh

diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
index 3f2ee885b116..f1952c522466 100755
--- a/scripts/cc-version.sh
+++ b/scripts/cc-version.sh
@@ -6,18 +6,6 @@
 
 set -e
 
-# When you raise the minimum compiler version, please update
-# Documentation/process/changes.rst as well.
-gcc_min_version=4.9.0
-clang_min_version=10.0.1
-icc_min_version=16.0.3 # temporary
-
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
-# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
-if [ "$SRCARCH" = arm64 ]; then
-	gcc_min_version=5.1.0
-fi
-
 # Print the compiler name and some version components.
 get_compiler_info()
 {
@@ -48,18 +36,20 @@ set -- $(get_compiler_info "$@")
 
 name=$1
 
+min_tool_version=$(dirname $0)/min-tool-version.sh
+
 case "$name" in
 GCC)
 	version=$2.$3.$4
-	min_version=$gcc_min_version
+	min_version=$($min_tool_version gcc)
 	;;
 Clang)
 	version=$2.$3.$4
-	min_version=$clang_min_version
+	min_version=$($min_tool_version llvm)
 	;;
 ICC)
 	version=$(($2 / 100)).$(($2 % 100)).$3
-	min_version=$icc_min_version
+	min_version=$($min_tool_version icc)
 	;;
 *)
 	echo "$orig_args: unknown compiler" >&2
diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index 30debf78aa09..5b9481e98b4f 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -6,11 +6,6 @@
 
 set -e
 
-# When you raise the minimum linker version, please update
-# Documentation/process/changes.rst as well.
-bfd_min_version=2.23.0
-lld_min_version=10.0.1
-
 # Convert the version string x.y.z to a canonical 5 or 6-digit form.
 get_canonical_version()
 {
@@ -35,10 +30,12 @@ set -- $("$@" --version)
 IFS=' '
 set -- $1
 
+min_tool_version=$(dirname $0)/min-tool-version.sh
+
 if [ "$1" = GNU -a "$2" = ld ]; then
 	shift $(($# - 1))
 	version=$1
-	min_version=$bfd_min_version
+	min_version=$($min_tool_version binutils)
 	name=BFD
 	disp_name="GNU ld"
 elif [ "$1" = GNU -a "$2" = gold ]; then
@@ -51,7 +48,7 @@ else
 
 	if [ "$1" = LLD ]; then
 		version=$2
-		min_version=$lld_min_version
+		min_version=$($min_tool_version llvm)
 		name=LLD
 		disp_name=LLD
 	else
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
new file mode 100755
index 000000000000..37c438d766d7
--- /dev/null
+++ b/scripts/min-tool-version.sh
@@ -0,0 +1,27 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Print the minimum supported version of the given tool.
+
+set -e
+
+# When you raise the minimum version, please update
+# Documentation/process/changes.rst as well.
+min_gcc_version=4.9.0
+min_llvm_version=10.0.1
+min_icc_version=16.0.3 # temporary
+min_binutils_version=2.23.0
+
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
+# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
+if [ "$SRCARCH" = arm64 ]; then
+	min_gcc_version=5.1.0
+fi
+
+eval min_version="\$min_${1}_version"
+if [ -z "$min_version" ]; then
+	echo "$1: unknown tool" >&2
+	exit 1
+fi
+
+echo "$min_version"
-- 
2.27.0

