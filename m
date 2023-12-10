Return-Path: <linux-kbuild+bounces-309-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D654080B91E
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 06:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046E4280ECB
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 05:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52DB1842;
	Sun, 10 Dec 2023 05:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yHKV5W91"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762B5F3;
	Sat,  9 Dec 2023 21:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=e252i3QyEXQ3DRfNf27c5mV3caOOKZItK0UufmKslqE=; b=yHKV5W91gPxA1Sd0QlGRSlhrjq
	GOz9541vMzKSmS6hX/cMZ12f5XCgodR1+SqAUB3pTAf1+T81z3xQa/UtRY5eBytYbTZKt3lY8tPAO
	lTxzd1iLb9jwHC+dggeU8CHFDHZ1b0BnMgXODEtkgrXvz5p4+9m1zHsuMKBK6OzfmY1NaZZPQuWqT
	K2knvPKpPrfVnLRRkm0kkWZsiEoWK9wupuS5gNQAet2sCORt9DhmjRxOckk17G5xMW+j4tTXVFX2M
	gv443gd96elz5aL+/l425twVQNkTuIvr4ggzXWf1ddHyXe4+sHB7iZnwUfhmH6VexbRsVa4y5ssxo
	8b2MAuQw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rCCSU-000zr6-1u;
	Sun, 10 Dec 2023 05:34:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	"Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] usr/Kconfig: fix typos of "its"
Date: Sat,  9 Dec 2023 21:34:29 -0800
Message-ID: <20231210053429.23146-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use "Its" or "its" for possessive instead of "it's" (contraction
for "it is").

Fixes: db2aa7fd15e8 ("initramfs: allow again choice of the embedded initram compression algorithm")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org
Cc: "Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 usr/Kconfig |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -- a/usr/Kconfig b/usr/Kconfig
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -185,9 +185,9 @@ config INITRAMFS_COMPRESSION_LZO
 	bool "LZO"
 	depends on RD_LZO
 	help
-	  It's compression ratio is the second poorest amongst the choices. The
-	  kernel size is about 10% bigger than gzip. Despite that, it's
-	  decompression speed is the second fastest and it's compression speed
+	  Its compression ratio is the second poorest amongst the choices. The
+	  kernel size is about 10% bigger than gzip. Despite that, its
+	  decompression speed is the second fastest and its compression speed
 	  is quite fast too.
 
 	  If you choose this, keep in mind that you may need to install the lzop

