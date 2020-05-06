Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E9A1C70DA
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2020 14:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgEFMwy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 08:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728081AbgEFMwv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 08:52:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60994C061A0F
        for <linux-kbuild@vger.kernel.org>; Wed,  6 May 2020 05:52:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id a9so1229686lfb.8
        for <linux-kbuild@vger.kernel.org>; Wed, 06 May 2020 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ymZTEwMY57ER7bTDaldopAtkocdAn5xpbJ7AFxf0t/8=;
        b=13qzpfbqupvnlLFgA/t2qIJZv6P7k3wgzqkGBeDZsX1Bmmhgsrd7oOL9OgdGmKK6lb
         CcFWT0oW5kixD4Lsn2SDzA+bDDVyjOvkMnObipPYYzmh/vN2Z9FriHsxtILhQVVnWeVn
         ePeL4fjk4YW0JoHIavvFfwd6A0YeXwLFC0+b7YidFxpvFLn7LWR6gpFFgFF17Zm98R8f
         XpZyeYNDcIXU/DWU3xtZupRK0aHolnSVsqNcgUaFLPqSKSxg2mfc6wj3C4cL8IfKBtg6
         WL22ieppHgIdgvJOE8gYeDnHwGkdAZoHc4YcWzNWXF3uf/9DvwmwmLodtmz9QsXjqZ7N
         x/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ymZTEwMY57ER7bTDaldopAtkocdAn5xpbJ7AFxf0t/8=;
        b=UJSYMn8Zf4OfTYNSsAAXsLLuwavvBJwGNYdaqkO1V2g8hWFBfUhXEVGecy4ZLs6Mpv
         97VfdIVvmZ9UH70BoZuVCUPd8hR69WAGWqfizEFo2XZb/0f/14yLM/Et2ToSHHxyPTin
         dLwiT+sIJxuAbVbVWTQh8hmnqZP5/CJOrFvrB1LIR755bOq7uPV9UunghfDhk2iwP/Gx
         LkMLQWfgPqdgEUkP+xbXvE/EcoONLq3PKDSMrTNw0549IZ5ImpSBDD+VMsULmpLUM29W
         ZSIpOkbrTrcdTutkMOqDCgW5G+xO0OJ+Tp0ltyhBSmcxKSCC/dOO/v6gyBiCfBT0Yjff
         rVMw==
X-Gm-Message-State: AGi0PubR94Uog4xHGnRdOVaAeDCiHpDj9BIQB7npvWfBW1CglnpqxQCt
        0/8wkvY3zqFy07P4EeumlFbnkPvhh0NrFexB
X-Google-Smtp-Source: APiQypIHTp/z86RWlGknsTwKPidrqnxFi0gwunU9BacCg8/j4MUfb+I3l+o7xW2LSZjjUPTW9EQBlQ==
X-Received: by 2002:a19:380d:: with SMTP id f13mr4963597lfa.43.1588769569448;
        Wed, 06 May 2020 05:52:49 -0700 (PDT)
Received: from localhost.localdomain (91-153-194-104.elisa-laajakaista.fi. [91.153.194.104])
        by smtp.gmail.com with ESMTPSA id o204sm1578670lff.64.2020.05.06.05.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:52:49 -0700 (PDT)
From:   Jukka Kaartinen <jukka.kaartinen@unikie.com>
To:     linux-kbuild@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, lukas.bulwahn@gmail.com,
        jouni.hogander@unikie.com, dan.carpenter@oracle.com,
        Jukka Kaartinen <jukka.kaartinen@unikie.com>
Subject: [PATCH 1/2] kconfig: a new command line tool to set configs
Date:   Wed,  6 May 2020 15:52:35 +0300
Message-Id: <20200506125236.16415-2-jukka.kaartinen@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506125236.16415-1-jukka.kaartinen@unikie.com>
References: <20200506125236.16415-1-jukka.kaartinen@unikie.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

This is an ugly hack job I made last night and it barely works.  It
does two things:

1)  Sometimes I want to search for a config so I have to load
    menuconfig, then search for the config entry, then exit.  With
    this script I simply run:

	./scripts/kconfig/kconfig search COMEDI

2)  I quite often try to enable something by doing:

	echo CONFIG_FOO=y >> .config
	make oldconfig
	grep CONFIG_FOO .config

    The grep is to see if the setting worked.  Now I can do:

	./scripts/kconfig/kconfig set CONFIG_FOO=y

Parsing dependencies barely works, but that's just a matter of writing
some more code in expr_parse().

The main questions I have at this point are:

1)  If I have a symbol pointer, is it possible to get a help text from
    that?

2)  For some reason, when I do sym_set_tristate_value() it doesn't
    actually set anything until I write the config file so I have to do:

		if (sym_set_tristate_value(sym, newval)) {
			/* FIXME: if I don't write it doesn't save */
			conf_write(NULL);
			return 1;
		}

    It makes the output really messy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jukka Kaartinen <jukka.kaartinen@unikie.com>
