Return-Path: <linux-kbuild+bounces-5449-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF31A0BB57
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBAF03ABC24
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE759233531;
	Mon, 13 Jan 2025 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdh+OAZj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EA2233526;
	Mon, 13 Jan 2025 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780583; cv=none; b=LDa7dXw4UUvoVb+Iw9Can4W7J1g+OgHsanScYaJEtFCLgCx04enR2+yh9B8+PtsSIIvtV43Q2oP5+fE7pOTPR+LcDap7Q79p05tKWdbhwOmrd4PqP34SCpQRcmTh+pIpq8r08WnLvXRmHYGszG1IAENCpTTzb9ChtmEcEntSx9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780583; c=relaxed/simple;
	bh=ZWUl1EW6V5uS0plPjwVRpm99BGxULSuZis64ZLyce9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcIjazTSzhhlCSjmitn2NyLiBWnDNPHVri1jtfLO2suvlFuzWR+vkW7/e0yXUArhokdNJNkl75kxDdoI6YOJP4q7hf/hNujJbiNVUiB+mW8Cym9GspdxWCK6QafvmiFGgvVukeprxw/fljTUZRQhoGQpS6AWP3KgT0f1BWEyZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdh+OAZj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C72DC4CEE2;
	Mon, 13 Jan 2025 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780583;
	bh=ZWUl1EW6V5uS0plPjwVRpm99BGxULSuZis64ZLyce9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rdh+OAZjqDj/AHyZQJq6T3zB/NWIEBg17+3IQD4x7BNmrA2zx1v49a0Jza4Mdnna8
	 h8vKgMn941PUNUWzAsI8pbFszD3ArqkQplYOqfSXJznkGb9UeeLlHAuI+gPvm3y698
	 upgqd9F7bGYQyNAuUXItzSugOZoE3OzyJFMaumMEfRPNxZWZmB8eBE0T16dG0gttJz
	 DjwZ4XX0EpS+tC+/pqGjMgWctGiy7ZFsiAnzF1AiMXeu9j/MlkLISFXmwz3oXsKwVD
	 /B9V6uxfXs2LwirD8aMHaIdCnFAwm48AIjWY25JXQAXBT1yDl1dWGAyu29pSsWJl13
	 uTFJU8+aEXLmA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 01/17] genksyms: rename m_abstract_declarator to abstract_declarator
Date: Tue, 14 Jan 2025 00:00:39 +0900
Message-ID: <20250113150253.3097820-2-masahiroy@kernel.org>
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

This is called "abstract-declarator" in K&R. [1]

I am not sure what "m_" stands for, but the name is clear enough
without it.

No functional changes are intended.

[1] https://cs.wmich.edu/~gupta/teaching/cs4850/sumII06/The%20syntax%20of%20C%20in%20Backus-Naur%20form.htm

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 689cb6bb40b6..02f2f713ec5a 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -367,17 +367,17 @@ parameter_declaration_list:
 	;
 
 parameter_declaration:
-	decl_specifier_seq m_abstract_declarator
+	decl_specifier_seq abstract_declarator
 		{ $$ = $2 ? $2 : $1; }
 	;
 
-m_abstract_declarator:
-	ptr_operator m_abstract_declarator
+abstract_declarator:
+	ptr_operator abstract_declarator
 		{ $$ = $2 ? $2 : $1; }
-	| direct_m_abstract_declarator
+	| direct_abstract_declarator
 	;
 
-direct_m_abstract_declarator:
+direct_abstract_declarator:
 	/* empty */					{ $$ = NULL; }
 	| IDENT
 		{ /* For version 2 checksums, we don't want to remember
@@ -391,13 +391,13 @@ direct_m_abstract_declarator:
 		{ remove_node($1);
 		  $$ = $1;
 		}
-	| direct_m_abstract_declarator '(' parameter_declaration_clause ')'
+	| direct_abstract_declarator '(' parameter_declaration_clause ')'
 		{ $$ = $4; }
-	| direct_m_abstract_declarator '(' error ')'
+	| direct_abstract_declarator '(' error ')'
 		{ $$ = $4; }
-	| direct_m_abstract_declarator BRACKET_PHRASE
+	| direct_abstract_declarator BRACKET_PHRASE
 		{ $$ = $2; }
-	| '(' m_abstract_declarator ')'
+	| '(' abstract_declarator ')'
 		{ $$ = $3; }
 	| '(' error ')'
 		{ $$ = $3; }
-- 
2.43.0


