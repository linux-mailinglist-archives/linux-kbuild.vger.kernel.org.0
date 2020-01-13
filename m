Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488B9138BFD
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2020 07:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgAMGtn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 01:49:43 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:50779 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgAMGtm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 01:49:42 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 00D6mj51028522;
        Mon, 13 Jan 2020 15:48:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 00D6mj51028522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578898129;
        bh=Jw6Pcv7J/6wQAHyQGgbNeKdKjJP3lZdWVHIHHaPFr+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xEHtZYRncYZ+CHB9sApOOViMCeSWV7mtKHS+xPVxqm0+zEIMcON+FjKzV6Qeq+3uL
         E09jGwa2AUbjvn00ZO+rPR8zEaEgNj7BhI6JLxGgorEWHFpPJ8mmQ7Iiz4Lt+6SrUX
         k+3nGEwK3Ky+1llct2095Qeq8munzBEKQhsyFdce1bGZvhwt2LSKTKRj5zJCg7A7BD
         lI+0NU3f+8/R7BLhDIgzedXLCMJ08Uyp4n88qpCuweUD1fQ+eZiLa2dGiOPoQSbwXE
         U616QR6B68nNVN8ypJqtRzayJbqrZv7XH5NkYLC1SeQP2ZYg0M7p0aEcu/54j8dhr0
         f7Lg9MpV5spiA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] builddeb: split kernel headers deployment out into a function
Date:   Mon, 13 Jan 2020 15:48:40 +0900
Message-Id: <20200113064841.3946-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113064841.3946-1-masahiroy@kernel.org>
References: <20200113064841.3946-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Deploy kernel headers (linux-headers package) in a separate function
for readability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb | 84 ++++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5efb6155ac0a..50dc24fa3a65 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -46,13 +46,53 @@ create_package() {
 	dpkg --build "$pdir" ..
 }
 
+deploy_kernel_headers () {
+	pdir=$1
+
+	rm -rf $pdir
+
+	(
+		cd $srctree
+		find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
+		find include scripts -type f -o -type l
+		find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
+		find arch/$SRCARCH -name include -type f
+
+		if [ -d arch/$SRCARCH/scripts ]; then
+			find arch/$SRCARCH/scripts -type f
+		fi
+	) > debian/hdrsrcfiles
+
+	{
+		if is_enabled CONFIG_STACK_VALIDATION; then
+			find tools/objtool -type f -executable
+		fi
+
+		find arch/$SRCARCH/include Module.symvers include scripts -type f
+
+		if is_enabled CONFIG_GCC_PLUGINS; then
+			find scripts/gcc-plugins -name \*.so -o -name gcc-common.h
+		fi
+	} > debian/hdrobjfiles
+
+	destdir=$pdir/usr/src/linux-headers-$version
+	mkdir -p $destdir
+	tar -c -f - -C $srctree -T debian/hdrsrcfiles | tar -xf - -C $destdir
+	tar -c -f - -T debian/hdrobjfiles | tar -xf - -C $destdir
+	rm -f debian/hdrsrcfiles debian/hdrobjfiles
+
+	# copy .config manually to be where it's expected to be
+	cp $KCONFIG_CONFIG $destdir/.config
+
+	mkdir -p $pdir/lib/modules/$version/
+	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
+}
+
 version=$KERNELRELEASE
 tmpdir=debian/linux-image
-kernel_headers_dir=debian/linux-headers
 libc_headers_dir=debian/linux-libc-dev
 dbg_dir=debian/linux-image-dbg
 packagename=linux-image-$version
-kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
 dbg_packagename=$packagename-dbg
 
@@ -77,10 +117,9 @@ esac
 BUILD_DEBUG=$(if_enabled_echo CONFIG_DEBUG_INFO Yes)
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" debian/files
+rm -rf "$tmpdir" "$libc_headers_dir" "$dbg_dir" debian/files
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
-mkdir -p "$kernel_headers_dir/lib/modules/$version/"
 
 # Install the kernel
 if [ "$ARCH" = "um" ] ; then
@@ -163,41 +202,10 @@ EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
 done
 
-# Build kernel header package
-(
-	cd $srctree
-	find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
-	find include scripts -type f -o -type l
-	find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
-	find arch/$SRCARCH -name include -type f
-
-	if [ -d arch/$SRCARCH/scripts ]; then
-		find arch/$SRCARCH/scripts -type f
-	fi
-) > debian/hdrsrcfiles
-
-{
-	if is_enabled CONFIG_STACK_VALIDATION; then
-		find tools/objtool -type f -executable
-	fi
-
-	find arch/$SRCARCH/include Module.symvers include scripts -type f
-
-	if is_enabled CONFIG_GCC_PLUGINS; then
-		find scripts/gcc-plugins -name \*.so -o -name gcc-common.h
-	fi
-} > debian/hdrobjfiles
-
-destdir=$kernel_headers_dir/usr/src/linux-headers-$version
-mkdir -p "$destdir"
-tar -c -f - -C $srctree -T debian/hdrsrcfiles | tar -xf - -C $destdir
-tar -c -f - -T debian/hdrobjfiles | tar -xf - -C $destdir
-cp $KCONFIG_CONFIG $destdir/.config # copy .config manually to be where it's expected to be
-ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
-rm -f debian/hdrsrcfiles debian/hdrobjfiles
-
 if [ "$ARCH" != "um" ]; then
-	create_package "$kernel_headers_packagename" "$kernel_headers_dir"
+	deploy_kernel_headers debian/linux-headers
+	create_package linux-headers-$version debian/linux-headers
+
 	create_package "$libc_headers_packagename" "$libc_headers_dir"
 fi
 
-- 
2.17.1

