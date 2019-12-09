Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03FDC11680A
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2019 09:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfLIITg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Dec 2019 03:19:36 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:45681 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfLIITa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Dec 2019 03:19:30 -0500
Received: by mail-pj1-f68.google.com with SMTP id r11so5530204pjp.12;
        Mon, 09 Dec 2019 00:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZbpQ+SxRsU8UeNcbXVf7RHYlP4YI+DdiwpR9PUux8Qw=;
        b=Lz7KVfI79SnyYoxLBFww86GdVMpI6wV4kqjvuzgKghRyDcfgNg++HRZdH5Ln3zxAuJ
         Ls0LC3Q5rFs9fJwnNJJ3kX0Sf1+wIF1iW6T2wnpAEY7x6/13iDjQdZMoZ+ktTfIRlrCt
         lRY7hnO4erUT8imZoaaxeZ7CD0CC4xbv16PHWNokOcbtQqQIm4ffaxaYpDYVTfmlXSbk
         MYrNIIKlJq7tsp7p1RmrcF8JcaoKg2OJBwES+AuLkgMHYA79QccWXmwC+a3jPbnn54gv
         xyQGx53Zgd3ib4QuyRMbm2+Xy3Xc7ZPJcKc3JCrFcPXVgZsQuLjZoQUxLD1ugKjH73YI
         AslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZbpQ+SxRsU8UeNcbXVf7RHYlP4YI+DdiwpR9PUux8Qw=;
        b=ihCMZFk5svVGiZvZ4iysqRMaZ7UQwGZ43NEp//Y3G9hSYginmjqO/9wYcyyzEPcH2Z
         XSrByFtgvna7JMkecdMWvMCLf2LIlKOyeqUNqP2xYADWx1ZEWjEXDgxfUljhUT0R0KtK
         /XUzu1Py2jWaIXYwc5d1ycOhX/9fda4MNS5iI+/4VAD3gvJWo/2Xv7ZiZAqIXts4G8t3
         LDMdCsgbG5QA1iBnM6fuZlpKh9weWpQVsiRbdEYjKQsOQY8rTdqteVKKXB78lmwAmPjX
         jtrnU8bBjJzFiw1xRD+vDBSxOH/5NTF0gjEvV6dGJbUNt44kCx58Y/balPRvwPUkE4jJ
         WIOw==
X-Gm-Message-State: APjAAAXYFcuCCDu6k5VmHsIUk/IbkDJqbDFh4NEorJOZJt+RuABONc/m
        CnSehUfV9wjH3Ed1r0cpPYNKlsOUi/gQ8Q==
X-Google-Smtp-Source: APXvYqw0+VIO2sSPYIVwhx3axaQXtR19Ch5YKrGy23yxHGISIU1xIki2ZzwzcRoqFQC37eezqGCAmA==
X-Received: by 2002:a17:90a:508:: with SMTP id h8mr30800488pjh.91.1575879568519;
        Mon, 09 Dec 2019 00:19:28 -0800 (PST)
Received: from glados.lan ([2601:647:4c01:6541:fa16:54ff:fed1:1bd6])
        by smtp.gmail.com with ESMTPSA id u2sm23810375pgc.19.2019.12.09.00.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:19:28 -0800 (PST)
From:   Thomas Hebb <tommyhebb@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Thomas Hebb <tommyhebb@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/4] kconfig: distinguish between dependencies and visibility in help text
Date:   Mon,  9 Dec 2019 00:19:18 -0800
Message-Id: <9d43c96787ecbe2a3f2917483bbc61e378a1a7cf.1575879069.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575879069.git.tommyhebb@gmail.com>
References: <cover.1575879069.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Kconfig makes a distinction between dependencies (defined by "depends
on" expressions and enclosing "if" blocks) and visibility (which
includes all dependencies, but also includes inline "if" expressions of
individual properties as well as, for prompts, "visible if" expressions
of enclosing menus).

Before bcdedcc1afd6 ("menuconfig: print more info for symbol without
prompts", the "Depends on" lines of a symbol's help text indicated the
visibility of the prompt property they appeared under. After
bcdedcc1afd, there was always only a single "Depends on" line, which
indicated the visibility of the first P_SYMBOL property of the symbol.
Since P_SYMBOLs never have inline if expressions, this was in effect the
same as the dependencies of the menu item that the P_SYMBOL was attached
to.

Neither of these situations accurately conveyed the dependencies of a
symbol--the first because it was actually the visibility, and the second
because it only showed the dependencies from a single definition.

Now that we print a "Depends on" line for every definition (regardless
of whether or not it has a prompt), we can do better: this patch
switches the "Depends on" line for prompts to show the real dependencies
of the corresponding menu item and additionally adds a "Visible if" line
that shows the visibility only if the visibility is different from the
dependencies (which it isn't for most prompts in Linux).

Before:

  Symbol: THUMB2_KERNEL [=n]
  Type  : bool
  Defined with prompt at arch/arm/Kconfig:1417
    Prompt: Compile the kernel in Thumb-2 mode
    Depends on: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n] && !CPU_THUMBONLY [=n]
    Location:
      -> Kernel Features
    Selects: ARM_UNWIND [=n]

After:

   Symbol: THUMB2_KERNEL [=n]
   Type  : bool
   Defined with prompt at arch/arm/Kconfig:1417
     Prompt: Compile the kernel in Thumb-2 mode
     Depends on: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n]
     Visible if: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n] && !CPU_THUMBONLY [=n]
     Location:
       -> Kernel Features
     Selects: ARM_UNWIND [=n]

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---
 scripts/kconfig/expr.c |  3 +--
 scripts/kconfig/expr.h |  1 +
 scripts/kconfig/menu.c | 12 +++++++++++-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 8284444cc3fa..849c574a28d5 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -13,7 +13,6 @@
 
 #define DEBUG_EXPR	0
 
-static int expr_eq(struct expr *e1, struct expr *e2);
 static struct expr *expr_eliminate_yn(struct expr *e);
 
 struct expr *expr_alloc_symbol(struct symbol *sym)
@@ -250,7 +249,7 @@ void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
  * equals some operand in the other (operands do not need to appear in the same
  * order), recursively.
  */
-static int expr_eq(struct expr *e1, struct expr *e2)
+int expr_eq(struct expr *e1, struct expr *e2)
 {
 	int res, old_count;
 
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 017843c9a4f4..d0f17bc9c4ef 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -301,6 +301,7 @@ struct expr *expr_alloc_or(struct expr *e1, struct expr *e2);
 struct expr *expr_copy(const struct expr *org);
 void expr_free(struct expr *e);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
+int expr_eq(struct expr *e1, struct expr *e2);
 tristate expr_calc_value(struct expr *e);
 struct expr *expr_trans_bool(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 59fead4b8823..4d0542875d70 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -718,7 +718,17 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		   prop->menu->file->name, prop->menu->lineno);
 	str_printf(r, "  Prompt: %s\n", prop->text);
 
-	get_dep_str(r, prop->visible.expr, "  Depends on: ");
+	get_dep_str(r, prop->menu->dep, "  Depends on: ");
+	/* Most prompts in Linux have visibility that exactly matches their
+	 * dependencies. For these, we print only the dependencies to improve
+	 * readability. However, prompts with inline "if" expressions and
+	 * prompts with a parent that has a "visible if" expression have
+	 * differing dependencies and visibility. In these rare cases, we
+	 * print both. */
+	if (!expr_eq(prop->menu->dep, prop->visible.expr)) {
+		get_dep_str(r, prop->visible.expr, "  Visible if: ");
+	}
+
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
-- 
2.24.0

