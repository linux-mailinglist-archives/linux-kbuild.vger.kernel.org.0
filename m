Return-Path: <linux-kbuild+bounces-7639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881FAE6A51
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0193F16C899
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95B92DECD8;
	Tue, 24 Jun 2025 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlNmiGdR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D822DECD0;
	Tue, 24 Jun 2025 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777660; cv=none; b=RA2qbdA0YU6rmeuMXsTJjBU2xt291gBeKwFgizLACqYXZHS3eoq/s4oNbBppEnxQGhXdI3mSsTOS3BZPd1Im1UjPGZii17CbtHDuiucDziM16uvjqR4d9/RYwmI+Xoff2wU8mDeg8m9yeyYMR+kjdsGebVNAifoaw60KGp4x0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777660; c=relaxed/simple;
	bh=J4hXFCOyqgSrIfSWUJJlcb5yDNssR+ZNvrVMvt1fBXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SG/5KspRuI/h2BUcP5/4xs4k6e6VO1fRzO/Vox6Z/mwcIlgjv7owFFxgPZXUNKJJEfSBXXZ4N6BrJ5TrQYBtEmsOHFlRI0ZfidD/NDnQRLWoZj5d0GSM2goUIOqnOIiAEzkKf863Py/O4HvhPnrXYmz4oUY5hB5aSohy7tnoi3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlNmiGdR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3329C4CEEE;
	Tue, 24 Jun 2025 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777660;
	bh=J4hXFCOyqgSrIfSWUJJlcb5yDNssR+ZNvrVMvt1fBXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AlNmiGdRfS966cBIM5B+oboULDoBS78/y9rBV7yjGZNmjNabMIW5i8R3tELCVxZHK
	 waBQ5zCbj2Gs0ywnm4v2FV9hCPOON8YSYPT6ImEsFezmB75HcPabsPt/vg4Y7AuoLc
	 CF2uT28NTMJcdgSdnLcYz2nki0ObsK+vROftW36YLzG4QHH7l6t34YAaKSCdfKX982
	 Qp9MXDWjQ70LNrWDGLt+WA+mwskZ/EqsK3hR+C641q7Xwg6FkAgu8FyCDI2GWS66Fg
	 WLA/AB7EpQC4fD2F9wVqhVJAxIE6GGaE2QTf+18Btz/DkhDP7fBcRozxadiwxsBdlO
	 PaA8WPDgbo/+w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/66] kconfig: gconf: remove unneeded gtk_tree_view_set_headers_visible() calls
Date: Wed, 25 Jun 2025 00:05:00 +0900
Message-ID: <20250624150645.1107002-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headers are visible by default.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 4b5befa4f685..32e5e9054846 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -189,7 +189,6 @@ static void init_left_tree(void)
 	GtkTreeViewColumn *column;
 
 	gtk_tree_view_set_model(view, model1);
-	gtk_tree_view_set_headers_visible(view, TRUE);
 	gtk_tree_view_set_rules_hint(view, TRUE);
 
 	column = gtk_tree_view_column_new();
@@ -232,7 +231,6 @@ static void init_right_tree(void)
 	gint i;
 
 	gtk_tree_view_set_model(view, model2);
-	gtk_tree_view_set_headers_visible(view, TRUE);
 	gtk_tree_view_set_rules_hint(view, TRUE);
 
 	column = gtk_tree_view_column_new();
-- 
2.43.0


