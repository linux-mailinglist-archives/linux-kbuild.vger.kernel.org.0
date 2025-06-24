Return-Path: <linux-kbuild+bounces-7689-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA06AE6ADA
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58B125A3A90
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D6430204F;
	Tue, 24 Jun 2025 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWF5J54V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE082FE38A;
	Tue, 24 Jun 2025 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777765; cv=none; b=JAu6s99WBB13cC+pTtTfYUpsxgtRTBNfVT9gVZT35HzBcOXzDC/ywtKNcTj3V1eHkB8MLE/6yKKNfLROyiVE78twC8VBZpnCACuIVKtUtFGv+C1NtnL68YW522J+kQizNyAf5rT+dybxFTzK1MmjVG79kQR9iHG3gRnCYpvXUtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777765; c=relaxed/simple;
	bh=jnyNXKAK3VyOEQ7LNV7u1/xum5b84RnliLk2+Unux04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uy0G4rCcYajGN4cY3D7lqhXAZajoRcdR5ueeDzJdzOm9bENvP91Glmki6xnWO3aZqtzQwu1UWYQmvswlzkJ9IbQp/2OqlMbuQ07BlAcmXQbGXXCThMS6sM47GV8c4vdpVSgF6p2F5WI110UZnSyxFhGzEJiHO3pJnC1rhR78UZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWF5J54V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4165C4CEE3;
	Tue, 24 Jun 2025 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777765;
	bh=jnyNXKAK3VyOEQ7LNV7u1/xum5b84RnliLk2+Unux04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fWF5J54VuOIsIYtHvw1vWzHw2ePXjWMfupj+WVC1zr6btcL1M2gcusw9/Cad4FXVB
	 fg9e30oPTeD/FlJOcIXc4UbyN7YhPMqK9sF9UmJiW1wHjHFb8+/T+BTjoN10S3XFN/
	 FyZk47jOpp0rhslwMLkPI0Lk5P7NWoVMMZSFpf4YqQCrc03Zq1WErO83cUInUS/czr
	 xvHsTrrExLcIHXAok7dA3MJUJ4K9setD3JkkEO4N+8MVqs60GbnezfHdfsF2OrC6Qj
	 QhsOMyd6GopO8jzFdLI7ZZgxYkYKCCs8VfmSymc3ebc5N+a89Ztzw88duBdBEf7XHQ
	 GAs1Zxi8Y3dJw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 62/66] kconfig: gconf: rename gconf.glade to gconf.ui
Date: Wed, 25 Jun 2025 00:05:50 +0900
Message-ID: <20250624150645.1107002-63-masahiroy@kernel.org>
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

The next commit will convert this file to GtkBuilder format. Rename
it in advance to reflect the intended format.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c                   | 6 +++---
 scripts/kconfig/{gconf.glade => gconf.ui} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename scripts/kconfig/{gconf.glade => gconf.ui} (100%)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 58da3f13c5a0..4c6459cc26e7 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1301,11 +1301,11 @@ int main(int ac, char *av[])
 	/* Determine GUI path */
 	env = getenv(SRCTREE);
 	if (env)
-		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.glade", NULL);
+		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.ui", NULL);
 	else if (av[0][0] == '/')
-		glade_file = g_strconcat(av[0], ".glade", NULL);
+		glade_file = g_strconcat(av[0], ".ui", NULL);
 	else
-		glade_file = g_strconcat(g_get_current_dir(), "/", av[0], ".glade", NULL);
+		glade_file = g_strconcat(g_get_current_dir(), "/", av[0], ".ui", NULL);
 
 	/* Conf stuffs */
 	if (ac > 1 && av[1][0] == '-') {
diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.ui
similarity index 100%
rename from scripts/kconfig/gconf.glade
rename to scripts/kconfig/gconf.ui
-- 
2.43.0


