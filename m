Return-Path: <linux-kbuild+bounces-5683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87EA2D779
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 17:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D0A3A1F21
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 16:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C907241DF8;
	Sat,  8 Feb 2025 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHNviXpO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10503DAC16;
	Sat,  8 Feb 2025 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032870; cv=none; b=BmmwV35znZAQ05ZxDP9DhjkTIAPTbZvY1eNv6e1J4eDs/3Ts0vfHT4aCxV3yo7EfsfDAfF04QIwhlCZnN2q2ihb00nOWQVbLtodlM8OsCuRsrGhoe7HzQk3sP/7DPRRswrbWr51JHPu5+5T+teDLD1aTJZkscEk9IP9PF26PM6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032870; c=relaxed/simple;
	bh=pkvNrYUNC1dXrXHeGx43F+q9bWKmjgpPryymP1jnHUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sIKzYwlezbiksRZF/yxxsLVwQsb9JD3E8e7rj+oT+HKY1/KUJ2a51OthYIFJI9AErOZzO4JsIfj9brq8OYtJVr7UI/eC3CSLT1r4Q5ElTRzLXVhwkB3MC09yn1P/L7eBuuvLMjzI+myCe9O2YrNNvLQLzpJ67VRdgz29CDkAtFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHNviXpO; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa67ac42819so480930666b.0;
        Sat, 08 Feb 2025 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739032864; x=1739637664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ0kUaUS3PHiloOOyIcVRYupmf7yXzMkKyQKclEF5Cc=;
        b=MHNviXpOHC2uZPb9m9s4XYg7W/ur2MGtAiPlRMLh2GwGj3clbLYroxHv+VWgV0jTfV
         eqJqaDtPMoK3cPt81cC4WEpy9kpdpQyAyZ5jEQd8JHt33EzqPDs0QWrW2/yjXtWrt2NI
         0K+B59y6rANLGmv5YZcJ1chAtwn1nDWs3/VkV/Ar7fgB+RO72jDgaONtHtPNn6d3kr7L
         YshpbNM7/fo2MbkBXQRaSeeFXhcr3tTjxe1Lr6kkU+Z7eti2vks5WiY78aU2/Ecpk1O2
         aOw/A/hRAySkFRnfVCl+uKONASoiz3a+5lRjt7+0wb/j68SnxjdIuP8RCSX8sfu+srVL
         pk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032864; x=1739637664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ0kUaUS3PHiloOOyIcVRYupmf7yXzMkKyQKclEF5Cc=;
        b=vlBxKjVs32mEf688a9xgAHyY7SUOpZZh2XVwglD5csZv+/gmYSr6UfjlEiMBThnb4u
         Um4pmBelgG736qDvuDC7HU/2jrxEqzJ5B6B8gZdlWfYAS5d5BQi5BbdNjT/qytECkQd1
         ig/f62qf5iEPDtAuINWiJ3sJ4o8pWwcbif26XYexVe6CDLW52TeacsgV/crBiVskdoeR
         Z0PXGnCEdxoeaAYC0JBzWoPXHI7Ef45WvWPxWQEH5kMXi4+KG0skjGrIWJ5EXYtdDQui
         /fuTIBQcbuwSMM/Jo0HJvUghQkNpRPaHGac32I8Ew0+lmZHk2uV4EcNav9tcsQzFaF85
         Hz8g==
X-Forwarded-Encrypted: i=1; AJvYcCV8iGXr1eD/G3UGWjYM4+SaeoDor/iLE4OHiCHatNBph61ZBThPeZuWfoBEjSCN6m9lwC+F658/kh/zU8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Z3st2HeC7ff4KuM+GfSOufXNnVWY08Gd1cgJhULLUv0iO2Xa
	hOEvj1qncHaGYiLiLtF0aOzs/EkkQakTFvcBSiH+cGDSsTW3cohLpAFaQg==
