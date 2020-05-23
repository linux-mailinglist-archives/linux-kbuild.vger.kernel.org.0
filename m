Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F701DFB07
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2020 22:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387922AbgEWUiS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 May 2020 16:38:18 -0400
Received: from bluehome.net ([96.66.250.149]:52126 "EHLO bluehome.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387911AbgEWUiS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 May 2020 16:38:18 -0400
Received: from pc.lan (pc.lan [10.0.0.51])
        by bluehome.net (Postfix) with ESMTPSA id 673934B40682;
        Sat, 23 May 2020 13:38:17 -0700 (PDT)
From:   Jason Self <j@jxself.org>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org, ben@decadent.org.uk,
        Jason Self <j@jxself.org>
Subject: [PATCH] make builddeb invoke calls to linux-update-symlinks
Date:   Sat, 23 May 2020 13:38:01 -0700
Message-Id: <20200523203801.18277-1-j@jxself.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <235c4776ddc5cbb94a45643098a50a20b14e530e.camel@decadent.org.uk>
References: <235c4776ddc5cbb94a45643098a50a20b14e530e.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The official Debian kernel packages, in addition to running the
scripts in /etc/kernel, also runs linux-update-symlinks via the
postinst script. This updates the /vmlinuz and /initrd.img (if it uses
an initramfs) symlinks to point to the newly installed kernel. This
update causes the builddeb script to do the same.

This version of the patch incorporates the feedback from Ben
Hutchings.

Signed-off-by: Jason Self <j@jxself.org>
---
 scripts/package/builddeb | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6df3c9f8b2da..707693867c29 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -195,6 +195,37 @@ export DEB_MAINT_PARAMS="\$*"
 # Tell initramfs builder whether it's wanted
 export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
 
+$(case $script in
+    postinst)
+        echo "if [ -f /lib/modules/$version/.fresh-install ]; then
+    change=install
+else
+    change=upgrade
+fi
+if command -v linux-update-symlinks > /dev/null; then
+    linux-update-symlinks $change $version /$installed_image_path
+fi
+rm -f /lib/modules/$version/.fresh-install"
+        ;;
+    postrm)
+        echo "if command -v linux-update-symlinks > /dev/null; then
+    linux-update-symlinks remove $version /$installed_image_path
+fi"
+        ;;
+    preinst)
+        echo 'if [ "$1" = install ]; then
+    # Create a flag file for postinst
+    mkdir -p /lib/modules/$version
+    touch /lib/modules/$version/.fresh-install
+fi'
+        ;;
+    prerm)
+        echo "if command -v linux-check-removal > /dev/null; then
+    linux-check-removal $version
+fi"
+        ;;
+esac)
+
 test -d $debhookdir/$script.d && run-parts --arg="$version" --arg="/$installed_image_path" $debhookdir/$script.d
 exit 0
 EOF
-- 
2.26.0

