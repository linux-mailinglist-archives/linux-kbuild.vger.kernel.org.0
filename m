Return-Path: <linux-kbuild+bounces-7317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43396AC9C4F
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 20:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1ED41894E6C
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 18:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4B919F11E;
	Sat, 31 May 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVaY7VxU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415619D06B;
	Sat, 31 May 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716343; cv=none; b=pAeWdfwnueRF5OF2exQPWFk9EXgW+e2VO41YTQtW/2eqADtVuaW1euOnbdHYFH/IyoMYA+T9Ek8h1rfGu8muEPCBkIloAGnJHyYq6+iLjPzKm1/Wv8dxGqrZ3jvOJc71UTxyDSUxC1G17mQWJP/0bWrGa6yaByMYVlp/pamIsU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716343; c=relaxed/simple;
	bh=KWfWrYmK302mCxxIMAK2jeNzv3Uk0Ef7KsClqd2k3Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5/yfu7W4O6LtovmLhYlraWJt58Ji9XMO6xMcIfDbjr7FCyJdZR7K4zb6loJhifdP8bIG7nbz9wOVGsFYq/At+sA/nIXNQqkoEQcrQm/J5i4yzBhNkZxVFr7MrLH2ImD/+G97pSh+KtLrX82EkojnrHiS4Gl7S+rFD0dwqSGbIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVaY7VxU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91141C4CEEF;
	Sat, 31 May 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748716343;
	bh=KWfWrYmK302mCxxIMAK2jeNzv3Uk0Ef7KsClqd2k3Is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jVaY7VxU/pq0AXKPTgoxM7yjucWMqylkjGQ2vNL3dz0AcK3DnH182SQmhu/7mDm05
	 LzabQNBYEPnPQ7OzEM653xWTRnJDTbkRmawbxsT7btRMSEPgtm40alUGZ5WZ74EIuN
	 fvG73lwrPHoU8lEHhg2ao4UN9B2QI6cdNQWo6Qg2IrWlKXvr27x5IUn6d3qUiklTZg
	 BXPaj9Jt2KnNaMj4WdzObPby6uwxgsXuaBW71C7k1D83G0P+UM5iHZtLHHHF5vvUAj
	 u7/L1JmDr4hg/+iQ2hwPQ2E3fAFkPr/eGE0PLBdeG/+xhyxqFzPFiw4wBjqCDZa2ZQ
	 ZYBDm6nQFbM3A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] scripts/misc-check: check missing #include <linux/export.h>
Date: Sun,  1 Jun 2025 03:28:21 +0900
Message-ID: <20250531183217.3844357-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250531183217.3844357-1-masahiroy@kernel.org>
References: <20250531183217.3844357-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The problem was described in commit 5b20755b7780 ("init: move THIS_MODULE
from <linux/export.h> to <linux/init.h>").

To summarize it again here: <linux/export.h> is included by most C files,
even though only some of them actually export symbols. This is because
some headers, such as include/linux/{modules.h,linkage}, needlessly
include <linux/export.h>.

I have added a more detailed explanation in the comments of
scripts/misc-check.

This problem will be fixed in two steps:

 1. Add #include <linux/export.h> to C files that use EXPORT_SYMBOL()
 2. Remove #include <linux/export.h> from header files that do not use
    EXPORT_SYMBOL()

This commit addresses step 1; scripts/misc-check will warn about *.[ch]
files that use EXPORT_SYMBOL() but do not include <linux/export.h>.
This check is only triggered when the kernel is built with W=1.

We need to fix 4000+ files. I hope others will help with this effort.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/misc-check | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/scripts/misc-check b/scripts/misc-check
index f37b2f6931cc..9e618e9f93f6 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -9,4 +9,49 @@ check_tracked_ignored_files () {
 		sed 's/$/: warning: ignored by one of the .gitignore files/' >&2
 }
 
+# Check for missing #include <linux/export.h>
+#
+# The rule for including <linux/export.h> is very simple:
+# Include <linux/export.h> _only_ when you use EXPORT_SYMBOL(). That's it.
+#
+# However, some headers include <linux/export.h> even though they are completely
+# unrelated to EXPORT_SYMBOL().
+#
+# One example is include/linux/module.h. Please note <linux/module.h> and
+# <linux/export.h> are orthogonal. <linux/module.h> should be included by files
+# that can be compiled as modules. In other words, <linux/module.h> should be
+# included by EXPORT_SYMBOL _consumers_. In contrast, <linux/export.h> should be
+# included from EXPORT_SYMBOL _providers_, which may or may not be modular.
+# Hence, include/linux/module.h should *not* include <linux/export.h>.
+#
+# Another example is include/linux/linkage.h, which is completely unrelated to
+# EXPORT_SYMBOL(). Worse, it is included by most C files, which means, most of
+# C files end up including <linux/export.h>, even though only some of them
+# actually export symbols. Hence, include/linux/linkage.h should *not* include
+# <linux/export.h>.
+#
+# Before fixing such headers, we must ensure that C files using EXPORT_SYMBOL()
+# include <linux/export.h> directly, since many C files currently rely on
+# <linux/export.h> being included indirectly (likely, via <linux/modules.h>,
+# <linux/linkage> etc.).
+#
+# Therefore, this check.
+#
+# The problem is simple - the warned files use EXPORT_SYMBOL(), but fail to
+# include <linux/export.h>.
+# The fix is also simple: add #include <linux/export.h> to the warned files.
+#
+# If the included headers are sorted alphabetically, please insert
+# <linux/export.h> in the correct position to maintain the sort order.
+# For this reason, this script only checks missing <linux/export.h>, but
+# does not automatically fix it.
+check_missing_include_linux_export_h () {
+
+	git -C ${srctree:-.} grep --files-with-matches -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_GPL_FOR_MODULES)\(.*\)' \
+	    -- '*.[ch]' :^tools/ :^include/linux/export.h |
+	xargs grep --files-without-match '#include[[:space:]]*<linux/export\.h>' |
+	xargs printf "%s: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing\n" >&2
+}
+
 check_tracked_ignored_files
+check_missing_include_linux_export_h
-- 
2.43.0


