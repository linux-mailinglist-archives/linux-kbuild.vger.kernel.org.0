Return-Path: <linux-kbuild+bounces-2947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46A94EC1B
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 13:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 821371F226BB
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 11:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D7517A585;
	Mon, 12 Aug 2024 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzLml+b5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C1B17997D;
	Mon, 12 Aug 2024 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723463432; cv=none; b=U0pDEvJLmt0hbLcwqYofRLctMVkE5BLJVsT7XmjAZRoI9I671zsAkyvj9JDIGtT2qd4Z2MXlzpiljA/G+lij71rPTFvUI8Qu1pACQY2FES/EXIrywk3YErhu1KYOY4Z99N5jeVCLEjzEOr9ll8GSS52lbw8YQT3LrWFi8IKnBDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723463432; c=relaxed/simple;
	bh=y4ibPbOlrqYtjnVi728m8zHasovW5Iqx52iFRyKrULk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aT58IW5D/ECgCrXZ7B25+ivPY2WTN0xWKpWK0ULdHFmFlXJesTDLMuSZj7hzmWNr3N8d9MKfynP08o5Gt57RWvscPagfBeGY1iBSMjDqQ2QL2f/bBFegDkX3dYVnimV8VXUPGjQyx7eIQVj7n9G+6u3FbOFSgtR8td+PliVeq4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzLml+b5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFCEC4AF15;
	Mon, 12 Aug 2024 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723463431;
	bh=y4ibPbOlrqYtjnVi728m8zHasovW5Iqx52iFRyKrULk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MzLml+b5V9EqV6tYF43XPG6ZXHAiOvHJNcXyZqjwTBg2cAc5pygLlL682pmCbv7Iy
	 b5itAE4cVTwEKlS6M6GQU1hREKTtxI2bHbwgmgWNW2o8IfHnTzWlpSkyXlJDq7zWfn
	 XuY8LyDkdeaXwz+y3hLmP+acds5Yyr1gBEn9lgn7iF0Sn89MDSrjSg44ZFn3NjDdyK
	 kL3+iHWlpyMPBtJMi4Hhow/vPKhHqH0obwMy0YqMjSIOejQFf0QPKalPQQ0XuR01uc
	 +zbdlk3s9FBOLMxUhkyGskqz5NAhREdonsUg/PBMYDyuhEfIkIv+MWzDfkT/nD2h0e
	 jidyV8kx2cg/A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] kconfig: remove P_SYMBOL property
Date: Mon, 12 Aug 2024 20:49:47 +0900
Message-ID: <20240812115023.2101419-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812115023.2101419-1-masahiroy@kernel.org>
References: <20240812115023.2101419-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

P_SYMBOL is a pseudo property that was previously used for data linking
purposes.

It is no longer used except for debug prints. Remove it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.h   | 1 -
 scripts/kconfig/parser.y | 4 ----
 scripts/kconfig/qconf.cc | 1 -
 scripts/kconfig/symbol.c | 2 --
 4 files changed, 8 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 2bc96cd28253..c82d08bbd704 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -168,7 +168,6 @@ enum prop_type {
 	P_SELECT,   /* select BAR */
 	P_IMPLY,    /* imply BAR */
 	P_RANGE,    /* range 7..100 (for a symbol) */
-	P_SYMBOL,   /* where a symbol is defined */
 };
 
 struct property {
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index e03731184840..2d5e5ed56aba 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -707,10 +707,6 @@ static void print_symbol(FILE *out, const struct menu *menu)
 			print_quoted_string(out, prop->text);
 			fputc('\n', out);
 			break;
-		case P_SYMBOL:
-			fputs( "  symbol ", out);
-			fprintf(out, "%s\n", prop->menu->sym->name);
-			break;
 		default:
 			fprintf(out, "  unknown prop %d!\n", prop->type);
 			break;
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 7d239c032b3d..88797d174261 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1094,7 +1094,6 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 		case P_RANGE:
 		case P_COMMENT:
 		case P_IMPLY:
-		case P_SYMBOL:
 			stream << prop_get_type_name(prop->type);
 			stream << ": ";
 			expr_print(prop->expr, expr_print_help,
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 71502abd3b12..d75665f3dfa2 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1321,8 +1321,6 @@ const char *prop_get_type_name(enum prop_type type)
 		return "imply";
 	case P_RANGE:
 		return "range";
-	case P_SYMBOL:
-		return "symbol";
 	case P_UNKNOWN:
 		break;
 	}
-- 
2.43.0


