Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37C5F13C945
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2020 17:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgAOQ0h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jan 2020 11:26:37 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:58902 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbgAOQ0h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jan 2020 11:26:37 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 00FGPX3D015075;
        Thu, 16 Jan 2020 01:25:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 00FGPX3D015075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579105536;
        bh=gZ1tQR0oF7mVTSCbFvPvL7tdZTj4E7ydMnWZsVBinlI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gl9akiXqlGKyRdP38V6y52S2PnAsNXth0HcyFKetp8G197JKZkXg1RABArt05XdKc
         MgYrWxyR3QvlfzYFepw01VijZSsj9pwP+PY2cqSVC5eSxg217F6LDAS70urYXoLWj3
         Zlk9Or/lzo+fvxbJkK5Hu4I67CwsHOKOvzUwQ4HTUZwYxt9SkbG8vaNR7TuPmSg7pg
         /i3RUgD1kcOWVWDpfvGo+GhM3FkLY8C7lb9D0Hb13s1ZryiaWnNMMUxUEsBqhEt0lC
         VEF8lodgb4eJfVN+oJZCNpsWghB/R1fO1SW0cpUs0bHHsUWQ/7ngWtkqAzV807THvY
         UtbXFbGlbdXgA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] builddeb: avoid invoking sub-shells where possible
Date:   Thu, 16 Jan 2020 01:25:26 +0900
Message-Id: <20200115162529.11089-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115162529.11089-1-masahiroy@kernel.org>
References: <20200115162529.11089-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The commands surrounded by ( ... ) is run in a sub-shell, but you do
not have to spawn a sub-shell for every single line.

Use just one ( ... ) for creating debian/hdrsrcfiles.

For tar, use -C option instead.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
 - fix misconversion pointed out by Ben

 scripts/package/builddeb | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 9b92745bf13a..7d7e0abe62b6 100755
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
+	find arch/$SRCARCH/include -type f
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
+		find scripts/gcc-plugins -name \*.so
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

