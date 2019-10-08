Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D2DCF940
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2019 14:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730957AbfJHMGn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Oct 2019 08:06:43 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:28282 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfJHMGn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 08:06:43 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x98C6135021176;
        Tue, 8 Oct 2019 21:06:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x98C6135021176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570536363;
        bh=ky+LkOLJvLz7GQrqNxbqax/IF2ZqOBtCIPZVaij14hc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CouozuWhUbGuiISjMHzx2mHgMpE1ijsXTbEu0z88EKiN2NIg+GP4wXu7zejtJufXU
         VdslYdQ6cSgR1rY5hOEVSwTz1Abl5LdojENGoCg79DJjhwL2ni9zz7SlTUYnNdTfql
         ZgO3f+ze824TMw60Msc3GXYj9czZVPev3B1BVTtvqagNORSkHIcsC2nQztuDbU5V2i
         H8rUguRBm7+6f03ywI9FNe2Z1/hNTj0D6aWHZ3PVdHefZ485eX+RPIYh0zveXJlz8L
         SpQwkuXA+wRtsDlrYXJcMuesotxo/q+jFphzS2+7D6eB/u0kMDclL6GSCtgNVcJAqO
         rFFbYC5xduR8w==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] kheaders: optimize header copy for in-tree builds
Date:   Tue,  8 Oct 2019 21:05:54 +0900
Message-Id: <20191008120556.4263-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008120556.4263-1-yamada.masahiro@socionext.com>
References: <20191008120556.4263-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script copies headers by the cpio command twice; first from
srctree, and then from objtree. However, when we building in-tree,
we know the srctree and the objtree are the same. That is, all the
headers copied by the first cpio are overwritten by the second one.

Skip the first cpio when we are building in-tree.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/gen_kheaders.sh | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 5f8e664977f8..dd40a1b86f96 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -56,14 +56,16 @@ fi
 rm -rf $cpio_dir
 mkdir $cpio_dir
 
-pushd $srctree > /dev/null
-for f in $dir_list;
-	do find "$f" -name "*.h";
-done | cpio --quiet -pd $cpio_dir
-popd > /dev/null
+if [ "$building_out_of_srctree" ]; then
+	pushd $srctree > /dev/null
+	for f in $dir_list
+		do find "$f" -name "*.h";
+	done | cpio --quiet -pd $cpio_dir
+	popd > /dev/null
+fi
 
-# The second CPIO can complain if files already exist which can
-# happen with out of tree builds. Just silence CPIO for now.
+# The second CPIO can complain if files already exist which can happen with out
+# of tree builds having stale headers in srctree. Just silence CPIO for now.
 for f in $dir_list;
 	do find "$f" -name "*.h";
 done | cpio --quiet -pd $cpio_dir >/dev/null 2>&1
-- 
2.17.1

