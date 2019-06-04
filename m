Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 277F23441E
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfFDKPj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:15:39 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39189 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfFDKPj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:39 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC7I032511;
        Tue, 4 Jun 2019 19:14:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC7I032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643265;
        bh=PpZBMxg4bzgoXAd/8YiPn6tt8q7c+h3C7+mX9vii/zs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gCSIv1QPdcRJ6xQilbXbvoLZr6xt90IOw0qoumntl15OKD2jRyvNLwoG/RvooA59G
         flhdZjogSeqZ2Ca9ZJnfoz2j1/9CcYv0RAgmP2e84uL+3tCg6ZcLHNgp1Rrrnm7yGd
         m5BKXDqli36feukDrAYpvuLIkKT012GanppJ/E833lTAY1/VKoWkxgrpeIXrLH71Ev
         67Vok6y5uFUNN4S/55QLFP3OGBmYGfZ0Zikq5CN1HC4eMD+iVJGDJHYsalGxZTVGBC
         0qCaxPdmkiJQIpnoZvNyXrxPCkSxJTq4WrQjMyzoZ7v6G2Dz0P6Jj9YB8DbfIJ96jz
         deNDGwsF1dZ+g==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/15] kbuild: deb-pkg: do not run headers_check
Date:   Tue,  4 Jun 2019 19:14:06 +0900
Message-Id: <20190604101409.2078-13-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is absolutely fine to add extra sanity checks in package scripts,
but it is not necessary to do so.

This is already covered by the daily compile-testing (0day bot etc.)
because headers_check is run as a part of the normal build process
when CONFIG_HEADERS_CHECK=y.

Replace it with the newly-added "make headers".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b03dd56a4782..e8ca6dc97e96 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -130,7 +130,7 @@ if is_enabled CONFIG_MODULES; then
 fi
 
 if [ "$ARCH" != "um" ]; then
-	$MAKE -f $srctree/Makefile headers_check
+	$MAKE -f $srctree/Makefile headers
 	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
 fi
 
-- 
2.17.1

