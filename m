Return-Path: <linux-kbuild+bounces-7662-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F5AE6A88
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 110851C2752E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BEA2E9EC7;
	Tue, 24 Jun 2025 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwvZXwVh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A12E9729;
	Tue, 24 Jun 2025 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777709; cv=none; b=eTk6eMCQKp/Gh/mIGRFPMHCRxJpa58+jZSVVI79Rr/JkobIObJLLFwFXOPd9YZc7dBY2qVOS1ZAunnO6rf5Oq3W3GBBNneWtL7e7sUt3cM0fTl1rr9GBdb929ozzB02Zfb7/h9h5/nOtQvrvsPnKWbrxmRUku7RxzuJPcqTagSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777709; c=relaxed/simple;
	bh=PluKFvs+HMYP4pgTX9WTg1RSxH3D8rzHm8dVdb5O1OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZMiXPSQ9mmN3MSIgG5ijF7zf8YMsSAmNFxE4TGlulMuTDsCEqary7FzzFwms0Nhmnl5DqSFJKxZBNU55zLWM3LUkXpxxgY9kyrkFIt5DnwVL9v5EJpUy642ur9Wem2LAC6GuOADg6Viv2gihIfdxXt0VLD+z3cv0fiIMfmUSlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwvZXwVh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87499C4CEE3;
	Tue, 24 Jun 2025 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777708;
	bh=PluKFvs+HMYP4pgTX9WTg1RSxH3D8rzHm8dVdb5O1OA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hwvZXwVhTzxhYTbhzZvbV1qL/xVxkfY42dC2LMyles/lGzoCTwb6Ov+SLogD2lkVr
	 WF3vDXFDsUuXI+QBZKeVK0TBBvYEOTNu/CX6MkZzjK3EC38EPLDjjD06jpOkCfGmdD
	 iKrpdW+iBprM0D12s7kkl/1KbS8GB3Fsj4PoUvayl0MUlmT3SVcukP/MXXXDcuQYsj
	 FGEPmFTBvxKofjwTcqnLBLIVD39jgYW8QPkcebh+bB4pigtNcME4rPTV8f1ng6j6aO
	 hPZ5H5r0oWm/csSL4xvABhK5quQOsMndKVAAfmVpEbH6wtYVGH14asunUksZVB3IKx
	 wBi55FmrCfNMw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 35/66] kconfig: gconf: add on_save_clicked() event handler
Date: Wed, 25 Jun 2025 00:05:23 +0900
Message-ID: <20250624150645.1107002-36-masahiroy@kernel.org>
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

The "clicked" event handler for GtkToolButton takes the GtkToolButton*
as the first parameter.

This is different from the existing on_save_activate() handler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 6972acb4b396..8c60b9f25eaa 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -375,6 +375,11 @@ static void on_load_clicked(GtkButton *button, gpointer user_data)
 	on_load1_activate(NULL, user_data);
 }
 
+static void on_save_clicked(GtkButton *button, gpointer user_data)
+{
+	on_save_activate(NULL, user_data);
+}
+
 static void on_single_clicked(GtkButton *button, gpointer user_data)
 {
 	set_view_mode(SINGLE_VIEW);
@@ -1217,7 +1222,7 @@ static void init_main_window(const gchar *glade_file)
 
 	save_btn = glade_xml_get_widget(xml, "button3");
 	g_signal_connect(save_btn, "clicked",
-			 G_CALLBACK(on_save_activate), NULL);
+			 G_CALLBACK(on_save_clicked), NULL);
 	save_menu_item = glade_xml_get_widget(xml, "save1");
 	conf_set_changed_callback(conf_changed);
 
-- 
2.43.0


