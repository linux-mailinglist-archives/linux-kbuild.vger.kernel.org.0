Return-Path: <linux-kbuild+bounces-2152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1974490B148
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 16:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C31BB1F2985D
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 14:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83BE19FBAA;
	Mon, 17 Jun 2024 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrTxOLxC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0619FBA6;
	Mon, 17 Jun 2024 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630854; cv=none; b=GUIhKeKJ+S2EAOHeFRDtSPBqZsubnlENJGcYMsjMif6zh6JfYyjC2JEDHUq3C/zhXq4qAlW0ynnzsKQbBnFgK1Gd7KLLPTfmDAsfJVsr1IkKaR9gF7AyfBmv5AUVbUv3Zch44EJnkhYD3XTiWM18T8k/w5BLDIzK9B86AFXsdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630854; c=relaxed/simple;
	bh=pq4Obcyrxwrh9BWrEONsvbAQStNBsMohdM71s9bWxDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QweD4EXYMj0tgb2HyqmoRUXFBHDWxR6hMnsFWIL8AlG/+p7u5b41P4ZSAHrjJ37KQeK4yZa1C9IUM2KUj5wBHcXw3QiMyf8Ke4E83RoojakG2TRIb/PTf/rpbPbkRpo0IcM8Xk4U9nd0JO/b5G/seDVXwEgyJx/avRlBIvHTOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrTxOLxC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18CDC4AF1C;
	Mon, 17 Jun 2024 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630854;
	bh=pq4Obcyrxwrh9BWrEONsvbAQStNBsMohdM71s9bWxDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KrTxOLxCcU3xcndIWxfSTtkGsdfje0cZpswRHEetahoBHP//1W83FwzEuee8jQ1x1
	 Uu2XLFKqfZ/Lgde1Rd/VUcDhLFhgn1/7ZpXZzJ/272pVqoXbC3W9+kK0ZAdLhdRr+h
	 eY3/t/sWBJpWWIJQjgmofrSNCbFuUDmUSzNKyMtURp60V9NfU6wMs14SnGnMzh0XOi
	 DU0oaFz2EQle/N2cOJZOyZC9qYzzBn2RUgaKVuDXIXBcVityEn8r49IMuxufu1kJi7
	 c08E8o+LSGbGHjmc8U2MRun6voLgOFxvTmlA0EhnDduiMrNkqVlbF0hezlLMeHssOx
	 n7siSjH2rbzew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 12/13] kconfig: gconf: give a proper initial state to the Save button
Date: Mon, 17 Jun 2024 09:27:01 -0400
Message-ID: <20240617132710.2590101-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132710.2590101-1-sashal@kernel.org>
References: <20240617132710.2590101-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.219
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
index 5527482c30779..4097999127315 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1484,7 +1484,6 @@ int main(int ac, char *av[])
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
@@ -1492,6 +1491,8 @@ int main(int ac, char *av[])
 	init_left_tree();
 	init_right_tree();
 
+	conf_read(NULL);
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
-- 
2.43.0


