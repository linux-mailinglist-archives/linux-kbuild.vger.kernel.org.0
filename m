Return-Path: <linux-kbuild+bounces-4291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED7B9AD3DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA4951F237A7
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1BD1E8829;
	Wed, 23 Oct 2024 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1rb2+rR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0520B1E8822;
	Wed, 23 Oct 2024 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707516; cv=none; b=ATh1zu2cleGlzD5m1VC6/+ZwNl8vzYOkPNtFGlXMTpXDVfLkpDsjvmFNS+kuItv4RoKPjNkidI3civ0og0kqZ53TrqRF8GdsfgbU+FD7VzjK3Dun+/1mrzmMfF+UkKpTI9Gvh+ow7c25rtM8vhuJ+EArVISoa0LAwSv3fs6hAKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707516; c=relaxed/simple;
	bh=GBdvS28YS75rH62yiPtB0hM0b5IeDi5QhyAWFnPK+hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qi8sfT7Ho6/5YYSV7pVZ3ALnzRl8Ft/XtyKB7zrteadXuGDnNWU2RkfCwXKJMxrQNf8L9KnxyzMxrf+bsiQC0IF7ymWXERYIfygP0hxw1cTNhr8Jlco4Q40MYpN5NNn5xPhcmTHJlquUXlV4ci2hJWQRUNv6GickfHbkYXKQYNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1rb2+rR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D249C4CEE6;
	Wed, 23 Oct 2024 18:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707515;
	bh=GBdvS28YS75rH62yiPtB0hM0b5IeDi5QhyAWFnPK+hg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1rb2+rR36ss36eKMN+EeqvgOVIPOoPtVslS1LWDBkkyzd/1aPvl7kcbZyAoT5rKH
	 vv3l2Z1Q93kFJWCgK9za9F6ZyIQU41tBoSX+kuA1ozwzTnGE9oTsZFvyjxIyZW4vgV
	 lgkYRKEvaaqvh2kd2aS07zVUqYRQQmEhGAE+l6VCd8IJsuJqVGjbTNosB+zCyq6LW/
	 sHjipJXjcv4DeSDB6v4n5THq36zI02/9L/L3I+M1WYFKcfk3e+CqIXR+6NX6akaQwl
	 6BacoJuEtTIdr+PF7pzXiZzTqWXiI8/fVUSLSjaXuAHna4VhxR8DNa7siwuXkP7B5q
	 ASedA/ZgcKM6A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] kconfig: qconf: avoid unnecessary parentSelected() when ESC is pressed
Date: Thu, 24 Oct 2024 03:17:58 +0900
Message-ID: <20241023181823.138524-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the ESC key is pressed, the parentSelected() signal is currently
emitted for singleMode, menuMode, and symbolMode.

However, parentSelected() signal is functional only for singleMode.

In menuMode, the signal is connected to the goBack() slot, but nothing
occurs because configList->rootEntry is always &rootmenu.

In symbolMode (in the right pane), the parentSelected() signal is not
connected to any slot.

This commit prevents the unnecessary emission of the parentSelected()
signal.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 5b1237bf085a..1948cda048d2 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -724,7 +724,7 @@ void ConfigList::keyPressEvent(QKeyEvent* ev)
 	struct menu *menu;
 	enum prop_type type;
 
-	if (ev->key() == Qt::Key_Escape && mode != fullMode && mode != listMode) {
+	if (ev->key() == Qt::Key_Escape && mode == singleMode) {
 		emit parentSelected();
 		ev->accept();
 		return;
-- 
2.43.0


