Return-Path: <linux-kbuild+bounces-5453-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9439A0BB3E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21F0188C67D
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A9723C71A;
	Mon, 13 Jan 2025 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os+r1svb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8909523C715;
	Mon, 13 Jan 2025 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780588; cv=none; b=VQ7zp7u4CXYl/c3lWCkQDgBtMywSXGWXJTRMGjYmmCmijxiIwg9+fb4pNp2OjvzHC4pvPG8bkeOGDjRNca7fMW7ouj4vX0AXvaHpLfvo1NS9Xew6nRpUStwv29wXOS7wRfZE0CdNeacverB6bLwbwsl4srgI+xqcE7Dce1Sdj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780588; c=relaxed/simple;
	bh=H/QgONtgX+DHQUuK5veY4TDv2g+fNHM+DnMwui/0mbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NT+Fl2e0CytX3oXkC2F8uXU8h4aYybDxC9Almri73rZmzdCwQ6tjeelMmc0aR/oo/dzkeNO9NbyyL61iqKmk3+Yl4NfjqJ6N/+nP1G+AfY4EMvBse4e5TvdtiqaOnARUFJJJzF8KimCOo4tdaCHNz7QArgrBf1XV/b6sfIzfmvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os+r1svb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E50C4CED6;
	Mon, 13 Jan 2025 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780588;
	bh=H/QgONtgX+DHQUuK5veY4TDv2g+fNHM+DnMwui/0mbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=os+r1svb+Tg+iVSzdbVEfEP3rlenUKnrjMe+27A31cqwhoBxrCx6/TMEQaKjZWbee
	 QhztbZpH4BOWCWqCwfPdHhejmBl1hArIlda3ndzcnDkL9tIXtB5tuSYKm20h6cxV52
	 2fZV/laIvVcMcGmWJojuvVTYwul1gmFj/bBW1Mhl3BE9oJMGbpvXjD5iKpQwydLiNh
	 IJXKuUSAQvazk6Bp3C/21zQFhtmcRLMeWKFGP1KAcZjj6KdXFwZDs8+1yyAqI5kxww
	 qvqpagDHPSNP/WEsrgXZ1WwpivOEQ5hzVvq4fOpkTMNmVwKYEpwVfGE6shUfwO2bKg
	 x1HAcDsFSGITA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 05/17] genksyms: fix last 3 shift/reduce conflicts
Date: Tue, 14 Jan 2025 00:00:43 +0900
Message-ID: <20250113150253.3097820-6-masahiroy@kernel.org>
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
  scripts/genksyms/parse.y: warning: 3 shift/reduce conflicts [-Wconflicts-sr]
  scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

The ambiguity arises when decl_specifier_seq is followed by '(' because
the following two interpretations are possible:

  - decl_specifier_seq direct_abstract_declarator '(' parameter_declaration_clause ')'
  - decl_specifier_seq '(' abstract_declarator ')'

This issue occurs because the current parser allows an empty string to
be reduced to direct_abstract_declarator, which is incorrect.

K&R [1] explains the correct grammar:

    <parameter-declaration> ::= {<declaration-specifier>}+ <declarator>
                              | {<declaration-specifier>}+ <abstract-declarator>
                              | {<declaration-specifier>}+

    <abstract-declarator> ::= <pointer>
                            | <pointer> <direct-abstract-declarator>
                            | <direct-abstract-declarator>

    <direct-abstract-declarator> ::=  ( <abstract-declarator> )
                                   | {<direct-abstract-declarator>}? [ {<constant-expression>}? ]
                                   | {<direct-abstract-declarator>}? ( {<parameter-type-list>}? )

We need to consider the difference between the following two examples:

[Example 1] ( <abstract-declarator> ) can become <direct-abstract-declarator>

        void my_func(int (foo));

    ... is equivalent to:

        void my_func(int foo);

[Example 2] ( <parameter-type-list> ) can become <direct-abstract-declarator>

        typedef int foo;
        void my_func(int (foo));

    ... is equivalent to:

        void my_func(int (*callback)(int));

Please note that the function declaration is identical in both examples,
but the preceding typedef creates the distinction. I introduced a new
term, open_paren, to enable the type lookup immediately after the '('
token. Without this, we cannot distinguish between [Example 1] and
[Example 2].

With this commit, all conflicts are resolved.

[1]: https://cs.wmich.edu/~gupta/teaching/cs4850/sumII06/The%20syntax%20of%20C%20in%20Backus-Naur%20form.htm

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index dc575d467bbf..fafce939c32f 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -363,35 +363,47 @@ parameter_declaration_list:
 	;
 
 parameter_declaration:
-	decl_specifier_seq abstract_declarator
+	decl_specifier_seq abstract_declarator_opt
 		{ $$ = $2 ? $2 : $1; }
 	;
 
+abstract_declarator_opt:
+	/* empty */				{ $$ = NULL; }
+	| abstract_declarator
+	;
+
 abstract_declarator:
-	ptr_operator abstract_declarator
+	ptr_operator
+	| ptr_operator abstract_declarator
 		{ $$ = $2 ? $2 : $1; }
 	| direct_abstract_declarator
 		{ $$ = $1; dont_want_type_specifier = false; }
 	;
 
 direct_abstract_declarator:
-	/* empty */					{ $$ = NULL; }
-	| IDENT
+	  IDENT
 		{ /* For version 2 checksums, we don't want to remember
 		     private parameter names.  */
 		  remove_node($1);
 		  $$ = $1;
 		}
-	| direct_abstract_declarator '(' parameter_declaration_clause ')'
+	| direct_abstract_declarator open_paren parameter_declaration_clause ')'
 		{ $$ = $4; }
-	| direct_abstract_declarator '(' error ')'
+	| direct_abstract_declarator open_paren error ')'
 		{ $$ = $4; }
 	| direct_abstract_declarator BRACKET_PHRASE
 		{ $$ = $2; }
-	| '(' abstract_declarator ')'
+	| open_paren parameter_declaration_clause ')'
 		{ $$ = $3; }
-	| '(' error ')'
+	| open_paren abstract_declarator ')'
 		{ $$ = $3; }
+	| open_paren error ')'
+		{ $$ = $3; }
+	| BRACKET_PHRASE
+	;
+
+open_paren:
+	'('	{ $$ = $1; dont_want_type_specifier = false; }
 	;
 
 function_definition:
-- 
2.43.0


