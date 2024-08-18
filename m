Return-Path: <linux-kbuild+bounces-3078-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB36955BF8
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 10:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 420DC28222D
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 08:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F008317555;
	Sun, 18 Aug 2024 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRAR6uaP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C446E17BA0;
	Sun, 18 Aug 2024 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723970292; cv=none; b=to6rAvKc1AL+GNjREjWUjkoNvesCQhBiBmpbYQREFfnnmDPdK4zvkpjiSa0W77OBMuszEZmNnYugKGS8me+Y1QcOu4a7ZG+wUOxCFpR9eh4BQl7TrCerrE1lvb2Xft/oxBfpW9GX0nxDvjPBLXB1LGfDTTSFune/QQl/4yRD9Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723970292; c=relaxed/simple;
	bh=jT194/Ou95KSctdJ0aHoMZVxM8AJCuPndU2NBTAIfvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cR+tZa/w7x9YUfuOimFu3Btk6XjG/3rS/W5sbNsVCodbLHWkedXSVcd8/qPr6oqNnubTbi5eCothVzB7r99bfH/8XdlRkX3x7VFm8XtdVEEmxM5SGdhaJVek27FsJoxBG2emJP1LUjzRWBna8zdLlA9W2yw23I5nxk+CdL2sPpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRAR6uaP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA20EC32786;
	Sun, 18 Aug 2024 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723970292;
	bh=jT194/Ou95KSctdJ0aHoMZVxM8AJCuPndU2NBTAIfvY=;
	h=From:To:Cc:Subject:Date:From;
	b=kRAR6uaPe3WDkL6tt4WLqnG2pm5iHIw+msYdkNDGDVG1NPSpI+LMVsFeiYGKcOrAx
	 q4Li7Iy15TIJ2ZmVJnMYM/POlLCP1kU+sBX+gq30Wau8uo1HRQsXoDfRXUIv17mJwg
	 Dg/V+79Cy1B65pOCK+2AhSzJekam+jraGjZ2Wvd0tvN1BT5YzdWwAPfB9hGymdc5re
	 NqhOS3vIr+5u0Mem6v1CKbubIiViU9Ud47H9TYUeo5lBP5nXrUCF4sccKOmDNIDHc6
	 2YBnmfUnQzaVZTunV9+H1H+17quaMwNhM9mDxkEKfGj2kS2D0c4R95cS8hEba1bvju
	 IJ44/UfZaJnxA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: remove *.symversions left-over
Date: Sun, 18 Aug 2024 17:37:29 +0900
Message-ID: <20240818083806.90631-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5ce2176b81f7 ("genksyms: adjust the output format to modpost")
stopped generating *.symversions files.

Remove the left-over from the .gitignore file and the 'clean' rule.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .gitignore | 1 -
 Makefile   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index 7902adf4f7f1..ac8c667c0df6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -46,7 +46,6 @@
 *.so.dbg
 *.su
 *.symtypes
-*.symversions
 *.tab.[ch]
 *.tar
 *.xz
diff --git a/Makefile b/Makefile
index 0a364e34f50b..c8d651a30397 100644
--- a/Makefile
+++ b/Makefile
@@ -1946,7 +1946,7 @@ clean: $(clean-dirs)
 		-o -name '*.c.[012]*.*' \
 		-o -name '*.ll' \
 		-o -name '*.gcno' \
-		-o -name '*.*.symversions' \) -type f -print \
+		\) -type f -print \
 		-o -name '.tmp_*' -print \
 		| xargs rm -rf
 
-- 
2.43.0


