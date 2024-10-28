Return-Path: <linux-kbuild+bounces-4353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5689B23A6
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 04:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15281B21765
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 03:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB88618C908;
	Mon, 28 Oct 2024 03:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii4Xk4EA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42E18BC19;
	Mon, 28 Oct 2024 03:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087414; cv=none; b=cBb0axiADRoYu65ut3RcCctg3k48qhADQRWdHQd+SESbKA8VQJFXNY7E7yDGZzPk6KU1l+CseM7GgyCkMxZIU1LY3vLkdBMYD0LozD/17h/mEbSKYfdNIqMdVsM7SNe6eqWw+aKYUD8N+CtZwSpVPlZrUFNKjKL7zZL8mvjP0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087414; c=relaxed/simple;
	bh=k9Pg0g29CllsjxHSePoTf3woFh0Lh50RyLppmsi4mbs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=db1iG/Ez/MrVl8ThMUYPtlB5AxkxkOoVopBkgqGZiD/pQdSbT7Ru4V2eYTkxOsZjPhTEmekmXWtNRO7Mq0w7CjSk1Uejde2uTZ0S4GUIMYYfo9wiwxE/+BZPotLxlxr3lK+ts3pNp+ZUOMel/5Dg4GcLvWdcFX4emZsYIK+vGB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii4Xk4EA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9aa8895facso623222666b.2;
        Sun, 27 Oct 2024 20:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087410; x=1730692210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq3p/vnBdzkwGfECoynwncxNFavjyfaYTvdBRHdEFOY=;
        b=ii4Xk4EAntOmuxCNicsIBDV7rTXykuiDKivDOzIBYC4YbMNhOY+77LiFuuX/vMUpGP
         L61YGwecFRYjYbGxh5vcUmNyKpZPxUMycSGIUkcrB5FORnJafeTpfdiseagZKt+6Bp3Z
         gh8+ZKbfJjTujUmcRHPatlYjtUHjd85mAVgsHZ2Ynn8uMPKznCRdYi936Gco53dmOdsh
         fo409WEKfaBkdK92QThJ8vYzi0Fbi4gAT8hSyQ5OWZArAxq/kSDrghak+Pij5Jg1lm0k
         mFKdi2IY1GrrQ8bumsTu0SPdlXSzfKjda9P49zthd76gOveZtamxSxPhtsvzPsUqeo3k
         hxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087410; x=1730692210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq3p/vnBdzkwGfECoynwncxNFavjyfaYTvdBRHdEFOY=;
        b=QyFOxOblrRgQZQU5Mh4gEtBsplsp6lgTeb6qhHnRvDip6Bz2e6zHbQvsP7xeU+Ab39
         U/HXXwgCWx4mr30T6RWrg/XshOjWwQZ/aZ5oaUB4lzp5AYSir+788E9/yszCDR5ZHKP7
         MVRKIF8LYrlfd2Eqo46kb/As3HWDqQhJhgU5gOxAIfWDKrNuurDpnKPtEfPiHQMCTH8g
         5gblQxHA2n52ILdUdIEKnaeOyTW4DCN5Ewy7BOQJY22p2t7Lz2MtSBbzAg35JmJFQUaT
         TC1GwB0AskjEtKfm6lR+rFOtgQ8+KISiXUyi990KP99nNqWjp+4MBnVaedyVeHHduVJ7
         qGKw==
X-Forwarded-Encrypted: i=1; AJvYcCVmN20R0LAEovC+ntKG2lyZDOYMHuRxFK9MZ6FtcCKdFF6stZ/L+WDdfsifGbR4DvaTs2VUgze+N0aKEN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcsQ36m5qCjW+cAZR8HyMWiohe0lIF5zZqJ59rBNNKJF1iFIPF
	MilBeYgihk8ifuq3s+shDMfkFzLOw0zUxj3sE/7mhQfnOtk175eKdDN22g==
X-Google-Smtp-Source: AGHT+IGk7wV+gq7Q1uJhb1qerd7i63C9dpb8ao1rJ/tcQKpPzluXl65z7oyHgwadmUCd55wfT3QiDg==
X-Received: by 2002:a17:906:c112:b0:a9a:26c9:ac14 with SMTP id a640c23a62f3a-a9de5d6ed92mr648469466b.1.1730087409736;
        Sun, 27 Oct 2024 20:50:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:78b:e59b:2b0:d2e9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f5932fsm334599366b.168.2024.10.27.20.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:50:09 -0700 (PDT)
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
Subject: [PATCH v6 03/11] kconfig: Add definitions
Date: Mon, 28 Oct 2024 04:49:41 +0100
Message-Id: <20241028034949.95322-4-ole0811sch@gmail.com>
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

We need to be able to store constraints for each symbol. We therefore
add several expressions for each such struct which we define in a
header-file. Finally, we prepare the Makefile.

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
index a0a0be38cbdc..e907713a4a76 100644
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
+	@echo  '  cfoutconfig     - Print constraints and DIMACS-output into files (requires PicoSAT)'
 	@echo  ''
 	@echo  'Configuration topic targets:'
 	@$(foreach f, $(all-config-fragments), \
@@ -196,10 +198,15 @@ $(foreach f, mconf.o $(lxdialog), \
 $(obj)/mconf: | $(obj)/mconf-libs
 $(addprefix $(obj)/, mconf.o $(lxdialog)): | $(obj)/mconf-cflags
 
+# configfix: Used for the xconfig target as well as for its debugging tools
+hostprogs        += cfoutconfig
+cfconf-objs      := configfix.o cf_constraints.o cf_expr.o cf_rangefix.o cf_utils.o picosat_functions.o
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
index 000000000000..4d7c2cac2b24
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
+extern bool stop_rangefix;
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


