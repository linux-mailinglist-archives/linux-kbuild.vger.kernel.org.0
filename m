Return-Path: <linux-kbuild+bounces-2193-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94EC90CD21
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 15:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C51FA1C21618
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B1A1AB8E4;
	Tue, 18 Jun 2024 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZbHWMMC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E841AB8E0;
	Tue, 18 Jun 2024 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714477; cv=none; b=FD3/kmJ/6RXf8Lr7TEtAMvk6ABWI/EuKVkAvLGcSvjcYmKkiSFAhGZ75UrWrb097yaua7/ZfTBMBIT05mry7wOSrpDUCkaB7pZ/GoPbMZq97DmUqk21wXCb9hnO9/uQXaX8AymvCBmcnBclI+xQtGT5EDkpODlnbE4M1AmknzwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714477; c=relaxed/simple;
	bh=VVx+gyg9uCTH+BCYB+UzWwtuqgpv9unuu8PXzlSYd94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7G5TcpGk0jm6NC4qzWaA9d3KGSEavbDsqqjbRg6EVzzUlD8Nnx15agDOkA8XGG5xkoYTztZj3QtWpU1r/ga1vpqPyhpX//1DdR7IwN8jR8Zhgo9ZUIzWnIs5B8hieTWC5DEwaEOSMMAsgZLT7uAFNsqSXlpS3LlTc1IUZoqe6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZbHWMMC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02100C3277B;
	Tue, 18 Jun 2024 12:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714476;
	bh=VVx+gyg9uCTH+BCYB+UzWwtuqgpv9unuu8PXzlSYd94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZbHWMMCfpGnUku9xq1I2Na6MFn+hkqw4Tk41poY7u6+WFu1DaGiAesXlWWxlTIzb
	 GOH3NUamiDGSuDRruSwkVrqmIQBNxEr+lTSp0GwZVwfRN5Vo0ObWFhv1jDwYW0YK7E
	 rfZFgpkPVwqXl+3/Q3nDCcBgz15WBRnctQbr9GjNeOulDm3Ltr9+wuptkGilX80mHZ
	 834e5aZCKyU8jFfC7A2JtmU2xphFvK+hAIIgPgsbn2gPQnAGnWDkMM3fzSTYrv9Xpz
	 cKgsG/OE5ov8H5KBcvM9oFdeb1BHpQggDyLqMBJ8Sr4rFNPb7CM74uXqngfKaHXrDo
	 CkU9OQgsOUK+g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 27/29] kconfig: gconf: give a proper initial state to the Save button
Date: Tue, 18 Jun 2024 08:39:53 -0400
Message-ID: <20240618124018.3303162-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618124018.3303162-1-sashal@kernel.org>
References: <20240618124018.3303162-1-sashal@kernel.org>
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


