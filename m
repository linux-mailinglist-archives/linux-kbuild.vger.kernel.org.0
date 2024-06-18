Return-Path: <linux-kbuild+bounces-2191-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2890CCC4
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 14:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47D25B2A9C5
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 12:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6437419DF5F;
	Tue, 18 Jun 2024 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnbDwPbD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B215531C;
	Tue, 18 Jun 2024 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714388; cv=none; b=O7lnqjKRzw8KS2vx7DJ4Uc36IYLoSQ+d9ZNNMTJPCZ8TMYTibpJ9Y8/MNp/7eiK+VcXi6oQnopdp2dW8RyFE0k7gYn6R0laQ3RWTLG5WOYprji3N5dkO2/vSlTYgcaElIRZXOGfyYCOUXmwn6rPMC4KzsHtJS7wFb2u7M0mX8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714388; c=relaxed/simple;
	bh=s4+1+7M6oBgFUS6xD1rZ9h3camBb+b2cSRjD+s6Karw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UwrT0l97BhYKA0VxDD9IKT624xL8CAOrATme0hQez264on6MX4UxfnMwm287YEih/IBOMKIRQrU27St0TjxMZP+t6/nOlD3qgWZxVaQLd1sll0r5P2P6WOwMU1IvGR2zn6uOfqdOk6Ez6V9ULvrTAV5yPYukc7Pi1tbNT1n3Oq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnbDwPbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC9AC4AF48;
	Tue, 18 Jun 2024 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714388;
	bh=s4+1+7M6oBgFUS6xD1rZ9h3camBb+b2cSRjD+s6Karw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OnbDwPbDHe2ZtoOT04cokOglNHJwu5lFwdxUjuLtMTOmp7ZLTRGNBy6I1LPAexkOL
	 jQABMY88vl0HpgGu7muRKifGBQXnydyx/eZ0wny7S4B2XYLU7+0kxvH9R24Ju0/+np
	 THpzDaie1P4keq0MoE43hvq0E7WBkERvumklhQAS8fbNb02sIanICJQL8C2hX9m9IR
	 fTiBleXtRByzK7Qc9wTZNuknGWxbEMeRpl3q/Wmr6cOTTE/RZSLdCI9lsmvxPj4RJ9
	 zbRB39prW4BnDH+FjpopumQUphvFeo4A1VKDo8fX8Cr9/W/zN/bskVQ5xLP83V8M6m
	 8SiYB0xz1W+PA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 31/35] kconfig: gconf: give a proper initial state to the Save button
Date: Tue, 18 Jun 2024 08:37:51 -0400
Message-ID: <20240618123831.3302346-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618123831.3302346-1-sashal@kernel.org>
References: <20240618123831.3302346-1-sashal@kernel.org>
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


