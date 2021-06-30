Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01243B81D8
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jun 2021 14:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbhF3MR1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Jun 2021 08:17:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43471 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234426AbhF3MR0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Jun 2021 08:17:26 -0400
X-UUID: 16871cf3902c4b699625f046f55572ca-20210630
X-UUID: 16871cf3902c4b699625f046f55572ca-20210630
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2036288648; Wed, 30 Jun 2021 20:14:53 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 20:14:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 20:14:52 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <keescook@chromium.org>, <samitolvanen@google.com>,
        <linux-kbuild@vger.kernel.org>
CC:     <clang-built-linux@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <yj.chiang@mediatek.com>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH 1/2] Kbuild: lto: add make-version macros
Date:   Wed, 30 Jun 2021 20:14:35 +0800
Message-ID: <20210630121436.19581-2-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630121436.19581-1-lecopzer.chen@mediatek.com>
References: <20210630121436.19581-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To check the GNU make version. Used by the LTO Kconfig.

LTO with MODVERSION will fail in generating correct CRC because
the makefile rule doesn't work for make with version 3.8X.[1]

Thus we need to check make version during selecting on LTO Kconfig.
The MAKE_VERSION_INT means MAKE_VERSION in canonical digits integer and
implemnted by imitating CLANG_VERSION.

[1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 Makefile                |  2 +-
 init/Kconfig            |  4 ++++
 scripts/Kconfig.include |  3 +++
 scripts/make-version.sh | 13 +++++++++++++
 4 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100755 scripts/make-version.sh

diff --git a/Makefile b/Makefile
index 88888fff4c62..2402745b2ba9 100644
--- a/Makefile
+++ b/Makefile
@@ -516,7 +516,7 @@ CLANG_FLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
-export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
+export PERL PYTHON3 CHECK CHECKFLAGS MAKE MAKE_VERSION UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
diff --git a/init/Kconfig b/init/Kconfig
index a61c92066c2e..9f2b71fdf23e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -83,6 +83,10 @@ config TOOLS_SUPPORT_RELR
 config CC_HAS_ASM_INLINE
 	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
 
+config MAKE_VERSION_INT
+	int
+	default $(make-version)
+
 config CONSTRUCTORS
 	bool
 
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 0496efd6e117..f956953d0236 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -63,3 +63,6 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
 cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
+
+# Get the GNU make version with a canonical digit.
+make-version := $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))
diff --git a/scripts/make-version.sh b/scripts/make-version.sh
new file mode 100755
index 000000000000..ce5af96696cc
--- /dev/null
+++ b/scripts/make-version.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Print the linker name and its version in a 5 or 6-digit form.
+
+set -e
+
+# Convert the version string x.y.z to a canonical 5 or 6-digit form.
+IFS=.
+set -- $1
+
+# If the 2nd or 3rd field is missing, fill it with a zero.
+echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
-- 
2.18.0

