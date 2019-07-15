Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9778696E6
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2019 17:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387581AbfGOOCP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jul 2019 10:02:15 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:17722 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387569AbfGOOCO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 10:02:14 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6FE1sEE026807;
        Mon, 15 Jul 2019 23:01:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6FE1sEE026807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563199314;
        bh=MfHfQH0r0NYoAjaX8kb+7ydwqz5Gf3OCpDc6c++8CiE=;
        h=From:To:Cc:Subject:Date:From;
        b=hzcxE2yVBGbpeMy3C+mC8N6tlfde9HirP/3dGwgiXCIpWWzCkYRpdCB7QmHTn/+dY
         I2DFew1zkFWiFSU8mFq+oTYOfIpygqBcaN4xAFT0n8gGoA+tD1kVB3tZE5TIQzRN7C
         xrEErVAdEP6zvG6uecvhW+HVUOnT5RJcoRg1uM/WHyELvcY9/FuLYYIJXNG3wCg2jD
         le99t3g53kROdYfN36lMyF2CrWZoIt6j9meH7ekt4YDwG6SAwfTmEDS07iLuOnc9sx
         O9jaNwRH5Li9DOLng1v0T5esOh1w1JGOopESEcEKwa2zTppAml6a332e+gRXQCIFwK
         HQyrMZgZGgqwg==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove tag files by distclean instead of mrproper
Date:   Mon, 15 Jul 2019 23:01:49 +0900
Message-Id: <20190715140149.21330-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It takes somewhat long time to generate these tag files.
Keep such precious files until we run 'make distclean'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2c5d00ba537e..2d8e45f2a8df 100644
--- a/Makefile
+++ b/Makefile
@@ -1380,11 +1380,15 @@ CLEAN_FILES += modules.builtin.modinfo
 MRPROPER_DIRS  += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .tmp_objdiff
 MRPROPER_FILES += .config .config.old .version \
-		  Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
+		  Module.symvers \
 		  signing_key.pem signing_key.priv signing_key.x509	\
 		  x509.genkey extra_certificates signing_key.x509.keyid	\
 		  signing_key.x509.signer vmlinux-gdb.py
 
+# Directories & files removed with 'make distclean'
+DISTCLEAN_DIRS  +=
+DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
+
 # clean - Delete most, but leave enough to build external modules
 #
 clean: rm-dirs  := $(CLEAN_DIRS)
@@ -1417,9 +1421,14 @@ mrproper: clean $(mrproper-dirs)
 
 # distclean
 #
+distclean: rm-dirs  := $(wildcard $(DISTCLEAN_DIRS))
+distclean: rm-files := $(wildcard $(DISTCLEAN_FILES))
+
 PHONY += distclean
 
 distclean: mrproper
+	$(call cmd,rmdirs)
+	$(call cmd,rmfiles)
 	@find $(srctree) $(RCS_FIND_IGNORE) \
 		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
 		-o -name '*.bak' -o -name '#*#' -o -name '*%' \
-- 
2.17.1

