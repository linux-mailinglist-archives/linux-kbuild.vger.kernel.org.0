Return-Path: <linux-kbuild+bounces-7630-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1895AAE6A23
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE323BAF19
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8263E2D5C91;
	Tue, 24 Jun 2025 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nD5DJe+Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA22D5C8D;
	Tue, 24 Jun 2025 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777641; cv=none; b=tysO0pA4UxkVSzdP9a//RXMuMwMueI/vSAmoDFPmoDsspva+EZH7nRZHx44A2F8exV0Uzm+0cBWkJ6jt2wkUDd85ijomesUvK5oeaOK0aCPW3MauzHjescQFRbLgmveHc8X1Q4VytNgdch621Kh/5BhuLmY/hagz4yfpHFsDZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777641; c=relaxed/simple;
	bh=vXHWheFK4x7pNBTOmoAzKUemIC8EldPFZ/dufBVbqjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNl3RwLDeIZEt+1GR4dTDLoks34wyxKZPJaLMuR+cjk2WgK6xCSLEiMS+qsIrrwDaT7xA53PuB6IS+QTx2On0vCTgPof7ICDoTHR9bu/FjCWUIxqU+OtxHbFBzbIqGGa9DD501/mJoqtTJagNJbFrO2XZzsG1E26PIQtsT8cwR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nD5DJe+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CA9C4CEEE;
	Tue, 24 Jun 2025 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777640;
	bh=vXHWheFK4x7pNBTOmoAzKUemIC8EldPFZ/dufBVbqjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nD5DJe+QLliaJf41q6nnYLfY7Y7woQ5o+bY6XkH+K0yylNvg0UsDityvI/1fr94dl
	 zzEi/fsR3nKFh94BZ+ALY8lSiQRjwpWTrIqUwOxFLqGYj31spt6AEorJ1KguUH27CT
	 S6xGZKOVsRiPUW6il7+DRt62FLOcUSPdclWrWnUgDh5YJcC1aenkugCvGCpxm3Lue8
	 so4YfCAJfol7f5nv/3FAPNEAlSkFeQQ0HmvbQZMn8XuRrHk06oMeuLeGSWz1EDDGPI
	 CNrjuPuBTbn5n8aEevyezWciRlgbFP+05OiPHEZMGIR+eEMS1co9WnmHsR0xRoM1JH
	 95s+Xg3Ux0UmQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/66] kconfig: qconf: show selected choice in the Value column
Date: Wed, 25 Jun 2025 00:04:51 +0900
Message-ID: <20250624150645.1107002-4-masahiroy@kernel.org>
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

It is useful to display the selected choice's value in the Value column.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 546738a5c3b1..68640e507ec4 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -127,6 +127,9 @@ void ConfigItem::updateMenu(void)
 		goto set_prompt;
 	case M_CHOICE:
 		setIcon(promptColIdx, QIcon());
+		sym = sym_calc_choice(menu);
+		if (sym)
+			setText(dataColIdx, sym->name);
 		goto set_prompt;
 	default:
 		;
@@ -189,7 +192,11 @@ void ConfigItem::testUpdateMenu(void)
 	if (!menu)
 		return;
 
-	sym_calc_value(menu->sym);
+	if (menu->type == M_CHOICE)
+		sym_calc_choice(menu);
+	else
+		sym_calc_value(menu->sym);
+
 	if (menu->flags & MENU_CHANGED) {
 		/* the menu entry changed, so update all list items */
 		menu->flags &= ~MENU_CHANGED;
-- 
2.43.0


