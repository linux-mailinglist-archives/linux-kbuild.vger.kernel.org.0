Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6A9FCC0A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 18:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfKNRmd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 12:42:33 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:64706 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfKNRmd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:42:33 -0500
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id xAEHgSo3028428;
        Fri, 15 Nov 2019 02:42:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xAEHgSo3028428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573753350;
        bh=hD5s6ssP8dZQZE8/9P7xQCgsdQSDXm2EH1M7tYSApOw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ifhmGmVuudFMgB3vHiQXBnrvLtcIZ9Nlh1wHNO67OvAukdevVIYWDCrLXApxix151
         2u3oHfKOrB4v320O67MMooe1vhNlxQQk1IYJkv0KdxwrcErvbOUUCjzDX2JoqGsqFh
         6Uh1M6PFTxtk/52cMD/U6VOm9X6bfSQMDzCwwG8UNObHPwMU1qkxk9beRKY7WtTDyN
         hnV968SKvI4xd2PRmrGMtROrBzyU3VJsPrQGouylkSFqhOvjzb3vlH67+s+1Lovr+E
         IrVHq9owCxQYXCq5w0Bu0bma1/7T+agp7fwDnxzHsd/UbVMUVu+QYR1EqUTIRF1RT2
         4eSIYJoe4FtmQ==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] modpost: rename handle_modversions() to handle_symbol()
Date:   Fri, 15 Nov 2019 02:42:23 +0900
Message-Id: <20191114174226.7201-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This function handles not only modversions, but also unresolved
symbols, export symbols, etc.

Rename it to a more proper function name.

While I was here, I also added the 'const' qualifier to *sym.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d9418c58a8c0..6735ae3da4c2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -683,8 +683,8 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 	return 0;
 }
 
-static void handle_modversions(struct module *mod, struct elf_info *info,
-			       Elf_Sym *sym, const char *symname)
+static void handle_symbol(struct module *mod, struct elf_info *info,
+			  const Elf_Sym *sym, const char *symname)
 {
 	unsigned int crc;
 	enum export export;
@@ -2051,7 +2051,7 @@ static void read_symbols(const char *modname)
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 
-		handle_modversions(mod, &info, sym, symname);
+		handle_symbol(mod, &info, sym, symname);
 		handle_moddevtable(mod, &info, sym, symname);
 	}
 
-- 
2.17.1

