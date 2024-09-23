Return-Path: <linux-kbuild+bounces-3647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B939597D319
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 10:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3CE283659
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 08:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5A513D26B;
	Fri, 20 Sep 2024 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maxxaO90"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7813C67E;
	Fri, 20 Sep 2024 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822620; cv=none; b=k5e9zp6tT3YoS+hBwKj4zqYtiUQ2CxeLYT75nIFHj2bgoX4L36rJ5pzGYeYXzXlPOpiwMlJ8/pqFsWGxbszaSHg7z/Xr7rPIO87jXfKISBWTBVZnMK7Qx4H2TT6s/s3+n/VgEv/yjRFvzo91LFhBM2SSSy4NAlxSzdP1xTz/AbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822620; c=relaxed/simple;
	bh=xzj9jUA855fkRm4IgksvEN5/HnLXJWD79rWsY6qC9ZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I+sT6+ACxhLOU8WfBGFI1PmvcCmydX46wK9N0uoY6G2GRYETUk6SvHMbdubjJDHqLMzE8FN2Idqjrmbjb4UsfpU9/3hby5+PNF55YpDuZLIWq1Kjgq8UYUUCW1Ybw9b9/2mw00KCyEiE+wSbuFAdhWeTG6PyDVmqYqp1BlnETDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maxxaO90; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so232116566b.0;
        Fri, 20 Sep 2024 01:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726822616; x=1727427416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWSAJgWdyoGXz8bShklr1oHdXkEfUmBJsG7oXiT9t3c=;
        b=maxxaO90ZHn/+CPxyYovvg+r/Yro3ckfes1sVev6XVKRSM4VRl5k/OIqsDxHtWHTj1
         f8coEbSfP57Sp4pMWSwaifflOzptc/8oM9CAqjigijRgwqX7wcxl5gbFQ9mVvwbDfVO9
         NE+OS9lfvKqiZraut9E0D5fn0/L7arwphkJgKQvnTBjz5jzIWY6JRmRQ10Rgi/w90jZa
         M9BX7OSJpddNgs9Sj2dJLf94Sfms0zB1sIKjiy2aWdzA2GX2PDwKN1zyHi3clGG1dqO9
         WTZRvHAewMnuUIF2z3uG24e9jHrHgtM8txLx9P08KmoOYGnPQqg5WlQLEKa7IW2gyRcO
         Cjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726822616; x=1727427416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWSAJgWdyoGXz8bShklr1oHdXkEfUmBJsG7oXiT9t3c=;
        b=NEDC8rHIFn1gA4kxm9SvOwo+xhL3FRqFlDTnRTk8Zy2ahCow15SveFpZEy85RUeGao
         T8iwsH4u2RNl37eIqQlYMxBCMc4y84KXavNcwiZePid85p82FymxzpvynDRphOsrnjOe
         TgLuGcBDVGD5H/CcoHu6CchOaIIO2ob76OzPMT7ruKkg6imTUkWVcGS6AFtqmUrQUgu3
         qGYKlYzwhYF7WNm6J+PDpmFXxOsLgkJxd5ECKrB1xL0ZhVnjS4ONpOFpPKw8NuADTRmv
         +6S9lAs+GvU1z29pfuzPgpliWjDFwvGIUVN0L00DgG3F7lSqRJ5MUFdFLgyALQGdG/My
         YDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDPDhlImsajeH6TDPzltVgJV89qR8ufaWD1IWhqFbQAu9YClyXOFZUXlZKMX22XWi1s1MYYYg/AA8Jgkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRXYkuS/dPi4Cy1boK/K7n1V8XCCPYbKtviwt1BxxSynJDiS41
	hJ1vNWqrvfOa4/mwYk/qq4+7ipVpH4yi2yxLr/6WIlll7fI+6paJ2br4+Q==
