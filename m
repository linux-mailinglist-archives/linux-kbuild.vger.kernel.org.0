Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA2B218936
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 15:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbgGHNgG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 09:36:06 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59219 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbgGHNgG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 09:36:06 -0400
X-Originating-IP: 176.185.171.128
Received: from localhost.localdomain (static-176-185-171-128.ftth.abo.bbox.fr [176.185.171.128])
        (Authenticated sender: maxime.chretien@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3FFE1FF803;
        Wed,  8 Jul 2020 13:36:04 +0000 (UTC)
From:   Maxime Chretien <maxime.chretien@bootlin.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net, corbet@lwn.net
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maxime Chretien <maxime.chretien@bootlin.com>
Subject: [PATCH] kconfig confdata: Add an option to keep all .config backups
Date:   Wed,  8 Jul 2020 15:35:56 +0200
Message-Id: <20200708133556.12934-1-maxime.chretien@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When KCONFIG_KEEPALLBACKUPS is set in the environment,
instead of renaming the old .config to .config.old, kconfig puts it in
a folder named .config.backupdir that stores all backups
with the name .config.oldX where X is a number.

The latest backup is the one with the highest number.

This is useful to avoid doing a lot of manual backups to make sure to have
a working build when you make a lot of changes that can break everything.

Signed-off-by: Maxime Chretien <maxime.chretien@bootlin.com>
---
 Documentation/kbuild/kconfig.rst |  6 ++++++
 Makefile                         |  2 +-
 scripts/kconfig/confdata.c       | 15 ++++++++++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index dce6801d66c9..0f1dac4f1fc2 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -46,6 +46,12 @@ KCONFIG_OVERWRITECONFIG
 If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
 break symlinks when .config is a symlink to somewhere else.
 
+KCONFIG_KEEPALLBACKUPS
+-----------------------
+If you set KCONFIG_KEEPALLBACKUPS in the environment, Kconfig will save
+all .config.old as .config.oldX where X is a number (lower is older)
+inside a folder named .config.backupdir .
+
 `CONFIG_`
 ---------
 If you set `CONFIG_` in the environment, Kconfig will prefix all symbols
diff --git a/Makefile b/Makefile
index ac2c61c37a73..c74a18c60107 100644
--- a/Makefile
+++ b/Makefile
@@ -1437,7 +1437,7 @@ CLEAN_FILES += include/ksym vmlinux.symvers \
 MRPROPER_FILES += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .tmp_objdiff \
 		  debian snap tar-install \
-		  .config .config.old .version \
+		  .config .config.old .config.backupdir .version \
 		  Module.symvers \
 		  signing_key.pem signing_key.priv signing_key.x509	\
 		  x509.genkey extra_certificates signing_key.x509.keyid	\
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index a39d93e3c6ae..a019752816a0 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -923,7 +923,20 @@ int conf_write(const char *name)
 			return 0;
 		}
 
-		snprintf(oldname, sizeof(oldname), "%s.old", name);
+		env = getenv("KCONFIG_KEEPALLBACKUPS");
+		if (env) {
+			i = 0;
+			do {
+				snprintf(oldname, sizeof(oldname),
+					 "%s.backupdir/%s.old%d", name, name, i);
+				i++;
+			} while(is_present(oldname));
+
+			if (make_parent_dir(oldname))
+				return -1;
+		} else {
+			snprintf(oldname, sizeof(oldname), "%s.old", name);
+		}
 		rename(name, oldname);
 		if (rename(tmpname, name))
 			return 1;
-- 
2.27.0

