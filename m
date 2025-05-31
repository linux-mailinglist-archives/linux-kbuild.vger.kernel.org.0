Return-Path: <linux-kbuild+bounces-7316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972DAC9C51
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 20:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AA0C9E2E87
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 18:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A73194094;
	Sat, 31 May 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVqZ5KXr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB217A30A;
	Sat, 31 May 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716342; cv=none; b=czZbGLw0nSo+eFlOLbagZooVQRWvInQOLEE1h9pogFryxF05TFUCjnrsWF1w59V19PU8eOAIWirzMLAesCqyd0DTM+K/7Hh46BDiHZI90je2V3SxzYqdcTkyGg3mpXSVsbZ4ubPeuqYGPI1Mpz/Oyc4bXOpMjF+F9hilZeHjtEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716342; c=relaxed/simple;
	bh=/ZsJND5fzftc2cszq8cTexT6uJOrDy350bh50M3G9XI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxset2yzQ+FZs1ZcTJbUVdp4zGL5HjjvAQlFHKffOGbxokR8P504XKaiv0FvPaOmbwZl2zMntlFIOWWLDYjAMyogLA5CWOJfMu8OQxhtnnA2GLDpQXgjsMwMyTJrrfO4X5GO0YHWRdRh+v9or7D+p5/KPaUwez9t3du451Oq2s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVqZ5KXr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C96C4CEE3;
	Sat, 31 May 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748716342;
	bh=/ZsJND5fzftc2cszq8cTexT6uJOrDy350bh50M3G9XI=;
	h=From:To:Cc:Subject:Date:From;
	b=lVqZ5KXr50KIpfplEhXEEbk6uKOMzFjlDex50pREjKKAabcu+alI/eoz+jAj5tgUq
	 kKfzt5WMad19h2qNT9P3HNc7RYFwhVB3q+fsdsfPIi9Aw6GFNLMcmC5wEoiZa92YhZ
	 lzNnlyMVNfqSgY0mdDrBYnV35mJYwNaqX+PHhNK9qf3HNHPls4PZdgKXvUE6/FRr8/
	 G+kQtlbV6ZmHlZGs/Rxc4SbYwCUU6x5FgPZXW/YlGNyOULt9bYrOzH0ZRa5cX/thh8
	 psL60XkTFPpwusRc1y1soaNEc4dIswm3FOBDIXK3OsVkDEa5j1sZNqWg/pQP939B+r
	 qc/ZmBYeM4e9Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: [PATCH 1/3] kbuild: move W=1 check for scripts/misc-check to top-level Makefile
Date: Sun,  1 Jun 2025 03:28:20 +0900
Message-ID: <20250531183217.3844357-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This script is executed only when ${KBUILD_EXTRA_WARN} contains 1.
Move this check to the top-level Makefile to allow more checks to be
easily added to this script.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile           | 3 +++
 scripts/misc-check | 9 +--------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 61f4e7662192..7a52be3a4b80 100644
--- a/Makefile
+++ b/Makefile
@@ -1824,9 +1824,12 @@ rustfmtcheck: rustfmt
 # Misc
 # ---------------------------------------------------------------------------
 
+# Run misc checks when ${KBUILD_EXTRA_WARN} contains 1
 PHONY += misc-check
+ifneq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 misc-check:
 	$(Q)$(srctree)/scripts/misc-check
+endif
 
 all: misc-check
 
diff --git a/scripts/misc-check b/scripts/misc-check
index d40d5484e0c5..f37b2f6931cc 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -3,15 +3,8 @@
 
 set -e
 
-# Detect files that are tracked but ignored by git. This is checked only when
-# ${KBUILD_EXTRA_WARN} contains 1, git is installed, and the source tree is
-# tracked by git.
+# Detect files that are tracked but ignored by git.
 check_tracked_ignored_files () {
-	case "${KBUILD_EXTRA_WARN}" in
-	*1*) ;;
-	*) return;;
-	esac
-
 	git -C ${srctree:-.} ls-files -i -c --exclude-per-directory=.gitignore 2>/dev/null |
 		sed 's/$/: warning: ignored by one of the .gitignore files/' >&2
 }
-- 
2.43.0


