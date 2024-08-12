Return-Path: <linux-kbuild+bounces-2946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737794EC17
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 13:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9FC51C2103D
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 11:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FB117839A;
	Mon, 12 Aug 2024 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkSZEe6d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B3178390;
	Mon, 12 Aug 2024 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723463430; cv=none; b=Y+yMFmIdwRmUrXUGjiYc+3mca3wiYQuefTbfxttKHmNr+GeZGM7sdVSo4KI0v67N0Nslcr4RHMWje7MnIcZ027IP9gbynscaDx09ZezDU0iZBF7YQ0GBa65EO4CNYzd1jaULnRtAS1Feuijq4VegShQOHi+1SQpLj/eQ8z6onis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723463430; c=relaxed/simple;
	bh=RXcm9Tb/RcqZCEXXLBNnFJzdCQM/VqleiEoUH+5CbV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMa2IT+CW8oUER1krHl0dfEtzDfNpFUefdblocrYvjWgwDcbbgq2M2SaWysKi/0x69f4Vf8itvufxX83Ylz1fxhVLTlL9jHY5M28VTk6xfijUNHGBPt98PsWOEvcvuXaht91yJiLfTGj0FxOrwcyLut3dbYrvjAGYw/Iheqmzic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkSZEe6d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BCAC4AF0E;
	Mon, 12 Aug 2024 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723463429;
	bh=RXcm9Tb/RcqZCEXXLBNnFJzdCQM/VqleiEoUH+5CbV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkSZEe6dG0WSZS93EGYV3xF/cobdcSLIqb5mkROFKbmLGYeDXxY/2xEnWFQcaTT+N
	 tC6DHok6PQmU5+ohQxKCEHzXjcecfP0mDSlpvus6YarQJi++Mv86qBCkogxT6Dkpko
	 DM4CcTfh0Bn/KEOQYFlhxpEucsyd0iKugjX849T0WGG/qAXZQhQutwmm/Jakm4bJo6
	 bD6bYjtPuIQHocr2Hed1qQITSi4Tdw2i86N+2KebrfZTZ1dqm+dMbIWE++IouN8gZ/
	 TrkMOxexOKvYNT00d5IIzcz50b9O0v+gbw4y6Q2qINuwwgf3ZKLaoQTuC7bHL4URyH
	 HlaIzAgSlDV0Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] kconfig: stop adding P_SYMBOL property to symbols
Date: Mon, 12 Aug 2024 20:49:46 +0900
Message-ID: <20240812115023.2101419-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812115023.2101419-1-masahiroy@kernel.org>
References: <20240812115023.2101419-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I believe its last usage was in the following code:

    if (prop == NULL)
            prop = stack->sym->prop;

This code was previously used to print the file name and line number of
associated symbols in sym_check_print_recursive(), which was removed by
commit 9d0d26604657 ("kconfig: recursive checks drop file/lineno").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 323cc0b62be6..854edeb4d2db 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -78,10 +78,8 @@ void menu_add_entry(struct symbol *sym)
 	*last_entry_ptr = menu;
 	last_entry_ptr = &menu->next;
 	current_entry = menu;
-	if (sym) {
-		menu_add_symbol(P_SYMBOL, sym, NULL);
+	if (sym)
 		list_add_tail(&menu->link, &sym->menus);
-	}
 }
 
 struct menu *menu_add_menu(void)
-- 
2.43.0


