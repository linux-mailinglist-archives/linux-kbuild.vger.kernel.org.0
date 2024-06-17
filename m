Return-Path: <linux-kbuild+bounces-2150-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFE90B113
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 16:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FC701F2B5E6
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 14:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1D71A92D9;
	Mon, 17 Jun 2024 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwxnCQFe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35DB1A92D5;
	Mon, 17 Jun 2024 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630820; cv=none; b=F7PUciySWUg3p7NqUjuexpsIoSbwYLz6LszC+aFf68Y14lGTsnmr8jGRLUrBKMpphVc+PSf7HQi7LJ9nHDeBVT6prt0jADdqCgniAoZQJpwkiMKvUZcoVZBBPAUWf1BcVW/jGGzG7Z8bAfg/+k3sY3d9ftlYLVBRnDIcrbiQrdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630820; c=relaxed/simple;
	bh=VVx+gyg9uCTH+BCYB+UzWwtuqgpv9unuu8PXzlSYd94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckaXbXSSdgrL1339f6j+kliXZwFCbst5vABDFKRjLxCZgm+3oGwBUCdpO2yCslAasl8uo6Voz5K0SYJuQxnTzrjk+uKVZtqKXcw3U7kv8PWp68PgrKFF/u5jU9yOpIGdSIsbKmYa0EkZj/AXmLVOYmXLRMWjPokG3mPg7jKBgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwxnCQFe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FCFC4AF1C;
	Mon, 17 Jun 2024 13:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630820;
	bh=VVx+gyg9uCTH+BCYB+UzWwtuqgpv9unuu8PXzlSYd94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NwxnCQFe4aBfzkvDNsqc5R+YMuGIuuVChRZFEOYCbfJ4l9be6jEARP+3faJDuDbO1
	 Ro+6adwCx9WAdMJzylP6Oo9ptXh+2lEjxezAqm0sUNVqHGgufz3aj8fC+VMiHnzmtt
	 t71hiew2MMR5JHb7iVq3JWSeMR8UmUmjFhNuI56Vf/SjCENXEws6j3I6FSTOsf2IFC
	 /LJWsbZ675ZNbQ9f5cl4b/E/CGW/EoWZsmFoIjVwNrU/nb0wKNzKBhVuvMwvVYNRtI
	 WOd5Lhk1l6a22BuhxU4i67G+OulwhOADvP8A4hwzc4Rv1LEUEVWA8hoOdkrUqBGTL4
	 mg/gFcYmm9XbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 20/21] kconfig: gconf: give a proper initial state to the Save button
Date: Mon, 17 Jun 2024 09:25:57 -0400
Message-ID: <20240617132617.2589631-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132617.2589631-1-sashal@kernel.org>
References: <20240617132617.2589631-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.161
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 46edf4372e336ef3a61c3126e49518099d2e2e6d ]

Currently, the initial state of the "Save" button is always active.

If none of the CONFIG options are changed while loading the .config
file, the "Save" button should be greyed out.

This can be fixed by calling conf_read() after widget initialization.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/gconf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 17adabfd6e6bf..5d1404178e482 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1481,7 +1481,6 @@ int main(int ac, char *av[])
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
@@ -1489,6 +1488,8 @@ int main(int ac, char *av[])
 	init_left_tree();
 	init_right_tree();
 
+	conf_read(NULL);
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
-- 
2.43.0


