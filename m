Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9D832C203
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387636AbhCCTcQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:32:16 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:63519 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1580816AbhCCSfQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 13:35:16 -0500
Received: from localhost.localdomain (122-103-140-163.kyoto.fdn.vectant.ne.jp [122.103.140.163]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 123IXcJd023524;
        Thu, 4 Mar 2021 03:33:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 123IXcJd023524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614796419;
        bh=LVGA05n7Wz/yiErDayOXN6cwfEkjWcwwyvZ95yePyvU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=y3lXvknLyDYHn7Ph6cwWTdu1Ua9KHWn/Q5qZh6Jc26uYc68QH8Gl9+KYm5wmZBB42
         5n19u4O/kmWJ0xqYvybf4EUDvpHGK97mr4NutwLRCY6a0+/DU0SbsiEjtzJDupdto1
         OFiDZq7Sg/OVMBKUuOt/jU46taGzJAHnMlCo/MlqC1W7gvCabx5jHCrX4JFtwzTBp4
         MXt2jPJ5XdeT8V43nIlPfC/+U5YJy6Z57nO6JEw5kSDuGIixlnm3RVM9Wlq3m78j5+
         rrvONxIipPDpm2FvlkaRXx13hGC5OlggfJNJB5Wb89cdbY7u8fnpmCLhTp0qb2y7YJ
         INxrqZNC1kozg==
X-Nifty-SrcIP: [122.103.140.163]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] kbuild: collect minimum tool versions into scripts/tool-version.sh
Date:   Thu,  4 Mar 2021 03:33:31 +0900
Message-Id: <20210303183333.46543-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303183333.46543-1-masahiroy@kernel.org>
References: <20210303183333.46543-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The kernel build uses various tools, many of which are provided by the
same software suite, for example, LLVM and Binutils.

When we raise the minimal version of Clang/LLVM, we need to update
clang_min_version in scripts/cc-version.sh and also lld_min_version in
scripts/ld-version.sh.

In fact, Kbuild can handle CC=clang and LD=ld.lld independently, and we
could manage their minimal version separately, but it does not make
much sense.

Make scripts/tool-version.sh a central place of minimum tool versions
so that we do not need to touch multiple files.

This script prints the minimal version of the given tool.

  $ scripts/tool-version.sh gcc
  4.9.0
  $ scripts/tool-version.sh llvm
  10.0.1
  $ scripts/tool-version.sh binutils
  2.23.0
  $ scripts/tool-version.sh foo
  foo: unknown tool

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/cc-version.sh   | 20 +++++---------------
 scripts/ld-version.sh   | 11 ++++-------
 scripts/tool-version.sh | 27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 22 deletions(-)
 create mode 100755 scripts/tool-version.sh

diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
index 3f2ee885b116..4772f1ef9cac 100755
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
 
+tool_version=$(dirname $0)/tool-version.sh
+
 case "$name" in
 GCC)
 	version=$2.$3.$4
-	min_version=$gcc_min_version
+	min_version=$($tool_version gcc)
 	;;
 Clang)
 	version=$2.$3.$4
-	min_version=$clang_min_version
+	min_version=$($tool_version llvm)
 	;;
 ICC)
 	version=$(($2 / 100)).$(($2 % 100)).$3
-	min_version=$icc_min_version
+	min_version=$($tool_version icc)
 	;;
 *)
 	echo "$orig_args: unknown compiler" >&2
diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index a463273509b5..e824f7675693 100755
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
 
+tool_version=$(dirname $0)/tool-version.sh
+
 if [ "$1" = GNU -a "$2" = ld ]; then
 	shift $(($# - 1))
 	version=$1
-	min_version=$bfd_min_version
+	min_version=$($tool_version binutils)
 	name=BFD
 	disp_name="GNU ld"
 elif [ "$1" = GNU -a "$2" = gold ]; then
@@ -46,7 +43,7 @@ elif [ "$1" = GNU -a "$2" = gold ]; then
 	exit 1
 elif [ "$1" = LLD ]; then
 	version=$2
-	min_version=$lld_min_version
+	min_version=$($tool_version llvm)
 	name=LLD
 	disp_name=LLD
 else
diff --git a/scripts/tool-version.sh b/scripts/tool-version.sh
new file mode 100755
index 000000000000..b4aa27e2c3d3
--- /dev/null
+++ b/scripts/tool-version.sh
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
+gcc_min_version=4.9.0
+llvm_min_version=10.0.1
+icc_min_version=16.0.3 # temporary
+binutils_min_version=2.23.0
+
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
+# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
+if [ "$SRCARCH" = arm64 ]; then
+	gcc_min_version=5.1.0
+fi
+
+eval min_version="\$${1}_min_version"
+if [ -z "$min_version" ]; then
+	echo "$1: unknown tool" >&2
+	exit 1
+fi
+
+echo "$min_version"
-- 
2.27.0

