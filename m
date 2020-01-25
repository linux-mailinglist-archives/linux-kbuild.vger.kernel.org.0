Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82280149348
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Jan 2020 05:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbgAYENN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 23:13:13 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:28259 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgAYENM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:13:12 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 00P4CcjV032210;
        Sat, 25 Jan 2020 13:12:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 00P4CcjV032210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579925561;
        bh=Dso1H1TBmUhcKsqk7LnsP10aar5lfgKI054ROI08iKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wsRAS3aYbUlaNw0y6FUjyvzUNxVAwRbSOB81zYiJiIB/KJtBVlvHYl/OnfW3hTFyx
         9OsfvTgiBcjzeR3K1+3NJ83TRHFBjRLyEe2pso0pE9IwJgs2TxI7MOwAzeUzIAwXty
         WDa5HD/pJ5TeVoxd/CI4F7QVGYuR4JjbpCQwj51MQu+JjueTJSNMiaZXn+MpwIZ+Cr
         QrLHXYXPWVyqshpibJdft3B9xoGAljV+wYKUlkqii6H1BvF8nO1bu5O8ksqY4OqXkg
         CPg+7XzVdUFfpJ84Rkyj8nL+fvOfNU4n76W82joiFS3DHAqrjqoYU1a3GsGKQuvUTy
         8cYYdt+pEe7tg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v3 5/7] builddeb: remove redundant make for ARCH=um
Date:   Sat, 25 Jan 2020 13:12:33 +0900
Message-Id: <20200125041235.8856-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200125041235.8856-1-masahiroy@kernel.org>
References: <20200125041235.8856-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The kernel build has already been done before builddeb is invoked.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3: None
Changes in v2: None

 scripts/package/builddeb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index a73e0d5377e9..731b5d0b2422 100755
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

