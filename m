Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A71E413C936
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2020 17:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgAOQ0L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jan 2020 11:26:11 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:58428 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgAOQ0L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jan 2020 11:26:11 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 00FGPX3B015075;
        Thu, 16 Jan 2020 01:25:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 00FGPX3B015075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579105535;
        bh=bNWJyqCxP966kt6UgpmkmKoVzlzhn+sJ9RduGT9o9Zg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TS7n4fGh6+5Wo6/YAAcbqj1QRY3g0QdaU9+FYvCu/ixZ4IW1O/LKlagyciMS8fPt1
         zk2R9NOyfbEX5QbAaATaNROAi4DnCNE/EQiyY647LPCZGVPMNFTWdPlltA34LTQHt2
         H3ZNyXPq5SyOOwAMi0uq7fVVcdCuwnQB0AMHrSUX9aQ3DMirOICNrUQEuTdXsro9/W
         BpMojQU54/D+w07rfiknS+RP/vz6IPM8ejieQyMAzj8lVYyEGmwgjid1WsNvpODAE2
         WBGxzVe97F1bHxuIxeZQhGhMLVyCowM15yYzXPc0Q/G5f1l1f5IUVultgIHVCvCN3Z
         HPQxi08+TI2RA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] builddeb: match temporary directory name to the package name
Date:   Thu, 16 Jan 2020 01:25:24 +0900
Message-Id: <20200115162529.11089-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115162529.11089-1-masahiroy@kernel.org>
References: <20200115162529.11089-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The temporary directory names, debian/hdrtmp (linux-headers package)
vs debian/headertmp (linux-libc-dev package), are confusing.

Matching the directory name to the package name is clearer, IMHO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

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

