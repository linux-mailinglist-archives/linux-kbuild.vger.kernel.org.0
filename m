Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8782D1A10B9
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 17:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgDGPzA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 11:55:00 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:46188 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgDGPzA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 11:55:00 -0400
Received: from grover.flets-west.jp (softbank126125134031.bbtec.net [126.125.134.31]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 037FsdHg020057;
        Wed, 8 Apr 2020 00:54:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 037FsdHg020057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586274879;
        bh=RihD+3vJve3dKcBqfqiQl0DbSzyeAk9yAyld1jRP0K0=;
        h=From:To:Cc:Subject:Date:From;
        b=p2frPYgTsf7tVg+PFyQUIyMN+cUwbAj6L8yFA4uaXGpcUDnwOBE9D2C1SX16JAq16
         LLKO0p6SUnXVyQRQVlZVCTBOsNwic/OireZvY3tI1mez62slDU+u/fqtsvsGo0NF59
         EsbZ/7kIFE2FN53Br3Lo9FlvkZVYIieN2tHKJBL69/RY6Gd+iOO3R40pc+QAG2CPpl
         m3jumLkwKdyZwtvu1w6uwiIJXzK9A9eREoE2yjoHTOOD8pqZd7NFRk2KJTv/Btx/dQ
         AWgYLCzFMKpgVxmRcv90pXwTs+84VEb411KLVSot/OoeMJez+N6CIyx48PgbLnqCar
         elkeWqAgeyWIg==
X-Nifty-SrcIP: [126.125.134.31]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jeremy Cline <jcline@redhat.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Philipp Rudo <prudo@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: add dummy toolchains to enable all cc-option etc. in Kconfig
Date:   Wed,  8 Apr 2020 00:53:52 +0900
Message-Id: <20200407155352.16617-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Staring v4.18, Kconfig evaluates compiler capabilities, and hides CONFIG
options your compiler does not support. This works well if you configure
and build the kernel on the same host machine.

It is inconvenient if you prepare the .config that is carried to a
different build environment (typically this happens when you package
the kernel for distros) because using a different compiler potentially
produces different CONFIG options than the real build environment.
So, you probably want to make as many options visible as possible.
In other words, you need to create a super-set of CONFIG options that
cover any build environment. If some of the CONFIG options turned out
to be unsupported on the build machine, they are automatically disabled
by the nature of Kconfig.

However, it is not feasible to get a full-featured compiler for every
arch.

This issue was discussed here:

  https://lkml.org/lkml/2019/12/9/620

Other than distros, savedefconfig is also a problem. Some arch sub-systems
periodically resync defconfig files. If you use a less-capable compiler
for savedefconfig, options that do not meet 'depends on $(cc-option,...)'
will be forcibly disabled. So, 'make defconfig && make savedefconfig'
may silently change the behavior.

This commit adds a set of dummy toolchains that pretend to support any
feature.

Most of compiler features are tested by cc-option, which simply checks
the exit code of $(CC). The dummy tools are shell scripts that always
exit with 0. So, $(cc-option, ...) is evaluated as 'y'.

There are more complicated checks such as:

  scripts/gcc-x86_{32,64}-has-stack-protector.sh
  scripts/gcc-plugin.sh
  scripts/tools-support-relr.sh

scripts/dummy-tools/gcc passes all checks.

From the top directory of the source tree, you can do:

   $ make CROSS_COMPILE=scripts/dummy-tools/ oldconfig

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Philipp Rudo <prudo@linux.ibm.com>
---

Changes in v2:
  - support --version and -v for ld, objdump, nm

 scripts/dummy-tools/gcc     | 91 +++++++++++++++++++++++++++++++++++++
 scripts/dummy-tools/ld      | 30 ++++++++++++
 scripts/dummy-tools/nm      |  1 +
 scripts/dummy-tools/objcopy |  1 +
 4 files changed, 123 insertions(+)
 create mode 100755 scripts/dummy-tools/gcc
 create mode 100755 scripts/dummy-tools/ld
 create mode 120000 scripts/dummy-tools/nm
 create mode 120000 scripts/dummy-tools/objcopy

diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
new file mode 100755
index 000000000000..33487e99d83e
--- /dev/null
+++ b/scripts/dummy-tools/gcc
@@ -0,0 +1,91 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Staring v4.18, Kconfig evaluates compiler capabilities, and hides CONFIG
+# options your compiler does not support. This works well if you configure and
+# build the kernel on the same host machine.
+#
+# It is inconvenient if you prepare the .config that is carried to a different
+# build environment (typically this happens when you package the kernel for
+# distros) because using a different compiler potentially produces different
+# CONFIG options than the real build environment. So, you probably want to make
+# as many options visible as possible. In other words, you need to create a
+# super-set of CONFIG options that cover any build environment. If some of the
+# CONFIG options turned out to be unsupported on the build machine, they are
+# automatically disabled by the nature of Kconfig.
+#
+# However, it is not feasible to get a full-featured compiler for every arch.
+# Hence these dummy toolchains to make all compiler tests pass.
+#
+# Usage:
+#
+# From the top directory of the source tree, run
+#
+#   $ make CROSS_COMPILE=scripts/dummy-tools/ oldconfig
+#
+# Most of compiler features are tested by cc-option, which simply checks the
+# exit code of $(CC). This script does nothing and just exits with 0 in most
+# cases. So, $(cc-option, ...) is evaluated as 'y'.
+#
+# This scripts caters to more checks; handle --version and pre-process __GNUC__
+# etc. to pretend to be GCC, and also do right things to satisfy some scripts.
+
+# Check if the first parameter appears in the rest. Succeeds if found.
+# This helper is useful if a particular option was passed to this script.
+# Typically used like this:
+#   arg_contain <word-you-are-searching-for> "$@"
+arg_contain ()
+{
+	search="$1"
+	shift
+
+	while [ $# -gt 0 ]
+	do
+		if [ "$search" = "$1" ]; then
+			return 0
+		fi
+		shift
+	done
+
+	return 1
+}
+
+# To set CONFIG_CC_IS_GCC=y
+if arg_contain --version "$@"; then
+	echo "gcc (scripts/dummy-tools/gcc)"
+	exit 0
+fi
+
+if arg_contain -E "$@"; then
+	# For scripts/gcc-version.sh; This emulates GCC 20.0.0
+	if arg_contain - "$@"; then
+		sed 's/^__GNUC__$/20/; s/^__GNUC_MINOR__$/0/; s/^__GNUC_PATCHLEVEL__$/0/'
+		exit 0
+	else
+		echo "no input files" >&2
+		exit 1
+	fi
+fi
+
+if arg_contain -S "$@"; then
+	# For scripts/gcc-x86-*-has-stack-protector.sh
+	if arg_contain -fstack-protector "$@"; then
+		echo "%gs"
+		exit 0
+	fi
+fi
+
+# For scripts/gcc-plugin.sh
+if arg_contain -print-file-name=plugin "$@"; then
+	plugin_dir=$(mktemp -d)
+
+	sed -n 's/.*#include "\(.*\)"/\1/p' $(dirname $0)/../gcc-plugins/gcc-common.h |
+	while read header
+	do
+		mkdir -p $plugin_dir/include/$(dirname $header)
+		touch $plugin_dir/include/$header
+	done
+
+	echo $plugin_dir
+	exit 0
+fi
diff --git a/scripts/dummy-tools/ld b/scripts/dummy-tools/ld
new file mode 100755
index 000000000000..f68233050405
--- /dev/null
+++ b/scripts/dummy-tools/ld
@@ -0,0 +1,30 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Dummy script that always succeeds.
+
+# Check if the first parameter appears in the rest. Succeeds if found.
+# This helper is useful if a particular option was passed to this script.
+# Typically used like this:
+#   arg_contain <word-you-are-searching-for> "$@"
+arg_contain ()
+{
+	search="$1"
+	shift
+
+	while [ $# -gt 0 ]
+	do
+		if [ "$search" = "$1" ]; then
+			return 0
+		fi
+		shift
+	done
+
+	return 1
+}
+
+if arg_contain --version "$@" || arg_contain -v "$@"; then
+	progname=$(basename $0)
+	echo "GNU $progname (scripts/dummy-tools/$progname) 2.50"
+	exit 0
+fi
diff --git a/scripts/dummy-tools/nm b/scripts/dummy-tools/nm
new file mode 120000
index 000000000000..c0648b38dd42
--- /dev/null
+++ b/scripts/dummy-tools/nm
@@ -0,0 +1 @@
+ld
\ No newline at end of file
diff --git a/scripts/dummy-tools/objcopy b/scripts/dummy-tools/objcopy
new file mode 120000
index 000000000000..c0648b38dd42
--- /dev/null
+++ b/scripts/dummy-tools/objcopy
@@ -0,0 +1 @@
+ld
\ No newline at end of file
-- 
2.17.1

