Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE7F3F6348
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 18:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbhHXQvm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Aug 2021 12:51:42 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:47113 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbhHXQvh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Aug 2021 12:51:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 17OGoVNT016204;
        Wed, 25 Aug 2021 01:50:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 17OGoVNT016204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629823832;
        bh=EkRhcEpTCWDYCMBzaFS4gMIDR56jHPgpS+7UsaLpdHQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Nm2Q/6WNCiAZMfol9gE9KP1GHUwCyzQxGcs85vyGOjIaf2QRjCz0yusE6oNTt8qp/
         ADsZhffXjDjOSdYb1woATFzDOlP48vepPeLSnTVLL1sp2eqYdjHw7NikK4pI+4xE8J
         PH+/lgQH78tu8gvKmifdgD9aJictv1ycV+X75nTuY8yGabmGlNh8OB4AGnFkzCwWAg
         q67rkXIx0KPeOVQXykyy6s/1DsO8kVoJqtP/yyhQjc6VTRiWNZmhaSs5yZAajkyIoq
         20j6HtNLBcAPpNeaiPFoP7djaq5V5ha2nMNCKJQ76P9KxXGjcYSLGNqPKyIB4WPIOM
         fCQzZT5ffOX5Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: add generic install.sh
Date:   Wed, 25 Aug 2021 01:50:24 +0900
Message-Id: <20210824165024.303771-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Many architectures has a similar install.sh script.

The first half is really generic; ensures the kernel image and the map
file exist, then invokes ~/bin/${INSTALLKERNEL} or /sbin/${INSTALLKERNEL}
if available.

The second half is kind of arch-specific. It just copies the kernel image
and map file to the destination, but the code is slightly different.
(Maybe, this part can be consolidated as well if we want).

This patch factors out the generic part into scripts/install.sh, which
will architectures to drop the duplicated code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile           |  8 ++++++++
 scripts/install.sh | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100755 scripts/install.sh

diff --git a/Makefile b/Makefile
index 185ce47d6734..725eadc4fcb8 100644
--- a/Makefile
+++ b/Makefile
@@ -1325,6 +1325,14 @@ scripts_unifdef: scripts_basic
 
 install: sub_make_done :=
 
+# Install $(KBUILD_IMAGE) by default.
+# If necessary, override install-image per target.
+install-image = $(KBUILD_IMAGE)
+
+quiet_cmd_install = INSTALL $(INSTALL_PATH)
+      cmd_install = scripts/install.sh $(KERNELRELEASE) $(install-image) \
+			System.map "$(INSTALL_PATH)"
+
 # ---------------------------------------------------------------------------
 # Tools
 
diff --git a/scripts/install.sh b/scripts/install.sh
new file mode 100755
index 000000000000..6ac0e0c0f078
--- /dev/null
+++ b/scripts/install.sh
@@ -0,0 +1,43 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# Copyright (C) 1995 by Linus Torvalds
+#
+# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
+#
+# Arguments:
+#   $1 - kernel version
+#   $2 - kernel image file
+#   $3 - kernel map file
+#   $4 - default install path (blank if root directory)
+
+verify () {
+	if [ ! -f "$1" ]; then
+		echo >&2
+		echo >&2 " *** Missing file: $1"
+		echo >&2 ' *** You need to run "make" before "make install".'
+		echo >&2
+		exit 1
+	fi
+}
+
+# Make sure the files actually exist
+verify "$2"
+verify "$3"
+
+# User/arch may have a custom install script
+
+for script in "~/bin/${INSTALLKERNEL}" "/sbin/${INSTALLKERNEL}" \
+		"arch/${SRCARCH}/install.sh" "arch/${SRCARCH}/boot/install.sh"
+do
+	if [ -x "${script}" ]; then
+		exec "${script}" "$@"
+	fi
+done
+
+echo "No install script found" >&2
+exit 1
-- 
2.30.2