X-Gm-Gg: ASbGncvSmHlOsqPFGgWP3sUleaiD+6TZYAecZ7fnLmK7htnC6SX4L5zGWcvpXixpXUE
	spCDlCqAorWiYcNTj1BRds3q31gickqasXmNDxne0pfFvA9pM2om9VMS36jitdFAXRqzxhMPlSQ
	2P8ZaxUK1jKvImlL2guUgwX0PdxMtv5PywKKNNE1Fp1QHuq1mLuh+OmOIZKdvTMcsh5aVnJSQTZ
	dJlciEm+JlxiPskiUtb2QaZtY8UZHalXPyrs23oW0h2vQcSea8LOul/AIiLZaP0srM/aeQ1947h
	nJjezsutOSvuObw5IRfFJy3bl+xFOA==
X-Google-Smtp-Source: AGHT+IH3ZAsVUX1yMnXQIjn21269frmjWJrHGDuPdi2Y+gSiSm5mHVCgP22wZqxnsVvBgmSguTQu7A==
X-Received: by 2002:a17:907:9628:b0:ab3:76fb:96ab with SMTP id a640c23a62f3a-ab789c36549mr828938966b.57.1739032863917;
        Sat, 08 Feb 2025 08:41:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:e115:64e7:5d6:176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337f3dsm501539166b.139.2025.02.08.08.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:41:03 -0800 (PST)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: [PATCH v7 07/11] kconfig: Add files with utility functions
Date: Sat,  8 Feb 2025 17:39:55 +0100
Message-Id: <20250208163959.3973163-8-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208163959.3973163-1-ole0811sch@gmail.com>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add various helper functions used in the project.

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
 scripts/kconfig/cf_utils.c | 980 +++++++++++++++++++++++++++++++++++++
 scripts/kconfig/cf_utils.h | 136 +++++
 2 files changed, 1116 insertions(+)
 create mode 100644 scripts/kconfig/cf_utils.c
 create mode 100644 scripts/kconfig/cf_utils.h

