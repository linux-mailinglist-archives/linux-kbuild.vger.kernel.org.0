Return-Path: <linux-kbuild+bounces-2452-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5443792CB60
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B22BF1F23A39
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3D582C60;
	Wed, 10 Jul 2024 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5Yk/8zh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F8824BD;
	Wed, 10 Jul 2024 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594478; cv=none; b=uAFBgIN8rCct1Ncg/0X1igRBR0DbWG4q6lbkoz7eAqT89VYfhRJXHOaFwOp7vziURZYk5syDC1zcEeQ+wLqx9pmKeiagLe4n9yVphu/cRyIerKjhEdt2Qw8hgwVt8sgcatm9ETBBQD4xM/UK4ic+HaGhFepKXlaXHCKb58BlTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594478; c=relaxed/simple;
	bh=bqUninuJnSREPYLEi95eskOkUNq+wVZWO+miJfM2UiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gGHhIos6tXn411BLpxL9fV2XExDUF7nIOwgC7cEOo3EwURFc2EVhobfvUWZKtbdOelAk6BAcCkukiNzj4EFh52Kgk55E1iTJugqAbUvBQIggZGRsiN2PTia0cDYe+d+ku9ZZEdDCl2HO/0NKPAnu2W6pKSE2U9qFFVq3dxfGheI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5Yk/8zh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57d05e0017aso7272839a12.1;
        Tue, 09 Jul 2024 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594475; x=1721199275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FlD8h3AVXPG4R82SaSCyx4edO5dJU5l504xNxGmCc8=;
        b=b5Yk/8zh315HWZAx+YiTSv6WPKHHdGbPWotl1Wd5o3QeLxUvBtr5nnHHGO4WXbCfvq
         IgMprycTtRUYqdDn0/NCFJmjFykweSW4yd3o0CvA316dp49ZWmd2l8gaUliBHS3sYNEv
         RjvIwGqBu9jWN82pG3Fv4fHPnrP90dEohjQIrNKGqJ7XNtg+97kndQx46xKwmRgaN7gn
         lNavg1Hljz7CLJCUSxlPqqCdgaadZlWAksv/iRMLlNfg5LWxlPpV/CWU596ddVJuHjal
         iC2T7329TBgRO8V/BvUGVuAPFM/e/loawfjgq3JmhTn6WZYTQEClidtKoijfmr0O+1dB
         yLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594475; x=1721199275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FlD8h3AVXPG4R82SaSCyx4edO5dJU5l504xNxGmCc8=;
        b=a6rbllEBdKP3TWFqSOn5oKwW/VRMjRrd5bcOMCrQI3WTGK8yS6Re6QBhqi/MUwu6Cj
         bLsHuvOm7AiwLdHciTpRLsPDTZV+gkDA2bshhoaDD7y37XcJnYSO8OQTmDQ3Nl58Ucoo
         GOWbnFN7wSExQ6fSznkTc6uNo3sT2T0bCHXzf0DIHJRnG4/DAfHu5EKiNjzgIgOXi5BV
         hJoeeEIKZtBTWGbXvihLJPfHqiK2UEv0gTjjc26KXEeJb38/JR8WuCV0JWmwgeuww204
         yeUHV7JTg90uazmcjRAMP0Vcc36xdpV44BGVURlxUZi1wDgCwLLSiOqoYWBGhC74kM2Q
         RU3g==
X-Forwarded-Encrypted: i=1; AJvYcCXH5vZ0aeAa+GcTXeyNM8dUcD4Im3OLQ/bVNwzljd2lpTq1HNSiFwCGTPBm1VUYugmUO/8kxR+RZiL7OGAdvgcLT/rHNrty/zN29W9c
X-Gm-Message-State: AOJu0YwrzhL3FutyWHDI4y3CNjx5MiyRFtpy68JKqNNTJ7J5uKvMhzcb
	0R6Zasj2wa9NUCnhlxufVTLnoaLA580uPfvJW41TFfc6VfJ4Vo3vHvAJIw==
