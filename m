Return-Path: <linux-kbuild+bounces-2457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2B92CB6B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC4EB1C20C37
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED3384D3F;
	Wed, 10 Jul 2024 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPxSpf1R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504EA84A39;
	Wed, 10 Jul 2024 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594487; cv=none; b=OnBny2lkH6cRZHQ2Msrn9ltzqZpG7hWfmUUwJjlob7c/5S8nQ342rUETazf1JyLLRodFl8YrhytQoICLHh6l0jhyeJi1uUh4vn5D1vDxUg0wxgdXfUrxQJI0SmqRhycIp01dLDfRHEZUDyXXOclxHgAEvGN+NsjZsR6cz3rTIHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594487; c=relaxed/simple;
	bh=VIAvE3fW4St6HOOYlyQut1giwJT1YvkJOj4uzD0buyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WtNB1CyNpANm/QuMUtnd0FoASwGENGKjX1Tu47qYiFhW4Z5nE2Scd83TCQTFOPOrbCCtbOU+6NIWuQk0/Yqz+srN6t0Q4XmgduVYy2jAmjt+x1662lm/HJ7fZjj5Lfq+0nwcO4OEl2rVVLp1+dUkwIpsAVk14T1HwvL7NcihBEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPxSpf1R; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-59559ea9cfdso1640897a12.0;
        Tue, 09 Jul 2024 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594484; x=1721199284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wQ7/egsf9ykdYqmaLwPSqiZJPY9FMphf9elhDIGU9o=;
        b=XPxSpf1RAECVDuRd2FJdXc7Rr9UkD55oHQWoWq+1gaRySPe1Zj4dynEiu2xiGHZry5
         YFqeCurn5wZ9QT1OL9HMWU9/W7I8fo1VK8XWm5X0cCEUBmxWylZc4hkGBrWRWkKeA050
         k/Zs1BAOIem828D7ZsDO18Qs7lh1qZdLxRxcG+BkHh3c3+22gmK2EdWcKoPAJE+Vm5Rf
         VNyu2En8ewtog3y59cyZ5rTRXB7kksZtRHI0wpBvYFnqQO3pc5cBijYzG/KXp1TLDND7
         hCbYB+tFmsnZnpofyr85IU+5OtPUMuA9FqTueCON3Iq77HFw7EiWpnXGfsee6sycZWLT
         AXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594484; x=1721199284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wQ7/egsf9ykdYqmaLwPSqiZJPY9FMphf9elhDIGU9o=;
        b=lzoJqIDk3ix7o8yJFiwRKUX6L+AWKQmurKj2WjlGE0piQyGvQ+JzpOSUHSS69HqoBn
         N/aoC5TbkSABhi8X1DXMqJzhKuhwoDlCkLD6RxlmVpt+BXp7JQx48x2rjbOZPVi6JVvR
         nP6x4Hlfb1w0sJlg4Rtc4TqfzahbsogbQW+pnMIss6phQHyCrlqXL3rVSyiH75eGv3i8
         2BuQMT49OfVIf5S4yicpKWNldxn9glc09n2mLWnwqKoOck/fQ+hXK6ceaeUqnpU60jb5
         JGOHfPQF3gw4dPosVtnHH+U+x3q6NxnNLwMVEebt/8dH5swPUCEZcdk6KXpTfmsB9WYB
         gJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGInB/QSXvWq8CnB8JcLU2zdaWUxPm6wCZWpOujdCz2e2OGPRnkSsxI6GxLqkjeUXCyC+dsIwCPsrZmx+faGlZ/Cg2Emr7yhE6NNAb
X-Gm-Message-State: AOJu0YxnlD9CZDp5HN7Pqpw5eBek8V3oCJNenFC+Q1EkKEcvW+oaHDLj
	BN3tgcbPfa/iTFIL3jirhi63Jg0M2FPZM/191z2mwhkUYbkGOUJBnCdV2Q==