diff --git a/scripts/kconfig/cf_utils.c b/scripts/kconfig/cf_utils.c
new file mode 100644
index 000000000000..8dbcee451209
--- /dev/null
+++ b/scripts/kconfig/cf_utils.c
@@ -0,0 +1,980 @@
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
+#include <xalloc.h>
+
+#include "internal.h"
+#include "picosat_functions.h"
+#include "cf_utils.h"
+#include "cf_expr.h"
+#include "list.h"
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
+static void build_cnf_tseytin_tmp(struct pexpr *e, struct fexpr *t,
+				  struct cfdata *data);
+static void build_cnf_tseytin_and(struct pexpr *e, struct fexpr *t,
+				  struct cfdata *data);
+static void build_cnf_tseytin_or(struct pexpr *e, struct fexpr *t,
+				 struct cfdata *data);
+static int pexpr_get_satval(struct pexpr *e);
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
+	data->satmap = xcalloc(SATMAP_INIT_SIZE, sizeof(typeof(*data->satmap)));
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
+		sym->constraints = CF_LIST_INIT(pexpr);
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
+	data->constants->const_false =
+		fexpr_create(data->sat_variable_nr++, FE_FALSE, "False");
+	// const_false = fexpr_create(sat_variable_nr++, FE_FALSE, "False");
+	fexpr_add_to_satmap(data->constants->const_false, data);
+
+	data->constants->const_true =
+		fexpr_create(data->sat_variable_nr++, FE_TRUE, "True");
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
+	struct fexpr *t =
+		fexpr_create(data->sat_variable_nr++, FE_TMPSATVAR, name);
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
+		return e->left.sym == &symbol_mod ||
+		       e->left.sym->type == S_TRISTATE;
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
+	return string_is_number(e->left.sym->name) ||
+	       string_is_hex(e->left.sym->name);
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
+	return sym->type == S_INT || sym->type == S_HEX ||
+	       sym->type == S_STRING;
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
+		return pexpr_alloc_symbol(data->constants->const_true);
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
+	CF_LIST_FOR_EACH(node, list, sdv)
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
+	CF_LIST_FOR_EACH(node, sym->constraints, pexpr)
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
+	CF_LIST_FOR_EACH(node, map, defm) {
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
+		CF_LIST_FOR_EACH(node, sym->constraints, pexpr) {
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
+		a = pexpr_get_satval(e->left.pexpr);
+	} else {
+		t1 = create_tmpsatvar(data);
+		a = t1->satval;
+	}
+
+	/* set right side */
+	if (pexpr_is_symbol(e->right.pexpr)) {
+		b = pexpr_get_satval(e->right.pexpr);
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
+static void build_cnf_tseytin_tmp(struct pexpr *e, struct fexpr *t,
+				  struct cfdata *data)
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
+static void build_cnf_tseytin_and(struct pexpr *e, struct fexpr *t,
+				  struct cfdata *data)
+{
+	struct fexpr *t1 = NULL, *t2 = NULL;
+	int a, b, c;
+
+	assert(t != NULL);
+
+	/* set left side */
+	if (pexpr_is_symbol(e->left.pexpr)) {
+		a = pexpr_get_satval(e->left.pexpr);
+	} else {
+		t1 = create_tmpsatvar(data);
+		a = t1->satval;
+	}
+
+	/* set right side */
+	if (pexpr_is_symbol(e->right.pexpr)) {
+		b = pexpr_get_satval(e->right.pexpr);
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
+static void build_cnf_tseytin_or(struct pexpr *e, struct fexpr *t,
+				 struct cfdata *data)
+{
+	struct fexpr *t1 = NULL, *t2 = NULL;
+	int a, b, c;
+
+	assert(t != NULL);
+
+	/* set left side */
+	if (pexpr_is_symbol(e->left.pexpr)) {
+		a = pexpr_get_satval(e->left.pexpr);
+	} else {
+		t1 = create_tmpsatvar(data);
+		a = t1->satval;
+	}
+
+	/* set right side */
+	if (pexpr_is_symbol(e->right.pexpr)) {
+		b = pexpr_get_satval(e->right.pexpr);
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
+static int pexpr_get_satval(struct pexpr *e)
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
+			printd("(%d) %s <%d>\n", lit, str_get(&e->name),
+			       e->assumption);
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
+		bool first;
+		struct fexpr *not_set = list_first_entry(&sym->nb_vals->list,
+						   struct fexpr_node, node)
+					  ->elem;
+		struct fexpr_node *node;
+
+		const char *string_val = sym_get_string_value(sym);
+
+		if (sym->type == S_STRING && !strcmp(string_val, ""))
+			return;
+
+		/* symbol does not have a value */
+		if (!sym_nonbool_has_value_set(sym)) {
+			bool first = true;
+
+			/* set value for sym=n */
+			picosat_assume(pico, not_set->satval);
+			not_set->assumption = true;
+
+			CF_LIST_FOR_EACH(node, sym->nb_vals, fexpr) {
+				if (first) {
+					first = false;
+					continue;
+				}
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
+		picosat_assume(pico, -(not_set->satval));
+		not_set->assumption = false;
+
+		first = true;
+		/* set value for all other fexpr */
+		CF_LIST_FOR_EACH(node, sym->nb_vals, fexpr) {
+			if (first) {
+				first = false;
+				continue;
+			}
+
+			if (strcmp(str_get(&node->elem->nb_val), string_val) ==
+			    0) {
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
+	CF_LIST_FOR_EACH(node, list, sdv) {
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
index 000000000000..1cbdcd8b7257
--- /dev/null
+++ b/scripts/kconfig/cf_utils.h
@@ -0,0 +1,136 @@
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
+#include "picosat_functions.h"
+#include "../include/list.h"
+
+/**
+ * cflist_at_index - retrieve the entry at index i in O(n)
+ * @i:		index of entry to retrieve.
+ * @head:	the head for your list.
+ * @type:	the type of the struct the entries are embedded in.
+ * @member:	the name of the list_head within the struct.
+ */
+#define cflist_at_index(i, head, type, member)               \
+	({                                                 \
+		type *__pos;                               \
+		size_t __counter = 0;                      \
+		list_for_each_entry(__pos, head, member) { \
+			if (__counter++ == i)              \
+				break;                     \
+			if (__pos->member.next == head) {  \
+				__pos = NULL;              \
+				break;                     \
+			}                                  \
+		}                                          \
+		__pos;                                     \
+	})
+
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
2.39.5


