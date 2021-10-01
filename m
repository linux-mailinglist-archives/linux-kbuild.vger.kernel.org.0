Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D821A41E726
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351944AbhJAFfG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:06 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25304 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238424AbhJAFfG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:06 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVW000646;
        Fri, 1 Oct 2021 14:33:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVW000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066380;
        bh=un6DWX4+x7M43GD94+yMWT2UR1PL+dyvcY3QUplOGro=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fgBnzlvb6Y3jMWsqquY4X5nT8zeaS1ZtQ0OZ+fbbhJs0Wh7UwpuoXP0BCcRkeLtbo
         ugXKW0umUBsJMFk3ttSUk9265/Y8HMhpgjDESI23DZiHwRGpsmlvi/hNIUO7yybUxZ
         1asIjZRqGeMMqpgoMLZaHNj7lkNjQIxGxeaL4QZq/OZymRVr4Y1Ixewof3axtc8ZaM
         WmtsAkANIIs52TKiWiiOYBAJheUDoONtVFHo9TVSUU9ikPnT8ajZlR1a2lCCTsFLSs
         MTjnQHIB289gjGTu/p9EAg3uqaz6Fiuc5iHWf6OFazdjwmLNRaVtkn+896q2U/obUu
         syfjjP1VZduVA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] kconfig: refactor listnewconfig code
Date:   Fri,  1 Oct 2021 14:32:47 +0900
Message-Id: <20211001053253.1223316-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We can reuse __print_symbol() helper to print symbols for listnewconfig.
Only the difference is the format for "n" symbols.

This prints "CONFIG_FOO=n" instead of "# CONFIG_FOO is not set".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c      | 14 ++------------
 scripts/kconfig/confdata.c  |  5 +++++
 scripts/kconfig/lkc_proto.h |  1 +
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 310fdd408793..971da3598fe4 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -646,18 +646,8 @@ static void check_conf(struct menu *menu)
 
 		switch (input_mode) {
 		case listnewconfig:
-			if (sym->name) {
-				const char *val = sym_get_string_value(sym);
-				char *escaped = NULL;
-
-				if (sym->type == S_STRING) {
-					escaped = sym_escape_string_value(val);
-					val = escaped;
-				}
-
-				printf("%s%s=%s\n", CONFIG_, sym->name, val);
-				free(escaped);
-			}
+			if (sym->name)
+				print_symbol_for_listconfig(sym);
 			break;
 		case helpnewconfig:
 			printf("-----\n");
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index ce11e7442d12..adbb9a955c43 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -667,6 +667,11 @@ static void print_symbol_for_autoconf(FILE *fp, struct symbol *sym)
 	__print_symbol(fp, sym, OUTPUT_N_NONE, true);
 }
 
+void print_symbol_for_listconfig(struct symbol *sym)
+{
+	__print_symbol(stdout, sym, OUTPUT_N, true);
+}
+
 static void print_symbol_for_c(FILE *fp, struct symbol *sym)
 {
 	const char *val;
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index e6955df49973..ec4a01bb60ce 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -19,6 +19,7 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
 char *sym_escape_string_value(const char *in);
+void print_symbol_for_listconfig(struct symbol *sym);
 struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
 void sym_calc_value(struct symbol *sym);
-- 
2.30.2

