Return-Path: <linux-kbuild+bounces-2454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 991AA92CB67
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFC43B21717
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8999684A3F;
	Wed, 10 Jul 2024 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z08FNgZW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3EB83CBA;
	Wed, 10 Jul 2024 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594485; cv=none; b=SG3pIJ81XQb+i7hGve9ADT16V3gi1oTmbFSB7khymLwvzjq0Fl9F42YVCinX4dFTjHRXstGXeYt2+VuwxSbLv6AmMMkrNHk+SfVSSBs0vAB/94wJZx5NmYroPBMznc8ukOJrvAs8pfCjbR6GM/8T3QQnuw3JGzs+JxT/umOLQUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594485; c=relaxed/simple;
	bh=LVpmot31rxHUr+wLKlVaab9HDxOpXZJgP370TjAe9Fo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=te5hL2QYUY0CwVdaGarYLtXdTKQCJD9uD9wnhH1Y4gNmu02eSM4Fn5vZmRn5Ymlr6SJaIDbAEf6OP71S5GBVlE+OeKfoeS2OMTuyX6LLYWCvzua9+27F3C7UqmfVvmNvmOhFuQLJglHoDPFoXr1c23bP8jTqQwBgyegjEXsm2h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z08FNgZW; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-585e774fd3dso7715493a12.0;
        Tue, 09 Jul 2024 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594480; x=1721199280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4DbKw9iO/NaCibS60MlbygTBQ8zjLZ/aVjaeX/cDTk=;
        b=Z08FNgZWhFR6bscD5sEVhDY3ehBLSHdNEZ5BxRabjxfALJ0/1l8e7DVmlOfB7R0tfa
         gXIzOD9nmj4lxfmVIF5k6k4zzJcqS7DAY71jw4MkUTpkpY5Ys9JM2AH+UQzSC/xWufAf
         R85r6lQqV0rqN8N5unZkBTPBPeswam6gZ5uKsmat94XEyzqz/CWgI1VeOmjGdLYlVerl
         71MiHSg8tPbaYzXyxy7ZepjZsDo4SXa2vCndLoLSV4D+2dsJiLn6W/Bqx4i0KfKYhTTD
         FPjzHNbEMMb71KVdrAEggoVnXwGb+yg5jjlz/z+Zjxz6dodM1qQ65C5Tt6HUl8S4chDr
         Q9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594480; x=1721199280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4DbKw9iO/NaCibS60MlbygTBQ8zjLZ/aVjaeX/cDTk=;
        b=j+VvISgSJJbf77mPWiVdeloSOGc/dKVQAeW9OHQC9BqyaMkg2CjoYB3i/KTCBTOSji
         1wdA0npqF2ZaGmq+QB4pCoeei6wCMMJVZlhoAzQ1I74l9vzCRycOfFIz9Jw6Zpj9EWio
         vexf+wAuV2EdTIKYQsmQRDmmRWSy9HZgOdAmE1iCVAoicZr+hI0myJ94Z/fjUM6Aqtgs
         q7sFrjvUyB9Xcw0qWn1G5gfi+8huuVvQMq5A7CgMAtem30+Bqqa6ZjvgMRtfCPUBzXZW
         InWpN4pLKbWZom5+vYS0+PN/lbcLpbyACpEgnQMTuQEjPjfkkKe3YfV2lIHxEXUlc8wt
         ogwA==
X-Forwarded-Encrypted: i=1; AJvYcCWU0QrpHnDZyCYw2cMueoKRasOvTVKSKv0oTXYLIO6HG2pXAZW6QsTXEveTmWrObuUKlxHbPYMLDDJs0cYIBf68bWCHJJvZhC47+6L/
X-Gm-Message-State: AOJu0Yworvc8WISSi8x/q3eZLf4aqCZTXi1wbEtlO4rFtQFhF2Zz48eU
	L2YHfl0lQgEWhxamH12/APHfGlBUwkK2HcU5ETI5xAHwlLPL/mIL3tavag==
X-Google-Smtp-Source: AGHT+IEeodXVcXIUU6vMXvGJdaEyjp8vAlFdOZ4wEgqX1hlPwtQ40WcEaHlui9ZWddQC6q/gRaqL7Q==
X-Received: by 2002:a05:6402:1ed6:b0:584:a6f8:c0c5 with SMTP id 4fb4d7f45d1cf-594b7d81a1emr3786556a12.0.1720594480137;
        Tue, 09 Jul 2024 23:54:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:39 -0700 (PDT)
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
Subject: [PATCH v4 08/12] kconfig: Add files for RangeFix
Date: Wed, 10 Jul 2024 08:52:51 +0200
Message-Id: <20240710065255.10338-9-ole0811sch@gmail.com>
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

The algorithm RangeFix is used to resolve the conflicts. This is the
implementation of the algorithm.

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
 scripts/kconfig/cf_rangefix.c | 1066 +++++++++++++++++++++++++++++++++
 scripts/kconfig/cf_rangefix.h |   21 +
 2 files changed, 1087 insertions(+)
 create mode 100644 scripts/kconfig/cf_rangefix.c
 create mode 100644 scripts/kconfig/cf_rangefix.h

