Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7AAC6337D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 11:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGIJc6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 05:32:58 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:59511 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfGIJc6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:32:58 -0400
Received: from orion.localdomain ([95.118.92.226]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MjPYI-1iE5gX0bP8-00kvBV; Tue, 09 Jul 2019 11:32:43 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        info@metux.net, apw@canonical.com, joe@perches.com,
        linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 4/4] debian: add generic rule file
Date:   Tue,  9 Jul 2019 11:32:39 +0200
Message-Id: <1562664759-16009-4-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562664759-16009-1-git-send-email-info@metux.net>
References: <1562664759-16009-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:jKhi6lLozAg2IH0o7JxX5GA0JrBrDeDdVL9UaNzdpfsuRuXXdTV
 GI0COtD4SErDVWUkYTz05mOnJcH5X/9+2q58oyRs4I8QRh8V8dmXRfNAO17PSehGOQDaKvE
 T86Un6w4CkuFqM1BEOaUtpLVTajmWf8839oXpIAv39QprOuajLioZw0INYZ2ADT/nQjnnox
 h9/HUqdMxsemWuCFaUszw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KG8HrKoByR8=:sD7hpa9EF7H0gm+eHv8FMJ
 eToxSgaDCL2tS7/7qeZizHw9wrPfBUjOn2wS8D18q732Bp2D41jPky8AozMIAw7R/LIbfZXR8
 A5sx+3MTiQ/pDAvI2pZMxdGBoPJ5u5BNt6awmg4yc9phCoXqmIBIrxmdp+sGzPjnRSUiEf0YU
 aZhpyKxUGZlNVsvhnSdsFF5h7g7uT5kd7g2tM0VYEnQ1LFcfLO7Ne5+/HQDzJyujre1QrN4ew
 oHozcN9VdBtr9WJusQ5fK+zIoh76kWzOx276MOuz/nyS5f8FXhctXHnSIwqgLQFOczmDSj+E0
 a6pvaM5nMDRWySMKmRV2zFf5QidVovrV4HfTyrd4q/w6I99+ti3+htOavC/nYvxJN2LfSO36a
 vkYW+pH1JvNTtDxdUBVL5jzf5qcsrlwxawqXlw9mq3oEsUqOThEKe/NUIOxRMtrgxjeJUMirV
 P7wqY0afXUg/YziPHJktc8Gbn929tQnKEqeTfADV9iOy8W0IrN1AhSHK0J2zBLttCTJHcXr+s
 msbEx8EIncqkiW5vsHmjr+Nt9PxKFTbwpdTTqdj5uiyYWRwtrS+nXQbzee54brvKtJpBpnCR2
 0FJQs50BkAYFq4GtgEjN/u3rCEPq69/IkHNqTGlIX96qx4TNo76e48vsUqpFzJr76vgYyw36a
 Y9ZGcju44Ozk8o8UmS0QrCijrlp6H+uEe5NMEee3/IBulmy85YPUvaEAcumQWO8aFo1MFLYtc
 /jbsn7xsaXVtF5smAt8LF4LIuPp5exCYzYUgfQ==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adding a generic debian rule file, so we can build the directly
via usual Debian package build tools (eg. git-buildpackage,
dck-buildpackage, etc). It expects the .config file already
placed in the source tree.

The rule file contains a rule for creating debian/control and
other metadata - this is done similar to the 'deb-pkg' make rule,
scripts/packaging/mkdebian.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 .gitignore   |  1 +
 MAINTAINERS  |  6 ++++++
 debian/rules | 27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100755 debian/rules

diff --git a/.gitignore b/.gitignore
index 7587ef56..01d742c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -69,6 +69,7 @@ modules.builtin
 # Debian directory (make deb-pkg)
 #
 /debian/
+!/debian/rules
 
 #
 # Snap directory (make snap-pkg)
diff --git a/MAINTAINERS b/MAINTAINERS
index 558acf2..56e034c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4516,6 +4516,12 @@ F:	include/uapi/linux/dccp.h
 F:	include/linux/tfrc.h
 F:	net/dccp/
 
+DEBIAN PACKAGING FILES
+M:	Enrico Weigelt <info@metux.net>
+L:	linux-kbuild@vger.kernel.org
+S:	Maintained
+F:	debian/
+
 DECnet NETWORK LAYER
 W:	http://linux-decnet.sourceforge.net
 L:	linux-decnet-user@lists.sourceforge.net
diff --git a/debian/rules b/debian/rules
new file mode 100755
index 0000000..c2f0319
--- /dev/null
+++ b/debian/rules
@@ -0,0 +1,27 @@
+#!/usr/bin/make -f
+# SPDX-License-Identifier: GPL-2.0
+
+export MAKE
+export KERNELARCH           = $(shell $(MAKE) kernelarch)
+export KERNELRELEASE        = $(shell $(MAKE) kernelrelease)
+export KBUILD_DEBARCH       = $(shell dpkg-architecture -qDEB_HOST_ARCH)
+export KBUILD_BUILD_VERSION = $(shell $(MAKE) kernellocalversion)
+export KDEB_RULES           = debian/rules.auto
+export KDEB_SOURCENAME      = linux-source
+export ARCH                 = $(KERNELARCH)
+
+debian/control debian/changelong debian/arch debian/copyright:
+debian/control:
+	./scripts/package/mkdebian
+
+build:	debian/control
+	$(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC=
+
+binary-arch:	debian/control
+	$(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC= intdeb-pkg
+
+clean:
+	rm -rf debian/*tmp debian/files debian/changelog debian/control debian/copyright debian/rules.auto debian/arch
+	$(MAKE) clean
+
+binary: binary-arch
-- 
1.9.1

