Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 836C0AD7F8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 13:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404115AbfIILei (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 07:34:38 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:60097 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403880AbfIILeh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 07:34:37 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x89BYPw6012688;
        Mon, 9 Sep 2019 20:34:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x89BYPw6012688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568028866;
        bh=MSarGlnW9YOaZQr8nLXdZ/RHsS9R64+NgW7cxT9Bbn8=;
        h=From:To:Cc:Subject:Date:From;
        b=Q3fs9o3m9BOg5J/DkalhKGRPjLgAx3UPUN9aKw0GqKRlVIKbiSp7e7d3zhEFeRFDq
         PYL4zEMjhaovA7gYIYzpHk7DikEznHO6NusBsPzPkp0fVFIWIPZYgh1SmgBCOJ0IQ9
         heD93HRUsOT23pmAaSlEHkVLjeWMNF4aWce9g6UWaYTuzcxY4VWkwPHX9ymmIMcfQU
         ObWXb9arotJ1nJSH2MYM2schM0p+qyoyRQdUoFzSR4FmZVPNvDzDiJzj362QZ0RaWb
         e8CqamjHtTQptro5TSaYEBs5UVr/7w7Zt0Xu5NBAMP+88E5UuUQ/KSI59WaojHNKAK
         6b83kbWQDUCug==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Lucas De Marchi <lucas.demarchi@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] modpost: use MODULE_INFO() for __module_depends
Date:   Mon,  9 Sep 2019 20:34:22 +0900
Message-Id: <20190909113423.2289-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This makes *.mod.c much more readable. I confirmed depmod still
produced the same modules.dep file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f277e116e0eb..480c7b60153b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2250,10 +2250,7 @@ static void add_depends(struct buffer *b, struct module *mod)
 			s->module->seen = is_vmlinux(s->module->name);
 
 	buf_printf(b, "\n");
-	buf_printf(b, "static const char __module_depends[]\n");
-	buf_printf(b, "__used\n");
-	buf_printf(b, "__attribute__((section(\".modinfo\"))) =\n");
-	buf_printf(b, "\"depends=");
+	buf_printf(b, "MODULE_INFO(depends, \"");
 	for (s = mod->unres; s; s = s->next) {
 		const char *p;
 		if (!s->module)
@@ -2271,7 +2268,7 @@ static void add_depends(struct buffer *b, struct module *mod)
 		buf_printf(b, "%s%s", first ? "" : ",", p);
 		first = 0;
 	}
-	buf_printf(b, "\";\n");
+	buf_printf(b, "\");\n");
 }
 
 static void add_srcversion(struct buffer *b, struct module *mod)
-- 
2.17.1

