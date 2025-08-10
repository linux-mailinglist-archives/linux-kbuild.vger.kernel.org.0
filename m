Return-Path: <linux-kbuild+bounces-8330-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FCDB1F756
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Aug 2025 02:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4144169F7D
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Aug 2025 00:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CFC4A21;
	Sun, 10 Aug 2025 00:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alUlh5xP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AFD4690;
	Sun, 10 Aug 2025 00:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754785268; cv=none; b=STyXaTtrZ7NCYoNiZnRSj8v4m2A89wwNEaWNSgxFUE/XPcR5D8V3k7tSLZJKkC8XGYaG3/aJJlB6ARmad7jEGJ7ESRuCFfCR+2yPpezsw1WVmVYwkEow7w+Io+P/w03xqASGTAqsqOPfM8+9ijnXu+Sw+gd2epxY5BAKXI+AfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754785268; c=relaxed/simple;
	bh=+y7S4kQHCrHEcfSakjTKw/7b3LQ0Lq/Sh4/yBj+1Hjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cxabXSFj5B/pIsIdHx2XHciuuuWbr//R0z5u6XB1jLYK7Rf9zKEv+nT2EWlFhA8wUgRxbFBMCVXmFtvzLFhtKewdBpvd974Upuq3gCeInnCADJ0vqj7Q7CqNww3bpdMLItBE6jDLws07g+88x7Pb23TXCt1sIVS6uIwIkBj4MF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alUlh5xP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CAAC4CEE7;
	Sun, 10 Aug 2025 00:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754785267;
	bh=+y7S4kQHCrHEcfSakjTKw/7b3LQ0Lq/Sh4/yBj+1Hjw=;
	h=From:To:Cc:Subject:Date:From;
	b=alUlh5xPFt2yMiOjg1asmCPTQ7knbzQKRq4R7xacO0CVldZub6lE0O/4Xp3ojOFn8
	 zyVGKIV7lbGGuKnTZ/4Zv4tVtGpYVWOb6UlPEt5q7WyAx2kDMaiisLU5YMmk30FjgD
	 H7v1P4Dm3Em1grQ7Lz4WS7MEIRz0g0kTeujHYOCBaM34ZdZ0axH0tAQD/ker3nY7Zi
	 gQdQ2hUvwRXWpozfuk+pSqbN58yWHfC8Oxf633JHELkV92RLRlmL1qgRlOzOeKCrnV
	 JQ/z47PRiLB/nWzQMWh0KYOQ+LTEk7lLqhjWk8iyKJK9STD1srzu2ua5T0xfcE5x4W
	 pBFkbPXD8G32Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	rdunlap@infradead.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] kconfig: gconf: avoid hardcoding model2 in on_treeview2_cursor_changed()
Date: Sat,  9 Aug 2025 20:20:50 -0400
Message-Id: <20250810002104.1545396-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit cae9cdbcd9af044810bcceeb43a87accca47c71d ]

The on_treeview2_cursor_changed() handler is connected to both the left
and right tree views, but it hardcodes model2 (the GtkTreeModel of the
right tree view). This is incorrect. Get the associated model from the
view.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Let me check the commit you provided more carefully. Looking at the
diff:

The commit changes line 851-852 in the `on_treeview2_cursor_changed`
function from:
```c
if (gtk_tree_selection_get_selected(selection, &model2, &iter)) {
    gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
```

To:
```c
if (gtk_tree_selection_get_selected(selection, &model, &iter)) {
    gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
```

Where `model` is obtained from: `GtkTreeModel *model =
gtk_tree_view_get_model(treeview);`

This is indeed a bug fix. The function `on_treeview2_cursor_changed()`
is connected as a signal handler to BOTH tree views (tree1_w and
tree2_w), as shown in the connection code around lines 989 and 997.
However, the old code hardcoded `model2` which is specifically the model
for the right tree view. This would cause incorrect behavior when the
handler is triggered from the left tree view (tree1_w).

**Backport Status: YES**

## Extensive Analysis:

### Bug Description:
The commit fixes a clear bug in the gconf GUI tool for kernel
configuration. The `on_treeview2_cursor_changed()` function is used as a
signal handler for cursor changes in both the left and right tree views
of the configuration interface. However, the function incorrectly
hardcoded `model2` (the GtkTreeModel for the right tree view) instead of
dynamically getting the model from whichever view triggered the event.

### Code Analysis:
1. **Signal Connection** (lines 988-997 in the repository):
   - The same handler is connected to both tree views:
   ```c
   g_signal_connect(tree1_w, "cursor-changed",
                    G_CALLBACK(on_treeview2_cursor_changed), NULL);
   g_signal_connect(tree2_w, "cursor-changed",
                    G_CALLBACK(on_treeview2_cursor_changed), NULL);
   ```

2. **The Bug**: When the cursor changes in tree1_w (left tree), the
   handler would incorrectly use model2 (right tree's model) to get the
   selected item, potentially causing:
   - Incorrect help text display
   - Crashes if the models have different structures
   - Undefined behavior when accessing invalid iterators

3. **The Fix**: The commit correctly obtains the model from the treeview
   parameter that triggered the event:
  ```c
  GtkTreeModel *model = gtk_tree_view_get_model(treeview);
  ```
  This ensures the correct model is used regardless of which tree view
  triggered the event.

### Backport Justification:
1. **Clear Bug Fix**: This fixes an obvious programming error that
   affects functionality
2. **Small and Contained**: The change is minimal (2 lines modified) and
   localized to a single function
3. **Low Risk**: The fix is straightforward and correct - getting the
   model from the actual tree view instead of hardcoding
4. **User Impact**: This bug could affect users of the gconf
   configuration tool, potentially causing crashes or incorrect behavior
5. **No Architectural Changes**: This is a simple bug fix with no design
   changes
6. **No New Features**: Pure bug fix, no functionality additions

This is an ideal candidate for stable backporting as it's a clear,
minimal bug fix that improves reliability without introducing risk.

 scripts/kconfig/gconf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index c0f46f189060..abe4cfe66b14 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -942,13 +942,14 @@ on_treeview2_key_press_event(GtkWidget * widget,
 void
 on_treeview2_cursor_changed(GtkTreeView * treeview, gpointer user_data)
 {
+	GtkTreeModel *model = gtk_tree_view_get_model(treeview);
 	GtkTreeSelection *selection;
 	GtkTreeIter iter;
 	struct menu *menu;
 
 	selection = gtk_tree_view_get_selection(treeview);
-	if (gtk_tree_selection_get_selected(selection, &model2, &iter)) {
-		gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
+	if (gtk_tree_selection_get_selected(selection, &model, &iter)) {
+		gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 		text_insert_help(menu);
 	}
 }
-- 
2.39.5


