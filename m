Return-Path: <linux-kbuild+bounces-3167-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9895C3D0
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 05:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F74EB234A5
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 03:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B6E38DCF;
	Fri, 23 Aug 2024 03:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aQYmE+WA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9F358A7;
	Fri, 23 Aug 2024 03:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724384701; cv=none; b=UWCOS45FnfDuhqLjfw45vOdVIKs6qdSFhiZCJB04qBvzviiqC/zwNvPWVgH6NQh3v4Jc0YVJ3kzeE2aiiVz69u1zvmSUzYn7Uy7doQAAcqtSHCSj7ENmtYvea2yocaqhAn1royIN8nWITzDdD7L4aa16DnIDq+w2Q/wz8h/Fe6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724384701; c=relaxed/simple;
	bh=f5j4T1zuHheYIty0ZNULjnN6/85Piw7KvBoRvCArUZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ruf4kgdiufkPm17jqA8zZsmlQJb4W2Ks+UjNMLjbcYDw+nEOQ13bhe0vMM07tQXP1yQIcYtaNT8yJYXaP5ay0yM4wJBTbzvWKMsKvSn5lQvocn+RPhyXarQzJ8ED/g3mJ9GkFvuRaXIdgDLy7p7q/N2zEfM5Eo0rcIBN3H6e620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aQYmE+WA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZbA8n42t9CxgvDRYbiYT3EuJtPojyJkvzzVRT34YIOU=; b=aQYmE+WAdd9zb1jKBNBjEhfgxh
	oRbg+2UEkSplfYsg4HxKJ2/wf/H6T4psyWAKp3g3xyMIpujiEt+i40noBQGT7PhtMk4LBwILs5lz8
	zC9GkcK60Tctj7N8RNVYsM4OJpVBxYv4ap5c11KIXp0jh37C/qm4r83JDzr4wKca/Z+nhMI9IVV18
	Wr2f/PsAmoBgd1HPEwAq/CfweC/6OfMeDL5FLTv0tdE+eTufzWpgd+4vMHkiuzcw7hF/zhFKZrk4c
	WtRDn8towIYd4JH66apPgMVCTzAgo1Acyf3fY9aMd1jmO6krEGgibwCxplqqhpNbx8rLWO3tYgjR8
	2SKh3/Bw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shLEQ-0000000F4wX-3U2r;
	Fri, 23 Aug 2024 03:44:58 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: masahiroy@kernel.org,
	kdevops@lists.linux.dev
Cc: mcgrof@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] kconfig: add optional selective yaml output support
Date: Thu, 22 Aug 2024 20:44:55 -0700
Message-ID: <20240823034455.3593819-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

kconfig is used outside of Linux, and one of the uses of Kconfig is to
also allow kconfig to be used for automation on kdevops by leveraging
a smaller subset of variables for yaml run time for ansible runs.
There is no need to clutter a full yaml file with every single config
we have as we do in the kernel, and so this lets users decide if they
want all or just a few select key symbols as part of the yaml output.

What this will do is save us the pain of doing the selective transformation
we currently do and let's us only annotate what we need for runtime with
ansible.

You can test with the Linux kernel config (that's not what we use):

export KCONFIG_YAMLCFG=".yaml"
export KCONFIG_YAMLCFG_ALL="y"
rm -f .config .yaml
make defconfig
head -10 .yaml
---
cc_version_text: "gcc (Debian 13.3.0-1) 13.3.0"
cc_is_gcc: True
gcc_version: 130300
clang_version: 0
as_is_gnu: True
as_version: 24250
ld_is_bfd: True
ld_version: 24250
lld_version: 0

You can also use the selective mechanism "output yaml" on any symbol,
so that we only output those. This also paves the way to let us later
use kconfig for direct json transformations directly from the same
kconfig logic.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---

Long ago, I envisioned we could do this so to simplify the addition of
new workflows and remove all the stupid Makefile transformations we have
in kdevops today to generate extra_vars.yaml.

Feedback welcome.

I completley understand if this is not desirable upstream. However
kdevops does aim to track kconfig upstream using a git sub tree already,
it follows linux-next, and so getting support upstream is easier rather
than going with a branch for our git subtree.

The only puzzle I have is why when we use the selective method, we end
up with tons of empty lines.. Any ideas? Example of how one can use this
this on random symbols in case it is not clear, with the selective
method:

If we use this for example:

  diff --git a/fs/efivarfs/Kconfig b/fs/efivarfs/Kconfig
  index edec8a19c894..2faf651725dc 100644
  --- a/fs/efivarfs/Kconfig
  +++ b/fs/efivarfs/Kconfig
  @@ -3,6 +3,7 @@ config EFIVAR_FS
   	tristate "EFI Variable filesystem"
   	depends on EFI
   	default m
  +	output yaml
   	help
   	  efivarfs is a replacement filesystem for the old EFI
   	  variable support via sysfs, as it doesn't suffer from the

In this case we'd end up with just:

export KCONFIG_YAMLCFG=".yaml"
unset KCONFIG_YAMLCFG_ALL
rm -f .config .yaml
make defconfig
cat .yaml | cat -s
---

efivar_fs: m

Thoughts?

 scripts/kconfig/confdata.c | 152 ++++++++++++++++++++++++++++++++++++-
 scripts/kconfig/expr.h     |   1 +
 scripts/kconfig/lexer.l    |   2 +
 scripts/kconfig/parser.y   |  11 +++
 4 files changed, 163 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 76193ce5a792..78d188320040 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -233,6 +233,20 @@ static const char *conf_get_rustccfg_name(void)
 	return name ? name : "include/generated/rustc_cfg";
 }
 
