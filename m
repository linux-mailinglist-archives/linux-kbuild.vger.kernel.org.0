Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39AF158DA1A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Aug 2022 16:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbiHIONs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Aug 2022 10:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234514AbiHIONq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Aug 2022 10:13:46 -0400
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1DCBC94;
        Tue,  9 Aug 2022 07:13:39 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 279EBOTX003402;
        Tue, 9 Aug 2022 23:11:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 279EBOTX003402
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1660054285;
        bh=SJHKDJS14TC3x4IU/wY7G+K3O9SoESvqIE5ewD6X5pI=;
        h=From:To:Cc:Subject:Date:From;
        b=d2+CtcSfXTucxJxlzO9K5fHK2UCbOkz/HleD7HswTKM8GLDEPF+292nrGxPZccOHD
         9ejIWOSDKQWQJazMmgaYCLDTLQfubiE493C7b/VK6YYEEbcudXC671ngPNLqIwmEYL
         c6VMNw93VjzFf2PywTpoLQ/o2wN8AIJE4GeHeEZzTN2JSU1BeaXavSc3BdGk4sELik
         pzWfUB9whpGKP5XLuqhSQGy3PBuMdd5aYGNqXZS8Vk+bHK8zt+elNrFL+5z4ywzczO
         xf4t7wgIffss6h+3Rt1z5APV8DosOLAaneAZJh6MhnfSQ1/sYZMuEc6qDlsdrlwfTK
         jk09APM8MrJtQ==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: fix module versioning when a symbol lacks valid CRC
Date:   Tue,  9 Aug 2022 23:11:17 +0900
Message-Id: <20220809141117.641543-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 7b4537199a4a ("kbuild: link symbol CRCs at final link,
removing CONFIG_MODULE_REL_CRCS"), module versioning is broken on
some architectures. Loading a module fails with "disagrees about
version of symbol module_layout".

On such architectures (e.g. ARCH=sparc build with sparc64_defconfig),
modpost shows a warning, like follows:

  WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.
  Is "_mcount" prototyped in <asm/asm-prototypes.h>?

Previously, it was a harmless warning (CRC check was just skipped),
but now wrong CRCs are used for comparison because invalid CRCs are
just skipped.

  $ sparc64-linux-gnu-nm -n vmlinux
    [snip]
  0000000000c2cea0 r __ksymtab__kstrtol
  0000000000c2ceb8 r __ksymtab__kstrtoul
  0000000000c2ced0 r __ksymtab__local_bh_enable
  0000000000c2cee8 r __ksymtab__mcount
  0000000000c2cf00 r __ksymtab__printk
  0000000000c2cf18 r __ksymtab__raw_read_lock
  0000000000c2cf30 r __ksymtab__raw_read_lock_bh
    [snip]
  0000000000c53b34 D __crc__kstrtol
  0000000000c53b38 D __crc__kstrtoul
  0000000000c53b3c D __crc__local_bh_enable
  0000000000c53b40 D __crc__printk
  0000000000c53b44 D __crc__raw_read_lock
  0000000000c53b48 D __crc__raw_read_lock_bh

Please notice __crc__mcount is missing here.

When the module subsystem looks up a CRC that comes after, it results
in reading out a wrong address. For example, when __crc__printk is
needed, the module subsystem reads 0xc53b44 instead of 0xc53b40.

All CRC entries must be output for correct index accessing. Invalid
CRCs will be unused, but are needed to keep the one-to-one mapping
between __ksymtab_* and __crc_*.

The best is to fix all modpost warnings, but several warnings are still
remaining on less popular architectures.

Fixes: 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS")
Reported-by: matoro <matoro_mailinglist_kernel@matoro.tk>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: matoro <matoro_mailinglist_kernel@matoro.tk>
---

 scripts/mod/modpost.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 8484c0798f28..22dc332eebfa 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2018,13 +2018,11 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 	/* record CRCs for exported symbols */
 	buf_printf(buf, "\n");
 	list_for_each_entry(sym, &mod->exported_symbols, list) {
-		if (!sym->crc_valid) {
+		if (!sym->crc_valid)
 			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
 			     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
 			     sym->name, mod->name, mod->is_vmlinux ? "" : ".ko",
 			     sym->name);
-			continue;
-		}
 
 		buf_printf(buf, "SYMBOL_CRC(%s, 0x%08x, \"%s\");\n",
 			   sym->name, sym->crc, sym->is_gpl_only ? "_gpl" : "");
-- 
2.34.1

