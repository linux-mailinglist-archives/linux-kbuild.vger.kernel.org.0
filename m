Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD1D3B8FAA
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Jul 2021 11:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235608AbhGAJWa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Jul 2021 05:22:30 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59367 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235705AbhGAJWa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Jul 2021 05:22:30 -0400
X-UUID: 97bcb5b983a44609807ec5f536e05f78-20210701
X-UUID: 97bcb5b983a44609807ec5f536e05f78-20210701
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 212237512; Thu, 01 Jul 2021 17:19:27 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 17:19:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 17:19:25 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <keescook@chromium.org>, <samitolvanen@google.com>,
        <linux-kbuild@vger.kernel.org>, <nathan@kernel.org>
CC:     <clang-built-linux@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <yj.chiang@mediatek.com>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH v2 1/2] [PATCH 1/2] Kbuild: lto: add CONFIG_MAKE_VERSION
Date:   Thu, 1 Jul 2021 17:19:21 +0800
Message-ID: <20210701091922.572-2-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210701091922.572-1-lecopzer.chen@mediatek.com>
References: <20210701091922.572-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To check the GNU make version. Used by the LTO Kconfig.

LTO with MODVERSIONS will fail in generating correct CRC because
the makefile rule doesn't work for make with version 3.8X.[1]

Thus we need to check make version during selecting on LTO Kconfig.
Add CONFIG_MAKE_VERSION which means MAKE_VERSION in canonical digits
for arithmetic comparisons.

[1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 Makefile                |  2 +-
 init/Kconfig            |  4 ++++
 scripts/make-version.sh | 13 +++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)
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
index 55f9f7738ebb..ecc110504f87 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -86,6 +86,10 @@ config CC_HAS_ASM_INLINE
 config CC_HAS_NO_PROFILE_FN_ATTR
 	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
 
+config MAKE_VERSION
+	int
+	default $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))
+
 config CONSTRUCTORS
 	bool
 
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

