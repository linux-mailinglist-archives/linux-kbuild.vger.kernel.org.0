Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43254138C01
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2020 07:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgAMGtu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 01:49:50 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:50762 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgAMGtm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 01:49:42 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 00D6mj52028522;
        Mon, 13 Jan 2020 15:48:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 00D6mj52028522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578898130;
        bh=QelJofDAy7EktEHHFtHd7tT2NdoTcb63uWc4G599c/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hRydc7ovJwo4KsBbArTpguAmJdoRI4W5zqfSf/GpNpYwLKa2UJQwn4RckPvOu0Cwd
         yYcRCLR8lcxpOREcC5ZMx2GGRSIxLSg6c1VzONG5sxDNZLdUxhGJzS8gDDzv+CH6pg
         AWh3uYk5dFEP8wzY2ZZJ9ORP4tPGk4Kf+GkI6zvXP3T7cyHEsfQSJIoJb75jAvb7IU
         F7Vhs5aKAAgk5Oj1H5ZKAyxIJHv/WEDLYbtsN5F8kfoYbDZY5KoCA83qC/afKb+Ayl
         Ftv2lkTXW6/5lgDKA1a6CcJNaE7U2s4lkFQdQF11aUmpOWbzRX8cARgTs2yoh8b1eX
         rLIlGyGidn9Dw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] builddeb: split libc headers deployment out into a function
Date:   Mon, 13 Jan 2020 15:48:41 +0900
Message-Id: <20200113064841.3946-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113064841.3946-1-masahiroy@kernel.org>
References: <20200113064841.3946-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Deploy user-space headers (linux-libc-dev package) in a separate
function for readability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 50dc24fa3a65..9448a05a2bce 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -88,12 +88,25 @@ deploy_kernel_headers () {
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
@@ -117,7 +130,7 @@ esac
 BUILD_DEBUG=$(if_enabled_echo CONFIG_DEBUG_INFO Yes)
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$libc_headers_dir" "$dbg_dir" debian/files
+rm -rf "$tmpdir" "$dbg_dir" debian/files
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
 
@@ -167,16 +180,6 @@ if is_enabled CONFIG_MODULES; then
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
@@ -206,7 +209,8 @@ if [ "$ARCH" != "um" ]; then
 	deploy_kernel_headers debian/linux-headers
 	create_package linux-headers-$version debian/linux-headers
 
-	create_package "$libc_headers_packagename" "$libc_headers_dir"
+	deploy_libc_headers debian/linux-libc-dev
+	create_package linux-libc-dev debian/linux-libc-dev
 fi
 
 create_package "$packagename" "$tmpdir"
-- 
2.17.1

