Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27066434825
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 11:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhJTJsG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 05:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhJTJsF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 05:48:05 -0400
Received: from out3.mail.ruhr-uni-bochum.de (out3.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:8:1001::8693:359b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D64C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 02:45:51 -0700 (PDT)
Received: from mx3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out3.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HZ5Mf0dykz8SB1;
        Wed, 20 Oct 2021 11:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634723150; bh=5SQfu9IzddQVcJkR9bXghCWcsgSu/q0P9JH0yd2ui/Y=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=pDUf/gS3LuGzTD/tEs1Gq+MjLCFPQQbaOCh+ZZuvzmGyFZfE+m5Zy/WueKLKXLAIe
         F+U72GTCxMf5XHIZxzxTnarfRDBilvka6BlhH3P5ZVAwEKFVtSMXLeoX8u80quUQv4
         decA+20GtkVfGLXcGlC7lXAxxQ3GEx6ggULck+BY=
Received: from out3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx3.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HZ5Md6vXSz8S9w;
        Wed, 20 Oct 2021 11:45:49 +0200 (CEST)
X-Envelope-Sender: <thorsten.berger@rub.de>
X-RUB-Notes: Internal origin=134.147.42.236
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [134.147.42.236])
        by out3.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HZ5Md5J2sz8S7h;
        Wed, 20 Oct 2021 11:45:49 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx3.mail.ruhr-uni-bochum.de
Received: from [192.168.188.22] (unknown [5.63.49.65])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HZ5Md2b5qzDgys;
        Wed, 20 Oct 2021 11:45:49 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <492928ed-2c67-de0c-7f22-996795bf9cb3@rub.de>
Date:   Wed, 20 Oct 2021 11:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [RFC 09/12] Add files with utility functions
Content-Language: en-US
From:   Thorsten Berger <thorsten.berger@rub.de>
To:     linux-kbuild@vger.kernel.org
Cc:     "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <c2b36549-5c9e-2314-bc68-b81b7c77a561@rub.de>
In-Reply-To: <c2b36549-5c9e-2314-bc68-b81b7c77a561@rub.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Co-developed-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Patrick Franz <deltaone@debian.org>
Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
Suggested-by: Sarah Nadi <nadi@ualberta.ca>
Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>

---
 scripts/kconfig/cf_satutils.c | 536 ++++++++++++++++++++++++++++++++++
 scripts/kconfig/cf_satutils.h |  30 ++
 scripts/kconfig/cf_utils.c    | 510 ++++++++++++++++++++++++++++++++
 scripts/kconfig/cf_utils.h    |  90 ++++++
 4 files changed, 1166 insertions(+)
 create mode 100644 scripts/kconfig/cf_satutils.c
 create mode 100644 scripts/kconfig/cf_satutils.h
 create mode 100644 scripts/kconfig/cf_utils.c
 create mode 100644 scripts/kconfig/cf_utils.h

