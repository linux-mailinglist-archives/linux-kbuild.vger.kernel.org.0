Return-Path: <linux-kbuild+bounces-2146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F1190B040
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 15:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06BE22885FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 13:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C901520125D;
	Mon, 17 Jun 2024 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hg4by3i1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20FE201257;
	Mon, 17 Jun 2024 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630665; cv=none; b=dK1BM3H4xb81GUU3LaVxz/N0Q6Clvrkm0HyWgsNIeRxwrkKQ2A1FKF9zU9lfjUG+wX6IXPtu8jApZNJHUclXQSBgkz38z1IcynbBso9f+mAxUlRHR9WDdTPv+E1hBLX1NFU1VX8Gdx/nlqw4Ze4oAGnyLdeX/viC4HoiDP79M+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630665; c=relaxed/simple;
	bh=s4+1+7M6oBgFUS6xD1rZ9h3camBb+b2cSRjD+s6Karw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LH6BfrkzPO7OXWMJydMkKcm3DwlHQtRrBrO2ErB1q98sJAEKoXC++d6xt/MEw52u5rmszK8GhI2Jiue/Ck9LsAOk1Aq64eNjVzR5q7dgJcLU9FFYj18tKmApjfG6VQNxiIfiRvsy95sNbPHLMqnQWqM+7CMuzV1ZocUMvMxEkkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hg4by3i1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A42BC2BD10;
	Mon, 17 Jun 2024 13:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630665;
	bh=s4+1+7M6oBgFUS6xD1rZ9h3camBb+b2cSRjD+s6Karw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hg4by3i1aaIJck1oy9LceETV1xba6dqIGet/xuZVPrAM/tXOJNgOQMMr8cdAGM0ZB
	 zMhOL9C1tKeIh6AzNOzG0nnm29MNwNhkppuF1KfzArfhswvEF/hwGizFF2foVxPml8
	 BexbaKHF7A6/dDZ/4LYB4XCorHWa+nkSDcVr7MF6yupfPI+I9X6hGOtEDFApFHJ1KJ
	 /rgspMCuE+mGXPEJitfaP4Fp0Ab12hqPM98FSMTHnHNrCNYp9bRj2/emXxCv245tJE
	 ERJ3xSM10YB5g5jrjQwUcD7+w2SwmgC1h/dyrXFX8qXVG8FYT5vF+NOLNTxIhX4lfP
	 xhaNwR7U/taHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 31/35] kconfig: gconf: give a proper initial state to the Save button
Date: Mon, 17 Jun 2024 09:22:29 -0400
Message-ID: <20240617132309.2588101-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132309.2588101-1-sashal@kernel.org>
References: <20240617132309.2588101-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.34
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
index 9709aca3a30fe..9e52c7360e55b 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1478,7 +1478,6 @@ int main(int ac, char *av[])
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
@@ -1486,6 +1485,8 @@ int main(int ac, char *av[])
 	init_left_tree();
 	init_right_tree();
 
+	conf_read(NULL);
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
-- 
2.43.0


