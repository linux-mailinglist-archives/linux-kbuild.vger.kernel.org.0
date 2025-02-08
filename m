Return-Path: <linux-kbuild+bounces-5684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF6A2D77E
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 17:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAB8716750A
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 16:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B509D248190;
	Sat,  8 Feb 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSUXmBcL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8741F3BBD;
	Sat,  8 Feb 2025 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032885; cv=none; b=nE0ux4/l3EFNDTJkrlW4o1jc97A/X8py2QMADYeV2q6ATr9+YHGrrCRE/9KFV7yyzwej0TjziekKNX0Gin+Wh6ghasS5DCB15s9wGHXc23dV+09y3agnJ79Xa960Ny40ZHHXCILkeYkD7kr/CFU/KBWBJbIobqCWHLLb+UDgO4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032885; c=relaxed/simple;
	bh=jGrFWzTihzlAQh18ukiuzZlgaKLeUDANnBxJ4PM2B9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qRk6lXOyOGEA85XQBl9gMx/1mJ3XlSR8jYMJewhy1DyVtATayjMz6Uo91KVjoVBZwXzAQdFFpCTgENPaP9GpzecOalKKjWRGiATsZu0uyhr2s64FHpOPTqrGftEYkZ+pY8CFVHiHe/PMJ5B5dVbEeCR0rfNGgy8Qqidv+sRWKu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSUXmBcL; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab78d9c5542so287089866b.1;
        Sat, 08 Feb 2025 08:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739032882; x=1739637682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYonhZzT/PmMHatRrfMF0S0W7UXu2WTis1ZFw8zaUSg=;
        b=QSUXmBcLghK696UJJSx3PnxNQxIIWnnrYMTLUgguEMYmstasum0Nd1GKiwGs0xS/Oi
         rve+yUIpTGbslYA/VF4gliYT9BrP2d4OfftI3abJwt7ZkZw001iZTfijp/b1H3mcu2vC
         mTaU3nnWiMZ8MGSCw1jFa5c0Hl45GG6qkD8l1eT9JLIjdccntGZ+NZNVRY3AAZMEOiVO
         /iUeK5bclTxi8ERhPmxrM+5YROi+LiGtG+bVj80SL5zeyZbIqZCdhzDxqcSgAM1RPHJr
         tzKr5C+Ms65q9WwMvTmSSC2ck4rZKK1cgtyOvNMFISXMa6x5Ms9OxslnBf82WHzVQU1l
         VdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032882; x=1739637682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYonhZzT/PmMHatRrfMF0S0W7UXu2WTis1ZFw8zaUSg=;
        b=dORuHjAsuGmPEbXjJGKPXk7qwl0u0XrBsOTKOuKbSgQsFTMoXW61p/2lICiZ1ZnljR
         4ajk013RIKG2vEY1t7TAzjncsoRz3ZTuVulHh93RLo+Tx1HHrxpOKvgOhR6mIYv3QNmB
         9TL7+yR7GBeRwt8ECYhUGE86HhuootLVnYiFRWxnkaOC6HiuGt4LQ5ikO3H/9rnqJMXx
         Bnl7fG/piI6v0gkEvu3CfJsZq9Mgb4msWq9NjeszPg24TWIixLzd1GRLxJAGsgvD7iOd
         zyMVFAIJLwHmuEHmAFsGJQBb7PujhX7vtvYYbP4zdQ0CxNboJcnnAIc1Q8v4DSPRobbP
         /1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVQGtszlhUvOwhyg8BNAOY29AvzpSlrFJBSzfkmkVMPd8jyc8aW8XQfdlhyBrgCVeUzXGkJ25JPJQKrpYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrv2g666XQrRQQhUhFvUwg+pSsUCvRs8xE7Qqjgm7xheoo5dE6
	IW3eH1wtVtzs6nHwhgzTMUU5cRviQ48O+mTIxNN8OcACz/EszhF4oqkNRQ==
X-Gm-Gg: ASbGncuipELYkbNA79Y4cqz7hP0y/VgLaKjzr+7Rd5rFghP3hzTk4mtuOHD7DA+hEMW
	Vgr0z+k5SSCXn/3PuOS9o6b63O3HMttKJIuk4YotkRSsZ0aceDR6mLF1XqYABBSls+ZmLJvZS5N
	fSUJklSqjkMKLQDtouNPNKxQdkNSpPxAucChyYlHp9FYoOZQI7Z+dGs36mJ1II0uedelGgrMaLK
	W+iFYyjBUXGps5SXgZUiZE8dlknEY0CYLZlrx6RuWCAsKXcSeM8PvqBCxe49BGtHjHZFGDriPnV
	KVoUIqCt89mXlWa9llRUd+ERvkyqhg==
X-Google-Smtp-Source: AGHT+IGQFXNGacQJzkbyUHREaPu8mgF21jupN9KjAT5MQydblH/SJ2MO5jFMaRYTec8t1Fx9tvpl/Q==
X-Received: by 2002:a17:907:d1a:b0:aa6:3f93:fb99 with SMTP id a640c23a62f3a-ab789bf9658mr876457566b.36.1739032881348;
        Sat, 08 Feb 2025 08:41:21 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:e115:64e7:5d6:176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337f3dsm501539166b.139.2025.02.08.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:41:20 -0800 (PST)
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
Subject: [PATCH v7 08/11] kconfig: Add tools
Date: Sat,  8 Feb 2025 17:39:56 +0100
Message-Id: <20250208163959.3973163-9-ole0811sch@gmail.com>
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

Add the actual API to be used from a configurator as well as a tool to
export the translation of the kconfig-model into propositional logic to
a file.

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
 scripts/kconfig/cfoutconfig.c | 149 ++++++++++++++
 scripts/kconfig/configfix.c   | 352 ++++++++++++++++++++++++++++++++++
 scripts/kconfig/configfix.h   |  31 +++
 4 files changed, 533 insertions(+)
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
index 000000000000..10e934979c8a
--- /dev/null
+++ b/scripts/kconfig/configfix.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
+ * ConfigFix documentation and contributors: http://github.com/isselab/configfix
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
+#include "cf_fixgen.h"
+#include "cf_defs.h"
+#include "expr.h"
+#include "list.h"
+#include "lkc.h"
+
+bool CFDEBUG;
+bool stop_fixgen;
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
+	*num_solutions = list_count_nodes(&solutions->list);
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
+		ret = fixgen_run(pico, &data);
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
+	size_t fix_size = list_count_nodes(&fix->list);
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
+ * stop fix generation after the next iteration
+ */
+void interrupt_fix_generation(void)
+{
+	stop_fixgen = true;
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
+	return cflist_at_index(index, &solutions->list, struct sfl_node, node)
+		->elem;
+}
+
+struct symbol_fix *select_symbol(struct sfix_list *solution, int index)
+{
+	return cflist_at_index(index, &solution->list, struct sfix_node, node)
+		->elem;
+}
diff --git a/scripts/kconfig/configfix.h b/scripts/kconfig/configfix.h
new file mode 100644
index 000000000000..717f12ec9a2c
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
+void interrupt_fix_generation(void);
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


