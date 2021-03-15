Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCAB333C163
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbhCOQO6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:14:58 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:20216 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhCOQOl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:14:41 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 12FGD7XF030890;
        Tue, 16 Mar 2021 01:13:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 12FGD7XF030890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615824788;
        bh=S3/ZJqs3oYqCsCN9gt+RIQZZsklAqK8OVlEl3S2Jwx4=;
        h=From:To:Cc:Subject:Date:From;
        b=RcYj/4XDc0hmNx6rgD/fARIVJJQQ7Od9DW2/BDlnuKToZJFZxh/b/yMqJQOMsc2+n
         /MQUYlhoQjbF6pcjc8dFzX2W5uxOyHzWQjQFByCqrcr5rw1bq1Kx8s+mjy6ty9Qy7s
         GjVNEotsP5+7VTL1zKOvQ6QMRSdTcZmfjHQWM0OdkfOstzU6xKX0/JmZAxqQwxemf0
         fJPM5SnaPTvrYFsUTHXZ+MN3Fd4WsRxZPRc80Y/Y8XXlfw/bG1tvc7OTIj2RH/ZH/u
         KxWYSrXtGLqkpVFDBQ8FofASNUkFI1KlkcZwJ4DLNM233tKDhgdFDNOLG+o5/6B0UA
         mXkZ2wVFyXrrQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] kbuild: collect minimum tool versions into scripts/min-tool-version.sh
Date:   Tue, 16 Mar 2021 01:12:55 +0900
Message-Id: <20210315161257.788477-1-masahiroy@kernel.org>
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

Let's create a central place of minimum tool versions so you do not need
to touch multiple files. scripts/min-tool-version.sh prints the minimum
version of the given tool.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---

Changes in v2:
  - Use case ... esac

 scripts/cc-version.sh       | 20 +++++--------------
 scripts/ld-version.sh       | 11 ++++-------
 scripts/min-tool-version.sh | 39 +++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 22 deletions(-)
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
index 1bf3aadde9de..a78b804b680c 100755
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
@@ -35,10 +30,12 @@ set -- $(LC_ALL=C "$@" --version)
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
index 000000000000..d22cf91212b0
--- /dev/null
+++ b/scripts/min-tool-version.sh
@@ -0,0 +1,39 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Print the minimum supported version of the given tool.
+# When you raise the minimum version, please update
+# Documentation/process/changes.rst as well.
+
+set -e
+
+if [ $# != 1 ]; then
+	echo "Usage: $0 toolname" >&2
+	exit 1
+fi
+
+case "$1" in
+binutils)
+	echo 2.23.0
+	;;
+gcc)
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
+	# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
+	if [ "$SRCARCH" = arm64 ]; then
+		echo 5.1.0
+	else
+		echo 4.9.0
+	fi
+	;;
+icc)
+	# temporary
+	echo 16.0.3
+	;;
+llvm)
+	echo 10.0.1
+	;;
+*)
+	echo "$1: unknown tool" >&2
+	exit 1
+	;;
+esac
-- 
2.27.0