diff --git a/scripts/kconfig/cf_rangefix.c b/scripts/kconfig/cf_rangefix.c
new file mode 100644
index 000000000000..bd5229b1d656
--- /dev/null
+++ b/scripts/kconfig/cf_rangefix.c
@@ -0,0 +1,1066 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
+ */
+
+#include "cf_defs.h"
+#include "cf_expr.h"
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
+#include "cf_rangefix.h"
+#include "internal.h"
+#include "cf_utils.h"
+
+#define MAX_DIAGNOSES 3
+#define MAX_SECONDS 120
+#define PRINT_UNSAT_CORE true
+#define PRINT_DIAGNOSES false
+#define PRINT_DIAGNOSIS_FOUND true
+#define MINIMISE_DIAGNOSES false
+#define MINIMISE_UNSAT_CORE true
+
+static struct sfl_list *diagnoses_symbol;
+
+static struct fexl_list *generate_diagnoses(PicoSAT *pico, struct cfdata *data);
+
+static void add_fexpr_to_constraint_set(struct fexpr_list *C, struct cfdata *data);
+static void set_assumptions(PicoSAT *pico, struct fexpr_list *c, struct cfdata *data);
+static void fexpr_add_assumption(PicoSAT *pico, struct fexpr *e, int satval);
+static struct fexpr_list *get_unsat_core_soft(PicoSAT *pico, struct cfdata *data);
+static void minimise_unsat_core(PicoSAT *pico, struct fexpr_list *C, struct cfdata *data);
+
+
+static struct fexpr_list *get_difference(struct fexpr_list *C, struct fexpr_list *E0);
+static bool has_intersection(struct fexpr_list *e, struct fexpr_list *X);
+static struct fexpr_list *fexpr_list_union(struct fexpr_list *A, struct fexpr_list *B);
+static struct fexl_list *fexl_list_union(struct fexl_list *A, struct fexl_list *B);
+static bool is_subset_of(struct fexpr_list *A, struct fexpr_list *B);
+static void print_unsat_core(struct fexpr_list *list);
+static bool diagnosis_contains_fexpr(struct fexpr_list *diagnosis, struct fexpr *e);
+static bool diagnosis_contains_symbol(struct sfix_list *diagnosis, struct symbol *sym);
+
+static void print_diagnoses(struct fexl_list *diag);
+static void print_diagnoses_symbol(struct sfl_list *diag_sym);
+
+static struct sfl_list *convert_diagnoses(struct fexl_list *diagnoses, struct cfdata *data);
+static struct sfix_list *convert_diagnosis(struct fexpr_list *diagnosis, struct cfdata *data);
+static struct symbol_fix *symbol_fix_create(struct fexpr *e, enum symbolfix_type type,
+					    struct fexpr_list *diagnosis);
+static struct sfl_list *minimise_diagnoses(PicoSAT *pico, struct fexl_list *diagnoses,
+					   struct cfdata *data);
+
+static tristate calculate_new_tri_val(struct fexpr *e, struct fexpr_list *diagnosis);
+static const char *calculate_new_string_value(struct fexpr *e, struct fexpr_list *diagnosis);
+
+/* count assumptions, only used for debugging */
+static unsigned int nr_of_assumptions = 0, nr_of_assumptions_true;
+
+/* -------------------------------------- */
+
+struct sfl_list *rangefix_run(PicoSAT *pico, struct cfdata *data)
+{
+	clock_t start, end;
+	double time;
+	struct fexl_list *diagnoses;
+	struct fexl_node *node;
+
+	printd("Starting RangeFix...\n");
+	printd("Generating diagnoses...");
+
+	/* generate the diagnoses */
+	start = clock();
+	diagnoses = generate_diagnoses(pico, data);
+	end = clock();
+
+	time = ((double) (end - start)) / CLOCKS_PER_SEC;
+	printd("Generating diagnoses...done. (%.6f secs.)\n", time);
+
+	if (PRINT_DIAGNOSES) {
+		printd("Diagnoses (only for debugging):\n");
+		print_diagnoses(diagnoses);
+		printd("\n");
+	}
+
+	/* convert diagnoses of fexpr to diagnoses of symbols */
+	if (MINIMISE_DIAGNOSES)
+		diagnoses_symbol = minimise_diagnoses(pico, diagnoses, data);
+	else
+		diagnoses_symbol = convert_diagnoses(diagnoses, data);
+
+	printd("\n");
+
+	fexpr_list_for_each(node, diagnoses)
+		fexpr_list_free(node->elem);
+	fexl_list_free(diagnoses);
+
+	return diagnoses_symbol;
+}
+
+/*
+ * generate the diagnoses
+ */
+static struct fexl_list *generate_diagnoses(PicoSAT *pico, struct cfdata *data)
+{
+	struct fexpr_list *C = fexpr_list_init();
+	struct fexl_list *E = fexl_list_init();
+	struct fexl_list *R = fexl_list_init();
+	struct fexpr_list *X, *e, *x_set, *E1, *E2;
+	struct fexl_list *E_R_Union;
+	struct fexpr_list *empty_diagnosis;
+	clock_t start_t, end_t;
+	double time_t;
+
+	/* create constraint set C */
+	add_fexpr_to_constraint_set(C, data);
+
+	if (PRINT_UNSAT_CORE)
+		printd("\n");
+
+	/* init E with an empty diagnosis */
+	empty_diagnosis = fexpr_list_init();
+	fexl_list_add(E, empty_diagnosis);
+
+	/* start the clock */
+	start_t = clock();
+
+	while (E->size > 0) {
+		/* get random diagnosis */
+		struct fexpr_list *E0 = E->head->elem;
+
+		/* calculate C\E0 */
+		struct fexpr_list *c = get_difference(C, E0);
+
+		struct fexl_node *node, *tmp;
+		int res;
+
+		/* set assumptions */
+		nr_of_assumptions = 0;
+		nr_of_assumptions_true = 0;
+		set_assumptions(pico, c, data);
+		fexpr_list_free(c);
+
+		res = picosat_sat(pico, -1);
+
+		if (res == PICOSAT_SATISFIABLE) {
+			if (PRINT_DIAGNOSIS_FOUND && CFDEBUG)
+				fexpr_list_print("DIAGNOSIS FOUND", E0);
+
+			fexl_list_delete(E, E->head);
+			if (E0->size > 0)
+				fexl_list_add(R, E0);
+			else
+				fexpr_list_free(E0);
+
+			if (R->size >= MAX_DIAGNOSES)
+				goto DIAGNOSES_FOUND;
+
+			continue;
+
+		} else if (res == PICOSAT_UNSATISFIABLE) {
+
+		} else if (res == PICOSAT_UNKNOWN) {
+			printd("UNKNOWN\n");
+		} else {
+			perror("Doh.");
+		}
+
+		/* check elapsed time */
+		end_t = clock();
+		time_t = ((double) (end_t - start_t)) / CLOCKS_PER_SEC;
+		if (time_t > (double) MAX_SECONDS)
+			goto DIAGNOSES_FOUND;
+
+		/* abort and return results if cancelled by user */
+		if (stop_rangefix) {
+			stop_rangefix = false;
+			goto DIAGNOSES_FOUND;
+		}
+
+		/* get unsat core from SAT solver */
+		X = get_unsat_core_soft(pico, data);
+
+		/* minimise the unsat core */
+		if (MINIMISE_UNSAT_CORE)
+			minimise_unsat_core(pico, X, data);
+
+		if (PRINT_UNSAT_CORE)
+			print_unsat_core(X);
+
+		for (node = E->head; node != NULL;) {
+			struct fexpr_node *fnode;
+
+			/* get partial diagnosis */
+			e = node->elem;
+
+			/* check, if there is an intersection between e and X
+			 * if there is, go to the next partial diagnosis
+			 */
+			if (has_intersection(e, X)) {
+				node = node->next;
+				continue;
+			}
+
+			/* for each fexpr in the core */
+			fexpr_list_for_each(fnode, X) {
+				struct fexpr *x = fnode->elem;
+				bool E2_subset_of_E1;
+				struct fexl_node *lnode;
+				struct fexl_list *E_without_e;
+
+				/* create {x} */
+				x_set = fexpr_list_init();
+				fexpr_list_add(x_set, x);
+
+				/* create E' = e U {x} */
+				E1 = fexpr_list_union(e, x_set);
+
+				/* create (E\e) U R */
+				E_without_e = fexl_list_copy(E);
+				fexl_list_delete_elem(E_without_e, e);
+				E_R_Union = fexl_list_union(E_without_e, R);
+
+				E2_subset_of_E1 = false;
+
+				/* E" in (E\e) U R */
+				fexl_list_for_each(lnode, E_R_Union) {
+					E2 = lnode->elem;
+
+					/* E" subset of E' ? */
+					if (is_subset_of(E2, E1)) {
+						E2_subset_of_E1 = true;
+						break;
+					}
+				}
+
+				fexl_list_free(E_without_e);
+				fexl_list_free(E_R_Union);
+				fexpr_list_free(x_set);
+
+				/* there exists no E" that is a subset of E' */
+				if (!E2_subset_of_E1)
+					fexl_list_add(E, E1);
+				else
+					fexpr_list_free(E1);
+			}
+
+			fexpr_list_free(e);
+
+			tmp = node->next;
+			fexl_list_delete(E, node);
+			node = tmp;
+		}
+		fexpr_list_free(X);
+	}
+
+	struct fexl_node *node;
+DIAGNOSES_FOUND:
+	fexpr_list_free(C);
+	fexl_list_for_each(node, E)
+		fexpr_list_free(node->elem);
+	fexl_list_free(E);
+
+	return R;
+}
+
+/*
+ * add the fexpr to the constraint set C
+ */
+static void add_fexpr_to_constraint_set(struct fexpr_list *C, struct cfdata *data)
+{
+	struct symbol *sym;
+
+	for_all_symbols(sym) {
+		/* must be a proper symbol */
+		if (sym->type == S_UNKNOWN)
+			continue;
+
+		/* don't need the conflict symbols they are handled separately */
+		if (sym_is_sdv(data->sdv_symbols, sym))
+			continue;
+
+		/* must have a prompt and a name */
+		if (!sym->name || !sym_has_prompt(sym))
+			continue;
+
+		if (sym->type == S_BOOLEAN)
+			fexpr_list_add(C, sym->fexpr_y);
+		else if (sym->type == S_TRISTATE) {
+			fexpr_list_add(C, sym->fexpr_y);
+			fexpr_list_add(C, sym->fexpr_m);
+		} else if (sym->type == S_INT || sym->type == S_HEX || sym->type == S_STRING) {
+			struct fexpr_node *node;
+
+			fexpr_list_for_each(node, sym->nb_vals)
+				fexpr_list_add(C, node->elem);
+		} else {
+			perror("Error adding variables to constraint set C.");
+		}
+	}
+}
+
+/*
+ * check whether the fexpr symbolises the no-value-set fexpr for a non-boolean symbol
+ */
+static bool fexpr_is_novalue(struct fexpr *e)
+{
+	if (!sym_is_nonboolean(e->sym))
+		return false;
+
+	return e == e->sym->nb_vals->head->elem;
+}
+
+static void set_assumptions_sdv(PicoSAT *pico, struct sdv_list *arr)
+{
+	struct symbol_dvalue *sdv;
+	struct sdv_node *node;
+	struct symbol *sym;
+
+	sdv_list_for_each(node, arr) {
+		int lit_y;
+
+		sdv = node->elem;
+		sym = sdv->sym;
+
+		lit_y = sym->fexpr_y->satval;
+
+		if (sym->type == S_BOOLEAN) {
+			switch (sdv->tri) {
+			case yes:
+				picosat_assume(pico, lit_y);
+				sym->fexpr_y->assumption = true;
+				nr_of_assumptions_true++;
+				break;
+			case no:
+				picosat_assume(pico, -lit_y);
+				sym->fexpr_y->assumption = false;
+				break;
+			case mod:
+				perror("Should not happen.\n");
+			}
+			nr_of_assumptions++;
+		} else if (sym->type == S_TRISTATE) {
+			int lit_m = sym->fexpr_m->satval;
+
+			switch (sdv->tri) {
+			case yes:
+				picosat_assume(pico, lit_y);
+				sym->fexpr_y->assumption = true;
+				picosat_assume(pico, -lit_m);
+				sym->fexpr_m->assumption = false;
+				nr_of_assumptions_true++;
+				break;
+			case mod:
+				picosat_assume(pico, -lit_y);
+				sym->fexpr_y->assumption = false;
+				picosat_assume(pico, lit_m);
+				sym->fexpr_m->assumption = true;
+				nr_of_assumptions_true++;
+				break;
+			case no:
+				picosat_assume(pico, -lit_y);
+				sym->fexpr_y->assumption = false;
+				picosat_assume(pico, -lit_m);
+				sym->fexpr_y->assumption = false;
+			}
+			nr_of_assumptions += 2;
+		}
+	}
+}
+
+/*
+ * set the assumptions for the next run of Picosat
+ */
+static void set_assumptions(PicoSAT *pico, struct fexpr_list *c, struct cfdata *data)
+{
+	struct fexpr_node *node;
+
+	fexpr_list_for_each(node, c)
+		fexpr_add_assumption(pico, node->elem, node->elem->satval);
+
+	/* set assumptions for the conflict-symbols */
+	set_assumptions_sdv(pico, data->sdv_symbols);
+}
+
+/*
+ * set the assumtption for a fexpr for the next run of Picosat
+ */
+static void fexpr_add_assumption(PicoSAT *pico, struct fexpr *e, int satval)
+{
+	struct symbol *sym = e->sym;
+
+	if (sym->type == S_BOOLEAN) {
+		int tri_val = sym_get_tristate_value(sym);
+
+		if (tri_val == yes) {
+			picosat_assume(pico, satval);
+			e->assumption = true;
+			nr_of_assumptions_true++;
+		} else {
+			picosat_assume(pico, -satval);
+			e->assumption = false;
+		}
+		nr_of_assumptions++;
+	}
+
+	if (sym->type == S_TRISTATE) {
+		int tri_val = sym_get_tristate_value(sym);
+
+		if (e->tri == yes) {
+			if (tri_val == yes) {
+				picosat_assume(pico, satval);
+				e->assumption = true;
+				nr_of_assumptions_true++;
+			} else {
+				picosat_assume(pico, -satval);
+				e->assumption = false;
+			}
+		} else if (e->tri == mod) {
+			if (tri_val == mod) {
+				picosat_assume(pico, satval);
+				e->assumption = true;
+				nr_of_assumptions_true++;
+			} else {
+				picosat_assume(pico, -satval);
+				e->assumption = false;
+			}
+		}
+		nr_of_assumptions++;
+	}
+
+	if (sym->type == S_INT || sym->type == S_HEX || sym->type == S_STRING) {
+
+		char *string_val = (char *) sym_get_string_value(sym);
+
+		if (sym->type == S_STRING && !strcmp(string_val, ""))
+			return;
+
+		/* check, if e symbolises the no-value-set fexpr */
+		if (fexpr_is_novalue(e)) {
+			if (!sym_nonbool_has_value_set(sym)) {
+				picosat_assume(pico, satval);
+				e->assumption = true;
+				nr_of_assumptions_true++;
+			} else {
+				picosat_assume(pico, -satval);
+				e->assumption = false;
+			}
+		}
+		/* check whena string-symbol has value "" */
+		else if (sym->type == S_STRING && !strcmp(string_val, "")) {
+			if (sym_nonbool_has_value_set(sym)) {
+				picosat_assume(pico, satval);
+				e->assumption = true;
+				nr_of_assumptions_true++;
+			} else {
+				picosat_assume(pico, -satval);
+				e->assumption = false;
+			}
+		} else {
+			if (!strcmp(str_get(&e->nb_val), string_val) &&
+					sym_nonbool_has_value_set(sym)) {
+				picosat_assume(pico, satval);
+				e->assumption = true;
+				nr_of_assumptions_true++;
+			} else {
+				picosat_assume(pico, -satval);
+				e->assumption = false;
+			}
+		}
+		nr_of_assumptions++;
+	}
+}
+
+/*
+ * get the unsatisfiable soft constraints from the last run of Picosat
+ */
+static struct fexpr_list *get_unsat_core_soft(PicoSAT *pico, struct cfdata *data)
+{
+	struct fexpr_list *ret = fexpr_list_init();
+	struct fexpr *e;
+
+	int lit;
+	const int *i = picosat_failed_assumptions(pico);
+
+	lit = abs(*i++);
+
+	while (lit != 0) {
+		e = data->satmap[lit];
+
+		if (!sym_is_sdv(data->sdv_symbols, e->sym))
+			fexpr_list_add(ret, e);
+
+		lit = abs(*i++);
+	}
+
+	return ret;
+}
+
+/*
+ * minimise the unsat core C
+ */
+static void minimise_unsat_core(PicoSAT *pico, struct fexpr_list *C, struct cfdata *data)
+{
+	struct fexpr_list *c_set;
+	struct fexpr_node *node, *tmp;
+
+	/* no need to check further */
+	if (C->size == 1)
+		return;
+
+	for (node = C->head; node != NULL;) {
+		struct fexpr_list *t;
+		int res;
+
+		if (C->size == 1)
+			return;
+
+		/* create C\c */
+		c_set = fexpr_list_init();
+		fexpr_list_add(c_set, node->elem);
+		t = get_difference(C, c_set);
+
+		/* invoke PicoSAT */
+		set_assumptions(pico, t, data);
+
+		res = picosat_sat(pico, -1);
+
+		tmp = node->next;
+
+		if (res == PICOSAT_UNSATISFIABLE)
+			fexpr_list_delete(C, node);
+
+		node = tmp;
+
+		fexpr_list_free(c_set);
+		fexpr_list_free(t);
+	}
+}
+
+
+/*
+ * Calculate C\E0
+ */
+static struct fexpr_list *get_difference(struct fexpr_list *C, struct fexpr_list *E0)
+{
+	struct fexpr_list *ret = fexpr_list_init();
+	struct fexpr_node *node1, *node2;
+	bool found;
+
+	fexpr_list_for_each(node1, C) {
+		found = false;
+		fexpr_list_for_each(node2, E0) {
+			if (node1->elem->satval == node2->elem->satval) {
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			fexpr_list_add(ret, node1->elem);
+	}
+
+	return ret;
+}
+
+/*
+ * check, if there is an intersection between e and X
+ */
+static bool has_intersection(struct fexpr_list *e, struct fexpr_list *X)
+{
+	struct fexpr_node *node1, *node2;
+
+	fexpr_list_for_each(node1, e)
+		fexpr_list_for_each(node2, X)
+			if (node1->elem->satval == node2->elem->satval)
+				return true;
+
+	return false;
+}
+
+/*
+ * get the union of 2 fexpr_list
+ */
+static struct fexpr_list *fexpr_list_union(struct fexpr_list *A, struct fexpr_list *B)
+{
+	struct fexpr_list *ret = fexpr_list_copy(A);
+	struct fexpr_node *node1, *node2;
+	bool found;
+
+	fexpr_list_for_each(node2, B) {
+		found = false;
+		fexpr_list_for_each(node1, A) {
+			if (node2->elem->satval == node1->elem->satval) {
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			fexpr_list_add(ret, node2->elem);
+	}
+
+	return ret;
+}
+
+/*
+ * get the union of 2 fexl_list
+ */
+static struct fexl_list *fexl_list_union(struct fexl_list *A, struct fexl_list *B)
+{
+	struct fexl_list *ret = fexl_list_copy(A);
+	struct fexl_node *node1, *node2;
+	bool found;
+
+	fexl_list_for_each(node2, B) {
+		found = false;
+		fexl_list_for_each(node1, A) {
+			if (node2->elem == node1->elem) {
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			fexl_list_add(ret, node2->elem);
+	}
+
+	return ret;
+}
+
+/*
+ * check, whether A is a subset of B
+ */
+static bool is_subset_of(struct fexpr_list *A, struct fexpr_list *B)
+{
+	struct fexpr_node *node1, *node2;
+	bool found;
+
+	fexpr_list_for_each(node1, A) {
+		found = false;
+		fexpr_list_for_each(node2, B) {
+			if (node1->elem->satval == node2->elem->satval) {
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			return false;
+	}
+
+	return true;
+}
+
+/*
+ * print an unsat core
+ */
+static void print_unsat_core(struct fexpr_list *list)
+{
+	struct fexpr_node *node;
+
+	printd("Unsat core: [");
+
+	fexpr_list_for_each(node, list) {
+		printd("%s", str_get(&node->elem->name));
+		printd(" <%s>", node->elem->assumption == true ? "T" : "F");
+		if (node->next != NULL)
+			printd(", ");
+	}
+
+	printd("]\n");
+}
+
+
+/*
+ * check if a diagnosis contains a fexpr
+ */
+static bool diagnosis_contains_fexpr(struct fexpr_list *diagnosis, struct fexpr *e)
+{
+	struct fexpr_node *node;
+
+	fexpr_list_for_each(node, diagnosis)
+		if (node->elem->satval == e->satval)
+			return true;
+
+	return false;
+}
+
+/*
+ * check if a diagnosis contains a symbol
+ */
+static bool diagnosis_contains_symbol(struct sfix_list *diagnosis, struct symbol *sym)
+{
+	struct sfix_node *node;
+
+	sfix_list_for_each(node, diagnosis)
+		if (sym == node->elem->sym)
+			return true;
+
+	return false;
+}
+
+/*
+ * print the diagnoses of type fexpr_list
+ */
+static void print_diagnoses(struct fexl_list *diag)
+{
+	struct fexl_node *lnode;
+	unsigned int i = 1;
+
+	fexl_list_for_each(lnode, diag) {
+		struct fexpr_node *node;
+
+		printd("%d: [", i++);
+		fexpr_list_for_each(node, lnode->elem) {
+			char *new_val = node->elem->assumption ? "false" : "true";
+
+			printd("%s => %s", str_get(&node->elem->name), new_val);
+			if (node->next != NULL)
+				printd(", ");
+		}
+		printd("]\n");
+	}
+}
+
+/*
+ * print a single diagnosis of type symbol_fix
+ */
+void print_diagnosis_symbol(struct sfix_list *diag_sym)
+{
+	struct symbol_fix *fix;
+	struct sfix_node *node;
+
+	printd("[");
+
+	sfix_list_for_each(node, diag_sym) {
+		fix = node->elem;
+
+		if (fix->type == SF_BOOLEAN)
+			printd("%s => %s", fix->sym->name, tristate_get_char(fix->tri));
+		else if (fix->type == SF_NONBOOLEAN)
+			printd("%s => %s", fix->sym->name, str_get(&fix->nb_val));
+		else
+			perror("NB not yet implemented.");
+
+		if (node->next != NULL)
+			printd(", ");
+	}
+	printd("]\n");
+}
+
+/*
+ * print the diagnoses of type symbol_fix
+ */
+static void print_diagnoses_symbol(struct sfl_list *diag_sym)
+{
+	struct sfl_node *arr;
+	unsigned int i = 1;
+
+	sfl_list_for_each(arr, diag_sym) {
+		printd("%d: ", i++);
+		print_diagnosis_symbol(arr->elem);
+	}
+}
+
+/*
+ * convert a single diagnosis of fexpr into a diagnosis of symbols
+ */
+static struct sfix_list *convert_diagnosis(struct fexpr_list *diagnosis, struct cfdata *data)
+{
+	struct sfix_list *diagnosis_symbol = sfix_list_init();
+	struct fexpr *e;
+	struct symbol_fix *fix;
+	struct symbol_dvalue *sdv;
+	struct sdv_node *snode;
+	struct fexpr_node *fnode;
+
+	/* set the values for the conflict symbols */
+	sdv_list_for_each(snode, data->sdv_symbols) {
+		sdv = snode->elem;
+		fix = xcalloc(1, sizeof(*fix));
+		fix->sym = sdv->sym;
+		fix->type = SF_BOOLEAN;
+		fix->tri = sdv->tri;
+		sfix_list_add(diagnosis_symbol, fix);
+	}
+
+	fexpr_list_for_each(fnode, diagnosis) {
+		enum symbolfix_type type;
+
+		e = fnode->elem;
+
+		/* diagnosis already contains symbol, so continue */
+		if (diagnosis_contains_symbol(diagnosis_symbol, e->sym))
+			continue;
+
+		if (sym_is_boolean(e->sym))
+			type = SF_BOOLEAN;
+		else if (sym_is_nonboolean(e->sym))
+			type = SF_NONBOOLEAN;
+		else
+			type = SF_DISALLOWED;
+		fix = symbol_fix_create(e, type, diagnosis);
+
+		sfix_list_add(diagnosis_symbol, fix);
+	}
+
+	return diagnosis_symbol;
+}
+
+/*
+ * convert the diagnoses of fexpr into diagnoses of symbols
+ * it is easier to handle symbols when applying fixes
+ */
+static struct sfl_list *convert_diagnoses(struct fexl_list *diag_arr, struct cfdata *data)
+{
+	struct fexl_node *lnode;
+
+	diagnoses_symbol = sfl_list_init();
+
+	fexl_list_for_each(lnode, diag_arr) {
+		struct sfix_list *fix = convert_diagnosis(lnode->elem, data);
+
+		sfl_list_add(diagnoses_symbol, fix);
+	}
+
+	return diagnoses_symbol;
+}
+
+/*
+ * create a symbol_fix given a fexpr
+ */
+static struct symbol_fix *symbol_fix_create(struct fexpr *e, enum symbolfix_type type,
+					    struct fexpr_list *diagnosis)
+{
+	struct symbol_fix *fix = malloc(sizeof(struct symbol_fix));
+
+	fix->sym = e->sym;
+	fix->type = type;
+
+	switch (type) {
+	case SF_BOOLEAN:
+		fix->tri = calculate_new_tri_val(e, diagnosis);
+		break;
+	case SF_NONBOOLEAN:
+		fix->nb_val = str_new();
+		str_append(&fix->nb_val, calculate_new_string_value(e, diagnosis));
+		break;
+	default:
+		perror("Illegal symbolfix_type.\n");
+	}
+
+	return fix;
+}
+
+/*
+ * remove symbols from the diagnosis, which will be set automatically:
+ * 1. symbol gets selected
+ * 2. choice symbol gets enabled/disabled automatically
+ * 3. symbol uses a default value
+ */
+static struct sfl_list *minimise_diagnoses(PicoSAT *pico, struct fexl_list *diagnoses,
+					   struct cfdata *data)
+{
+	clock_t start, end;
+	double time;
+	struct fexpr_list *d;
+	struct sfix_list *diagnosis_symbol;
+	struct sfl_list *diagnoses_symbol = sfl_list_init();
+	struct fexpr *e;
+	int satval, deref = 0;
+	struct symbol_fix *fix;
+	struct fexl_node *flnode;
+	struct fexpr_list *C;
+
+	printd("Minimising diagnoses...");
+
+	start = clock();
+
+	/* create soft constraint set C */
+	C = fexpr_list_init();
+	add_fexpr_to_constraint_set(C, data);
+
+	fexl_list_for_each(flnode, diagnoses) {
+		struct fexpr_node *fnode;
+		struct sfix_node *snode;
+		struct fexpr_list *C_without_d;
+		int res;
+
+		d = flnode->elem;
+
+		/* set assumptions for those symbols that don't need to be changed */
+		C_without_d = get_difference(C, d);
+		set_assumptions(pico, C_without_d, data);
+		fexpr_list_free(C_without_d);
+		fexpr_list_free(C);
+
+
+		/* flip the assumptions from the diagnosis */
+		fexpr_list_for_each(fnode, d) {
+			e = fnode->elem;
+			satval = e->assumption ? -(e->satval) : e->satval;
+			picosat_assume(pico, satval);
+		}
+
+		res = picosat_sat(pico, -1);
+		if (res != PICOSAT_SATISFIABLE)
+			perror("Diagnosis not satisfiable (minimise).");
+
+		diagnosis_symbol = convert_diagnosis(d, data);
+
+		/* check if symbol gets selected */
+		for (snode = diagnosis_symbol->head; snode != NULL;) {
+			fix = snode->elem;
+
+			/* symbol is never selected, continue */
+			if (!fix->sym->fexpr_sel_y) {
+				snode = snode->next;
+				continue;
+			}
+
+			/* check, whether the symbol was selected anyway */
+			if (fix->sym->type == S_BOOLEAN && fix->tri == yes)
+				deref = picosat_deref(pico, fix->sym->fexpr_sel_y->satval);
+			else if (fix->sym->type == S_TRISTATE && fix->tri == yes)
+				deref = picosat_deref(pico, fix->sym->fexpr_sel_y->satval);
+			else if (fix->sym->type == S_TRISTATE && fix->tri == mod)
+				deref = picosat_deref(pico, fix->sym->fexpr_sel_m->satval);
+
+			if (deref == 1) {
+				struct sfix_node *tmp = snode->next;
+
+				sfix_list_delete(diagnosis_symbol, snode);
+				snode = tmp;
+			} else {
+				deref = 0;
+				snode = snode->next;
+			}
+		}
+		sfl_list_add(diagnoses_symbol, diagnosis_symbol);
+	}
+
+	end = clock();
+	time = ((double) (end - start)) / CLOCKS_PER_SEC;
+
+	printd("done. (%.6f secs.)\n", time);
+
+	return diagnoses_symbol;
+}
+
+/*
+ * list the diagnoses and let user choose a diagnosis to be applied
+ */
+struct sfix_list *choose_fix(struct sfl_list *diag)
+{
+	int choice;
+	struct sfl_node *node;
+
+	printd("=== GENERATED DIAGNOSES ===\n");
+	printd("0: No changes wanted\n");
+	print_diagnoses_symbol(diag);
+
+	printd("\n> Choose option: ");
+	scanf("%d", &choice);
+
+	/* no changes wanted */
+	if (choice == 0)
+		return NULL;
+
+	/* invalid choice */
+	if (choice > diag->size)
+		return NULL;
+
+	node = diag->head;
+	for (int counter = 1; counter < choice; counter++)
+		node = node->next;
+
+	return node->elem;
+}
+
+
+/*
+ * calculate the new value for a boolean symbol given a diagnosis and an fexpr
+ */
+static tristate calculate_new_tri_val(struct fexpr *e, struct fexpr_list *diagnosis)
+{
+	assert(sym_is_boolean(e->sym));
+
+	/* return the opposite of the last assumption for booleans */
+	if (e->sym->type == S_BOOLEAN)
+		return e->assumption ? no : yes;
+
+	/* new values for tristate must be deduced from the diagnosis */
+	if (e->sym->type == S_TRISTATE) {
+		/* fexpr_y */
+		if (e->tri == yes) {
+			if (e->assumption == true)
+				/*
+				 * if diagnosis contains fexpr_m, fexpr_m was false
+				 * => new value is mod
+				 */
+				return diagnosis_contains_fexpr(
+						diagnosis, e->sym->fexpr_m) ? mod : no;
+			else if (e->assumption == false)
+				/*
+				 * if fexpr_y is set to true, the new value must be yes
+				 */
+				return yes;
+		}
+		/* fexpr_m */
+		if (e->tri == mod) {
+			if (e->assumption == true)
+				/*
+				 * if diagnosis contains fexpr_y, fexpr_y was false
+				 * => new value is yes
+				 */
+				return diagnosis_contains_fexpr(
+						diagnosis, e->sym->fexpr_m) ? yes : no;
+			else if (e->assumption == false)
+				/* if diagnosis contains fexpr_m, the new value must be mod */
+				return mod;
+		}
+		perror("Should not get here.\n");
+	}
+
+	perror("Error calculating new tristate value.\n");
+	return no;
+}
+
+/*
+ * calculate the new value for a non-boolean symbol given a diagnosis and an fexpr
+ */
+static const char *calculate_new_string_value(struct fexpr *e, struct fexpr_list *diagnosis)
+{
+	struct fexpr_node *node;
+	struct fexpr *e2;
+
+	assert(sym_is_nonboolean(e->sym));
+
+	/* if assumption was false before, this is the new value because only 1
+	 * variable can be true
+	 */
+	if (e->assumption == false)
+		return str_get(&e->nb_val);
+
+	/* a diagnosis always contains 2 variables for the same non-boolean symbol
+	 * one is set to true, the other to false
+	 * otherwise you'd set 2 variables to true, which is not allowed
+	 */
+	fexpr_list_for_each(node, diagnosis) {
+		e2 = node->elem;
+
+		/* not interested in other symbols or the same fexpr */
+		if (e->sym != e2->sym || e->satval == e2->satval)
+			continue;
+
+		return str_get(&e2->nb_val);
+	}
+
+	perror("Error calculating new string value.\n");
+	return "";
+}
diff --git a/scripts/kconfig/cf_rangefix.h b/scripts/kconfig/cf_rangefix.h
new file mode 100644
index 000000000000..3de0b7811487
--- /dev/null
+++ b/scripts/kconfig/cf_rangefix.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
+ */
+
+#ifndef CF_RANGEFIX_H
+#define CF_RANGEFIX_H
+
+#include "picosat.h"
+#include "cf_defs.h"
+
+/* initialize RangeFix and return the diagnoses */
+struct sfl_list *rangefix_run(PicoSAT *pico, struct cfdata *data);
+
+/* ask user which fix to apply */
+struct sfix_list *choose_fix(struct sfl_list *diag);
+
+/* print a single diagnosis of type symbol_fix */
+void print_diagnosis_symbol(struct sfix_list *diag_sym);
+
+#endif
-- 
2.39.2


