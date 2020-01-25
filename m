Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F6614934E
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Jan 2020 05:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAYENW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 23:13:22 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:28258 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgAYENN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:13:13 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 00P4CcjX032210;
        Sat, 25 Jan 2020 13:12:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 00P4CcjX032210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579925563;
        bh=Ru4RO9PKJOZis0APDfihMYPE7fsaicItemyL6M7oN+Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FS8EhjVCq9yLkCuXeVC2bJXm3D5HHa7RhlFTflpittdcMQkz7xBs+khyyBF9YMWo3
         6KU9s4c1TXHJVxiVuUfOunxCHsTJK+5aJOXTQ9bE+PKbDW7vE7GM5Ot6a5/1plLDQM
         hhgq4ls2oiiRVKWXnoon0+sxgt1zhC/rjXKA8mhydeXVMTEDOnJvw+kQdPpZMvg2vh
         y5RhAUq878+HQ20XzKJG1+zyFFZgG30+h6DQdFSAI6TQqm1RI7Sj16eI6+lquxUqk8
         6SDl8n198DZZLhgynVrq91Hj6QcVHTOTGkIhWmt5BfgDW8URUTzuFPMB1ded5ZRYDN
         BEZZVhSA6Rxig==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v3 7/7] builddeb: split libc headers deployment out into a function
Date:   Sat, 25 Jan 2020 13:12:35 +0900
Message-Id: <20200125041235.8856-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200125041235.8856-1-masahiroy@kernel.org>
References: <20200125041235.8856-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Deploy user-space headers (linux-libc-dev package) in a separate
function for readability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3: None
Changes in v2: None

 scripts/package/builddeb | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c9287e57d398..6df3c9f8b2da 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -84,12 +84,25 @@ deploy_kernel_headers () {
 	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
 }
 
+deploy_libc_headers () {
+	pdir=$1
+
+	rm -rf $pdir
+
+	$MAKE -f $srctree/Makefile headers
+	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH=$pdir/usr
+
+	# move asm headers to /usr/include/<libc-machine>/asm to match the structure
+	# used by Debian-based distros (to support multi-arch)
+	host_arch=$(dpkg-architecture -a$(cat debian/arch) -qDEB_HOST_MULTIARCH)
+	mkdir $pdir/usr/include/$host_arch
+	mv $pdir/usr/include/asm $pdir/usr/include/$host_arch/
+}
+
 version=$KERNELRELEASE
 tmpdir=debian/linux-image
-libc_headers_dir=debian/linux-libc-dev
 dbg_dir=debian/linux-image-dbg
 packagename=linux-image-$version
-libc_headers_packagename=linux-libc-dev
 dbg_packagename=$packagename-dbg
 
 if [ "$ARCH" = "um" ] ; then
@@ -113,7 +126,7 @@ esac
 BUILD_DEBUG=$(if_enabled_echo CONFIG_DEBUG_INFO Yes)
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$libc_headers_dir" "$dbg_dir" debian/files
+rm -rf "$tmpdir" "$dbg_dir" debian/files
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
 
@@ -163,16 +176,6 @@ if is_enabled CONFIG_MODULES; then
 	fi
 fi
 
-if [ "$ARCH" != "um" ]; then
-	$MAKE -f $srctree/Makefile headers
-	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
-	# move asm headers to /usr/include/<libc-machine>/asm to match the structure
-	# used by Debian-based distros (to support multi-arch)
-	host_arch=$(dpkg-architecture -a$(cat debian/arch) -qDEB_HOST_MULTIARCH)
-	mkdir $libc_headers_dir/usr/include/$host_arch
-	mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$host_arch/
-fi
-
 # Install the maintainer scripts
 # Note: hook scripts under /etc/kernel are also executed by official Debian
 # kernel packages, as well as kernel packages built using make-kpkg.
@@ -202,7 +205,8 @@ if [ "$ARCH" != "um" ]; then
 	deploy_kernel_headers debian/linux-headers
 	create_package linux-headers-$version debian/linux-headers
 
-	create_package "$libc_headers_packagename" "$libc_headers_dir"
+	deploy_libc_headers debian/linux-libc-dev
+	create_package linux-libc-dev debian/linux-libc-dev
 fi
 
 create_package "$packagename" "$tmpdir"
-- 
2.17.1

