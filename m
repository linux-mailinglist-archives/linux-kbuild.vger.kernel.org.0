Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B04B913C946
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2020 17:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgAOQ0h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jan 2020 11:26:37 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:58897 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbgAOQ0g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jan 2020 11:26:36 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 00FGPX3E015075;
        Thu, 16 Jan 2020 01:25:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 00FGPX3E015075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579105537;
        bh=sNE2F0kSkktCHvfxE2N29UtQt+eVh1lpwgFeM/VhRfg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q0ibsP24OCjTzgrN0oWHuS1fJgmOx3EojUf5fQVYvZrATOrt44OXAFqs4/qmjzKyj
         yuvHXZOvux1XywE1cr02JTpizEp6T1kcm6OWS31fCakIX+GIzpu4/OqeoS5OyZ5k5i
         TJ9fD2LYo4flKs6kTPrlty5v/q3vVYXgTe9TYMwhtu1gvOgdpBQj6jPKVQOaE2Dx/0
         D5r1iT5+L9LDURA1ilFTSCCwQxaeKkY6qCvMNjfcYkVJQkDaRBTl5iIZPSpSM33+t7
         LxuW7FOjVdSEBltWYfalCvINq2deuXOTtF5z816qGXEkcp/MXNW4nsY+rVDMRbo4YK
         Z7uT3yiliUDfA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] builddeb: remove redundant make for ARCH=um
Date:   Thu, 16 Jan 2020 01:25:27 +0900
Message-Id: <20200115162529.11089-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115162529.11089-1-masahiroy@kernel.org>
References: <20200115162529.11089-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The kernel build has already been done before builddeb is invoked.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/package/builddeb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 7d7e0abe62b6..650572497811 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -82,10 +82,9 @@ mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
 mkdir -p "$kernel_headers_dir/lib/modules/$version/"
 
-# Build and install the kernel
+# Install the kernel
 if [ "$ARCH" = "um" ] ; then
 	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin" "$tmpdir/usr/share/doc/$packagename"
-	$MAKE linux
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
 	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
 	gzip "$tmpdir/usr/share/doc/$packagename/config"
-- 
2.17.1

