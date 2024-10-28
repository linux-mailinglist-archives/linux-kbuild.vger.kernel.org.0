Return-Path: <linux-kbuild+bounces-4358-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D95BA9B23AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 04:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 092571C20FB8
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 03:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747AB18D620;
	Mon, 28 Oct 2024 03:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBj9HOVU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1225418CBF1;
	Mon, 28 Oct 2024 03:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087424; cv=none; b=oKBNzpcYB118VY6ct8wWRj34sn8r8ZMkP8zXzXO+XfEVzQfjwwrO7y9QlxGk7YvJTdMfQ7fHouadTzWV3ZRMLIGyCuwAPQgVTYEMgbWSllvC8lXIfhewll+J2FMc1X7j3wffTzMcBmsMt4SI3VHtJO1ZMOwHjee/Jt8WjOgx8lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087424; c=relaxed/simple;
	bh=Q+z5TFtLdyfX/zWRO0djAxbQzSd65+vB0/zjoBn0ka8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j2dF9LRqhA6F5uqIemXCpnW3YLv0h784UiSJCeXXzW2473KcZ0z/ZJ0tkaB/QPnIt4wtH3Q0OrlvSNE6ia0fYr8kuGH8o5gZY7ZbF6i2knH3+KoUQSGFlJHglRedFoJ8ppI+erYOx1xqKLvYzRaP8zRjyLh4vknCDvbI1BpUi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBj9HOVU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99cc265e0aso590073166b.3;
        Sun, 27 Oct 2024 20:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087419; x=1730692219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rET4KlQy+mdwuN8tRIe2NXs5qx/OQpgV+t16TCnGB4=;
        b=jBj9HOVUD/WwHlOuz14pTPyD5l94143bGiR7tsxEfJ5rAN9gw2KwScb+four8g0WH+
         0oKqNybSv55btcdtGyK6v5YYWJcGOkD21wKUMnqtrJfNRqBvVEophMIfOa0ybTuEtfqZ
         7kdq6lEptC3bongwCZ4EtOeZzqarhME0AGh8xMqBrqB0VbNvoRy2vKBlHWritsXk5qUb
         01o0/A2hmmVWohE4mY864B9IebfrCSSCuiK1UqqFDJrm2MqSKRV1LWI1w5rvew0dJiXk
         Et7Lkc/5WCJM2D1X/ngcIWslP/9C2FBCf+w3wbt5ap5c9gY2Ttt/xbEmaSVbvGr1XAjv
         3YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087419; x=1730692219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rET4KlQy+mdwuN8tRIe2NXs5qx/OQpgV+t16TCnGB4=;
        b=b6A5JR5NHjBBa/qZmjbx8fJiIKH1LDlLIBhFY81XYWNFtKSLCKAZBhD0f3Sj5HeVfu
         9yHGt9L42xglNymEhdrLCcm943q7Rf/TBvgPmPOsZ6YQPCQUU6v27R55GxwO8kOgrL34
         Yx1fPr5QlG3Qz5lSzGymR/LBH7J+fbNab1R/x4rjVBjBAtu+3xpTUurx5+7kAqWxoVtN
         pttfvEyWEX78BLxmFUfHaZ/1rRWzvUV9ev6djlevJNjlYu3TXYNqQXVXauPQoieBcPjd
         Tas5mE5Uv54GrA8j+7Ocglme+nxtN8pTi0fuC5kYOa3NyySIBEE8NltXJ54lWLZ9Tw14
         rltA==
X-Forwarded-Encrypted: i=1; AJvYcCUi8SgbgUfCiJ9q7bce2e8zbH9K8rVerG6CVqKJe1cwXiETqi8unGVksSdsbRqhg/6wfBkj3yi+dv/KosQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVFNEAZV9HB2/PVP82BJUg1eU830mJIQv16Q7ByrvG8RV3tRPX
	47nno2qYDsdcRrx8kPu6v9p6MzjeHMyUx0gNY7JXAZi20B3g7PyvPIDRZQ==
