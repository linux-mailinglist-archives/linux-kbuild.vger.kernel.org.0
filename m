Return-Path: <linux-kbuild+bounces-2199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C39990CECD
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 15:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4001F2222D
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A611BBBD9;
	Tue, 18 Jun 2024 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pv3lqnAT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F791BA060;
	Tue, 18 Jun 2024 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714593; cv=none; b=EDr3Ygqx3c5MN8G7Jyw3fYwp0conadJOzUvyzF0QrUFdcRnlHG7tIJnbtFXELO5txjMCXH6RhPpqCXJFar8pQw17ItB98f3ZDpb8i/tGfNXElIt3zLZWcxpcMEVu7+JHToPw+Oce5LzU92iSEjck03vyYtmVOxVg6e2deDPppbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714593; c=relaxed/simple;
	bh=k4N2oZPvjdyGFcX8/AqR7IHO5QaMyWZIg+o9KaW6AIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LG9dPVtXy+cGpR7c4/VqBlv7YoD9YUK/GZryK+s/vGJEt+KDgRhxFD+Mvg6Pjg8C5ZW84LtZ0vUeyN6qhR3BpgsEyo0fwb7lLQ4/jXbcnk8pGsWf7ZlKb48rbjSYLIpWDzUwjnoRQRNa+556Nyw44aRsUG2SCikgTDxGjSkUiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pv3lqnAT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF0AC4AF4D;
	Tue, 18 Jun 2024 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714593;
	bh=k4N2oZPvjdyGFcX8/AqR7IHO5QaMyWZIg+o9KaW6AIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pv3lqnATy5+vlFtp7+QXo3IlScwJqBjGrSqTVyDRZigPE2Bg2QRpcO8JYwjsUWSg/
	 aViXlvJng0l1wMX8P6MlWCDc3QiqDpfsGXbLCoEjSZP2uUE/Dw+gAOb/2VC+ZmjlQu
	 EnRlVwuFZagDahgkufb5Zo/yfnRUAy/v7ezfOfZ67HuOO9es97KWzNK6pHiKJJYGLz
	 oKnaxIf4H+EhHtsiXkqrjDf6uE6OE+Oc5y/RdBW7eg1ohRcqvFLUS+aXnqpUavWsdQ
	 90WV5QSuH1Ai12MTuJ60ch+Dcd/0ilgh9w6JG+YGcG8uSSzZE8u1BqrVujwvzlgI2f
	 fFauWfLRvJMMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 8/9] kconfig: gconf: give a proper initial state to the Save button
Date: Tue, 18 Jun 2024 08:42:56 -0400
Message-ID: <20240618124300.3304600-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618124300.3304600-1-sashal@kernel.org>
References: <20240618124300.3304600-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.278
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 46edf4372e336ef3a61c3126e49518099d2e2e6d ]

Currently, the initial state of the "Save" button is always active.

If none of the CONFIG options are changed while loading the .config
file, the "Save" button should be greyed out.

This can be fixed by calling conf_read() after widget initialization.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/gconf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index e36b342f1065b..9b10f1248da11 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1483,7 +1483,6 @@ int main(int ac, char *av[])
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
@@ -1491,6 +1490,8 @@ int main(int ac, char *av[])
 	init_left_tree();
 	init_right_tree();
 
+	conf_read(NULL);
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
-- 
2.43.0


