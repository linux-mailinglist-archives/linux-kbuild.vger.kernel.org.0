Return-Path: <linux-kbuild+bounces-5678-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B042A2D76B
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 17:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5AB17A2C31
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 16:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73161F3B86;
	Sat,  8 Feb 2025 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2Gru89f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A251F3BAA;
	Sat,  8 Feb 2025 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032844; cv=none; b=GGVU6hfy8X5X4GDZrzmd617Ebvl/ago+YiD/Q7E/XbsURIaOUdboTm+ftXr/c1m57+8qpqLf6MauosOn2/IMI+VLfk4sZZQVmU2CEEIaWK0DNChgDJzTYVqwK7pb61CAdGueFoWnq0CWJ3G1SCtxuAR8bT0T4NwUpfAmX5ybWL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032844; c=relaxed/simple;
	bh=H2KX6Em0lGPKJzxWFEHziMiC/SiUTPwppprNvpBnbuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aLPU/oeRYs1iEyJeBKzsr66bqM0/3h8CzX79aN5qKb5g2ph06pxbkUMn4L5o6472+fmfhcod9iXIWYKCYvn3qgN3EY5HXAhz8Uza7TA5CriIUnImKTjsijkGeUpD+Qk6mFCYutXeXPTOD/jnAwQi2AaLEvEcULZ8egdno13edQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2Gru89f; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7a4b40cc1so100667666b.0;
        Sat, 08 Feb 2025 08:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739032841; x=1739637641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFVg0d0ABZwGR+n77r4ytnStBZWeFm/afUQWqFUjHPo=;
        b=U2Gru89fnjPJo1R/InKRG/eDG8iFR8kNhtmf6dzeOtAU+kV/XXNe2LMAbj8gQpAij5
         AbCUHRTpVs0vjCICTCGCz3vnInTxT2qycIYCtmkEYLG5M8z4G4SVRS02oC5dIeN0bkpI
         Vmk+XIDaEu3cm16RP0G31vepUCXJ5h5O5wVFahmKqvqTSuWq6xgpQfQje9gJdW0kmKd3
         9IDzNAWSUiaO5lzX9frCDkwQd6DHIYunc6Ov2c0ojuFLNEtVmYgxhKU4rqf1Kn3kiRtZ
         L34JQKOy3064vYlfARU0AQE5JUaZfq5Os6OVYHHzRxi7B+E3/5NitTKZYZm/q7xYS+SB
         rccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032841; x=1739637641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFVg0d0ABZwGR+n77r4ytnStBZWeFm/afUQWqFUjHPo=;
        b=LijeuSsrxYIStdSFnILFdifRf+KoLwq8hljW+4DAlEsrAidz6920yeVA3GSYhE8WV0
         12fYghRHWGX37ZlqXyQ4q6j1KnecRS9zvIAfDW+c5u2Lb0Bx8gb31PDr4M6LM64IrlVA
         1oX1vOzW+ookRq2DwoBiCP+QTB40N52s7LxKmk4M3QOi6K+2wMsAjALMkcHpaCSP4ghy
         vBFt6rskBk+bdDIek8OZ4iasdFHX23O3TZ9BSz/Pn+dGTNG1tD6hDaN3PEOyACjk56qN
         X6C64wTW0BCDeGcUhAM/oi3pHyCD0crtCJN/dT+43NHleOVcLk/DuhVlzOiCtlaJ8iRM
         6jnw==
X-Forwarded-Encrypted: i=1; AJvYcCXPpjspyLpxLEkUawzO4TCE7G2B1UUVaEiR5jKTmvBdIbd8aYn1960LRDwQXM/Ixftg/40AZlFgICwdwRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1JJKKD3BfaA797nve4mi/MjER1FEY503lpq005oVHvyVEt8Mo
	dSyJROgmQsQW6ZqPrtd0Gw1oxK0u3Xgi9xMTr19iwjelzr6oUvRcSgYKwg==
X-Gm-Gg: ASbGnctT9NzMfH46Osjg+btQ+jfIXjgpizG6ygtma8dWUkCBi0aZA4LEXr9G72nu52j
	wjqQnFlu6W7q1jLsfO7TOuo9rKS9uHufKDwN9Vo54G7mfSfYFZnpXPu027aYJJxhpFm33LLP86W
	I1SdIlx0qrfywUgogDbnp6MT88apQ/3DDv2G+o2BH3TzR1JeEcmdEWmK1aAb4muhFCBZT/oGHBh
	ntokf8N5HxijxtTKGyh1eRJu2m6YDhZFertTNwxQHcoT1E4m9hXbikotH8qWAUyJn/mrg+Hek2n
	418pkRzBifSZfcMBExVkM/iVngdKWg==
