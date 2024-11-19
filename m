Return-Path: <linux-kbuild+bounces-4735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B1B9D3121
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A76FBB237E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBABF1D5ADC;
	Tue, 19 Nov 2024 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdRv1Hbs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939061C3F0E;
	Tue, 19 Nov 2024 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060634; cv=none; b=ahoD9WWWiADx7cuM/My8y4dju9f5GtuUF8KrHCHvILe4KqtYRrN+aOVfT5ldymufteL4UjX2/uVZtJYTyLQU0eaxRXYv+wRWfd8met6jUPHH5qvRj2Rb7DJtrX9QlpgA3l+++O4QGvKPVclWEzoAvLfEuS0Gj317amkBAU348N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060634; c=relaxed/simple;
	bh=2UnqRtwSNUQVvRRAsV3In/KKTU4A0cy2kJZVKTbg/e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQYis1wlX2qFSdXMXNIzw6AqJ4A/rHQIv7Qhk2Qao9VOcWIb/yau2VR7EsdBQmHpwn1C9q8Z+xPdqtcJKtwSXQnH0U0iID/oVx5W6rXTseTVJ+SV/0PV3zIk1i0JPaCPgrbx25+KydNkG7liK7OkZX8TnfgPx75Pk24BP/QbKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdRv1Hbs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3509AC4CED1;
	Tue, 19 Nov 2024 23:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060634;
	bh=2UnqRtwSNUQVvRRAsV3In/KKTU4A0cy2kJZVKTbg/e4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SdRv1HbsHnCLmZLyMt1ucmJKBL5s+d0Dl2YG9QiaTtXB7GtJpdj5t4kPZUYnlpxVp
	 x50cdyQV435wYRyTIfXDE0fcFa8/IPWv2LhvesvjzfI6OSlJFX27SIDUmyh2xEZT9w
	 0MFBpebuZssiiNvZf3d6L33wCDtJqSgT7GbJptOgBXidRvSURL56WmyWb+KsTUpEzS
	 OD9xsXwTkHu94iXaDP51pJp7XMMkDTJFFFIZJXNnyQSYvtuAzlOEo+VuVLFOFOH6YE
	 Vy/dT6ITcsGyWYV/JeGktUNljPSq04Men/FCGLkz7WL0Iize4K1w2YsGJSY+Fgbe3I
	 ugQJDtuaggg9w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/15] modpost: introduce module_alias_printf() helper
Date: Wed, 20 Nov 2024 08:56:41 +0900
Message-ID: <20241119235705.1576946-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119235705.1576946-1-masahiroy@kernel.org>
References: <20241119235705.1576946-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic ->do_entry() handler is currently limited to returning
a single alias string.

However, this is not flexible enough for several subsystems, which
currently require their own implementations:

 - do_usb_table()
 - do_of_table()
 - do_pnp_device_entry()
 - do_pnp_card_entries()

This commit introduces a helper function so that these special cases can
add multiple MODULE_ALIAS() and then migrate to the generic framework.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 89 +++++++++++++++++++++++++++++-----------
 scripts/mod/modpost.c    | 11 ++++-
 scripts/mod/modpost.h    | 19 ++++++++-
 3 files changed, 91 insertions(+), 28 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 34678ed40fdb..e31619cee05e 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -10,6 +10,12 @@
  * of the GNU General Public License, incorporated herein by reference.
  */
 
+#include <stdarg.h>
+#include <stdio.h>
+
+#include "list.h"
+#include "xalloc.h"
+
 #include "modpost.h"
 #include "devicetable-offsets.h"
 
@@ -31,6 +37,56 @@ typedef Elf64_Addr	kernel_ulong_t;
 #include <ctype.h>
 #include <stdbool.h>
 