+static bool conf_yaml_enable_all(void)
+{
+	char *name = getenv("KCONFIG_YAMLCFG_ALL");
+
+	return name ? true: false;
+}
+
+static const char *conf_get_yaml_config_name(void)
+{
+	char *name = getenv("KCONFIG_YAMLCFG");
+
+	return name ? name : NULL;
+}
+
 static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 {
 	char *p2;
@@ -623,9 +637,103 @@ static void __print_symbol(FILE *fp, struct symbol *sym, enum output_n output_n,
 	free(escaped);
 }
 
-static void print_symbol_for_dotconfig(FILE *fp, struct symbol *sym)
+static char *conf_name_to_yaml(struct symbol *sym)
+{
+	const char *name = sym->name;
+	size_t len = strlen(name);
+	size_t i, j = 0;
+	char *yaml_name = (char *) malloc(len + 1);
+
+	if (!yaml_name)
+		return NULL;
+
+	for (i = 0; i < len; i++) {
+		if (name[i] == '_')
+			yaml_name[j++] = '_';
+		else
+			yaml_name[j++] = tolower(name[i]);
+	}
+
+	yaml_name[j] = '\0';
+
+    return yaml_name;
+}
+
+static char *conf_value_to_yaml(struct symbol *sym, const char *val)
+{
+	char *yaml_value = NULL;
+
+	switch (sym->type) {
+	case S_INT:
+		yaml_value = strdup(val);
+		break;
+	case S_HEX:
+            asprintf(&yaml_value, "0x%s", val);
+            break;
+        case S_STRING:
+	    /* Wrap strings in quotes */
+            asprintf(&yaml_value, "\"%s\"", val);
+            break;
+        case S_BOOLEAN:
+        case S_TRISTATE:
+		if (strcmp(val, "y") == 0)
+			yaml_value = strdup("True");
+		else if (strcmp(val, "n") == 0)
+			yaml_value = strdup("False");
+		else
+			yaml_value = strdup(val); /* m in tristate */
+		break;
+        default:
+		/* In case type is unknown */
+		yaml_value = strdup(val);
+		break;
+	}
+
+	return yaml_value;
+}
+
+static void __print_yaml_symbol(FILE *fp, struct symbol *sym,
+				enum output_n output_n,
+				bool escape_string)
+{
+	const char *val;
+	char *yaml_config = NULL;
+	char *yaml_config_value = NULL;
+
+	if (!fp || sym->type == S_UNKNOWN)
+		return;
+	if (!conf_yaml_enable_all() && !(sym->flags & SYMBOL_YAML))
+		return;
+
+	val = sym_get_string_value(sym);
+
+	yaml_config = conf_name_to_yaml(sym);
+	if (!yaml_config)
+		return;
+
+	yaml_config_value = conf_value_to_yaml(sym, val);
+	if (!yaml_config_value) {
+		free(yaml_config);
+		return;
+	}
+
+	if ((sym->type == S_BOOLEAN || sym->type == S_TRISTATE) &&
+	    output_n != OUTPUT_N && *val == 'n') {
+		if (output_n == OUTPUT_N_AS_UNSET && conf_yaml_enable_all())
+			fprintf(fp, "# %s: False\n", yaml_config);
+		return;
+	}
+
+	fprintf(fp, "%s: %s\n", yaml_config, yaml_config_value);
+
+	free(yaml_config);
+	free(yaml_config_value);
+}
+
+static void print_symbol_for_dotconfig(FILE *fp, FILE *yaml, struct symbol *sym)
 {
 	__print_symbol(fp, sym, OUTPUT_N_AS_UNSET, true);
+	__print_yaml_symbol(yaml, sym, OUTPUT_N_AS_UNSET, true);
 }
 
 static void print_symbol_for_autoconf(FILE *fp, struct symbol *sym)
@@ -748,11 +856,24 @@ int conf_write_defconfig(const char *filename)
 	struct symbol *sym;
 	struct menu *menu;
 	FILE *out;
+	FILE *yaml_out = NULL;
+	const char *yaml_config = NULL;
+
+	yaml_config = conf_get_yaml_config_name();
 
 	out = fopen(filename, "w");
 	if (!out)
 		return 1;
 
+	if (yaml_config) {
+		yaml_out = fopen(yaml_config, "w");
+		if (!yaml_out) {
+			fclose(out);
+			return 1;
+		}
+		fprintf(yaml_out, "---\n");
+	}
+
 	sym_clear_all_valid();
 
 	menu_for_each_entry(menu) {
@@ -783,21 +904,25 @@ int conf_write_defconfig(const char *filename)
 			if (sym == ds && sym_get_tristate_value(sym) == yes)
 				continue;
 		}
-		print_symbol_for_dotconfig(out, sym);
+		print_symbol_for_dotconfig(out, yaml_out, sym);
 	}
 	fclose(out);
