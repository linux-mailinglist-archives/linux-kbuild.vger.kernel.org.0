Return-Path: <linux-kbuild+bounces-3477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08718970799
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 14:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5594282187
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 12:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A871684A8;
	Sun,  8 Sep 2024 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4dJJvK+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F20316849C;
	Sun,  8 Sep 2024 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725799452; cv=none; b=VXWgu6ntcdSkNWhMQv1TVAY0QCOcCe43aes4hk5fUGn9hAyGYnLzbmFL7Qav0ijtRmBKOTHjTyRMn1rqUgIiaxaC/SoKmi/L925qEy5CuA68R/REGbIqM3r4QmkkHtnpmRzQr/1KC8ZFYsNGb1sYD41rvTA1RD5Cv/gNWVLYBWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725799452; c=relaxed/simple;
	bh=frpqPefFBN64WOqQqEzY881Z9/lRotv+26+9hJ0KYc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZrcLjCCg8kwc/0xnFLadRDS/FsQOSeWEzH6Xzp5lwPVTcL53jdpdqnPr3xoxTTGyWSbb6QKWCewbCXPgFcOmfk0Dsb3Mm8hRvaUrFR9RMb1o1I5tnG2Xq7TNl4PY6jHYLRuipAYjSOMywhwctbbvIAR9Vx5fNx3L1lN35IPGo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4dJJvK+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3673BC4CEC8;
	Sun,  8 Sep 2024 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725799452;
	bh=frpqPefFBN64WOqQqEzY881Z9/lRotv+26+9hJ0KYc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4dJJvK+oGGaSp8r1ejylQoqHkC/rhLtpgeMP/SSG8hhKpyeYga/fW+UOOuolDvky
	 byT7M8oUkFkgTVpAw4ndfRFUcxdqyCQ+EoMhW3lonoaD2XPkYcMrkHiFyeaxI5Uasj
	 OVkvku+6lSn2myNMlEfnJOP1amn0sXoj+7DwYUea3Y3rZ1xuPc0/05OXD2j0/xAnT8
	 d/8VZAb2GwdCoJWLXUHq83tTuKiJXtMjt2AqUaoUfPMU1jeO4I9oua8s6mJFyORdgm
	 UDD9gZmSS3MiNj9BTQzMMSQKJfG2bUsPf7VI90wTe9M3S8qQ/T9oOgQImC/j3B53Mg
	 mCQEduQTuX6hw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 6/6] kconfig: cache expression values
Date: Sun,  8 Sep 2024 21:43:21 +0900
Message-ID: <20240908124352.1828890-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240908124352.1828890-1-masahiroy@kernel.org>
References: <20240908124352.1828890-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache expression values to avoid recalculating them repeatedly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c |  2 ++
 scripts/kconfig/expr.c     | 36 +++++++++++++++++++++++++++++++-----
 scripts/kconfig/expr.h     |  4 ++++
 scripts/kconfig/internal.h |  2 ++
 scripts/kconfig/symbol.c   |  1 +
 5 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index d8849dfb06db..4286d5e7f95d 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -396,6 +396,8 @@ int conf_read_simple(const char *name, int def)
 		}
 	}
 
+	expr_invalidate_all();
+
 	while (getline_stripped(&line, &line_asize, in) != -1) {
 		struct menu *choice;
 
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index b7cfaf1a22e6..78738ef412de 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -21,7 +21,7 @@ HASHTABLE_DEFINE(expr_hashtable, EXPR_HASHSIZE);
 static struct expr *expr_eliminate_yn(struct expr *e);
 
 /**
- * expr_lookup - return the expression for the given type and sub-nodes
+ * expr_lookup - return the expression with the given type and sub-nodes
  * This looks up an expression with the specified type and sub-nodes. If such
  * an expression is found in the hash table, it is returned. Otherwise, a new
  * expression node is allocated and added to the hash table.
@@ -887,7 +887,7 @@ static enum string_value_kind expr_parse_string(const char *str,
 	       ? kind : k_string;
 }
 
-tristate expr_calc_value(struct expr *e)
+static tristate __expr_calc_value(struct expr *e)
 {
 	tristate val1, val2;
 	const char *str1, *str2;
@@ -895,9 +895,6 @@ tristate expr_calc_value(struct expr *e)
 	union string_value lval = {}, rval = {};
 	int res;
 
-	if (!e)
-		return yes;
-
 	switch (e->type) {
 	case E_SYMBOL:
 		sym_calc_value(e->left.sym);
@@ -961,6 +958,35 @@ tristate expr_calc_value(struct expr *e)
 	}
 }
 
+/**
+ * expr_calc_value - return the tristate value of the given expression
+ * @e: expression
+ * return: tristate value of the expression
+ */
+tristate expr_calc_value(struct expr *e)
+{
+	if (!e)
+		return yes;
+
+	if (!e->val_is_valid) {
+		e->val = __expr_calc_value(e);
+		e->val_is_valid = true;
+	}
+
+	return e->val;
+}
+
+/**
+ * expr_invalidate_all - invalidate all cached expression values
+ */
+void expr_invalidate_all(void)
+{
+	struct expr *e;
+
+	hash_for_each(expr_hashtable, e, node)
+		e->val_is_valid = false;
+}
+
 static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 {
 	if (t1 == t2)
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index a398b2b2dbe0..21578dcd4292 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -39,12 +39,16 @@ union expr_data {
  *
  * @node:  link node for the hash table
  * @type:  expressoin type
+ * @val: calculated tristate value
+ * @val_is_valid: indicate whether the value is valid
  * @left:  left node
  * @right: right node
  */
 struct expr {
 	struct hlist_node node;
 	enum expr_type type;
+	tristate val;
+	bool val_is_valid;
 	union expr_data left, right;
 };
 
diff --git a/scripts/kconfig/internal.h b/scripts/kconfig/internal.h
index 84c2ea0389fd..d0ffce2dfbba 100644
--- a/scripts/kconfig/internal.h
+++ b/scripts/kconfig/internal.h
@@ -15,6 +15,8 @@ extern HASHTABLE_DECLARE(sym_hashtable, SYMBOL_HASHSIZE);
 
 extern HASHTABLE_DECLARE(expr_hashtable, EXPR_HASHSIZE);
 
+void expr_invalidate_all(void);
+
 struct menu;
 
 extern struct menu *current_menu, *current_entry;
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 6243f0143ecf..a3af93aaaf32 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -519,6 +519,7 @@ void sym_clear_all_valid(void)
 
 	for_all_symbols(sym)
 		sym->flags &= ~SYMBOL_VALID;
+	expr_invalidate_all();
 	conf_set_changed(true);
 	sym_calc_value(modules_sym);
 }
-- 
2.43.0


