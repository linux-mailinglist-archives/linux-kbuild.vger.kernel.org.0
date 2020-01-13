Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56669138BFB
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2020 07:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgAMGtm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 01:49:42 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:50772 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgAMGtl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 01:49:41 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 00D6mj4v028522;
        Mon, 13 Jan 2020 15:48:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 00D6mj4v028522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578898127;
        bh=chiuS9+WebBejR+cotF9BxmICGPbZmTDz5VP5WMGOxg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Iq+vTDEYkzJ/OjIWKEWkbTaSBiwcuPGm+nBuZOUCmdJCiu0khxk3qy4rGCaikQSI2
         hqqTddu8XNLKsicm0j5QR7/zFUOBfuEqjxO4d8AMR38z8gjriHUIE85hf54dSOicuf
         cdRxpwuaWAGt7nbAkb1dMy5U5fKZ3NY/1vIhyVVDbisWImWQGNOH8rjzi4sEa5Hjl1
         vj2GNald9MniXcxjB0ycopsjx0jd/WjBtYkKp+IyLS/MPByvPpcG9J1z6IPgLIR+py
         MtANIg9dUe116HSp9fuwHGAyOWxDRsR0ctXjZP784BdeFqoIAidU+lakN0wiigQ6FP
         Y0yQyaLr7oWsA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] builddeb: match temporary directory name to the package name
Date:   Mon, 13 Jan 2020 15:48:36 +0900
Message-Id: <20200113064841.3946-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113064841.3946-1-masahiroy@kernel.org>
References: <20200113064841.3946-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The temporary directory names, debian/hdrtmp (linux-headers package)
and debian/headertmp (linux-libc-dev package) are confusing.

Matching the directory name to the package name is clearer, IMHO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index eb067d6f1370..0a0a7c1447f4 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -47,10 +47,10 @@ create_package() {
 }
 
 version=$KERNELRELEASE
-tmpdir="$objtree/debian/tmp"
-kernel_headers_dir="$objtree/debian/hdrtmp"
-libc_headers_dir="$objtree/debian/headertmp"
-dbg_dir="$objtree/debian/dbgtmp"
+tmpdir="$objtree/debian/linux-image"
+kernel_headers_dir="$objtree/debian/linux-headers"
+libc_headers_dir="$objtree/debian/linux-libc-dev"
+dbg_dir="$objtree/debian/linux-image-dbg"
 packagename=linux-image-$version
 kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
-- 
2.17.1

