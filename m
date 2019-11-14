Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E869FCC06
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 18:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfKNRmi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 12:42:38 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:64769 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfKNRmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:42:37 -0500
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id xAEHgSo5028428;
        Fri, 15 Nov 2019 02:42:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xAEHgSo5028428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573753351;
        bh=7sWrVrerKjQiDhUBDmeGbSq4bDTJ+Bje+3qlC+uY3K4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RYV8mXWkF+Wk3CX/SWhnM2IhCdR6GZvStWrJh6VBrX0EfGhlE1FoRjAKhHssIr9me
         jScCY2jt0fbs7avzxNTAGhrCjLmpH7Fg1co6JRFFioq9kSDViLywlAfjve3SqjARN1
         ovZx2lB1PKCwOlAmg2PnOHMH4kobjMVs0CZHxRskKIMOBZRf1S0bUbK1WdrVGlRCiM
         8lioqRlyNSQcRxdkrTXdgvtAWe2cOG+JnY8IePBcwZBCp8+PVjaEdTLzLUSaBVOpM3
         P3aWR3PVDfbAZaX08pVViNJ7J9iRwgumhOJL2o9ldZnMgApOsXMLHQUAbdQaV1Q7VY
         uY/dt0gFUCoPw==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] modpost: do not set ->preloaded for symbols from Module.symvers
Date:   Fri, 15 Nov 2019 02:42:25 +0900
Message-Id: <20191114174226.7201-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that there is no overwrap between symbols from ELF files and
ones from Module.symvers.

So, the 'exported twice' warning should be reported irrespective
of where the symbol in question came from.

The exceptional case is external module; in some cases, we build
an external module to provide a different version/variant of the
corresponding in-kernel module, overriding the same set of exported
symbols.

You can see this use-case in upstream; tools/testing/nvdimm/libnvdimm.ko
replaces drivers/nvdimm/libnvdimm.ko in order to link it against mocked
version of core kernel symbols.

So, let's relax the 'exported twice' warning when building external
modules. The multiple export from external modules is warned only
when the previous one is from vmlinux or itself.

With this refactoring, the ugly preloading goes away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 73bdf27c41fe..06086105011f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -169,7 +169,6 @@ struct symbol {
 	unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
 	unsigned int kernel:1;     /* 1 if symbol is from kernel
 				    *  (only for external modules) **/
-	unsigned int preloaded:1;  /* 1 if symbol from Module.symvers */
 	unsigned int is_static:1;  /* 1 if symbol is not global */
 	enum export  export;       /* Type of export */
 	char name[0];
@@ -394,7 +393,8 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	if (!s) {
 		s = new_symbol(name, mod, export);
 	} else {
-		if (!s->preloaded) {
+		if (!external_module || is_vmlinux(s->module->name) ||
+		    s->module == mod) {
 			warn("%s: '%s' exported twice. Previous export was in %s%s\n",
 			     mod->name, name, s->module->name,
 			     is_vmlinux(s->module->name) ? "" : ".ko");
@@ -403,7 +403,6 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 			s->module = mod;
 		}
 	}
-	s->preloaded = 0;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
 	s->export    = export;
@@ -2480,7 +2479,6 @@ static void read_dump(const char *fname, unsigned int kernel)
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
 		s->kernel    = kernel;
-		s->preloaded = 1;
 		s->is_static = 0;
 		sym_set_crc(symname, mod, crc);
 		sym_update_namespace(symname, namespace);
-- 
2.17.1

