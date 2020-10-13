Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0281F28D3BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 20:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731480AbgJMSjC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 14:39:02 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:17431 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731459AbgJMSjC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 14:39:02 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 09DIcO5R031196;
        Wed, 14 Oct 2020 03:38:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 09DIcO5R031196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602614304;
        bh=FSw3maTulNlU+aN2CgbmkmQxZxB5HXEXd7pwOOARoug=;
        h=From:To:Cc:Subject:Date:From;
        b=yzBWZe87pJtI2tPyByzDO/FEY7h84tzx1D4eM/9zQlWkxB/lfbyhDVTVRtydpxbVH
         Xfc43IwcWsuQqQxh6HqMvjZrFYL2YvJfTHl0l8sF7O5ad0999FWbGMwnLWSgKK8ZX7
         cf0MotC3C+lsI21SupzdvgZ2VaslN7MdkZ1iSK1NEedLgEJdjrryg1ynAN95KPvf+3
         zlNibnN6hi6gNRCjumKLUecQIgwTvyz/jXaVmbDTUDCD0qrKlm3cgLJR0irucL5Seb
         0MjDR+l1e44Ce905J1A0A1mQRwPFedVvs40tf7KwwlswbG7R3KhMcGRN2qfuAXHXYa
         B7s7rtbc+5vOA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Josh Triplett <josh@joshtriplett.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: deb-pkg: do not build linux-headers package if CONFIG_MODULES=n
Date:   Wed, 14 Oct 2020 03:38:19 +0900
Message-Id: <20201013183821.242574-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 269a535ca931 ("modpost: generate vmlinux.symvers and
reuse it for the second modpost"), with CONFIG_MODULES disabled,
"make deb-pkg" (or "make bindeb-pkg") fails with:

  find: ‘Module.symvers’: No such file or directory

If CONFIG_MODULES is disabled, it doesn't really make sense to build
the linux-headers package.

Fixes: 269a535ca931 ("modpost: generate vmlinux.symvers and reuse it for the second modpost")
Reported-by: Josh Triplett <josh@joshtriplett.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb |  6 ++++--
 scripts/package/mkdebian | 19 ++++++++++++-------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6474084c32a4..1b11f8993629 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -207,8 +207,10 @@ EOF
 done
 
 if [ "$ARCH" != "um" ]; then
-	deploy_kernel_headers debian/linux-headers
-	create_package linux-headers-$version debian/linux-headers
+	if is_enabled CONFIG_MODULES; then
+		deploy_kernel_headers debian/linux-headers
+		create_package linux-headers-$version debian/linux-headers
+	fi
 
 	deploy_libc_headers debian/linux-libc-dev
 	create_package linux-libc-dev debian/linux-libc-dev
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 3a13b834f281..273fd6ed790e 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -184,13 +184,6 @@ Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
  files, version: $version.
 
-Package: $kernel_headers_packagename
-Architecture: $debarch
-Description: Linux kernel headers for $version on $debarch
- This package provides kernel header files for $version on $debarch
- .
- This is useful for people who need to build external modules
-
 Package: linux-libc-dev
 Section: devel
 Provides: linux-kernel-headers
@@ -201,6 +194,18 @@ Description: Linux support headers for userspace development
 Multi-Arch: same
 EOF
 
+if is_enabled CONFIG_MODULES; then
+cat <<EOF >> debian/control
+
+Package: $kernel_headers_packagename
+Architecture: $debarch
+Description: Linux kernel headers for $version on $debarch
+ This package provides kernel header files for $version on $debarch
+ .
+ This is useful for people who need to build external modules
+EOF
+fi
+
 if is_enabled CONFIG_DEBUG_INFO; then
 cat <<EOF >> debian/control
 
-- 
2.25.1

