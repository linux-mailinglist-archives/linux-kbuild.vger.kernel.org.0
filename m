Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2C7BAD7FA
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 13:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403880AbfIILej (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 07:34:39 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:60119 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404103AbfIILej (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 07:34:39 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x89BYPw7012688;
        Mon, 9 Sep 2019 20:34:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x89BYPw7012688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568028866;
        bh=qwVV+ymKu24KVZhw2r78oztqOJ1wcoVVFfPTdN1I4Ew=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ESJ4wZNUd6jlgvkXG32t74wGRLXE4TB3AQ81jyghI1D1F/YwNuZWxQTFyiu58XRxl
         SnLmzXb8AyOB/oHunoyhrxmD+EAck/seIvIdyudjQ4pvifp+sX8pUZ+AJF+SiXZk5h
         laA+1/arZUaoWKmYm9he2aTxCBmJWNl+Yzjs4NQajTucjfrue63e5w8KG49hTNop1V
         SnWWG4h8cdihm0zGUIaA8XP073uYUr9yI6yOtOUuvYWHFPuCOH3/9Q2Uik7O8ldCA2
         BqrymsyaVe9ZUOQfrmK5Azb4wcFfHg+F2zRRUQBCA4CWfyBZRbt9Km4s4jvhpDmID2
         psVgmNdqSYaKg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Lucas De Marchi <lucas.demarchi@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] modpost: use __section in the output to *.mod.c
Date:   Mon,  9 Sep 2019 20:34:23 +0900
Message-Id: <20190909113423.2289-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909113423.2289-1-yamada.masahiro@socionext.com>
References: <20190909113423.2289-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use the __section() shorthand. This avoids escaping double-quotes,
and improves the readability.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 480c7b60153b..0dd1bb6f6eec 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2159,7 +2159,7 @@ static void add_header(struct buffer *b, struct module *mod)
 	buf_printf(b, "MODULE_INFO(name, KBUILD_MODNAME);\n");
 	buf_printf(b, "\n");
 	buf_printf(b, "__visible struct module __this_module\n");
-	buf_printf(b, "__attribute__((section(\".gnu.linkonce.this_module\"))) = {\n");
+	buf_printf(b, "__section(.gnu.linkonce.this_module) = {\n");
 	buf_printf(b, "\t.name = KBUILD_MODNAME,\n");
 	if (mod->has_init)
 		buf_printf(b, "\t.init = init_module,\n");
@@ -2213,8 +2213,7 @@ static int add_versions(struct buffer *b, struct module *mod)
 
 	buf_printf(b, "\n");
 	buf_printf(b, "static const struct modversion_info ____versions[]\n");
-	buf_printf(b, "__used\n");
-	buf_printf(b, "__attribute__((section(\"__versions\"))) = {\n");
+	buf_printf(b, "__used __section(__versions) = {\n");
 
 	for (s = mod->unres; s; s = s->next) {
 		if (!s->module)
-- 
2.17.1

