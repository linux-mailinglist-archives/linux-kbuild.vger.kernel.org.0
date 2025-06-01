Return-Path: <linux-kbuild+bounces-7324-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1AAC9EAF
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 15:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB3F93B5D7E
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 13:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367841E7C1C;
	Sun,  1 Jun 2025 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/H6gDu4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5AB1E521A;
	Sun,  1 Jun 2025 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748784760; cv=none; b=XNGPZiwUYZe5ggT/uuwPHRMDIJmSo/yiK2Tw0Q8C5BkLG0thrnuBm+iRkvE+a/ID7l22RrzFurmLIF9v5dnYscZysnhf7VFEvn9RD9LYoqLNnWxZL8kjeEShPLd2VNV/8HMfrlCQoV92uQvgF2o6G+7PbC+YUK4mjAmNbFAa52U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748784760; c=relaxed/simple;
	bh=KeYNjcq+qNyuO2w+gkHkDffK7iSVaqq1T1+cH1wLvM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3RmzSbc1nY3+U++siqct/BsjmKsILvko249v5myMIDV0VTkaGi3DOFq7sI1aBMId9bPGW0ZzJ6jRDSeaFEjNeLCz123FBfm5CD55k1qCDQ30zRu99xfzh1A3AEqRaQspMoR20U1Loiv0aebMKUyPXdvkUO5tiMeEnXptDcBu5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/H6gDu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7299C4CEF3;
	Sun,  1 Jun 2025 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748784759;
	bh=KeYNjcq+qNyuO2w+gkHkDffK7iSVaqq1T1+cH1wLvM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l/H6gDu4jOv8qrsEWyFHujFqqiCbxOvW1og4uEzrhHtDqQ3khTS/p+Ion+Zo+ipg1
	 iIOfE+lDeXxBSNtV6ejNJ2oG5jdB+EkAg/yZkKxZtdlTLnweFdod3sN4U+hTamMUPH
	 Gve9Sr+XOkypef28cId0rU+zfRkVtZaLo/jccTREcgYNYW2X9FzF9MzYu/df5e4DJq
	 6fJ9O8BqT8ZlzGiio5iMuUF8Od1SKBfoNbIKIT9WawYhF3QbxT3NlvK0L9sWAb1uY0
	 BBdm4F7V9PqCA8RjmObRK85War1sESb+YoCv0W4uH0LtxlZ+j7ndZhfnUdEq0POGci
	 393BrLD7di+sQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 4/4] scripts/misc-check: check unnecessary #include <linux/export.h> when W=1
Date: Sun,  1 Jun 2025 22:31:30 +0900
Message-ID: <20250601133230.4085512-4-masahiroy@kernel.org>
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

Another issue with <linux/export.h> is that it is sometimes included
even when EXPORT_SYMBOL() is not used at all.

Some headers (e.g. include/linux/linkage.h>) cannot be fixed for now
for the reason described in the previous commit.

This commit adds a warning for *.c files that include <linux/export.h>
but do not use EXPORT_SYMBOL() when the kernel is built with W=1.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
eries-changes: 2
 - Fix out-of-tree build
---

(no changes since v1)

 scripts/misc-check | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/misc-check b/scripts/misc-check
index edc0e44d96de..f3b6bdce5fa2 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -51,5 +51,17 @@ check_missing_include_linux_export_h () {
 	xargs printf "%s: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing\n" >&2
 }
 
+# If you do not use EXPORT_SYMBOL(), please do not include <linux/export.h>.
+# Currently, this is checked for *.c files, but not for *.h files, because some
+# *.c files rely on <linux/export.h> being included indirectly.
+check_unnecessary_include_linux_export_h () {
+
+	git -C "${srctree:-.}" grep --files-with-matches '#include[[:space:]]*<linux/export\.h>' \
+	    -- '*.[c]' :^tools/ |
+	xargs git -C "${srctree:-.}" grep --files-without-match -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_GPL_FOR_MODULES)\(.*\)' |
+	xargs printf "%s: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present\n" >&2
+}
+
 check_tracked_ignored_files
 check_missing_include_linux_export_h
+check_unnecessary_include_linux_export_h
-- 
2.43.0


