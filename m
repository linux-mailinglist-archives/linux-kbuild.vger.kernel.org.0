Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F941438972
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Oct 2021 16:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhJXOLK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 Oct 2021 10:11:10 -0400
Received: from bbox.sascha.silbe.org ([46.38.230.149]:39959 "EHLO
        bbox.sascha.silbe.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhJXOLK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Oct 2021 10:11:10 -0400
X-Greylist: delayed 510 seconds by postgrey-1.27 at vger.kernel.org; Sun, 24 Oct 2021 10:11:09 EDT
Received: from brick.sascha.silbe.org (brick.sascha.silbe.org [192.168.1.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "brick.sascha.silbe.org", Issuer "stunnel Pseudo-CA" (verified OK))
        by bbox.sascha.silbe.org (Postfix) with ESMTPS id 7795460B3D;
        Sun, 24 Oct 2021 16:00:17 +0200 (CEST)
Received: (nullmailer pid 647841 invoked by uid 71000);
        Sun, 24 Oct 2021 14:00:16 -0000
From:   Sascha Silbe <x-linux@se-silbe.de>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: deb-pkg: set dependencies for kernel image package
Date:   Sun, 24 Oct 2021 15:58:37 +0200
Message-Id: <20211024135838.647689-2-x-linux@se-silbe.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211024135838.647689-1-x-linux@se-silbe.de>
References: <20211024135838.647689-1-x-linux@se-silbe.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Sascha Silbe <x-linux@infra-silbe.de>

When built with module support, we'll need the kmod package to handle
the user space side of kernel module management.

When built with initramfs support but not building an initramfs
directly into the kernel, we'll need initramfs-tools to build the
initramfs that will be loaded.

If a the official kernel package of the distribution was installed
first the dependencies are already installed and it will happen to
work. However on a fresh install base system with just the kernel
package built by deb-pkg installed the dependencies will be missing
and the system will fail to boot.

Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
---
 scripts/package/mkdebian | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 60a2a63a5e900..a3becd9d402e1 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -132,6 +132,14 @@ else
         echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
 fi
 
+image_depends=
+if is_enabled MODULES; then
+    image_depends=kmod
+fi
+if is_enabled BLK_DEV_INITRD && ! is_enabled INITRAMFS_SOURCE; then
+    image_depends="${image_depends}${image_depends:+, }initramfs-tools | linux-initramfs-tool"
+fi
+
 mkdir -p debian/source/
 echo "1.0" > debian/source/format
 
@@ -180,6 +188,7 @@ Homepage: https://www.kernel.org/
 
 Package: $packagename-$version
 Architecture: $debarch
+Depends: $image_depends
 Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
  files, version: $version.
-- 
2.30.2

