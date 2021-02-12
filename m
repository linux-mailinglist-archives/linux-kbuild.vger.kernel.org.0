Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86AD0319A30
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 08:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhBLHXN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Fri, 12 Feb 2021 02:23:13 -0500
Received: from mx1.emlix.com ([136.243.223.33]:39612 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229611AbhBLHXL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 02:23:11 -0500
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 19B565FA8D;
        Fri, 12 Feb 2021 08:22:29 +0100 (CET)
From:   Rolf Eike Beer <eb@emlix.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        Daniel =?ISO-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] scripts: set proper OpenSSL include dir also for sign-file
Date:   Fri, 12 Feb 2021 08:22:27 +0100
Message-ID: <17347583.e8QBZkc1Fl@mobilepool36.emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fixes: 2cea4a7a1885bd0c765089afc14f7ff0eb77864e
Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Cc: stable@vger.kernel.org # 5.6.x
---
 scripts/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile b/scripts/Makefile
index 9de3c03b94aa..c36106bce80e 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -17,6 +17,7 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
+HOSTCFLAGS_sign-file.o = $(CRYPTO_CFLAGS)
 HOSTLDLIBS_sign-file = $(CRYPTO_LIBS)
 HOSTCFLAGS_extract-cert.o = $(CRYPTO_CFLAGS)
 HOSTLDLIBS_extract-cert = $(CRYPTO_LIBS)
-- 
2.30.0


-- 
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 Göttingen, Germany
Sitz der Gesellschaft: Göttingen, Amtsgericht Göttingen HR B 3160
Geschäftsführung: Heike Jordan, Dr. Uwe Kracke – Ust-IdNr.: DE 205 198 055

emlix - smart embedded open source


