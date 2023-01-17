Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6560C66D59E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 06:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235375AbjAQFbJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 00:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbjAQFbI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 00:31:08 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5904923D96
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Jan 2023 21:31:05 -0800 (PST)
From:   Thomas =?utf-8?q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1673933463;
        bh=cFgA4k9RHMj5jryFtcqgjqMSWi3g9S3EzACx/77zB4E=;
        h=From:Date:Subject:To:Cc:From;
        b=U+K3OSXUKc9gZ9ZAGPrfSRf242HyxCiYnfjvGuBhN9pBEltGT8YJ+Natlkab3qscE
         g1y4UX9EyzBU7p1QwhP0JsPgC2q2/kYC8dofIFtSLAuYd7C3rOEc0v2pdP2hnntlhT
         oH1H1Xse6OdqgJcmjFUwSNeDd8toSHAvHvGGLS8I=
Date:   Tue, 17 Jan 2023 05:30:43 +0000
Subject: [PATCH] kheaders: explicitly validate existence of cpio command
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-Id: <20230117-kernel-kheaders-cpio-v1-1-058d3e1c8621@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAIMyxmMC/x2NQQqDMBAAvyJ77kKSHoL9SukhWVezGKLs0iKIf
 2/wOAPDnGCswgav4QTln5hsrYN/DEAltYVRps4QXHg67yOurI0rroXTxGpIu2wY5kjRZRrJj9DT
 nIwxa2pUety+tXa5K89y3K/357r+FnDRknsAAAA=
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Amy Parker <apark0006@student.cerritos.edu>,
        Thomas =?utf-8?q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673933461; l=1764;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=cFgA4k9RHMj5jryFtcqgjqMSWi3g9S3EzACx/77zB4E=;
 b=CmqjtULPc++BBL8KMte2/p7Db04hthB/Lxbnfvr26oljSPiJaJEhUPeINNDMbQ0t2aptkkIc1nP1
 gp+TE8fPAMMMo1/s/wPDwGXw0crj6KLStuLnuxw5gUHWXwRj5WWt
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If the cpio command is not available the error emitted by
gen_kheaders.so is not clear as all output of the call to cpio is
discarded:

GNU make 4.4:

  GEN     kernel/kheaders_data.tar.xz
find: 'standard output': Broken pipe
find: write error
make[2]: *** [kernel/Makefile:157: kernel/kheaders_data.tar.xz] Error 127
make[1]: *** [scripts/Makefile.build:504: kernel] Error 2

GNU make < 4.4:

  GEN     kernel/kheaders_data.tar.xz
make[2]: *** [kernel/Makefile:157: kernel/kheaders_data.tar.xz] Error 127
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [scripts/Makefile.build:504: kernel] Error 2

Add an explicit check that will trigger a clear message about the issue:

  CHK     kernel/kheaders_data.tar.xz
./kernel/gen_kheaders.sh: line 17: type: cpio: not found

The other commands executed by gen_kheaders.sh are part of a standard
installation, so they are not checked.

Reported-by: Amy Parker <apark0006@student.cerritos.edu>
Link: https://lore.kernel.org/lkml/CAPOgqxFva=tOuh1UitCSN38+28q3BNXKq19rEsVNPRzRqKqZ+g@mail.gmail.com/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/gen_kheaders.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 473036b43c83..81b97f0f6556 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -14,6 +14,8 @@ include/
 arch/$SRCARCH/include/
 "
 
+type cpio > /dev/null
+
 # Support incremental builds by skipping archive generation
 # if timestamps of files being archived are not changed.
 

---
base-commit: d532dd102151cc69fcd00b13e5a9689b23c0c8d9
change-id: 20230117-kernel-kheaders-cpio-2f7c70bc9c19

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>
