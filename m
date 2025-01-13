Return-Path: <linux-kbuild+bounces-5450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32881A0BB42
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4990516347A
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8E4233549;
	Mon, 13 Jan 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIXutRbi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D2233546;
	Mon, 13 Jan 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780584; cv=none; b=GdC7uLPgkVWgsZOOAZwchMGjq84iOMPkbkU50+6stOBFE/NL3C7Aiv+AeULK0yCmC/s9MKN/rFp0yEHOVXFvwM9UaeLwb5eb6zyQ8MRWJCdsgw24y3yVbA7717SPV7xv/9iwDnhXxf01eImVh8fSMbUFiAfvIzCIqyeeE3oaJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780584; c=relaxed/simple;
	bh=uKOdfFpo12TyfwrgTckET9VqKFMxhOzj2aqUL9MOTu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auGwWVlEL9MX8XC5pOq9bDQMVXMgu1SI1v5CyxyzNqUbLuYRzpdjfbtclAkf8oAC4EDkMzT6OGZLrpOL/dTIK6I3hU3XWlfMu98DQcuPctlGdbWrhiyMrcTmMIRxKG+UpCro105Cwa6tNwGw7sb8QTX2cxFfBDwBYfH/PNks3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIXutRbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3BBC4CEE4;
	Mon, 13 Jan 2025 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780584;
	bh=uKOdfFpo12TyfwrgTckET9VqKFMxhOzj2aqUL9MOTu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qIXutRbiy7bE9KufK7rgNWSgT0eG5R8gkenifcu2A7eCoV8J+KB5XTyfGeavFTaqs
	 lT+9a7rxKfn/6LnktMCfGcTi8qio+8pfxp/k6sH/CJkNWjKlr5CMszRDRMygb/Q2vH
	 QOX8+bUW0zTwoOJSKqMYDiLFewHPXXRjVgxnGVqEaOliezMva0hErmRI4mnXR8OYK0
	 y2yACmcLnILWMeSWuQF1wT+Wh/r8lRxWr+zGRpKVW6jlv9t4NO+HWMTQR5IGwJGYPA
	 MnDxVRXrD9zzFeVX7QSlkR5PQfG4Qpd4hslY40cAPd0dEIFS5IGRIG2uKG236sj2D0
	 rbAqlhJwi5BFg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/17] genksyms: rename cvar_qualifier to type_qualifier
Date: Tue, 14 Jan 2025 00:00:40 +0900
Message-ID: <20250113150253.3097820-3-masahiroy@kernel.org>
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

I believe "cvar" stands for "Const, Volatile, Attribute, or Restrict".

This is called "type-qualifier" in K&R. [1]

Adopt this more generic naming.

No functional changes are intended.

[1] https://cs.wmich.edu/~gupta/teaching/cs4850/sumII06/The%20syntax%20of%20C%20in%20Backus-Naur%20form.htm

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 02f2f713ec5a..8f62b9f0d99c 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -223,7 +223,7 @@ storage_class_specifier:
 
 type_specifier:
 	simple_type_specifier
-	| cvar_qualifier
+	| type_qualifier
 	| TYPEOF_KEYW '(' parameter_declaration ')'
 	| TYPEOF_PHRASE
 
@@ -270,21 +270,21 @@ simple_type_specifier:
 	;
 
 ptr_operator:
-	'*' cvar_qualifier_seq_opt
+	'*' type_qualifier_seq_opt
 		{ $$ = $2 ? $2 : $1; }
 	;
 
-cvar_qualifier_seq_opt:
+type_qualifier_seq_opt:
 	/* empty */					{ $$ = NULL; }
-	| cvar_qualifier_seq
+	| type_qualifier_seq
 	;
 
-cvar_qualifier_seq:
-	cvar_qualifier
-	| cvar_qualifier_seq cvar_qualifier		{ $$ = $2; }
+type_qualifier_seq:
+	type_qualifier
+	| type_qualifier_seq type_qualifier		{ $$ = $2; }
 	;
 
-cvar_qualifier:
+type_qualifier:
 	CONST_KEYW | VOLATILE_KEYW | ATTRIBUTE_PHRASE
 	| RESTRICT_KEYW
 		{ /* restrict has no effect in prototypes so ignore it */
-- 
2.43.0


