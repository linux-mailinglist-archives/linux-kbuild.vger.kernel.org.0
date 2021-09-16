Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8538340D4CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Sep 2021 10:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235222AbhIPIpS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Sep 2021 04:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234462AbhIPIpR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Sep 2021 04:45:17 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47619C061766
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Sep 2021 01:43:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:39fa:3565:945d:98f4])
        by michel.telenet-ops.be with bizsmtp
        id uYju2500j3mHZPk06YjuzW; Thu, 16 Sep 2021 10:43:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQmzq-0053v0-Da; Thu, 16 Sep 2021 10:43:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQmzp-004qB0-Tm; Thu, 16 Sep 2021 10:43:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] sh: Add missing FORCE prerequisites in Makefile
Date:   Thu, 16 Sep 2021 10:43:53 +0200
Message-Id: <0771f164fcbba2fb425bf525400b8fab7079e539.1631781770.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

make:

    arch/sh/boot/Makefile:87: FORCE prerequisite is missing

Add the missing FORCE prerequisites for all build targets identified by
"make help".

Fixes: e1f86d7b4b2a5213 ("kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and filechk")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/boot/Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/sh/boot/Makefile b/arch/sh/boot/Makefile
index dded61296c9a00da..5c123f5b2797c08a 100644
--- a/arch/sh/boot/Makefile
+++ b/arch/sh/boot/Makefile
@@ -80,30 +80,30 @@ $(obj)/vmlinux.bin.xz: $(obj)/vmlinux.bin FORCE
 $(obj)/vmlinux.bin.lzo: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,lzo)
 
-$(obj)/uImage.bz2: $(obj)/vmlinux.bin.bz2
+$(obj)/uImage.bz2: $(obj)/vmlinux.bin.bz2 FORCE
 	$(call if_changed,uimage,bzip2)
 
-$(obj)/uImage.gz: $(obj)/vmlinux.bin.gz
+$(obj)/uImage.gz: $(obj)/vmlinux.bin.gz FORCE
 	$(call if_changed,uimage,gzip)
 
-$(obj)/uImage.lzma: $(obj)/vmlinux.bin.lzma
+$(obj)/uImage.lzma: $(obj)/vmlinux.bin.lzma FORCE
 	$(call if_changed,uimage,lzma)
 
-$(obj)/uImage.xz: $(obj)/vmlinux.bin.xz
+$(obj)/uImage.xz: $(obj)/vmlinux.bin.xz FORCE
 	$(call if_changed,uimage,xz)
 
-$(obj)/uImage.lzo: $(obj)/vmlinux.bin.lzo
+$(obj)/uImage.lzo: $(obj)/vmlinux.bin.lzo FORCE
 	$(call if_changed,uimage,lzo)
 
-$(obj)/uImage.bin: $(obj)/vmlinux.bin
+$(obj)/uImage.bin: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,uimage,none)
 
 OBJCOPYFLAGS_vmlinux.srec := -I binary -O srec
-$(obj)/vmlinux.srec: $(obj)/compressed/vmlinux
+$(obj)/vmlinux.srec: $(obj)/compressed/vmlinux FORCE
 	$(call if_changed,objcopy)
 
 OBJCOPYFLAGS_uImage.srec := -I binary -O srec
-$(obj)/uImage.srec: $(obj)/uImage
+$(obj)/uImage.srec: $(obj)/uImage FORCE
 	$(call if_changed,objcopy)
 
 $(obj)/uImage: $(obj)/uImage.$(suffix-y)
-- 
2.25.1

