Return-Path: <linux-kbuild+bounces-1970-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F298D717C
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 20:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18468B21009
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 18:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280D3154C15;
	Sat,  1 Jun 2024 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKYs766B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4B154C11;
	Sat,  1 Jun 2024 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717266052; cv=none; b=uEXx1W5RHi65XITgPQzFJljXxtTvLJPb2fiChzrS7vBDuVoYtMoBPu4rfZQTGQ8Uea3DGwxdn1MjrjMzmrEornoXMOshwQL9wwaHmVTr6PFvoiCdLB+pFwzYX83rN+SmUIQzEvFpKv9RW9bCQ6PFeTq7H/61t0ABvJ7CGbp2RhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717266052; c=relaxed/simple;
	bh=Fa0ZdWT04XOLV0C1EfvYkbNp8hQC0YdrqUUBf3fi3LQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jlLFgbP93+xeX0azf7l2GHVxWXN0iO+IkIMOc6NpXTpqurjl4kzRj3p73s2ClMjbPNdPI3Pg3pyPYZeF6JMeGvDrZ3clRTZTyiL4bD32FF8muNqf7CW/gcZeIINA/wlNahXhPzs3B5vlnzr9RgIeXaOiMVZxCs/xCqE887s8CFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKYs766B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BD5C116B1;
	Sat,  1 Jun 2024 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717266051;
	bh=Fa0ZdWT04XOLV0C1EfvYkbNp8hQC0YdrqUUBf3fi3LQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vKYs766BerGvHqBbKZ08uuTPATpRqpnvr+V9M7M/4WV2oBXKf3M3KTD5X0LO2dp6P
	 GUon2748+68oYULkpfCzF04fj+xiBf9tANhAw1t74cNnwFC5yblmv1ZNHUyIQEo6RG
	 hfWVkRV6sP15F09UhzEaGXIcQgBrKC/+imi2VKWqtDnBdEbHmEZclPKEWGY0zXhB1B
	 fRW+eQs0NbaBgiOHP+Xp7ypLfPnONWCankttt9Z90AmBXT5e1+NzdcuP0jhtglmHcT
	 2th7F3EC0im731l9OaE9d369bnJj0QGq1+peKJx+hkSdwECsGl+PQE9NTBnxO+mG48
	 /R5G9T44MVdVA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/6] kconfig: gconf: give a proper initial state to the Save button
Date: Sun,  2 Jun 2024 03:20:40 +0900
Message-Id: <20240601182043.876249-3-masahiroy@kernel.org>
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

Currently, the initial state of the "Save" button is always active.

If none of the CONFIG options are changed while loading the .config
file, the "Save" button should be greyed out.

This can be fixed by calling conf_read() after widget initialization.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index cc400ffe6615..e04dbafd3add 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1422,7 +1422,6 @@ int main(int ac, char *av[])
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
@@ -1430,6 +1429,8 @@ int main(int ac, char *av[])
 	init_left_tree();
 	init_right_tree();
 
+	conf_read(NULL);
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
-- 
2.40.1


