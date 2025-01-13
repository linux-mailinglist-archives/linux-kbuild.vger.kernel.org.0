Return-Path: <linux-kbuild+bounces-5458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B553A0BB48
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9517188CA93
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0E2246349;
	Mon, 13 Jan 2025 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0/Ben0B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22987246342;
	Mon, 13 Jan 2025 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780595; cv=none; b=N4jx7pd7l2zIUrnF+UrNOzKKmPriKXW+Ieg5uB8UUTgM/Ll8OT8gaGP5FNFx2mLOR9tF+7hIhCJ7tQlQ1ilrYOcZdQ91OYI2vMXkv+Mu2Cuylj/HYjq91oEeqKhwL7ZDn/F2b7QMYg7n2KYYaC7ln0dliJiiMEBuIelxBXAp1HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780595; c=relaxed/simple;
	bh=gl+dkIBbAjpPyPqoYKA51tUTj6PDx8224vetyPM6EYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFxjMHHW1ywXK+Z2/oEi5mPdrpCtbhMIIKWgWy5pY89Yqov2RzAXP5oHeqwr4o5wL3dWYOzSO5LdhxwLl2uAJaYwUeS5mvFKgiHGj/eLVoKbD+MGx6YzmoRp5rk1qINqEiXrNBT/P9l7j9OraF6yyLHndLsThxLhisssyZRhxLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0/Ben0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23829C4CEE3;
	Mon, 13 Jan 2025 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780595;
	bh=gl+dkIBbAjpPyPqoYKA51tUTj6PDx8224vetyPM6EYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0/Ben0BNYE0WEm20vpagdfXDSPMD0TON5peRa0J12hcoikPV7dEBefUogk4XulZY
	 WRFAKIZurFiUUkFBr0isGoDDDkX17OX2hq68j1eTCedau+k5dWP1CrCrV5WRj+ibIa
	 vMeff4LitqfuXTxURHR+TwJLgFl7R9oEvvFp6ekEM4Ww0Y6lyAX3Udf6wzHXND6O03
	 ASbuEfp9syaF1QQ0iRHKPuUBAhmEh1LAIuu/FXmdjdKUj5r2ECiYZelo29jhEK8IXI
	 n8Cg5VshZFXCUveGSXohW3UwuuRYG9C11DMdknSVGY8aFLul3WeiAm7RL5Mm1vY74i
	 +jkF49ue0jK1w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/17] genksyms: decouple ATTRIBUTE_PHRASE from type-qualifier
Date: Tue, 14 Jan 2025 00:00:48 +0900
Message-ID: <20250113150253.3097820-11-masahiroy@kernel.org>
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

The __attribute__ keyword can appear in more contexts than 'const' or
'volatile'.

To avoid grammatical conflicts with future changes, ATTRIBUTE_PHRASE
should not be reduced into type_qualifier.

No functional changes are intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index e3c160046143..cd933a95548d 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -216,6 +216,7 @@ decl_specifier:
 		}
 	| type_specifier	{ dont_want_type_specifier = true; $$ = $1; }
 	| type_qualifier
+	| ATTRIBUTE_PHRASE
 	;
 
 storage_class_specifier:
@@ -285,11 +286,13 @@ type_qualifier_seq_opt:
 
 type_qualifier_seq:
 	type_qualifier
+	| ATTRIBUTE_PHRASE
 	| type_qualifier_seq type_qualifier		{ $$ = $2; }
+	| type_qualifier_seq ATTRIBUTE_PHRASE		{ $$ = $2; }
 	;
 
 type_qualifier:
-	CONST_KEYW | VOLATILE_KEYW | ATTRIBUTE_PHRASE
+	CONST_KEYW | VOLATILE_KEYW
 	| RESTRICT_KEYW
 		{ /* restrict has no effect in prototypes so ignore it */
 		  remove_node($1);
-- 
2.43.0


