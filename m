Return-Path: <linux-kbuild+bounces-2156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C690B195
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 16:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5339B2853B7
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 14:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8136019DF4C;
	Mon, 17 Jun 2024 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZK5F2ut"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589221C007F;
	Mon, 17 Jun 2024 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630891; cv=none; b=Y9gBf/eUPMEhYlfOMWkEiRSyKl9WNYIDOyZzLvMcE+g416iKhpp7F8lt9LU3hYD4syp3v1+v2FnYqhZV2Dk2/c/2Llbe2y76WEgR3Cuu7N85qOAEvDYWgnTnB+I2he1lSxSESRtfksB2hFiCQa9/Yw+nOL9Od8lc2bNZNs7+rZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630891; c=relaxed/simple;
	bh=BCGM/7rvV25Nlo/GY/uq9hLFCycxsYKyfjMITUQ51GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJzQ/thriYWqpglUvhoYL5hnGGc4GWUBvK/qNbsPwlvr+XfTBYj0Wz3c6yDaiodE9qCsVGDNaLz4Wre9kuEgP6IwCgzApHOWqdKmgctZNQdAcsRDqEXCKCylX7W/gp+Arh0dkut+MEK5lhKESAWhlf16LNgXrDwJTPf2tBLZPcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZK5F2ut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B85FC4AF1D;
	Mon, 17 Jun 2024 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630891;
	bh=BCGM/7rvV25Nlo/GY/uq9hLFCycxsYKyfjMITUQ51GM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EZK5F2utFwILYkHaxbLELEN0LonOVayUvzu+TUReFYbGfDWtsl7cFcXQsuXMGv44l
	 M58S5f2nLEHh3dsW2uPWDnEOxXwNY260gRnuA1/fQP0x2SXb9M0fFDCGQVJHtJhlks
	 yyzO4lAzsk/mHjkhScXAbkh7PFuSFweZDzMO4XCQV7OqRo9EK2MRnjlknbxL6Ot9Xg
	 iDuksTTYSf+4SGQ1rJuwJ+pq4h01xTruYW+AeCv9+WLLVoRJMb6NVFkm6GIwenB/H+
	 9Vc7F5QGauJCvl6zRscmAkqaoCzvglLw87VnPZVXwQk8DFlqe4BFTAL1hVpfgghQNO
	 8fYIFPKNnocrg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 8/9] kconfig: gconf: give a proper initial state to the Save button
Date: Mon, 17 Jun 2024 09:27:53 -0400
Message-ID: <20240617132757.2590643-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132757.2590643-1-sashal@kernel.org>
References: <20240617132757.2590643-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.316
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
index 36f578415c4a6..5e0ea015394e9 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1485,7 +1485,6 @@ int main(int ac, char *av[])
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
@@ -1493,6 +1492,8 @@ int main(int ac, char *av[])
 	init_left_tree();
 	init_right_tree();
 
+	conf_read(NULL);
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
-- 
2.43.0


