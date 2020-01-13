Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3191138C04
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2020 07:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbgAMGt5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 01:49:57 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:50773 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgAMGtl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 01:49:41 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 00D6mj4x028522;
        Mon, 13 Jan 2020 15:48:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 00D6mj4x028522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578898128;
        bh=3vKkMfH6IZbwuOFVg8bd3vT4wQP2/cg7kIoSzEpmW/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zH9qTxEWOz+pio6P7TFFGxyY1waIjuHVHnxCsZq7KqLKVnYMm5+SZpnjO9XqoddbK
         Qv9gnDudNQ0BXKhsnGGXlV6UdTvCFUenKJo2j3Pzoffd+95nn/LGd35DilLVsyrgPX
         /tfGFhMQxshPwBuN7eGZb26e4FVyw5V0MY5bl5O9jWLNZqut6cKhq3kVhBhhOnmnc7
         R2GPRCQ1uwu4DJSECkFrISqD9eaQy7JvjEipjM1JP3chLfEFrAyjZ1rZzQd4AF7aW2
         udh0LkfRiuYfV9YwJBTQctuwuCWa6489+qusNHUYxFj17DV/ZPGsGYj+vYU/4CqDvl
         jp8ZrPs3M6n1w==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] builddeb: avoid invoking sub-shells where possible
Date:   Mon, 13 Jan 2020 15:48:38 +0900
Message-Id: <20200113064841.3946-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113064841.3946-1-masahiroy@kernel.org>
References: <20200113064841.3946-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The commands surrounded by ( ... ) is run in a sub-shell, but you do
not have to invoke it for every single line.

Use just one ( ... ) for creating debian/hdrsrcfiles.

For tar, use -C option instead.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 9b92745bf13a..7c561ffe1de0 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -165,21 +165,34 @@ EOF
 done
 
 # Build kernel header package
-(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > debian/hdrsrcfiles
-(cd $srctree; find include scripts -type f -o -type l) >> debian/hdrsrcfiles
-(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> debian/hdrsrcfiles
-(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> debian/hdrsrcfiles
-if is_enabled CONFIG_STACK_VALIDATION; then
-	echo tools/objtool/objtool >> debian/hdrobjfiles
-fi
-find arch/$SRCARCH/include Module.symvers include scripts -type f >> debian/hdrobjfiles
-if is_enabled CONFIG_GCC_PLUGINS; then
-	find scripts/gcc-plugins -name \*.so >> debian/hdrobjfiles
-fi
+(
+	cd $srctree
+	find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
+	find include scripts -type f -o -type l
+	find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
+	find arch/$SRCARCH -name include -type f
+
+	if [ -d arch/$SRCARCH/scripts ]; then
+		find arch/$SRCARCH/scripts -type f
+	fi
+) > debian/hdrsrcfiles
+
+{
+	if is_enabled CONFIG_STACK_VALIDATION; then
+		find tools/objtool -type f -executable
+	fi
+
+	find arch/$SRCARCH/include Module.symvers include scripts -type f
+
+	if is_enabled CONFIG_GCC_PLUGINS; then
+		find scripts/gcc-plugins -name \*.so -o -name gcc-common.h
+	fi
+} > debian/hdrobjfiles
+
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-(cd $srctree; tar -c -f - -T -) < debian/hdrsrcfiles | (cd $destdir; tar -xf -)
-tar -c -f - -T - < debian/hdrobjfiles | (cd $destdir; tar -xf -)
+tar -c -f - -C $srctree -T debian/hdrsrcfiles | tar -xf - -C $destdir
+tar -c -f - -T debian/hdrobjfiles | tar -xf - -C $destdir
 cp $KCONFIG_CONFIG $destdir/.config # copy .config manually to be where it's expected to be
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
 rm -f debian/hdrsrcfiles debian/hdrobjfiles
-- 
2.17.1