+	if (yaml_out)
+		fclose(yaml_out);
 	return 0;
 }
 
 int conf_write(const char *name)
 {
 	FILE *out;
+	FILE *yaml_out = NULL;
 	struct symbol *sym;
 	struct menu *menu;
 	const char *str;
 	char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
 	char *env;
 	bool need_newline = false;
+	const char *yaml_config;
 
 	if (!name)
 		name = conf_get_configname();
@@ -815,18 +940,33 @@ int conf_write(const char *name)
 	if (make_parent_dir(name))
 		return -1;
 
+	yaml_config = conf_get_yaml_config_name();
+
 	env = getenv("KCONFIG_OVERWRITECONFIG");
 	if (env && *env) {
 		*tmpname = 0;
 		out = fopen(name, "w");
+		if (yaml_config)
+			yaml_out = fopen(yaml_config, "w");
 	} else {
 		snprintf(tmpname, sizeof(tmpname), "%s.%d.tmp",
 			 name, (int)getpid());
 		out = fopen(tmpname, "w");
+		if (yaml_config)
+			yaml_out = fopen(yaml_config, "w");
 	}
 	if (!out)
 		return 1;
 
+	if (yaml_config) {
+		if (!yaml_out) {
+			fclose(out);
+			return 1;
+		}
+		fprintf(yaml_out, "---\n");
+	}
+
+
 	conf_write_heading(out, &comment_style_pound);
 
 	if (!conf_get_changed())
@@ -852,9 +992,11 @@ int conf_write(const char *name)
 			if (need_newline) {
 				fprintf(out, "\n");
 				need_newline = false;
+				if (yaml_config)
+					fprintf(yaml_out, "\n");
 			}
 			sym->flags |= SYMBOL_WRITTEN;
-			print_symbol_for_dotconfig(out, sym);
+			print_symbol_for_dotconfig(out, yaml_out, sym);
 		}
 
 next:
@@ -879,6 +1021,8 @@ int conf_write(const char *name)
 		}
 	}
 	fclose(out);
+	if (yaml_out)
+		fclose(yaml_out);
 
 	for_all_symbols(sym)
 		sym->flags &= ~SYMBOL_WRITTEN;
@@ -898,6 +1042,8 @@ int conf_write(const char *name)
 	}
 
 	conf_message("configuration written to %s", name);
+	if (yaml_config)
+		conf_message("yaml configuration written to %s", yaml_config);
 
 	conf_set_changed(false);
 
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 2bc96cd28253..88e8a2a06f67 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -132,6 +132,7 @@ struct symbol {
 #define SYMBOL_CHECK      0x0008  /* used during dependency checking */
 #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
 #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
+#define SYMBOL_YAML       0x0400  /* write symbol to file (KCONFIG_YAMLCFG) */
 #define SYMBOL_WRITTEN    0x0800  /* track info to avoid double-write to .config */
 #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
 #define SYMBOL_WARNED     0x8000  /* warning has been issued */
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 8dd597c4710d..190937070fb1 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -120,6 +120,7 @@ n	[A-Za-z0-9_-]
 "menuconfig"		return T_MENUCONFIG;
 "modules"		return T_MODULES;
 "on"			return T_ON;
+"output"		return T_OUTPUT;
 "prompt"		return T_PROMPT;
 "range"			return T_RANGE;
 "select"		return T_SELECT;
@@ -127,6 +128,7 @@ n	[A-Za-z0-9_-]
 "string"		return T_STRING;
 "tristate"		return T_TRISTATE;
 "visible"		return T_VISIBLE;
+"yaml"			return T_YAML;
 "||"			return T_OR;
 "&&"			return T_AND;
 "="			return T_EQUAL;
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 61900feb4254..f298f052dddc 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -69,6 +69,7 @@ struct menu *current_menu, *current_entry, *current_choice;
 %token T_MODULES
 %token T_ON
 %token T_OPEN_PAREN
+%token T_OUTPUT
 %token T_PLUS_EQUAL
 %token T_PROMPT
 %token T_RANGE
@@ -77,6 +78,7 @@ struct menu *current_menu, *current_entry, *current_choice;
 %token T_STRING
 %token T_TRISTATE
 %token T_VISIBLE
+%token T_YAML
 %token T_EOL
 %token <string> T_ASSIGN_VAL
 
@@ -234,6 +236,15 @@ config_option: T_MODULES T_EOL
 	modules_sym = current_entry->sym;
 };
 
+/* When we want to output symbols as part of an additional output formats */
+
+config_option: T_OUTPUT T_YAML T_EOL
+{
+	printd(DEBUG_PARSE, "%s will be part of the yaml output file %s:%d:\n",
+	       current_entry->sym->name, cur_filename, cur_lineno);
+	current_entry->sym->flags |= SYMBOL_YAML;
+};
+
 /* choice entry */
 
 choice: T_CHOICE T_EOL
-- 
2.43.0