X-Google-Smtp-Source: AGHT+IErGopfUvYe0T07SGul+86pfLEgRtgM6eMTAHfDfPFsKzJYRibM0jDgGH3B4vbchLZ3JBtu2w==
X-Received: by 2002:a05:6402:2cd:b0:58b:abc6:9cec with SMTP id 4fb4d7f45d1cf-594bbe2bb1bmr2344158a12.40.1720594474264;
        Tue, 09 Jul 2024 23:54:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:33 -0700 (PDT)
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
Subject: [PATCH v4 05/12] kconfig: Add definitions
Date: Wed, 10 Jul 2024 08:52:48 +0200
Message-Id: <20240710065255.10338-6-ole0811sch@gmail.com>
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

We need to be able to store constraints for each symbol.
We therefore add several expressions for each such struct which we define
in a header-file.
Finally, we prepare the Makefile.

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
 scripts/kconfig/Makefile  |  13 +-
 scripts/kconfig/cf_defs.h | 287 ++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/expr.h    |  17 +++
 3 files changed, 315 insertions(+), 2 deletions(-)
 create mode 100644 scripts/kconfig/cf_defs.h

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index a0a0be38cbdc..53461b609bd2 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -43,6 +43,7 @@ menuconfig-prog	:= mconf
 nconfig-prog	:= nconf
 gconfig-prog	:= gconf
 xconfig-prog	:= qconf
+cfoutconfig-prog := cfoutconfig
 
 define config_rule
 PHONY += $(1)
@@ -53,7 +54,7 @@ PHONY += build_$(1)
 build_$(1): $(obj)/$($(1)-prog)
 endef
 
-$(foreach c, config menuconfig nconfig gconfig xconfig, $(eval $(call config_rule,$(c))))
+$(foreach c, config menuconfig nconfig gconfig xconfig cfoutconfig, $(eval $(call config_rule,$(c))))
 
 PHONY += localmodconfig localyesconfig
 localyesconfig localmodconfig: $(obj)/conf
