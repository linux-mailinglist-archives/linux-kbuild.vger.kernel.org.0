Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3661819D30C
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2020 11:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390362AbgDCJDC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 05:03:02 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:37416 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgDCJDC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 05:03:02 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 03392RjV003555;
        Fri, 3 Apr 2020 18:02:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 03392RjV003555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585904548;
        bh=XrGcOoytGchUAxm+l/tv3vqg2YEbLgd5bxsYRFtLiG8=;
        h=From:To:Cc:Subject:Date:From;
        b=vnz7MfC6d7R4hdqCOlm0vQp9C0iwbaUebYk95pwPJb6mGE6mv5DxFdSGlJr/Zj/qc
         66sLQ3MiCgDt9BNmFOJ2xxFSX2XLxgP0q8Z8IUE7kglnEkuuvuBAkZih6yVylCQPOm
         arVzNcZzl4KaJ4ffhB+KGy/AWP4O2GOsyv9IbOn8T/mVDu4CZ4MOLdGF4jUwPUv4SS
         Q3lVFkjl4Bd2FKAe4fHD547G1Sj1gUoJEYcOr3VS3y0gc2Er8AMjD/X1FVEUFXTKHi
         C84wm0a91AtJJfKnf9WwNInJ3WRVMD2O6Duuwa8C8TknBAO/JuVpxMQhc9Pll9fAm2
         nkTbn3mNFrQug==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jeremy Cline <jcline@redhat.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
        Michal Kubecek <mkubecek@suse.cz>,
        Philipp Rudo <prudo@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add dummy toolchains to enable all cc-option etc. in Kconfig
Date:   Fri,  3 Apr 2020 18:02:24 +0900
Message-Id: <20200403090224.24045-1-masahiroy@kernel.org>
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

Other than distros, savedefconfig is also a problem. Some arch subsytems
periodically resync defconfig files. If you use a less-capable compiler
for savedefconfig, options that do not meet 'depends on $(cc-option,...)'
will be forcibly disabled. So, defconfig && savedefconfig may silently
change the behavior.

This commit adds a set of dummy toolchains that pretend to support any
feature.

Most of compiler features are tested by cc-option, which simply checks
the exit code of $(CC). The dummy tools are just a shell script that
exits with 0 in most cases. So, $(cc-option, ...) is evaluated as 'y'.

There are more complicated checks such as:

  scripts/gcc-x86_{32,64}-has-stack-protector.sh
  scripts/gcc-plugin.sh
  scripts/tools-support-relr.sh

I tried my best to implement the dummy scripts to pass all checks.

From the top directory of the source tree, you can do:

   $ make CROSS_COMPILE=scripts/dummy-tools/ oldconfig

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/dummy-tools/gcc     | 91 +++++++++++++++++++++++++++++++++++++
 scripts/dummy-tools/ld      |  4 ++
 scripts/dummy-tools/nm      |  4 ++
 scripts/dummy-tools/objcopy |  4 ++
 4 files changed, 103 insertions(+)
 create mode 100755 scripts/dummy-tools/gcc
 create mode 100755 scripts/dummy-tools/ld
 create mode 100755 scripts/dummy-tools/nm
 create mode 100755 scripts/dummy-tools/objcopy

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
index 000000000000..3bc56ae4cc15
--- /dev/null
+++ b/scripts/dummy-tools/ld
@@ -0,0 +1,4 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Dummy script that always succeeds
diff --git a/scripts/dummy-tools/nm b/scripts/dummy-tools/nm
new file mode 100755
index 000000000000..3bc56ae4cc15
--- /dev/null
+++ b/scripts/dummy-tools/nm
@@ -0,0 +1,4 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Dummy script that always succeeds
diff --git a/scripts/dummy-tools/objcopy b/scripts/dummy-tools/objcopy
new file mode 100755
index 000000000000..3bc56ae4cc15
--- /dev/null
+++ b/scripts/dummy-tools/objcopy
@@ -0,0 +1,4 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Dummy script that always succeeds
-- 
2.17.1

