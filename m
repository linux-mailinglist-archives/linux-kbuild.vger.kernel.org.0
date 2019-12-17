Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02F51231E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 17:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbfLQQST (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 11:18:19 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46207 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbfLQQPx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 11:15:53 -0500
Received: by mail-pl1-f195.google.com with SMTP id y8so321943pll.13;
        Tue, 17 Dec 2019 08:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nvfz0A2ZvP4AK3QEhPIGVEQE0gFv3qk/GmdZliKFO6A=;
        b=CVtreZDPZZJiZSWzv8lwSJIgatTJTjo7lKs3WeWqJa7HRYn75GbB0+e04gsd/7Rd7m
         NyLNaOBu6kqTuS7HMcfVvJgwf5T6x7kMoG6MbuB13TgTXimfK8HJvoj5AAsBbkQGbWfa
         cuRNiJt6SycRj6jdoT7z10cYulJhGPcWM57rdBiG7SE3B5z3DjoDbKhoKFP4bdCeYgil
         mOCXZDE5Qa074L8aCc/n77oIWXJ7xIN0NB/sZsZW+GnoQAAxyE+73dG2v6DnwapwADHt
         eTZYmK5AcGU5fSu28uan+MylLLsAkuaGV0GR/bfxQc3p2T9LVzbFMxSYXrQ1Lm/1pFyJ
         nf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nvfz0A2ZvP4AK3QEhPIGVEQE0gFv3qk/GmdZliKFO6A=;
        b=fo0UhmGjXlrdctvubIBHG9vHiB0YAAHAL1Zg8JoLQfrQ7W32GGlnI/1ClgUQQ6zHeN
         iHOetSu2MoRjdV7PX+i5fQvPho0cgefNF6VKZcxkTv0v7hrDwIUtzQzmUT8PtQtu11D7
         8W/NeiWI0xmy+1hx9HrcVQMKtpODdb1DhmAAyM9jbBIV+tiEjcaKb/P+MWHCqvkGqUrB
         dxz6q08Rbalk/9Cq/11g3ntnQUq/6K3BpY7GkJFEkKn6yHkrUy1Xwx2IrOmYBd+iaSOG
         Rs6PdCEhtzX7B8hSahqzmR1TbklZdACMPzz/6TOhDU5mAsJfa2Yv1/sczcz8ZHTREKrd
         Utdw==
X-Gm-Message-State: APjAAAWmRG0ikS7MwqVcQOeYI+0OWUScyLWB/upN9sbLkVP/Lkv9JKsl
        u7H4HLo++tzXqV+c+p731Zbt8GlITOMVWA==
X-Google-Smtp-Source: APXvYqyYCRDx0TFyqVYKOZHhB55hjFC3rr5CadlhQrDgXjepxqJokh9IxLlFXEIaNvpXL7ejBxzdgg==
X-Received: by 2002:a17:90a:d801:: with SMTP id a1mr7133236pjv.34.1576599352484;
        Tue, 17 Dec 2019 08:15:52 -0800 (PST)
Received: from glados.lan ([2601:647:4c01:6541:fa16:54ff:fed1:1bd6])
        by smtp.gmail.com with ESMTPSA id k15sm27704122pfg.37.2019.12.17.08.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 08:15:52 -0800 (PST)
From:   Thomas Hebb <tommyhebb@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Thomas Hebb <tommyhebb@gmail.com>
Subject: [PATCH v2 2/3] kconfig: distinguish between dependencies and visibility in help text
Date:   Tue, 17 Dec 2019 08:15:44 -0800
Message-Id: <0f377f484587480701ba22c4b66ea0e7d83db870.1576599202.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1576599202.git.tommyhebb@gmail.com>
References: <cover.1576599202.git.tommyhebb@gmail.com>
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

Before commit bcdedcc1afd6 ("menuconfig: print more info for symbol
without prompts"), the "Depends on" lines of a symbol's help text
indicated the visibility of the prompt property they appeared under.
After bcdedcc1afd, there was always only a single "Depends on" line,
which indicated the visibility of the first P_SYMBOL property of the
symbol. Since P_SYMBOLs never have inline if expressions, this was in
effect the same as the dependencies of the menu item that the P_SYMBOL
was attached to.

Neither of these situations accurately conveyed the dependencies of a
symbol--the first because it was actually the visibility, and the second
because it only showed the dependencies from a single definition.

With this series, we are back to printing separate dependencies for each
definition, but we print the actual dependencies (rather than the
visibility) in the "Depends on" line. However, it can still be useful to
know the visibility of a prompt, so this patch adds a "Visible if" line
that shows the visibility only if the visibility is different from the
dependencies (which it isn't for most prompts in Linux).

Before:

  Symbol: THUMB2_KERNEL [=n]
  Type  : bool
  Defined at arch/arm/Kconfig:1417
    Prompt: Compile the kernel in Thumb-2 mode
    Depends on: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n]
    Location:
      -> Kernel Features
    Selects: ARM_UNWIND [=n]

After:

   Symbol: THUMB2_KERNEL [=n]
   Type  : bool
   Defined at arch/arm/Kconfig:1417
     Prompt: Compile the kernel in Thumb-2 mode
     Depends on: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n]
     Visible if: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n] && !CPU_THUMBONLY [=n]
     Location:
       -> Kernel Features
     Selects: ARM_UNWIND [=n]

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

Changes in v2:
- Fixed checkpatch issues

 scripts/kconfig/expr.c |  3 +--
 scripts/kconfig/expr.h |  1 +
 scripts/kconfig/menu.c | 11 +++++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 9f1de58e9f0c..81ebf8108ca7 100644
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
index 0e54632d2043..dcf7f32f0bba 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -723,6 +723,17 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	str_printf(r, "  Prompt: %s\n", prop->text);
 
 	get_dep_str(r, prop->menu->dep, "  Depends on: ");
+	/*
+	 * Most prompts in Linux have visibility that exactly matches their
+	 * dependencies. For these, we print only the dependencies to improve
+	 * readability. However, prompts with inline "if" expressions and
+	 * prompts with a parent that has a "visible if" expression have
+	 * differing dependencies and visibility. In these rare cases, we
+	 * print both.
+	 */
+	if (!expr_eq(prop->menu->dep, prop->visible.expr))
+		get_dep_str(r, prop->visible.expr, "  Visible if: ");
+
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
-- 
2.24.1

