Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C146E8B61
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2019 16:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389387AbfJ2PCF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 11:02:05 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35179 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJ2PCF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 11:02:05 -0400
Received: by mail-io1-f67.google.com with SMTP id h9so15173295ioh.2;
        Tue, 29 Oct 2019 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nviDhX5eHZuccHclre8MmSPBqdycbWsdLIjtyjp/3bg=;
        b=tcym8wbDGztiJe9+mM9W4HNr1IeUPWbQSUFQWIVrTu22BruegDCKWLz8varVgwxuOP
         S4zy8G5Bp5zWPTWGu0QNBQZYFs8iEGJ/C8scAPV8uLBSIzxK2upzhOV1Nvv/0XhW+0ju
         M7FK0PCbThiQcV0lH4hLCVLXA/2pylYhpbrjuAroUVnu9zKBITGyAJQzNpChJi6Bszea
         ItzSk5NJ+f6DT6F7heJB4L61fGxKMtGHehslO4b5vtmgRztDXlBr7X0FtCyDOj+7VpNL
         yxV+gx4YeyrYRMmm6KoJSzX6BgON3bPJzjW9/ftGJePyrNP6ynfWA592UH2y9H95LsUx
         U9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nviDhX5eHZuccHclre8MmSPBqdycbWsdLIjtyjp/3bg=;
        b=SPpEyaA93mzSjKpxKA0U45+HsHbJ6tsr93oYc9RKP3tgR7GShXGXLejaJohaxar4ku
         XyNhOpsq9AB7jM51Oe6Phto67rPzEK2BsipNWEaDtQm2oTbFtNnB7z7FTKyRzsrTIhtx
         EK2YBw6rBHeOMppsP4w5VxVuU3DKhkiV5dcqJT7E9OzXMhrc17J+aLw0kV4tjto7BxG7
         tc7o5Wa6EIu2WHPkhSkcwrwOxjjVMjKFYYGJcro4EScdIg0vAZbdL9nayI0M/ssgOlY6
         82gKG5Vynt6X0SSBqnxluXqWw8Ekal+b8JJ+CSRl4Od/1EF4ryMeUoH/1OpZoMgbIkM9
         uzlg==
X-Gm-Message-State: APjAAAUsblLb1qzGcp+XYWijiSL6RAV91XeaeEZCXoPnxffnr1o56EhY
        W/zGSNs2x/VHWKJoX88Z1pU=
X-Google-Smtp-Source: APXvYqxpmIbZ+JeH9dmI+sZWnLhXEw2k+1SXYAcp+ECySPiG7577LX3o3NwM+N7P8OeU5GHZ1YWWMw==
X-Received: by 2002:a6b:fa08:: with SMTP id p8mr4335018ioh.84.1572361323918;
        Tue, 29 Oct 2019 08:02:03 -0700 (PDT)
Received: from dell.localdomain ([216.249.49.33])
        by smtp.googlemail.com with ESMTPSA id g79sm2015632ilf.14.2019.10.29.08.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 08:02:03 -0700 (PDT)
From:   Ethan Sommer <e5ten.arch@gmail.com>
Cc:     Ethan Sommer <e5ten.arch@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2] kbuild: support byacc as alternative YACC to bison
Date:   Tue, 29 Oct 2019 11:01:16 -0400
Message-Id: <20191029150119.19823-1-e5ten.arch@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
References: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Switches to a more portable set of flags for generating the same file
names instead of the bison-specific --defines, uses the more portable -V
instead of --version, and explicitly defines YYSTYPE in lex.l, which
bison implicitly defines if not present but byacc does not.

Add %locations to dtc-parser.y to explicitly enable location tracking
for byacc, and define YYERROR_CALL explicitly to prevent the locations
directive from causing it to be defined to a 2-parameter call to
yyerror, which dtc-parser.y defines to accept one parameter.

Requires byacc to be built with --enable-btyacc.

Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
---
 scripts/Makefile.host     | 2 +-
 scripts/dtc/dtc-parser.y  | 4 ++++
 scripts/genksyms/Makefile | 2 +-
 scripts/genksyms/lex.l    | 2 ++
 4 files changed, 8 insertions(+), 2 deletions(-)

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
diff --git a/scripts/dtc/dtc-parser.y b/scripts/dtc/dtc-parser.y
index 2ed4dc1f07fd..40dcf4f149da 100644
--- a/scripts/dtc/dtc-parser.y
+++ b/scripts/dtc/dtc-parser.y
@@ -2,6 +2,8 @@
 /*
  * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
  */
+%locations
+
 %{
 #include <stdio.h>
 #include <inttypes.h>
@@ -17,6 +19,8 @@ extern void yyerror(char const *s);
 		treesource_error = true; \
 	} while (0)
 
+#define YYERROR_CALL(msg) yyerror(msg)
+
 extern struct dt_info *parser_output;
 extern bool treesource_error;
 %}
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 78629f515e78..397c2dc8182b 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -15,7 +15,7 @@ genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 
 quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
-      cmd_bison_no_warn = $(YACC) --version >/dev/null; \
+      cmd_bison_no_warn = $(YACC) -V >/dev/null; \
 			  $(cmd_bison) 2>/dev/null
 
 $(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
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
-- 
2.23.0

