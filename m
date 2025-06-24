Return-Path: <linux-kbuild+bounces-7638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B56AE6A4E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ABE8160CD3
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC532DECB1;
	Tue, 24 Jun 2025 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FR0cZmPq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A222DCC14;
	Tue, 24 Jun 2025 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777658; cv=none; b=nFd+1OVCBql48iNd5LvqDMqBXJBjUHk3rzj7o/tii+g8XfDdlYtKoJzJkiS4tag3jhUows5nKrwg56THjssoePxvgX3FwVC9XinKeeH1JIUKd+uol8VylEDlN1deDD0zpwBFljLOp/0EfqcfBmNDH8seTm5TAjG1c+6AtN/jSh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777658; c=relaxed/simple;
	bh=+eP9owx5Mga3rQXBjpqoo4y+J1aKKuXfBEaV7R+UZ+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOQt250uDk/lzRJg+nkcQwZc3NzyMneKaPhQH3WCyKE1Yp5L1LgDPQln94OeOWK04CYRsNPRzgs0toWZVMTy3YNDrvHseKnuiM8VhzV4tSOKIa9kcNO74oy9m3u2Jperh+vhya46RELOpRk1pSL0qP1rw6P9T785xVinZME8nBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FR0cZmPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99469C4CEEE;
	Tue, 24 Jun 2025 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777657;
	bh=+eP9owx5Mga3rQXBjpqoo4y+J1aKKuXfBEaV7R+UZ+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FR0cZmPqfzoXlT500JZTIVV40yBAmhIfXrip52FkuUKy7ggQY5aeTEiAHy5uvxqS4
	 oF6pnfRMwIY/asU4enyMQj+DK5iolc6BmGSXX8blg0In5FdFlFIuScg3uG41O2/cHD
	 iQWxiEpTjCVFwBa3z8dV9l9EJBA6OwGNATWLxTLpUVohclgco9cuOMesax40J+P/vK
	 xZpwNG887rbh9N6OCUfrADiTxmvzY+/YkBzKp9pWNbEAccPpTdBasv1w+c7nlDdt1c
	 N6Gek1eTG99v85SMB39CjdkkBQAGHhyz51qkNLKDZgQHJ7mjvwn0HbpH9RkBYwUU9C
	 PS8WiaBx/Ytow==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/66] kconfig: gconf: remove meaningless code in init_main_window()
Date: Wed, 25 Jun 2025 00:04:59 +0900
Message-ID: <20250624150645.1107002-12-masahiroy@kernel.org>
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

The 'widget' variable is set, but not used in later code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 7960c456e3b9..4b5befa4f685 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -129,7 +129,6 @@ static void init_main_window(const gchar *glade_file)
 	conf_set_changed_callback(conf_changed);
 
 	style = gtk_widget_get_style(main_wnd);
-	widget = glade_xml_get_widget(xml, "toolbar1");
 
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button4", (gchar **) xpm_single_view);
-- 
2.43.0


