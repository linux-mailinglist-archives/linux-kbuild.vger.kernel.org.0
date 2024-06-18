Return-Path: <linux-kbuild+bounces-2189-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F390CC47
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 14:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDC5C284463
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 12:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91E915F40A;
	Tue, 18 Jun 2024 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2mnVa0A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147815F401;
	Tue, 18 Jun 2024 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714267; cv=none; b=nIHmjkupcn7MgJoGMz1SVZN5WgJTLTHjnRf6a7LwwHbq8SqvBsi7Y7BRqKcdW5chffdPyRV5Ko6WFL6PsgUDTBSgpxw7kEGYf9In7Xi95Hkuh+lTtszykYBoo2RCRjouJHdLGNgTvOeiay056lWCWYms9VOdDE9/fAWNA8gxFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714267; c=relaxed/simple;
	bh=s4+1+7M6oBgFUS6xD1rZ9h3camBb+b2cSRjD+s6Karw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=friC0sFoWCEaqTwopsaSw5WlYB/faCahkDwLoZi6IcqaYaHkv6iSOm6FXeQ0zws8/ubt4Airnq/fCF4Wg80jhF7Zd4OjweroCL3lJpFifheb3xaJSbHq97t0ClXmJZnHVBokcvA1Fy1zBdqFiVocjTtwpKHIxRZn6sTHFzEP8/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2mnVa0A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C95C4AF48;
	Tue, 18 Jun 2024 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714267;
	bh=s4+1+7M6oBgFUS6xD1rZ9h3camBb+b2cSRjD+s6Karw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y2mnVa0AV+UW1a+IC3Mzz8br+K8Jo6z6v868lA6thwtrvo8UdXm3YmHhb9DqbTgXP
	 uEjuMH151avOHUauf4HU1yXgyLGpS+JcLm7SSJ5U62GKYjN0lwdxrrQc/iGrdlE7Dp
	 0FRpbWxQ83FDgf8k5bzuwytFDWV496/LiEUD4reOCbActChJRhp4G5CWTN1jE33IU/
	 DT/aIu94fX16uYht7xH+JcpKwTkPTieqqJUJgQPzPBDMYsxi4UKDWTgKjBhW6U4dWJ
	 qexoVJ5I/rlufA+1QRMaE91nzUUIX/2yyiqDaRjAgHt4M1Gf8VcxHHwhukPO49D0zH
	 O7hxxf14t+Dhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 40/44] kconfig: gconf: give a proper initial state to the Save button
Date: Tue, 18 Jun 2024 08:35:21 -0400
Message-ID: <20240618123611.3301370-40-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618123611.3301370-1-sashal@kernel.org>
References: <20240618123611.3301370-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.5
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


