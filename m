Return-Path: <linux-kbuild+bounces-507-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D82E829791
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jan 2024 11:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2BFE1F25130
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jan 2024 10:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DAD40BFA;
	Wed, 10 Jan 2024 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="f+nShup1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32B844386;
	Wed, 10 Jan 2024 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PGoi1VMjYQ3iWmH9FHX5cd3/b6djkMWA8QwUTwtRkqQ=; b=f+nShup1VxEdMWfD/khNQb+6ma
	pHC86jp2+KVjZjv+z65Al8+Cu/evgvYKFmDWKRQ/pAroYf2H0MQ0cJu9kO0Lt5IpWvqoamzDuCAuC
	XQl/010pBl/y2+eBgt5uBEKWdZhQ0XZ+Q9yqVJhoCjLo5vHE+3rgh/ruWwiRVGHaW15OoeElWIIdX
	Pi6dfa/5PqofYcZjfJU81RBhW50/XIAVbpkaZv+KMWi4OZNEbm/b26ip96XiU4a8XsNIeI5Tgb0b5
	jfGjS42Di3ZShyXpUtZsg2R0hEhZDEejUwEOYeflmPP6QFw02MZ9Jcw58ZleZGtb5paC++nmRdlFI
	uzcgNzmQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52062 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rNVlI-0005A7-3B;
	Wed, 10 Jan 2024 10:24:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rNVlL-000qDm-Pg; Wed, 10 Jan 2024 10:24:43 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
	 Linus Torvalds <torvalds@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: detect depmod version to exclude new SHA3 module
 signing options
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 10 Jan 2024 10:24:43 +0000

When using the SHA3 module signing options, kmod 28 segfaults during
"make modules_install" on the build host.

When running depmod under gdb, it reports:

Program received signal SIGSEGV, Segmentation fault.
__strlen_sse2 () at ../sysdeps/x86_64/multiarch/strlen-vec.S:133

Therefore, SHA3 can't be used on a build system with an old kmod. Add
a script to retrieve the version of depmod, and use that in the Kconfig
to determine whether the SHA3 options should be made available.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
I don't know what the minimum requirement is for SHA3 to work, so I have
chosen a minimum of version 29 for the purposes of this patch.
---
 kernel/module/Kconfig     |  8 ++++++++
 scripts/Kconfig.include   |  3 +++
 scripts/depmod-version.sh | 11 +++++++++++
 3 files changed, 22 insertions(+)
 create mode 100755 scripts/depmod-version.sh

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 0ea1b2970a23..d2ba454026a9 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -223,6 +223,11 @@ config MODULE_SIG_ALL
 	  Sign all modules during make modules_install. Without this option,
 	  modules must be signed manually, using the scripts/sign-file tool.
 
+config DEPMOD_VERSION
+	int
+	default	$(depmod-version)
+	default 0
+
 comment "Do not forget to sign required modules with scripts/sign-file"
 	depends on MODULE_SIG_FORCE && !MODULE_SIG_ALL
 
@@ -250,14 +255,17 @@ config MODULE_SIG_SHA512
 
 config MODULE_SIG_SHA3_256
 	bool "Sign modules with SHA3-256"
+	depends on DEPMOD_VERSION > 28
 	select CRYPTO_SHA3
 
 config MODULE_SIG_SHA3_384
 	bool "Sign modules with SHA3-384"
+	depends on DEPMOD_VERSION > 28
 	select CRYPTO_SHA3
 
 config MODULE_SIG_SHA3_512
 	bool "Sign modules with SHA3-512"
+	depends on DEPMOD_VERSION > 28
 	select CRYPTO_SHA3
 
 endchoice
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 5a84b6443875..052f581c86da 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -63,3 +63,6 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
 cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
+
+# depmod version
+depmod-version := $(shell,$(srctree)/scripts/depmod-version.sh)
diff --git a/scripts/depmod-version.sh b/scripts/depmod-version.sh
new file mode 100755
index 000000000000..32a8a6f6b737
--- /dev/null
+++ b/scripts/depmod-version.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+: ${DEPMOD:=depmod}
+
+# legacy behavior: "depmod" in /sbin, no /sbin in PATH
+PATH="$PATH:/sbin"
+
+LC_ALL=C "$DEPMOD" --version | sed -n '1s/kmod version //p'
-- 
2.30.2


