Return-Path: <linux-kbuild+bounces-8331-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A6B1F760
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Aug 2025 02:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5355E172FDF
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Aug 2025 00:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EEF4C92;
	Sun, 10 Aug 2025 00:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tcn01sUR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596FD531;
	Sun, 10 Aug 2025 00:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754785280; cv=none; b=Wqtw8pYuqZD/Fs5hnG+3bcVadA1SRimxBnvH7ADW3/E7JtGar0d0xgYJDYknnVfYxFYjUZK+NLaO2LsFx7ZM6iYH0dooOQ/UcUkIjpSCYDNZbGY6jMa4nXJAlA1YHXiH0FULss8q5YyHBNAnaODmLhNha5gpXUx4ChNLLLkkEww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754785280; c=relaxed/simple;
	bh=kvw9MIoi08amuc4ML79U48/Eg8y2wvOuuFGYohZdYP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihyE8TfvHgHUvLMwi8dZPrg1IU0Ts3fdcktKHGHbMz/Ai7SCFulKMg7oDiYVZCKr1qGo1wDz9SuLgauGspKCQBhOqwXhh1yF7CS1pUHZ0PKlmCJijCIdA1ODlnnpJRPMQa9I6luVTwW8fhnUsdiRdU45OF/xUozwpoKGyorQE+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tcn01sUR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D82C4CEF4;
	Sun, 10 Aug 2025 00:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754785279;
	bh=kvw9MIoi08amuc4ML79U48/Eg8y2wvOuuFGYohZdYP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tcn01sURMl5Uzy20EP+AYqWEVAnObr2DViwmIm4nbtY5Xvb51J6nkbdcftbv0T1mT
	 ScVAVtyzkWDrG5v1StdwIaaESoBSLEFzOsiBlATNmeSED5v21n1Q70QqqGfHO5cqJy
	 ww+53bhT9xZbGjrTCptkXnwIqWqLUkc7CFonlY4t+8FxD+rsAoqUW3rJccut0KK+Iz
	 jP+X0Mukn2TfEf4sKw4Z4EI8lTFmmkwZg19sQyO8tJRhwFAXn5RMIyHeHes3eV2WY3
	 Qi5EQC5WYA6wFOxLw3tUNdDf57si0h7OlUuadHpxvggPqtdzKTo21u43NXG3VthcdZ
	 FeXc8GEmrlmgw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] kconfig: gconf: fix potential memory leak in renderer_edited()
Date: Sat,  9 Aug 2025 20:20:54 -0400
Message-Id: <20250810002104.1545396-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810002104.1545396-1-sashal@kernel.org>
References: <20250810002104.1545396-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit f72ed4c6a375e52a3f4b75615e4a89d29d8acea7 ]

If gtk_tree_model_get_iter() fails, gtk_tree_path_free() is not called.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit and examination of the code, here is
my assessment:

**Backport Status: YES**

## Extensive Analysis:

### 1. **Nature of the Bug**
The commit fixes a clear memory leak in the `renderer_edited()` function
in scripts/kconfig/gconf.c. The function allocates a GtkTreePath object
using `gtk_tree_path_new_from_string()` at line 782, but if
`gtk_tree_model_get_iter()` fails on line 788, the function returns
early without calling `gtk_tree_path_free()`, causing a memory leak.

### 2. **Bug Impact**
- **Resource leak**: Every time a user attempts to edit a value in the
  GTK-based kernel configuration tool (gconfig) and the operation fails
  to get the iterator, memory is leaked.
- **User-facing impact**: While gconfig is not used by all kernel users,
  those who do use it for configuring the kernel could experience memory
  leaks during interactive configuration sessions.
- **Accumulation potential**: In a long configuration session with
  multiple failed edits, these leaks could accumulate.

### 3. **Fix Analysis**
The fix is minimal and straightforward:
- Changes the early `return` to a `goto free` statement
- Adds a `free:` label before the existing `gtk_tree_path_free(path)`
  call
- This ensures the allocated path is always freed, whether the function
  succeeds or fails

### 4. **Risk Assessment**
- **Minimal risk**: The change only affects the error path and ensures
  proper cleanup
- **No functional changes**: The fix doesn't alter any program logic, it
  only adds proper resource cleanup
- **Well-contained**: The change is limited to a single function in the
  gconfig tool
- **Standard pattern**: Using goto for cleanup is a common and accepted
  pattern in kernel code

### 5. **Stable Tree Criteria Compliance**
The commit meets stable tree requirements:
- ✓ Fixes a real bug (memory leak)
- ✓ Small and contained (2 lines changed)
- ✓ No new features or architectural changes
- ✓ Clear and obvious correctness
- ✓ Minimal regression risk

### 6. **Historical Context**
Looking at the git history, there have been multiple memory leak fixes
in the kconfig subsystem (e.g., commits a409fc1463d6, ae1eff0349f2,
fbac5977d81c), indicating this is an area where such fixes are
considered important and regularly backported.

### 7. **Code Pattern Analysis**
Examining other uses of `gtk_tree_model_get_iter()` in the same file
shows that other call sites don't have this issue because they either:
- Don't allocate resources before the call (lines 902, 962, 1015)
- Or are in different contexts where the path is managed differently

This makes the fix in `renderer_edited()` particularly important as it's
the only place with this specific leak pattern.

The commit should be backported to stable kernels to ensure users of the
gconfig tool don't experience memory leaks during kernel configuration
sessions.

 scripts/kconfig/gconf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index abe4cfe66b14..0caf0ced13df 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -748,7 +748,7 @@ static void renderer_edited(GtkCellRendererText * cell,
 	struct symbol *sym;
 
 	if (!gtk_tree_model_get_iter(model2, &iter, path))
-		return;
+		goto free;
 
 	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
 	sym = menu->sym;
@@ -760,6 +760,7 @@ static void renderer_edited(GtkCellRendererText * cell,
 
 	update_tree(&rootmenu, NULL);
 
+free:
 	gtk_tree_path_free(path);
 }
 
-- 
2.39.5


