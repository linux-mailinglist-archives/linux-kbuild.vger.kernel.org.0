Return-Path: <linux-kbuild+bounces-2195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4B890D05F
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 15:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55A2BB222FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7961AF69C;
	Tue, 18 Jun 2024 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRabovTY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D8D158DC2;
	Tue, 18 Jun 2024 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714543; cv=none; b=FaRP1GwU9dTlzCiT37KWZV2DkJpyhqn34wYJTl7xQKjAr2Kotf8pf8loJxeTE3rajWljFEeXEUi9SkehLVvt657ibcbnVti0k3eHyRAiI7q9h9LBLjfZ61w3uKrpt2vk/RKd0V0oeK0mVO4i2WUXQV/mCNSc5aZGmYHAElZjFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714543; c=relaxed/simple;
	bh=VVx+gyg9uCTH+BCYB+UzWwtuqgpv9unuu8PXzlSYd94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SsNVIVZGIKHbPc9MHnFay3VL/E6BlWEe/0qFVSiA4prXm6vsfIOuJfP9Jr09EdMSZsXBYJ8twoo2LZqO+kHvMA9REGaJ20fGTPhEfvche5Y3lqSGMQeyYsJiMFl7LKGDwBFBET0Gx4Blw2GD7HL6ELSz+s3UZhocNR5d/iCWNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRabovTY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727D5C4AF51;
	Tue, 18 Jun 2024 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714542;
	bh=VVx+gyg9uCTH+BCYB+UzWwtuqgpv9unuu8PXzlSYd94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gRabovTYq2cClaD/SLr2K9WhfHQ5FW5ek5pHT7MojFHAd7JSCIJCAUHS6bdIJQjdF
	 lFm+hrByubYEf3JVXDIopmhVmxUzylHPSpT0oqywSJC1E5KP5CTnFAytV077FyskHo
	 X7sEFK6yUSGZNVqNVOUOSSwu9JYHbjIXSmnWiiyF6xhr/3VfJyYc3ZgxudIIU0Wimo
	 krdr7eXqv/MsSCnVf5jKxHL2Kb1WeBkC7pRtKTdvvy0eHPMZ0GeIXC+c3dRVAjYSdn
	 vl1zy0SsItvXZLBuB9mv8NNcImdyJQBzqK1Lt3uCgh5Lq2XahdHVT+sf4LUqFYC+0Q
	 N640ggDZvdvKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 20/21] kconfig: gconf: give a proper initial state to the Save button
Date: Tue, 18 Jun 2024 08:41:19 -0400
Message-ID: <20240618124139.3303801-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618124139.3303801-1-sashal@kernel.org>
References: <20240618124139.3303801-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.161
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


