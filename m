Return-Path: <linux-kbuild+bounces-5456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 345FEA0BB4C
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C846F16AE42
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE392451C8;
	Mon, 13 Jan 2025 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANQQxS56"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7D23ED6F;
	Mon, 13 Jan 2025 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780592; cv=none; b=sjmgzKRamIT6KVAxOV3Qcw4RZuvq29YVoBHMIc9TzmJNgEiKCNIF+eqvVi+HjQS0idUNYW25wS064SC/5y6nZNTM2+H4cVW2jdGLd9kBXVmMyPktXy07E/qWGCEKE8OM4HNFt621PjiBW8XTy9A97PzD3IeeJqhZRdfF1O01big=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780592; c=relaxed/simple;
	bh=1XEqICoW5bCK9qLPwTMIN712gYss/wBf1UHwd91O+qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmcdPXZYh7SWEvUnv07HBxPxr7QdugL9hteYBO5MgphNx+q0kNZfdOXe6OMCZv3MGqaLSr+ZoLYmPnmQWUwA/fEFbw320dCGugLus0fiki/GBTV+Yr65BqxUE9KtCiv5yeMrTTd3V2ECwpdTDM+X+NEULtumDXHTcrpOrkmdQms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANQQxS56; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7143EC4CEE3;
	Mon, 13 Jan 2025 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780592;
	bh=1XEqICoW5bCK9qLPwTMIN712gYss/wBf1UHwd91O+qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANQQxS565+9aWe0jGHLytm+SW9qQ/i4NSolUnh1H72M5ArGKkxJX+NA/cubVH06d+
	 LOrVPluvrBttzhkTqIRWgeKVIpyCGwOg9grZ+wKZQs8jSlHfzyiwnoo14waa8Z+Z6e
	 3d3O7VFhdnDWSYQcaIF4n2L/gQ5aILs81E2Ep29pCOSatZ5cmehZ0lYN7LuVBt+FJP
	 tuzyVafHn5Ev8xz0r5kzsnnXb+l4i3CIuJYN5zEQIvK1QiHfWklzHYE/GcanCNl9xL
	 d341+N4SHYZXWlQLPGzcAojqq5PnVWiam84+S7JI29iPDcIq+yD1afAvnk6zP9gCaN
	 1pR858N/ztO7g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 08/17] genksyms: restrict direct-declarator to take one parameter-type-list
Date: Tue, 14 Jan 2025 00:00:46 +0900
Message-ID: <20250113150253.3097820-9-masahiroy@kernel.org>
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

Similar to the previous commit, this change makes the parser logic a
little more accurate.

Currently, genksyms accepts the following invalid code:

    struct foo {
            int (*callback)(int)(int)(int);
    };

A direct-declarator should not recursively absorb multiple
( parameter-type-list ) constructs.

In the example above, (*callback) should be followed by at most one
(int).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 03cdd8d53c13..33a6aab53b69 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -331,12 +331,16 @@ nested_declarator:
 	;
 
 direct_nested_declarator:
+	direct_nested_declarator1
+	| direct_nested_declarator1 '(' parameter_declaration_clause ')'
+		{ $$ = $4; }
+	;
+
+direct_nested_declarator1:
 	IDENT	{ $$ = $1; dont_want_type_specifier = false; }
-	| direct_nested_declarator '(' parameter_declaration_clause ')'
+	| direct_nested_declarator1 '(' error ')'
 		{ $$ = $4; }
-	| direct_nested_declarator '(' error ')'
-		{ $$ = $4; }
-	| direct_nested_declarator BRACKET_PHRASE
+	| direct_nested_declarator1 BRACKET_PHRASE
 		{ $$ = $2; }
 	| '(' nested_declarator ')'
 		{ $$ = $3; }
-- 
2.43.0