+/**
+ * module_alias_printf - add auto-generated MODULE_ALIAS()
+ *
+ * @mod: module
+ * @append_wildcard: append '*' for future extension if not exist yet
+ * @fmt: printf(3)-like format
+ */
+static void __attribute__((format (printf, 3, 4)))
+module_alias_printf(struct module *mod, bool append_wildcard,
+		    const char *fmt, ...)
+{
+	struct module_alias *new;
+	size_t len, n;
+	va_list ap;
+
+	/* Determine required size. */
+	va_start(ap, fmt);
+	n = vsnprintf(NULL, 0, fmt, ap);
+	va_end(ap);
+
+	if (n < 0) {
+		error("vsnprintf failed\n");
+		return;
+	}
+
+	len = n + 1;	/* extra byte for '\0' */
+
+	if (append_wildcard)
+		len++;	/* extra byte for '*' */
+
+	new = xmalloc(sizeof(*new) + len);
+
+	/* Now, really print it to the allocated buffer */
+	va_start(ap, fmt);
+	n = vsnprintf(new->str, len, fmt, ap);
+	va_end(ap);
+
+	if (n < 0) {
+		error("vsnprintf failed\n");
+		return;
+	}
+
+	if (append_wildcard && (n == 0 || new->str[n - 1] != '*')) {
+		new->str[n] = '*';
+		new->str[n + 1] = '\0';
+	}
+
+	list_add_tail(&new->node, &mod->aliases);
+}
+
 typedef uint32_t	__u32;
 typedef uint16_t	__u16;
 typedef unsigned char	__u8;
@@ -229,9 +285,7 @@ static void do_usb_entry(void *symval,
 	ADD(alias, "in", match_flags&USB_DEVICE_ID_MATCH_INT_NUMBER,
 	    bInterfaceNumber);
 
-	add_wildcard(alias);
-	buf_printf(&mod->dev_table_buf,
-		   "MODULE_ALIAS(\"%s\");\n", alias);
+	module_alias_printf(mod, true, "%s", alias);
 }
 
 /* Handles increment/decrement of BCD formatted integers */
@@ -375,10 +429,8 @@ static void do_of_entry_multi(void *symval, struct module *mod)
 		if (isspace(*tmp))
 			*tmp = '_';
 
-	buf_printf(&mod->dev_table_buf, "MODULE_ALIAS(\"%s\");\n", alias);
-	strcat(alias, "C");
-	add_wildcard(alias);
-	buf_printf(&mod->dev_table_buf, "MODULE_ALIAS(\"%s\");\n", alias);
+	module_alias_printf(mod, false, "%s", alias);
+	module_alias_printf(mod, false, "%sC*", alias);
 }
 
 static void do_of_table(void *symval, unsigned long size,
@@ -608,14 +660,12 @@ static void do_pnp_device_entry(void *symval, unsigned long size,
 		char acpi_id[sizeof(*id)];
 		int j;
 
-		buf_printf(&mod->dev_table_buf,
-			   "MODULE_ALIAS(\"pnp:d%s*\");\n", *id);
+		module_alias_printf(mod, false, "pnp:d%s*", *id);
 
 		/* fix broken pnp bus lowercasing */
 		for (j = 0; j < sizeof(acpi_id); j++)
 			acpi_id[j] = toupper((*id)[j]);
-		buf_printf(&mod->dev_table_buf,
-			   "MODULE_ALIAS(\"acpi*:%s:*\");\n", acpi_id);
+		module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
 	}
 }
 
@@ -666,14 +716,12 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 				char acpi_id[PNP_ID_LEN];
 				int k;
 
-				buf_printf(&mod->dev_table_buf,
-					   "MODULE_ALIAS(\"pnp:d%s*\");\n", id);
+				module_alias_printf(mod, false, "pnp:d%s*", id);
 
 				/* fix broken pnp bus lowercasing */
 				for (k = 0; k < sizeof(acpi_id); k++)
 					acpi_id[k] = toupper(id[k]);
-				buf_printf(&mod->dev_table_buf,
-					   "MODULE_ALIAS(\"acpi*:%s:*\");\n", acpi_id);
+				module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
 			}
 		}
 	}
