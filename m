Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7761CC649
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2020 05:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgEJDeO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 May 2020 23:34:14 -0400
Received: from bluehome.net ([96.66.250.149]:54820 "EHLO bluehome.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgEJDeN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 May 2020 23:34:13 -0400
X-Greylist: delayed 504 seconds by postgrey-1.27 at vger.kernel.org; Sat, 09 May 2020 23:34:13 EDT
Received: from pc.lan (pc.lan [10.0.0.51])
        by bluehome.net (Postfix) with ESMTPSA id 18C624B40B42;
        Sat,  9 May 2020 20:25:49 -0700 (PDT)
From:   Jason Self <j@jxself.org>
To:     linux-kbuild@vger.kernel.org
Cc:     j@jxself.org
Subject: [PATCH] make builddeb invoke calls to linux-update-symlink
Date:   Sat,  9 May 2020 20:25:39 -0700
Message-Id: <20200510032539.773-1-j@jxself.org>
X-Mailer: git-send-email 2.26.0
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

Signed-off-by: Jason Self <j@jxself.org>
---
 scripts/package/builddeb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6df3c9f8b2da..1932c54cc338 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -195,6 +195,12 @@ export DEB_MAINT_PARAMS="\$*"
 # Tell initramfs builder whether it's wanted
 export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
 
+$(case $script in
+postinst)
+        echo linux-update-symlinks install $version $installed_image_path
+        ;;
+esac)
+
 test -d $debhookdir/$script.d && run-parts --arg="$version" --arg="/$installed_image_path" $debhookdir/$script.d
 exit 0
 EOF
-- 
2.26.0

