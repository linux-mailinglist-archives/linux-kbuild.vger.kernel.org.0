Return-Path: <linux-kbuild+bounces-7637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C3AE6A36
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C867E3B6E32
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0CC2DCC1C;
	Tue, 24 Jun 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a24brRf3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382BE2DCC1A;
	Tue, 24 Jun 2025 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777656; cv=none; b=EBQ7iooVZou6+717n4CX8LlQrwS+akQREqsww9YJD8beBX4KwnYT122hbwvjJEvmDkl15kWq/6Ru/Rj/bSFibX8Vy743EpYxHNj1z0yEQFmp04ACybL+rAVf4pPL6b9Og2jpByEjRuHEV4bP2tYJQ0aZK7j0FGkt2saf7HmqU/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777656; c=relaxed/simple;
	bh=2ipZ4yhNez1WY8mSHhL9J1q+eZ09WrwfNcT0C5SaaRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pna/LURD/HPFgIf63ZGc8OjXbWe05DVf9V2Lw10/gxZ5LBJBum+Pwya/FCnzvlFc40GE1n6AMiFLjfHDLBUDsLjvRGX4jzCcsCi9Ti/rnPl80Y3QpphS5IlTSWK6GGlr07jC6OrSXIZZGJxbyh/WYBoI5CKC+wVWyVY40/ydOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a24brRf3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B75AC4CEEE;
	Tue, 24 Jun 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777655;
	bh=2ipZ4yhNez1WY8mSHhL9J1q+eZ09WrwfNcT0C5SaaRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a24brRf3CUbiTU2eQzkCKZgFizfE2dNL6P+6v+Pwqjy9+hqswGQcNdE2al8D8m+az
	 wSNXOSFZz7oWtoQP8fRVSX8TTksYa/ZcTjQX2TyLmta6lNe/ev5NbPI/PDCfIE8/OS
	 bfJ2YSpQrGx2L3Z2OuSicfwi+2jvpoja5dPAZTBhh2hGM58df2MkYDbj81f8GFUSJA
	 A1XVRf57CYpsZVzAms7AbKc7LCcUrHOnwnQe3y24RbkKtc3FT2778jS5eokJpUjPI5
	 XVqPNsjuM7BwTSlcDg4jTAfB/b3aZWlDQOQJSzNwlUTvdQLQG6JwGuQLYdE//ODbVV
	 bxzsfcWlsGBUw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/66] kconfig: gconf: remove empty if-block
Date: Wed, 25 Jun 2025 00:04:58 +0900
Message-ID: <20250624150645.1107002-11-masahiroy@kernel.org>
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

This if-block is empty.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index b2a0208b0a5f..7960c456e3b9 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -913,8 +913,6 @@ on_treeview2_key_press_event(GtkWidget * widget,
 			gtk_tree_view_expand_row(view, path, FALSE);
 		return TRUE;
 	}
-	if (event->keyval == GDK_KP_Enter) {
-	}
 	if (widget == tree1_w)
 		return FALSE;
 
-- 
2.43.0


