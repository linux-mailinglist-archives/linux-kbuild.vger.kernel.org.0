Return-Path: <linux-kbuild+bounces-7635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4848FAE6A4C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0A341BC3F24
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CB62DA775;
	Tue, 24 Jun 2025 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShPKjSXB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8EB2DA76F;
	Tue, 24 Jun 2025 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777651; cv=none; b=u/KZaKIWxLQiUkovdpMvr18G0AaMYxKmwydfJ3As6UdIwD7xdfkbf4ODMW56NNOzXHFMnkADpepfpeqgaCKs5z1Ma0H7Nwktz4usIZzTknRhJVytG5CTbQ9jIxlTtYEb85cl4omSO1nWpZl8zxyvnrqQ/atSNeexxw7HTsqCOEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777651; c=relaxed/simple;
	bh=ki2KKf6iNvDWcRS7JkKjHtSYtV3XYM5ZgyBnkoAtRow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caJy2Nnv8oQvxIeCudAO8T0s6hFxCqweF1AYegl0NEAHnSNMa8mD8HMIrsvbL58N9Lu6AGWu1OI8zRIx0wHZFp1DNb7yMBeygsg3CsrpqPPaqjT3BJmtEryuvIfuCrrYgT0fNjJfavW5XjtVJ+RQLhGglEYKaKXT+ymKWDyvcJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShPKjSXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BB4C4CEEE;
	Tue, 24 Jun 2025 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777651;
	bh=ki2KKf6iNvDWcRS7JkKjHtSYtV3XYM5ZgyBnkoAtRow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ShPKjSXBqiH1FjTI72NwMJSwDh1yfIMSqW/kOuHGi6fdefvGHb4ZT4TxWow25N1/n
	 tMPCrzXGHuAiQ2Bj0+W3xNLQhAPs47MSNr2C+dXhoyoguTWZQWr6UUuoXOL4YmpGo4
	 fXbpjPswEyWxyQJTRJFeP4gWFi7kf70TOCKWhcvGniwrJdOQyPKfF8G+hELhiOcSBS
	 72539U4vE+xLRk9DT5J9MpNU7BpySYKD/qqWFwNRQ7VsLj/Elt6mTt+vTatvLQ+/rx
	 d7jC+CzeYW5RPhGvovgQd9vHT4G4/g63lLkpk3MPNnrOFppgmoyotnzgssjvb5AGa3
	 V2xj2+h0KXUTg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/66] kconfig: gconf: always destroy dialog in on_window1_delete_event()
Date: Wed, 25 Jun 2025 00:04:56 +0900
Message-ID: <20250624150645.1107002-9-masahiroy@kernel.org>
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

When gtk_dialog_run() returns GTK_RESPONSE_YES or GTK_RESPONSE_NO,
gtk_widget_destroy() is not called, resulting is a memory leak.

It is better to always destroy the dialog, even if the application
is about to exit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 769f38307f34..52d439a5119b 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -378,6 +378,7 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
 {
 	GtkWidget *dialog, *label;
 	gint result;
+	gint ret = FALSE;
 
 	if (!conf_get_changed())
 		return FALSE;
@@ -404,17 +405,19 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
 	switch (result) {
 	case GTK_RESPONSE_YES:
 		on_save_activate(NULL, NULL);
-		return FALSE;
+		break;
 	case GTK_RESPONSE_NO:
-		return FALSE;
+		break;
 	case GTK_RESPONSE_CANCEL:
 	case GTK_RESPONSE_DELETE_EVENT:
 	default:
-		gtk_widget_destroy(dialog);
-		return TRUE;
+		ret = TRUE;
+		break;
 	}
 
-	return FALSE;
+	gtk_widget_destroy(dialog);
+
+	return ret;
 }
 
 
-- 
2.43.0


