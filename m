Return-Path: <linux-kbuild+bounces-53-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA47EFE61
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 08:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16BDF28111D
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 07:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898EF4F8AD;
	Sat, 18 Nov 2023 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjbwH44S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE7120F7
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 07:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B26C433C8;
	Sat, 18 Nov 2023 07:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700294357;
	bh=jauAd/DlIAxGRDHMhsV9eiDiF6QyHtLCAz+l36D7zjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PjbwH44S8XJsybJbgN1uXro8sSssuv0tAW825PLtyijhAG8M7czDA+DWYy0tkE0Nf
	 HHXKNdJn3E0ejeHOTC8pQ8gE5pJjf86hCY2uJTVB/OWyu/SGCjORkJP2iITAViUTZv
	 mYekF/H72wCwzdaf3/RzGh9DqO7hMY6P73YYkRVuNYUf3sBajQsvlKU7ujoc9sI4A4
	 kMwzbSPn/xf63v8TA+if0Xu0f8O+CrwyDl2Ns212Og0+48tyv6CkJ1vi/a+19lLkqf
	 +mOU7YfpRHhm+kwJT7ikG5lOCRPJTHxgdflgisJAjZXabCJO0PvQX36EHw5XKQJiRX
	 PsCS1nbyqmKfg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/6] kconfig: remove unused code for S_DEF_AUTO in conf_read_simple()
Date: Sat, 18 Nov 2023 16:59:08 +0900
Message-Id: <20231118075912.1303509-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118075912.1303509-1-masahiroy@kernel.org>
References: <20231118075912.1303509-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'else' arm here is unreachable in practical use cases.

include/config/auto.conf does not include "# CONFIG_... is not set"
line unless it is manually hacked.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 556b7f087dbb..92e8e37aca4d 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -436,20 +436,15 @@ int conf_read_simple(const char *name, int def)
 			*p++ = 0;
 			if (strncmp(p, "is not set", 10))
 				continue;
-			if (def == S_DEF_USER) {
-				sym = sym_find(line + 2 + strlen(CONFIG_));
-				if (!sym) {
-					if (warn_unknown)
-						conf_warning("unknown symbol: %s",
-							     line + 2 + strlen(CONFIG_));
 
-					conf_set_changed(true);
-					continue;
-				}
-			} else {
-				sym = sym_lookup(line + 2 + strlen(CONFIG_), 0);
-				if (sym->type == S_UNKNOWN)
-					sym->type = S_BOOLEAN;
+			sym = sym_find(line + 2 + strlen(CONFIG_));
+			if (!sym) {
+				if (warn_unknown)
+					conf_warning("unknown symbol: %s",
+						     line + 2 + strlen(CONFIG_));
+
+				conf_set_changed(true);
+				continue;
 			}
 			if (sym->flags & def_flags) {
 				conf_warning("override: reassigning to symbol %s", sym->name);
-- 
2.40.1


