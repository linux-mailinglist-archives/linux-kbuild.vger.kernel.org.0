Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B4A6324C
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 09:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfGIHn7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 03:43:59 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:49003 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfGIHn7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 03:43:59 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-02.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hkkn7-0004Jq-G3 from Cedric_Hombourger@mentor.com ; Tue, 09 Jul 2019 00:43:57 -0700
Received: from FRG-W10-HOMBOUR.world.mentorg.com (137.202.0.90) by
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Tue, 9 Jul 2019 08:43:52 +0100
From:   Cedric Hombourger <Cedric_Hombourger@mentor.com>
To:     <yamada.masahiro@socionext.com>
CC:     <ben@decadent.org.uk>, <isar-users@googlegroups.com>,
        <michal.lkml@markovi.net>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <riku.voipio@linaro.org>,
        Cedric Hombourger <Cedric_Hombourger@mentor.com>
Subject: [PATCH v4] builddeb: generate multi-arch friendly linux-libc-dev package
Date:   Tue, 9 Jul 2019 09:43:35 +0200
Message-ID: <1562658215-186-2-git-send-email-Cedric_Hombourger@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562658215-186-1-git-send-email-Cedric_Hombourger@mentor.com>
References: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
 <1562658215-186-1-git-send-email-Cedric_Hombourger@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Debian-based distributions place libc header files in a machine
specific directory (/usr/include/<libc-machine>) instead of
/usr/include/asm to support installation of the linux-libc-dev
package from multiple architectures. Move headers installed by
"make headers_install" accordingly using Debian's tuple from
dpkg-architecture (stored in debian/arch).

Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
---
 scripts/package/builddeb | 5 +++++
 scripts/package/mkdebian | 1 +
 2 files changed, 6 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b03dd56a4782..d5d33bcba1fb 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -132,6 +132,11 @@ fi
 if [ "$ARCH" != "um" ]; then
 	$MAKE -f $srctree/Makefile headers_check
 	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
+	# move asm headers to /usr/include/<libc-machine>/asm to match the structure
+	# used by Debian-based distros (to support multi-arch)
+	host_arch=$(dpkg-architecture -a$(cat debian/arch) -qDEB_HOST_MULTIARCH)
+	mkdir $libc_headers_dir/usr/include/$host_arch
+	mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$host_arch/
 fi
 
 # Install the maintainer scripts
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 8351584cb24e..e0750b70453f 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -197,6 +197,7 @@ Architecture: $debarch
 Description: Linux support headers for userspace development
  This package provides userspaces headers from the Linux kernel.  These headers
  are used by the installed headers for GNU glibc and other system libraries.
+Multi-Arch: same
 
 Package: $dbg_packagename
 Section: debug
-- 
2.11.0

