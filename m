Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238751E9DAF
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgFAF6X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:23 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40015 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLo023694;
        Mon, 1 Jun 2020 14:57:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLo023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991061;
        bh=+UGagzfZCEaC9du0sSFD0E//kPkremizC8SiAGDLSL4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Liu9h2NkY5vyjoNvnz+ZPp6QkwIR0VLZbOtzTPDnxXPjMqaoZ11QEmMCYD30vpQ5s
         YV//+F/kORl4HNT0F0Zp8vRifkY1xCgcYkGu9D9nyGyTNaItyagK/PqwO8hU2Admaw
         S8urkaNSDDckl9aCwoy37qYoe8looaopGC1luCmpg3CFMpk3ytY0qZei3VLG+UWg0l
         570eJ6olBuj3EEBoAuTecRHdcR0bh/I4KbRu9Z3j5lrwe/vhhGcd9yRtbV52zBGINe
         URMIEcz8VNZ2OyYgvUO5PLi3pRjT+W7SoVafU4aEzadFsDN3QM00nwyiyRFyYR2X8i
         tixyMgO00Gc5A==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 11/37] modpost: track if the symbol origin is a dump file or ELF object
Date:   Mon,  1 Jun 2020 14:57:05 +0900
Message-Id: <20200601055731.3006266-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The meaning of sym->kernel is obscure; it is set for in-kernel symbols
loaded from Modules.symver. This happens only when we are building
external modules, and it is used to determine whether to dump symbols
to $(KBUILD_EXTMOD)/Modules.symver

It is clearer to remember whether the symbol or module came from a dump
file or ELF object.

This changes the KBUILD_EXTRA_SYMBOLS behavior. Previously, symbols
loaded from KBUILD_EXTRA_SYMBOLS are accumulated into the current
$(KBUILD_EXTMOD)/Modules.symver

Going forward, they will be only used to check symbol references, but
not dumped into the current $(KBUILD_EXTMOD)/Modules.symver. I believe
this makes more sense.

sym->vmlinux will have no user. Remove it too.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 15 +++++----------
 scripts/mod/modpost.h |  1 +
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5224a02edbf2..60f35b89cea2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -161,9 +161,6 @@ struct symbol {
 	int crc_valid;
 	char *namespace;
 	unsigned int weak:1;
-	unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
-	unsigned int kernel:1;     /* 1 if symbol is from kernel
-				    *  (only for external modules) **/
 	unsigned int is_static:1;  /* 1 if symbol is not global */
 	enum export  export;       /* Type of export */
 	char name[];
@@ -398,8 +395,6 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	}
 
 	s->module = mod;
-	s->vmlinux   = is_vmlinux(mod->name);
-	s->kernel    = 0;
 	s->export    = export;
 	return s;
 }
@@ -2427,7 +2422,7 @@ static void write_if_changed(struct buffer *b, const char *fname)
 /* parse Module.symvers file. line format:
  * 0x12345678<tab>symbol<tab>module<tab>export<tab>namespace
  **/
-static void read_dump(const char *fname, unsigned int kernel)
+static void read_dump(const char *fname)
 {
 	unsigned long size, pos = 0;
 	void *file = grab_file(fname, &size);
@@ -2465,9 +2460,9 @@ static void read_dump(const char *fname, unsigned int kernel)
 				have_vmlinux = 1;
 			mod = new_module(modname);
 			mod->skip = 1;
+			mod->from_dump = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
-		s->kernel    = kernel;
 		s->is_static = 0;
 		sym_set_crc(symname, crc);
 		sym_update_namespace(symname, namespace);
@@ -2487,7 +2482,7 @@ static int dump_sym(struct symbol *sym)
 {
 	if (!external_module)
 		return 1;
-	if (sym->vmlinux || sym->kernel)
+	if (sym->module->from_dump)
 		return 0;
 	return 1;
 }
@@ -2606,11 +2601,11 @@ int main(int argc, char **argv)
 	}
 
 	if (kernel_read)
-		read_dump(kernel_read, 1);
+		read_dump(kernel_read);
 	while (extsym_start) {
 		struct ext_sym_list *tmp;
 
-		read_dump(extsym_start->file, 0);
+		read_dump(extsym_start->file);
 		tmp = extsym_start->next;
 		free(extsym_start);
 		extsym_start = tmp;
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 39f6c29fb568..b8b7a82d2ff7 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -119,6 +119,7 @@ struct module {
 	const char *name;
 	int gpl_compatible;
 	struct symbol *unres;
+	int from_dump;  /* 1 if module was loaded from *.symver */
 	int seen;
 	int skip;
 	int has_init;
-- 
2.25.1

