Return-Path: <linux-kbuild+bounces-7649-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9997AE6A67
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B5711C27431
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787B02E175E;
	Tue, 24 Jun 2025 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpicmP/q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA542E2EFB;
	Tue, 24 Jun 2025 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777681; cv=none; b=VHsVjqFXgm1u1QgqHeQrKqIf3ud5FICkgB+c429nt+vN2zMI70f1yF9p5asUVVGc0IkW75SOtDebVwwidZO5kWSC4KIWKLF0U155xZfTBkjwMgiyrxTLT7Xotw/nKZmHeMN351vyJxjKsHHWpenJY6LDRK/+O8qyyTuSq/aQsvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777681; c=relaxed/simple;
	bh=fDBnlVO3Vf85hLDpEe1AKJjaVVFfGIN6/lmQHUXH4fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flHbbhbTV0yYn0YTmCZV/oaeP8bM7AhSorJrOlYp7lxgwdWLuPC42tn6MpDAtV7bSqKZCPNYMkRSVpabRNMmXNuYlAq0axv5ibUUGf+1YbKwtBGKvwxz8ZO//xGBKA9J4phfvL0FeLROhLhmQBG9PYUGQhWN7I02WX54mD7dQ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpicmP/q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94912C4CEEE;
	Tue, 24 Jun 2025 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777680;
	bh=fDBnlVO3Vf85hLDpEe1AKJjaVVFfGIN6/lmQHUXH4fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IpicmP/qWJK0T3NGy3pi4raRiL0y5ktvP/BnsK1EqTI3quFFe5n+ff57/I93+6oMt
	 YN74l8pGWv/1XXtXMhoKgXaI4Mh8lGZ/MKOliVWDwRiOvgh6hGLZTug9N+cMIO3PcU
	 ufl9qjGwQ/i9vlVRP/WEXOTM2WERrRcuB1XjANG1qiiqhXY1AtFsETo1OA/5//TrmY
	 Idyy53UaUqhxPH+1Hn7SamLDcbyrjM2fZ3f0O7hUKctqShxapAZO/1+w78EIGkfUE0
	 Iw8UbDK78qQDnxLMUGs9b/C6QlolMuyNPa23kP1H40wTmMBDctZo5l6cH2dhHtJY51
	 hM+RbubH96xMg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/66] kconfig: gconf: remove unused 'color' variable
Date: Wed, 25 Jun 2025 00:05:10 +0900
Message-ID: <20250624150645.1107002-23-masahiroy@kernel.org>
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

This is not used at all.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index ab2e0df21037..4fff931f34fc 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -43,7 +43,6 @@ GtkWidget *save_btn = NULL;
 GtkWidget *save_menu_item = NULL;
 
 GtkTextTag *tag1, *tag2;
-GdkColor color;
 
 GtkTreeStore *tree1, *tree2, *tree;
 GtkTreeModel *model1, *model2;
-- 
2.43.0


