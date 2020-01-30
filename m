Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCE314DF04
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2020 17:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbgA3QXq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jan 2020 11:23:46 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:40963 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgA3QXq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 11:23:46 -0500
Received: by mail-io1-f68.google.com with SMTP id m25so4653020ioo.8;
        Thu, 30 Jan 2020 08:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2gREjzEu+n1RGwcI4Ki/0u5ITWrtl7Q643uPluzcC6Q=;
        b=Jrv0WHN7yRVxfBnyMJ72ZzWz6N5sC8I1J6CH3a++mf5Dedod2NjdUrkqUU6KrccI6h
         5xg/WqoB11z2trhDWikP2SxkNlMgZu2MjbbFqmg7QKquqqa7iUHYke0qa2AU39FRx2hD
         XzxM/Bof/YO9jGjxnwu0McGA8WAYbSgfZ0Qvos+A8e9pAvVUgG6uUONoBDSCU+zbAUNu
         37TgqEtZEyv51BYDyEp5FO4LZeB7zpmZPf0Ow4dRC1aUiTq+wtFUkCziCj91ENmsTQtp
         UaoEe5highcynG0TZzsUYySaePbWu6B6IDTYtvuu1gAS37+peP54GXNchSBenEkvBwK+
         F22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2gREjzEu+n1RGwcI4Ki/0u5ITWrtl7Q643uPluzcC6Q=;
        b=VQjXFPand3XQmtWkg8Q1GZT3vZpkcBchokrBpWUp3DvIdGhyADsizQIMAq1xLfJ9MB
         kogJhdaWq+aXl0WXA+1UwBYLOAWcs1D+s4tXgcV54X6XhnZVHk5RcZUzmiFgbgbb+72K
         cH6wrcSBf0ILfETR+JNSE0psDex8PcACdE98xjRua7CZrvH7h370IlZq7U9DnlEfbZNx
         ASl4TC0n7t3jI/EbGEZDVUnfhZdTGQLjV+8Nq9e+q+uYTrh9NEcknj6rK/fuNxE6zyLd
         E1A4aECo8xRfbGtl7zcWagyyncf/5aNQJxqgt4XgGBnb1C/PEyBiJ2g6NmD76WQ1EkQj
         QRMA==
X-Gm-Message-State: APjAAAV/BCjUy4q7p4NJKD8AylTbbvRI4oB/jh//8bl6nvAjrzx9DU8f
        CMaKpaMpDCZ4JyqgjaM68Ek=
X-Google-Smtp-Source: APXvYqz2qktLCVw9l/mhVDz/5QkWJ7tkyH5WkN+czNFtmkH1J24j8E2eAjpJybZ0EJppbz/k4sk6Mw==
X-Received: by 2002:a5e:8a03:: with SMTP id d3mr4837467iok.269.1580401425755;
        Thu, 30 Jan 2020 08:23:45 -0800 (PST)
Received: from localhost.localdomain ([216.249.49.11])
        by smtp.googlemail.com with ESMTPSA id l2sm2035951ilo.6.2020.01.30.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 08:23:45 -0800 (PST)
From:   Ethan Sommer <e5ten.arch@gmail.com>
Cc:     Ethan Sommer <e5ten.arch@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] make yacc usage POSIX-compliant
Date:   Thu, 30 Jan 2020 11:23:11 -0500
Message-Id: <20200130162314.31449-1-e5ten.arch@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

use -b and -d to generate correctly named source and header files,
instead of bison-specific --defines and non-POSIX -o
check that YACC command is found in path or is an executable file,
instead of using bison-specific --version flag to display an error when
it is missing
explicitly define yyltype in scripts/genksyms/lex.l, instead of relying
on bison automatically defining it
replace bison-specific %destructor use in scripts/kconfig/parser.y
dtc's yacc usage is not covered here, as its use of bison-specific
features is much greater, and it is only built on certain architectures,
unlike kconfig and genksyms

Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
---
 scripts/Makefile.host     |  2 +-
 scripts/genksyms/Makefile |  6 ++++--
 scripts/genksyms/lex.l    |  2 ++
 scripts/kconfig/parser.y  | 14 +++++++-------
 4 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 4c51c95d40f4..64e98e1d4825 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -11,7 +11,7 @@ $(obj)/%.lex.c: $(src)/%.l FORCE
 # YACC
 # ---------------------------------------------------------------------------
 quiet_cmd_bison = YACC    $(basename $@).[ch]
-      cmd_bison = $(YACC) -o $(basename $@).c --defines=$(basename $@).h -t -l $<
+      cmd_bison = $(YACC) -b $(basename $(basename $@)) -d -t -l $<
 
 $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
 	$(call if_changed,bison)
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 78629f515e78..1e120328fa88 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -14,9 +14,11 @@ genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 # so that 'bison: not found' will be displayed if it is missing.
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 
+ifeq ($(shell command -v $(YACC) || [ -x $(YACC) ] && echo y),)
+  $(error command not found: $(YACC))
+endif
 quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
-      cmd_bison_no_warn = $(YACC) --version >/dev/null; \
-			  $(cmd_bison) 2>/dev/null
+      cmd_bison_no_warn = $(cmd_bison) 2>/dev/null
 
 $(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
 	$(call if_changed,bison_no_warn)
diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index e265c5d96861..0580c088527f 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -19,6 +19,8 @@
 #include "genksyms.h"
 #include "parse.tab.h"
 
+extern YYSTYPE yylval;
+
 /* We've got a two-level lexer here.  We let flex do basic tokenization
    and then we categorize those basic tokens in the second stage.  */
 #define YY_DECL		static int yylex1(void)
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index b3eff9613cf8..9eb9a94a68e0 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -20,6 +20,8 @@
 
 int cdebug = PRINTD;
 
+int yynerrs = 0;
+
 static void yyerror(const char *err);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
@@ -101,13 +103,6 @@ static struct menu *current_menu, *current_entry;
 %type <string> word_opt assign_val
 %type <flavor> assign_op
 
-%destructor {
-	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
-		$$->file->name, $$->lineno);
-	if (current_menu == $$)
-		menu_end_menu();
-} if_entry menu_entry choice_entry
-
 %%
 input: mainmenu_stmt stmt_list | stmt_list;
 
@@ -529,6 +524,11 @@ static bool zconf_endtoken(const char *tokenname,
 	if (strcmp(tokenname, expected_tokenname)) {
 		zconf_error("unexpected '%s' within %s block",
 			    tokenname, expected_tokenname);
+		if (!strcmp(tokenname, "if") || !strcmp(tokenname, "menu") ||
+			!strcmp(tokenname, "choice"))
+			fprintf(stderr, "%s:%d: missing end statement for this entry\n",
+				current_menu->file->name, current_menu->lineno);
+		menu_end_menu();
 		yynerrs++;
 		return false;
 	}
-- 
2.25.0

