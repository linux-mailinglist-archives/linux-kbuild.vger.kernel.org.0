Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E34E43480E
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 11:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhJTJmj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 05:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJTJmj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 05:42:39 -0400
Received: from out3.mail.ruhr-uni-bochum.de (out3.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:8:1001::8693:359b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16F9C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 02:40:24 -0700 (PDT)
Received: from mx3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out3.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HZ5FM0mQMz8SDc;
        Wed, 20 Oct 2021 11:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634722823; bh=RsfdadZ9oZ4mZTwyeKMED1l2KzHbZnN45a2z2PbA5Mg=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=Ec/x6qhlqrnuSdBS5WD/IknwkOMNIF0F9DbkuEA4vKPfnzby6nbKTjw/XzZorC5k9
         NlNz8PaOYPmgbdtGMXyoy6Nw/RV89rRi0Wv/oVH4X+Rv899RfrGK5g5VOh5P9RWm6k
         jXIN1IMkD1xW/zBuszSfla86aTM2XoEdY1rLCGfs=
Received: from out3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx3.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HZ5FL6rFfz8SDH;
        Wed, 20 Oct 2021 11:40:22 +0200 (CEST)
X-RUB-Notes: Internal origin=IPv6:2a05:3e00:c:1001::8693:2aec
X-Envelope-Sender: <thorsten.berger@rub.de>
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:c:1001::8693:2aec])
        by out3.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HZ5FL5Lstz8SCP;
        Wed, 20 Oct 2021 11:40:22 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx3.mail.ruhr-uni-bochum.de
Received: from [192.168.188.22] (unknown [5.63.49.65])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HZ5FL2qmfzDgyg;
        Wed, 20 Oct 2021 11:40:22 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <7b210b5f-48eb-ae82-23fe-2e17686c187f@rub.de>
Date:   Wed, 20 Oct 2021 11:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [RFC 05/12] Add definitions
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
 scripts/kconfig/Makefile  |  19 +++-
 scripts/kconfig/cf_defs.h | 233 ++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/expr.h    |  13 +++
 3 files changed, 262 insertions(+), 3 deletions(-)
 create mode 100644 scripts/kconfig/cf_defs.h

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 5a215880b268..75caf1b755b0 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -35,6 +35,8 @@ menuconfig-prog    := mconf
 nconfig-prog    := nconf
 gconfig-prog    := gconf
 xconfig-prog    := qconf
+cfconfig-prog    := cfconfig
+cfoutconfig-prog := cfoutconfig
 
 define config_rule
 PHONY += $(1)
@@ -45,7 +47,8 @@ PHONY += build_$(1)
 build_$(1): $(obj)/$($(1)-prog)
 endef
 
-$(foreach c, config menuconfig nconfig gconfig xconfig, $(eval $(call config_rule,$(c))))
+$(foreach c, config menuconfig nconfig gconfig xconfig cfconfig \
+cfoutconfig, $(eval $(call config_rule,$(c))))
 
 PHONY += localmodconfig localyesconfig
 localyesconfig localmodconfig: $(obj)/conf
@@ -140,6 +143,8 @@ help:
     @echo  '                    default value without prompting'
     @echo  '  tinyconfig      - Configure the tiniest possible kernel'
     @echo  '  testconfig      - Run Kconfig unit tests (requires python3 and pytest)'
+    @echo  '  cfconfig        - CLI tool for debugging ConfigFix'
+    @echo  '  cfoutconfig     - Print constraints and DIMACS-output into files'
 
 # ===========================================================================
 # object files used by all kconfig flavours