X-Google-Smtp-Source: AGHT+IFjTKDYL/pzj2pscx5urb1m4WNjy+cM4WuhQbmmReRZjbSX8RZ6Q7OXQGN3dDGVtJ6EIGx/vA==
X-Received: by 2002:a05:6402:35c3:b0:58c:34cb:16a9 with SMTP id 4fb4d7f45d1cf-594baf91219mr3625840a12.16.1720594483443;
        Tue, 09 Jul 2024 23:54:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:43 -0700 (PDT)
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
Subject: [PATCH v4 10/12] kconfig: Add tools
Date: Wed, 10 Jul 2024 08:52:53 +0200
Message-Id: <20240710065255.10338-11-ole0811sch@gmail.com>
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
 scripts/kconfig/cfoutconfig.c | 142 ++++++++++++++
 scripts/kconfig/configfix.c   | 337 ++++++++++++++++++++++++++++++++++
 scripts/kconfig/configfix.h   |  40 ++++
 4 files changed, 520 insertions(+)
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
index 000000000000..c0879e6ebaa1
--- /dev/null
+++ b/scripts/kconfig/cfoutconfig.c
@@ -0,0 +1,142 @@
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
+	get_constraints(&data);
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
+		pexpr_list_for_each(node, sym->constraints) {
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
index 000000000000..e161424149c4
--- /dev/null
+++ b/scripts/kconfig/configfix.c
@@ -0,0 +1,337 @@
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
+#include "cf_expr.h"
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
+
+struct sfl_list *run_satconf(struct sdv_list *symbols)
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
+		return sfl_list_init();
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
+		get_constraints(&data);
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
+	data.sdv_symbols = sdv_list_copy(symbols);
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
+	conflict_syms = sym_list_init();
+	sdv_list_for_each(node, data.sdv_symbols)
+		sym_list_add(conflict_syms, node->elem->sym);
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
+		ret = sfl_list_init();
+
+	} else if (res == PICOSAT_UNSATISFIABLE) {
+		printd("===> PROBLEM IS UNSATISFIABLE <===\n");
+		printd("\n");
+
+		ret = rangefix_run(pico, &data);
+	} else {
+		printd("Unknown if satisfiable.\n");
+
+		ret = sfl_list_init();
+	}
+
+	sdv_list_free(data.sdv_symbols);
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
+	sym_list_for_each(node, conflict_syms)
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
+	sfix_list_for_each(node, list) {
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
+
+	struct sfix_list *tmp = sfix_list_copy(fix);
+
+	printd("Trying to apply fixes now...\n");
+
+	while (no_symbols_set < fix->size && !syms_have_target_value(fix)) {
+		if (iterations > fix->size * 2) {
+			printd("\nCould not apply all values :-(.\n");
+			return manually_changed;
+		}
+
+		for (node = tmp->head; node != NULL;) {
+			sfix = node->elem;
+
+			/* update symbol's current value */
+			sym_calc_value(sfix->sym);
+
+			/* value already set? */
+			if (sfix->type == SF_BOOLEAN) {
+				if (sfix->tri == sym_get_tristate_value(sfix->sym)) {
+					next = node->next;
+					sfix_list_delete(tmp, node);
+					node = next;
+					no_symbols_set++;
+					continue;
+				}
+			} else if (sfix->type == SF_NONBOOLEAN) {
+				if (strcmp(str_get(&sfix->nb_val),
+					   sym_get_string_value(sfix->sym)) == 0) {
+					next = node->next;
+					sfix_list_delete(tmp, node);
+					node = next;
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
+							    sfix->tri)) {
+					node = node->next;
+					continue;
+				}
+			} else if (sfix->type == SF_NONBOOLEAN) {
+				if (!sym_set_string_value(
+					    sfix->sym,
+					    str_get(&sfix->nb_val))) {
+					node = node->next;
+					continue;
+				}
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
+			next = node->next;
+			sfix_list_delete(tmp, node);
+			node = next;
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
+	sdv_list_for_each(node, symbols) {
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
+struct sfix_list *select_solution(struct sfl_list *solutions, int index)
+{
+	struct sfl_node *node = solutions->head;
+	unsigned int counter;
+
+	for (counter = 0; counter < index; counter++)
+		node = node->next;
+
+	return node->elem;
+}
+
+struct symbol_fix *select_symbol(struct sfix_list *solution, int index)
+{
+	struct sfix_node *node = solution->head;
+	unsigned int counter;
+
+	for (counter = 0; counter < index; counter++)
+		node = node->next;
+
+	return node->elem;
+}
diff --git a/scripts/kconfig/configfix.h b/scripts/kconfig/configfix.h
new file mode 100644
index 000000000000..8ebcc807da9d
--- /dev/null
+++ b/scripts/kconfig/configfix.h
@@ -0,0 +1,40 @@
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
+/* include internal definitions */
+#define LKC_DIRECT_LINK
+#include "lkc.h"
+
+/* include own definitions */
+#include "cf_defs.h"
+
+/* include other header files needed */
+#include "picosat.h"
+#include "cf_constraints.h"
+#include "cf_expr.h"
+#include "cf_rangefix.h"
+#include "cf_utils.h"
+
+/* external functions */
+struct sfl_list *run_satconf(struct sdv_list *symbols);
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
2.39.2


