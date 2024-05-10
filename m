Return-Path: <linux-kbuild+bounces-1821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC88C2490
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2024 14:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F83D2813EC
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2024 12:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC1D16E890;
	Fri, 10 May 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OobVJb8S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D116D4C3;
	Fri, 10 May 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342985; cv=none; b=B7bJwfztXzWO1F+pBBM5r5WUcHHrBV9bSIcgxSzDBNfY+JYAwJJWTg5/lRDsU/klYO7og585bidD6CD6ZEdVVMe/idGRm2ypUQypkU6ZhMyFmg6vWoBgVw7eKIsUXJRVty2cq+4m/7Se7FFKokgwK4GzghTEmZEionw922ywMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342985; c=relaxed/simple;
	bh=yYbGGuXHC69tnZRsQ26tkM5twCaSKlBikoei7vmKgoo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UjhOdkYqp5+4U6YXU6nQzHFcQ/09ToYRAfKXtZFQDmT7r34HF8yHeuMrXnIRu64UclYOiJMpGX8MQROxO7xqGpzd++vHjC3A2S5qnvuXoNV37bHQb5xodTGw9/lreQS4HXdljWFuHP4WSOs1382cYZ4IZcGmPi7OsQAEgiGF3nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OobVJb8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9F7C113CC;
	Fri, 10 May 2024 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715342985;
	bh=yYbGGuXHC69tnZRsQ26tkM5twCaSKlBikoei7vmKgoo=;
	h=From:To:Cc:Subject:Date:From;
	b=OobVJb8SiCSkhnTZQgL9wzbEVEhyU2U2xH+fZGvM3eXBHBR1sd7I+BvmeGe0a1ogQ
	 md60rwaUyCSL+6z7XcGlkG7PGZ5sCA7lEcy+/ohz6AtXGcFyEeC++PROZwdflFAet8
	 qnk/lo9GKvPqPcKrAWtkCt7nEuaXL+C28NAtkouipA8MLH714waMbWmXQ6ym2ZjSjV
	 CTs0qDcgAOGUu3g81+QZAak/JrtTtZhaqg4diEaqW+19rS9LY86hsXd3cMu4l8Sqn+
	 KRbA7zDyAA0WEtJJ5OMWRbkYpeS75FDc/auPwLKxy3Deku5OEU3z69q6Hi9UT5sUu1
	 fcqJ4fBaEtaqw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: lxdialog: remove initialization with A_NORMAL
Date: Fri, 10 May 2024 21:08:09 +0900
Message-Id: <20240510120809.2953797-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A_NORMAL is zero, so the attribute is set to the default A_NORMAL
without explicit assignment.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lxdialog/util.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index f18e2a89f613..964139c87fcb 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -17,22 +17,13 @@ struct dialog_info dlg;
 
 static void set_mono_theme(void)
 {
-	dlg.screen.atr = A_NORMAL;
-	dlg.shadow.atr = A_NORMAL;
-	dlg.dialog.atr = A_NORMAL;
 	dlg.title.atr = A_BOLD;
-	dlg.border.atr = A_NORMAL;
 	dlg.button_active.atr = A_REVERSE;
 	dlg.button_inactive.atr = A_DIM;
 	dlg.button_key_active.atr = A_REVERSE;
 	dlg.button_key_inactive.atr = A_BOLD;
 	dlg.button_label_active.atr = A_REVERSE;
-	dlg.button_label_inactive.atr = A_NORMAL;
-	dlg.inputbox.atr = A_NORMAL;
 	dlg.position_indicator.atr = A_BOLD;
-	dlg.menubox.atr = A_NORMAL;
-	dlg.menubox_border.atr = A_NORMAL;
-	dlg.item.atr = A_NORMAL;
 	dlg.item_selected.atr = A_REVERSE;
 	dlg.tag.atr = A_BOLD;
 	dlg.tag_selected.atr = A_REVERSE;
-- 
2.40.1


