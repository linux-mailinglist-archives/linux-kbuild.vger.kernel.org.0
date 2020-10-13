Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA98428D3C0
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 20:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731546AbgJMSjE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 14:39:04 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:17416 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgJMSjC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 14:39:02 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 09DIcO5S031196;
        Wed, 14 Oct 2020 03:38:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 09DIcO5S031196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602614305;
        bh=0AeJnw7iffImlFmYPeg7EqKL/aadd4F/WPMGvRQhMhE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NUfnHY29lrSl80u6hHuHa8UNeHszjUa7rtYk7bFZw6sYW08AC9XntlM/EOCKkVO1+
         FxJ1QlhruQHct3YgbtIDENSuvslVlfG2ydqt5r7xbuVvDn0zAXTeiR7mfRPk65feiT
         n3m1kea1QlknLndmL8nyAoOdAIBCL3rLMMgnobcCYmLocDllEmWIBd66om52IM/iCu
         lqtgIUqgFG/zxpfeoR8UnXFreK27Oj6XNBKjPB/ed7/dgI2ngMPUUjhbba8f1JGeTv
         tEuZZvTfY0PcTWsk5pUvIYBKg0ZgIocOEscLdAqMixaPF1KZiBbnNY8cLpAEhgzfs2
         d4rKxmT2MOLIw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Josh Triplett <josh@joshtriplett.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: deb-pkg: clean up package name variables
Date:   Wed, 14 Oct 2020 03:38:20 +0900
Message-Id: <20201013183821.242574-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013183821.242574-1-masahiroy@kernel.org>
References: <20201013183821.242574-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hard-code the names of linux-headers and debug packages in the
control file.

The kernel package is different for ARCH=um. Change the code
for better readability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/mkdebian | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 273fd6ed790e..60a2a63a5e90 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -94,16 +94,16 @@ else
 	packageversion=$version-$revision
 fi
 sourcename=$KDEB_SOURCENAME
-packagename=linux-image-$version
-kernel_headers_packagename=linux-headers-$version
-dbg_packagename=$packagename-dbg
-debarch=
-set_debarch
 
 if [ "$ARCH" = "um" ] ; then
-	packagename=user-mode-linux-$version
+	packagename=user-mode-linux
+else
+	packagename=linux-image
 fi
 
+debarch=
+set_debarch
+
 email=${DEBEMAIL-$EMAIL}
 
 # use email string directly if it contains <email>
@@ -178,7 +178,7 @@ Rules-Requires-Root: no
 Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
 Homepage: https://www.kernel.org/
 
-Package: $packagename
+Package: $packagename-$version
 Architecture: $debarch
 Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
@@ -197,7 +197,7 @@ EOF
 if is_enabled CONFIG_MODULES; then
 cat <<EOF >> debian/control
 
-Package: $kernel_headers_packagename
+Package: linux-headers-$version
 Architecture: $debarch
 Description: Linux kernel headers for $version on $debarch
  This package provides kernel header files for $version on $debarch
@@ -209,7 +209,7 @@ fi
 if is_enabled CONFIG_DEBUG_INFO; then
 cat <<EOF >> debian/control
 
-Package: $dbg_packagename
+Package: linux-image-$version-dbg
 Section: debug
 Architecture: $debarch
 Description: Linux kernel debugging symbols for $version
-- 
2.25.1

