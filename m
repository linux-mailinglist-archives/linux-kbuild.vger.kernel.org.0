Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 809C313C93F
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2020 17:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgAOQ0c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jan 2020 11:26:32 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:58809 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgAOQ0c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jan 2020 11:26:32 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 00FGPX3G015075;
        Thu, 16 Jan 2020 01:25:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 00FGPX3G015075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579105538;
        bh=J3kTsJCLUXlDsDdSDZ99wjZGkzlnfm+/v4cWcQiS+NE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WuoxDDciqjiu4MKo5MqEY8TSQM4SThkmsANgntkKTxMCGwCnhE2bJUZIOJ0RqZfzP
         tsaL/Qp2xiBMwoZp+G1xWijfjBLZzFscjuSa2BKbseciOiXwJn6EI+wdJKZT3wPVEL
         +/pRIiFJVjRihtkSedaadBLNJOJo/Juej/uirLKu4JEi5ftuGXHSDoujktPCOS97Ce
         +J99ar+XuUjugx2Mwb2P+1wHF4c1Bpa2fFQe68SCQZZjfP2H401OHa3VAsY+FqExUK
         NVT9CjzyMoXayBH7NmUUmUIU8Xwn9zbKHIlTxqQkrL+kwhiTK7B9/BnT6ZR3Wi3RZ7
         /zd3vt6Yq5EUg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] builddeb: split libc headers deployment out into a function
Date:   Thu, 16 Jan 2020 01:25:29 +0900
Message-Id: <20200115162529.11089-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115162529.11089-1-masahiroy@kernel.org>
References: <20200115162529.11089-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Deploy user-space headers (linux-libc-dev package) in a separate
function for readability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/package/builddeb | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index d149452692da..f49f41fd4c95 100755
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

