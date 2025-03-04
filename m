Return-Path: <linux-kbuild+bounces-5956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5AA4E6B7
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 17:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63CB317EC58
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 16:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614EB28F952;
	Tue,  4 Mar 2025 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARmCPjPb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEEB27E1CB;
	Tue,  4 Mar 2025 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741105296; cv=none; b=iJpEbCEygR/scHhcLmXWF4Ex2ln00CoBt00osSb5UkXf53aD9ly3ey01L70MbxLKgIRsGISdi9KyRGTB+fmaiCRukKM9NDPHr+BjQDFRAsP4gRqAhJ3xsB8A9Waf3NYk8iGImyDV91EoK6Q209MBCYJNLf644RHyKglp6TEQd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741105296; c=relaxed/simple;
	bh=bc8CyVVuLt3oGJmPTQJvLeVvGjaXfhqYN4p17Tr9h0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Cc2nzHt+742aWZHzKMkRO58gr3dPpmfWX8guNiYYfmaTMN/YOpS/0GCYhZUVaJVQiTEKObBZY5EzwlAEeCjZzT9f/I7yklzY7yWNB5fgukYM7r1zmZBBNT/FpcxJg70GYQGpstvy1HnXIOEJk8hkubl1kT2KBKRvG7DRMN3cpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARmCPjPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D93DC4CEE5;
	Tue,  4 Mar 2025 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741105295;
	bh=bc8CyVVuLt3oGJmPTQJvLeVvGjaXfhqYN4p17Tr9h0I=;
	h=From:To:Cc:Subject:Date:From;
	b=ARmCPjPblU7rstfp5DSTmsM3C3brZCeau2qx+PnequBW2x47B7CZE/Cc2C2KUWCJv
	 05TYamAexDG1PuLSJdolDT843q1OLdDPGtT3X5bV/4/rMNQZHX9h9gQwQ3j4PQNciV
	 hHGf6rhSRLp3Y040BJXgFZPo8qbTNwvrGCLfeDRJ2WFHmXgAiziVVLHhqsIVhG4/Mz
	 RNfutL9E/dagWeizM0k1sYEHLLCTM+1yCMgVuVVhiYBAReUhe/P/67bQ2huMZcXhOF
	 iORiKDACCbyFG0S+SYamKTbM1hGQUi6zEbkmJd3T1XUVespy240cWg312Nf2/wkLef
	 jkNlOcdnmXqcA==
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	David Gow <davidgow@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] kbuild: clang: Support building UM with SUBARCH=i386
Date: Tue,  4 Mar 2025 08:21:29 -0800
Message-Id: <20250304162124.it.785-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450; i=kees@kernel.org; h=from:subject:message-id; bh=bc8CyVVuLt3oGJmPTQJvLeVvGjaXfhqYN4p17Tr9h0I=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnHNTqq5849/mGx2sxDL34eW9Nl9KFx/32u5lVvJsds1 cuy3fKgqKOUhUGMi0FWTJElyM49zsXjbXu4+1xFmDmsTCBDGLg4BWAiE18xMnSpyJ3/umn2ktki K3pS3HuXvV0brBSR+VQtWn3efJ/CmXsYGe7uSJ/pq/JA4nfe9HpRa+OX1q++PPk2X3UeM09QwxL p69wA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The UM builds distinguish i386 from x86_64 via SUBARCH, but we don't
support building i386 directly with Clang. To make SUBARCH work for
i386 UM, we need to explicitly test for it.

This lets me run i386 KUnit tests with Clang:

$ ./tools/testing/kunit/kunit.py run \
	--make_options LLVM=1 \
	--make_options SUBARCH=i386
...

Fixes: c7500c1b53bf ("um: Allow builds with Clang")
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Weißschuh <linux@weissschuh.net>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: llvm@lists.linux.dev
Cc: linux-kbuild@vger.kernel.org
---
 scripts/Makefile.clang | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 2435efae67f5..b67636b28c35 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -12,6 +12,8 @@ CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
 CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
 CLANG_TARGET_FLAGS_sparc	:= sparc64-linux-gnu
 CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
+# This is only for i386 UM builds, which need the 32-bit target not -m32
+CLANG_TARGET_FLAGS_i386		:= i386-linux-gnu
 CLANG_TARGET_FLAGS_um		:= $(CLANG_TARGET_FLAGS_$(SUBARCH))
 CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))
 
-- 
2.34.1


