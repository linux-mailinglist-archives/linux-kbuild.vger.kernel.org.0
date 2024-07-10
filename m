Return-Path: <linux-kbuild+bounces-2456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB9C92CB69
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F25F01C2233C
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6C584A32;
	Wed, 10 Jul 2024 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epUpTvf6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8176484052;
	Wed, 10 Jul 2024 06:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594486; cv=none; b=RpkNa7o2ZYRBYBvNP16sgEi5dc3oOyx86PATdmHVLiNBRo6+YScqU36UKcLSdBApoVSWYaXzM7KHAK02znWYceoiTtxl8MSjLCmYOTCuZv4hBMLElwLYLy6wAmfvsBeyTRXeEONH+z0RrfSnl7G9M7Hc480RwQY5H4ckrVxj9co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594486; c=relaxed/simple;
	bh=SQfUX38gVeB0Uyk3sTbxNAkst4NOZDU4Ipe+EiMhDLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rVzPs/D+zJASAUw0kwO9FYSub9bhpv9MaKScoslrbXNNQppOpqWwHTpsD7eSjT99e26eauJMuviUg87mOdHt9S6W5UH/T3jAYIK79u92FkMy3cZYXJcrUCN38R+Y1d5bxNefwbe75EIv+VLFJ65eCpDs6dvk+lxpxVIsKdespsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epUpTvf6; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5956fbe6d0dso1714817a12.1;
        Tue, 09 Jul 2024 23:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594482; x=1721199282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hm/PoNzZ+OqCSyqXdXyRdGCY3Wga1Xl4oVFbRbhf52E=;
        b=epUpTvf6zXynm344h0hdIww+Dn5LT2fUYMb8SC8yc3zJ8tvOzWhhG8CyKy3ZUYU+H1
         dgyBfkgJPGQdQnEIaIPlm9ylyYAZS5S7Bc3agcTEb4wui7UIpK9Vw/40kWue4EZNfqSR
         qznSqPRkNof+6ssi5KQJzuXoiwqvLHiJTMeBrQAzE3SgOvHSUYQ1Zjeq8Se9Uk/Z2X4u
         mH7KjqHr9recy/4H2+Og5uz7CQCt+bDOIbzDSjcq+zQjDQZNet1oLf+Enq+6QBH2OvT4
         e4tsMUngouZ7nyvluC2KuzOLEmkH5aWGZPU+tCzhq1C8IvPNqo9+HFOErvbBBVfu8bZI
         NIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594482; x=1721199282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm/PoNzZ+OqCSyqXdXyRdGCY3Wga1Xl4oVFbRbhf52E=;
        b=Gee8cMkOsMLMzC9h5hNmXSugsvIrH/sfKKN26RBS1HlDFztszpOx6GhhT2BBSe/YJP
         MwwA28Q8ymq8a2JfCdfnjbkPMopNFXmrrpahkpS8I5fkbUnQYefb0ORJM+8BxV/LIqkw
         sinzEQvwv4XFr6sOP8i+cUex5C5p5LxV63Z+WUrpEEWLtY/peynSVI6nNqx+FjwkfFFz
         J+j3JnPVDs4LuNumjcDG5XqKsSkumNl8vp3EsayrBEa64w4UpD9sijICflyX17HimRGs
         5x7/fpcOJxXAojpOEuD+8LgkWnyj6qAoyvQ6XPhZiy2Vex4sN+K51/UkGKSvPtpntxb8
         03mg==
X-Forwarded-Encrypted: i=1; AJvYcCXP1C0YRNUQLIpQiLqzCQNTB1qDyBoJIj5nCQw1WgBTzI1ScSzlNNNtr61czNqBIW7/CmekVqSnxMX2IxZ286HQjBvjmX35xuB/PPO+
X-Gm-Message-State: AOJu0Yz1zExW4qSzyYvwV2miRZeRWAZSFtfQem1Jh/j6tFiafXbVt1O+
	yatq9oTTx3mgYjC9xf1EtM0d3Q7qwIrAzmlttMTyNqSvBtGJCs9P6v6Adg==
X-Google-Smtp-Source: AGHT+IFSJP7A51K1pOki463OJjpWu30Z65FRBFwD0RRc2g1fqsXvE4wujektgd9RrBcMC/t2s4NYnA==
X-Received: by 2002:a05:6402:280a:b0:584:2314:e8a0 with SMTP id 4fb4d7f45d1cf-594bc7c824amr3503132a12.28.1720594481689;
        Tue, 09 Jul 2024 23:54:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:41 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/12] kconfig: Add files with utility functions
Date: Wed, 10 Jul 2024 08:52:52 +0200
Message-Id: <20240710065255.10338-10-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240710065255.10338-1-ole0811sch@gmail.com>
References: <20240710065255.10338-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit contains various helper functions used in the project.

