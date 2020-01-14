Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4646413B1BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2020 19:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgANSLb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jan 2020 13:11:31 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:34475 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbgANSLb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jan 2020 13:11:31 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47xz6l4YtLz1p;
        Tue, 14 Jan 2020 19:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1579025488; bh=GloLZ5z++1Zxfj3fPfs6lgSK94B1ofTLcLm957oZolY=;
        h=Date:From:Subject:To:Cc:From;
        b=idXTrc1A0a85ieZI9LO9PwgaOjtSjTv2Xr1oZXRYv5VCKJ3dPOHV8E9s47htBnJwI
         MYvGqfqLG30wh9GKV+T3YhUYTOO6Xyrph6C8bbsXzgd7oa4KmnPdiS+O3ryw4Hn1Rc
         27I+cexzwNtoh7cu1WbXHovcixJtp8dpU/54h2+eiXf2iwO/e0Ha3j+gtj5xXwdDau
         KYckQuPkfwVVJ0hbxFWRdR8E3Qzz3QPlXOl3LPAGIeTPWqgeViTTP4e9It1CFJKxLI
         osdDcpcPeN7oTifUgFP8oxZPi+34wpyo5Euo0xL32mDwSAyVZwZ+BDH4izVlOnCe5V
         uWhuH/yUI7frQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 14 Jan 2020 19:11:26 +0100
Message-Id: <e026b0d7a2eceaa1745a001baa9f950ce546addb.1579025325.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2] builddeb: allow selection of .deb compressor
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Select deb compression using KDEB_COMPRESS make variable. This allows to
use gzip compression for local or test builds, and that's way faster
than now-default xz compression.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 v2: rename KPKG_COMPRESS to KDEB_COMPRESS as suggested by Masahiro Yamada
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c4c580f547ef..b68aaeece7c9 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -43,7 +43,7 @@ create_package() {
 
 	# Create the package
 	dpkg-gencontrol -p$pname -P"$pdir"
-	dpkg --build "$pdir" ..
+	dpkg-deb ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
 }
 
 version=$KERNELRELEASE
-- 
2.20.1

