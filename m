Return-Path: <linux-kbuild+bounces-7323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2DBAC9EAC
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 15:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDD057A57E8
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 13:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9C81DF965;
	Sun,  1 Jun 2025 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoMLFgie"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0B1DF728;
	Sun,  1 Jun 2025 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748784758; cv=none; b=a6RwY2K8j44ejZ5+KZQYO9URnDp8LC4VVqEFSvLA9De1pR0AXvuE/RgRzD3+6MJpZw7vv3rdQhtgvKsdPgGf2wC0bSPz/ZH2XDKb7GkU+yLBkAnforOGA+irCSByfI4Y7AxiRm9PtPahcvS6Wz9GPBTkXh6BCTsiwao/0oGiil4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748784758; c=relaxed/simple;
	bh=IWswQbq1umiUoRkFAOFoXa17Kapp/Teii1vl6rZFSWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGQa5qf+m7SdnCLgjnzbvwULfxiM5DIIVT/N+g/86MR8TudFr4BGFlJlHB9u/grAum+WDSqC6QowYA1nbvOKe5VmoAhMpP6If7RJAA6ZCQI9ltimDZg+6gZRbfT1WUiSFEdLhn0SA1EHzDYu/ys/9t/Sp2E96qiqOad8vI9ZQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoMLFgie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD5DC4CEED;
	Sun,  1 Jun 2025 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748784758;
	bh=IWswQbq1umiUoRkFAOFoXa17Kapp/Teii1vl6rZFSWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AoMLFgieGOhuxs5w9poDwD3COlbIH+6JKtr3cq1J3HahoruGtJEqE5bklknvaFLcl
	 nFlZ8OKIRoB0t87HV5ahB/oKxKG+GBy0zKv/3beEnrciIZt8RoZ/GWluOPp8gFi/jX
	 mtcFxkfhXzp0l599P6RpepCY+fU0xtQ9LLWrmdUbnsyNR1AomsbGQhESp4yGebTLaP
	 dflOsV1l52PaO+F5hLQls0dZJSYnEhyV5OEt0HzEIC3aUuZxtzqMzP7CDAtd2GmZv2
	 nqhigIP0cPgsEiZEQuC987wPKwe/eVrE4u9voSP6TkK0jdczOlu6leeY4TZiYo0oBS
	 EJIiJqw4YUP1Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 3/4] scripts/misc-check: check missing #include <linux/export.h> when W=1
Date: Sun,  1 Jun 2025 22:31:29 +0900
Message-ID: <20250601133230.4085512-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250601133230.4085512-1-masahiroy@kernel.org>
References: <20250601133230.4085512-1-masahiroy@kernel.org>
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
some headers, such as include/linux/{module.h,linkage}, needlessly
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

Changes in v2:
 - Fix out-of-tree build

 scripts/misc-check | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/scripts/misc-check b/scripts/misc-check
index 21551d721079..edc0e44d96de 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -9,4 +9,47 @@ check_tracked_ignored_files () {
 		sed 's/$/: warning: ignored by one of the .gitignore files/' >&2
 }
 
+# Check for missing #include <linux/export.h>
+#
+# The rule for including <linux/export.h> is very simple:
+# Include <linux/export.h> only when you use EXPORT_SYMBOL(). That's it.
+#
+# However, some headers include <linux/export.h> even though they are completely
+# unrelated to EXPORT_SYMBOL().
+#
+# One example is include/linux/module.h. Please note <linux/module.h> and
+# <linux/export.h> are orthogonal. <linux/module.h> should be included by files
+# that can be compiled as modules. In other words, <linux/module.h> should be
+# included by EXPORT_SYMBOL consumers. In contrast, <linux/export.h> should be
+# included from EXPORT_SYMBOL providers, which may or may not be modular.
+# Hence, include/linux/module.h should *not* include <linux/export.h>.
+#
+# Another example is include/linux/linkage.h, which is completely unrelated to
+# EXPORT_SYMBOL(). Worse, it is included by most C files, which means, most C
+# files end up including <linux/export.h>, even though only some of them
+# actually export symbols. Hence, include/linux/linkage.h should *not* include
+# <linux/export.h>.
+#
+# Before fixing such headers, we must ensure that C files using EXPORT_SYMBOL()
+# include <linux/export.h> directly, since many C files currently rely on
+# <linux/export.h> being included indirectly (likely, via <linux/linkage> etc.).
+#
+# Therefore, this check.
+#
+# The problem is simple - the warned files use EXPORT_SYMBOL(), but do not
+# include <linux/export.h>. Please add #include <linux/export.h> to them.
+#
+# If the included headers are sorted alphabetically, please insert
+# <linux/export.h> in the appropriate position to maintain the sort order.
+# For this reason, this script only checks missing <linux/export.h>, but
+# does not automatically fix it.
+check_missing_include_linux_export_h () {
+
+	git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_GPL_FOR_MODULES)\(.*\)' \
+	    -- '*.[ch]' :^tools/ :^include/linux/export.h |
+	xargs git -C "${srctree:-.}" grep --files-without-match '#include[[:space:]]*<linux/export\.h>' |
+	xargs printf "%s: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing\n" >&2
+}
+
 check_tracked_ignored_files
+check_missing_include_linux_export_h
-- 
2.43.0


