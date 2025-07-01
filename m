Return-Path: <linux-kbuild+bounces-7807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E03AEF819
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 14:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A1FF188A74F
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 12:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68138272E61;
	Tue,  1 Jul 2025 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaOl1GPZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC027147E
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372089; cv=none; b=O8AL2bWuccP9jYu8zZ0AXSHomywL1Kfwa0UtbEoP72dNzhIj0ZNMxHJ2xyaTS8jKbncPJonofCv9//Rw8KDtpYNwztSTZHzJttq9SERGmn+GGLGQnfyUYzbwaBqMvV984RXuuJpN8kThmcZYEeKntGWYo8vaTYm1ZvMHIadmYjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372089; c=relaxed/simple;
	bh=nCd+iepaCFuXzRRXMAhKx+YoZoKxikqLTYETaJrmXNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMX1UGEU5yAnpKNRzeGLs1x2bh2l9SybCeFkPRhXYR3PMz5e+JG7U1yxdqV6T0rfN2yWFz55ixD8idm5fSlnoJMHi1VETkfLH5eKC7QablB+yaKXtfOxJwjm0+BsBPt5Gm2jHmKU1/1033vnlCCJAqe+LWjixAF7+vRRaq9SRXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaOl1GPZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DF6C4CEEB;
	Tue,  1 Jul 2025 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751372088;
	bh=nCd+iepaCFuXzRRXMAhKx+YoZoKxikqLTYETaJrmXNs=;
	h=From:To:Cc:Subject:Date:From;
	b=BaOl1GPZo7rgw5L4MH0oBmzYg6ivpZBUDikSWv1gS/qtSnj5dJ428C/SvGKiX5JDd
	 ABtmwEF9RSyVDzrY/F9jPVHBSQ6itpLkz1T79lXByfIPZlvwfwgSvzPY0VCcdWIaFJ
	 nsPfo2IA1WV2bDFWVTyVgAWpnSRf3ukPK/wo7ajijRNaHVG6KlXXZDJuZ4Kvo364p+
	 RaNlmQeFGEPlVBJC9xW89iCaMFyG7fqjXE/ckQ72doyPv/Qno0ACzVlh2cx2jhLWas
	 ixtUtJS8ULfGdSZr+NmcxQivf5gdyeeyBBFn6/8UzCTpU1RXy6/6gBM9tALF5E37Ou
	 aav1WtzCRQ0QA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Subject: [v3 PATCH 0/1] kconfig: improve gconfig
Date: Tue,  1 Jul 2025 21:14:43 +0900
Message-ID: <20250701121444.950640-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This replaces just one patch in the previous submission.

 "kconfig: gconf: preserve menu selection when switching view mode"

There was a corner case where the menu selection was not preserved
when switching to Split view.

[Test Case]

[1] Choose Full view  (default)
[2] Select "64-bit kernel"
[3] Choose Split view

In v2, the selection of "64-bit kernel" was not preserved.

This has been fixed in v3. The remaining parts are the same.

In case you are interested, I pushed the entire patchset to:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git gconfig-v3

The code diff between v2 and v3 is very small, just as follows:


diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index e43d83dcdfb8..6edead20c3c9 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -281,13 +281,9 @@ static void set_view_mode(enum view_mode mode)
                gtk_widget_set_sensitive(single_btn, FALSE);
                break;
        case SPLIT_VIEW:
-               browsed = NULL;
-               if (selected) {
-                       if (selected->type == M_MENU)
-                               browsed = selected;
-                       else
-                               browsed = menu_get_parent_menu(selected);
-               }
+               browsed = selected;
+               while (browsed && !(browsed->flags & MENU_ROOT))
+                       browsed = browsed->parent;
                gtk_tree_store_clear(tree1);
                display_tree(tree1, &rootmenu);
                gtk_tree_view_expand_all(GTK_TREE_VIEW(tree1_w));



Masahiro Yamada (1):
  kconfig: gconf: preserve menu selection when switching view mode

 scripts/kconfig/gconf.c | 82 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 8 deletions(-)

-- 
2.43.0


