Return-Path: <linux-kbuild+bounces-7393-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD1AD128E
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 16:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D74637A2B37
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 14:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0116420AF62;
	Sun,  8 Jun 2025 14:12:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8617741;
	Sun,  8 Jun 2025 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749391974; cv=none; b=jCR1t68TCFtN4Wcvj2pjpsp3g9qGhT3Oo589nrAnv1XNp1O+BVBxWtR5LUXeQ70FdVHtO/2vO9zW0uRNbLs9/HL+tZjux3B2Hv5Er+Wqy1wRx4hTHrCkKuTEOhAG7jlmMkr+CwcYBcpkb2sIjWtMCugY90viB76hEr4KdWhPxFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749391974; c=relaxed/simple;
	bh=kC/sASmRgK5SCYGUslW8znSv3cW++TJt6arw/fl8sO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g3dhiqhF8A8sF6AX9NvUQkGie8F6xatjrAzuhnGzriyEQAk7lj9uuXxSp35Up6ZBfoxLniWvSY8nAVGDGeokEuXI1rSY/1qZTt/9ANuPsPUsZHe8VG7KZkSepW+Pbj89otCrZeoa5Ih0f9AQQYvypKBl16JVc7Z0SF3KZPzOTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564FFC4CEEE;
	Sun,  8 Jun 2025 14:12:51 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: chenhuacai@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] init: Fix build warnings about export.h
Date: Sun,  8 Jun 2025 22:12:35 +0800
Message-ID: <20250608141235.155206-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
check unnecessary #include <linux/export.h> when W=1"), we get some build
warnings with W=1:

init/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
init/initramfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

So fix these build warnings for the init code.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 init/initramfs.c | 1 +
 init/main.c      | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 72bad44a1d41..097673b97784 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
 #include <linux/async.h>
+#include <linux/export.h>
 #include <linux/fs.h>
 #include <linux/slab.h>
 #include <linux/types.h>
diff --git a/init/main.c b/init/main.c
index 2cf5e9ea84d8..bfdf0fd76eb3 100644
--- a/init/main.c
+++ b/init/main.c
@@ -12,7 +12,8 @@
 
 #define DEBUG		/* Enable initcall_debug */
 
 #include <linux/types.h>
+#include <linux/export.h>
 #include <linux/extable.h>
 #include <linux/module.h>
 #include <linux/proc_fs.h>
-- 
2.47.1