X-Google-Smtp-Source: AGHT+IEM0pbWkIsbLJltl+gUtWjz0y6ri+RAaHZ2AvUbOTz5c7JiykekUjFDaMYjCHP2OVHJBMYT4w==
X-Received: by 2002:a17:906:794b:b0:a99:5601:7dc1 with SMTP id a640c23a62f3a-a9de61d4377mr623415766b.49.1730087419123;
        Sun, 27 Oct 2024 20:50:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:78b:e59b:2b0:d2e9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f5932fsm334599366b.168.2024.10.27.20.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:50:18 -0700 (PDT)
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
Subject: [PATCH v6 08/11] kconfig: Add tools
Date: Mon, 28 Oct 2024 04:49:46 +0100
Message-Id: <20241028034949.95322-9-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028034949.95322-1-ole0811sch@gmail.com>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit contains the actual API to be used from a configurator.
Furthermore, it contains a tool to print all constraints into a file.

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
 scripts/kconfig/.gitignore    |   1 +
 scripts/kconfig/cfoutconfig.c | 149 +++++++++++++++
 scripts/kconfig/configfix.c   | 351 ++++++++++++++++++++++++++++++++++
 scripts/kconfig/configfix.h   |  31 +++
 4 files changed, 532 insertions(+)
 create mode 100644 scripts/kconfig/cfoutconfig.c
 create mode 100644 scripts/kconfig/configfix.c
 create mode 100644 scripts/kconfig/configfix.h

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index 0b2ff775b2e3..23446f70083e 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -5,3 +5,4 @@
 /[gmnq]conf-cflags
 /[gmnq]conf-libs
 /qconf-moc.cc
