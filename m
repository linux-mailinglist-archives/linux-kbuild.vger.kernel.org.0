Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15387AB606
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2019 12:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391359AbfIFKdn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Sep 2019 06:33:43 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:51442 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392037AbfIFKcz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 06:32:55 -0400
Received: by mail-qk1-f201.google.com with SMTP id w20so4949380qka.18
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2019 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=TomRv8WBRCsnjt12ZHD1+VdCr+4pjb/fkJlpjNFFLG4=;
        b=I1ZteSFABV4IgRgiFXzn73P+TR6Qe+ghmv/Z1G0/keBf3DnJ39fu4n4dD1h/bm6r9s
         5Y4mZF+oSUWiMSPpiDD6zFUm1wFhpuAXzzGXFHpuLF92oRlwY1X3Jh+9vUH8UKLyz6IF
         6kLvXmvkqxENPkwfuUAzQ3TDX4twk9kc86fUYYSsNXhunrBsqa44OC0gjVgg0+AmJZIT
         zGtp9H7TbZonJKgeAKch1exKk83+bq0vm6+BZbdWh2/caUlQOP/CPaTL5VR6FUxJ/O3S
         AnFLAfIsgVervsSMS6xLcpKxUrIlNAVQBB/Bpx5FW2KpP29eACj4j3TyGM0iqCXUx2U+
         ASBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TomRv8WBRCsnjt12ZHD1+VdCr+4pjb/fkJlpjNFFLG4=;
        b=tkunqffEBx1TNxKVCrwbGwcZHBrSKATaMR2Empw0w7LOUpt2Mc/kiUMdC2nUS0H3PT
         7LpZa328BV0uOHwT+NiNlEPlgiq625hHzEnjNR+UAJPv8Cr1g69PCY+2sw2db3mSPQuK
         bV8P0veSncT3KrNQ1qvH3/EGtOKWGF7Rx8710AMY7grgcYuJeRDiDK4EVpQe8J/elaY7
         MjqKTyx7930/qILz+R4ZUaOmuKj9rotyy6VM5kmpAhKVpkZ0pTaU8gHAdXcdwM/Ho8RO
         hOD/t2JWQ45yLCNEFFcgc/LcmAeEbvYlFm2cKzte9EYjifMBr8llTKjAoruPVA+8HUCr
         P7YQ==
X-Gm-Message-State: APjAAAWPQNbSrsyRbt6ZBu0K2TZ0kiUiCg4ZGkLzM1RAI3NT72NGRNQG
        kiFmkfQGjfXthvy5TUzXrYNEb24fpN3/kA==
X-Google-Smtp-Source: APXvYqyDn+T0Z+Hqc052d9zJPG/ISkUYZLbXQ7SccsDvJt+1GEC1G3Hbsr6G6SxcYf4p7gYgcRKBvnoI0ZZ0Jw==
X-Received: by 2002:a37:7e84:: with SMTP id z126mr7276344qkc.448.1567765973885;
 Fri, 06 Sep 2019 03:32:53 -0700 (PDT)
Date:   Fri,  6 Sep 2019 11:32:28 +0100
In-Reply-To: <20190906103235.197072-1-maennich@google.com>
Message-Id: <20190906103235.197072-5-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190906103235.197072-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v5 04/11] modpost: add support for symbol namespaces
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add support for symbols that are exported into namespaces. For that,
extract any namespace suffix from the symbol name. In addition, emit a
warning whenever a module refers to an exported symbol without
explicitly importing the namespace that it is defined in. This patch
consistently adds the namespace suffix to symbol names exported into
Module.symvers.

Example warning emitted by modpost in case of the above violation:

 WARNING: module ums-usbat uses symbol usb_stor_resume from namespace
 USB_STORAGE, but does not import it.

Co-developed-by: Martijn Coenen <maco@android.com>
Signed-off-by: Martijn Coenen <maco@android.com>
Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 Documentation/kbuild/modules.rst |   7 ++-
 scripts/export_report.pl         |   2 +-
 scripts/mod/modpost.c            | 104 ++++++++++++++++++++++++++-----
 scripts/mod/modpost.h            |   7 +++
 4 files changed, 101 insertions(+), 19 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 24e763482650..d2ae799237fd 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -470,9 +470,12 @@ build.
 
 	The syntax of the Module.symvers file is::
 
-		<CRC>	    <Symbol>	       <module>
+	<CRC>       <Symbol>          <Namespace>  <Module>                         <Export Type>
 
