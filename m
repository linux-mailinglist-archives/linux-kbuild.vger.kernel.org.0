Return-Path: <linux-kbuild+bounces-1963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A25C8D61B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 May 2024 14:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8781F274A3
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 May 2024 12:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974021586C2;
	Fri, 31 May 2024 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJYZLkhM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C40739FF3;
	Fri, 31 May 2024 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158512; cv=none; b=r1GkvGor21jm20BKC9nuPmguaHno2fKU94e22wjbuqEBPvvO+3Z6NrvoHgocenUrWZFPFrInup9OfSwd+0FJ+Ag9ZWBb0FVYBDeMdzxwsmv1KaaM4DWGdvsw0L7vRxEmim4IzDV6+3ioEOGShxp1JiC8XsG4huYiTV+tN//VzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158512; c=relaxed/simple;
	bh=z4ruzD56OZPWPzQYpYgTNc4Tq1V0MYMO9wYsXWqIpKI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QL37CU81G5gXOm7sle3XAGanifLbLikxI5TC5hPPsxzkEyyAFVm9hutJnsogul2qQ8UN+j9JUn0G4nEgcDz8ghzNTkNbDVFoylWRHJBHVk6ZkXQmIkwRhZxq5b6ImNAxi/GRXJMrsYeHfYA3rXz55ZAX9QKpi67aUaPPM3Y6th0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJYZLkhM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F1BC32781;
	Fri, 31 May 2024 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717158511;
	bh=z4ruzD56OZPWPzQYpYgTNc4Tq1V0MYMO9wYsXWqIpKI=;
	h=From:To:Cc:Subject:Date:From;
	b=sJYZLkhMsPzY5OGXDbm/gd0vcmG3lgyvt+C0ripDS2x66QuN6Sg9QGcTSZnB8ehZH
	 guptbHgKhMvpghLd6TMQ6VUcQFqM6fzPJe1UG++2heMUL+YXWxqeFez3rHPrL1ytek
	 bi3EjU73JE9LrYjyWmd0CimGr36lLfQnDEFfaJLLnQwjWzOXTUMXsYesI3YXsJf0Ck
	 pRw0TiYJSds6n4wpUDNsz1jGRLWPlEuYUcfz7oxmBNwtfQ61Q3kqrTaTlj0O/Fmg0k
	 jM83pk/V7HoguzYFuBGsyprdEt3EZ74aA8Gunwflg6DNks+cEf3334SzyollguYisT
	 ov88nLSw1hCqA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] usr: shorten cmd_initfs in Makefile
Date: Fri, 31 May 2024 21:28:25 +0900
Message-Id: <20240531122825.699771-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid repetition of long variables.

No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index 132ef7e96e6d..75224d927025 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -62,9 +62,9 @@ $(deps_initramfs): ;
 quiet_cmd_initfs = GEN     $@
       cmd_initfs = \
 	$(CONFIG_SHELL) $< -o $@ -l $(obj)/.initramfs_data.cpio.d \
-	$(if $(CONFIG_INITRAMFS_ROOT_UID), -u $(CONFIG_INITRAMFS_ROOT_UID)) \
-	$(if $(CONFIG_INITRAMFS_ROOT_GID), -g $(CONFIG_INITRAMFS_ROOT_GID)) \
-	$(if $(KBUILD_BUILD_TIMESTAMP), -d "$(KBUILD_BUILD_TIMESTAMP)") \
+	$(addprefix -u , $(CONFIG_INITRAMFS_ROOT_UID)) \
+	$(addprefix -g , $(CONFIG_INITRAMFS_ROOT_GID)) \
+	$(patsubst %,-d "%", $(KBUILD_BUILD_TIMESTAMP)) \
 	$(ramfs-input)
 
 # We rebuild initramfs_data.cpio if:
-- 
2.40.1


