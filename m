Return-Path: <linux-kbuild+bounces-7321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D2AC9EA8
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 15:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D431618C9
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 13:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B210915CD74;
	Sun,  1 Jun 2025 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8hF7X8O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8854F4A32;
	Sun,  1 Jun 2025 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748784756; cv=none; b=iHyA6Yjta5GiCsqrazOnywP9XpyUFlNYt+oRY7pgL/fXb3Dto3XfO2gGbSxwgs+6p6LzIrQItjCBrzDpkQY3qT83qG13WZSTi5d3e3aZ2QzMU2yxtfkWrUU5LvBmLRUu/tehSFVSO52FR0BhNAwkjczmIaquuNHwhNEyB30ivLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748784756; c=relaxed/simple;
	bh=RR/bpKyYPlC/Fpcz2O0j5WyOlN1NdNHd+82GDdJ+gdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZYx8sRx8ibdZgqjrG3KvBL9YY9AQVvTDfqOvTqWYyk7Gkp4lgsoSoaPXNrIsJQLIcoF5KIvjNEtOY0T9H5QiF6NtdTzhi2uG0my7mn3lK85gmsbtzZpnpWr7icWN27B2L2ZNAE/IcBhnf1oSuijahAtOp+LCbRZR9Ay/M+HlXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8hF7X8O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A93EC4CEE7;
	Sun,  1 Jun 2025 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748784756;
	bh=RR/bpKyYPlC/Fpcz2O0j5WyOlN1NdNHd+82GDdJ+gdg=;
	h=From:To:Cc:Subject:Date:From;
	b=A8hF7X8OG0sRc0pZN56HD8oM8f/X36hsuVBYm66oJrOwXaeIib6oDBj1/x+QRmoWI
	 ikdGFX8Z23ek2oaRkzG2GtevVpFCES5hXKGTMeSek3FiPRz6ESYVYQIjtaJU/hx+UD
	 AYx+SrFXMbv48o+A7ao8qHzi+syKVDB/NFEYdgsWMEAlfsUPwsNtPeR+ulxL5DVBMF
	 PEVZcos4T4P467fALaylJw1B3VasOjWW1WU1dfjCPu/rFUrD+L25basunfF1MBdadD
	 XJaqhm5DozkMkdWHgHLhJW0UST9wHtyyNktjcfyTo/HWv4b3vgvyNjFMhBqd7Y4ZYu
	 A6xkIs3bC/95Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: [PATCH v2 1/4] kbuild: move W=1 check for scripts/misc-check to top-level Makefile
Date: Sun,  1 Jun 2025 22:31:27 +0900
Message-ID: <20250601133230.4085512-1-masahiroy@kernel.org>
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

(no changes since v1)

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


