Return-Path: <linux-kbuild+bounces-7284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AADAC4B3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 11:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AD5B7AE6AD
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 09:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75863255E2F;
	Tue, 27 May 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StCqwQGu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DE624DD0B;
	Tue, 27 May 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336908; cv=none; b=eyFz2MzXU/yRczFXc6NKolVXG0QlXKQJ8z1NnqP3XsBhcdAOg+AMfpvqbCzxK7I9195tt9MRx0X8GlfN4pWp8nqpP78MRbP8J9KOH3Svs571ZD4O01zgQgdxB6h33FLYE2Gef5jkH1Tz0648/qs34ujRjMZ+hGm+27LVEmg5Jvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336908; c=relaxed/simple;
	bh=mJ+u0dFjvmLhWGCyPBZC6SR0CjXWkRKtEUQyqfmbyZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+ZgNo2vGd67S3yE5uL+m0+h4XrywrT0iOolsG189b1v46ZHdg/+4vvimI1zhkUMoDqUotHXNnIOvceXzV5fSgWEINoixn1mZdnzRP0BS/PTln8aaFjyRXfThWugM/eAcLV5JtaxtSU7D3qnOpkgclq17xOvSPFpvEIups68JNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StCqwQGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05D9C4CEEE;
	Tue, 27 May 2025 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748336908;
	bh=mJ+u0dFjvmLhWGCyPBZC6SR0CjXWkRKtEUQyqfmbyZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=StCqwQGuNrVgFgShnwE9QA4NR2Dc6TP3BZ+3NBDt9lBj2J/Y5y/Y0pw54N9LsiTsu
	 cPqHMsTFaFMYWBK1PFHHJjhdU1i/CEoUgWGUhx0sbtdImVBn+XZ8ofQYGzH3qiWvYa
	 B7gFuzqiz/KF52I6rncyuqaCNL7t28FeoV4Y5PiL90mD7gtOnpOLeg8fHE3Ux0b2g0
	 qax7PF4zT+hjYtsJnqBpFpWlhBrxVnRZ9LkMrDAF4KVBhXMQTPDHAudQS7Eo9gev1p
	 1NPk8b2Ese3JKM/YGHWQjfTuAl4N/gFFN9JU2v7l1TpdZ4FWmfx8npDFsfuMBQxwaI
	 fkkAlwl/e1+Sg==
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v3 6/6] kbuild: Create modules.builtin.modinfo for modpost results
Date: Tue, 27 May 2025 11:08:00 +0200
Message-ID: <6e34b761f118c2b2a4d05cabe9ad89ee8e1dd4c6.1748335606.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748335606.git.legion@kernel.org>
References: <cover.1748335606.git.legion@kernel.org>
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
index 250c0492b7e0..8fed895fd858 100644
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
@@ -97,14 +109,26 @@ ifdef CONFIG_BUILDTIME_TABLE_SORT
 $(vmlinux-final): scripts/sorttable
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
 # modules.builtin.modinfo
 # ---------------------------------------------------------------------------
 
-OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+quiet_cmd_modules_builtin_modinfo = GEN     $@
+      cmd_modules_builtin_modinfo = \
+	cat $< $(wildcard .modules.builtin.modinfo.modpost) > $@
 
 targets += modules.builtin.modinfo
-modules.builtin.modinfo: vmlinux.o FORCE
-	$(call if_changed,objcopy)
+modules.builtin.modinfo: .modules.builtin.modinfo.vmlinux FORCE
+	$(call if_changed,modules_builtin_modinfo)
 
 # modules.builtin
 # ---------------------------------------------------------------------------
-- 
2.49.0


