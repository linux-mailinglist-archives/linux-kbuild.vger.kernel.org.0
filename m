Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79261D2D70
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2019 17:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfJJPQM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Oct 2019 11:16:12 -0400
Received: from mail-wr1-f74.google.com ([209.85.221.74]:34524 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfJJPQM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Oct 2019 11:16:12 -0400
Received: by mail-wr1-f74.google.com with SMTP id k4so2907862wru.1
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2019 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Y7ERq1vOAb4P6OVyn+rqCp0+ljmoZfgDdlBD0MqNniU=;
        b=ZhzFuP3FOMTxwfbD48EDlvwpfK0KTTJ/i3ZXPEz41gQiXb6hLPQYqwSOWTQWVfHrzz
         gd9aafGipdz1MgPpAuoDaYT4KQXesN3DMW13T0whcn5tVF2zrQPh1hLRCDSu7rRHGst8
         xC8c6Q25EQ9XqOjt6hsPBI0YIjLkInr1Rry2bW63Smmtvr+jSZ31XjlKrrIORP2bGp3C
         vS8B/zu3jcSRCY3dIW8Lj5H1emZmjvPb0o74f1qOG1w5+Sw5hzfK34cchOLCS3KYlmpa
         1Tj/Ki7uhDZePHBZ6F3UpzpyYp58mx0n7uAID/GK7fphs8GILwXP316vNXivU+d0oBAp
         Pbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Y7ERq1vOAb4P6OVyn+rqCp0+ljmoZfgDdlBD0MqNniU=;
        b=rRUYZNqpflAInoaZE00HsO3ROqfEUOEisaqvSfjXvCR3QXsJJKdoTt2XT2dQmDYlB4
         p4TR+R8kB5Iz7uPuuJfApKNk+kjAw7d10vhbgOcoxcgSiM21Qt4MiW4mSeJ6fsotXHIi
         RcuA6TqNogwzrHBefYVahXMktK+kvFkmgtW5hDw5WtGNtnzXzdOJsynKaYie208r9fmn
         md8D52lALtFb0L2p2ig302RdJRgo5tO5akUZC3kZL4rUb1Qp8IT+/hSsTdOCZd2/bdXB
         tR7NHW59ZfKkZBph1kahSDSxd8uaoCLo72a1bjly1seSI3l9APbxp/7ItfX+OGnM5CWE
         TcmQ==
X-Gm-Message-State: APjAAAWjIQdfvIUN4RUuk2Y9FNVi4xr58NEmIEOy5W5XGV2bTFRooYyP
        rjkVHraun210msGTCqoAX3I32/U/W3WlQQ==
X-Google-Smtp-Source: APXvYqxjAr+N7i/RkWKKcwRi9hVZxIL6hl1Bid9JkRWXXXVPiJkKmN16dnksq974vobJaVSygzWjJkVvadyAvA==
X-Received: by 2002:a5d:4302:: with SMTP id h2mr9468530wrq.35.1570720568753;
 Thu, 10 Oct 2019 08:16:08 -0700 (PDT)
Date:   Thu, 10 Oct 2019 16:14:42 +0100
In-Reply-To: <20191010151443.7399-1-maennich@google.com>
Message-Id: <20191010151443.7399-4-maennich@google.com>
Mime-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
Subject: [PATCH 3/4] symbol namespaces: revert to previous __ksymtab name scheme
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The introduction Symbol Namespaces changed the naming schema of the
__ksymtab entries from __kysmtab__symbol to __ksymtab_NAMESPACE.symbol.

That caused some breakages in tools that depend on the name layout in
either the binaries(vmlinux,*.ko) or in System.map. E.g. kmod's depmod
would not be able to read System.map without a patch to support symbol
namespaces. A warning reported by depmod for namespaced symbols would
look like

  depmod: WARNING: [...]/uas.ko needs unknown symbol usb_stor_adjust_quirks

In order to address this issue, revert to the original naming scheme and
rather read the __kstrtabns_<symbol> entries and their corresponding
values from __ksymtab_strings to update the namespace values for
symbols. After having read all symbols and handled them in
handle_modversions(), the symbols are created. In a second pass, read
the __kstrtabns_ entries and update the namespaces accordingly.

Suggested-by: Jessica Yu <jeyu@kernel.org>
Fixes: 8651ec01daed ("module: add support for symbol namespaces.")
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 include/linux/export.h | 13 +++++--------
 scripts/mod/modpost.c  | 33 ++++++++++++++++++---------------
 scripts/mod/modpost.h  |  1 +
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 621158ecd2e2..f24b86d7dd4d 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -18,8 +18,6 @@ extern struct module __this_module;
 #define THIS_MODULE ((struct module *)0)
 #endif
 
-#define NS_SEPARATOR "."
-
 #ifdef CONFIG_MODVERSIONS
 /* Mark the CRC weak since genksyms apparently decides not to
  * generate a checksums for some symbols */
@@ -48,11 +46,11 @@ extern struct module __this_module;
  * absolute relocations that require runtime processing on relocatable
  * kernels.
  */
-#define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
+#define __KSYMTAB_ENTRY_NS(sym, sec)					\
 	__ADDRESSABLE(sym)						\
 	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
 	    "	.balign	4					\n"	\
-	    "__ksymtab_" #ns NS_SEPARATOR #sym ":		\n"	\
+	    "__ksymtab_" #sym ":				\n"	\
 	    "	.long	" #sym "- .				\n"	\
 	    "	.long	__kstrtab_" #sym "- .			\n"	\
 	    "	.long	__kstrtabns_" #sym "- .			\n"	\
@@ -74,9 +72,8 @@ struct kernel_symbol {
 	int namespace_offset;
 };
 #else
-#define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
-	static const struct kernel_symbol __ksymtab_##sym##__##ns	\
-	asm("__ksymtab_" #ns NS_SEPARATOR #sym)				\
+#define __KSYMTAB_ENTRY_NS(sym, sec)					\
+	static const struct kernel_symbol __ksymtab_##sym		\
 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
 	__aligned(sizeof(void *))					\
 	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtabns_##sym }
@@ -115,7 +112,7 @@ struct kernel_symbol {
 	static const char __kstrtabns_##sym[]				\
 	__attribute__((section("__ksymtab_strings"), used, aligned(1)))	\
 	= #ns;								\
-	__KSYMTAB_ENTRY_NS(sym, sec, ns)
+	__KSYMTAB_ENTRY_NS(sym, sec)
 
 #define ___EXPORT_SYMBOL(sym, sec)					\
 	___export_symbol_common(sym, sec);				\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 46137b730447..7cf0065ac95f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -348,18 +348,11 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 		return export_unknown;
 }
 
-static char *sym_extract_namespace(const char **symname)
+static const char *namespace_from_kstrtabns(struct elf_info *info,
+					    Elf_Sym *kstrtabns)
 {
-	char *namespace = NULL;
-	char *ns_separator;
-
-	ns_separator = strchr(*symname, '.');
-	if (ns_separator) {
-		namespace = NOFAIL(strndup(*symname, ns_separator - *symname));
-		*symname = ns_separator + 1;
-	}
-
-	return namespace;
+	char *value = info->ksymtab_strings + kstrtabns->st_value;
+	return value[0] ? value : NULL;
 }
 
 static void sym_update_namespace(const char *symname, const char *namespace)
@@ -597,6 +590,10 @@ static int parse_elf(struct elf_info *info, const char *filename)
 			info->export_unused_gpl_sec = i;
 		else if (strcmp(secname, "__ksymtab_gpl_future") == 0)
 			info->export_gpl_future_sec = i;
+		else if (strcmp(secname, "__ksymtab_strings") == 0)
+			info->ksymtab_strings = (void *)hdr +
+						sechdrs[i].sh_offset -
+						sechdrs[i].sh_addr;
 
 		if (sechdrs[i].sh_type == SHT_SYMTAB) {
 			unsigned int sh_link_idx;
@@ -686,7 +683,6 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 	enum export export;
 	bool is_crc = false;
 	const char *name;
-	char *namespace;
 
 	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
 	    strstarts(symname, "__ksymtab"))
@@ -759,10 +755,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 		/* All exported symbols */
 		if (strstarts(symname, "__ksymtab_")) {
 			name = symname + strlen("__ksymtab_");
-			namespace = sym_extract_namespace(&name);
 			sym_add_exported(name, mod, export);
-			sym_update_namespace(name, namespace);
-			free(namespace);
 		}
 		if (strcmp(symname, "init_module") == 0)
 			mod->has_init = 1;
@@ -2058,6 +2051,16 @@ static void read_symbols(const char *modname)
 		handle_moddevtable(mod, &info, sym, symname);
 	}
 
+	/* Apply symbol namespaces from __kstrtabns_<symbol> entries. */
+	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
+		symname = remove_dot(info.strtab + sym->st_name);
+
+		if (strstarts(symname, "__kstrtabns_"))
+			sym_update_namespace(symname + strlen("__kstrtabns_"),
+					     namespace_from_kstrtabns(&info,
+								      sym));
+	}
+
 	// check for static EXPORT_SYMBOL_* functions && global vars
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		unsigned char bind = ELF_ST_BIND(sym->st_info);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 92a926d375d2..ad271bc6c313 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -143,6 +143,7 @@ struct elf_info {
 	Elf_Section  export_gpl_sec;
 	Elf_Section  export_unused_gpl_sec;
 	Elf_Section  export_gpl_future_sec;
+	char	     *ksymtab_strings;
 	char         *strtab;
 	char	     *modinfo;
 	unsigned int modinfo_len;
-- 
2.23.0.581.g78d2f28ef7-goog