---
 scripts/kconfig/Makefile |   7 +
 scripts/kconfig/kconfig  |  34 +++++
 scripts/kconfig/lconf.c  | 312 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 353 insertions(+)
 create mode 100755 scripts/kconfig/kconfig
 create mode 100644 scripts/kconfig/lconf.c

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 2f1a59fa5169..62af9f29b5e1 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -38,6 +38,9 @@ config: $(obj)/conf
 nconfig: $(obj)/nconf
 	$< $(silent) $(Kconfig)
 
+lconfig: $(obj)/lconf
+	$< $(silent) $(Kconfig)
+
 build_menuconfig: $(obj)/mconf
 
 build_nconfig: $(obj)/nconf
@@ -200,6 +203,10 @@ $(obj)/%.moc: $(src)/%.h $(obj)/qconf-cfg
 hostprogs-y	+= gconf
 gconf-objs	:= gconf.o images.o $(common-objs)
 
+# lconf: Used to search and turn on configs from commandline
+hostprogs-y	+= lconf
+lconf-objs	:= lconf.o $(common-objs)
+
 HOSTLDLIBS_gconf    = $(shell . $(obj)/gconf-cfg && echo $$libs)
 HOSTCFLAGS_gconf.o  = $(shell . $(obj)/gconf-cfg && echo $$cflags)
 
