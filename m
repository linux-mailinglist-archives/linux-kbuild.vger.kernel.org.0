Return-Path: <linux-kbuild+bounces-5452-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1901A0BB5D
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54603AE6F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A66423C6E2;
	Mon, 13 Jan 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lH/jUXYq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0285F23A574;
	Mon, 13 Jan 2025 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780587; cv=none; b=NDHaa2J+3dTJaFkOgiV7wUZOH/HRVqSX14You551DkVP9JgUWJ/ubEu4rc/54Z9I1pLh2YL/aFQmRPsvhTxix1ze1HloWoDDk0aqkxEs8WgOQ+RGyl9kJ+ixe0rWS/PaUl0bBbG8NR8AGyVxfrmVIeiiS+tmMMbw9u14oPJWJNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780587; c=relaxed/simple;
	bh=zGI68vhJO21Srfxst1zXsYQ6BW+4ZHnev/oN1irG8uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGpUtEbWSL9mAORGT6+T41vqaIX2hsQSuXKUqrk1WsbUAzbhAeC3unPHIYsQPyhNbx6nRdk2Bi/76yzbnLupwp9+i+XLqVFwphyh8JwECN5bfmDogI4VfJiXAbwxUNWzqGka7ele5CKGgxboVIjT7ohnOkXpVvuHs4xUbv0KajE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lH/jUXYq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2204FC4CEE2;
	Mon, 13 Jan 2025 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780586;
	bh=zGI68vhJO21Srfxst1zXsYQ6BW+4ZHnev/oN1irG8uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lH/jUXYqmH8ZKb1n/Aw11p/idXzeYHlV6QFUb2+Hd/8ma2lNv1USa0w4OBU0Ig1zO
	 oQsu7RDV6nV09atjtgofArivwqHiTMvNoKrM8MeJSUnvU4Jd99rVS4+PASaW+i7b/S
	 7ZbjsGcbgfb+Pb6yUS/Ivmf0d4HdyJz+vsr6TIGfKJcRaeL7nSGMErW4ZUvR08Eb3b
	 dYaU1WFRqeWNfi/ESqWc7jRwMus5qXaM/Qfyfe4okqqsmSL+jF/+GyuLnlE61PYLR5
	 z7yoILw1UJb4XIe850oAMI0/Xc5F0pmxNvtZ5Ss3vGlSZaWIiceFYPJutjXBYAghuM
	 8d98Kn7CvFBQQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/17] genksyms: fix 6 shift/reduce conflicts and 5 reduce/reduce conflicts
Date: Tue, 14 Jan 2025 00:00:42 +0900
Message-ID: <20250113150253.3097820-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113150253.3097820-1-masahiroy@kernel.org>
References: <20250113150253.3097820-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The genksyms parser has ambiguities in its grammar, which are currently
suppressed by a workaround in scripts/genksyms/Makefile.

Building genksyms with W=1 generates the following warnings:

    YACC    scripts/genksyms/parse.tab.[ch]
  scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
  scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
  scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

The comment in the parser describes the current problem:

    /* This wasn't really a typedef name but an identifier that
       shadows one.  */

Consider the following simple C code:

    typedef int foo;
    void my_func(foo foo) {}

In the function parameter list (foo foo), the first 'foo' is a type
specifier (typedef'ed as 'int'), while the second 'foo' is an identifier.

However, the lexer cannot distinguish between the two. Since 'foo' is
already typedef'ed, the lexer returns TYPE for both instances, instead
of returning IDENT for the second one.

To support shadowed identifiers, IDENT can be reduced to either a
simple_type_specifier or a direct_abstract_declarator, which creates
a grammatical ambiguity.

Without analyzing the grammar context, it is very difficult to resolve
this correctly.

This commit introduces a flag, dont_want_type_specifier, which allows
the parser to inform the lexer whether an identifier is expected. When
dont_want_type_specifier is true, the type lookup is suppressed, and
the lexer returns IDENT regardless of any preceding typedef.

After this commit, only 3 shift/reduce conflicts will remain.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/genksyms.h |  3 +++
 scripts/genksyms/lex.l      |  9 ++++++++-
 scripts/genksyms/parse.y    | 37 +++++++++++++++----------------------
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/scripts/genksyms/genksyms.h b/scripts/genksyms/genksyms.h
index 8c45ada59ece..0c355075f0e6 100644
--- a/scripts/genksyms/genksyms.h
+++ b/scripts/genksyms/genksyms.h
@@ -12,6 +12,7 @@
 #ifndef MODUTILS_GENKSYMS_H
 #define MODUTILS_GENKSYMS_H 1
 
+#include <stdbool.h>
 #include <stdio.h>
 
 #include <list_types.h>
@@ -66,6 +67,8 @@ struct string_list *copy_list_range(struct string_list *start,
 int yylex(void);
 int yyparse(void);
 
+extern bool dont_want_type_specifier;
+
 void error_with_pos(const char *, ...) __attribute__ ((format(printf, 1, 2)));
 
 /*----------------------------------------------------------------------*/
diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index a4d7495eaf75..e886133af578 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -12,6 +12,7 @@
 %{
 
 #include <limits.h>
+#include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>
 #include <ctype.h>
@@ -113,6 +114,12 @@ MC_TOKEN		([~%^&*+=|<>/-]=)|(&&)|("||")|(->)|(<<)|(>>)
 /* The second stage lexer.  Here we incorporate knowledge of the state
    of the parser to tailor the tokens that are returned.  */
 
+/*
+ * The lexer cannot distinguish whether a typedef'ed string is a TYPE or an
+ * IDENT. We need a hint from the parser to handle this accurately.
+ */
+bool dont_want_type_specifier;
+
 int
 yylex(void)
 {
@@ -207,7 +214,7 @@ repeat:
 		    goto repeat;
 		  }
 	      }
-	    if (!suppress_type_lookup)
+	    if (!suppress_type_lookup && !dont_want_type_specifier)
 	      {
 		if (find_symbol(yytext, SYM_TYPEDEF, 1))
 		  token = TYPE;
diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 20cb3db7f149..dc575d467bbf 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -12,6 +12,7 @@
 %{
 
 #include <assert.h>
+#include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>
 #include "genksyms.h"
@@ -148,6 +149,7 @@ simple_declaration:
 		    current_name = NULL;
 		  }
 		  $$ = $3;
+		  dont_want_type_specifier = false;
 		}
 	;
 
@@ -169,6 +171,7 @@ init_declarator_list:
 			     is_typedef ? SYM_TYPEDEF : SYM_NORMAL, decl, is_extern);
 		  current_name = NULL;
 		  $$ = $1;
+		  dont_want_type_specifier = true;
 		}
 	| init_declarator_list ',' init_declarator
 		{ struct string_list *decl = *$3;
@@ -184,6 +187,7 @@ init_declarator_list:
 			     is_typedef ? SYM_TYPEDEF : SYM_NORMAL, decl, is_extern);
 		  current_name = NULL;
 		  $$ = $3;