@@ -152,6 +153,7 @@ help:
 	@echo  '                    default value without prompting'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  '  cfoutconfig     - Print constraints and DIMACS-output into files'
 	@echo  ''
 	@echo  'Configuration topic targets:'
 	@$(foreach f, $(all-config-fragments), \
@@ -196,10 +198,17 @@ $(foreach f, mconf.o $(lxdialog), \
 $(obj)/mconf: | $(obj)/mconf-libs
 $(addprefix $(obj)/, mconf.o $(lxdialog)): | $(obj)/mconf-cflags
 
+# configfix: Used for the xconfig target as well as for its debugging tools
+hostprogs        += cfoutconfig
+cfconf-objs      := configfix.o cf_constraints.o cf_expr.o cf_rangefix.o cf_utils.o picosat.o
+cfoutconfig-objs := cfoutconfig.o $(common-objs) $(cfconf-objs)
+
+HOSTCFLAGS_picosat.o = -DTRACE -Wno-missing-prototypes -Wno-pointer-compare
+
 # qconf: Used for the xconfig target based on Qt
 hostprogs	+= qconf
 qconf-cxxobjs	:= qconf.o qconf-moc.o
-qconf-objs	:= images.o $(common-objs)
+qconf-objs	:= images.o $(common-objs) $(cfconf-objs)
 
 HOSTLDLIBS_qconf         = $(call read-file, $(obj)/qconf-libs)
 HOSTCXXFLAGS_qconf.o     = -std=c++11 -fPIC $(call read-file, $(obj)/qconf-cflags)
diff --git a/scripts/kconfig/cf_defs.h b/scripts/kconfig/cf_defs.h
new file mode 100644
index 000000000000..8bfff7db5c33
--- /dev/null
+++ b/scripts/kconfig/cf_defs.h
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Patrick Franz <deltaone@debian.org>
+ */
+
+#ifndef DEFS_H
+#define DEFS_H
+
+/* global variables */
+#include <limits.h>
+#include <stdbool.h>
+#include <stddef.h>
+
+#include "lkc.h"
+#include "expr.h"
+
+extern bool CFDEBUG;
+extern bool stop_rangefix;
+
+#define printd(fmt...) do { \
+	if (CFDEBUG) \
+		printf(fmt); \
+} while (0)
+
+/*
+ * For functions that construct nested pexpr expressions.
+ */
+enum pexpr_move {
+	PEXPR_ARG1,	/* put reference to first pexpr */
+	PEXPR_ARG2,	/* put reference to second pexpr */
+	PEXPR_ARGX	/* put all references to pexpr's */
+};
+
+
+/* different types for f_expr */
+enum fexpr_type {
+	FE_SYMBOL,
+	FE_NPC, /* no prompt condition */
+	FE_TRUE,  /* constant of value True */
+	FE_FALSE,  /* constant of value False */
+	FE_NONBOOL,  /* for all non-(boolean/tristate) known values */
+	FE_CHOICE, /* symbols of type choice */
+	FE_SELECT, /* auxiliary variable for selected symbols */
+	FE_TMPSATVAR /* temporary sat-variable (Tseytin) */
+};
+
+/* struct for a propositional logic formula */
+struct fexpr {
+	/* name of the feature expr */
+	struct gstr name;
+
+	/* associated symbol */
+	struct symbol *sym;
+
+	/* integer value for the SAT solver */
+	int satval;
+
+	/* assumption in the last call to PicoSAT */
+	bool assumption;
+
+	/* type of the fexpr */
+	enum fexpr_type type;
+
+	union {
+		/* symbol */
+		struct {
+			tristate tri;
+		};
+		/* EQUALS */
+		struct {
+			struct symbol *eqsym;
+			struct symbol *eqvalue;
+		};
+		/* HEX, INTEGER, STRING */
+		struct {
+			struct gstr nb_val;
+		};
+	};
+
+};
+
+struct fexpr_list {
+	struct fexpr_node *head, *tail;
+	unsigned int size;
+};
+
+struct fexpr_node {
+	struct fexpr *elem;
+	struct fexpr_node *next, *prev;
+};
+
+struct fexl_list {
+	struct fexl_node *head, *tail;
+	unsigned int size;
+};
+
+struct fexl_node {
+	struct fexpr_list *elem;
+	struct fexl_node *next, *prev;
+};
+
+enum pexpr_type {
+	PE_SYMBOL,
+	PE_AND,
+	PE_OR,
+	PE_NOT
+};
+
+union pexpr_data {
+	struct pexpr *pexpr;
+	struct fexpr *fexpr;
+};
+
+/**
+ * struct pexpr - a node in a tree representing a propositional formula
+ * @type: Type of the node
+ * @left: left-hand-side for AND and OR, the unique operand for NOT, and for
+ * SYMBOL it contains the fpexpr.
+ * @right: right-hand-side for AND and OR
+ * @ref_count: Number of calls to pexpr_put() that need to effectuated with this
+ * pexpr for it to get free'd.
+ *
+ * Functions that return new struct pexpr instances (like pexpr_or(),
+ * pexpr_or_share(), pexf(), ...) set @ref_count in a way that accounts for the
+ * new reference that they return (e.g. pexf() will always set it to 1).
+ * Functions with arguments of type ``struct pexpr *`` will generally keep the
+ * reference intact, so that for example
+ * ``e = pexf(sym); not_e = pexpr_not_share(e)`` would require
+ * ``pexpr_put(not_e)`` before not_e can be free'd and additionally
+ * ``pexpr_put(e)`` for e to get free'd. Some functions take an argument of type
+ * ``enum pexpr_move`` which function as a wrapper of sorts that first executes
+ * a function and then pexpr_put's the argument(s) specified by the
+ * ``enum pexpr_move`` argument (e.g. the normal function for OR is
+ * pexpr_or_share() and the wrapper is pexpr_or()).
+ */
+struct pexpr {
+	enum pexpr_type type;
+	union pexpr_data left, right;
+	unsigned int ref_count;
+};
+
+struct pexpr_list {
+	struct pexpr_node *head, *tail;
+	unsigned int size;
+};
+
+struct pexpr_node {
+	struct pexpr *elem;
+	struct pexpr_node *next, *prev;
+};
+
+/**
+ * struct default_map - Map entry from default values to their condition
+ * @val: value of the default property. Not 'owned' by this struct and
+ * therefore shouldn't be free'd.
+ * @e: condition that implies that the symbol assumes the @val. Needs to be
+ * pexpr_put when free'ing.
+ */
+struct default_map {
+	struct fexpr *val;
+	struct pexpr *e;
+};
+
+/**
+ * struct defm_list - Map from values of default properties of a symbol to their
+ * (accumulated) conditions
+ */
+struct defm_list {
+	struct defm_node *head, *tail;
+	unsigned int size;
+};
+
+struct defm_node {
+	struct default_map *elem;
+	struct defm_node *next, *prev;
+};
+
+enum symboldv_type {
+	SDV_BOOLEAN,	/* boolean/tristate */
+	SDV_NONBOOLEAN	/* string/int/hex */
+};
+
+struct symbol_dvalue {
+	struct symbol *sym;
+
+	enum symboldv_type type;
+
+	union {
+		/* boolean/tristate */
+		tristate tri;
+
+		/* string/int/hex */
+		struct gstr nb_val;
+	};
+};
+
+struct sdv_list {
+	struct sdv_node *head, *tail;
+	unsigned int size;
+};
+
+struct sdv_node {
+	struct symbol_dvalue *elem;
+	struct sdv_node *next, *prev;
+};
+
+enum symbolfix_type {
+	SF_BOOLEAN,	/* boolean/tristate */
+	SF_NONBOOLEAN,	/* string/int/hex */
+	SF_DISALLOWED	/* disallowed non-boolean values */
+};
+
+struct symbol_fix {
+	struct symbol *sym;
+
+	enum symbolfix_type type;
+
+	union {
+		/* boolean/tristate */
+		tristate tri;
+
+		/* string/int/hex */
+		struct gstr nb_val;
+
+		/* disallowed non-boolean values */
+		struct gstr disallowed;
+	};
+};
+
+struct sfix_list {
+	struct sfix_node *head, *tail;
+	unsigned int size;
+};
+
+struct sfix_node {
+	struct symbol_fix *elem;
+	struct sfix_node *next, *prev;
+};
+
+struct sfl_list {
+	struct sfl_node *head, *tail;
+	unsigned int size;
+};
+
+struct sfl_node {
+	struct sfix_list *elem;
+	struct sfl_node *next, *prev;
+};
+
+struct sym_list {
+	struct sym_node *head, *tail;
+	unsigned int size;
+};
+
+struct sym_node {
+	struct symbol *elem;
+	struct sym_node *next, *prev;
+};
+
+struct prop_list {
+	struct prop_node *head, *tail;
+	unsigned int size;
+};
+
+struct prop_node {
+	struct property *elem;
+	struct prop_node *next, *prev;
+};
+
+struct constants {
+	struct fexpr *const_false;
+	struct fexpr *const_true;
+	struct fexpr *symbol_yes_fexpr;
+	struct fexpr *symbol_mod_fexpr;
+	struct fexpr *symbol_no_fexpr;
+};
+
+struct cfdata {
+	unsigned int sat_variable_nr;
+	unsigned int tmp_variable_nr;
+	struct fexpr **satmap; // map SAT variables to fexpr
+	size_t satmap_size;
+	struct constants *constants;
+	struct sdv_list *sdv_symbols; // array with conflict-symbols
+};
+
+#endif
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 8849a243b5e7..2582e948f4eb 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -127,6 +127,19 @@ struct symbol {
 	 * "Weak" reverse dependencies through being implied by other symbols
 	 */
 	struct expr_value implied;
+
+	/*
+	 * ConfigFix
+	 */
+	struct fexpr *fexpr_y;
+	struct fexpr *fexpr_m;
+	struct fexpr *fexpr_sel_y;
+	struct fexpr *fexpr_sel_m;
+	struct pexpr *list_sel_y;
+	struct pexpr *list_sel_m;
+	struct fexpr *noPromptCond;
+	struct fexpr_list *nb_vals; /* used for non-booleans */
+	struct pexpr_list *constraints; /* list of constraints for symbol */
 };
 
 #define SYMBOL_CONST      0x0001  /* symbol is const */
@@ -190,6 +203,10 @@ struct property {
 	for (st = sym->prop; st; st = st->next) \
 		if (st->type == (tok))
 #define for_all_defaults(sym, st) for_all_properties(sym, st, P_DEFAULT)
+#define for_all_choices(symbol, child, menu_ptr) \
+	list_for_each_entry(menu_ptr, &(symbol)->menus, link) \
+		for (child = (menu_ptr)->list; child; child = (child)->next) \
+			if ((child)->sym && sym_is_choice_value((child)->sym))
 #define for_all_prompts(sym, st) \
 	for (st = sym->prop; st; st = st->next) \
 		if (st->text)
-- 
2.39.2


