Return-Path: <linux-kbuild+bounces-7628-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A6AAE6A20
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863F53A9081
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EE22D4B44;
	Tue, 24 Jun 2025 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoRVcCtQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD712D4B4E;
	Tue, 24 Jun 2025 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777636; cv=none; b=NeOh9CIQRvmz8Zatq0d2LtlQNLzuawExoiOS1aRiYaGw89QlJ7JTMEyq64Af2JjuT6f2/Khc4jxgpjT29qFLQQfi9N2JHctzHCGHLCUiA2cxOWk/HzSHnjcav5xNw/RuvkgNB1Ur2Gw3r4Lt4kY9EgHA28q7uB7r0jBx02M9KL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777636; c=relaxed/simple;
	bh=j1FD4ygSwgRg8KFd13ZX/QlrkSJQunfO6Cp0mPtSoFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4aja/M92NwG3H/7dj9Bd/rUnhmi7pscLQmpzllQzRIcV9D+KqV7tHZNo0btoXaIYNnwPI0326That/3SwyC4JsbeeT8ANJ5BWtiIeAbfWFU6EE9zZcwIzKutm9i9KpHBARDheOw9ls/+SPITobcCZG2sQP3cdB4sXB70s/ajNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoRVcCtQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441F0C4CEEE;
	Tue, 24 Jun 2025 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777636;
	bh=j1FD4ygSwgRg8KFd13ZX/QlrkSJQunfO6Cp0mPtSoFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoRVcCtQ5FYwXYhtatpS8QhqHc52bvPBkssbtlXDIqPpTR1WeioMG58G9WPJrLmn3
	 JiUTGR3SIUDoKyrxSCHe8Tgap33cyzPoOJLKc0OipDJWiCQOGdGhbL0QT0+ASZB4PK
	 AmJ/l5Vt4tz2fgvpjRlHPZ3x3n5n24w7ikzuSbWbofDD//jRKib4ZzpvmQSUqzpOxU
	 Gw3JSW183Tk8GTbLJDtw3BqD/cD4xrErkhWQGVInYNJ+bTGjySDzzImAt6fknoHSk0
	 UvmEEXXXC+ALtAPOFdDpuOZbGfbXfa/ORYqu4MfqznLiIZWE0PzLz08psyOhzWjp1+
	 2EQpzreIrc6UA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/66] kconfig: set MENU_CHANGED to choice when the selected member is changed
Date: Wed, 25 Jun 2025 00:04:49 +0900
Message-ID: <20250624150645.1107002-2-masahiroy@kernel.org>
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

In gconf, choice entries display the selected symbol in the 'Value'
column, but it is not updated when the selected symbol is changed.

Set the MENU_CHANGED flag, so it is updated.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index d57f8cbba291..26ab10c0fd76 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -195,6 +195,10 @@ static void sym_set_changed(struct symbol *sym)
 
 	list_for_each_entry(menu, &sym->menus, link)
 		menu->flags |= MENU_CHANGED;
+
+	menu = sym_get_choice_menu(sym);
+	if (menu)
+		menu->flags |= MENU_CHANGED;
 }
 
 static void sym_set_all_changed(void)
-- 
2.43.0


