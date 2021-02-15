Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C62231C14D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Feb 2021 19:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhBOSQ1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 13:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbhBOSQA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 13:16:00 -0500
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [IPv6:2001:1600:4:17::8fac])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E11C061756
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Feb 2021 10:15:15 -0800 (PST)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DfXLW0fs0zMpv3m;
        Mon, 15 Feb 2021 19:14:27 +0100 (CET)
Received: from localhost (unknown [23.97.221.149])
        by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4DfXLV340dzlh8TJ;
        Mon, 15 Feb 2021 19:14:25 +0100 (CET)
From:   =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To:     James Morris <jmorris@namei.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Serge E . Hallyn" <serge@hallyn.com>
Cc:     =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>
Subject: [PATCH v2 2/3] kconfig: Ask user if string needs to be changed when dependency changed
Date:   Mon, 15 Feb 2021 19:15:10 +0100
Message-Id: <20210215181511.2840674-3-mic@digikod.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210215181511.2840674-1-mic@digikod.net>
References: <20210215181511.2840674-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Mickaël Salaün <mic@linux.microsoft.com>

Content of string configuration may depend on related kernel
configurations.  Modify oldconfig and syncconfig to inform users about
possible required configuration update and give them the opportunity to
update it:
* if dependencies of this string has changed (e.g. enabled or disabled),
* and if the current value of this string is different than the (new)
  default one.

This is particularly relevant for CONFIG_LSM which contains a list of
LSMs enabled at boot, but users will not have a chance to update this
list with a make oldconfig.

Cc: Casey Schaufler <casey@schaufler-ca.com>
Cc: James Morris <jmorris@namei.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Serge E. Hallyn <serge@hallyn.com>
Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
Link: https://lore.kernel.org/r/20210215181511.2840674-3-mic@digikod.net
---
 scripts/kconfig/conf.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 18a233d27a8d..8633dacd39a9 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -82,6 +82,26 @@ static void xfgets(char *str, int size, FILE *in)
 		printf("%s", str);
 }
 
+static bool may_need_string_update(struct symbol *sym, const char *def)
+{
+	const struct symbol *dep_sym;
+	const struct expr *e;
+
+	if (sym->type != S_STRING)
+		return false;
+	if (strcmp(def, sym_get_string_default(sym)) == 0)
+		return false;
+	/*
+	 * The user may want to synchronize the content of a string related to
+	 * changed dependencies (e.g. CONFIG_LSM).
+	 */
+	expr_list_for_each_sym(sym->dir_dep.expr, e, dep_sym) {
+		if (dep_sym->flags & SYMBOL_CHANGED)
+			return true;
+	}
+	return false;
+}
+
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
 	enum symbol_type type = sym_get_type(sym);
@@ -102,7 +122,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	switch (input_mode) {
 	case oldconfig:
 	case syncconfig:
-		if (sym_has_value(sym)) {
+		if (sym_has_value(sym) && !may_need_string_update(sym, def)) {
 			printf("%s\n", def);
 			return 0;
 		}
@@ -137,8 +157,19 @@ static int conf_string(struct menu *menu)
 		printf("%*s%s ", indent - 1, "", menu->prompt->text);
 		printf("(%s) ", sym->name);
 		def = sym_get_string_value(sym);
-		if (def)
-			printf("[%s] ", def);
+		if (def) {
+			if (may_need_string_update(sym, def)) {
+				indent += 2;
+				printf("\n%*sDefault value is [%s]\n",
+						indent - 1, "",
+						sym_get_string_default(sym));
+				printf("%*sCurrent value is [%s] ",
+						indent - 1, "", def);
+				indent -= 2;
+			} else {
+				printf("[%s] ", def);
+			}
+		}
 		if (!conf_askvalue(sym, def))
 			return 0;
 		switch (line[0]) {
-- 
2.30.0

