Return-Path: <linux-kbuild+bounces-6758-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F311A9DC38
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 18:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE4C5A6FD5
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 16:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FE725DCFB;
	Sat, 26 Apr 2025 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAdH+ZFy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21825DD13;
	Sat, 26 Apr 2025 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684332; cv=none; b=VhWHNpaiXBB0YWzBh8S/bVnktkn9oE1+9o3MalPx6zBOPHCN27c83GZdON9o5n5GfFZGMPWbfCpOg182QQs3BEu2zH534R2GKEDzNllCwsjPuY6axNrbNDxzbfXKMlGHgBbZ0RyHD1YXqzjDxW45zHSOoih6HRmNqC20iLv+zTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684332; c=relaxed/simple;
	bh=VpdxUksVEEWXN7gV5SmhieXumztwaT1Jbewjkh76gSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmcITF7CVwdX1dvU3OaSOOiOW3qg/C/rDQlokVxNkf9menhDJgQHXX1rmNOijB9yAJjUOtYXx9NXsKNKrcqMPk+/unMaCUVXwmNFZ7dvkV1DKcWHXVQlIHuXlz9OJepEwBkD75lSFycARvuhes6186XlhV/weFeiMKyF2wDdZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAdH+ZFy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4FBC4CEE2;
	Sat, 26 Apr 2025 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745684331;
	bh=VpdxUksVEEWXN7gV5SmhieXumztwaT1Jbewjkh76gSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fAdH+ZFyaYOsUWLAHmAJKlUxbi3ewgVmsJEW2t1Xqzg3UyXpa4lrFRwgG+tKZcd6M
	 S8/hjBf6flROdadfQmf4F2f7tAHkZ2z/o17pCBZqgMF4Tu65CWjfgWhUL/RukOANMN
	 Phh9TFfCucqDUKP2zOtU/DBlQTHJlhzt17LqpawL7nDXYT3osQQJe6NlVDlZcLbPO1
	 BRH+HBgd4b7OXn1XixMhOlIGmIAkHIWGXb7LUVp0X8+ulWeuu0ifnogrBGRg8v0S3T
	 fMPe4HDWPOW4LQm7XAp3ku4ZfIsCTjavE6VRGYQi1s+4mvLn/IPwjUlg7WA4pYuUl0
	 3yTWdlm28SvMA==
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
Subject: [PATCH v1 6/7] kbuild: Move modules.builtin.modinfo to another makefile
Date: Sat, 26 Apr 2025 18:16:37 +0200
Message-ID: <b31fe393315a452fc6ea63c0ed4b937ab82143df.1745591072.git.legion@kernel.org>
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

The creation of modules.builtin.modinfo is going to depend on
.vmlinux.export.o so it is worth moving its creation closer to it.

Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 scripts/Makefile.vmlinux   | 26 ++++++++++++++++++++++++++
 scripts/Makefile.vmlinux_o | 26 +-------------------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b0a6cd5b818c..033c22c807b5 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -97,6 +97,32 @@ ifdef CONFIG_BUILDTIME_TABLE_SORT
 vmlinux: scripts/sorttable
 endif
 
+# module.builtin.modinfo
+# ---------------------------------------------------------------------------
+__default: modules.builtin.modinfo
+
+OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+
+targets += modules.builtin.modinfo
+modules.builtin.modinfo: vmlinux.o FORCE
+	$(call if_changed,objcopy)
+
+# module.builtin
+# ---------------------------------------------------------------------------
+__default: modules.builtin
+
+# The second line aids cases where multiple modules share the same object.
+
+quiet_cmd_modules_builtin = GEN     $@
+      cmd_modules_builtin = \
+	tr '\0' '\n' < $< | \
+	sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
+	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
+
+targets += modules.builtin
+modules.builtin: modules.builtin.modinfo FORCE
+	$(call if_changed,modules_builtin)
+
 # module.builtin.ranges
 # ---------------------------------------------------------------------------
 ifdef CONFIG_BUILTIN_MODULE_RANGES
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 938c7457717e..23c8751285d7 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 PHONY := __default
-__default: vmlinux.o modules.builtin.modinfo modules.builtin
+__default: vmlinux.o
 
 include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
@@ -73,30 +73,6 @@ vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
 
 targets += vmlinux.o
 
-# module.builtin.modinfo
-# ---------------------------------------------------------------------------
-
-OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
-
-targets += modules.builtin.modinfo
-modules.builtin.modinfo: vmlinux.o FORCE
-	$(call if_changed,objcopy)
-
-# module.builtin
-# ---------------------------------------------------------------------------
-
-# The second line aids cases where multiple modules share the same object.
-
-quiet_cmd_modules_builtin = GEN     $@
-      cmd_modules_builtin = \
-	tr '\0' '\n' < $< | \
-	sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
-	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
-
-targets += modules.builtin
-modules.builtin: modules.builtin.modinfo FORCE
-	$(call if_changed,modules_builtin)
-
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
-- 
2.49.0


