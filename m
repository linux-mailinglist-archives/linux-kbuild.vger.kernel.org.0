Return-Path: <linux-kbuild+bounces-7650-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17304AE6A69
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFFBC18989BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC282E2F1F;
	Tue, 24 Jun 2025 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BozZJFMH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C22E2F1C;
	Tue, 24 Jun 2025 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777683; cv=none; b=e1cBvhO+boNYZutW3/Z/oao427z+4TrU/PsigmBrlR6KNfgpIMXbi+LrC91pR9KlLc+SwW6cQaDnyEKY9MRFntsXvUquarQbfn/yjaVYl108kuTj2A7yf2bPdfty6JQOrjFkNZa/ek0zGJXyaJMWmBQQCSDw2ZkRUNFE2pQubOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777683; c=relaxed/simple;
	bh=KlL9W2ov30wUEU9PFO719dWCIY+6KkZeRfGU12+ns2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRv2SCxdUyKdOSGpCgC+nHTZHiybMm60qwxUqaVhHlVRa2eCaKR9UldJfORCDMfTcOYSoplAjYj4Xx2WuhZS2xEknYgOEUqvhVb1zyJ4MEoObTcAUQR1XKPvSYn60LXs61Qhk7lQa1vjQ8/o17H1ft4qusXyLNfcF3FqMEBARkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BozZJFMH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5551C4CEE3;
	Tue, 24 Jun 2025 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777682;
	bh=KlL9W2ov30wUEU9PFO719dWCIY+6KkZeRfGU12+ns2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BozZJFMHZQcVNl5vQdsPpiFpCYlyV211zoPRMKBWj9goX5OGdYRpsIuFx6sz0g6p2
	 +o9oLt6LPwLEwEyUJPb8uTHsk0sL3xLpefmp/PYAkztKCGgpNcQK4VcPApi1K+Faa5
	 2SJtNIvEkBUmfqDb21AyWPb3jYg/e8G5ML0Znmfw8bTrXHfEesrN09O4L8OfWxCb71
	 qhc/LQFyXAoEPsGX2rjEikIVhICpjUXA9WD0MSqQ79uz6CNEJVZhtTAN6SY/V99UGC
	 rRVVUBgGhh27nktAAvSXS0QaafVTDXM8gcXB9Le54HtQM4WFEfT2VQNBDwK6N5vsvl
	 N/HTeHfY7+QsQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/66] kconfig: gconf: add static qualifiers to variables
Date: Wed, 25 Jun 2025 00:05:11 +0900
Message-ID: <20250624150645.1107002-24-masahiroy@kernel.org>
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

I also removed unnecessary initializers.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 4fff931f34fc..0d5a02706bcb 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -32,20 +32,20 @@ static gboolean show_range = TRUE;
 static gboolean show_value = TRUE;
 static int opt_mode = OPT_NORMAL;
 
-GtkWidget *main_wnd = NULL;
-GtkWidget *tree1_w = NULL;	// left  frame
-GtkWidget *tree2_w = NULL;	// right frame
-GtkWidget *text_w = NULL;
-GtkWidget *hpaned = NULL;
-GtkWidget *vpaned = NULL;
-GtkWidget *back_btn = NULL;
-GtkWidget *save_btn = NULL;
-GtkWidget *save_menu_item = NULL;
+static GtkWidget *main_wnd;
+static GtkWidget *tree1_w;	// left  frame
+static GtkWidget *tree2_w;	// right frame
+static GtkWidget *text_w;
+static GtkWidget *hpaned;
+static GtkWidget *vpaned;
+static GtkWidget *back_btn;
+static GtkWidget *save_btn;
+static GtkWidget *save_menu_item;
 
-GtkTextTag *tag1, *tag2;
+static GtkTextTag *tag1, *tag2;
 
-GtkTreeStore *tree1, *tree2, *tree;
-GtkTreeModel *model1, *model2;
+static GtkTreeStore *tree1, *tree2, *tree;
+static GtkTreeModel *model1, *model2;
 
 static struct menu *current; // current node for SINGLE view
 static struct menu *browsed; // browsed node for SPLIT view
-- 
2.43.0


