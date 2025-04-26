Return-Path: <linux-kbuild+bounces-6759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13722A9DC3D
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 18:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69B039A042F
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 16:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354525E45A;
	Sat, 26 Apr 2025 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahkBZ2VG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2085C25E451;
	Sat, 26 Apr 2025 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684335; cv=none; b=HOmYgJ2Vq/3IFfTTnuLyhb0e5lgLv8fOGjpq4PQz6xPVqJEzQL6S2KFwjJAkjv88mGuNt6n6fE8zWM3965QFRzYBO770C8auPyfUioMlW942c6B7Lb5htk6VSYonUSGnguG5kcqvkIxPrY34ayJPDZMwVmoI+lUk57UuiWZv8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684335; c=relaxed/simple;
	bh=VB+M5vAwIzWGp+MpkOLUXHL28PE4kRrexHY6v8U4zLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pa7UsGy+2eramv1jb2RT4VmfSU1ICd3ViNzQn5OcUoU/lrlQdy/DfzGDjAhun0nzANnk9zz4NzDfkCOP5tV0UgGC6spD31mU3lBanBDvjO6Q2j0wjnnEZnsl2anSwgrzEF1Hy3sO4iXMP/ZDY5jCRRLGg4w1pI34JgU3VhBI4+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahkBZ2VG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326BAC4CEEB;
	Sat, 26 Apr 2025 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745684334;
	bh=VB+M5vAwIzWGp+MpkOLUXHL28PE4kRrexHY6v8U4zLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ahkBZ2VG8KOYJCSIaJNvshkA2tLT4y/Nsa2VbPsM2W8BIT18sr84FZIzv/7QM5MdP
	 De/cB2J/s0iOM2JwkxniJZG9/6HkJBs1fErLjz+eTM/vl3o/CTUfMgwjlHzOIK4iua
	 5DvyHDrkFzfyXVATEM8QbG+Sv3nsMSFgOCfx0c4UnKulC/i2mFgYwt6DnvuPS0+dmQ
	 OjcskL/xAmT0914Cudq/Pwtobvk0JGMAPowg12rNsTCcoalOCZBHMetodJHTnSgK8n
	 Q9ZbqWXrxQGHT76HKKsG3lN2a909uT4brC2xD0jWQ+ie+ob/1Kkw8i7N8sOtsdrZxG
	 lGKUgtUg3b9RQ==
From: Alexey Gladkov <legion@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v1 7/7] kbuild: Create modules.builtin.modinfo for modpost results
Date: Sat, 26 Apr 2025 18:16:38 +0200
Message-ID: <16dc06bb9edc122a2067a882701f5257d9c5d4e0.1745591072.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create modules.builtin.modinfo as a combination of modinfo from vmlinux
and the result of generating modalias by modpost.

Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 scripts/Makefile.vmlinux | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 033c22c807b5..7a3a21040c4c 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -70,6 +70,18 @@ endif
 ifdef CONFIG_MODULES
 targets += .vmlinux.export.o
 $(vmlinux-final): .vmlinux.export.o
+
+# .module.builtin.modinfo.modpost
+# ---------------------------------------------------------------------------
+__default: .modules.builtin.modinfo.modpost
+
+OBJCOPYFLAGS_.modules.builtin.modinfo.modpost := -j .modinfo -O binary
+
+targets += .modules.builtin.modinfo.modpost
+.modules.builtin.modinfo.modpost: .vmlinux.export.o FORCE
+	$(call if_changed,objcopy)
+
+modules.builtin.modinfo: .modules.builtin.modinfo.modpost
 endif
 
 ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
@@ -97,15 +109,27 @@ ifdef CONFIG_BUILDTIME_TABLE_SORT
 vmlinux: scripts/sorttable
 endif
 
+# .module.builtin.modinfo.vmlinux
+# ---------------------------------------------------------------------------
+__default: .modules.builtin.modinfo.vmlinux
+
+OBJCOPYFLAGS_.modules.builtin.modinfo.vmlinux := -j .modinfo -O binary
+
+targets += .modules.builtin.modinfo.vmlinux
+.modules.builtin.modinfo.vmlinux: vmlinux.o FORCE
+	$(call if_changed,objcopy)
+
 # module.builtin.modinfo
 # ---------------------------------------------------------------------------
 __default: modules.builtin.modinfo
 
-OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+quiet_cmd_modules_builtin_modinfo = GEN     $@
+      cmd_modules_builtin_modinfo = \
+	cat $< $(wildcard .modules.builtin.modinfo.modpost) > $@
 
 targets += modules.builtin.modinfo
-modules.builtin.modinfo: vmlinux.o FORCE
-	$(call if_changed,objcopy)
+modules.builtin.modinfo: .modules.builtin.modinfo.vmlinux FORCE
+	$(call if_changed,modules_builtin_modinfo)
 
 # module.builtin
 # ---------------------------------------------------------------------------
-- 
2.49.0


