Return-Path: <linux-kbuild+bounces-2144-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D1890AF93
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 15:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D38A1C21668
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 13:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864F01B3742;
	Mon, 17 Jun 2024 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pk12l74h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE6E1B373D;
	Mon, 17 Jun 2024 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630544; cv=none; b=c2C2WphB7TrHsA1iiblkTh1sgd9HtI7UZT4VrTVdcdKm/gskYU+eBYmhtfj3PfV/yDCzLD+A403vEpmbbXRMbaQpAvxxHzeedU815wUMH0JrwaSzhd4hktWkLlNuZGJNIdClXKHO/J8g8vpWOsZ+2ncBH0eFZmzDN5k4O6JayO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630544; c=relaxed/simple;
	bh=s4+1+7M6oBgFUS6xD1rZ9h3camBb+b2cSRjD+s6Karw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4sV+3ofEQ2ED3RapwM8IhHlT3qbRTR7pLjli3qR6BsL71Na3GHNwpPizz0teRjxrMafXeWLLJnmLSeu6g/qzrnjEUPQRURb02r1zfMO+I42S0Upn0mjKGQn3SYOHmD7075h53O6cln+Fj91rqhbXgrUqyKR9fkMNXlmHv1Zrzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pk12l74h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEC3C4AF1C;
	Mon, 17 Jun 2024 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630544;
	bh=s4+1+7M6oBgFUS6xD1rZ9h3camBb+b2cSRjD+s6Karw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pk12l74htdAmxmUItgXNMC5aoH5JHaAOGhGK8h/QIA0lk32HoWebh3Cc1zpdobGqx
	 hBTPtp4H0FVX1XYr3e4PSF1ZCfTaetMqgAl/j+vRdRtVCxk34SQ/Y4hRTrIfNyi8Jv
	 I73pbm9tXBdfXr455v62vaLIUtOFYt/fkF8crKfyqG9tlHkEzO9nheV7tBkUxOA1nc
	 3mWG4P5bHZ7iuq3yiK3ZxL5aFdMh9d2xA95UN96j6t76jFG9Ycv9cDb7ZgDyZHNFbz
	 5cPO4lWUNq+gZi7SooOogHiNru/A/moWupvcOKoq0Gseumn7g9Ih60DPEU1DkpfICT
	 ioKqNKkHdDaeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 40/44] kconfig: gconf: give a proper initial state to the Save button
Date: Mon, 17 Jun 2024 09:19:53 -0400
Message-ID: <20240617132046.2587008-40-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132046.2587008-1-sashal@kernel.org>
References: <20240617132046.2587008-1-sashal@kernel.org>
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