+/cfoutconfig
diff --git a/scripts/kconfig/cfoutconfig.c b/scripts/kconfig/cfoutconfig.c
new file mode 100644
index 000000000000..d7cc853ed741
--- /dev/null
+++ b/scripts/kconfig/cfoutconfig.c
@@ -0,0 +1,149 @@
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
+
+#include "internal.h"
+#include "picosat_functions.h"
+#include "cf_expr.h"
+#include "cf_utils.h"
+#include "cf_constraints.h"
+
+#define OUTFILE_CONSTRAINTS "./scripts/kconfig/cfout_constraints.txt"
+#define OUTFILE_DIMACS "./scripts/kconfig/cfout_constraints.dimacs"
+
+static void write_constraints_to_file(struct cfdata *data);
+static void write_dimacs_to_file(PicoSAT *pico, struct cfdata *data);
+
+/* -------------------------------------- */
+
+int main(int argc, char *argv[])
+{
+	clock_t start, end;
+	double time;
+	PicoSAT *pico;
+
+	static struct constants constants = {NULL, NULL, NULL, NULL, NULL};
+	static struct cfdata data = {
+		1,    // unsigned int sat_variable_nr
+		1,    // unsigned int tmp_variable_nr
+		NULL, // struct fexpr *satmap
+		0,    // size_t satmap_size
+		&constants // struct constants *constants
+	};
+	if (!load_picosat()) {
+		printf("You need to install PicoSAT first\n");
+		return EXIT_FAILURE;
+	}
+
+	printf("\nCreating constraints and CNF clauses...");
+	/* measure time for constructing constraints and clauses */
+	start = clock();
+
+	/* parse Kconfig-file and read .config */
+	init_config(argv[1]);
+
+	/* initialize satmap and cnf_clauses */
+	init_data(&data);
+
+	/* creating constants */
+	create_constants(&data);
+
+	/* assign SAT variables & create sat_map */
+	create_sat_variables(&data);
+
+	/* get the constraints */
+	build_constraints(&data);
+
+	end = clock();
+	time = ((double) (end - start)) / CLOCKS_PER_SEC;
+
+	printd("done. (%.6f secs.)\n", time);
+
+	/* start PicoSAT */
+	pico = picosat_init();
+	picosat_enable_trace_generation(pico);
+	printd("Building CNF-clauses...");
+	start = clock();
+
+	/* construct the CNF clauses */
+	construct_cnf_clauses(pico, &data);
+
+	end = clock();
+	time = ((double) (end - start)) / CLOCKS_PER_SEC;
+	printf("done. (%.6f secs.)\n", time);
+
+	printf("\n");
+
+	/* write constraints into file */
+	start = clock();
+	printf("Writing constraints...");
+	write_constraints_to_file(&data);
+	end = clock();
+	time = ((double) (end - start)) / CLOCKS_PER_SEC;
+	printf("done. (%.6f secs.)\n", time);
+
+	/* write SAT problem in DIMACS into file */
+	start = clock();
+	printf("Writing SAT problem in DIMACS...");
+	write_dimacs_to_file(pico, &data);
+	end = clock();
+	time = ((double) (end - start)) / CLOCKS_PER_SEC;
+	printf("done. (%.6f secs.)\n", time);
+
+	printf("\nConstraints have been written into %s\n", OUTFILE_CONSTRAINTS);
+	printf("DIMACS-output has been written into %s\n", OUTFILE_DIMACS);
+
+	return 0;
+}
+
+static void write_constraints_to_file(struct cfdata *data)
+{
+	FILE *fd = fopen(OUTFILE_CONSTRAINTS, "w");
+	struct symbol *sym;
+
+	for_all_symbols(sym) {
+		struct pexpr_node *node;
+
+		if (sym->type == S_UNKNOWN)
+			continue;
+
+		list_for_each_entry(node, &sym->constraints->list, node) {
+			struct gstr s = str_new();
+
+			pexpr_as_char(node->elem, &s, 0, data);
+			fprintf(fd, "%s\n", str_get(&s));
+			str_free(&s);
+		}
+	}
+	fclose(fd);
+}
+
+static void add_comment(FILE *fd, struct fexpr *e)
+{
+	fprintf(fd, "c %d %s\n", e->satval, str_get(&e->name));
+}
+
+static void write_dimacs_to_file(PicoSAT *pico, struct cfdata *data)
+{
+	FILE *fd = fopen(OUTFILE_DIMACS, "w");
+
+	unsigned int i;
+
+	for (i = 1; i < data->sat_variable_nr; i++)
+		add_comment(fd, data->satmap[i]);
+
+	picosat_print(pico, fd);
+	fclose(fd);
+}
diff --git a/scripts/kconfig/configfix.c b/scripts/kconfig/configfix.c
new file mode 100644
index 000000000000..02cb2af229df
--- /dev/null
+++ b/scripts/kconfig/configfix.c
@@ -0,0 +1,351 @@
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
+
+#include "configfix.h"
+#include "internal.h"
+#include "picosat_functions.h"
+#include "cf_utils.h"
+#include "cf_constraints.h"
+#include "cf_rangefix.h"
+#include "cf_defs.h"
+#include "expr.h"
+#include "list.h"
+#include "lkc.h"
+
+bool CFDEBUG;
+bool stop_rangefix;
+
+static PicoSAT *pico;
+static bool init_done;
+static struct sym_list *conflict_syms;
+
+static bool sdv_within_range(struct sdv_list *symbols);
+
+/* -------------------------------------- */
+
+struct sfix_list **run_satconf(struct symbol_dvalue **symbols, size_t n,
+			       size_t *num_solutions)
+{
+	CF_DEF_LIST(symbols_list, sdv);
+	struct sfl_list *solutions;
+	struct sfix_list **solutions_arr;
+	struct sfl_node *node;
+	size_t i;
+
+	i = 0;
+	for (i = 0; i < n; ++i)
+		CF_PUSH_BACK(symbols_list, symbols[i], sdv);
+
+	solutions = run_satconf_list(symbols_list);
+	*num_solutions = list_size(&solutions->list);
+	solutions_arr = xcalloc(*num_solutions, sizeof(struct sfix_list *));
+	i = 0;
+	CF_LIST_FOR_EACH(node, solutions, sfl)
+		solutions_arr[i++] = node->elem;
+	CF_LIST_FREE(solutions, sfl);
+	return solutions_arr;
+}
+
+struct sfl_list *run_satconf_list(struct sdv_list *symbols)
+{
+	clock_t start, end;
+	double time;
+	struct symbol *sym;
+	struct sdv_node *node;
+	int res;
+	struct sfl_list *ret;
+
+	static struct constants constants = {NULL, NULL, NULL, NULL, NULL};
+	static struct cfdata data = {
+		1,    // unsigned int sat_variable_nr
+		1,    // unsigned int tmp_variable_nr
+		NULL, // struct fexpr *satmap
+		0,    // size_t satmap_size
+		&constants, // struct constants *constants
+		NULL // array with conflict-symbols
+	};
+
+
+	/* check whether all values can be applied -> no need to run */
+	if (sdv_within_range(symbols)) {
+		printd("\nAll symbols are already within range.\n\n");
+		return CF_LIST_INIT(sfl);
+	}
+
+	if (!init_done) {
+		printd("\n");
+		printd("Init...");
+
+		/* measure time for constructing constraints and clauses */
+		start = clock();
+
+		/* initialize satmap and cnf_clauses */
+		init_data(&data);
+
+		/* creating constants */
+		create_constants(&data);
+
+		/* assign SAT variables & create sat_map */
+		create_sat_variables(&data);
+
+		/* get the constraints */
+		build_constraints(&data);
+
+		end = clock();
+		time = ((double)(end - start)) / CLOCKS_PER_SEC;
+
+		printd("done. (%.6f secs.)\n", time);
+
+		/* start PicoSAT */
+		pico = initialize_picosat();
+		printd("Building CNF-clauses...");
+		start = clock();
+
+		/* construct the CNF clauses */
+		construct_cnf_clauses(pico, &data);
+
+		end = clock();
+		time = ((double)(end - start)) / CLOCKS_PER_SEC;
+
+		printd("done. (%.6f secs.)\n", time);
+
+		printd("CNF-clauses added: %d\n",
+		       picosat_added_original_clauses(pico));
+
+		init_done = true;
+	}
+
+	/* copy array with symbols to change */
+	data.sdv_symbols = CF_LIST_COPY(symbols, sdv);
+
+	/* add assumptions for conflict-symbols */
+	sym_add_assumption_sdv(pico, data.sdv_symbols);
+
+	/* add assumptions for all other symbols */
+	for_all_symbols(sym) {
+		if (sym->type == S_UNKNOWN)
+			continue;
+
+		if (!sym_is_sdv(data.sdv_symbols, sym))
+			sym_add_assumption(pico, sym);
+	}
+
+	/* store the conflict symbols */
+	conflict_syms = CF_LIST_INIT(sym);
+	CF_LIST_FOR_EACH(node, data.sdv_symbols, sdv)
+		CF_PUSH_BACK(conflict_syms, node->elem->sym, sym);
+
+	printd("Solving SAT-problem...");
+	start = clock();
+
+	res = picosat_sat(pico, -1);
+
+	end = clock();
+	time = ((double)(end - start)) / CLOCKS_PER_SEC;
+	printd("done. (%.6f secs.)\n\n", time);
+
+	if (res == PICOSAT_SATISFIABLE) {
+		printd("===> PROBLEM IS SATISFIABLE <===\n");
+
+		ret = CF_LIST_INIT(sfl);
+
+	} else if (res == PICOSAT_UNSATISFIABLE) {
+		printd("===> PROBLEM IS UNSATISFIABLE <===\n");
+		printd("\n");
+
+		ret = rangefix_run(pico, &data);
+	} else {
+		printd("Unknown if satisfiable.\n");
+
+		ret = CF_LIST_INIT(sfl);
+	}
+
+	CF_LIST_FREE(data.sdv_symbols, sdv);
+	return ret;
+}
+
+/*
+ * check whether a symbol is a conflict symbol
+ */
+static bool sym_is_conflict_sym(struct symbol *sym)
+{
+	struct sym_node *node;
+
+	CF_LIST_FOR_EACH(node, conflict_syms, sym)
+		if (sym == node->elem)
+			return true;
+
+	return false;
+}
+
+/*
+ * check whether all conflict symbols are set to their target values
+ */
+static bool syms_have_target_value(struct sfix_list *list)
+{
+	struct symbol_fix *fix;
+	struct sfix_node *node;
+
+	CF_LIST_FOR_EACH(node, list, sfix) {
+		fix = node->elem;
+
+		if (!sym_is_conflict_sym(fix->sym))
+			continue;
+
+		sym_calc_value(fix->sym);
+
+		if (sym_is_boolean(fix->sym)) {
+			if (fix->tri != sym_get_tristate_value(fix->sym))
+				return false;
+		} else {
+			if (strcmp(str_get(&fix->nb_val),
+				   sym_get_string_value(fix->sym)) != 0)
+				return false;
+		}
+	}
+
+	return true;
+}
+
+/*
+ *
+ * apply the fixes from a diagnosis
+ */
+int apply_fix(struct sfix_list *fix)
+{
+	struct symbol_fix *sfix;
+	struct sfix_node *node, *next;
+	unsigned int no_symbols_set = 0, iterations = 0, manually_changed = 0;
+	size_t fix_size = list_size(&fix->list);
+	struct sfix_list *tmp = CF_LIST_COPY(fix, sfix);
+
+	printd("Trying to apply fixes now...\n");
+
+	while (no_symbols_set < fix_size && !syms_have_target_value(fix)) {
+		if (iterations > fix_size * 2) {
+			printd("\nCould not apply all values :-(.\n");
+			return manually_changed;
+		}
+
+		list_for_each_entry_safe(node, next, &tmp->list, node) {
+			sfix = node->elem;
+
+			/* update symbol's current value */
+			sym_calc_value(sfix->sym);
+
+			/* value already set? */
+			if (sfix->type == SF_BOOLEAN) {
+				if (sfix->tri ==
+				    sym_get_tristate_value(sfix->sym)) {
+					list_del(&node->node);
+					no_symbols_set++;
+					continue;
+				}
+			} else if (sfix->type == SF_NONBOOLEAN) {
+				if (strcmp(str_get(&sfix->nb_val),
+					   sym_get_string_value(sfix->sym)) ==
+				    0) {
+					list_del(&node->node);
+					no_symbols_set++;
+					continue;
+				}
+			} else {
+				perror("Error applying fix. Value set for disallowed.");
+			}
+
+			/* could not set value, try next */
+			if (sfix->type == SF_BOOLEAN) {
+				if (!sym_set_tristate_value(sfix->sym,
+							    sfix->tri))
+					continue;
+			} else if (sfix->type == SF_NONBOOLEAN) {
+				if (!sym_set_string_value(
+					    sfix->sym,
+					    str_get(&sfix->nb_val)))
+					continue;
+			} else {
+				perror("Error applying fix. Value set for disallowed.");
+			}
+
+			/* could set value, remove from tmp */
+			manually_changed++;
+			if (sfix->type == SF_BOOLEAN) {
+				printd("%s set to %s.\n",
+				       sym_get_name(sfix->sym),
+				       tristate_get_char(sfix->tri));
+			} else if (sfix->type == SF_NONBOOLEAN) {
+				printd("%s set to %s.\n",
+				       sym_get_name(sfix->sym),
+				       str_get(&sfix->nb_val));
+			}
+
+			list_del(&node->node);
+			no_symbols_set++;
+		}
+
+		iterations++;
+	}
+
+	printd("Fixes successfully applied.\n");
+
+	return manually_changed;
+}
+
+/*
+ * stop RangeFix after the next iteration
+ */
+void interrupt_rangefix(void)
+{
+	stop_rangefix = true;
+}
+
+/*
+ * check whether all symbols are already within range
+ */
+static bool sdv_within_range(struct sdv_list *symbols)
+{
+	struct symbol_dvalue *sdv;
+	struct sdv_node *node;
+
+	CF_LIST_FOR_EACH(node, symbols, sdv) {
+		sdv = node->elem;
+
+		assert(sym_is_boolean(sdv->sym));
+
+		if (sdv->tri == sym_get_tristate_value(sdv->sym))
+			continue;
+
+		if (!sym_tristate_within_range(sdv->sym, sdv->tri))
+			return false;
+	}
+
+	return true;
+}
+
+/*
+ * for use in .cc files
+ */
+struct sfix_list *select_solution(struct sfl_list *solutions, int index)
+{
+	return list_at_index(index, &solutions->list, struct sfl_node, node)
+		->elem;
+}
+
+struct symbol_fix *select_symbol(struct sfix_list *solution, int index)
+{
+	return list_at_index(index, &solution->list, struct sfix_node, node)
+		->elem;
+}
diff --git a/scripts/kconfig/configfix.h b/scripts/kconfig/configfix.h
new file mode 100644
index 000000000000..186273fddabf
--- /dev/null
+++ b/scripts/kconfig/configfix.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
+ */
+
+#ifndef CONFIGFIX_H
+#define CONFIGFIX_H
+
+/* make functions accessible from xconfig */
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/* include own definitions */
+#include "cf_defs.h"
+
+/* external functions */
+struct sfix_list **run_satconf(struct symbol_dvalue **symbols, size_t n,
+			       size_t *num_solutions);
+struct sfl_list *run_satconf_list(struct sdv_list *symbols);
+int apply_fix(struct sfix_list *fix);
+int run_satconf_cli(const char *Kconfig_file);
+void interrupt_rangefix(void);
+struct sfix_list *select_solution(struct sfl_list *solutions, int index);
+struct symbol_fix *select_symbol(struct sfix_list *solution, int index);
+
+/* make functions accessible from xconfig */
+#ifdef __cplusplus
+}
+#endif
+#endif
-- 
2.39.5