X-Google-Smtp-Source: AGHT+IEpCDoTigFh5ipJF51oaFhRT1HerEdjMbVeKOxEC03wiH/jW8oXr/R8NUmte4bd4H8iA6WCFQ==
X-Received: by 2002:a17:906:794c:b0:a86:7199:af37 with SMTP id a640c23a62f3a-a90d51601d9mr188766066b.58.1726822615765;
        Fri, 20 Sep 2024 01:56:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:422c:48db:9094:2fa9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109637esm817861866b.40.2024.09.20.01.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:56:55 -0700 (PDT)
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
Subject: [PATCH v5 06/11] kconfig: Add files for RangeFix
Date: Fri, 20 Sep 2024 10:56:23 +0200
Message-Id: <20240920085628.51863-7-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920085628.51863-1-ole0811sch@gmail.com>
References: <20240920085628.51863-1-ole0811sch@gmail.com>
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
 scripts/kconfig/cf_rangefix.c | 1136 +++++++++++++++++++++++++++++++++
 scripts/kconfig/cf_rangefix.h |   21 +
 2 files changed, 1157 insertions(+)
 create mode 100644 scripts/kconfig/cf_rangefix.c
 create mode 100644 scripts/kconfig/cf_rangefix.h

diff --git a/scripts/kconfig/cf_rangefix.c b/scripts/kconfig/cf_rangefix.c
new file mode 100644
index 000000000000..4c710fcf56a9
--- /dev/null
+++ b/scripts/kconfig/cf_rangefix.c
@@ -0,0 +1,1136 @@
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
+#include <xalloc.h>
+
+#include "lkc.h"
+#include "cf_defs.h"
+#include "cf_expr.h"
+#include "list.h"
+#include "list_types.h"
+#include "cf_rangefix.h"
+#include "internal.h"
+#include "cf_utils.h"
+#include "cf_defs.h"
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
+static void add_fexpr_to_constraint_set(struct fexpr_list *C,
+					struct cfdata *data);
+static void set_assumptions(PicoSAT *pico, struct fexpr_list *c,
+			    struct cfdata *data);
+static void fexpr_add_assumption(PicoSAT *pico, struct fexpr *e, int satval);
+static struct fexpr_list *get_unsat_core_soft(PicoSAT *pico,
+					      struct cfdata *data);
+static void minimise_unsat_core(PicoSAT *pico, struct fexpr_list *C,
+				struct cfdata *data);
+
+static struct fexpr_list *get_difference(struct fexpr_list *C,
+					 struct fexpr_list *E0);
+static bool has_intersection(struct fexpr_list *e, struct fexpr_list *X);
+static struct fexpr_list *fexpr_list_union(struct fexpr_list *A,
+					   struct fexpr_list *B);
+static struct fexl_list *fexl_list_union(struct fexl_list *A,
+					 struct fexl_list *B);
+static bool is_subset_of(struct fexpr_list *A, struct fexpr_list *B);
+static void print_unsat_core(struct fexpr_list *list);
+static bool diagnosis_contains_fexpr(struct fexpr_list *diagnosis,
+				     struct fexpr *e);
+static bool diagnosis_contains_symbol(struct sfix_list *diagnosis,
+				      struct symbol *sym);
+
+static void print_diagnoses(struct fexl_list *diag);
+static void print_diagnoses_symbol(struct sfl_list *diag_sym);
+
+static struct sfl_list *convert_diagnoses(struct fexl_list *diagnoses,
+					  struct cfdata *data);
+static struct sfix_list *convert_diagnosis(struct fexpr_list *diagnosis,
+					   struct cfdata *data);
+static struct symbol_fix *symbol_fix_create(struct fexpr *e,
+					    enum symbolfix_type type,
+					    struct fexpr_list *diagnosis);
+static struct sfl_list *minimise_diagnoses(PicoSAT *pico,
+					   struct fexl_list *diagnoses,
+					   struct cfdata *data);
+
+static tristate calculate_new_tri_val(struct fexpr *e,
+				      struct fexpr_list *diagnosis);
+static const char *calculate_new_string_value(struct fexpr *e,
+					      struct fexpr_list *diagnosis);
+static bool fexpr_list_has_length_1(struct fexpr_list *list);
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
+	CF_LIST_FOR_EACH(node, diagnoses, fexl)
+		CF_LIST_FREE(node->elem, fexpr);
+	CF_LIST_FREE(diagnoses, fexl);
+
+	return diagnoses_symbol;
+}
+
+/*
+ * generate the diagnoses
+ */
+static struct fexl_list *generate_diagnoses(PicoSAT *pico, struct cfdata *data)
+{
+	CF_DEF_LIST(C, fexpr);
+	CF_DEF_LIST(empty_diagnosis, fexpr);
+	CF_DEF_LIST(E, fexl);
+	CF_DEF_LIST(R, fexl);
+	size_t num_diagnoses = 0;
+	struct fexpr_list *X, *e, *E2;
+	struct fexl_list *E_R_Union;
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
+	CF_PUSH_BACK(E, empty_diagnosis, fexl);
+
+	/* start the clock */
+	start_t = clock();
+
+	while (!list_empty(&E->list)) {
+		/* get random diagnosis */
+		struct fexl_node *E0_node =
+			list_first_entry(&E->list, struct fexl_node, node);
+		struct fexpr_list *E0 = E0_node->elem;
+
+		/* calculate C\E0 */
+		struct fexpr_list *c = get_difference(C, E0);
+
+		struct fexl_node *node, *next;
+		int res;
+
+		/* set assumptions */
+		nr_of_assumptions = 0;
+		nr_of_assumptions_true = 0;
+		set_assumptions(pico, c, data);
+		CF_LIST_FREE(c, fexpr);
+
+		res = picosat_sat(pico, -1);
+
+		if (res == PICOSAT_SATISFIABLE) {
+			if (PRINT_DIAGNOSIS_FOUND && CFDEBUG)
+				fexpr_list_print("DIAGNOSIS FOUND", E0);
+
+			list_del(&E0_node->node);
+			if (!list_empty(&E0->list)) {
+				CF_PUSH_BACK(R, E0, fexl);
+				++num_diagnoses;
+			} else
+				CF_LIST_FREE(E0, fexpr);
+
+			if (num_diagnoses >= MAX_DIAGNOSES)
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
+		list_for_each_entry_safe(node, next, &E->list, node) {
+			struct fexpr_node *fnode;
+
+			/* get partial diagnosis */
+			e = node->elem;
+
+			/* check, if there is an intersection between e and X
+			 * if there is, go to the next partial diagnosis
+			 */
+			if (has_intersection(e, X))
+				continue;
+
+			/* for each fexpr in the core */
+			CF_LIST_FOR_EACH(fnode, X, fexpr) {
+				struct fexpr *x = fnode->elem;
+				bool E2_subset_of_E1;
+				struct fexl_node *lnode;
+				CF_DEF_LIST(E_without_e, fexl);
+				CF_DEF_LIST(x_set, fexpr);
+				struct fexpr_list *E1;
+
+				/* create {x} */
+				CF_PUSH_BACK(x_set, x, fexpr);
+
+				/* create E' = e U {x} */
+				E1 = fexpr_list_union(e, x_set);
+
+				/* create (E\e) U R */
+				CF_LIST_FOR_EACH(lnode, E, fexl) {
+					if (lnode->elem == e)
+						continue;
+					CF_PUSH_BACK(E_without_e,
+							lnode->elem, fexl);
+				}
+				E_R_Union = fexl_list_union(E_without_e, R);
+
+				E2_subset_of_E1 = false;
+
+				/* E" in (E\e) U R */
+				CF_LIST_FOR_EACH(lnode, E_R_Union, fexl) {
+					E2 = lnode->elem;
+
+					/* E" subset of E' ? */
+					if (is_subset_of(E2, E1)) {
+						E2_subset_of_E1 = true;
+						break;
+					}
+				}
+
+				CF_LIST_FREE(E_without_e, fexl);
+				CF_LIST_FREE(E_R_Union, fexl);
+				CF_LIST_FREE(x_set, fexpr);
+
+				/* there exists no E" that is a subset of E' */
+				if (!E2_subset_of_E1)
+					CF_PUSH_BACK(E, E1, fexl);
+				else
+					CF_LIST_FREE(E1, fexpr);
+			}
+
+			CF_LIST_FREE(e, fexpr);
+
+			list_del(&node->node);
+		}
+		CF_LIST_FREE(X, fexpr);
+	}
+
+	struct fexl_node *node;
+DIAGNOSES_FOUND:
+	CF_LIST_FREE(C, fexpr);
+	CF_LIST_FOR_EACH(node, E, fexl)
+		CF_LIST_FREE(node->elem, fexpr);
+	CF_LIST_FREE(E, fexl);
+
+	return R;
+}
+
+/*
+ * add the fexpr to the constraint set C
+ */
+static void add_fexpr_to_constraint_set(struct fexpr_list *C,
+					struct cfdata *data)
+{
+	struct symbol *sym;
+
+	for_all_symbols(sym) {
+		/* must be a proper symbol */
+		if (sym->type == S_UNKNOWN)
+			continue;
+
+		/*
+		 * don't need the conflict symbols they are handled separately
+		 */
+		if (sym_is_sdv(data->sdv_symbols, sym))
+			continue;
+
+		/* must have a prompt and a name */
+		if (!sym->name || !sym_has_prompt(sym))
+			continue;
+
+		if (sym->type == S_BOOLEAN)
+			CF_PUSH_BACK(C, sym->fexpr_y, fexpr);
+		else if (sym->type == S_TRISTATE) {
+			CF_PUSH_BACK(C, sym->fexpr_y, fexpr);
+			CF_PUSH_BACK(C, sym->fexpr_m, fexpr);
+		} else if (sym->type == S_INT || sym->type == S_HEX ||
+			   sym->type == S_STRING) {
+			struct fexpr_node *node;
+
+			CF_LIST_FOR_EACH(node, sym->nb_vals, fexpr)
+				CF_PUSH_BACK(C, node->elem, fexpr);
+		} else {
+			perror("Error adding variables to constraint set C.");
+		}
+	}
+}
+
+/*
+ * check whether the fexpr symbolises the no-value-set fexpr for a non-boolean
+ * symbol
+ */
+static bool fexpr_is_novalue(struct fexpr *e)
+{
+	if (!sym_is_nonboolean(e->sym))
+		return false;
+
+	return e ==
+	       list_first_entry(&e->sym->nb_vals->list, struct fexpr_node, node)
+		       ->elem;
+}
+
+static void set_assumptions_sdv(PicoSAT *pico, struct sdv_list *arr)
+{
+	struct symbol_dvalue *sdv;
+	struct sdv_node *node;
+	struct symbol *sym;
+
+	CF_LIST_FOR_EACH(node, arr, sdv) {
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
+static void set_assumptions(PicoSAT *pico, struct fexpr_list *c,
+			    struct cfdata *data)
+{
+	struct fexpr_node *node;
+
+	CF_LIST_FOR_EACH(node, c, fexpr)
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
+static struct fexpr_list *get_unsat_core_soft(PicoSAT *pico,
+					      struct cfdata *data)
+{
+	CF_DEF_LIST(ret, fexpr);
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
+			CF_PUSH_BACK(ret, e, fexpr);
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
+static void minimise_unsat_core(PicoSAT *pico, struct fexpr_list *C,
+				struct cfdata *data)
+{
+	struct fexpr_node *node, *tmp;
+
+	/* no need to check further */
+	if (fexpr_list_has_length_1(C))
+		return;
+
+	list_for_each_entry_safe(node, tmp, &C->list, node) {
+		CF_DEF_LIST(c_set, fexpr);
+		struct fexpr_list *t;
+		int res;
+
+		if (fexpr_list_has_length_1(C))
+			return;
+
+		/* create C\c */
+		CF_PUSH_BACK(c_set, node->elem, fexpr);
+		t = get_difference(C, c_set);
+
+		/* invoke PicoSAT */
+		set_assumptions(pico, t, data);
+
+		res = picosat_sat(pico, -1);
+
+		if (res == PICOSAT_UNSATISFIABLE) {
+			list_del(&node->node);
+			free(node);
+		}
+
+		CF_LIST_FREE(c_set, fexpr);
+		CF_LIST_FREE(t, fexpr);
+	}
+}
+
+
+/*
+ * Calculate C\E0
+ */
+static struct fexpr_list *get_difference(struct fexpr_list *C,
+					 struct fexpr_list *E0)
+{
+	CF_DEF_LIST(ret, fexpr);
+	struct fexpr_node *node1, *node2;
+
+	CF_LIST_FOR_EACH(node1, C, fexpr) {
+		bool found = false;
+
+		CF_LIST_FOR_EACH(node2, E0, fexpr) {
+			if (node1->elem->satval == node2->elem->satval) {
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			CF_PUSH_BACK(ret, node1->elem, fexpr);
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
+	CF_LIST_FOR_EACH(node1, e, fexpr)
+		CF_LIST_FOR_EACH(node2, X, fexpr)
+			if (node1->elem->satval == node2->elem->satval)
+				return true;
+
+	return false;
+}
+
+/*
+ * get the union of 2 fexpr_list
+ */
+static struct fexpr_list *fexpr_list_union(struct fexpr_list *A,
+					   struct fexpr_list *B)
+{
+	struct fexpr_list *ret = CF_LIST_COPY(A, fexpr);
+	struct fexpr_node *node1, *node2;
+	bool found;
+
+	CF_LIST_FOR_EACH(node2, B, fexpr) {
+		found = false;
+		CF_LIST_FOR_EACH(node1, A, fexpr) {
+			if (node2->elem->satval == node1->elem->satval) {
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			CF_PUSH_BACK(ret, node2->elem, fexpr);
+	}
+
+	return ret;
+}
+
+/*
+ * get the union of 2 fexl_list
+ */
+static struct fexl_list *fexl_list_union(struct fexl_list *A,
+					 struct fexl_list *B)
+{
+	struct fexl_list *ret = CF_LIST_COPY(A, fexl);
+	struct fexl_node *node1, *node2;
+	bool found;
+
+	CF_LIST_FOR_EACH(node2, B, fexl) {
+		found = false;
+		CF_LIST_FOR_EACH(node1, A, fexl) {
+			if (node2->elem == node1->elem) {
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			CF_PUSH_BACK(ret, node2->elem, fexl);
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
+	CF_LIST_FOR_EACH(node1, A, fexpr) {
+		found = false;
+		CF_LIST_FOR_EACH(node2, B, fexpr) {
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
+	bool first = true;
+
+	printd("Unsat core: [");
+
+	CF_LIST_FOR_EACH(node, list, fexpr) {
+		if (first)
+			first = false;
+		else
+			printd(", ");
+		printd("%s", str_get(&node->elem->name));
+		printd(" <%s>", node->elem->assumption == true ? "T" : "F");
+	}
+
+	printd("]\n");
+}
+
+
+/*
+ * check if a diagnosis contains a fexpr
+ */
+static bool diagnosis_contains_fexpr(struct fexpr_list *diagnosis,
+				     struct fexpr *e)
+{
+	struct fexpr_node *node;
+
+	CF_LIST_FOR_EACH(node, diagnosis, fexpr)
+		if (node->elem->satval == e->satval)
+			return true;
+
+	return false;
+}
+
+/*
+ * check if a diagnosis contains a symbol
+ */
+static bool diagnosis_contains_symbol(struct sfix_list *diagnosis,
+				      struct symbol *sym)
+{
+	struct sfix_node *node;
+
+	CF_LIST_FOR_EACH(node, diagnosis, sfix)
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
+	CF_LIST_FOR_EACH(lnode, diag, fexl) {
+		struct fexpr_node *node;
+		bool first = true;
+
+		printd("%d: [", i++);
+		CF_LIST_FOR_EACH(node, lnode->elem, fexpr) {
+			char *new_val = node->elem->assumption ? "false" :
+								 "true";
+
+			if (first)
+				first = false;
+			else
+				printd(", ");
+			printd("%s => %s", str_get(&node->elem->name), new_val);
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
+	CF_LIST_FOR_EACH(node, diag_sym, sfix) {
+		fix = node->elem;
+
+		if (fix->type == SF_BOOLEAN)
+			printd("%s => %s", fix->sym->name,
+			       tristate_get_char(fix->tri));
+		else if (fix->type == SF_NONBOOLEAN)
+			printd("%s => %s", fix->sym->name,
+			       str_get(&fix->nb_val));
+		else
+			perror("NB not yet implemented.");
+
+		if (node->node.next != &diag_sym->list)
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
+	CF_LIST_FOR_EACH(arr, diag_sym, sfl) {
+		printd("%d: ", i++);
+		print_diagnosis_symbol(arr->elem);
+	}
+}
+
+/*
+ * convert a single diagnosis of fexpr into a diagnosis of symbols
+ */
+static struct sfix_list *convert_diagnosis(struct fexpr_list *diagnosis,
+					   struct cfdata *data)
+{
+	CF_DEF_LIST(diagnosis_symbol, sfix);
+	struct fexpr *e;
+	struct symbol_fix *fix;
+	struct symbol_dvalue *sdv;
+	struct sdv_node *snode;
+	struct fexpr_node *fnode;
+
+	/* set the values for the conflict symbols */
+	CF_LIST_FOR_EACH(snode, data->sdv_symbols, sdv) {
+		sdv = snode->elem;
+		fix = xmalloc(sizeof(*fix));
+		fix->sym = sdv->sym;
+		fix->type = SF_BOOLEAN;
+		fix->tri = sdv->tri;
+		CF_PUSH_BACK(diagnosis_symbol, fix, sfix);
+	}
+
+	CF_LIST_FOR_EACH(fnode, diagnosis, fexpr) {
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
+		CF_PUSH_BACK(diagnosis_symbol, fix, sfix);
+	}
+
+	return diagnosis_symbol;
+}
+
+/*
+ * convert the diagnoses of fexpr into diagnoses of symbols
+ * it is easier to handle symbols when applying fixes
+ */
+static struct sfl_list *convert_diagnoses(struct fexl_list *diag_arr,
+					  struct cfdata *data)
+{
+	struct fexl_node *lnode;
+
+	diagnoses_symbol = CF_LIST_INIT(sfl);
+
+	CF_LIST_FOR_EACH(lnode, diag_arr, fexl) {
+		struct sfix_list *fix = convert_diagnosis(lnode->elem, data);
+
+		CF_PUSH_BACK(diagnoses_symbol, fix, sfl);
+	}
+
+	return diagnoses_symbol;
+}
+
+/*
+ * create a symbol_fix given a fexpr
+ */
+static struct symbol_fix *symbol_fix_create(struct fexpr *e,
+					    enum symbolfix_type type,
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
+		str_append(&fix->nb_val,
+			   calculate_new_string_value(e, diagnosis));
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
+static struct sfl_list *minimise_diagnoses(PicoSAT *pico,
+					   struct fexl_list *diagnoses,
+					   struct cfdata *data)
+{
+	clock_t start, end;
+	double time;
+	struct fexpr_list *d;
+	struct sfix_list *diagnosis_symbol;
+	CF_DEF_LIST(diagnoses_symbol, sfl);
+	struct fexpr *e;
+	int satval, deref = 0;
+	struct symbol_fix *fix;
+	struct fexl_node *flnode;
+	CF_DEF_LIST(C, fexpr);
+
+	printd("Minimising diagnoses...");
+
+	start = clock();
+
+	/* create soft constraint set C */
+	add_fexpr_to_constraint_set(C, data);
+
+	CF_LIST_FOR_EACH(flnode, diagnoses, fexl) {
+		struct fexpr_node *fnode;
+		struct sfix_node *snode, *snext;
+		struct fexpr_list *C_without_d;
+		int res;
+
+		d = flnode->elem;
+
+		/*
+		 * set assumptions for those symbols that don't need to be
+		 * changed
+		 */
+		C_without_d = get_difference(C, d);
+		set_assumptions(pico, C_without_d, data);
+		CF_LIST_FREE(C_without_d, fexpr);
+		CF_LIST_FREE(C, fexpr);
+
+
+		/* flip the assumptions from the diagnosis */
+		CF_LIST_FOR_EACH(fnode, d, fexpr) {
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
+		list_for_each_entry_safe(snode, snext, &diagnosis_symbol->list,
+					 node) {
+			fix = snode->elem;
+
+			/* symbol is never selected, continue */
+			if (!fix->sym->fexpr_sel_y)
+				continue;
+
+			/* check, whether the symbol was selected anyway */
+			if (fix->sym->type == S_BOOLEAN && fix->tri == yes)
+				deref = picosat_deref(
+					pico, fix->sym->fexpr_sel_y->satval);
+			else if (fix->sym->type == S_TRISTATE &&
+				 fix->tri == yes)
+				deref = picosat_deref(
+					pico, fix->sym->fexpr_sel_y->satval);
+			else if (fix->sym->type == S_TRISTATE &&
+				 fix->tri == mod)
+				deref = picosat_deref(
+					pico, fix->sym->fexpr_sel_m->satval);
+
+			if (deref == 1)
+				list_del(&snode->node);
+			else
+				deref = 0;
+		}
+		CF_PUSH_BACK(diagnoses_symbol, diagnosis_symbol, sfl);
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
+struct sfix_list *ask_user_choose_fix(struct sfl_list *diag)
+{
+	int choice;
+	struct sfl_node *ret;
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
+	ret = list_at_index(choice - 1, &diag->list, struct sfl_node, node);
+	return ret ? ret->elem : NULL;
+}
+
+
+/*
+ * calculate the new value for a boolean symbol given a diagnosis and an fexpr
+ */
+static tristate calculate_new_tri_val(struct fexpr *e,
+				      struct fexpr_list *diagnosis)
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
+				 * if diagnosis contains fexpr_m, fexpr_m was
+				 * false => new value is mod
+				 */
+				return diagnosis_contains_fexpr(
+					       diagnosis, e->sym->fexpr_m) ?
+					       mod :
+					       no;
+			else if (e->assumption == false)
+				/*
+				 * if fexpr_y is set to true, the new value
+				 * must be yes
+				 */
+				return yes;
+		}
+		/* fexpr_m */
+		if (e->tri == mod) {
+			if (e->assumption == true)
+				/*
+				 * if diagnosis contains fexpr_y, fexpr_y was
+				 * false => new value is yes
+				 */
+				return diagnosis_contains_fexpr(
+					       diagnosis, e->sym->fexpr_m) ?
+					       yes :
+					       no;
+			else if (e->assumption == false)
+				/*
+				 * if diagnosis contains fexpr_m, the new value
+				 * must be mod
+				 */
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
+ * calculate the new value for a non-boolean symbol given a diagnosis and an
+ * fexpr
+ */
+static const char *calculate_new_string_value(struct fexpr *e,
+					      struct fexpr_list *diagnosis)
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
+	/* a diagnosis always contains 2 variables for the same non-boolean
+	 * symbol one is set to true, the other to false
+	 * otherwise you'd set 2 variables to true, which is not allowed
+	 */
+	CF_LIST_FOR_EACH(node, diagnosis, fexpr) {
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
+
+static bool fexpr_list_has_length_1(struct fexpr_list *list)
+{
+	struct fexpr_node *node;
+	bool first = true;
+
+	CF_LIST_FOR_EACH(node, list, fexpr) {
+		if (first)
+			first = false;
+		else
+			return false;
+	}
+	return true;
+}
diff --git a/scripts/kconfig/cf_rangefix.h b/scripts/kconfig/cf_rangefix.h
new file mode 100644
index 000000000000..aab3f52172e3
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
+#include "picosat_functions.h"
+#include "cf_defs.h"
+
+/* initialize RangeFix and return the diagnoses */
+struct sfl_list *rangefix_run(PicoSAT *pico, struct cfdata *data);
+
+/* ask user which fix to apply */
+struct sfix_list *ask_user_choose_fix(struct sfl_list *diag);
+
+/* print a single diagnosis of type symbol_fix */
+void print_diagnosis_symbol(struct sfix_list *diag_sym);
+
+#endif
-- 
2.39.2


