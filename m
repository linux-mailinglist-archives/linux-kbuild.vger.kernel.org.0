Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD2C124BCC
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2019 16:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfLRPf0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 10:35:26 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:50784 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbfLRPfZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 10:35:25 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBIFYQjT027260;
        Thu, 19 Dec 2019 00:34:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBIFYQjT027260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576683267;
        bh=vr+kfw+UdhSf2hUfOR0RaGQx/oD7qidfiBWZc/GiY68=;
        h=From:To:Cc:Subject:Date:From;
        b=tXl4szyoWcZKl0uD0jpCwfnubNbnCCUMflulOTsL+7Jb58kjwPt+KnWsIu3EYNgnO
         dNyXt+Gq9iT4WcdC4yMcvmBIl+UKbq4gPWy/dumFo1MRwP2GnO7iIcSulcdMR8uYTi
         PwUzwylO07qX1qJ6MCF+G833WanqKOmA/Ue1RkFq7yQJ7Py061s59IaH3+ChK7l3+U
         4U7036+McnvaCAfHtArAvWngkaMNwkA3rCF2Hfip9nZKW2Y9g6rz+i5Zi0ugzQb4nb
         xObewx8Opxy/vQAYrSlGZ1RdU8YzzQZWAM0yMJcz1H78XjpiMM2S7ezYsF5WZiHCi+
         dlGDgG7t/WAzw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: detect missing include guard for exported headers
Date:   Thu, 19 Dec 2019 00:34:21 +0900
Message-Id: <20191218153422.14557-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adding an include guard to every header file is good practice in case
it is included multiple times.

Exported headers are compile-tested for the comprehensive sanity checks.
Let's include the same header twice. If an include guard is missing,
the header will fail to build due to redefinition of something.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

 usr/include/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 84598469e6ff..e90f5f7903bb 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -93,10 +93,11 @@ header-test- += asm-generic/%
 
 extra-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
+# Include the header to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -S -o /dev/null -x c /dev/null \
-			$(if $(filter-out $(header-test-), $*.h), -include $<); \
+			$(if $(filter-out $(header-test-), $*.h), -include $< -include $<); \
 		$(PERL) $(srctree)/scripts/headers_check.pl $(obj) $(SRCARCH) $<; \
 		touch $@
 
-- 
2.17.1

