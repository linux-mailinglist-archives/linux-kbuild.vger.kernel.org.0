Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1F7E75BD
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2019 17:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730630AbfJ1QCx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Oct 2019 12:02:53 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:42595 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728864AbfJ1QCx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 12:02:53 -0400
Received: by mail-il1-f196.google.com with SMTP id o16so8627058ilq.9;
        Mon, 28 Oct 2019 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u+kZn6IyZZfN/0mlluWthGclsf/q1ikalY90VR/nHBU=;
        b=pWcB+L+0mUwnOrVH0ALZ95dR9onLwO5cUAyZQpQnV6hLnzSMZrkkkaJAEF4WFT/xTt
         nHo4+XYqDEGUkCUZMAn04Hz1fR2eXxWCPYvQ/96CDRm5APZpoSDlyTcY5qSR8olSdxBG
         lCVXCTjk6LYiPqyzTDXIc9x+EJwyuaZKEINk7FVKob9s+nDDEID12gZyyVTYwHJhslmX
         JWnGQiaREqGFl05g254TF/dQPGdRgYzHmZ7SSnK8a7PBQ7XJ3MTpvMCtWCzdmoj1udpA
         FxrLT3MqhuAZIlWn2sqrEbW6vqHiLWRBkovD6TJDQfPDYfIuDN6C/kG8KWfAvdbWoY2a
         cAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u+kZn6IyZZfN/0mlluWthGclsf/q1ikalY90VR/nHBU=;
        b=g0PbtfR7VkR0olc/ye5d2k0pbky2stWwJ+ZbMGx9b/CXCfmKXE65UTwYyW3zdmO9bH
         /c2eB9emcCYDT2PGEDd4N+g3VcKHpDl7DLO/zb4+qiI3/IcrfMuI5mnTEUl8kY/2EO45
         9JEUcmKsad4OrCkql2pyVJiOv+4fwR3ICA5L+W2kk4Nm0iowT9scg0WB+4r6/44RWSNE
         Gnv9Q3Og9e6LaK+b4r7UBm1tVzmvzX+LtMRK3lJFGPySY6tPZMybnaXZZRdoFvYaINHX
         JrO/aWiSUw+PTsZHkCOyU8SprP128zGuuIolJBOIacWklavYoxm/JUwABcJTM30Br/7q
         /6OQ==
X-Gm-Message-State: APjAAAWOzpb22QTD5QD49dCHgTOWYq2dDi2KDE9pCGE+8WO5Cbaz7FDy
        nwGch5kZ2ZC8TGQE1YmzCJ5CDcsX
X-Google-Smtp-Source: APXvYqwtxC7hbRBlLLQaOvoES+rjeZt1ijbjiPAWdyitxy/scxKFyp/QCggwlSnY+oBbOpOKpq+9uA==
X-Received: by 2002:a92:6f08:: with SMTP id k8mr20274149ilc.57.1572278571279;
        Mon, 28 Oct 2019 09:02:51 -0700 (PDT)
Received: from dell.localdomain ([216.249.49.8])
        by smtp.googlemail.com with ESMTPSA id 133sm1618424ila.25.2019.10.28.09.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 09:02:50 -0700 (PDT)
From:   Ethan Sommer <e5ten.arch@gmail.com>
Cc:     Ethan Sommer <e5ten.arch@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: support byacc as alternative YACC to bison
Date:   Mon, 28 Oct 2019 11:56:37 -0400
Message-Id: <20191028155639.30330-1-e5ten.arch@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
---
 scripts/Makefile.host     | 2 +-
 scripts/genksyms/Makefile | 2 +-
 scripts/genksyms/lex.l    | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

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

