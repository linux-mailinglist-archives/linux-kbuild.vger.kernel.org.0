Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14CBC7E4EDA
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 03:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjKHC1U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Nov 2023 21:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjKHC1T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2023 21:27:19 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C5F181
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Nov 2023 18:27:17 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81e9981ff4so6469855276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2023 18:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699410437; x=1700015237; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHBKDxSX6sFdE8FPheIQIj/jS3pVY6NCDTnh174u1ns=;
        b=Mvbz1nb065Anmbikm7daaqWVTzheA4ephiWXwl4Zac/i2NScQ8T0B+/hk1KTlNu0Ti
         K+fU3oPsQxmOJFVBDJGXIyqPmvFsj+eJ6ysMi22WI3amFuEiRQfvfClMaCSyBFbkOBOT
         SYDQe3ztJnpQbBj6W33j6JIyQliro8Kpy+cLVw2uBDlEmYb5pCro/1sKoStrI12Ygft6
         hgAJFDmaE2XVvR+uWVLfJOfBN+Aw15KmQaq0lElGQ6UfY/FzyUPq0uy24tRYXcSA1wpL
         sW9km68FQyLBq+xx1wqXVSxnGOeL92zDoltUWARgo59EbQzgR3LXl3Rsdnn/XTvdOLvL
         NMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699410437; x=1700015237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHBKDxSX6sFdE8FPheIQIj/jS3pVY6NCDTnh174u1ns=;
        b=JmP/aPynbWfISc2lCRqx4o/WWSrl7Q6v6pRBKq5hH7ouCb5Bf4lfw9+pqh/XSofA9k
         CtD0HA+wJ2XDNf2b9j3CpksKbXaEHzVBJZNFdx+FOLGaTDsdtGWIrzrqSkToL3GP1SSp
         Oj90T3sh0KIRp6wcOOIjaDmXjZ9D1tCyCdR698Yb28eILSIZFH2I+cQNkf5o5SPkhUVr
         BDJwR/FOIfH3ZDGDHcb6Fhu1th/AqR4Xlw8OGSTkfvl3pYWoUVryVbummErdh1BRYH/0
         qr0xZo1wS7yubq/GRe92MAuZe7w2C1el5sQL7ojtTwGZlnse01r35WiZWNpy2tpyGQ+A
         CUyg==
X-Gm-Message-State: AOJu0Yz4m//ZAI0AClcz9MDGbOsDV7lXtyN1tvChpTXeCmiqxYsxgObh
        tpMsbZpu7hrlWnfQ1Lqqkzt1vIKSxoJ8
X-Google-Smtp-Source: AGHT+IEd4YppkzLvzHVgzMv4K4Im8NsnUDvSn1GF/un6K4zJP32gBGMx9TOWWIz9Zty7GbdwjtzDJGqCCcKy
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:701:b0:d9a:6007:223a with SMTP id
 k1-20020a056902070100b00d9a6007223amr9307ybt.8.1699410436773; Tue, 07 Nov
 2023 18:27:16 -0800 (PST)
Date:   Wed,  8 Nov 2023 02:26:22 +0000
In-Reply-To: <20231108022651.645950-2-mmaurer@google.com>
Mime-Version: 1.0
References: <20231108022651.645950-2-mmaurer@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108022651.645950-3-mmaurer@google.com>
Subject: [PATCH 1/3] kconfig: Extend expr_depends_symbol to recurse
From:   Matthew Maurer <mmaurer@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adds optional recursion support to expr_depends_symbol. If recurse is
set to true, it will recurse through other defined symbols' dependencies
to determine if the expression hard-depends on the provided argument
through an multi-step dependency.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/kconfig/expr.c | 22 ++++++++++++++++------
 scripts/kconfig/expr.h |  2 +-
 scripts/kconfig/menu.c |  2 +-
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 81ebf8108ca7..9d517b897378 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -876,25 +876,35 @@ int expr_contains_symbol(struct expr *dep, struct symbol *sym)
 	return 0;
 }
 
-bool expr_depends_symbol(struct expr *dep, struct symbol *sym)
+static bool sym_depends_symbol(struct symbol *hay, struct symbol *needle, bool recurse) {
+	if (!hay)
+		return false;
+	if (hay == needle)
+		return true;
+	if (recurse)
+		return expr_depends_symbol(hay->dir_dep.expr, needle, recurse);
+	return false;
+}
+
+bool expr_depends_symbol(struct expr *dep, struct symbol *sym, bool recurse)
 {
 	if (!dep)
 		return false;
 
 	switch (dep->type) {
 	case E_AND:
-		return expr_depends_symbol(dep->left.expr, sym) ||
-		       expr_depends_symbol(dep->right.expr, sym);
+		return expr_depends_symbol(dep->left.expr, sym, recurse) ||
+		       expr_depends_symbol(dep->right.expr, sym, recurse);
 	case E_SYMBOL:
-		return dep->left.sym == sym;
+		return sym_depends_symbol(dep->left.sym, sym, recurse);
 	case E_EQUAL:
-		if (dep->left.sym == sym) {
+		if (sym_depends_symbol(dep->left.sym, sym, recurse)) {
 			if (dep->right.sym == &symbol_yes || dep->right.sym == &symbol_mod)
 				return true;
 		}
 		break;
 	case E_UNEQUAL:
-		if (dep->left.sym == sym) {
+		if (sym_depends_symbol(dep->left.sym, sym, recurse)) {
 			if (dep->right.sym == &symbol_no)
 				return true;
 		}
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 4a9a23b1b7e1..edfe3046d050 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -299,7 +299,7 @@ struct expr *expr_trans_bool(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
 struct expr *expr_transform(struct expr *e);
 int expr_contains_symbol(struct expr *dep, struct symbol *sym);
-bool expr_depends_symbol(struct expr *dep, struct symbol *sym);
+bool expr_depends_symbol(struct expr *dep, struct symbol *sym, bool recurse);
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym);
 
 void expr_fprint(struct expr *e, FILE *out);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 61c442d84aef..d5898cd6aeb8 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -443,7 +443,7 @@ void menu_finalize(struct menu *parent)
 			if (!expr_contains_symbol(dep, sym))
 				/* No dependency, quit */
 				break;
-			if (expr_depends_symbol(dep, sym))
+			if (expr_depends_symbol(dep, sym, false))
 				/* Absolute dependency, put in submenu */
 				goto next;
 
-- 
2.42.0.869.gea05f2083d-goog

