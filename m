Return-Path: <linux-kbuild+bounces-7634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 352D0AE6A44
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69333165806
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769C92D9ED6;
	Tue, 24 Jun 2025 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/xsAokG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3582D9EDA;
	Tue, 24 Jun 2025 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777649; cv=none; b=D9kkJy5pj8wtc0zvXbV7UzMJnyHvyLhMvJNSCRl/19fHHHhA2zG4JlA6cW8DKnYEhI4w4uZ3DE5xm+Kd4ykewiX0ID21dYCCG48IcDxLP+yE+bPGD4B3+jbp4nSzoAO511w/CgpPJPGyDisp9ZdtVQEjGg0l+F5VOZc6AUO1oGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777649; c=relaxed/simple;
	bh=Q+jmRBRKNoaVd6mWu0jQ4WHnszmsX6I2dMVeEPsgj4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tqva7hM3uaAUBdwW1QzN6yZaxrkvyJWsAvEbelz0/qoM5euuWIer3KKSH2f0raMmhBCwGtNHki7n+uwXjA6sV7vxO5ds/5UMDuOHpkrAU3QFNyUapjv3yUfLUaZ/ETH4Ev9RWizxamSspcsE8gIo6/IuPAYERTP3OUjIqjEYFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/xsAokG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE62C4CEE3;
	Tue, 24 Jun 2025 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777649;
	bh=Q+jmRBRKNoaVd6mWu0jQ4WHnszmsX6I2dMVeEPsgj4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/xsAokGRPiDn+OaIYj1SQdU1jt9cAW/I64FZhSCaerNqjxkhEhyIsGGfeeNMVlfY
	 TG0V/Mde25xp4QdFLdQ03Kp5MDCjSXsa2KxIpDlFYykFEyogZUAaDcRupsGnwGb3U+
	 br8uiZzBp3OgAgB4bZ6WybdRCfLgQVVCi6G4ZBdRuc0FqBxXfiZrCRR1ak6fenm9/u
	 juvNb9HwKwOcrWOkvuzB5kffufsphPwKgibDNu8k6kbxK+z5zrcDaoNub/SyHLTAsf
	 THBBjauskga9P4JuqfTyDrf/pn+2fu1KHe52mMdOszk2Xu3ukmyadwBnl8LPs80kt4
	 Ou5KcvzxS8jOg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/66] kconfig: gconf: fix potential memory leak in renderer_edited()
Date: Wed, 25 Jun 2025 00:04:55 +0900
Message-ID: <20250624150645.1107002-8-masahiroy@kernel.org>
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

If gtk_tree_model_get_iter() fails, gtk_tree_path_free() is not called.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index a3978d3420d1..769f38307f34 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -745,7 +745,7 @@ static void renderer_edited(GtkCellRendererText * cell,
 	struct symbol *sym;
 
 	if (!gtk_tree_model_get_iter(model2, &iter, path))
-		return;
+		goto free;
 
 	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
 	sym = menu->sym;
@@ -757,6 +757,7 @@ static void renderer_edited(GtkCellRendererText * cell,
 
 	update_tree(&rootmenu, NULL);
 
+free:
 	gtk_tree_path_free(path);
 }
 
-- 
2.43.0


