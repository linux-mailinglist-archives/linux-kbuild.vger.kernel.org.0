Return-Path: <linux-kbuild+bounces-7629-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C72AE6A35
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3722716737E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137EC2D5425;
	Tue, 24 Jun 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGYfcmXF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE34D2D542A;
	Tue, 24 Jun 2025 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777639; cv=none; b=pe7kxYUGnqzFJX/SE9WSS+K97oBEJ5lUMiGsLR26cb1zRxIQ6qRCggryY4Fe1z1QOmQbU60wrnwhthk2TnxcFUv7BwudlFs0gIeXLgkMG+AZVmWUtmKA47AQMBfNHHLWAYKPURrTObo2K8R3xcr+0wZGRg0ZlJFU5Efs/0Nz5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777639; c=relaxed/simple;
	bh=k2NOJDd4WyxGkuIsE1HIihZfigsXw8giYrRK/ujwMkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpMUXBGPUILi2K/k7TANogiAb0XzzPNFbss7EMxpNRoAawR0Sv6k0Td86eLLq4avHWFQ8nVDLBeKGAbsOOtyczkBJUKJNwMnrtN8ZDszA4XxuvuoFVCHUXhZqMqwQqNrtOn9y4AQFEryxDnBk7ziBUkTUsc4OYWBJf4cSDKWt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGYfcmXF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3ACC4CEF9;
	Tue, 24 Jun 2025 15:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777638;
	bh=k2NOJDd4WyxGkuIsE1HIihZfigsXw8giYrRK/ujwMkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SGYfcmXFxDnrt450tAXYRzYTCvOtlLunFbJm7zWQUfbDMQuTX5chI4p0Bq4pkYDvZ
	 Dm4PzcjWewoRb9m95XsfPk42PnIiMq5vEg0Gv9JmpbQNlzeh3aAuWgFv34avMX6nXE
	 BO/PF90wF5//AtIiHRekfXRoij9RdXh7zjlN5MOVUPR2my0xFnn02c5AO3ayj3hDP7
	 FNHg4Rlc7+6MW7qDBDZczfOUYSNA3Tec7j6ti8aeYwaJkJGXaBFIBXGzrMTskovwAJ
	 IJb620rC/lXhxniNF2hjEVtjm/l4HCwsJ9hwNs1CjKeNK7ROTdlTvvj5T62ddc2pla
	 Mngum5E8whVFA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/66] kconfig: qconf: do not show checkbox icon for choice
Date: Wed, 25 Jun 2025 00:04:50 +0900
Message-ID: <20250624150645.1107002-3-masahiroy@kernel.org>
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

When you select "Show All Options" or "Show Prompt Options", choice
entries display a check box icon, but this has no point because
choice is always y since commit

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index eaa465b0ccf9..546738a5c3b1 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -92,7 +92,6 @@ void ConfigItem::updateMenu(void)
 {
 	ConfigList* list;
 	struct symbol* sym;
-	struct property *prop;
 	QString prompt;
 	int type;
 	tristate expr;
@@ -105,11 +104,10 @@ void ConfigItem::updateMenu(void)
 	}
 
 	sym = menu->sym;
-	prop = menu->prompt;
 	prompt = menu_get_prompt(menu);
 
-	if (prop) switch (prop->type) {
-	case P_MENU:
+	switch (menu->type) {
+	case M_MENU:
 		if (list->mode == singleMode) {
 			/* a menuconfig entry is displayed differently
 			 * depending whether it's at the view root or a child.
@@ -123,10 +121,13 @@ void ConfigItem::updateMenu(void)
 			setIcon(promptColIdx, QIcon());
 		}
 		goto set_prompt;
-	case P_COMMENT:
+	case M_COMMENT:
 		setIcon(promptColIdx, QIcon());
 		prompt = "*** " + prompt + " ***";
 		goto set_prompt;
+	case M_CHOICE:
+		setIcon(promptColIdx, QIcon());
+		goto set_prompt;
 	default:
 		;
 	}
-- 
2.43.0


