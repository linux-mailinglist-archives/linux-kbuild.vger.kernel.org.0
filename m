Return-Path: <linux-kbuild+bounces-2072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD479042E8
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB22285208
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A2C82D83;
	Tue, 11 Jun 2024 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUPQyBZu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A665B05E;
	Tue, 11 Jun 2024 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128570; cv=none; b=tJkuv4L4jqaNGFTjLFNRORZzZFsa5QWwpsEWSnoUpUGMuxVlgw/mhbW8ycr9s4ubVUKY+4CjQhhJ/9m5sW4J2OjM/YsHyZA4VfnYNmPEuFn+oOVmRZH4Vlba+tehdSd9f06Q8Jtb+2GIr9GsmaiaSh0YHA4AvFkHdXBDPa60dtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128570; c=relaxed/simple;
	bh=x/4XpM89xtG/46/uay0k335CF5phqgQe+6ZvVRKmCB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+M5/XX3P8N+fIQYlBm2gU11bM+GxawKQb0lG0cm3u1yWFige9oZRx3G91IbdXX8ORAeBc0ht57gnGACpoJLP6Pry+LgYCZfZ/MJu6M46i7bDBvZMyxc1YRgJgGxRkGwFht/pAdR3uQSyC9lmZeef6GCnGZHtIYb6sxZT/G94dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUPQyBZu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354D5C4AF49;
	Tue, 11 Jun 2024 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128570;
	bh=x/4XpM89xtG/46/uay0k335CF5phqgQe+6ZvVRKmCB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pUPQyBZulwbY6e6Bj/i35pKNC/7GqbAJQSPYIruXB48bAfrDMlgjGT7EU3v4jydoS
	 9SoBtqFoJ4qcZd/FfABXCMcVy2gAX5o4PISyZEovalay+w9/NJRAw8MaNyon5XuujD
	 G7BB3IIL7sij60t1X8FSonFz5VYS9ClOwon+zuNZNtPHCa8oIH16Id7111D3SqX/RF
	 SfRDiXjCfOxm30pehlEyyVWUEe8LKv04h8yDLHSUQIb8Bu7NKB9WSOMN/d6vR/tH7J
	 l2VzC9z4kK2QFWJXsaw0DWg0gPRLNvxeCtk6iVyU5PqPmGrRaq5VA9TjNBu2PJ7BW9
	 RryJ8/gzy57OQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 08/16] kconfig: remove conf_unsaved in conf_read_simple()
Date: Wed, 12 Jun 2024 02:55:17 +0900
Message-ID: <20240611175536.3518179-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611175536.3518179-1-masahiroy@kernel.org>
References: <20240611175536.3518179-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This variable is unnecessary. Call conf_set_changed(true) directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 05823f85402a..4359fbc9255b 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -477,7 +477,6 @@ int conf_read_simple(const char *name, int def)
 int conf_read(const char *name)
 {
 	struct symbol *sym;
-	int conf_unsaved = 0;
 
 	conf_set_changed(false);
 
@@ -508,11 +507,11 @@ int conf_read(const char *name)
 		} else if (!sym_has_value(sym) && !(sym->flags & SYMBOL_WRITE))
 			/* no previous value and not saved */
 			continue;
-		conf_unsaved++;
+		conf_set_changed(true);
 		/* maybe print value in verbose mode... */
 	}
 
-	if (conf_warnings || conf_unsaved)
+	if (conf_warnings)
 		conf_set_changed(true);
 
 	return 0;
-- 
2.43.0


