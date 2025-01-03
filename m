Return-Path: <linux-kbuild+bounces-5330-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5FA004F9
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 08:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A0F1883F4E
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 07:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591731CCB4B;
	Fri,  3 Jan 2025 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpg5Lj5r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08101B87ED;
	Fri,  3 Jan 2025 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889460; cv=none; b=Xonah1157nE8GQHkYDRO3JdyR580xZRrcTZgOmlxpdXantQSEqkyymIBwLb8utSu0NzgTAhdeqf0Yj+09QzGIsvKJTBHrZ4ycTQcgFeY+wjafhdW9+fNmecD8ZyUyenUthhBTa55Smh+4aj02n3OyKAoiMuzuMe5iA0gmQ0nc7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889460; c=relaxed/simple;
	bh=JsaGkekCLjToMuSIlVwobgva6JVGh4RdbrOKVtmuIc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNzF+UilzGYL3EOZ0iSOUoU444obKrI8wCliTFDvycU9M72eZ/xOv8Or1Kxt+sOyC2Sl5yYu5jyOAEfH+ZOuS967fxzNMk/nA1rsMJAbETvXzL3YOqwkLhndQ5Sjxpi2FEdIJI5bUbWkGdCAUPHxiSUmdOEC/EVZjpq14WdUh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpg5Lj5r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E74C4CED7;
	Fri,  3 Jan 2025 07:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735889459;
	bh=JsaGkekCLjToMuSIlVwobgva6JVGh4RdbrOKVtmuIc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fpg5Lj5ribWKyGpbXfB6zdra5coYSLYiSF9NeseAN5IXhzJl1aalymjrPxGqr0GUW
	 W30I89GOIRJCeieU9Xe2rmP1kyZeee64PacoDUWlkj7PjD97zyrC58yn1fCvP3vI6k
	 F9g8A+xHoGJeXsIM/Kiz5GRT6yQKWWQdHY7HRbCehEn3MXmmnIa1EGrb+YJZdxnlho
	 D1KLLGdu+NrXUF6mkyORGWuCismadk8lJBfjEkHsPT+fmaJIwlqFnT1CCe2EtV7BOO
	 C9i3gBQBHMVqPzcdm2lHh1e6I0sjVorIPz7QJp5YZybwkQRVT1tzHWk7CczGGdk/Kf
	 oA3PBhqdeVn5A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/6] genksyms: refactor the return points in the for-loop in __add_symbol()
Date: Fri,  3 Jan 2025 16:30:41 +0900
Message-ID: <20250103073046.2609911-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103073046.2609911-1-masahiroy@kernel.org>
References: <20250103073046.2609911-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_list() must be called before returning from this for-loop.

Swap 'break' and the combination of free_list() and 'return'.

This reduces the code and minimizes the risk of introducing memory
leaks in future changes.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/genksyms.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 5a90acd693f4..41d6cfce0088 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -231,7 +231,7 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 			continue;
 
 		if (is_reference) {
-			/* fall through */ ;
+			break;
 		} else if (sym->type == type && equal_list(sym->defn, defn)) {
 			if (!sym->is_declared && sym->is_override) {
 				print_location();
@@ -239,25 +239,21 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 				fprintf(stderr, " modversion is unchanged\n");
 			}
 			sym->is_declared = 1;
-			free_list(defn, NULL);
-			return sym;
 		} else if (sym->is_declared) {
 			error_with_pos("redefinition of %s", name);
-			free_list(defn, NULL);
-			return sym;
 		} else if (sym->is_override && flag_preserve) {
 			print_location();
 			fprintf(stderr, "ignoring ");
 			print_type_name(type, name);
 			fprintf(stderr, " modversion change\n");
 			sym->is_declared = 1;
-			free_list(defn, NULL);
-			return sym;
 		} else {
 			status = is_unknown_symbol(sym) ?
 					STATUS_DEFINED : STATUS_MODIFIED;
+			break;
 		}
-		break;
+		free_list(defn, NULL);
+		return sym;
 	}
 
 	if (sym) {
-- 
2.43.0


