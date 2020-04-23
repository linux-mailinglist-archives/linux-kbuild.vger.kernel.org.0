Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C98A1B5EF7
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 17:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgDWPTW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 11:19:22 -0400
Received: from pb-smtp21.pobox.com ([173.228.157.53]:54994 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbgDWPTW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 11:19:22 -0400
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id A8223C8475;
        Thu, 23 Apr 2020 11:19:20 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:message-id:mime-version:content-type; s=sasl; bh=vmQ
        JhYlZ0yHldJpYg27uGjUK04k=; b=wUzFW2vL0VC6xprf3iAhXRwWzESPCrPysPc
        eM1jp32i6MfUWwoTvdBhFUD4y0tPVNLfUC77jXvY+oqg/ZkY2aS73K3+I2rSvdqd
        uNnkG602PjCZpEPUno6zz8n8ee4dJPX1PhqhYNg0iIfhMZSVfKONU98BXpLHANAP
        vIJhShg4=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 9FDEEC8473;
        Thu, 23 Apr 2020 11:19:20 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2016-12.pbsmtp; bh=ZQvOj/WbQX9wG6kaUe0GIpQk4CeGncvX7dWU4OJgYjU=;
 b=tLDxNRjgg156rpKhGo8X63HdaMXd9GGqa/nZFjcufcxAeOOxwzNxDBB/ZNOL5DCu77L2iz4dQUflMROVcHt+KcEFqIJnukY2lG7+gPzL7SVPiHUqxUxcdss5anYWxeajCNZihR+TTiUs7LrdONKZQel9GMtvYhw/nec9qEmFvgA=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 91729C8472;
        Thu, 23 Apr 2020 11:19:17 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id C18342DA0CA0;
        Thu, 23 Apr 2020 11:19:15 -0400 (EDT)
Date:   Thu, 23 Apr 2020 11:19:15 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: allow for conditional dependencies
Message-ID: <nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: CC7594EC-8575-11EA-B959-8D86F504CC47-78420484!pb-smtp21.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This might appear to be a strange concept, but sometimes we want
a dependency to be conditionally applied. One such case is currently
expressed with:

        depends on FOO || !FOO

This pattern is strange enough to give one's pause. Given that it is
also frequent, let's make the intent more obvious with some syntaxic
sugar by effectively making dependencies optionally conditional.

This also makes the kconfig language more uniform.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index d0111dd264..0f841e0037 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -114,7 +114,7 @@ applicable everywhere (see syntax).
   This is a shorthand notation for a type definition plus a value.
   Optionally dependencies for this default value can be added with "if".
 
-- dependencies: "depends on" <expr>
+- dependencies: "depends on" <expr> ["if" <expr>]
 
   This defines a dependency for this menu entry. If multiple
   dependencies are defined, they are connected with '&&'. Dependencies
@@ -130,6 +130,16 @@ applicable everywhere (see syntax).
 	bool "foo"
 	default y
 
+  The dependency definition itself may be conditional by appending "if"
+  followed by an expression. If such expression is false (n) then this
+  dependency is ignored. One possible use case is:
+
+    config FOO
+	tristate
+	depends on BAZ if BAZ != n
+
+  meaning that FOO is constrained by the value of BAZ only when it is set.
+
 - reverse dependencies: "select" <symbol> ["if" <expr>]
 
   While normal dependencies reduce the upper limit of a symbol (see
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index d4ca829736..1a9337d1b9 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -72,7 +72,7 @@ void menu_warn(struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
 void menu_add_entry(struct symbol *sym);
-void menu_add_dep(struct expr *dep);
+void menu_add_dep(struct expr *dep, struct expr *cond);
 void menu_add_visibility(struct expr *dep);
 struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e436ba44c9..47928cdbc2 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -103,8 +103,18 @@ static struct expr *rewrite_m(struct expr *e)
 	return e;
 }
 
-void menu_add_dep(struct expr *dep)
+void menu_add_dep(struct expr *dep, struct expr *cond)
 {
+	if (cond) {
+		/*
+		 * We have "depends on X if Y" and we want:
+		 *	Y != n --> X
+		 *	Y == n --> y
+		 * That simplifies to: (X || (Y == n))
+		 */
+		dep = expr_alloc_or(dep,
+				expr_trans_compare(cond, E_EQUAL, &symbol_no));
+	}
 	current_entry->dep = expr_alloc_and(current_entry->dep, dep);
 }
 
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 708b6c4b13..4161207da2 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -316,7 +316,7 @@ if_entry: T_IF expr T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:if\n", zconf_curname(), zconf_lineno());
 	menu_add_entry(NULL);
-	menu_add_dep($2);
+	menu_add_dep($2, NULL);
 	$$ = menu_add_menu();
 };
 
@@ -412,9 +412,9 @@ help: help_start T_HELPTEXT
 
 /* depends option */
 
-depends: T_DEPENDS T_ON expr T_EOL
+depends: T_DEPENDS T_ON expr if_expr T_EOL
 {
-	menu_add_dep($3);
+	menu_add_dep($3, $4);
 	printd(DEBUG_PARSE, "%s:%d:depends on\n", zconf_curname(), zconf_lineno());
 };
 