+		  dont_want_type_specifier = true;
 		}
 	;
 
@@ -210,7 +214,7 @@ decl_specifier:
 		  remove_node($1);
 		  $$ = $1;
 		}
-	| type_specifier
+	| type_specifier	{ dont_want_type_specifier = true; $$ = $1; }
 	| type_qualifier
 	;
 
@@ -307,15 +311,7 @@ direct_declarator:
 		    current_name = (*$1)->string;
 		    $$ = $1;
 		  }
-		}
-	| TYPE
-		{ if (current_name != NULL) {
-		    error_with_pos("unexpected second declaration name");
-		    YYERROR;
-		  } else {
-		    current_name = (*$1)->string;
-		    $$ = $1;
-		  }
+		  dont_want_type_specifier = false;
 		}
 	| direct_declarator '(' parameter_declaration_clause ')'
 		{ $$ = $4; }
@@ -335,8 +331,7 @@ nested_declarator:
 	;
 
 direct_nested_declarator:
-	IDENT
-	| TYPE
+	IDENT	{ $$ = $1; dont_want_type_specifier = false; }
 	| direct_nested_declarator '(' parameter_declaration_clause ')'
 		{ $$ = $4; }
 	| direct_nested_declarator '(' error ')'
@@ -362,8 +357,9 @@ parameter_declaration_list_opt:
 
 parameter_declaration_list:
 	parameter_declaration
+		{ $$ = $1; dont_want_type_specifier = false; }
 	| parameter_declaration_list ',' parameter_declaration
-		{ $$ = $3; }
+		{ $$ = $3; dont_want_type_specifier = false; }
 	;
 
 parameter_declaration:
@@ -375,6 +371,7 @@ abstract_declarator:
 	ptr_operator abstract_declarator
 		{ $$ = $2 ? $2 : $1; }
 	| direct_abstract_declarator
+		{ $$ = $1; dont_want_type_specifier = false; }
 	;
 
 direct_abstract_declarator:
@@ -385,12 +382,6 @@ direct_abstract_declarator:
 		  remove_node($1);
 		  $$ = $1;
 		}
-	/* This wasn't really a typedef name but an identifier that
-	   shadows one.  */
-	| TYPE
-		{ remove_node($1);
-		  $$ = $1;
-		}
 	| direct_abstract_declarator '(' parameter_declaration_clause ')'
 		{ $$ = $4; }
 	| direct_abstract_declarator '(' error ')'
@@ -440,9 +431,9 @@ member_specification:
 
 member_declaration:
 	decl_specifier_seq_opt member_declarator_list_opt ';'
-		{ $$ = $3; }
+		{ $$ = $3; dont_want_type_specifier = false; }
 	| error ';'
-		{ $$ = $2; }
+		{ $$ = $2; dont_want_type_specifier = false; }
 	;
 
 member_declarator_list_opt:
@@ -452,7 +443,9 @@ member_declarator_list_opt:
 
 member_declarator_list:
 	member_declarator
-	| member_declarator_list ',' member_declarator	{ $$ = $3; }
+		{ $$ = $1; dont_want_type_specifier = true; }
+	| member_declarator_list ',' member_declarator
+		{ $$ = $3; dont_want_type_specifier = true; }
 	;
 
 member_declarator:
-- 
2.43.0