diff --git a/scripts/kconfig/cf_satutils.c b/scripts/kconfig/cf_satutils.c
new file mode 100644
index 000000000000..84d8c46ad686
--- /dev/null
+++ b/scripts/kconfig/cf_satutils.c
@@ -0,0 +1,536 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Patrick Franz <deltaone@debian.org>
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
+
+static void unfold_cnf_clause(struct pexpr *e);
+static void build_cnf_tseytin(struct pexpr *e);
+
+static void build_cnf_tseytin_top_and(struct pexpr *e);
+static void build_cnf_tseytin_top_or(struct pexpr *e);
+
+static void build_cnf_tseytin_tmp(struct pexpr *e, struct fexpr *t);
+static void build_cnf_tseytin_and(struct pexpr *e, struct fexpr *t);
+static void build_cnf_tseytin_or(struct pexpr *e, struct fexpr *t);
+static int pexpr_satval(struct pexpr *e);
+
+static PicoSAT *pico;
+
+/* -------------------------------------- */
+
+/*
+ * initialize PicoSAT
+ */
+PicoSAT * initialize_picosat(void)
+{
+    printd("\nInitializing PicoSAT...");
+    PicoSAT *pico = picosat_init();
+    picosat_enable_trace_generation(pico);
+    printd("done.\n");
+
+    return pico;
+}
+
+/*
+ * construct the CNF-clauses from the constraints
+ */
+void construct_cnf_clauses(PicoSAT *p)
+{
+    pico = p;
+    unsigned int i;
+    struct symbol *sym;
+
+    /* adding unit-clauses for constants */
+    sat_add_clause(2, pico, -(const_false->satval));
+    sat_add_clause(2, pico, const_true->satval);
+
+    for_all_symbols(i, sym) {
+        if (sym->type == S_UNKNOWN)
+            continue;
+
+        struct pexpr_node *node;
+        pexpr_list_for_each(node, sym->constraints) {
+            if (pexpr_is_cnf(node->elem))
+                unfold_cnf_clause(node->elem);
+            else
+                build_cnf_tseytin(node->elem);
+        }
+    }
+}
+
+/*
+ * helper function to add an expression to a CNF-clause
+ */
+static void unfold_cnf_clause_util(struct pexpr *e)
+{
+    switch (e->type) {
+    case PE_SYMBOL:
+        picosat_add(pico, e->left.fexpr->satval);
+        break;
+    case PE_OR:
+        unfold_cnf_clause_util(e->left.pexpr);
+        unfold_cnf_clause_util(e->right.pexpr);
+        break;
+    case PE_NOT:
+        picosat_add(pico, -(e->left.pexpr->left.fexpr->satval));
+        break;
+    default:
+        perror("Not in CNF, FE_EQUALS.");
+    }
+}
+
+/*
+ * extract the variables from a pexpr in CNF
+ */
+static void unfold_cnf_clause(struct pexpr *e)
+{
+    if (!pexpr_is_cnf(e))
+        return;
+
+    unfold_cnf_clause_util(e);
+
+    picosat_add(pico, 0);
+}
+
+/*
+ * build CNF-clauses for a pexpr not in CNF
+ */
+static void build_cnf_tseytin(struct pexpr *e)
+{
+    switch (e->type) {
+    case PE_AND:
+        build_cnf_tseytin_top_and(e);
+        break;
+    case PE_OR:
+        build_cnf_tseytin_top_or(e);
+        break;
+    default:
+        perror("Expression not a propositional logic formula. root.");
+    }
+}
+
+/*
+ * split up a pexpr of type AND as both sides must be satisfied
+ */
+static void build_cnf_tseytin_top_and(struct pexpr *e)
+{
+    if (pexpr_is_cnf(e->left.pexpr))
+        unfold_cnf_clause(e->left.pexpr);
+    else
+        build_cnf_tseytin(e->left.pexpr);
+
+    if (pexpr_is_cnf(e->right.pexpr))
+        unfold_cnf_clause(e->right.pexpr);
+    else
+        build_cnf_tseytin(e->right.pexpr);
+
+}
+
+static void build_cnf_tseytin_top_or(struct pexpr *e)
+{
+    struct fexpr *t1 = NULL, *t2 = NULL;
+    int a, b;
+
+    /* set left side */
+    if (pexpr_is_symbol(e->left.pexpr)) {
+        a = pexpr_satval(e->left.pexpr);
+    } else {
+        t1 = create_tmpsatvar();
+        a = t1->satval;
+    }
+
+    /* set right side */
+    if (pexpr_is_symbol(e->right.pexpr)) {
+        b = pexpr_satval(e->right.pexpr);
+    } else {
+        t2 = create_tmpsatvar();
+        b = t2->satval;
+    }
+
+    /* A v B */
+    sat_add_clause(3, pico, a, b);
+
+    /* traverse down the tree to build more constraints if needed */
+    if (!pexpr_is_symbol(e->left.pexpr)) {
+        if (t1 == NULL)
+            perror("t1 is NULL.");
+
+        build_cnf_tseytin_tmp(e->left.pexpr, t1);
+
+    }
+
+    if (!pexpr_is_symbol(e->right.pexpr)) {
+        if (t2 == NULL)
+            perror("t2 is NULL.");
+
+        build_cnf_tseytin_tmp(e->right.pexpr, t2);
+    }
+}
+
+/*
+ * build the sub-expressions
+ */
+static void build_cnf_tseytin_tmp(struct pexpr *e, struct fexpr *t)
+{
+    switch (e->type) {
+    case PE_AND:
+        build_cnf_tseytin_and(e, t);
+        break;
+    case PE_OR:
+        build_cnf_tseytin_or(e, t);
+        break;
+    default:
+        perror("Expression not a propositional logic formula. root.");
+    }
+}
+
+/*
+ * build the Tseytin sub-expressions for a pexpr of type AND
+ */
+static void build_cnf_tseytin_and(struct pexpr *e, struct fexpr *t)
+{
+    struct fexpr *t1 = NULL, *t2 = NULL;
+    int a, b, c;
+
+    /* set left side */
+    if (pexpr_is_symbol(e->left.pexpr)) {
+        a = pexpr_satval(e->left.pexpr);
+    } else {
+        t1 = create_tmpsatvar();
+        a = t1->satval;
+    }
+
+    /* set right side */
+    if (pexpr_is_symbol(e->right.pexpr)) {
+        b = pexpr_satval(e->right.pexpr);
+    } else {
+        t2 = create_tmpsatvar();
+        b = t2->satval;
+    }
+
+    c = t->satval;
+
+    /* -A v -B v C */
+    sat_add_clause(4, pico, -a, -b, c);
+    /* A v -C */
+    sat_add_clause(3, pico, a, -c);
+    /* B v -C */
+    sat_add_clause(3, pico, b, -c);
+
+    /* traverse down the tree to build more constraints if needed */
+    if (!pexpr_is_symbol(e->left.pexpr)) {
+        if (t1 == NULL)
+            perror("t1 is NULL.");
+
+        build_cnf_tseytin_tmp(e->left.pexpr, t1);
+    }
+    if (!pexpr_is_symbol(e->right.pexpr)) {
+        if (t2 == NULL)
+            perror("t2 is NULL.");
+
+        build_cnf_tseytin_tmp(e->right.pexpr, t2);
+    }
+}
+
+/*
+ * build the Tseytin sub-expressions for a pexpr of type
+ */
+static void build_cnf_tseytin_or(struct pexpr *e, struct fexpr *t)
+{
+    struct fexpr *t1 = NULL, *t2 = NULL;
+    int a, b, c;
+
+    /* set left side */
+    if (pexpr_is_symbol(e->left.pexpr)) {
+        a = pexpr_satval(e->left.pexpr);
+    } else {
+        t1 = create_tmpsatvar();
+        a = t1->satval;
+    }
+
+    /* set right side */
+    if (pexpr_is_symbol(e->right.pexpr)) {
+        b = pexpr_satval(e->right.pexpr);
+    } else {
+        t2 = create_tmpsatvar();
+        b = t2->satval;
+    }
+
+    c = t->satval;
+
+    /* A v B v -C */
+    sat_add_clause(4, pico, a, b, -c);
+    /* -A v C */;
+    sat_add_clause(3, pico, -a, c);
+    /* -B v C */
+    sat_add_clause(3, pico, -b, c);
+
+    /* traverse down the tree to build more constraints if needed */
+    if (!pexpr_is_symbol(e->left.pexpr)) {
+        if (t1 == NULL)
+            perror("t1 is NULL.");
+
+        build_cnf_tseytin_tmp(e->left.pexpr, t1);
+    }
+    if (!pexpr_is_symbol(e->right.pexpr)) {
+        if (t2 == NULL)
+            perror("t2 is NULL.");
+        build_cnf_tseytin_tmp(e->right.pexpr, t2);
+    }
+}
+
+/*
+ * add a clause to PicoSAT
+ * First argument must be the SAT solver
+ */
+void sat_add_clause(int num, ...)
+{
+    if (num <= 1)
+        return;
+
+    va_list valist;
+    int i, *lit;
+    PicoSAT *pico;
+
+
+    va_start(valist, num);
+
+    pico = va_arg(valist, PicoSAT *);
+
+    /* access all the arguments assigned to valist */
+    for (i = 1; i < num; i++) {
+        lit = xmalloc(sizeof(int));
+        *lit = va_arg(valist, int);
+        picosat_add(pico, *lit);
+    }
+    picosat_add(pico, 0);
+
+    va_end(valist);
+}
+
+/*
+ * return the SAT-variable for a pexpr that is a symbol
+ */
+static int pexpr_satval(struct pexpr *e)
+{
+    if (!pexpr_is_symbol(e)) {
+        perror("pexpr is not a symbol.");
+        return -1;
+    }
+
+    switch (e->type) {
+    case PE_SYMBOL:
+        return e->left.fexpr->satval;
+    case PE_NOT:
+        return -(e->left.pexpr->left.fexpr->satval);
+    default:
+        perror("Not a symbol.");
+    }
+
+    return -1;
+}
+
+/*
+ * start PicoSAT
+ */
+void picosat_solve(PicoSAT *pico)
+{
+    printd("Solving SAT-problem...");
+
+    clock_t start, end;
+    double time;
+    start = clock();
+
+    int res = picosat_sat(pico, -1);
+
+    end = clock();
+    time = ((double) (end - start)) / CLOCKS_PER_SEC;
+    printd("done. (%.6f secs.)\n\n", time);
+
+    if (res == PICOSAT_SATISFIABLE) {
+        printd("===> PROBLEM IS SATISFIABLE <===\n");
+
+    } else if (res == PICOSAT_UNSATISFIABLE) {
+        printd("===> PROBLEM IS UNSATISFIABLE <===\n");
+
+        /* print unsat core */
+        printd("\nPrinting unsatisfiable core:\n");
+        struct fexpr *e;
+
+        int *lit = malloc(sizeof(int));
+        const int *i = picosat_failed_assumptions(pico);
+        *lit = abs(*i++);
+
+        while (*lit != 0) {
+            e = &satmap[*lit];
+
+            printd("(%d) %s <%d>\n", *lit, str_get(&e->name), e->assumption);
+            *lit = abs(*i++);
+        }
+    }
+    else {
+        printd("Unknown if satisfiable.\n");
+    }
+}
+
+/*
+ * add assumption for a symbol to the SAT-solver
+ */
+void sym_add_assumption(PicoSAT *pico, struct symbol *sym)
+{
+    if (sym_is_boolean(sym)) {
+        int tri_val = sym_get_tristate_value(sym);
+        sym_add_assumption_tri(pico, sym, tri_val);
+        return;
+    }
+
+    if (sym_is_nonboolean(sym)) {
+        struct fexpr *e = sym->nb_vals->head->elem;
+
+        struct fexpr_node *node;
+
+        const char *string_val = sym_get_string_value(sym);
+
+        if (sym->type == S_STRING && !strcmp(string_val, ""))
+            return;
+
+        /* symbol does not have a value */
+        if (!sym_nonbool_has_value_set(sym)) {
+
+            /* set value for sym=n */
+            picosat_assume(pico, e->satval);
+            e->assumption = true;
+
+            struct fexpr_node *node;
+            for (node = sym->nb_vals->head->next; node != NULL; node = node->next) {
+                picosat_assume(pico, -(node->elem->satval));
+                node->elem->assumption = false;
+            }
+
+            return;
+        }
+
+        /* symbol does have a value set */
+
+        /* set value for sym=n */
+        picosat_assume(pico, -(e->satval));
+        e->assumption = false;
+
+        /* set value for all other fexpr */
+        fexpr_list_for_each(node, sym->nb_vals) {
+            if (node->prev == NULL)
+                continue;
+
+            if (strcmp(str_get(&node->elem->nb_val), string_val) == 0) {
+                picosat_assume(pico, node->elem->satval);
+                node->elem->assumption = true;
+            } else {
+                picosat_assume(pico, -(node->elem->satval));
+                node->elem->assumption = false;
+            }
+        }
+    }
+}
+
+/*
+ * add assumption for a boolean symbol to the SAT-solver
+ */
+void sym_add_assumption_tri(PicoSAT *pico, struct symbol *sym, tristate tri_val)
+{
+    if (sym->type == S_BOOLEAN) {
+        int a = sym->fexpr_y->satval;
+        switch (tri_val) {
+        case no:
+            picosat_assume(pico, -a);
+            sym->fexpr_y->assumption = false;
+            break;
+        case mod:
+            perror("Should not happen. Boolean symbol is set to mod.\n");
+            break;
+        case yes:
+
+            picosat_assume(pico, a);
+            sym->fexpr_y->assumption = true;
+            break;
+        }
+    }
+    if (sym->type == S_TRISTATE) {
+        int a = sym->fexpr_y->satval;
+        int a_m = sym->fexpr_m->satval;
+        switch (tri_val) {
+        case no:
+            picosat_assume(pico, -a);
+            picosat_assume(pico, -a_m);
+            sym->fexpr_y->assumption = false;
+            sym->fexpr_m->assumption = false;
+            break;
+        case mod:
+            picosat_assume(pico, -a);
+            picosat_assume(pico, a_m);
+            sym->fexpr_y->assumption = false;
+            sym->fexpr_m->assumption = true;
+            break;
+        case yes:
+            picosat_assume(pico, a);
+            picosat_assume(pico, -a_m);
+            sym->fexpr_y->assumption = true;
+            sym->fexpr_m->assumption = false;
+            break;
+        }
+    }
+}
+
+/*
+ * add assumptions for the symbols to be changed to the SAT solver
+ */
+void sym_add_assumption_sdv(PicoSAT *pico, struct sdv_list *list)
+{
+    struct symbol_dvalue *sdv;
+    struct sdv_node *node;
+    sdv_list_for_each(node, list) {
+        sdv = node->elem;
+
+        int lit_y = sdv->sym->fexpr_y->satval;
+
+        if (sdv->sym->type == S_BOOLEAN) {
+            switch (sdv->tri) {
+            case yes:
+                picosat_assume(pico, lit_y);
+                break;
+            case no:
+                picosat_assume(pico, -lit_y);
+                break;
+            case mod:
+                perror("Should not happen.\n");
+            }
+        } else if (sdv->sym->type == S_TRISTATE) {
+            int lit_m = sdv->sym->fexpr_m->satval;
+            switch (sdv->tri) {
+            case yes:
+                picosat_assume(pico, lit_y);
+                picosat_assume(pico, -lit_m);
+                break;
+            case mod:
+                picosat_assume(pico, -lit_y);
+                picosat_assume(pico, lit_m);
+                break;
+            case no:
+                picosat_assume(pico, -lit_y);
+                picosat_assume(pico, -lit_m);
+            }
+        }
+    }
+}
diff --git a/scripts/kconfig/cf_satutils.h b/scripts/kconfig/cf_satutils.h
new file mode 100644
index 000000000000..d5caf87e3427
--- /dev/null
+++ b/scripts/kconfig/cf_satutils.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Patrick Franz <deltaone@debian.org>
+ */
+
+#ifndef CF_SATUTILS_H
+#define CF_SATUTILS_H
+
+/* initialize PicoSAT */
+PicoSAT * initialize_picosat(void);
+
+/* construct the CNF-clauses from the constraints */
+void construct_cnf_clauses(PicoSAT *pico);
+
+/* add a clause to to PicoSAT */
+void sat_add_clause(int num, ...);
+
+/* start PicoSAT */
+void picosat_solve(PicoSAT *pico);
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
diff --git a/scripts/kconfig/cf_utils.c b/scripts/kconfig/cf_utils.c
new file mode 100644
index 000000000000..36d7ab374f6d
--- /dev/null
+++ b/scripts/kconfig/cf_utils.c
@@ -0,0 +1,510 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Patrick Franz <deltaone@debian.org>
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
+
+#define SATMAP_INIT_SIZE 2
+
+/*
+ * parse Kconfig-file and read .config
+ */
+void init_config(const char *Kconfig_file)
+{
+    conf_parse(Kconfig_file);
+    conf_read(NULL);
+}
+
+/*
+ * initialize satmap and cnf_clauses_map
+ */
+void init_data(void)
+{
+    /* create hashtable with all fexpr */
+    satmap = xcalloc(SATMAP_INIT_SIZE, sizeof(*satmap));
+    satmap_size = SATMAP_INIT_SIZE;
+
+    printd("done.\n");
+}
+
+/*
+ * bool-symbols have 1 variable (X), tristate-symbols have 2 variables (X, X_m)
+ */
+static void create_sat_variables(struct symbol *sym)
+{
+    sym->constraints = pexpr_list_init();
+    sym_create_fexpr(sym);
+}
+
+/*
+ * assign SAT-variables to all fexpr and create the sat_map
+ */
+void assign_sat_variables(void)
+{
+    unsigned int i;
+    struct symbol *sym;
+
+    printd("Creating SAT-variables...");
+
+    for_all_symbols(i, sym)
+        create_sat_variables(sym);
+
+    printd("done.\n");
+}
+
+/*
+ * create True/False constants
+ */
+void create_constants(void)
+{
+    printd("Creating constants...");
+
+    /* create TRUE and FALSE constants */
+    const_false = fexpr_create(sat_variable_nr++, FE_FALSE, "False");
+    fexpr_add_to_satmap(const_false);
+
+    const_true = fexpr_create(sat_variable_nr++, FE_TRUE, "True");
+    fexpr_add_to_satmap(const_true);
+
+    /* add fexpr of constants to tristate constants */
+    symbol_yes.fexpr_y = const_true;
+    symbol_yes.fexpr_m = const_false;
+
+    symbol_mod.fexpr_y = const_false;
+    symbol_mod.fexpr_m = const_true;
+
+    symbol_no.fexpr_y = const_false;
+    symbol_no.fexpr_m = const_false;
+
+    /* create symbols yes/mod/no as fexpr */
+    symbol_yes_fexpr = fexpr_create(0, FE_SYMBOL, "y");
+    symbol_yes_fexpr->sym = &symbol_yes;
+    symbol_yes_fexpr->tri = yes;
+
+    symbol_mod_fexpr = fexpr_create(0, FE_SYMBOL, "m");
+    symbol_mod_fexpr->sym = &symbol_mod;
+    symbol_mod_fexpr->tri = mod;
+
+    symbol_no_fexpr = fexpr_create(0, FE_SYMBOL, "n");
+    symbol_no_fexpr->sym = &symbol_no;
+    symbol_no_fexpr->tri = no;
+
+    printd("done.\n");
+}
+
+/*
+ * create a temporary SAT-variable
+ */
+struct fexpr * create_tmpsatvar(void)
+{
+    struct fexpr *t = fexpr_create(sat_variable_nr++, FE_TMPSATVAR, "");
+    str_append(&t->name, get_tmp_var_as_char(tmp_variable_nr++));
+    fexpr_add_to_satmap(t);
+
+    return t;
+}
+
+/*
+ * return a temporary SAT variable as string
+ */
+char * get_tmp_var_as_char(int i)
+{
+    char *val = malloc(sizeof(char) * 18);
+    snprintf(val, 18, "T_%d", i);
+    return val;
+}
+
+/*
+ * return a tristate value as a char *
+ */
+char * tristate_get_char(tristate val)
+{
+    switch (val) {
+    case yes:
+        return "yes";
+    case mod:
+        return "mod";
+    case no:
+        return "no";
+    default:
+        return "";
+    }
+}
+
+/*
+ *check whether an expr can evaluate to mod
+ */
+bool expr_can_evaluate_to_mod(struct expr *e)
+{
+    if (!e)
+        return false;
+
+    switch (e->type) {
+    case E_SYMBOL:
+        return e->left.sym == &symbol_mod || e->left.sym->type == S_TRISTATE ? true : false;
+    case E_AND:
+    case E_OR:
+        return expr_can_evaluate_to_mod(e->left.expr) || expr_can_evaluate_to_mod(e->right.expr);
+    case E_NOT:
+        return expr_can_evaluate_to_mod(e->left.expr);
+    default:
+        return false;
+    }
+}
+
+/*
+ * check whether an expr is a non-Boolean constant
+ */
+bool expr_is_nonbool_constant(struct expr *e)
+{
+    if (e->type != E_SYMBOL)
+        return false;
+    if (e->left.sym->type != S_UNKNOWN)
+        return false;
+
+    if (e->left.sym->flags & SYMBOL_CONST)
+        return true;
+
+    return string_is_number(e->left.sym->name) || string_is_hex(e->left.sym->name);
+}
+
+/*
+ * check whether a symbol is a non-Boolean constant
+ */
+bool sym_is_nonbool_constant(struct symbol *sym)
+{
+    if (sym->type != S_UNKNOWN)
+        return false;
+
+    if (sym->flags & SYMBOL_CONST)
+        return true;
+
+    return string_is_number(sym->name) || string_is_hex(sym->name);
+}
+
+/*
+ * print an expr
+ */
+static void print_expr_util(struct expr *e, int prevtoken)
+{
+    if (!e)
+        return;
+
+    switch (e->type) {
+    case E_SYMBOL:
+        if (sym_get_name(e->left.sym) != NULL)
+            printf("%s", sym_get_name(e->left.sym));
+        else
+            printf("left was null\n");
+        break;
+    case E_NOT:
+        printf("!");
+        print_expr_util(e->left.expr, E_NOT);
+        break;
+    case E_AND:
+        if (prevtoken != E_AND && prevtoken != 0)
+            printf("(");
+        print_expr_util(e->left.expr, E_AND);
+        printf(" && ");
+        print_expr_util(e->right.expr, E_AND);
+        if (prevtoken != E_AND && prevtoken != 0)
+            printf(")");
+        break;
+    case E_OR:
+        if (prevtoken != E_OR && prevtoken != 0)
+            printf("(");
+        print_expr_util(e->left.expr, E_OR);
+        printf(" || ");
+        print_expr_util(e->right.expr, E_OR);
+        if (prevtoken != E_OR && prevtoken != 0)
+            printf(")");
+        break;
+    case E_EQUAL:
+    case E_UNEQUAL:
+        if (e->left.sym->name)
+            printf("%s", e->left.sym->name);
+        else
+            printf("left was null\n");
+        printf("%s", e->type == E_EQUAL ? "=" : "!=");
+        printf("%s", e->right.sym->name);
+        break;
+    case E_LEQ:
+    case E_LTH:
+        if (e->left.sym->name)
+            printf("%s", e->left.sym->name);
+        else
+            printf("left was null\n");
+        printf("%s", e->type == E_LEQ ? "<=" : "<");
+        printf("%s", e->right.sym->name);
+        break;
+    case E_GEQ:
+    case E_GTH:
+        if (e->left.sym->name)
+            printf("%s", e->left.sym->name);
+        else
+            printf("left was null\n");
+        printf("%s", e->type == E_GEQ ? ">=" : ">");
+        printf("%s", e->right.sym->name);
+        break;
+    case E_RANGE:
+        printf("[");
+        printf("%s", e->left.sym->name);
+        printf(" ");
+        printf("%s", e->right.sym->name);
+        printf("]");
+        break;
+    default:
+        break;
+    }
+}
+void print_expr(char *tag, struct expr *e, int prevtoken)
+{
+    printf("%s ", tag);
+    print_expr_util(e, prevtoken);
+    printf("\n");
+}
+
+/*
+ * check, if the symbol is a tristate-constant
+ */
+bool sym_is_tristate_constant(struct symbol *sym) {
+    return sym == &symbol_yes || sym == &symbol_mod || sym == &symbol_no;
+}
+
+/*
+ * check, if a symbol is of type boolean or tristate
+ */
+bool sym_is_boolean(struct symbol *sym)
+{
+    return sym->type == S_BOOLEAN || sym->type == S_TRISTATE;
+}
+
+/*
+ * check, if a symbol is a boolean/tristate or a tristate constant
+ */
+bool sym_is_bool_or_triconst(struct symbol *sym)
+{
+    return sym_is_tristate_constant(sym) || sym_is_boolean(sym);
+}
+
+/*
+ * check, if a symbol is of type int, hex, or string
+ */
+bool sym_is_nonboolean(struct symbol *sym)
+{
+    return sym->type == S_INT || sym->type == S_HEX || sym->type == S_STRING;
+}
+
+/*
+ * check, if a symbol has a prompt
+ */
+bool sym_has_prompt(struct symbol *sym)
+{
+    struct property *prop;
+
+    for_all_prompts(sym, prop)
+        return true;
+
+    return false;
+}
+
+/*
+ * return the prompt of the symbol if there is one, NULL otherwise
+ */
+struct property * sym_get_prompt(struct symbol *sym)
+{
+    struct property *prop;
+
+    for_all_prompts(sym, prop)
+        return prop;
+
+    return NULL;
+}
+
+/*
+ * return the condition for the property, True if there is none
+ */
+struct pexpr * prop_get_condition(struct property *prop)
+{
+    if (prop == NULL)
+        return NULL;
+
+    /* if there is no condition, return True */
+    if (!prop->visible.expr)
+        return pexf(const_true);
+
+    return expr_calculate_pexpr_both(prop->visible.expr);
+}
+
+/*
+ * return the default property, NULL if none exists or can be satisfied
+ */
+struct property *sym_get_default_prop(struct symbol *sym)
+{
+    struct property *prop;
+
+    for_all_defaults(sym, prop) {
+        prop->visible.tri = expr_calc_value(prop->visible.expr);
+        if (prop->visible.tri != no)
+            return prop;
+    }
+    return NULL;
+}
+
+/*
+ * check whether a non-boolean symbol has a value set
+ */
+bool sym_nonbool_has_value_set(struct symbol *sym)
+{
+    if (!sym_is_nonboolean(sym))
+        return false;
+
+    const char *string_val = sym_get_string_value(sym);
+
+    if (strcmp(string_val, "") != 0)
+        return true;
+
+    /* a HEX/INT symbol cannot have value "" */
+    if (sym->type == S_HEX || sym->type == S_INT)
+        return false;
+
+    /* cannot have a value with unmet dependencies */
+    if (sym->dir_dep.expr && sym->dir_dep.tri == no)
+        return false;
+
+    /* visible prompt => value set */
+    struct property *prompt = sym_get_prompt(sym);
+    if (prompt != NULL && prompt->visible.tri != no)
+        return true;
+
+    /* invisible prompt => must get value from default value */
+    struct property *p = sym_get_default_prop(sym);
+    if (p == NULL)
+        return false;
+
+    if (!strcmp(sym_get_string_default(sym), ""))
+        return true;
+
+    return false;
+}
+
+/*
+ * return the name of the symbol or the prompt-text, if it is a choice symbol
+ */
+char * sym_get_name(struct symbol *sym)
+{
+    if (sym_is_choice(sym)) {
+        struct property *prompt = sym_get_prompt(sym);
+        if (prompt == NULL)
+            return "";
+
+        return strdup(prompt->text);
+    } else {
+        return sym->name;
+    }
+}
+
+/*
+ * check whether symbol is to be changed
+ */
+bool sym_is_sdv(struct sdv_list *list, struct symbol *sym)
+{
+    struct sdv_node *node;
+    sdv_list_for_each(node, list)
+        if (sym == node->elem->sym)
+            return true;
+
+    return false;
+}
+
+/*
+ * print a symbol's name
+ */
+void print_sym_name(struct symbol *sym)
+{
+    printf("Symbol: ");
+    if (sym_is_choice(sym)) {
+        struct property *prompt = sym_get_prompt(sym);
+        printf("(Choice) %s", prompt->text);
+    } else  {
+        printf("%s", sym->name);
+    }
+    printf("\n");
+}
+
+/*
+ * print all constraints for a symbol
+ */
+void print_sym_constraint(struct symbol* sym)
+{
+    struct pexpr_node *node;
+    pexpr_list_for_each(node, sym->constraints)
+        pexpr_print("::", node->elem, -1);
+}
+
+/*
+ * print a default map
+ */
+void print_default_map(struct defm_list *map)
+{
+    struct default_map *entry;
+    struct defm_node *node;
+
+    defm_list_for_each(node, map) {
+        entry = node->elem;
+        struct gstr s = str_new();
+        str_append(&s, "\t");
+        str_append(&s, str_get(&entry->val->name));
+        str_append(&s, " ->");
+        pexpr_print(strdup(str_get(&s)), entry->e, -1);
+        str_free(&s);
+    }
+}
+
+/*
+ * check whether a string is a number
+ */
+bool string_is_number(char *s)
+{
+    int len = strlen(s);
+    int i = 0;
+    while (i < len) {
+        if (!isdigit(s[i]))
+            return false;
+        i++;
+    }
+
+    return true;
+}
+
+/*
+ * check whether a string is a hexadecimal number
+ */
+bool string_is_hex(char *s)
+{
+    int len = strlen(s);
+    int i = 2;
+    if (len >= 3 && s[0] == '0' && s[1] == 'x') {
+        while (i < len) {
+            if (!isxdigit(s[i]))
+                return false;
+            i++;
+        }
+        return true;
+    } else {
+        return false;
+    }
+}
diff --git a/scripts/kconfig/cf_utils.h b/scripts/kconfig/cf_utils.h
new file mode 100644
index 000000000000..91f9bbf26191
--- /dev/null
+++ b/scripts/kconfig/cf_utils.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Patrick Franz <deltaone@debian.org>
+ */
+
+#ifndef CF_UTILS_H
+#define CF_UTILS_H
+
+/* parse Kconfig-file and read .config */
+void init_config (const char *Kconfig_file);
+
+/* initialize satmap and cnf_clauses */
+void init_data(void);
+
+/* assign SAT-variables to all fexpr and create the sat_map */
+void assign_sat_variables(void);
+
+/* create True/False constants */
+void create_constants(void);
+
+/* create a temporary SAT-variable */
+struct fexpr * create_tmpsatvar(void);
+
+/* return a temporary SAT variable as string */
+char * get_tmp_var_as_char(int i);
+
+/* return a tristate value as a char * */
+char * tristate_get_char(tristate val);
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
+struct property * sym_get_prompt(struct symbol *sym);
+
+/* return the condition for the property, True if there is none */
+struct pexpr * prop_get_condition(struct property *prop);
+
+/* return the default property, NULL if none exists or can be satisfied */
+struct property *sym_get_default_prop(struct symbol *sym);
+
+/* check whether a non-boolean symbol has a value set */
+bool sym_nonbool_has_value_set(struct symbol *sym);
+
+/* return the name of the symbol */
+char * sym_get_name(struct symbol *sym);
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
+#endif
-- 
2.33.0


