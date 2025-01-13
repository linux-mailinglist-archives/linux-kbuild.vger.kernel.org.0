Return-Path: <linux-kbuild+bounces-5462-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C57A0BB78
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C0643A8DE4
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8B33DAC10;
	Mon, 13 Jan 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dB2nawas"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E843DAC0E;
	Mon, 13 Jan 2025 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780601; cv=none; b=HBz5qLa8tdx/FLLag4mo6y1XMmlxujJLLnluWzPZlomUuGxbn6qEGGA08Q82S8iG1TrKvvU06h92/kc5nuVNu6887Y3uFyAuPEYGy3PTGpd1OGhyvt+Iyj+0XN7YGj/fZym7vBIEE/g48smo0/tYnSAvLmNjWwE8VTkMxhskeDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780601; c=relaxed/simple;
	bh=YOebZEpx92Zn2bKInQjvTjR90LO6pMXMhbWNbq0f53g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s69uFkPk5dYhYizgWLKmwUpxUwsHm2XfrjQ+xmgEU1BmzKxoXbG25rFI4QAXjtAuyOLrWr6O0Qarx8ESpbHO0K2l1XWTQIKcgwqYnY51g5YQlNjIlPVgSVKm6NzGdJh2pLpHg/qBFOEdn2GA3/R/Zh1JoaSiIZCv/O7kZ8rGtfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dB2nawas; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FE6C4CEE3;
	Mon, 13 Jan 2025 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780600;
	bh=YOebZEpx92Zn2bKInQjvTjR90LO6pMXMhbWNbq0f53g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dB2nawasMmV+952PagoG4LKbCbqAEwgOrsEp5EbVu6Q4YX85cQAt1HqijcTE1lL7P
	 ryO+K+wVax/gPA48gULD9a0RDqvPtBn4EBlLGwa+Ao8dxa4z5zGW2sABfZRvhPh6bG
	 x0KxNesTgrnmpWG23ZdJUoBO0AR/dNfjw0XBRQP88vUhEzs2PZWYXKKH4n0RAuDdta
	 +P6VRO8u7bZPcSD5tLrUzdk5XZcSlISzc9l28sJ6Ye5NhpFX4x+aWYVWWBPysEE7pF
	 pUgEBQSHjeOW79/MJMmKTCQd13V7PiSLG105MD3qo8Acccmbks3vJEAOtVwFqQWEUT
	 7OUfy746TLsFw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 14/17] genksyms: fix syntax error for attribute after 'struct'
Date: Tue, 14 Jan 2025 00:00:52 +0900
Message-ID: <20250113150253.3097820-15-masahiroy@kernel.org>
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

A longstanding issue with genksyms is that it has hidden syntax errors.

When a syntax error occurs, yyerror() is called. However,
error_with_pos() is a no-op unless the -w option is provided.

You can observe syntax errors by manually passing the -w option.

For example, with CONFIG_MODVERSIONS=y on v6.13-rc1:

    $ make -s KCFLAGS=-D__GENKSYMS__ arch/x86/kernel/cpu/mshyperv.i
    $ cat arch/x86/kernel/cpu/mshyperv.i | scripts/genksyms/genksyms -w
        [ snip ]
    ./arch/x86/include/asm/svm.h:122: syntax error

The syntax error occurs in the following code in arch/x86/include/asm/svm.h:

    struct __attribute__ ((__packed__)) vmcb_control_area {
            [ snip ]
    };

The issue arises from __attribute__ immediately after the 'struct'
keyword.

This commit allows the 'struct' keyword to be followed by attributes.

The lexer must be adjusted because dont_want_brace_phase should not be
decremented while processing attributes.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/lex.l   |  7 ++++++-
 scripts/genksyms/parse.y | 10 +++++-----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index e886133af578..a1f969dcf24f 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -438,7 +438,12 @@ fini:
 
   if (suppress_type_lookup > 0)
     --suppress_type_lookup;
-  if (dont_want_brace_phrase > 0)
+
+  /*
+   *  __attribute__() can be placed immediately after the 'struct' keyword.
+   *  e.g.) struct __attribute__((__packed__)) foo { ... };
+   */
+  if (token != ATTRIBUTE_PHRASE && dont_want_brace_phrase > 0)
     --dont_want_brace_phrase;
 
   yylval = &next_node->next;
diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 82774df50642..33639232a709 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -234,16 +234,16 @@ type_specifier:
 
 	/* References to s/u/e's defined elsewhere.  Rearrange things
 	   so that it is easier to expand the definition fully later.  */
-	| STRUCT_KEYW IDENT
-		{ remove_node($1); (*$2)->tag = SYM_STRUCT; $$ = $2; }
+	| STRUCT_KEYW attribute_opt IDENT
+		{ remove_node($1); (*$3)->tag = SYM_STRUCT; $$ = $3; }
 	| UNION_KEYW IDENT
 		{ remove_node($1); (*$2)->tag = SYM_UNION; $$ = $2; }
 	| ENUM_KEYW IDENT
 		{ remove_node($1); (*$2)->tag = SYM_ENUM; $$ = $2; }
 
 	/* Full definitions of an s/u/e.  Record it.  */
-	| STRUCT_KEYW IDENT class_body
-		{ record_compound($1, $2, $3, SYM_STRUCT); $$ = $3; }
+	| STRUCT_KEYW attribute_opt IDENT class_body
+		{ record_compound($1, $3, $4, SYM_STRUCT); $$ = $4; }
 	| UNION_KEYW IDENT class_body
 		{ record_compound($1, $2, $3, SYM_UNION); $$ = $3; }
 	| ENUM_KEYW IDENT enum_body
@@ -254,7 +254,7 @@ type_specifier:
 	| ENUM_KEYW enum_body
 		{ add_symbol(NULL, SYM_ENUM, NULL, 0); $$ = $2; }
 	/* Anonymous s/u definitions.  Nothing needs doing.  */
-	| STRUCT_KEYW class_body			{ $$ = $2; }
+	| STRUCT_KEYW attribute_opt class_body		{ $$ = $3; }
 	| UNION_KEYW class_body				{ $$ = $2; }
 	;
 
-- 
2.43.0


