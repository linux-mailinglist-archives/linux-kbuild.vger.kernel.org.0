Return-Path: <linux-kbuild+bounces-5667-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D517A2CBA6
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 19:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A624B1883696
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 18:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DE019CD1E;
	Fri,  7 Feb 2025 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lU/EHgnv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7DB19259D;
	Fri,  7 Feb 2025 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953740; cv=none; b=ITfEPtgmMCO+ye/b9eFN4R4d8j2fMmmdcOATguoKCoCgofih+v+3I13Cxj9OH157fVfzjC0NNLS9t77y+Lrto6AHvXkkACqFk79DnpHF+Nici34Sx9DeD+MWUL8svArqeLN9TCs6Lr3HL+HxaXNTEs/6bgCidSsWJvF41FQzFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953740; c=relaxed/simple;
	bh=vLL2/x5Xd0jIBxlSa0RKV1awz+Qu2EmvR9mbuE5+/VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOrcOMsjuqvwRThnpreAhen9JyTIQPKst0VFGX4QITj7YjXh5MM3IbCheK0IslFOsMT0uEpSGjDTt0rAS/RpAuon3J+HJxBC+vgM3S+MzOHQ6wSV1Y3zfW9hdToHjYOzcfsjBMHvn9LsK6OFtr6JHZzYrg3e7MO2n/oJhugWxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lU/EHgnv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93C6C4CED1;
	Fri,  7 Feb 2025 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738953740;
	bh=vLL2/x5Xd0jIBxlSa0RKV1awz+Qu2EmvR9mbuE5+/VQ=;
	h=From:To:Cc:Subject:Date:From;
	b=lU/EHgnv5I6H8usnbQYNKAxUsM/ibmNjM7UzvmoGBB1RU9p3Ww4mZjs6Nq+xrde5s
	 ZjzStGvrVAdKlkMjlOxLglUEvARggZU3r40bcHWzKXHNDOb3hgTeX89+B2+FaG7rJ9
	 5hhzmaduMKTd6PXr/EyvocZm+eOfct311qJrq7wASAjy43unh43C92NFf73xO4mUpu
	 6wZHV6ypcyQZyB+2xGJbWwtdPMT7hMcBeHJPchCK0E8UDAc+TUGl5jMixb4eBvFGDo
	 lMRslavPambFGytHtGFGhRHB7+kBjtqNT8pUbo/pF59uPPQ5E5KmwqVtQC3ONEeJeL
	 BJgWmlygp2/SA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: do not clear SYMBOL_VALID when reading include/config/auto.conf
Date: Sat,  8 Feb 2025 03:41:55 +0900
Message-ID: <20250207184157.497745-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When conf_read_simple() is called with S_DEF_AUTO, it is meant to read
previous symbol values from include/config/auto.conf to determine which
include/config/* files should be touched.

This process should not modify the current symbol status in any way.
However, conf_touch_deps() currently invalidates all symbol values and
recalculates them, which is totally unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 3b55e7a4131d..ac95661a1c9d 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -385,7 +385,7 @@ int conf_read_simple(const char *name, int def)
 
 	def_flags = SYMBOL_DEF << def;
 	for_all_symbols(sym) {
-		sym->flags &= ~(def_flags|SYMBOL_VALID);
+		sym->flags &= ~def_flags;
 		switch (sym->type) {
 		case S_INT:
 		case S_HEX:
@@ -398,7 +398,11 @@ int conf_read_simple(const char *name, int def)
 		}
 	}
 
-	expr_invalidate_all();
+	if (def == S_DEF_USER) {
+		for_all_symbols(sym)
+			sym->flags &= ~SYMBOL_VALID;
+		expr_invalidate_all();
+	}
 
 	while (getline_stripped(&line, &line_asize, in) != -1) {
 		struct menu *choice;
@@ -464,6 +468,9 @@ int conf_read_simple(const char *name, int def)
 		if (conf_set_sym_val(sym, def, def_flags, val))
 			continue;
 
+		if (def != S_DEF_USER)
+			continue;
+
 		/*
 		 * If this is a choice member, give it the highest priority.
 		 * If conflicting CONFIG options are given from an input file,
@@ -967,10 +974,8 @@ static int conf_touch_deps(void)
 	depfile_path[depfile_prefix_len] = 0;
 
 	conf_read_simple(name, S_DEF_AUTO);
-	sym_calc_value(modules_sym);
 
 	for_all_symbols(sym) {
-		sym_calc_value(sym);
 		if (sym_is_choice(sym))
 			continue;
 		if (sym->flags & SYMBOL_WRITE) {
@@ -1084,12 +1089,12 @@ int conf_write_autoconf(int overwrite)
 	if (ret)
 		return -1;
 
-	if (conf_touch_deps())
-		return 1;
-
 	for_all_symbols(sym)
 		sym_calc_value(sym);
 
+	if (conf_touch_deps())
+		return 1;
+
 	ret = __conf_write_autoconf(conf_get_autoheader_name(),
 				    print_symbol_for_c,
 				    &comment_style_c);
-- 
2.43.0


