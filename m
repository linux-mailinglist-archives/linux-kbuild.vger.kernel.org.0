Return-Path: <linux-kbuild+bounces-2148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8601190B0C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 16:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD251F28D60
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 14:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15E918BEDF;
	Mon, 17 Jun 2024 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4LZB0L3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948AF18BEDB;
	Mon, 17 Jun 2024 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630754; cv=none; b=X4KbGzve87n9TkVIJ251EO2lBY17zPFsZSxabZ1F0e5K6RoXBA28IHUHFfreQbTl+O5gg3M6UQ3anesYAHLolN3N2/oABwH9BdyZ4QwPnV8dY8mEbcnLg1IrvhqWjkC2stpXL/dRiuQphadLFBrPqX4fjOmEYBzdJIg9g9coMDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630754; c=relaxed/simple;
	bh=VVx+gyg9uCTH+BCYB+UzWwtuqgpv9unuu8PXzlSYd94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkOvu0w8Yx0zs6F6Glm6sWd+zE//jQyCZ9OYdlX8/xp3ioUoX8cleGX6tFr0bCBXPs7pMx6KstUKVInhVFSYIeksq+AhF1HLhfTXOYmBDOTU1nLzaDRhitv2XXjB1Md99lRsOW3ckHf+xXsZYJ7k5akekoMDn8z++YBLebqEqtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4LZB0L3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D17C2BD10;
	Mon, 17 Jun 2024 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630754;
	bh=VVx+gyg9uCTH+BCYB+UzWwtuqgpv9unuu8PXzlSYd94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4LZB0L3uXsj4TkBY4Tnlswv1Ag1SbXljoiWeB7ypp3D1oXxwx0BDMNGRomSNZR4c
	 pVq3T8J3GTEWKJ9Xrg1IKuY59j7fBs1N0RDQxNsnt49Ex7tccxsTjQd6S0Kz3+vfvy
	 iHvhwHoiznvthvJ3zplFtBjtVD5P3039PpAajoCPRLIy1FGRLfDolHTSPCbLDA7rzU
	 C/A9dIGJbUTsshY4sg3ZaUTkFRUdt2UBFZkhzPcO2TQSw1li5X4KciQVjrLpRe8svw
	 zgbDSuNtH/p/k3iSb6FXs8LM+VPW0PXz324ryYWxD6hc7yXAsTkjPq4wd80bXIP/Rf
	 O1fxISPgaSV/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 27/29] kconfig: gconf: give a proper initial state to the Save button
Date: Mon, 17 Jun 2024 09:24:31 -0400
Message-ID: <20240617132456.2588952-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132456.2588952-1-sashal@kernel.org>
References: <20240617132456.2588952-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.94
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
index 17adabfd6e6bf..5d1404178e482 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1481,7 +1481,6 @@ int main(int ac, char *av[])
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
@@ -1489,6 +1488,8 @@ int main(int ac, char *av[])
 	init_left_tree();
 	init_right_tree();
 
+	conf_read(NULL);
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
-- 
2.43.0


