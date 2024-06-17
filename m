Return-Path: <linux-kbuild+bounces-2154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B677890B416
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 17:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43C89B3CC0F
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 14:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D7C1B9ACD;
	Mon, 17 Jun 2024 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZ478Y5n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE26619E7D1;
	Mon, 17 Jun 2024 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630872; cv=none; b=Thzl6NFdz8tIOQgBDdCYU08T/jbiv4rnyNFGSpqqJgBlJuBr7006H5ie5T9Yl5CW3PNrj3drjFsCMJrVgM1QKe46iX/Di5f5MkoLvQ8xwoQlQ/u40Uee3XrEpLWla4ycPIlqCOtUakYK2YynDlp0flbZCQ0CZTrpz+g0Zijm3ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630872; c=relaxed/simple;
	bh=k4N2oZPvjdyGFcX8/AqR7IHO5QaMyWZIg+o9KaW6AIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2PDhNQpOt6Ijv5Qs1QN5nnPFo2HTJ3X2Rw10NnifBJxpWOnq/WmM5lH7wiyETKDz3pyKjySjXMBaBAzzyalek15T8PdgDtfD/TGjOL9ziIw1rS5oCqBGAbqnWBUnY8fV1xfTjXUYA4PJ+WMrxs1qPWkJA2Lk2Wr8PQ+6hqSyR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZ478Y5n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BEFC4AF1D;
	Mon, 17 Jun 2024 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630872;
	bh=k4N2oZPvjdyGFcX8/AqR7IHO5QaMyWZIg+o9KaW6AIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NZ478Y5nuOvwyX3AoW2rVUIebPM2SpWAB4hhXgGTRVC3+VYEdTbZ7ncgm9qnxTZ0U
	 zZfAnBboxVeXoOxGFFYLLTa/s+rmHyewGnEFLZaUH5MKweF6A8ScaouS3WuHga00xW
	 us+mA0Vs/ZgUVKtyXf7ELwC+jaNMWcarRO9eN4T4eevIwwgQvcH1tCjouHXLVzytUM
	 WgbcGfGXt5WvAWBuIVjmu2eAhpBDbYe5OmCJR+s+uM9bpS3h2CMVyUSIPgUvKUJ3lI
	 Alm9bDpam7IjnLG3uWrP5HZTDTvinKI6FtnzIGzWXh6kp4gA9GYvRmtHZW5GI1isnt
	 wIxtLeXSI+vSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 8/9] kconfig: gconf: give a proper initial state to the Save button
Date: Mon, 17 Jun 2024 09:27:35 -0400
Message-ID: <20240617132739.2590390-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132739.2590390-1-sashal@kernel.org>
References: <20240617132739.2590390-1-sashal@kernel.org>
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


