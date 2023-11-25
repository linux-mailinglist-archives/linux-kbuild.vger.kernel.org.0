Return-Path: <linux-kbuild+bounces-164-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498C7F8C77
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 17:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9D6BB20E89
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 16:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12DE12E7E;
	Sat, 25 Nov 2023 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSTkkAP7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E3512E67
	for <linux-kbuild@vger.kernel.org>; Sat, 25 Nov 2023 16:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1C3C433CA;
	Sat, 25 Nov 2023 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700930167;
	bh=snAd2gXiU18UJUY/4dnU7CGitVyQiD9gCk0F0qZU16g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JSTkkAP710e1BVX6uUzgeCcFCBX0PDgDkZy5hMyswz1EYBTjSm8mIj4yMRyQjdYwC
	 3PMxs4Je5aZwyIR2DiAmDZ0X2gm5WRYXn3ZtqnQFc+/+0oQRcGLv0NTfPp8HCAxLph
	 O3nwMVOoLHf5ZqxhFkrc0tltr8NQISsCsVVt53FvaJDqfA53EnRVbkv+GnEkl/3OLc
	 oCiwJHiUiareSq9JXo+ij0YsvCCM4lLaJB7CElquhrDqkh0gPEdogxW+ASrb10SnG0
	 meLeekLlh+kbPZcIl3q3kyZ6/7JUlNs5qzYlm91d8CJuSziUgdvtjr4Vo4V5rmfcta
	 Tw87XNbUhaI1g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: default to zero if int/hex symbol lacks default property
Date: Sun, 26 Nov 2023 01:35:59 +0900
Message-Id: <20231125163559.824210-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125163559.824210-1-masahiroy@kernel.org>
References: <20231125163559.824210-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a default property is missing in an int or hex symbol, it defaults
to an empty string, which is not a valid symbol value.

It results in a incorrect .config, and can also lead to an infinite
loop in scripting.

Use "0" for int and "0x0" for hex as a default value.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index f7075d148ac7..a5a4f9153eb7 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -338,7 +338,11 @@ void sym_calc_value(struct symbol *sym)
 
 	switch (sym->type) {
 	case S_INT:
+		newval.val = "0";
+		break;
 	case S_HEX:
+		newval.val = "0x0";
+		break;
 	case S_STRING:
 		newval.val = "";
 		break;
@@ -746,14 +750,17 @@ const char *sym_get_string_default(struct symbol *sym)
 		case yes: return "y";
 		}
 	case S_INT:
+		if (!str[0])
+			str = "0";
+		break;
 	case S_HEX:
-		return str;
-	case S_STRING:
-		return str;
-	case S_UNKNOWN:
+		if (!str[0])
+			str = "0x0";
+		break;
+	default:
 		break;
 	}
-	return "";
+	return str;
 }
 
 const char *sym_get_string_value(struct symbol *sym)
-- 
2.40.1


