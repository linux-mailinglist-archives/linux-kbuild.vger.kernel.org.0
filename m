Return-Path: <linux-kbuild+bounces-4336-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D99B1A33
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 19:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A759B21625
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 17:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13507179958;
	Sat, 26 Oct 2024 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3zfmce2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA6B762E0;
	Sat, 26 Oct 2024 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729965363; cv=none; b=fCdYWtoCbl8vQHutkHrWcECOqAoIn9u3RQJjDJc9r2+O7KDEoo2GFyORmSo6SDQXSQ1Xo/N27ph5VMQfzA2fPFHeF2hqwgVfk5mfi7txJMrn5kGc2vPJnG1y6zCdKNqvLqFv4zQRjX6UPtFl/zXYE7gUobLWT8ia6mH/2zRXaZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729965363; c=relaxed/simple;
	bh=4aAnqjjuMlAI0YIEyDESxoHakeSyc2E3S1raxh+sCIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J10BN5BOc/TyscztQoAX7vj/p2bQ9n61KpTDF72T+dNpdXzRFbo72+E7EoN3iYTEWZTvnaFbSnaazldLPzxSsaHl29jV6FekBhFNBNyuNbQ8CsEvZytJcZQW9TpNzd1hdiT8XOhFsXT1QqHmXZwrhPNaQJL8XCIagKgElWg1W+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3zfmce2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DFEC4CEE7;
	Sat, 26 Oct 2024 17:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729965362;
	bh=4aAnqjjuMlAI0YIEyDESxoHakeSyc2E3S1raxh+sCIo=;
	h=From:To:Cc:Subject:Date:From;
	b=Q3zfmce2b/3AKiN+8S3tLXc+c7OOXgTEL29uR2kA/Xx1TZSGQO5YQzCoVkGCW13Xf
	 Er+nWEy7rT4u2WRC1APQuusYIBp4Z/SuL6hGcfQphvM0PLDacyoYUNKAn0ooJDVxwD
	 XdQx9044/20YCYDPOK2eVRWAWJHQci3d473X4dZ2AvTXj0P50bbSv2M1V+sGPPNP9V
	 cRnlsqFtUyVk5RcjGLF7gGqnFRSHfxNNF2BTfZDapLbuV0kvyLNgxjGBFfSVaG9nDZ
	 O03LXBpLdnbfBW9igXe6/ttWLAgq8EJRx82DjU+h6OiYvpFXTsz4Cyoy+xhe1wBmtr
	 EjvrPH7DD/uJQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Edmund Raile <edmund.raile@proton.me>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: show sub-menu entries even if the prompt is hidden
Date: Sun, 27 Oct 2024 02:55:50 +0900
Message-ID: <20241026175552.112954-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f79dc03fe68c ("kconfig: refactor choice value
calculation"), when EXPERT is disabled, nothing within the "if INPUT"
... "endif" block in drivers/input/Kconfig is displayed. This issue
affects all command-line interfaces and GUI frontends.

The prompt for INPUT is hidden when EXPERT is disabled. Previously,
menu_is_visible() returned true in this case; however, it now returns
false, resulting in all sub-menu entries being skipped.

Here is a simplified test case illustrating the issue:

    config A
           bool "A" if X
           default y

    config B
           bool "B"
           depends on A

When X is disabled, A becomes unconfigurable and is forced to y.
B should be displayed, as its dependency is met.

This commit restores the necessary code, so menu_is_visible() functions
as it did previously.

Fixes: f79dc03fe68c ("kconfig: refactor choice value calculation")
Reported-by: Edmund Raile <edmund.raile@proton.me>
Closes: https://lore.kernel.org/all/5fd0dfc7ff171aa74352e638c276069a5f2e888d.camel@proton.me/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4addd33749bb..6587ac86d0d5 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -533,6 +533,7 @@ bool menu_is_empty(struct menu *menu)
 
 bool menu_is_visible(struct menu *menu)
 {
+	struct menu *child;
 	struct symbol *sym;
 	tristate visible;
 
@@ -551,7 +552,17 @@ bool menu_is_visible(struct menu *menu)
 	} else
 		visible = menu->prompt->visible.tri = expr_calc_value(menu->prompt->visible.expr);
 
-	return visible != no;
+	if (visible != no)
+		return true;
+
+	if (!sym || sym_get_tristate_value(menu->sym) == no)
+		return false;
+
+	for (child = menu->list; child; child = child->next)
+		if (menu_is_visible(child))
+			return true;
+
+	return false;
 }
 
 const char *menu_get_prompt(const struct menu *menu)
-- 
2.43.0