diff --git a/scripts/kconfig/kconfig b/scripts/kconfig/kconfig
new file mode 100755
index 000000000000..2762c8dc04a8
--- /dev/null
+++ b/scripts/kconfig/kconfig
@@ -0,0 +1,34 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+usage() {
+	echo "kconfig [search|set] string"
+	exit 1;
+}
+
+if [ "$1" = "" ] ; then
+	usage
+fi
+
+if [ "$1" = "search" ] ; then
+
+	search=$2
+	NCONFIG_MODE=kconfig_search SEARCH=${search} make lconfig
+
+elif [ "$1" = "set" ] ; then
+
+	config=$2
+	setting=$3
+
+	if [ $config = "" ] ; then
+		echo "nothing to set"
+		exit 1
+	fi
+
+	NCONFIG_MODE=kconfig_set CONFIG=${config} SETTING=${setting} make lconfig
+
+else
+	usage
+fi
+
+
diff --git a/scripts/kconfig/lconf.c b/scripts/kconfig/lconf.c
new file mode 100644
index 000000000000..cde717f36eb1
--- /dev/null
+++ b/scripts/kconfig/lconf.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015 Oracle
+ */
+#define _GNU_SOURCE
+#include <string.h>
+#include <stdlib.h>
+
+#include "lkc.h"
+#include "nconf.h"
+#include <ctype.h>
+#include <locale.h>
+#include <libintl.h>
+
+static int indent;
+static char line[128];
+
+static int get_depends(struct symbol *sym);
+
+static void strip(char *str)
+{
+	char *p = str;
+	int l;
+
+	while ((isspace(*p)))
+		p++;
+	l = strlen(p);
+	if (p != str)
+		memmove(str, p, l + 1);
+	if (!l)
+		return;
+	p = str + l - 1;
+	while ((isspace(*p)))
+		*p-- = 0;
+}
+
+static void xfgets(char *str, int size, FILE *in)
+{
+	if (fgets(str, size, in) == NULL)
+		fprintf(stderr, "\nError in reading or end of file.\n");
+}
+
+static int conf_askvalue(struct symbol *sym, const char *def)
+{
+	enum symbol_type type = sym_get_type(sym);
+
+	if (!sym_has_value(sym))
+		printf("(NEW) ");
+
+	line[0] = '\n';
+	line[1] = 0;
+
+	if (!sym_is_changeable(sym)) {
+		printf("%s\n", def);
+		line[0] = '\n';
+		line[1] = 0;
+		return 0;
+	}
+
+	fflush(stdout);
+	xfgets(line, 128, stdin);
+
+	switch (type) {
+	case S_INT:
+	case S_HEX:
+	case S_STRING:
+		printf("%s\n", def);
+		return 1;
+	default:
+		break;
+	}
+	printf("%s", line);
+	return 1;
+}
+
+static struct property *get_symbol_prop(struct symbol *sym)
+{
+	struct property *prop = NULL;
+
+	for_all_properties(sym, prop, P_SYMBOL)
+		break;
+	return prop;
+}
+
+static int conf_sym(struct symbol *sym)
+{
+	tristate oldval, newval;
+	struct property *prop;
+
+	while (1) {
+		if (sym->name)
+			printf("%s: ", sym->name);
+		for_all_prompts(sym, prop)
+			printf("%*s%s ", indent - 1, "",  prop->text);
+		putchar('[');
+		oldval = sym_get_tristate_value(sym);
+		switch (oldval) {
+		case no:
+			putchar('N');
+			break;
+		case mod:
+			putchar('M');
+			break;
+		case yes:
+			putchar('Y');
+			break;
+		}
+		if (oldval != no && sym_tristate_within_range(sym, no))
+			printf("/n");
+		if (oldval != mod && sym_tristate_within_range(sym, mod))
+			printf("/m");
+		if (oldval != yes && sym_tristate_within_range(sym, yes))
+			printf("/y");
+		/* FIXME: I don't know how to get the help text from the sym */
+		printf("] ");
+		if (!conf_askvalue(sym, sym_get_string_value(sym)))
+			return 0;
+		strip(line);
+
+		switch (line[0]) {
+		case 'n':
+		case 'N':
+			newval = no;
+			if (!line[1] || !strcmp(&line[1], "o"))
+				break;
+			continue;
+		case 'm':
+		case 'M':
+			newval = mod;
+			if (!line[1])
+				break;
+			continue;
+		case 'y':
+		case 'Y':
+			newval = yes;
+			if (!line[1] || !strcmp(&line[1], "es"))
+				break;
+			continue;
+		case 0:
+			newval = oldval;
+			break;
+		default:
+			continue;
+		}
+		if (sym_set_tristate_value(sym, newval)) {
+			/* FIXME: if I don't write it doesn't save */
+			conf_write(NULL);
+			return 1;
+		}
+	}
+}
+
+static int enable_sym(struct symbol *sym)
+{
+	if (sym_get_tristate_value(sym) != no)
+		return 0;
+
+	if (!sym->visible) {
+		printf("%s: has missing dependencies\n", sym->name);
+		if (!get_depends(sym))
+			return 0;
+	}
+
+	return conf_sym(sym);
+}
+
+static void expr_parse(struct expr *e)
+{
+	if (!e)
+		return;
+
+	switch (e->type) {
+	case E_EQUAL:
+		printf("set '%s' to '%s'\n",
+			e->left.sym->name, e->right.sym->name);
+		break;
+
+	case E_AND:
+		expr_parse(e->left.expr);
+		expr_parse(e->right.expr);
+		break;
+
+	case E_SYMBOL:
+		enable_sym(e->left.sym);
+		break;
+
+	case E_NOT:
+	case E_UNEQUAL:
+	case E_OR:
+	case E_LIST:
+	case E_RANGE:
+	default:
+		printf("HELP.  Lot of unimplemented code\n");
+		break;
+	}
+}
+
+static int get_depends(struct symbol *sym)
+{
+	struct property *prop;
+	struct gstr res = str_new();
+
+	prop = get_symbol_prop(sym);
+	if (!prop)
+		return 0;
+
+	expr_gstr_print(prop->visible.expr, &res);
+	printf("%s\n\n", str_get(&res));
+
+	expr_parse(prop->visible.expr);
+
+	return 1;
+}
+
+static void kconfig_search(void)
+{
+	char *search_str;
+	struct symbol **sym_arr;
+	struct gstr res;
+
+	search_str = getenv("SEARCH");
+	if (!search_str)
+		return;
+
+	sym_arr = sym_re_search(search_str);
+	res = get_relations_str(sym_arr, NULL);
+	printf("%s", str_get(&res));
+}
+
+static void kconfig_set(void)
+{
+	struct symbol *sym;
+	char *config;
+	char *setting;
+	int res;
+
+	config = getenv("CONFIG");
+	if (!config)
+		return;
+	if (strncmp(config, "CONFIG_", 7) == 0)
+		config += 7;
+
+	setting = strchr(config, '=');
+	if (setting) {
+		*setting = '\0';
+		setting++;
+	} else {
+		setting = getenv("SETTING");
+		if (setting && *setting == '\0')
+			setting = NULL;
+	}
+
+	sym = sym_find(config);
+	if (!sym) {
+		printf("Error: '%s' not found.\n", config);
+		return;
+	}
+
+	if (!sym->visible) {
+		printf("\n%s: has missing dependencies\n", sym->name);
+		if (!get_depends(sym))
+			return;
+	}
+	if (!sym->visible) {
+		printf("Error: unmet dependencies\n");
+		return;
+	}
+
+	if (!setting) {
+		conf_sym(sym);
+	} else if (!sym_set_string_value(sym, setting)) {
+		printf("Error: setting '%s=%s' failed.\n", sym->name, setting);
+		return;
+	}
+
+	res = conf_write(NULL);
+	if (res) {
+		printf("Error during writing of configuration.\n"
+			"Your configuration changes were NOT saved.\n");
+		return;
+	}
+
+	printf("set: %s=%s\n", config, sym_get_string_value(sym));
+}
+
+int main(int ac, char **av)
+{
+	char *mode;
+
+	if (ac > 1 && strcmp(av[1], "-s") == 0) {
+		/* Silence conf_read() until the real callback is set up */
+		conf_set_message_callback(NULL);
+		av++;
+	}
+	conf_parse(av[1]);
+	conf_read(NULL);
+
+	mode = getenv("NCONFIG_MODE");
+	if (!mode)
+		return 1;
+
+	if (strcmp(mode, "kconfig_search") == 0) {
+		kconfig_search();
+		return 0;
+	}
+	if (strcmp(mode, "kconfig_set") == 0) {
+		kconfig_set();
+		return 0;
+	}
+
+	return 1;
+}
-- 
2.17.1

