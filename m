Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23902438974
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Oct 2021 16:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhJXOLL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 Oct 2021 10:11:11 -0400
Received: from bbox.sascha.silbe.org ([46.38.230.149]:57291 "EHLO
        bbox.sascha.silbe.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhJXOLK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Oct 2021 10:11:10 -0400
Received: from brick.sascha.silbe.org (brick.sascha.silbe.org [192.168.1.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "brick.sascha.silbe.org", Issuer "stunnel Pseudo-CA" (verified OK))
        by bbox.sascha.silbe.org (Postfix) with ESMTPS id CE14A60C88;
        Sun, 24 Oct 2021 16:00:17 +0200 (CEST)
Received: (nullmailer pid 647843 invoked by uid 71000);
        Sun, 24 Oct 2021 14:00:16 -0000
From:   Sascha Silbe <x-linux@se-silbe.de>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: deb-pkg: invoke linux-base scripts if installed
Date:   Sun, 24 Oct 2021 15:58:38 +0200
Message-Id: <20211024135838.647689-3-x-linux@se-silbe.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211024135838.647689-1-x-linux@se-silbe.de>
References: <20211024135838.647689-1-x-linux@se-silbe.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Sascha Silbe <x-linux@infra-silbe.de>

Kernel images built from source can be installed and used manually. On
systems where "flash-kernel" is used, new versions will be picked up
automatically and used on next boot. However on systems relying on
symlinks this does not happen as the symlinks are not updated, unlike
with stock Debian kernels.

To fix this invoke the scripts from linux-base if they are installed
just like the maintainer scripts of the stock Debian kernel packages
do.

Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
---
 scripts/package/builddeb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 91a502bb97e8a..69e0c51d324e0 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -202,6 +202,28 @@ export DEB_MAINT_PARAMS="\$*"
 # Tell initramfs builder whether it's wanted
 export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
 
+# Call linux-base scripts if they are installed
+if command -v linux-update-symlinks > /dev/null; then
+    if [ $script = preinst ] && [ "\$1" = install ]; then
+        mkdir -p /lib/modules/$version
+        touch /lib/modules/$version/.fresh-install
+    elif [ $script = postinst ] && [ "\$1" = configure ]; then
+        if [ -f /lib/modules/$version/.fresh-install ]; then
+            linux-update-symlinks install $version /$installed_image_path
+            rm /lib/modules/$version/.fresh-install
+        else
+            linux-update-symlinks upgrade $version /$installed_image_path
+        fi
+    elif [ $script = prerm ] && [ "\$1" = remove ]; then
+        linux-check-removal $version
+    elif [ $script = postrm ]; then
+        rm -f /lib/modules/$version/.fresh-install
+        if [ "\$1" != upgrade ]; then
+            linux-update-symlinks remove $version /$installed_image_path
+        fi
+    fi
+fi
+
 test -d $debhookdir/$script.d && run-parts --arg="$version" --arg="/$installed_image_path" $debhookdir/$script.d
 exit 0
 EOF
-- 
2.30.2

