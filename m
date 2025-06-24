Return-Path: <linux-kbuild+bounces-7667-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED88AE6A71
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6437E3B44E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2012ED149;
	Tue, 24 Jun 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNYi8Rwd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B422ECEBC;
	Tue, 24 Jun 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777719; cv=none; b=indPcr2XOTgs15qRGQswJ0pJ+fkT3oFgPQefFyqNOh4Oojr7LkFh34QgvFPYpBmsufmopj72MyvUtq/jinFrM5mJ8GPa/Fia3TCT5t+xHlX8xlqbHxyFZpLA/sfwGMqMB6yd8RgIknM3vDP8x05laZyX+buxb1TxCObhIHX4Y6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777719; c=relaxed/simple;
	bh=oEHtH14Rn8+uCKZFnsLvzgCz36hd+wLvBm2EYrQesSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vuz9tZIS7dU84+YVorQHwOiPocUfewlLe4y1NvNDA7+mjWEwOpfNaMt8z4vG7tg8TCGQXK3yzUNFu0+8o+j7+e5Vh35iKijHMuJuTyQEyu3zeO3S1gAbes4cl2cqkf+zz9yBDHwtE1jjlqCp1SRPdRWonoNWp0F6h3So5QfJV10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNYi8Rwd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F74C4CEE3;
	Tue, 24 Jun 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777719;
	bh=oEHtH14Rn8+uCKZFnsLvzgCz36hd+wLvBm2EYrQesSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jNYi8Rwd9t0MN0v71FU4PvNs8RQvdh9N7fxKqxmnKsqXHd/pavS/Ju++ytTZdjpF5
	 MakK95o8lbjiN4W1si50gFBYVn4iGkqWb3+nzuEEDGuK9J6ioBgKo/5EgGv4sah4BF
	 22e/U+4wn9zMmh/eoTWSHvUVSZ3XrdezsTMl5J7RQhrWRLw+hWe5U1+Jw2bV3z6YjI
	 6w3Y0Cr889HHm3Xn23bWVjRmPDp+Lv+rHmNDKDgPKHRd9f55XxfsW0SqVEX4zrp2xq
	 v+dlwjn61W9sOHVaqWK3k7z25oOGhApYYMvEGaHsu8sPdn62e+9qwef33k0akwHcWb
	 Q7iS/L2MiJPIg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 40/66] kconfig: gconf: make introduction, about, license dialogs modal
Date: Wed, 25 Jun 2025 00:05:28 +0900
Message-ID: <20250624150645.1107002-41-masahiroy@kernel.org>
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

These are modal dialogs in xconfig. Make them modal in gconfig as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index e20cbceb89d3..67305577b432 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -312,10 +312,8 @@ static void on_introduction1_activate(GtkMenuItem *menuitem, gpointer user_data)
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", intro_text);
-	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
-				 G_CALLBACK(gtk_widget_destroy),
-				 GTK_OBJECT(dialog));
-	gtk_widget_show_all(dialog);
+	gtk_dialog_run(GTK_DIALOG(dialog));
+	gtk_widget_destroy(dialog);
 }
 
 static void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data)
@@ -329,10 +327,8 @@ static void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data)
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", about_text);
-	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
-				 G_CALLBACK(gtk_widget_destroy),
-				 GTK_OBJECT(dialog));
-	gtk_widget_show_all(dialog);
+	gtk_dialog_run(GTK_DIALOG(dialog));
+	gtk_widget_destroy(dialog);
 }
 
 static void on_license1_activate(GtkMenuItem *menuitem, gpointer user_data)
@@ -347,10 +343,8 @@ static void on_license1_activate(GtkMenuItem *menuitem, gpointer user_data)
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", license_text);
-	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
-				 G_CALLBACK(gtk_widget_destroy),
-				 GTK_OBJECT(dialog));
-	gtk_widget_show_all(dialog);
+	gtk_dialog_run(GTK_DIALOG(dialog));
+	gtk_widget_destroy(dialog);
 }
 
 /* toolbar handlers */
-- 
2.43.0


