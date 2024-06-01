Return-Path: <linux-kbuild+bounces-1971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4AC8D717E
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 20:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131A61F21B42
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 18:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A078155302;
	Sat,  1 Jun 2024 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hp43+kMM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ECD1552FD;
	Sat,  1 Jun 2024 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717266053; cv=none; b=sCk7XlkItu1205nT02pH2Ujp8qys4inyKHnms0K2Pq4yF6w9FaxS9nsplgrEM0vxGVEMpN5B30PZZCxOIHeWFvwIhZ5tPibaXiFrFOlidXBXcahd0q6HrObGaBARQ5URlGYALTudZUM6C08xltUzOWIWX8ZufFuli72jtQh9qgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717266053; c=relaxed/simple;
	bh=E5F85lghawtKZIpSKTiIrIxMrzChAjDS5P3cWNMvaVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tlaF5KN4VFXwgU6WmOfjwhAPojE0qSsaOKMzzo4W19Xv9vgT5Gx7hWG6j7bOEsJSfQttnpdQ76A3qmlUTS6TrhNr5TXqJiQFMM/Q3cul5Dm1gniurJFaEM6iFbZ+gYCLYjAfWg33iJ+UfwjSbqB4PwYvgw0dNJvl/k+NiPwRYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hp43+kMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7004BC116B1;
	Sat,  1 Jun 2024 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717266053;
	bh=E5F85lghawtKZIpSKTiIrIxMrzChAjDS5P3cWNMvaVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hp43+kMMvdapXkJayMV2F4P1s1euj8BrDdRb9BHny9uLqM86qa6I4rRvQw0Q1NNe2
	 VcsVs4Hdk4cRywqFb50IbbMXKuIID/NYbkWi7FjbG/8RxcZJKDAKB85FRJ2XlFrQrS
	 Nmr+kZXssjcXj46y8B7ssFPSFXjy+p7ZLT5m1QkoZxs8mvmQZgOjrtCYjMXChlpDS8
	 QIsK3i8RfsEo4daXbDRNVRDsWwS3msS1kY5Lk0Oa4LfTWVyb3+70Zc5v0SpGQijKi9
	 s1V9tlQQc8LR5JCxjPODFlTjmI/zsrnvfWETPRF9xO5jf8kXptJz1gAldw2YbR4+/j
	 0U1+njnMC3GkQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/6] kconfig: gconf: remove unnecessary forward declarations
Date: Sun,  2 Jun 2024 03:20:41 +0900
Message-Id: <20240601182043.876249-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601182043.876249-1-masahiroy@kernel.org>
References: <20240601182043.876249-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are defined before their call sites.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index e04dbafd3add..3dc459d9840c 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -65,8 +65,6 @@ static void display_list(void);
 static void display_tree(struct menu *menu);
 static void display_tree_part(void);
 static void update_tree(struct menu *src, GtkTreeIter * dst);
-static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row);
-static gchar **fill_row(struct menu *menu);
 static void conf_changed(void);
 
 static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
-- 
2.40.1