Co-developed-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Patrick Franz <deltaone@debian.org>
Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
Suggested-by: Sarah Nadi <nadi@ualberta.ca>
Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/kconfig/cf_utils.c | 1031 ++++++++++++++++++++++++++++++++++++
 scripts/kconfig/cf_utils.h |  115 ++++
 2 files changed, 1146 insertions(+)
 create mode 100644 scripts/kconfig/cf_utils.c
 create mode 100644 scripts/kconfig/cf_utils.h

diff --git a/scripts/kconfig/cf_utils.c b/scripts/kconfig/cf_utils.c
new file mode 100644
index 000000000000..bcffd0a4fc1b
--- /dev/null
+++ b/scripts/kconfig/cf_utils.c
@@ -0,0 +1,1031 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
+ */
+
+#define _GNU_SOURCE
+#include <assert.h>
+#include <locale.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <ctype.h>
+
+#include "configfix.h"
+#include "internal.h"
+
+#define SATMAP_INIT_SIZE 2
+
+static PicoSAT *pico;
+
+static void unfold_cnf_clause(struct pexpr *e);
+static void build_cnf_tseytin(struct pexpr *e, struct cfdata *data);
+
+static void build_cnf_tseytin_top_and(struct pexpr *e, struct cfdata *data);
+static void build_cnf_tseytin_top_or(struct pexpr *e, struct cfdata *data);
+
+static void build_cnf_tseytin_tmp(struct pexpr *e, struct fexpr *t, struct cfdata *data);
+static void build_cnf_tseytin_and(struct pexpr *e, struct fexpr *t, struct cfdata *data);
+static void build_cnf_tseytin_or(struct pexpr *e, struct fexpr *t, struct cfdata *data);
+static int pexpr_satval(struct pexpr *e);
+
+/*
+ * parse Kconfig-file and read .config
+ */
+void init_config(const char *Kconfig_file)
+{
+	conf_parse(Kconfig_file);
+	conf_read(NULL);
+}
+
+/*
+ * initialize satmap
+ */
+void init_data(struct cfdata *data)
+{
+	/* create hashtable with all fexpr */
+	data->satmap = xcalloc(SATMAP_INIT_SIZE, sizeof(**data->satmap));
+	data->satmap_size = SATMAP_INIT_SIZE;
+
+	printd("done.\n");
+}
+
+/*
+ * create SAT-variables for all fexpr
+ */
+void create_sat_variables(struct cfdata *data)
+{
+	struct symbol *sym;
+
+	printd("Creating SAT-variables...");
+
+	for_all_symbols(sym) {
+		sym->constraints = pexpr_list_init();
+		sym_create_fexpr(sym, data);
+	}
+
+	printd("done.\n");
+}
+
+/*
+ * create various constants
+ */
+void create_constants(struct cfdata *data)
+{
+	printd("Creating constants...");
+
+	/* create TRUE and FALSE constants */
+	data->constants->const_false = fexpr_create(data->sat_variable_nr++, FE_FALSE, "False");
+	// const_false = fexpr_create(sat_variable_nr++, FE_FALSE, "False");
+	fexpr_add_to_satmap(data->constants->const_false, data);
+
+	data->constants->const_true = fexpr_create(data->sat_variable_nr++, FE_TRUE, "True");
+	fexpr_add_to_satmap(data->constants->const_true, data);
+
+	/* add fexpr of constants to tristate constants */
+	symbol_yes.fexpr_y = data->constants->const_true;
+	symbol_yes.fexpr_m = data->constants->const_false;
+
+	symbol_mod.fexpr_y = data->constants->const_false;
+	symbol_mod.fexpr_m = data->constants->const_true;
+
+	symbol_no.fexpr_y = data->constants->const_false;
+	symbol_no.fexpr_m = data->constants->const_false;
+
+	/* create symbols yes/mod/no as fexpr */
+	data->constants->symbol_yes_fexpr = fexpr_create(0, FE_SYMBOL, "y");
+	data->constants->symbol_yes_fexpr->sym = &symbol_yes;
+	data->constants->symbol_yes_fexpr->tri = yes;
+
+	data->constants->symbol_mod_fexpr = fexpr_create(0, FE_SYMBOL, "m");
+	data->constants->symbol_mod_fexpr->sym = &symbol_mod;
+	data->constants->symbol_mod_fexpr->tri = mod;
+
+	data->constants->symbol_no_fexpr = fexpr_create(0, FE_SYMBOL, "n");
+	data->constants->symbol_no_fexpr->sym = &symbol_no;
+	data->constants->symbol_no_fexpr->tri = no;
+
+	printd("done.\n");
+}
+
+/*
+ * create a temporary SAT-variable
+ */
+struct fexpr *create_tmpsatvar(struct cfdata *data)
+{
+	char *name = get_tmp_var_as_char(data->tmp_variable_nr);
+	struct fexpr *t = fexpr_create(data->sat_variable_nr++, FE_TMPSATVAR, name);
+
+	++data->tmp_variable_nr;
+	fexpr_add_to_satmap(t, data);
+
+	free(name);
+	return t;
+}
+
+/*
+ * return a temporary SAT variable as string
+ */
+char *get_tmp_var_as_char(int i)
+{
+	char *val = malloc(sizeof(char) * 18);
+
+	snprintf(val, 18, "T_%d", i);
+	return val;
+}
+
+/*
+ * return a tristate value as a char *
+ */
+char *tristate_get_char(tristate val)
+{
+	switch (val) {
+	case yes:
+		return "yes";
+	case mod:
+		return "mod";
+	case no:
+		return "no";
+	default:
+		return "";
+	}
+}
+
+/*
+ *check whether an expr can evaluate to mod
+ */
+bool expr_can_evaluate_to_mod(struct expr *e)
+{
+	if (!e)
+		return false;
+
+	switch (e->type) {
+	case E_SYMBOL:
+		return e->left.sym == &symbol_mod || e->left.sym->type == S_TRISTATE ? true : false;
+	case E_AND:
+	case E_OR:
+		return expr_can_evaluate_to_mod(e->left.expr) ||
+		       expr_can_evaluate_to_mod(e->right.expr);
+	case E_NOT:
+		return expr_can_evaluate_to_mod(e->left.expr);
+	default:
+		return false;
+	}
+}
+
+/*
+ * check whether an expr is a non-Boolean constant
+ */
+bool expr_is_nonbool_constant(struct expr *e)
+{
+	if (e->type != E_SYMBOL)
+		return false;
+	if (e->left.sym->type != S_UNKNOWN)
+		return false;
+
+	if (e->left.sym->flags & SYMBOL_CONST)
+		return true;
+
+	return string_is_number(e->left.sym->name) || string_is_hex(e->left.sym->name);
+}
+
+/*
+ * check whether a symbol is a non-Boolean constant
+ */
+bool sym_is_nonbool_constant(struct symbol *sym)
+{
+	if (sym->type != S_UNKNOWN)
+		return false;
+
+	if (sym->flags & SYMBOL_CONST)
+		return true;
+
+	return string_is_number(sym->name) || string_is_hex(sym->name);
+}
+
+/*
+ * print an expr
+ */
+static void print_expr_util(struct expr *e, int prevtoken)
+{
+	if (!e)
+		return;
+
+	switch (e->type) {
+	case E_SYMBOL:
+		if (sym_get_name(e->left.sym) != NULL)
+			printf("%s", sym_get_name(e->left.sym));
+		else
+			printf("left was null\n");
+		break;
+	case E_NOT:
+		printf("!");
+		print_expr_util(e->left.expr, E_NOT);
+		break;
+	case E_AND:
+		if (prevtoken != E_AND && prevtoken != 0)
+			printf("(");
+		print_expr_util(e->left.expr, E_AND);
+		printf(" && ");
+		print_expr_util(e->right.expr, E_AND);
+		if (prevtoken != E_AND && prevtoken != 0)
+			printf(")");
+		break;
+	case E_OR:
+		if (prevtoken != E_OR && prevtoken != 0)
+			printf("(");
+		print_expr_util(e->left.expr, E_OR);
+		printf(" || ");
+		print_expr_util(e->right.expr, E_OR);
+		if (prevtoken != E_OR && prevtoken != 0)
+			printf(")");
+		break;
+	case E_EQUAL:
+	case E_UNEQUAL:
+		if (e->left.sym->name)
+			printf("%s", e->left.sym->name);
+		else
+			printf("left was null\n");
+		printf("%s", e->type == E_EQUAL ? "=" : "!=");
+		printf("%s", e->right.sym->name);
+		break;
+	case E_LEQ:
+	case E_LTH:
+		if (e->left.sym->name)
+			printf("%s", e->left.sym->name);
+		else
+			printf("left was null\n");
+		printf("%s", e->type == E_LEQ ? "<=" : "<");
+		printf("%s", e->right.sym->name);
+		break;
+	case E_GEQ:
+	case E_GTH:
+		if (e->left.sym->name)
+			printf("%s", e->left.sym->name);
+		else
+			printf("left was null\n");
+		printf("%s", e->type == E_GEQ ? ">=" : ">");
+		printf("%s", e->right.sym->name);
+		break;
+	case E_RANGE:
+		printf("[");
+		printf("%s", e->left.sym->name);
+		printf(" ");
+		printf("%s", e->right.sym->name);
+		printf("]");
+		break;
+	default:
+		break;
+	}
+}
+void print_expr(char *tag, struct expr *e, int prevtoken)
+{
+	printf("%s ", tag);
+	print_expr_util(e, prevtoken);
+	printf("\n");
+}
+
+/*
+ * check, if the symbol is a tristate-constant
+ */
+bool sym_is_tristate_constant(struct symbol *sym)
+{
+	return sym == &symbol_yes || sym == &symbol_mod || sym == &symbol_no;
+}
+
+/*
+ * check, if a symbol is of type boolean or tristate
+ */
+bool sym_is_boolean(struct symbol *sym)
+{
+	return sym->type == S_BOOLEAN || sym->type == S_TRISTATE;
+}
+
+/*
+ * check, if a symbol is a boolean/tristate or a tristate constant
+ */
+bool sym_is_bool_or_triconst(struct symbol *sym)
+{
+	return sym_is_tristate_constant(sym) || sym_is_boolean(sym);
+}
+
+/*
+ * check, if a symbol is of type int, hex, or string
+ */
+bool sym_is_nonboolean(struct symbol *sym)
+{
+	return sym->type == S_INT || sym->type == S_HEX || sym->type == S_STRING;
+}
+
+/*
+ * check, if a symbol has a prompt
+ */
+bool sym_has_prompt(struct symbol *sym)
+{
+	struct property *prop;
+
+	for_all_prompts(sym, prop)
+		return true;
+
+	return false;
+}
+
+/*
+ * return the prompt of the symbol if there is one, NULL otherwise
+ */
+struct property *sym_get_prompt(struct symbol *sym)
+{
+	struct property *prop;
+
+	for_all_prompts(sym, prop)
+		return prop;
+
+	return NULL;
+}
+
+/*
+ * return the condition for the property, NULL if there is none. To be pexpr_put
+ * by caller.
+ */
+struct pexpr *prop_get_condition(struct property *prop, struct cfdata *data)
+{
+	if (prop == NULL)
+		return NULL;
+
+	/* if there is no condition, return True */
+	if (!prop->visible.expr)
+		return pexf(data->constants->const_true);
+
+	return expr_calculate_pexpr_both(prop->visible.expr, data);
+}
+
+/*
+ * return the default property, NULL if none exists or can be satisfied
+ */
+struct property *sym_get_default_prop(struct symbol *sym)
+{
+	struct property *prop;
+
+	for_all_defaults(sym, prop) {
+		prop->visible.tri = expr_calc_value(prop->visible.expr);
+		if (prop->visible.tri != no)
+			return prop;
+	}
+	return NULL;
+}
+
+/*
+ * check whether a non-boolean symbol has a value set
+ */
+bool sym_nonbool_has_value_set(struct symbol *sym)
+{
+	/*
+	 * The built constraints make the following constraints:
+	 *
+	 * visible -> not 'n'
+	 * sym->dir_dep not fulfilled -> 'n'
+	 * invisible -> (no default's condition is fulfilled <-> 'n')
+	 */
+	struct property *prompt;
+	struct property *p;
+
+	if (!sym_is_nonboolean(sym))
+		return false;
+
+	/* cannot have a value with unmet dependencies */
+	if (sym->dir_dep.expr && sym->dir_dep.tri == no)
+		return false;
+
+	/* visible prompt => value set */
+	prompt = sym_get_prompt(sym);
+	if (prompt != NULL && prompt->visible.tri != no)
+		return true;
+
+	/* invisible prompt => must get value from default value */
+	p = sym_get_default_prop(sym);
+	return p != NULL;
+}
+
+/*
+ * return pointer to the name of the symbol or the current prompt-text, if it
+ * is a choice symbol
+ */
+const char *sym_get_name(struct symbol *sym)
+{
+	if (sym_is_choice(sym)) {
+		struct property *prompt = sym_get_prompt(sym);
+
+		if (prompt == NULL)
+			return "";
+
+		return prompt->text;
+	} else {
+		return sym->name;
+	}
+}
+
+/*
+ * check whether symbol is to be changed
+ */
+bool sym_is_sdv(struct sdv_list *list, struct symbol *sym)
+{
+	struct sdv_node *node;
+
+	sdv_list_for_each(node, list)
+		if (sym == node->elem->sym)
+			return true;
+
+	return false;
+}
+
+/*
+ * print a symbol's name
+ */
+void print_sym_name(struct symbol *sym)
+{
+	printf("Symbol: ");
+	if (sym_is_choice(sym)) {
+		struct property *prompt = sym_get_prompt(sym);
+
+		printf("(Choice) %s", prompt->text);
+	} else  {
+		printf("%s", sym->name);
+	}
+	printf("\n");
+}
+
+/*
+ * print all constraints for a symbol
+ */
+void print_sym_constraint(struct symbol *sym)
+{
+	struct pexpr_node *node;
+
+	pexpr_list_for_each(node, sym->constraints)
+		pexpr_print("::", node->elem, -1);
+}
+
+/*
+ * print a default map
+ */
+void print_default_map(struct defm_list *map)
+{
+	struct default_map *entry;
+	struct defm_node *node;
+
+	defm_list_for_each(node, map) {
+		struct gstr s = str_new();
+
+		entry = node->elem;
+
+		str_append(&s, "\t");
+		str_append(&s, str_get(&entry->val->name));
+		str_append(&s, " ->");
+		pexpr_print(strdup(str_get(&s)), entry->e, -1);
+		str_free(&s);
+	}
+}
+
+/*
+ * check whether a string is a number
+ */
+bool string_is_number(char *s)
+{
+	int len = strlen(s);
+	int i = 0;
+
+	while (i < len) {
+		if (!isdigit(s[i]))
+			return false;
+		i++;
+	}
+
+	return true;
+}
+
+/*
+ * check whether a string is a hexadecimal number
+ */
+bool string_is_hex(char *s)
+{
+	int len = strlen(s);
+	int i = 2;
+
+	if (len >= 3 && s[0] == '0' && s[1] == 'x') {
+		while (i < len) {
+			if (!isxdigit(s[i]))
+				return false;
+			i++;
+		}
+		return true;
+	} else {
+		return false;
+	}
+}
+
+/*
+ * initialize PicoSAT
+ */
+PicoSAT *initialize_picosat(void)
+{
+	PicoSAT *pico;
+
+	printd("\nInitializing PicoSAT...");
+	pico = picosat_init();
+	picosat_enable_trace_generation(pico);
+	printd("done.\n");
+
+	return pico;
+}
+
+/*
+ * construct the CNF-clauses from the constraints
+ */
+void construct_cnf_clauses(PicoSAT *p, struct cfdata *data)
+{
+	struct symbol *sym;
+
+	pico = p;
+
+	/* adding unit-clauses for constants */
+	sat_add_clause(2, pico, -(data->constants->const_false->satval));
+	sat_add_clause(2, pico, data->constants->const_true->satval);
+
+	for_all_symbols(sym) {
+		struct pexpr_node *node;
+
+		if (sym->type == S_UNKNOWN)
+			continue;
+
+		pexpr_list_for_each(node, sym->constraints) {
+			if (pexpr_is_cnf(node->elem)) {
+				unfold_cnf_clause(node->elem);
+				picosat_add(pico, 0);
+			} else {
+				build_cnf_tseytin(node->elem, data);
+			}
+
+		}
+	}
+}
+
+/*
+ * helper function to add an expression to a CNF-clause
+ */
+static void unfold_cnf_clause(struct pexpr *e)
+{
+	switch (e->type) {
+	case PE_SYMBOL:
+		picosat_add(pico, e->left.fexpr->satval);
+		break;
+	case PE_OR:
+		unfold_cnf_clause(e->left.pexpr);
+		unfold_cnf_clause(e->right.pexpr);
+		break;
+	case PE_NOT:
+		picosat_add(pico, -(e->left.pexpr->left.fexpr->satval));
+		break;
+	default:
+		perror("Not in CNF, FE_EQUALS.");
+	}
+}
+
+/*
+ * build CNF-clauses for a pexpr not in CNF
+ */
+static void build_cnf_tseytin(struct pexpr *e, struct cfdata *data)
+{
+	switch (e->type) {
+	case PE_AND:
+		build_cnf_tseytin_top_and(e, data);
+		break;
+	case PE_OR:
+		build_cnf_tseytin_top_or(e, data);
+		break;
+	default:
+		perror("Expression not a propositional logic formula. root.");
+	}
+}
+
+/*
+ * split up a pexpr of type AND as both sides must be satisfied
+ */
+static void build_cnf_tseytin_top_and(struct pexpr *e, struct cfdata *data)
+{
+	if (pexpr_is_cnf(e->left.pexpr))
+		unfold_cnf_clause(e->left.pexpr);
+	else
+		build_cnf_tseytin(e->left.pexpr, data);
+
+	if (pexpr_is_cnf(e->right.pexpr))
+		unfold_cnf_clause(e->right.pexpr);
+	else
+		build_cnf_tseytin(e->right.pexpr, data);
+
+}
+
+static void build_cnf_tseytin_top_or(struct pexpr *e, struct cfdata *data)
+{
+	struct fexpr *t1 = NULL, *t2 = NULL;
+	int a, b;
+
+	/* set left side */
+	if (pexpr_is_symbol(e->left.pexpr)) {
+		a = pexpr_satval(e->left.pexpr);
+	} else {
+		t1 = create_tmpsatvar(data);
+		a = t1->satval;
+	}
+
+	/* set right side */
+	if (pexpr_is_symbol(e->right.pexpr)) {
+		b = pexpr_satval(e->right.pexpr);
+	} else {
+		t2 = create_tmpsatvar(data);
+		b = t2->satval;
+	}
+
+	/* A v B */
+	sat_add_clause(3, pico, a, b);
+
+	/* traverse down the tree to build more constraints if needed */
+	if (!pexpr_is_symbol(e->left.pexpr)) {
+		if (t1 == NULL)
+			perror("t1 is NULL.");
+
+		build_cnf_tseytin_tmp(e->left.pexpr, t1, data);
+	}
+
+	if (!pexpr_is_symbol(e->right.pexpr)) {
+		if (t2 == NULL)
+			perror("t2 is NULL.");
+
+		build_cnf_tseytin_tmp(e->right.pexpr, t2, data);
+	}
+}
+
+/*
+ * build the sub-expressions
+ */
+static void build_cnf_tseytin_tmp(struct pexpr *e, struct fexpr *t, struct cfdata *data)
+{
+	switch (e->type) {
+	case PE_AND:
+		build_cnf_tseytin_and(e, t, data);
+		break;
+	case PE_OR:
+		build_cnf_tseytin_or(e, t, data);
+		break;
+	default:
+		perror("Expression not a propositional logic formula. root.");
+	}
+}
+
+/*
+ * build the Tseytin sub-expressions for a pexpr of type AND
+ */
+static void build_cnf_tseytin_and(struct pexpr *e, struct fexpr *t, struct cfdata *data)
+{
+	struct fexpr *t1 = NULL, *t2 = NULL;
+	int a, b, c;
+
+	assert(t != NULL);
+
+	/* set left side */
+	if (pexpr_is_symbol(e->left.pexpr)) {
+		a = pexpr_satval(e->left.pexpr);
+	} else {
+		t1 = create_tmpsatvar(data);
+		a = t1->satval;
+	}
+
+	/* set right side */
+	if (pexpr_is_symbol(e->right.pexpr)) {
+		b = pexpr_satval(e->right.pexpr);
+	} else {
+		t2 = create_tmpsatvar(data);
+		b = t2->satval;
+	}
+
+	c = t->satval;
+
+	/* -A v -B v C */
+	sat_add_clause(4, pico, -a, -b, c);
+	/* A v -C */
+	sat_add_clause(3, pico, a, -c);
+	/* B v -C */
+	sat_add_clause(3, pico, b, -c);
+
+	/* traverse down the tree to build more constraints if needed */
+	if (!pexpr_is_symbol(e->left.pexpr)) {
+		if (t1 == NULL)
+			perror("t1 is NULL.");
+
+		build_cnf_tseytin_tmp(e->left.pexpr, t1, data);
+	}
+	if (!pexpr_is_symbol(e->right.pexpr)) {
+		if (t2 == NULL)
+			perror("t2 is NULL.");
+
+		build_cnf_tseytin_tmp(e->right.pexpr, t2, data);
+	}
+}
+
+/*
+ * build the Tseytin sub-expressions for a pexpr of type
+ */
+static void build_cnf_tseytin_or(struct pexpr *e, struct fexpr *t, struct cfdata *data)
+{
+	struct fexpr *t1 = NULL, *t2 = NULL;
+	int a, b, c;
+
+	assert(t != NULL);
+
+	/* set left side */
+	if (pexpr_is_symbol(e->left.pexpr)) {
+		a = pexpr_satval(e->left.pexpr);
+	} else {
+		t1 = create_tmpsatvar(data);
+		a = t1->satval;
+	}
+
+	/* set right side */
+	if (pexpr_is_symbol(e->right.pexpr)) {
+		b = pexpr_satval(e->right.pexpr);
+	} else {
+		t2 = create_tmpsatvar(data);
+		b = t2->satval;
+	}
+
+	c = t->satval;
+
+	/* A v B v -C */
+	sat_add_clause(4, pico, a, b, -c);
+	/* -A v C */;
+	sat_add_clause(3, pico, -a, c);
+	/* -B v C */
+	sat_add_clause(3, pico, -b, c);
+
+	/* traverse down the tree to build more constraints if needed */
+	if (!pexpr_is_symbol(e->left.pexpr)) {
+		if (t1 == NULL)
+			perror("t1 is NULL.");
+
+		build_cnf_tseytin_tmp(e->left.pexpr, t1, data);
+	}
+	if (!pexpr_is_symbol(e->right.pexpr)) {
+		if (t2 == NULL)
+			perror("t2 is NULL.");
+
+		build_cnf_tseytin_tmp(e->right.pexpr, t2, data);
+	}
+}
+
+/*
+ * add a clause to PicoSAT
+ * First argument must be the SAT solver
+ */
+void sat_add_clause(int num, ...)
+{
+	va_list valist;
+	int lit;
+	PicoSAT *pico;
+
+	if (num <= 1)
+		return;
+
+	va_start(valist, num);
+
+	pico = va_arg(valist, PicoSAT *);
+
+	/* access all the arguments assigned to valist */
+	for (int i = 1; i < num; i++) {
+		lit = va_arg(valist, int);
+		picosat_add(pico, lit);
+	}
+	picosat_add(pico, 0);
+
+	va_end(valist);
+}
+
+/*
+ * return the SAT-variable for a pexpr that is a symbol
+ */
+static int pexpr_satval(struct pexpr *e)
+{
+	if (!pexpr_is_symbol(e)) {
+		perror("pexpr is not a symbol.");
+		return -1;
+	}
+
+	switch (e->type) {
+	case PE_SYMBOL:
+		return e->left.fexpr->satval;
+	case PE_NOT:
+		return -(e->left.pexpr->left.fexpr->satval);
+	default:
+		perror("Not a symbol.");
+	}
+
+	return -1;
+}
+
+/*
+ * start PicoSAT
+ */
+void picosat_solve(PicoSAT *pico, struct cfdata *data)
+{
+	clock_t start, end;
+	double time;
+	int res;
+
+	printd("Solving SAT-problem...");
+
+	start = clock();
+	res = picosat_sat(pico, -1);
+	end = clock();
+
+	time = ((double) (end - start)) / CLOCKS_PER_SEC;
+	printd("done. (%.6f secs.)\n\n", time);
+
+	if (res == PICOSAT_SATISFIABLE) {
+		printd("===> PROBLEM IS SATISFIABLE <===\n");
+
+	} else if (res == PICOSAT_UNSATISFIABLE) {
+		struct fexpr *e;
+		int lit;
+		const int *i;
+
+		printd("===> PROBLEM IS UNSATISFIABLE <===\n");
+
+		/* print unsat core */
+		printd("\nPrinting unsatisfiable core:\n");
+
+		i = picosat_failed_assumptions(pico);
+		lit = abs(*i++);
+
+		while (lit != 0) {
+			e = data->satmap[lit];
+
+			printd("(%d) %s <%d>\n", lit, str_get(&e->name), e->assumption);
+			lit = abs(*i++);
+		}
+	} else {
+		printd("Unknown if satisfiable.\n");
+	}
+}
+
+/*
+ * add assumption for a symbol to the SAT-solver
+ */
+void sym_add_assumption(PicoSAT *pico, struct symbol *sym)
+{
+	if (sym_is_boolean(sym)) {
+		int tri_val = sym_get_tristate_value(sym);
+
+		sym_add_assumption_tri(pico, sym, tri_val);
+		return;
+	}
+
+	if (sym_is_nonboolean(sym)) {
+		struct fexpr *e = sym->nb_vals->head->elem;
+		struct fexpr_node *node;
+
+		const char *string_val = sym_get_string_value(sym);
+
+		if (sym->type == S_STRING && !strcmp(string_val, ""))
+			return;
+
+		/* symbol does not have a value */
+		if (!sym_nonbool_has_value_set(sym)) {
+			/* set value for sym=n */
+			picosat_assume(pico, e->satval);
+			e->assumption = true;
+
+			for (node = sym->nb_vals->head->next; node != NULL; node = node->next) {
+				picosat_assume(pico, -(node->elem->satval));
+				node->elem->assumption = false;
+			}
+
+			return;
+		}
+
+		/* symbol does have a value set */
+
+		/* set value for sym=n */
+		picosat_assume(pico, -(e->satval));
+		e->assumption = false;
+
+		/* set value for all other fexpr */
+		fexpr_list_for_each(node, sym->nb_vals) {
+			if (node->prev == NULL)
+				continue;
+
+			if (strcmp(str_get(&node->elem->nb_val), string_val) == 0) {
+				picosat_assume(pico, node->elem->satval);
+				node->elem->assumption = true;
+			} else {
+				picosat_assume(pico, -(node->elem->satval));
+				node->elem->assumption = false;
+			}
+		}
+	}
+}
+
+/*
+ * add assumption for a boolean symbol to the SAT-solver
+ */
+void sym_add_assumption_tri(PicoSAT *pico, struct symbol *sym, tristate tri_val)
+{
+	if (sym->type == S_BOOLEAN) {
+		int a = sym->fexpr_y->satval;
+
+		switch (tri_val) {
+		case no:
+			picosat_assume(pico, -a);
+			sym->fexpr_y->assumption = false;
+			break;
+		case mod:
+			perror("Should not happen. Boolean symbol is set to mod.\n");
+			break;
+		case yes:
+
+			picosat_assume(pico, a);
+			sym->fexpr_y->assumption = true;
+			break;
+		}
+	}
+	if (sym->type == S_TRISTATE) {
+		int a = sym->fexpr_y->satval;
+		int a_m = sym->fexpr_m->satval;
+
+		switch (tri_val) {
+		case no:
+			picosat_assume(pico, -a);
+			picosat_assume(pico, -a_m);
+			sym->fexpr_y->assumption = false;
+			sym->fexpr_m->assumption = false;
+			break;
+		case mod:
+			picosat_assume(pico, -a);
+			picosat_assume(pico, a_m);
+			sym->fexpr_y->assumption = false;
+			sym->fexpr_m->assumption = true;
+			break;
+		case yes:
+			picosat_assume(pico, a);
+			picosat_assume(pico, -a_m);
+			sym->fexpr_y->assumption = true;
+			sym->fexpr_m->assumption = false;
+			break;
+		}
+	}
+}
+
+/*
+ * add assumptions for the symbols to be changed to the SAT solver
+ */
+void sym_add_assumption_sdv(PicoSAT *pico, struct sdv_list *list)
+{
+	struct symbol_dvalue *sdv;
+	struct sdv_node *node;
+	int lit_y, lit_m;
+
+	sdv_list_for_each(node, list) {
+		sdv = node->elem;
+		lit_y = sdv->sym->fexpr_y->satval;
+
+		if (sdv->sym->type == S_BOOLEAN) {
+			switch (sdv->tri) {
+			case yes:
+				picosat_assume(pico, lit_y);
+				break;
+			case no:
+				picosat_assume(pico, -lit_y);
+				break;
+			case mod:
+				perror("Should not happen.\n");
+			}
+		} else if (sdv->sym->type == S_TRISTATE) {
+			lit_m = sdv->sym->fexpr_m->satval;
+
+			switch (sdv->tri) {
+			case yes:
+				picosat_assume(pico, lit_y);
+				picosat_assume(pico, -lit_m);
+				break;
+			case mod:
+				picosat_assume(pico, -lit_y);
+				picosat_assume(pico, lit_m);
+				break;
+			case no:
+				picosat_assume(pico, -lit_y);
+				picosat_assume(pico, -lit_m);
+			}
+		}
+	}
+}
diff --git a/scripts/kconfig/cf_utils.h b/scripts/kconfig/cf_utils.h
new file mode 100644
index 000000000000..b71c8731a8ff
--- /dev/null
+++ b/scripts/kconfig/cf_utils.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
+ */
+
+#ifndef CF_UTILS_H
+#define CF_UTILS_H
+
+#include "expr.h"
+#include "cf_defs.h"
+#include "picosat.h"
+
+/* parse Kconfig-file and read .config */
+void init_config(const char *Kconfig_file);
+
+/* initialize satmap and cnf_clauses */
+void init_data(struct cfdata *data);
+
+/* assign SAT-variables to all fexpr and create the sat_map */
+void create_sat_variables(struct cfdata *data);
+
+/* create True/False constants */
+void create_constants(struct cfdata *data);
+
+/* create a temporary SAT-variable */
+struct fexpr *create_tmpsatvar(struct cfdata *data);
+
+/* return a temporary SAT variable as string */
+char *get_tmp_var_as_char(int i);
+
+/* return a tristate value as a char * */
+char *tristate_get_char(tristate val);
+
+/* check whether an expr can evaluate to mod */
+bool expr_can_evaluate_to_mod(struct expr *e);
+
+/* check whether an expr is a non-Boolean constant */
+bool expr_is_nonbool_constant(struct expr *e);
+
+/* check whether a symbol is a non-Boolean constant */
+bool sym_is_nonbool_constant(struct symbol *sym);
+
+/* print an expr */
+void print_expr(char *tag, struct expr *e, int prevtoken);
+
+/* check, if the symbol is a tristate-constant */
+bool sym_is_tristate_constant(struct symbol *sym);
+
+/* check, if a symbol is of type boolean or tristate */
+bool sym_is_boolean(struct symbol *sym);
+
+/* check, if a symbol is a boolean/tristate or a tristate constant */
+bool sym_is_bool_or_triconst(struct symbol *sym);
+
+/* check, if a symbol is of type int, hex, or string */
+bool sym_is_nonboolean(struct symbol *sym);
+
+/* check, if a symbol has a prompt */
+bool sym_has_prompt(struct symbol *sym);
+
+/* return the prompt of the symbol, if there is one */
+struct property *sym_get_prompt(struct symbol *sym);
+
+/* return the condition for the property, True if there is none */
+struct pexpr *prop_get_condition(struct property *prop, struct cfdata *data);
+
+/* return the default property, NULL if none exists or can be satisfied */
+struct property *sym_get_default_prop(struct symbol *sym);
+
+/* check whether a non-boolean symbol has a value set */
+bool sym_nonbool_has_value_set(struct symbol *sym);
+
+/* return the name of the symbol */
+const char *sym_get_name(struct symbol *sym);
+
+/* check whether symbol is to be changed */
+bool sym_is_sdv(struct sdv_list *list, struct symbol *sym);
+
+/* print a symbol's name */
+void print_sym_name(struct symbol *sym);
+
+/* print all constraints for a symbol */
+void print_sym_constraint(struct symbol *sym);
+
+/* print a default map */
+void print_default_map(struct defm_list *map);
+
+/* check whether a string is a number */
+bool string_is_number(char *s);
+
+/* check whether a string is a hexadecimal number */
+bool string_is_hex(char *s);
+
+/* initialize PicoSAT */
+PicoSAT *initialize_picosat(void);
+
+/* construct the CNF-clauses from the constraints */
+void construct_cnf_clauses(PicoSAT *pico, struct cfdata *data);
+
+/* add a clause to PicoSAT */
+void sat_add_clause(int num, ...);
+
+/* start PicoSAT */
+void picosat_solve(PicoSAT *pico, struct cfdata *data);
+
+/* add assumption for a symbol to the SAT-solver */
+void sym_add_assumption(PicoSAT *pico, struct symbol *sym);
+
+/* add assumption for a boolean symbol to the SAT-solver */
+void sym_add_assumption_tri(PicoSAT *pico, struct symbol *sym, tristate tri_val);
+
+/* add assumptions for the symbols to be changed to the SAT solver */
+void sym_add_assumption_sdv(PicoSAT *pico, struct sdv_list *list);
+
+#endif
-- 
2.39.2