X-Google-Smtp-Source: AGHT+IFopXvS3YWFXMi0y9TbqOmtx26Khed7zURFzfhXM2BWPQvpju1KMLsT0otbH1jMr1+B8O3tYA==
X-Received: by 2002:a17:906:5acb:b0:ab7:b072:8481 with SMTP id a640c23a62f3a-ab7b07285f8mr26676666b.45.1739032840355;
        Sat, 08 Feb 2025 08:40:40 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:e115:64e7:5d6:176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337f3dsm501539166b.139.2025.02.08.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:40:40 -0800 (PST)
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
Subject: [PATCH v7 02/11] kconfig: Add definitions
Date: Sat,  8 Feb 2025 17:39:50 +0100
Message-Id: <20250208163959.3973163-3-ole0811sch@gmail.com>
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

Add structs that are used to store constraints of symbols and prepare
the Makefile.

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
 scripts/kconfig/Makefile  |  11 +-
 scripts/kconfig/cf_defs.h | 391 ++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/expr.h    |  17 ++
 3 files changed, 417 insertions(+), 2 deletions(-)
 create mode 100644 scripts/kconfig/cf_defs.h

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index fb50bd4f4103..db3069c13064 100644
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
@@ -154,6 +155,7 @@ help:
 	@echo  '                    default value without prompting'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  '  cfoutconfig     - Print constraints and DIMACS-output into files (requires PicoSAT)'
 	@echo  ''
 	@echo  'Configuration topic targets:'
 	@$(foreach f, $(all-config-fragments), \
@@ -198,10 +200,15 @@ $(foreach f, mconf.o $(lxdialog), \
 $(obj)/mconf: | $(obj)/mconf-libs
 $(addprefix $(obj)/, mconf.o $(lxdialog)): | $(obj)/mconf-cflags
 
+# configfix: Used for the xconfig target as well as for its debugging tools
+hostprogs        += cfoutconfig
+cfconf-objs      := configfix.o cf_constraints.o cf_expr.o cf_fixgen.o cf_utils.o picosat_functions.o
+cfoutconfig-objs := cfoutconfig.o $(common-objs) $(cfconf-objs)
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
index 000000000000..ab2bd5a5b882
--- /dev/null
+++ b/scripts/kconfig/cf_defs.h
@@ -0,0 +1,391 @@
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
+#include <xalloc.h>
+
+#include "lkc.h"
+#include "expr.h"
+#include "list_types.h"
+
+extern bool CFDEBUG;
+extern bool stop_fixgen;
+
+#define printd(fmt...) do { \
+	if (CFDEBUG) \
+		printf(fmt); \
+} while (0)
+
+/*
+ * Helper macros for use of list.h with type safety.
+ * Lists of type X can then be defined as
+ * `struct X_list {
+ *	struct list_head list;
+ * }`,
+ * which contains the head of the list, and the nodes with the actual elements
+ * are contained in `struct X_node {
+ *	struct X *elem;
+ *	struct list_head node;
+ * }`
+ */
+
+/* macros for internal usage */
+#define __NODE_T(prefix) struct prefix##_node
+#define __LIST_T(prefix) struct prefix##_list
+#define __CF_DEFS_TO_STR2(x) #x
+#define __CF_DEFS_TO_STR(x) __CF_DEFS_TO_STR2(x)
+#define __ASSERT_LIST_PREF(list, prefix)                                       \
+	_Static_assert(__builtin_types_compatible_p(typeof(*list),             \
+						    __LIST_T(prefix)),         \
+		       "Incorrect type of list, should be `" __CF_DEFS_TO_STR( \
+			       __LIST_T(prefix)) " *`")
+#define __ASSERT_NODE_PREF(node, prefix)                                       \
+	_Static_assert(__builtin_types_compatible_p(typeof(*node),             \
+						    __NODE_T(prefix)),         \
+		       "Incorrect type of node, should be `" __CF_DEFS_TO_STR( \
+			       __LIST_T(prefix)) " *`")
+
+/*
+ * CF_ALLOC_NODE - Utility macro for allocating, initializing and returning an
+ * object of a type like struct fexpr_node
+ *
+ * @node_type: type of the object to create a pointer to (e.g. struct fexpr_node)
+ * @el: the value to set field .element to
+ */
+#define CF_ALLOC_NODE(el, prefix)                          \
+	({                                                 \
+		__NODE_T(prefix) *__node_cf_alloc =        \
+			xmalloc(sizeof(*__node_cf_alloc)); \
+		__node_cf_alloc->elem = el;                \
+		INIT_LIST_HEAD(&__node_cf_alloc->node);    \
+		__node_cf_alloc;                           \
+	})
+
+/*
+ * constructs an object using CF_ALLOC_NODE(node_type, el) and then adds to the
+ * end of list->list
+ */
+#define CF_PUSH_BACK(list_, el, prefix)                                    \
+	do {                                                                  \
+		__ASSERT_LIST_PREF(list_, prefix);                            \
+		__NODE_T(prefix) *__cf_emplace_back_node =                    \
+			CF_ALLOC_NODE(el, prefix);                            \
+		list_add_tail(&__cf_emplace_back_node->node, &(list_)->list); \
+	} while (0)
+
+/*
+ * frees all nodes and then list_
+ */
+#define CF_LIST_FREE(list_, prefix)                                      \
+	do {                                                             \
+		__NODE_T(prefix) * __node, *__next;                      \
+		__ASSERT_LIST_PREF(list_, prefix);                       \
+		list_for_each_entry_safe(__node, __next, &(list_)->list, \
+					 node) {                         \
+			list_del(&__node->node);                         \
+			free(__node);                                    \
+		}                                                        \
+		free(list_);                                             \
+	} while (0)
+
+#define __CF_LIST_INIT(full_list_type)                                        \
+	({                                                                    \
+		full_list_type *__cf_list = xmalloc(sizeof(*__cf_list)); \
+		INIT_LIST_HEAD(&__cf_list->list);                             \
+		__cf_list;                                                    \
+	})
+
+#define __CF_DEF_LIST(name, full_list_type) \
+	full_list_type *name = __CF_LIST_INIT(full_list_type)
+
+/*
+ * declares and initializes a list
+ */
+#define CF_DEF_LIST(name, prefix) __CF_DEF_LIST(name, __LIST_T(prefix))
+
+/*
+ * returns initialized a list
+ */
+#define CF_LIST_INIT(prefix) __CF_LIST_INIT(__LIST_T(prefix))
+
+#define CF_LIST_FOR_EACH(node_, list_, prefix)                         \
+	list_for_each_entry(node_, ({                                  \
+				    __ASSERT_LIST_PREF(list_, prefix); \
+				    __ASSERT_NODE_PREF(node_, prefix); \
+				    &(list_)->list;                    \
+			    }),                                        \
+			    node)
+
+#define CF_LIST_COPY(orig, prefix)                         \
+	({                                                 \
+		__CF_DEF_LIST(__ret, typeof(*orig));       \
+		__NODE_T(prefix) * __node;                 \
+		CF_LIST_FOR_EACH(__node, orig, prefix)     \
+		CF_PUSH_BACK(__ret, __node->elem, prefix); \
+		__ret;                                     \
+	})
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
+};
+
+/* struct definitions for lists */
+struct fexpr_node {
+	struct fexpr *elem;
+	struct list_head node;
+};
+
+struct fexpr_list {
+	struct list_head list;
+};
+
+struct fexl_list {
+	struct list_head list;
+};
+
+struct fexl_node {
+	struct fexpr_list *elem;
+	struct list_head node;
+};
+
+struct pexpr_list {
+	struct list_head list;
+};
+
+struct pexpr_node {
+	struct pexpr *elem;
+	struct list_head node;
+};
+
+/**
+ * struct defm_list - Map from values of default properties of a symbol to their
+ * (accumulated) conditions
+ */
+struct defm_list {
+	struct list_head list;
+};
+
+struct defm_node {
+	struct default_map *elem;
+	struct list_head node;
+};
+
+struct sfix_list {
+	struct list_head list;
+};
+
+struct sfix_node {
+	struct symbol_fix *elem;
+	struct list_head node;
+};
+
+struct sfl_list {
+	struct list_head list;
+};
+
+struct sfl_node {
+	struct sfix_list *elem;
+	struct list_head node;
+};
+
+struct sym_list {
+	struct list_head list;
+};
+
+struct sym_node {
+	struct symbol *elem;
+	struct list_head node;
+};
+
+struct prop_list {
+	struct list_head list;
+};
+
+struct prop_node {
+	struct property *elem;
+	struct list_head node;
+};
+
+struct sdv_list {
+	struct list_head list;
+};
+
+struct sdv_node {
+	struct symbol_dvalue *elem;
+	struct list_head node;
+};
+
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
+enum symboldv_type {
+	SDV_BOOLEAN,	/* boolean/tristate */
+	SDV_NONBOOLEAN	/* string/int/hex */
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
index 21578dcd4292..1b5427fe90e5 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -140,6 +140,19 @@ struct symbol {
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
+	struct fexpr_list *nb_vals; /* list of struct fexpr_node's; used for non-booleans */
+	struct pexpr_list *constraints; /* list of constraints for symbol */
 };
 
 #define SYMBOL_CONST      0x0001  /* symbol is const */
@@ -201,6 +214,10 @@ struct property {
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
2.39.5