@@ -176,12 +181,20 @@ $(foreach f, mconf.o $(lxdialog), \
 
 $(addprefix $(obj)/, mconf.o $(lxdialog)): $(obj)/mconf-cfg
 
+# configfix: Used for the xconfig target as well as for its debugging tools
+hostprogs        += cfconfig cfoutconfig
+cfconf-objs      := configfix.o cf_constraints.o cf_expr.o cf_rangefix.o cf_satutils.o cf_utils.o picosat.o
+cfconfig-objs    := cfconfig.o $(cfconf-objs) $(common-objs)
+cfoutconfig-objs := cfoutconfig.o $(cfconf-objs) $(common-objs)
+
+HOSTCFLAGS_picosat.o = -DTRACE -Wno-missing-prototypes -Wno-pointer-compare
+
 # qconf: Used for the xconfig target based on Qt
 hostprogs    += qconf
 qconf-cxxobjs    := qconf.o qconf-moc.o
-qconf-objs    := images.o $(common-objs)
+qconf-objs    := images.o $(common-objs) $(cfconf-objs)
 
-HOSTLDLIBS_qconf    = $(shell . $(obj)/qconf-cfg && echo $$libs)
+HOSTLDLIBS_qconf    = $(shell . $(obj)/qconf-cfg && echo $$libs && echo -lpthread)
 HOSTCXXFLAGS_qconf.o    = $(shell . $(obj)/qconf-cfg && echo $$cflags)
 HOSTCXXFLAGS_qconf-moc.o = $(shell . $(obj)/qconf-cfg && echo $$cflags)
 
diff --git a/scripts/kconfig/cf_defs.h b/scripts/kconfig/cf_defs.h
new file mode 100644
index 000000000000..342327a31dc2
--- /dev/null
+++ b/scripts/kconfig/cf_defs.h
@@ -0,0 +1,233 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Patrick Franz <deltaone@debian.org>
+ */
+
+#ifndef DEFS_H
+#define DEFS_H
+
+/* external variables */
+extern unsigned int sat_variable_nr;
+extern unsigned int tmp_variable_nr;
+extern struct fexpr *satmap; // map SAT variables to fexpr
+extern size_t satmap_size;
+
+extern struct sdv_list *sdv_symbols; /* array with conflict-symbols */
+extern bool CFDEBUG;
+extern bool stop_rangefix;
+extern struct fexpr *const_false;
+extern struct fexpr *const_true;
+extern struct fexpr *symbol_yes_fexpr;
+extern struct fexpr *symbol_mod_fexpr;
+extern struct fexpr *symbol_no_fexpr;
+
+#define printd(fmt...) if (CFDEBUG) printf(fmt)
+
+/* different types for f_expr */
+enum fexpr_type {
+    FE_SYMBOL,
+    FE_NPC, /* no prompt condition */
+    FE_TRUE,  /* constant of value True */
+    FE_FALSE,  /* constant of value False */
+    FE_NONBOOL,  /* for all non-(boolean/tristate) known values */
+    FE_CHOICE, /* symbols of type choice */
+    FE_SELECT, /* auxiliary variable for selected symbols */
+    FE_TMPSATVAR /* temporary sat-variable (Tseytin) */
+};
+
+/* struct for a propositional logic formula */
+struct fexpr {
+    /* name of the feature expr */
+    struct gstr name;
+
+    /* associated symbol */
+    struct symbol *sym;
+
+    /* integer value for the SAT solver */
+    int satval;
+
+    /* assumption in the last call to PicoSAT */
+    bool assumption;
+
+    /* type of the fexpr */
+    enum fexpr_type type;
+
+    union {
+        /* symbol */
+        struct {
+            tristate tri;
+        };
+        /* AND, OR, NOT */
+        struct {
+            struct fexpr *left;
+            struct fexpr *right; /* not used for NOT */
+        };
+        /* EQUALS */
+        struct {
+            struct symbol *eqsym;
+            struct symbol *eqvalue;
+        };
+        /* HEX, INTEGER, STRING */
+        struct {
+            struct gstr nb_val;
+        };
+    };
+
+};
+
+struct fexpr_list {
+    struct fexpr_node *head, *tail;
+    unsigned int size;
+};
+
+struct fexpr_node {
+    struct fexpr *elem;
+    struct fexpr_node *next, *prev;
+};
+
+struct fexl_list {
+    struct fexl_node *head, *tail;
+    unsigned int size;
+};
+
+struct fexl_node {
+    struct fexpr_list *elem;
+    struct fexl_node *next, *prev;
+};
+
+enum pexpr_type {
+    PE_SYMBOL,
+    PE_AND,
+    PE_OR,
+    PE_NOT
+};
+
+union pexpr_data {
+    struct pexpr *pexpr;
+    struct fexpr *fexpr;
+};
+
+struct pexpr {
+    enum pexpr_type type;
+    union pexpr_data left, right;
+};
+
+struct pexpr_list {
+    struct pexpr_node *head, *tail;
+    unsigned int size;
+};
+
+struct pexpr_node {
+    struct pexpr *elem;
+    struct pexpr_node *next, *prev;
+};
+
+struct default_map {
+    struct fexpr *val;
+
+    struct pexpr *e;
+};
+
+struct defm_list {
+    struct defm_node *head, *tail;
+    unsigned int size;
+};
+
+struct defm_node {
+    struct default_map *elem;
+    struct defm_node *next, *prev;
+};
+
+enum symboldv_type {
+    SDV_BOOLEAN,    /* boolean/tristate */
+    SDV_NONBOOLEAN    /* string/int/hex */
+};
+
+struct symbol_dvalue {
+    struct symbol *sym;
+
+    enum symboldv_type type;
+
+    union {
+        /* boolean/tristate */
+        tristate tri;
+
+        /* string/int/hex */
+        struct gstr nb_val;
+    };
+};
+
+struct sdv_list {
+    struct sdv_node *head, *tail;
+    unsigned int size;
+};
+
+struct sdv_node {
+    struct symbol_dvalue *elem;
+    struct sdv_node *next, *prev;
+};
+
+enum symbolfix_type {
+    SF_BOOLEAN,    /* boolean/tristate */
+    SF_NONBOOLEAN,    /* string/int/hex */
+    SF_DISALLOWED    /* disallowed non-boolean values */
+};
+
+struct symbol_fix {
+    struct symbol *sym;
+
+    enum symbolfix_type type;
+
+    union {
+        /* boolean/tristate */
+        tristate tri;
+
+        /* string/int/hex */
+        struct gstr nb_val;
+
+        /* disallowed non-boolean values */
+        struct gstr disallowed;
+    };
+};
+
+struct sfix_list {
+    struct sfix_node *head, *tail;
+    unsigned int size;
+};
+
+struct sfix_node {
+    struct symbol_fix *elem;
+    struct sfix_node *next, *prev;
+};
+
+struct sfl_list {
+    struct sfl_node *head, *tail;
+    unsigned int size;
+};
+
+struct sfl_node {
+    struct sfix_list *elem;
+    struct sfl_node *next, *prev;
+};
+
+struct sym_list {
+    struct sym_node *head, *tail;
+    unsigned int size;
+};
+
+struct sym_node {
+    struct symbol *elem;
+    struct sym_node *next, *prev;
+};
+
+struct prop_list {
+    struct prop_node *head, *tail;
+    unsigned int size;
+};
+
+struct prop_node {
+    struct property *elem;
+    struct prop_node *next, *prev;
+};
+
+#endif
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 9c9caca5bd5f..9c5327dd6be8 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -129,6 +129,19 @@ struct symbol {
      * "Weak" reverse dependencies through being implied by other symbols
      */
     struct expr_value implied;
+
+    /*
+     * ConfigFix
+     */
+    struct fexpr *fexpr_y;
+    struct fexpr *fexpr_m;
+    struct fexpr *fexpr_sel_y;
+    struct fexpr *fexpr_sel_m;
+    struct pexpr *list_sel_y;
+    struct pexpr *list_sel_m;
+    struct fexpr *noPromptCond;
+    struct fexpr_list *nb_vals; /* used for non-booleans */
+    struct pexpr_list *constraints; /* list of constraints for symbol */
 };
 
 #define for_all_symbols(i, sym) for (i = 0; i < SYMBOL_HASHSIZE; i++) for (sym = symbol_hash[i]; sym; sym = sym->next)
-- 
2.33.0


