Return-Path: <linux-kbuild+bounces-7481-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDC9AD779F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 18:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAAF01684D8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 16:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B159B29992E;
	Thu, 12 Jun 2025 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQgBvzf0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89948289E20;
	Thu, 12 Jun 2025 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744538; cv=none; b=Dh/EHeZhCVdNTuh8EnuCTqMO9UuytkMioH9jjkx7Fcd7APBoXJou9t3F4M5rPdX7CHG5eZ/MLiq1lFP34YPMx4s06cF9FfFiQbNomHh/gWI6/MEqR0yxLBR5sx4ovqKIVlnaf3aUfRQjo+ypePuQWsA0TmHob2m+zN0L8uhhnCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744538; c=relaxed/simple;
	bh=ZUfCqxpP7UCkVvMOxmAdn4dYkzXim5Bxnpw+NlAjttQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7zkXQn9leTx6Byecy3tIsfdSGdwZKvzFudaZRTDUltsSMLPP0M2CfYXK/MDwXhcK6aP/CHq9wc11lU1bHed+D91KmjA7KpI6vJhZ0wmreWHDVG53dZ1GeI67fz8GDy9SqLDk/SUphyKs9TwohR2xnEJfqbY6tTC6+TcZh7k7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQgBvzf0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF585C4CEEA;
	Thu, 12 Jun 2025 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749744538;
	bh=ZUfCqxpP7UCkVvMOxmAdn4dYkzXim5Bxnpw+NlAjttQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mQgBvzf0G7mVCQ9GV2e3ztp1Bb5R6vtgwDjiQfTN/75wPeBj29HY7NlgRJToFkWcu
	 WVCa4rvg3lYB+uHLNJpXY1AQdVT9MFim0NhYzlF1g2r1LEsnnrOP0duAHiCMDl8cik
	 fRq0hy2Jy9iQIppEkdS9iDlZiS6Y9RJyx6Q61c24B1NLMz95kfNFPGZ3HrsdBnpsb/
	 vGJySM9bExThcCTp2Sk4QeLzPTfe7UOauPdVBZ/KfqqzJM36nfCGa9IiNeZS12K41Z
	 M4wi6myjaBwIKa4Mw6UBA5faCJtRaHgpyeOvuTyfn9UOUf7tDCpIjqjZGq7fFsn+f1
	 jCxnAVcNAqFEg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: move warnings about linux/export.h from W=1 to W=2
Date: Fri, 13 Jun 2025 01:08:48 +0900
Message-ID: <20250612160850.3007038-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This hides excessive warnings, as nobody builds with W=2.

Fixes: a934a57a42f6 ("scripts/misc-check: check missing #include <linux/export.h> when W=1")
Fixes: 7d95680d64ac ("scripts/misc-check: check unnecessary #include <linux/export.h> when W=1")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile           |  3 ---
 scripts/misc-check | 15 ++++++++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 35e6e5240c61..69c534982415 100644
--- a/Makefile
+++ b/Makefile
@@ -1832,12 +1832,9 @@ rustfmtcheck: rustfmt
 # Misc
 # ---------------------------------------------------------------------------
 
-# Run misc checks when ${KBUILD_EXTRA_WARN} contains 1
 PHONY += misc-check
-ifneq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 misc-check:
 	$(Q)$(srctree)/scripts/misc-check
-endif
 
 all: misc-check
 
diff --git a/scripts/misc-check b/scripts/misc-check
index a74450e799d1..84f08da17b2c 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -62,6 +62,15 @@ check_unnecessary_include_linux_export_h () {
 	xargs -r printf "%s: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present\n" >&2
 }
 
-check_tracked_ignored_files
-check_missing_include_linux_export_h
-check_unnecessary_include_linux_export_h
+case "${KBUILD_EXTRA_WARN}" in
+*1*)
+	check_tracked_ignored_files
+	;;
+esac
+
+case "${KBUILD_EXTRA_WARN}" in
+*2*)
+	check_missing_include_linux_export_h
+	check_unnecessary_include_linux_export_h
+	;;
+esac
-- 
2.43.0