-		0x2d036834  scsi_remove_host   drivers/scsi/scsi_mod
+	0xe1cc2a05  usb_stor_suspend  USB_STORAGE  drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL
+
+	The fields are separated by tabs and values may be empty (e.g.
+	if no namespace is defined for an exported symbol).
 
 	For a kernel build without CONFIG_MODVERSIONS enabled, the CRC
 	would read 0x00000000.
diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index 7d3030d03a25..548330e8c4e7 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -94,7 +94,7 @@ if (defined $opt{'o'}) {
 #
 while ( <$module_symvers> ) {
 	chomp;
-	my (undef, $symbol, $module, $gpl) = split;
+	my (undef, $symbol, $namespace, $module, $gpl) = split('\t');
 	$SYMBOL { $symbol } =  [ $module , "0" , $symbol, $gpl];
 }
 close($module_symvers);
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f277e116e0eb..c2d49afaea1c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -164,6 +164,7 @@ struct symbol {
 	struct module *module;
 	unsigned int crc;
 	int crc_valid;
+	const char *namespace;
 	unsigned int weak:1;
 	unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
 	unsigned int kernel:1;     /* 1 if symbol is from kernel
@@ -233,6 +234,37 @@ static struct symbol *find_symbol(const char *name)
 	return NULL;
 }
 
+static bool contains_namespace(struct namespace_list *list,
+			       const char *namespace)
+{
+	struct namespace_list *ns_entry;
+
+	for (ns_entry = list; ns_entry != NULL; ns_entry = ns_entry->next)
+		if (strcmp(ns_entry->namespace, namespace) == 0)
+			return true;
+
+	return false;
+}
+
+static void add_namespace(struct namespace_list **list, const char *namespace)
+{
+	struct namespace_list *ns_entry;
+
+	if (!contains_namespace(*list, namespace)) {
+		ns_entry = NOFAIL(malloc(sizeof(struct namespace_list) +
+					 strlen(namespace) + 1));
+		strcpy(ns_entry->namespace, namespace);
+		ns_entry->next = *list;
+		*list = ns_entry;
+	}
+}
+
+static bool module_imports_namespace(struct module *module,
+				     const char *namespace)
+{
+	return contains_namespace(module->imported_namespaces, namespace);
+}
+
 static const struct {
 	const char *str;
 	enum export export;
@@ -312,23 +344,39 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 		return export_unknown;
 }
 
+static const char *sym_extract_namespace(const char **symname)
+{
+	size_t n;
+	char *dupsymname;
+
+	n = strcspn(*symname, ".");
+	if (n < strlen(*symname) - 1) {
+		dupsymname = NOFAIL(strdup(*symname));
+		dupsymname[n] = '\0';
+		*symname = dupsymname;
+		return dupsymname + n + 1;
+	}
+
+	return NULL;
+}
+
 /**
  * Add an exported symbol - it may have already been added without a
  * CRC, in this case just update the CRC
  **/
-static struct symbol *sym_add_exported(const char *name, struct module *mod,
-				       enum export export)
+static struct symbol *sym_add_exported(const char *name, const char *namespace,
+				       struct module *mod, enum export export)
 {
 	struct symbol *s = find_symbol(name);
 
 	if (!s) {
 		s = new_symbol(name, mod, export);
+		s->namespace = namespace;
 	} else {
 		if (!s->preloaded) {
-			warn("%s: '%s' exported twice. Previous export "
-			     "was in %s%s\n", mod->name, name,
-			     s->module->name,
-			     is_vmlinux(s->module->name) ?"":".ko");
+			warn("%s: '%s' exported twice. Previous export was in %s%s\n",
+			     mod->name, name, s->module->name,
+			     is_vmlinux(s->module->name) ? "" : ".ko");
 		} else {
 			/* In case Module.symvers was out of date */
 			s->module = mod;
@@ -620,6 +668,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 	unsigned int crc;
 	enum export export;
 	bool is_crc = false;
+	const char *name, *namespace;
 
 	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
 	    strstarts(symname, "__ksymtab"))
@@ -691,8 +740,9 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 	default:
 		/* All exported symbols */
 		if (strstarts(symname, "__ksymtab_")) {
-			sym_add_exported(symname + strlen("__ksymtab_"), mod,
-					export);
+			name = symname + strlen("__ksymtab_");
+			namespace = sym_extract_namespace(&name);
+			sym_add_exported(name, namespace, mod, export);
 		}
 		if (strcmp(symname, "init_module") == 0)
 			mod->has_init = 1;
@@ -1943,6 +1993,7 @@ static void read_symbols(const char *modname)
 	const char *symname;
 	char *version;
 	char *license;
+	char *namespace;
 	struct module *mod;
 	struct elf_info info = { };
 	Elf_Sym *sym;
@@ -1974,6 +2025,12 @@ static void read_symbols(const char *modname)
 		license = get_next_modinfo(&info, "license", license);
 	}
 
+	namespace = get_modinfo(&info, "import_ns");
+	while (namespace) {
+		add_namespace(&mod->imported_namespaces, namespace);
+		namespace = get_next_modinfo(&info, "import_ns", namespace);
+	}
+
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 
@@ -2118,6 +2175,13 @@ static int check_exports(struct module *mod)
 			basename++;
 		else
 			basename = mod->name;
+
+		if (exp->namespace &&
+		    !module_imports_namespace(mod, exp->namespace)) {
+			warn("module %s uses symbol %s from namespace %s, but does not import it.\n",
+			     basename, exp->name, exp->namespace);
+		}
+
 		if (!mod->gpl_compatible)
 			check_for_gpl_usage(exp->export, basename, exp->name);
 		check_for_unused(exp->export, basename, exp->name);
@@ -2341,7 +2405,7 @@ static void read_dump(const char *fname, unsigned int kernel)
 		return;
 
 	while ((line = get_next_line(&pos, file, size))) {
-		char *symname, *modname, *d, *export, *end;
+		char *symname, *namespace, *modname, *d, *export, *end;
 		unsigned int crc;
 		struct module *mod;
 		struct symbol *s;
@@ -2349,7 +2413,10 @@ static void read_dump(const char *fname, unsigned int kernel)
 		if (!(symname = strchr(line, '\t')))
 			goto fail;
 		*symname++ = '\0';
-		if (!(modname = strchr(symname, '\t')))
+		if (!(namespace = strchr(symname, '\t')))
+			goto fail;
+		*namespace++ = '\0';
+		if (!(modname = strchr(namespace, '\t')))
 			goto fail;
 		*modname++ = '\0';
 		if ((export = strchr(modname, '\t')) != NULL)
@@ -2366,7 +2433,8 @@ static void read_dump(const char *fname, unsigned int kernel)
 			mod = new_module(modname);
 			mod->skip = 1;
 		}
-		s = sym_add_exported(symname, mod, export_no(export));
+		s = sym_add_exported(symname, namespace, mod,
+				     export_no(export));
 		s->kernel    = kernel;
 		s->preloaded = 1;
 		sym_update_crc(symname, mod, crc, export_no(export));
@@ -2395,16 +2463,20 @@ static void write_dump(const char *fname)
 {
 	struct buffer buf = { };
 	struct symbol *symbol;
+	const char *namespace;
 	int n;
 
 	for (n = 0; n < SYMBOL_HASH_SIZE ; n++) {
 		symbol = symbolhash[n];
 		while (symbol) {
-			if (dump_sym(symbol))
-				buf_printf(&buf, "0x%08x\t%s\t%s\t%s\n",
-					symbol->crc, symbol->name,
-					symbol->module->name,
-					export_str(symbol->export));
+			if (dump_sym(symbol)) {
+				namespace = symbol->namespace;
+				buf_printf(&buf, "0x%08x\t%s\t%s\t%s\t%s\n",
+					   symbol->crc, symbol->name,
+					   namespace ? namespace : "",
+					   symbol->module->name,
+					   export_str(symbol->export));
+			}
 			symbol = symbol->next;
 		}
 	}
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 8453d6ac2f77..9626bf3e7424 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -109,6 +109,11 @@ buf_printf(struct buffer *buf, const char *fmt, ...);
 void
 buf_write(struct buffer *buf, const char *s, int len);
 
+struct namespace_list {
+	struct namespace_list *next;
+	char namespace[0];
+};
+
 struct module {
 	struct module *next;
 	const char *name;
@@ -121,6 +126,8 @@ struct module {
 	struct buffer dev_table_buf;
 	char	     srcversion[25];
 	int is_dot_o;
+	// Actual imported namespaces
+	struct namespace_list *imported_namespaces;
 };
 
 struct elf_info {
-- 
2.23.0.187.g17f5b7556c-goog

