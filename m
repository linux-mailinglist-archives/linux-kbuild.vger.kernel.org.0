Return-Path: <linux-kbuild+bounces-2197-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F3F90CDA6
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 15:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 895B61F20F67
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685491B4C38;
	Tue, 18 Jun 2024 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t55Y3PX+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42D1B4C29;
	Tue, 18 Jun 2024 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714575; cv=none; b=ONNWv9A4gJpTaTrjQmKDo9/GvQxdQYSVN1egFT5JJBSgtG5TkaEWIfsSQhIskSelmx+/xrjgc3YWGSTvr3jrxFmEFvLl4bsI3Ndn62KT+hh0LA5B0fPweE3e0HQIelXbZDon2TnCWnzLsYBdZD6YEL+c9oRUZzhSxj3shxGTg5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714575; c=relaxed/simple;
	bh=pq4Obcyrxwrh9BWrEONsvbAQStNBsMohdM71s9bWxDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNv8a8JdcYVwnBlogDvFB1KaC/Hd1GN47pNfncXQrsBYupqT5dPal/S8J4ob+pfSeQZoZL/Pl/MqDTeUyVBZP17pDRy8/6NZhwYSsUXUY/05YoDLHQp03TJGIkkD/JcY9GUaY3c7OxuBNPMUPGE8LzDuct6y11o/6qXLGxpsKKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t55Y3PX+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBBBC3277B;
	Tue, 18 Jun 2024 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714575;
	bh=pq4Obcyrxwrh9BWrEONsvbAQStNBsMohdM71s9bWxDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t55Y3PX++4CBoiY7lRYz/k8tZ8be8o79vMe46DRcg0Wu1bkG1rR5yMZwbq0TIU9d5
	 5r59lgr8/uW/dgykgNpoI18fYN1+ueOD+ptEgtin4X+4SxGe4r/SvDP7yv5YxezEPP
	 n1umB8L4lGLjOEWJXeJV2KJiUYwPusKZaI271ERBkIAY67LhUCEF9rvLiIwxJy8hJs
	 jjeD8pS/OGQNDXqcaIBfQfLG6aoKTt/oyISbScbwrZl1YwwwnFZN9He4VF0ZlNlttq
	 n2b2zmrQvAnzOQ3LdZhCQ4ueH7+I6K7johcJlfyhgGCZTAMTtNozluYuvXt/fFFBr4
	 hpoUQDZN8jgjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 12/13] kconfig: gconf: give a proper initial state to the Save button
Date: Tue, 18 Jun 2024 08:42:23 -0400
Message-ID: <20240618124231.3304308-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618124231.3304308-1-sashal@kernel.org>
References: <20240618124231.3304308-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.219
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
index 5527482c30779..4097999127315 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1484,7 +1484,6 @@ int main(int ac, char *av[])
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
@@ -1492,6 +1491,8 @@ int main(int ac, char *av[])
 	init_left_tree();
 	init_right_tree();
 
+	conf_read(NULL);
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
-- 
2.43.0