@@ -1534,8 +1582,7 @@ static void do_table(void *symval, unsigned long size,
 
 	for (i = 0; i < size; i += id_size) {
 		if (do_entry(mod->name, symval+i, alias)) {
-			buf_printf(&mod->dev_table_buf,
-				   "MODULE_ALIAS(\"%s\");\n", alias);
+			module_alias_printf(mod, false, "%s", alias);
 		}
 	}
 }
@@ -1660,11 +1707,3 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	}
 	free(zeros);
 }
-
-/* Now add out buffered information to the generated C source */
-void add_moddevtable(struct buffer *buf, struct module *mod)
-{
-	buf_printf(buf, "\n");
-	buf_write(buf, mod->dev_table_buf.p, mod->dev_table_buf.pos);
-	free(mod->dev_table_buf.p);
-}
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..1948d69ce2b9 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -176,6 +176,7 @@ static struct module *new_module(const char *name, size_t namelen)
 	INIT_LIST_HEAD(&mod->unresolved_symbols);
 	INIT_LIST_HEAD(&mod->missing_namespaces);
 	INIT_LIST_HEAD(&mod->imported_namespaces);
+	INIT_LIST_HEAD(&mod->aliases);
 
 	memcpy(mod->name, name, namelen);
 	mod->name[namelen] = '\0';
@@ -1966,6 +1967,7 @@ static void write_vmlinux_export_c_file(struct module *mod)
 static void write_mod_c_file(struct module *mod)
 {
 	struct buffer buf = { };
+	struct module_alias *alias, *next;
 	char fname[PATH_MAX];
 	int ret;
 
@@ -1973,7 +1975,14 @@ static void write_mod_c_file(struct module *mod)
 	add_exported_symbols(&buf, mod);
 	add_versions(&buf, mod);
 	add_depends(&buf, mod);
-	add_moddevtable(&buf, mod);
+
+	buf_printf(&buf, "\n");
+	list_for_each_entry_safe(alias, next, &mod->aliases, node) {
+		buf_printf(&buf, "MODULE_ALIAS(\"%s\");\n", alias->str);
+		list_del(&alias->node);
+		free(alias);
+	}
+
 	add_srcversion(&buf, mod);
 
 	ret = snprintf(fname, sizeof(fname), "%s.mod.c", mod->name);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index ada3a36cc4bc..52efe0026b34 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -79,6 +79,22 @@ buf_printf(struct buffer *buf, const char *fmt, ...);
 void
 buf_write(struct buffer *buf, const char *s, int len);
 
+/**
+ * struct module_alias - auto-generated MODULE_ALIAS()
+ *
+ * @node: linked to module::aliases
+ * @str: a string for MODULE_ALIAS()
+ */
+struct module_alias {
+	struct list_head node;
+	char str[];
+};
+
+/**
+ * struct module - represent a module (vmlinux or *.ko)
+ *
+ * @aliases: list head for module_aliases
+ */
 struct module {
 	struct list_head list;
 	struct list_head exported_symbols;
@@ -89,12 +105,12 @@ struct module {
 	bool seen;
 	bool has_init;
 	bool has_cleanup;
-	struct buffer dev_table_buf;
 	char	     srcversion[25];
 	// Missing namespace dependencies
 	struct list_head missing_namespaces;
 	// Actual imported namespaces
 	struct list_head imported_namespaces;
+	struct list_head aliases;
 	char name[];
 };
 
@@ -170,7 +186,6 @@ Elf_Sym *symsearch_find_nearest(struct elf_info *elf, Elf_Addr addr,
 /* file2alias.c */
 void handle_moddevtable(struct module *mod, struct elf_info *info,
 			Elf_Sym *sym, const char *symname);
-void add_moddevtable(struct buffer *buf, struct module *mod);
 
 /* sumversion.c */
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
-- 
2.43.0


