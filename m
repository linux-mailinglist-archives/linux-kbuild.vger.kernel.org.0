Return-Path: <linux-kbuild+bounces-7681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A32AE6AE0
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E891C41C36
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF212FCE2F;
	Tue, 24 Jun 2025 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQKtuMZX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80802FCE2D;
	Tue, 24 Jun 2025 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777748; cv=none; b=lbeQwFzuZj9p+o4SYm2KLJldRh9ZD/DKB1jvUNxQ/rdwSWtyrT7vINs2CypyyZ4K/MqicQ9Zp7TN68roqvQ1Dd8DiT09VDwzs6r9Qzqg/CedWHPtGzqNq+fDbOWYsBS+SbOPTziodyAIVcoADRecOvmQEv1FTh3EiQZVd+y32x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777748; c=relaxed/simple;
	bh=jxtJy1t5UpEtyEe7TLfdiMn0AMq+Xpnuqn/FzxcOWkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhYVo2Agsc4mx+FALmzbk3eiyHRlyfcxhbXZxjXrt2v0JAXJ49DMZA0pEX8PK1O3kMjUJ1DvAX4fixrMQ3KAJo91/Nt/IIkNQRjKWIk7vwJq0BDFtBYjRQbnM/+Ki1tvVtaVASv4VZCaIFez7IVF08U79755aYIC3lYYOUX3AaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQKtuMZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12899C4CEE3;
	Tue, 24 Jun 2025 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777748;
	bh=jxtJy1t5UpEtyEe7TLfdiMn0AMq+Xpnuqn/FzxcOWkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bQKtuMZXA7Y8tlRE04E2hHTxAiMF/Lg+UMUcdiWQUbm8tnzd3ZRO1RT4QIBVPhymj
	 1ST2GZxTG6Yb1egPm7F5KgBEBEmGkXyVY2Bwenn5gRyMP7RczQtMe++bL3H09o8HLR
	 hvg2HdUhjRQmERSyPGBhVazdbmteW19WEY/+oC5DZ8dXUwiPCQetiWubov7hSRIHRo
	 936CUs/Mxm90m4typwBYSG5yKHmeAaBxLiaxMGwNAnNkf2mnYg1szWMZPiRLua+wPr
	 tnYvwYiY1eWk4jOTeLpAPACIy3+0Stjp2XryYZmJlRCd2BOw9WCIJJ0dhv0YSo2t7n
	 1xqNz+bf/y//Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 54/66] kconfig: gconf: replace GDK_space with GDK_KEY_space
Date: Wed, 25 Jun 2025 00:05:42 +0900
Message-ID: <20250624150645.1107002-55-masahiroy@kernel.org>
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

In GTK3, keysyms changed to have a KEY_ prefix.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gdk/gdkkeysyms-compat.h#L24

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 6487d6a0dd9d..28953449a1ed 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -887,7 +887,7 @@ static gboolean on_treeview2_key_press_event(GtkWidget *widget,
 	if (path == NULL)
 		return FALSE;
 
-	if (event->keyval == GDK_space) {
+	if (event->keyval == GDK_KEY_space) {
 		if (gtk_tree_view_row_expanded(view, path))
 			gtk_tree_view_collapse_row(view, path);
 		else
-- 
2.43.0


