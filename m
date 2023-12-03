Return-Path: <linux-kbuild+bounces-247-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3666802279
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 11:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8B31F20F68
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3058F77;
	Sun,  3 Dec 2023 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0F0Nnyp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAAA8F69
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Dec 2023 10:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF795C433CA;
	Sun,  3 Dec 2023 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701599135;
	bh=5SBYjvSXCCi361BUF6jW6e0HVe2sXM0i9kXYxAiDfG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0F0Nnyp3WZmkSirOGw6DV/AN4cIC1JcR0C8H9SZRzwHSlALHuz+2Bnoepfd8ypx+
	 VW/Q0aG5avI60eQyeSm469rI3VsIP7VpiQwldFz3FKqr7zRQZCtutd6za0np9Babm4
	 SRV2eCNl2eh9VVmniqMoUJfFeFLMl3dPnoFpVmJu3Af3uC9TiUme7eVkZKcFJtmcsC
	 dnnXI6gceb5k620eQCgygAiExRPYv3zLiAtKtEPot1LVpdF1fYL7xZIL/YxoENVrY/
	 kljsBARO72ssfdQ4CReLXWLOp2KRUghuhO+OL6bBVp/WxPyOXo9uPaH49L0iFW0Pl+
	 y0O1ffyelLi2Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] kconfig: make menu_warn() static function
Date: Sun,  3 Dec 2023 19:25:24 +0900
Message-Id: <20231203102528.1913822-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203102528.1913822-1-masahiroy@kernel.org>
References: <20231203102528.1913822-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is only used locally within menu.c.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc.h  | 1 -
 scripts/kconfig/menu.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 471a59acecec..3908741edf8f 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -80,7 +80,6 @@ char *str_get(struct gstr *gs);
 
 /* menu.c */
 void _menu_init(void);
-void menu_warn(struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
 void menu_add_entry(struct symbol *sym);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 61c442d84aef..f07c0d8691af 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -19,7 +19,7 @@ static struct menu **last_entry_ptr;
 struct file *file_list;
 struct file *current_file;
 
-void menu_warn(struct menu *menu, const char *fmt, ...)
+static void menu_warn(struct menu *menu, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
-- 
2.40.1


