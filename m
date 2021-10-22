Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6978F437848
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 15:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhJVNst (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 09:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhJVNss (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 09:48:48 -0400
Received: from out3.mail.ruhr-uni-bochum.de (out3.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:8:1001::8693:359b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D087C061764
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Oct 2021 06:46:31 -0700 (PDT)
Received: from mx3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out3.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HbQcP5X7rz8SDy;
        Fri, 22 Oct 2021 15:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634910389; bh=DmKPEP4zSNH/Y7T040EPSf0wKmCr5aJ8YpjVqTocA90=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=tfxGpk1wj91QheP55ORTSWTmIJSez2qtqSqAvNhB2o7s16eZLHw5J//7CTCLJXy1d
         Fb4f/FehopxdJ8RHMCErNs1kOiu2YC+4XUr5wpMeaqQUz2Dzt+ayaT6SANdaoxNPeD
         MOKU8bGBuBcWW+r3A1DWmf3ZOmzdS7GSCweAUVlQ=
Received: from out3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx3.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HbQcP4t1Bz8SDC;
        Fri, 22 Oct 2021 15:46:29 +0200 (CEST)
X-Envelope-Sender: <thorsten.berger@rub.de>
X-RUB-Notes: Internal origin=134.147.42.236
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [134.147.42.236])
        by out3.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HbQcP2pqcz8SFJ;
        Fri, 22 Oct 2021 15:46:29 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx3.mail.ruhr-uni-bochum.de
Received: from [10.150.66.4] (nb02.ig09.ruhr-uni-bochum.de [10.150.66.4])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HbQcP0thSzDgyf;
        Fri, 22 Oct 2021 15:46:29 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <5aaedabb-ab4f-a206-42dd-760a1b65e507@rub.de>
Date:   Fri, 22 Oct 2021 15:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [RFC v3 10/12] Add tools
Content-Language: en-US
From:   Thorsten Berger <thorsten.berger@rub.de>
To:     linux-kbuild@vger.kernel.org
Cc:     deltaone@debian.org, phayax@gmail.com,
        Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
In-Reply-To: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
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

This commit contains the actual API to be used from a configurator.
Furthermore it contains a tool to print all constraints into a file
as well as a debugging tool.

---
 scripts/kconfig/cfconfig.c    | 176 ++++++++++++++
 scripts/kconfig/cfoutconfig.c | 128 +++++++++++
 scripts/kconfig/configfix.c   | 420 ++++++++++++++++++++++++++++++++++
 scripts/kconfig/configfix.h   |  41 ++++
 4 files changed, 765 insertions(+)
 create mode 100644 scripts/kconfig/cfconfig.c
 create mode 100644 scripts/kconfig/cfoutconfig.c
 create mode 100644 scripts/kconfig/configfix.c
 create mode 100644 scripts/kconfig/configfix.h

diff --git a/scripts/kconfig/cfconfig.c b/scripts/kconfig/cfconfig.c
new file mode 100644
index 000000000000..105bdf5d3f4e
--- /dev/null
+++ b/scripts/kconfig/cfconfig.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0
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
+static struct symbol * read_symbol_from_stdin(void);
+static struct symbol_dvalue * sym_create_sdv(struct symbol *sym, char *input);
+static void handle_fixes(struct sfl_list *diag);
+
+/* -------------------------------------- */
+
+int main(int argc, char *argv[])
+{
+    CFDEBUG = true;
+
+    if (argc > 1 && !strcmp(argv[1], "-s")) {
+        printd("\nHello configfix!\n\n");
+
+        run_satconf_cli(argv[2]);
+        return EXIT_SUCCESS;
+    }
+
+    printd("\nCLI for configfix!\n");
+
+    init_config(argv[1]);
+
+    struct sfl_list *diagnoses;
+    struct sdv_list *symbols;
+
+    while(1) {
+        /* create the array */
+        symbols = sdv_list_init();
+
+        /* ask for user input */
+        struct symbol *sym = read_symbol_from_stdin();
+
+        printd("Found symbol %s, type %s\n\n", sym->name, sym_type_name(sym->type));
+        printd("Current value: %s\n", sym_get_string_value(sym));
+        printd("Desired value: ");
+
+        char input[100];
+        fgets(input, 100, stdin);
+        strtok(input, "\n");
+
+        struct symbol_dvalue *sdv = sym_create_sdv(sym, input);
+        sdv_list_add(symbols, sdv);
+
+        diagnoses = run_satconf(symbols);
+        handle_fixes(diagnoses);
+    }
+
+    return EXIT_SUCCESS;
+}
+
+/*
+ * read a symbol name from stdin
+ */
+static struct symbol * read_symbol_from_stdin(void)
+{
+    char input[100];
+    struct symbol *sym = NULL;
+
+    printd("\n");
+    while (sym == NULL) {
+        printd("Enter symbol name: ");
+        fgets(input, 100, stdin);
+        strtok(input, "\n");
+        sym = sym_find(input);
+    }
+
+    return sym;
+}
+
+/*
+ * create a symbol_dvalue struct containing the symbol and the desired value
+ */
+static struct symbol_dvalue * sym_create_sdv(struct symbol *sym, char *input)
+{
+    struct symbol_dvalue *sdv = malloc(sizeof(struct symbol_dvalue));
+    sdv->sym = sym;
+    sdv->type = sym_is_boolean(sym) ? SDV_BOOLEAN : SDV_NONBOOLEAN;
+
+    if (sym_is_boolean(sym)) {
+        if (strcmp(input, "y") == 0)
+            sdv->tri = yes;
+        else if (strcmp(input, "m") == 0)
+            sdv->tri = mod;
+        else if (strcmp(input, "n") == 0)
+            sdv->tri = no;
+        else
+            perror("Not a valid tristate value.");
+
+        /* sanitize input for booleans */
+        if (sym->type == S_BOOLEAN && sdv->tri == mod)
+            sdv->tri = yes;
+    } else if (sym_is_nonboolean(sym)) {
+        sdv->nb_val = str_new();
+        str_append(&sdv->nb_val, input);
+    }
+
+    return sdv;
+}
+
+/*
+ * print the diagnoses of type symbol_fix
+ */
+static void print_diagnoses_symbol(struct sfl_list *diag_sym)
+{
+    struct sfl_node *arr;
+    unsigned int i = 1;
+
+    sfl_list_for_each(arr, diag_sym) {
+        printd(" %d: ", i++);
+        print_diagnosis_symbol(arr->elem);
+    }
+}
+
+static void apply_all_adiagnoses(struct sfl_list *diag) {
+    printd("Applying all diagnoses now...\n");
+
+    unsigned int counter = 1;
+    struct sfl_node *node;
+    sfl_list_for_each(node, diag) {
+        printd("\nDiagnosis %d:\n", counter++);
+        apply_fix(node->elem);
+
+        printd("\nResetting config.\n");
+        conf_read(NULL);
+    }
+}
+
+/*
+ * print all void print_fixes()
+ */
+static void handle_fixes(struct sfl_list *diag)
+{
+    printd("=== GENERATED DIAGNOSES ===\n");
+    printd("-1: No changes wanted\n");
+    printd(" 0: Apply all diagnoses\n");
+    print_diagnoses_symbol(diag);
+
+    int choice;
+    printd("\n> Choose option: ");
+    scanf("%d", &choice);
+
+    if (choice == -1 || choice > diag->size)
+        return;
+
+    if (choice == 0) {
+        apply_all_adiagnoses(diag);
+        return;
+    }
+
+    unsigned int counter;
+    struct sfl_node *node = diag->head;
+    for (counter = 1; counter < choice; counter++)
+        node = node->next;
+
+    apply_fix(node->elem);
+
+    printd("\nResetting config.\n");
+    conf_read(NULL);
+}
diff --git a/scripts/kconfig/cfoutconfig.c b/scripts/kconfig/cfoutconfig.c
new file mode 100644
index 000000000000..4164e25e66aa
--- /dev/null
+++ b/scripts/kconfig/cfoutconfig.c
@@ -0,0 +1,128 @@
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
+#define OUTFILE_CONSTRAINTS "./scripts/kconfig/cfout_constraints.txt"
+#define OUTFILE_DIMACS "./scripts/kconfig/cfout_constraints.dimacs"
+
+static void write_constraints_to_file(void);
+static void write_dimacs_to_file(PicoSAT *pico);
+
+/* -------------------------------------- */
+
+int main(int argc, char *argv[])
+{
+    clock_t start, end;
+    double time;
+
+    printf("\nCreating constraints and CNF clauses...");
+    /* measure time for constructing constraints and clauses */
+    start = clock();
+
+    /* parse Kconfig-file and read .config */
+    init_config(argv[1]);
+
+    /* initialize satmap and cnf_clauses */
+    init_data();
+
+    /* creating constants */
+    create_constants();
+
+    /* assign SAT variables & create sat_map */
+    assign_sat_variables();
+
+    /* get the constraints */
+    get_constraints();
+
+    end = clock();
+    time = ((double) (end - start)) / CLOCKS_PER_SEC;
+
+    printd("done. (%.6f secs.)\n", time);
+
+    /* start PicoSAT */
+    PicoSAT *pico = picosat_init();
+    picosat_enable_trace_generation(pico);
+    printd("Building CNF-clauses...");
+    start = clock();
+
+    /* construct the CNF clauses */
+    construct_cnf_clauses(pico);
+
+    end = clock();
+    time = ((double) (end - start)) / CLOCKS_PER_SEC;
+    printf("done. (%.6f secs.)\n", time);
+
+    printf("\n");
+
+    /* write constraints into file */
+    start = clock();
+    printf("Writing constraints...");
+    write_constraints_to_file();
+    end = clock();
+    time = ((double) (end - start)) / CLOCKS_PER_SEC;
+    printf("done. (%.6f secs.)\n", time);
+
+    /* write SAT problem in DIMACS into file */
+    start = clock();
+    printf("Writing SAT problem in DIMACS...");
+    write_dimacs_to_file(pico);
+    end = clock();
+    time = ((double) (end - start)) / CLOCKS_PER_SEC;
+    printf("done. (%.6f secs.)\n", time);
+
+    printf("\nConstraints have been written into %s\n", OUTFILE_CONSTRAINTS);
+    printf("DIMACS-output has been written into %s\n", OUTFILE_DIMACS);
+
+    return 0;
+}
+
+static void write_constraints_to_file(void)
+{
+    FILE *fd = fopen(OUTFILE_CONSTRAINTS, "w");
+    unsigned int i;
+    struct symbol *sym;
+
+    for_all_symbols(i, sym) {
+        if (sym->type == S_UNKNOWN) continue;
+
+        struct pexpr_node *node;
+        pexpr_list_for_each(node, sym->constraints) {
+            struct gstr s = str_new();
+            pexpr_as_char(node->elem, &s, 0);
+            fprintf(fd, "%s\n", str_get(&s));
+            str_free(&s);
+        }
+    }
+    fclose(fd);
+}
+
+static void add_comment(FILE *fd, struct fexpr *e)
+{
+    fprintf(fd, "c %d %s\n", e->satval, str_get(&e->name));
+}
+
+static void write_dimacs_to_file(PicoSAT *pico)
+{
+    FILE *fd = fopen(OUTFILE_DIMACS, "w");
+
+    unsigned int i;
+    for (i = 1; i < sat_variable_nr; i++)
+        add_comment(fd, &satmap[i]);
+
+    picosat_print(pico, fd);
+    fclose(fd);
+}
diff --git a/scripts/kconfig/configfix.c b/scripts/kconfig/configfix.c
new file mode 100644
index 000000000000..e226541e10f9
--- /dev/null
+++ b/scripts/kconfig/configfix.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0
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
+unsigned int sat_variable_nr = 1;
+unsigned int tmp_variable_nr = 1;
+
+struct fexpr *satmap;
+size_t satmap_size;
+
+struct sdv_list *sdv_symbols; /* array with conflict-symbols */
+
+bool CFDEBUG = false;
+bool stop_rangefix = false;
+
+struct fexpr *const_false; /* constant False */
+struct fexpr *const_true; /* constant True */
+struct fexpr *symbol_yes_fexpr; /* symbol_yes as fexpr */
+struct fexpr *symbol_mod_fexpr; /* symbol_mod as fexpr */
+struct fexpr *symbol_no_fexpr; /* symbol_no_as fexpr */
+
+static PicoSAT *pico;
+static bool init_done = false;
+static struct sym_list *conflict_syms;
+
+static bool sdv_within_range(struct sdv_list *symbols);
+
+/* -------------------------------------- */
+
+int run_satconf_cli(const char *Kconfig_file)
+{
+    clock_t start, end;
+    double time;
+
+    if (!init_done) {
+        printd("Init...");
+        /* measure time for constructing constraints and clauses */
+        start = clock();
+
+        /* parse Kconfig-file and read .config */
+        init_config(Kconfig_file);
+
+        /* initialize satmap and cnf_clauses */
+        init_data();
+
+        /* creating constants */
+        create_constants();
+
+        /* assign SAT variables & create sat_map */
+        assign_sat_variables();
+
+        /* get the constraints */
+        get_constraints();
+
+        /* print all symbols and its constraints */
+        //         print_all_symbols();
+
+        end = clock();
+        time = ((double)(end - start)) / CLOCKS_PER_SEC;
+
+        printd("done. (%.6f secs.)\n", time);
+
+        init_done = true;
+    }
+
+    /* start PicoSAT */
+    PicoSAT *pico = initialize_picosat();
+    printd("Building CNF-clauses...");
+    start = clock();
+
+    /* construct the CNF clauses */
+    construct_cnf_clauses(pico);
+
+    end = clock();
+    time = ((double)(end - start)) / CLOCKS_PER_SEC;
+
+    printd("done. (%.6f secs.)\n", time);
+
+    /* add assumptions for all other symbols */
+    printd("Adding assumptions...");
+    start = clock();
+
+    unsigned int i;
+    struct symbol *sym;
+    for_all_symbols(i, sym) {
+        if (sym->type == S_UNKNOWN)
+            continue;
+
+        if (!sym->name || !sym_has_prompt(sym))
+            continue;
+
+        sym_add_assumption(pico, sym);
+
+    }
+
+    end = clock();
+    time = ((double)(end - start)) / CLOCKS_PER_SEC;
+
+    printd("done. (%.6f secs.)\n", time);
+
+    picosat_solve(pico);
+
+    printd("\n===> STATISTICS <===\n");
+    printd("Constraints  : %d\n", count_counstraints());
+    printd("CNF-clauses  : %d\n", picosat_added_original_clauses(pico));
+    printd("SAT-variables: %d\n", picosat_variables(pico));
+    printd("Temp vars    : %d\n", tmp_variable_nr - 1);
+    printd("PicoSAT time : %.6f secs.\n", picosat_seconds(pico));
+
+    return EXIT_SUCCESS;
+}
+
+/*
+ * called from satdvconfig
+ */
+struct sfl_list *run_satconf(struct sdv_list *symbols)
+{
+    clock_t start, end;
+    double time;
+
+    /* check whether all values can be applied -> no need to run */
+    if (sdv_within_range(symbols)) {
+        printd("\nAll symbols are already within range.\n\n");
+        return sfl_list_init();
+    }
+
+    if (!init_done) {
+        printd("\n");
+        printd("Init...");
+
+        /* measure time for constructing constraints and clauses */
+        start = clock();
+
+        /* initialize satmap and cnf_clauses */
+        init_data();
+
+        /* creating constants */
+        create_constants();
+
+        /* assign SAT variables & create sat_map */
+        assign_sat_variables();
+
+        /* get the constraints */
+        get_constraints();
+
+        end = clock();
+        time = ((double)(end - start)) / CLOCKS_PER_SEC;
+
+        printd("done. (%.6f secs.)\n", time);
+
+        /* start PicoSAT */
+        pico = initialize_picosat();
+        printd("Building CNF-clauses...");
+        start = clock();
+
+        /* construct the CNF clauses */
+        construct_cnf_clauses(pico);
+
+        end = clock();
+        time = ((double)(end - start)) / CLOCKS_PER_SEC;
+
+        printd("done. (%.6f secs.)\n", time);
+
+        printd("CNF-clauses added: %d\n",
+               picosat_added_original_clauses(pico));
+
+        init_done = true;
+    }
+
+    /* copy array with symbols to change */
+    sdv_symbols = sdv_list_copy(symbols);
+
+    /* add assumptions for conflict-symbols */
+    sym_add_assumption_sdv(pico, sdv_symbols);
+
+    /* add assumptions for all other symbols */
+    struct symbol *sym;
+    unsigned int i;
+    for_all_symbols(i, sym) {
+        if (sym->type == S_UNKNOWN)
+            continue;
+
+        if (!sym_is_sdv(sdv_symbols, sym))
+            sym_add_assumption(pico, sym);
+    }
+
+    /* store the conflict symbols */
+    conflict_syms = sym_list_init();
+    struct sdv_node *node;
+    sdv_list_for_each(node, sdv_symbols)
+        sym_list_add(conflict_syms, node->elem->sym);
+
+    printd("Solving SAT-problem...");
+    start = clock();
+
+    int res = picosat_sat(pico, -1);
+
+    end = clock();
+    time = ((double)(end - start)) / CLOCKS_PER_SEC;
+    printd("done. (%.6f secs.)\n\n", time);
+
+    struct sfl_list *ret;
+    if (res == PICOSAT_SATISFIABLE) {
+        printd("===> PROBLEM IS SATISFIABLE <===\n");
+
+        ret = sfl_list_init();
+
+    } else if (res == PICOSAT_UNSATISFIABLE) {
+        printd("===> PROBLEM IS UNSATISFIABLE <===\n");
+        printd("\n");
+
+        ret = rangefix_run(pico);
+    } else {
+        printd("Unknown if satisfiable.\n");
+
+        ret = sfl_list_init();
+    }
+
+    sdv_list_free(sdv_symbols);
+
+    return ret;
+}
+
+/*
+ * check whether a symbol is a conflict symbol
+ */
+static bool sym_is_conflict_sym(struct symbol *sym)
+{
+    struct sym_node *node;
+    sym_list_for_each(node,
+              conflict_syms) if (sym == node->elem) return true;
+
+    return false;
+}
+
+/*
+ * check whether all conflict symbols are set to their target values
+ */
+static bool syms_have_target_value(struct sfix_list *list)
+{
+    struct symbol_fix *fix;
+    struct sfix_node *node;
+
+    sfix_list_for_each(node, list) {
+        fix = node->elem;
+
+        if (!sym_is_conflict_sym(fix->sym))
+            continue;
+
+        sym_calc_value(fix->sym);
+
+        if (sym_is_boolean(fix->sym)) {
+            if (fix->tri != sym_get_tristate_value(fix->sym))
+                return false;
+        } else {
+            if (strcmp(str_get(&fix->nb_val),
+                   sym_get_string_value(fix->sym)) != 0)
+                return false;
+        }
+    }
+
+    return true;
+}
+
+/*
+ *
+ * apply the fixes from a diagnosis
+ */
+int apply_fix(struct sfix_list *fix)
+{
+    struct symbol_fix *sfix;
+    struct sfix_node *node, *next;
+    unsigned int no_symbols_set = 0, iterations = 0, manually_changed = 0;
+
+    struct sfix_list *tmp = sfix_list_copy(fix);
+
+    printd("Trying to apply fixes now...\n");
+
+    while (no_symbols_set < fix->size && !syms_have_target_value(fix)) {
+        if (iterations > fix->size * 2) {
+            printd("\nCould not apply all values :-(.\n");
+            return manually_changed;
+        }
+
+        for (node = tmp->head; node != NULL;) {
+            sfix = node->elem;
+
+            /* update symbol's current value */
+            sym_calc_value(sfix->sym);
+
+            /* value already set? */
+            if (sfix->type == SF_BOOLEAN) {
+                if (sfix->tri == sym_get_tristate_value(sfix->sym)) {
+                    next = node->next;
+                    sfix_list_delete(tmp, node);
+                    node = next;
+                    no_symbols_set++;
+                    continue;
+                }
+            } else if (sfix->type == SF_NONBOOLEAN) {
+                if (strcmp(str_get(&sfix->nb_val),
+                       sym_get_string_value(sfix->sym)) == 0) {
+                    next = node->next;
+                    sfix_list_delete(tmp, node);
+                    node = next;
+                    no_symbols_set++;
+                    continue;
+                }
+            } else {
+                perror("Error applying fix. Value set for disallowed.");
+            }
+
+            /* could not set value, try next */
+            if (sfix->type == SF_BOOLEAN) {
+                if (!sym_set_tristate_value(sfix->sym,
+                                sfix->tri)) {
+                    node = node->next;
+                    continue;
+                }
+            } else if (sfix->type == SF_NONBOOLEAN) {
+                if (!sym_set_string_value(
+                        sfix->sym,
+                        str_get(&sfix->nb_val))) {
+                    node = node->next;
+                    continue;
+                }
+            } else {
+                perror("Error applying fix. Value set for disallowed.");
+            }
+
+            /* could set value, remove from tmp */
+            manually_changed++;
+            if (sfix->type == SF_BOOLEAN) {
+                printd("%s set to %s.\n",
+                       sym_get_name(sfix->sym),
+                       tristate_get_char(sfix->tri));
+            } else if (sfix->type == SF_NONBOOLEAN) {
+                printd("%s set to %s.\n",
+                       sym_get_name(sfix->sym),
+                       str_get(&sfix->nb_val));
+            }
+
+            next = node->next;
+            sfix_list_delete(tmp, node);
+            node = next;
+            no_symbols_set++;
+        }
+
+        iterations++;
+    }
+
+    printd("Fixes successfully applied.\n");
+
+    return manually_changed;
+}
+
+/*
+ * stop RangeFix after the next iteration
+ */
+void interrupt_rangefix(void)
+{
+    stop_rangefix = true;
+}
+
+/*
+ * check whether all symbols are already within range
+ */
+static bool sdv_within_range(struct sdv_list *symbols)
+{
+    struct symbol_dvalue *sdv;
+    struct sdv_node *node;
+
+    sdv_list_for_each(node, symbols) {
+        sdv = node->elem;
+
+        assert(sym_is_boolean(sdv->sym));
+
+        if (sdv->tri == sym_get_tristate_value(sdv->sym))
+            continue;
+
+        if (!sym_tristate_within_range(sdv->sym, sdv->tri))
+            return false;
+    }
+
+    return true;
+}
+
+struct sfix_list *select_solution(struct sfl_list *solutions, int index)
+{
+    struct sfl_node *node = solutions->head;
+    unsigned int counter;
+    for (counter = 0; counter < index; counter++)
+        node = node->next;
+
+    return node->elem;
+}
+
+struct symbol_fix *select_symbol(struct sfix_list *solution, int index)
+{
+    struct sfix_node *node = solution->head;
+    unsigned int counter;
+    for (counter = 0; counter < index; counter++)
+        node = node->next;
+
+    return node->elem;
+}
diff --git a/scripts/kconfig/configfix.h b/scripts/kconfig/configfix.h
new file mode 100644
index 000000000000..0abaf433f41c
--- /dev/null
+++ b/scripts/kconfig/configfix.h
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Patrick Franz <deltaone@debian.org>
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
+#include "cf_satutils.h"
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
2.33.0


