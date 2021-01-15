Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C02A2F8996
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 00:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbhAOXod (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 18:44:33 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:64013 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbhAOXod (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 18:44:33 -0500
Received: from grover.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 10FNhKIA008447;
        Sat, 16 Jan 2021 08:43:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10FNhKIA008447
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610754201;
        bh=X95nt+nStFbSXLK82H480Vb9TvXIBPghJobLO+NTN6U=;
        h=From:To:Cc:Subject:Date:From;
        b=qkgKHE7okjmUZ2Ed4FEUsvU7atpHr4/dyXrRuq5oDX09nZ9ZaGd6Uu/eVyyAmcgxT
         IFzGb2EV2DwNinx76b/by03XB8921QlldajHXuRwU3I0XkFkmLlM4SRXeN1w0AjiZu
         xaA6tHOBe50GQbrSlx3cTSy8xCuzMX0vHSNymBjbYFD/HYE3cPGynV8tmwS6Kz6cvr
         QTjLnQAu3rRZ2bUi5c1yYD1TjHhvIh+c+v2ejSBWYeCIRkOoAN6TVGhReA5HW6An+d
         ctfVfUtLvmPwH58TB5QPyZtIxRauJgK+X/KQtbNTGuTfyWsPZoQEMbVi4fIkHNrYeP
         HAc7dSB/sEqzw==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] genksyms: make source_file a local variable in lexer
Date:   Sat, 16 Jan 2021 08:43:02 +0900
Message-Id: <20210115234305.87205-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is only used in yylex() in lex.l

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/genksyms.c | 2 +-
 scripts/genksyms/genksyms.h | 2 +-
 scripts/genksyms/lex.l      | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 23eff234184f..4827c5abe5b7 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -29,7 +29,7 @@ static struct symbol *symtab[HASH_BUCKETS];
 static FILE *debugfile;
 
 int cur_line = 1;
-char *cur_filename, *source_file;
+char *cur_filename;
 int in_source_file;
 
 static int flag_debug, flag_dump_defs, flag_reference, flag_dump_types,
diff --git a/scripts/genksyms/genksyms.h b/scripts/genksyms/genksyms.h
index 2bcdb9bebab4..21ed2ec2d98c 100644
--- a/scripts/genksyms/genksyms.h
+++ b/scripts/genksyms/genksyms.h
@@ -47,7 +47,7 @@ typedef struct string_list **yystype;
 #define YYSTYPE yystype
 
 extern int cur_line;
-extern char *cur_filename, *source_file;
+extern char *cur_filename;
 extern int in_source_file;
 
 struct symbol *find_symbol(const char *name, enum symbol_type ns, int exact);
diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index ae76472efc43..9e88c100fc28 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -125,6 +125,7 @@ yylex(void)
 
   static int suppress_type_lookup, dont_want_brace_phrase;
   static struct string_list *next_node;
+  static char *source_file;
 
   int token, count = 0;
   struct string_list *cur_node;
-- 
2.27.0

