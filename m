Return-Path: <linux-kbuild+bounces-7693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D8AE6B05
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0186A12A4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C31A29E119;
	Tue, 24 Jun 2025 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNOcHaty"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E899B29E112;
	Tue, 24 Jun 2025 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777775; cv=none; b=gZI/TghHl1ltw4Jpf/kAzL9MLAmUr/vQkeO6vM3uJ++pgJm/qm7gqrmkzpkH1MFn+OChq4lWm8PCOhuN3T4QiV0I5agxtGwUFrx16yRcnK25oqb1Iyf7brEY4PXzB/T9BDrtHIN7oywcNaFkh/CC45bCoogREYjvSBkRBHv7khs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777775; c=relaxed/simple;
	bh=FKQZCVhssxinxGFnIiXQ+JCv5IXUQMwaUCZ/SHC7gr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAiPQ3rw++53Vn4IDCxvzxVDU22EjyRQFoIoyotlf52kl5eYs6IoUufBM70cvTqUpWgxnrGcnuz7epCAUt6gUisFDhNsY/3A/WyQwCV8lKjx3213/xBtKLikO9TNksLX0E2acxtwICLgMA/+1iTLEawn6mg7t3CPoeJRfX5vXfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNOcHaty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D44C4CEEE;
	Tue, 24 Jun 2025 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777773;
	bh=FKQZCVhssxinxGFnIiXQ+JCv5IXUQMwaUCZ/SHC7gr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HNOcHatyjO/OqtnGd5KJGCedy2277uSRpj0NTQUehchAtnU7zjDKXW7G+81Sxz5hp
	 dI25wQQIC4Ek4Pi0lmQxiJsX3/Krq8y1ApYeF+N3CG7Y7iesqySHm6WL4/EtUZUxEj
	 7eb4vTaBrVM7YckORT+9HB78NpFiUi1x6lB94U59A2AAwXVJA5WzSOzom/XwYuaPBY
	 8WNk2yTZ9PDo/fuS11f/R/G79l+AcRIRutvEebSeqvUH5vDRewaPoVKRCGLW+Jjz9d
	 Cn7I2uTH62kFP3fZ2N8P+Zx76/T0bO4LShzSKzS2XBaKKDqtn25TzQMKOpnQE+VLvp
	 CmWLg5+96SSjA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 66/66] kconfig: gconf: show GTK version in About dialog
Date: Wed, 25 Jun 2025 00:05:54 +0900
Message-ID: <20250624150645.1107002-67-masahiroy@kernel.org>
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

Likewise xconfig, it is useful to display the GTK version in the About
dialog.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 5b1b468e782d..7340407e4d6e 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -579,7 +579,11 @@ static void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data)
 	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
-					GTK_BUTTONS_CLOSE, "%s", about_text);
+					GTK_BUTTONS_CLOSE, "%s\nGTK version: %d.%d.%d",
+					about_text,
+					gtk_get_major_version(),
+					gtk_get_minor_version(),
+					gtk_get_micro_version());
 	gtk_dialog_run(GTK_DIALOG(dialog));
 	gtk_widget_destroy(dialog);
 }
-- 
2.43.0


