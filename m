Return-Path: <linux-kbuild+bounces-2201-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B5A90D0AD
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 15:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12465B29278
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47DD1BE851;
	Tue, 18 Jun 2024 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDe6VMIp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D61BE84B;
	Tue, 18 Jun 2024 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714612; cv=none; b=WdOliJji6M4zHkgSoz41vbUSL3jUm5qZPepKswNajQOyrru7Tu5poPAfsiB62InGa8qgn5pgdDk/c6cv8D0+yzW15J6ozso3FBPA3L3hNlHvDSEld75opEGYbDESkh9uDBpFMeAO4mPrjYLp/oUXZaUp912wXHyw9dtCcqyjcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714612; c=relaxed/simple;
	bh=BCGM/7rvV25Nlo/GY/uq9hLFCycxsYKyfjMITUQ51GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCw8Qk1Pa0JBfmBJAK0/aeYoiInXADz738o7L9hvpmFtXThuzWNkJwRusacPqoyQBB22iBIHO/jw9eaQPi/jXZimjRcfOq/KC4WI6jG1nnLtpSwQ7zs1fP4Ti1bdyUvPvVOAkAcsGFwpWR+mhlVGUD7k2qaX0swfZ/5ykFDSApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDe6VMIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA1BC3277B;
	Tue, 18 Jun 2024 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714612;
	bh=BCGM/7rvV25Nlo/GY/uq9hLFCycxsYKyfjMITUQ51GM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDe6VMIpEbt6IVYFNkVDN1S4ophEhB5/mDzdInrr4ph/sPcl+0eGy30PPtwmZLp2+
	 RU20BgZqiFyT1XTtrgmMM8eCWQYzbUs7lSwgr7/8clVRNRE+s9USZbyxZXSKi7LqbV
	 zaDL+iZ28RLACdcXqTPugnZTt0d1ZOyotYhJLfiNLUC4YiICaHCInoPKmzLxyCWeJf
	 7pSVdsnT0NQ6N23wAtwm1Ya+oBPFSsXTUemOBHWemF1JTri5gI5JfnL8r8Fg1bLGma
	 Jj4Dr+BnfAWqI92FormSBbcq9y9gihjI3ExN2vqPV4WIpQbS3KLq5zkN7mHGItCMA8
	 c5m9SoVpnL4iQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 8/9] kconfig: gconf: give a proper initial state to the Save button
Date: Tue, 18 Jun 2024 08:43:14 -0400
Message-ID: <20240618124318.3304798-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618124318.3304798-1-sashal@kernel.org>
References: <20240618124318.3304798-1-sashal@kernel.org>
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


