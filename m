Return-Path: <linux-kbuild+bounces-9016-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1BFBBF96F
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 23:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09990188CC30
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 21:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4FE25FA13;
	Mon,  6 Oct 2025 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIeAyKTW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5164338DD8;
	Mon,  6 Oct 2025 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759786816; cv=none; b=s6l0MSdw+dtzi5EKtYkzIz67GgMsL9RzGvCotutJ1KQ3HStnmth+1h3BUXRFjdy9ZF+3HhqLIzEOtpAKRSpZapKSx/E2/7ytLAcQdF8b11IeC6wwmimYc/D5CKnzvhVe/i6wyiPq9dv6E2UgEyrLCCwHFatmEk63QINw8Yd8O0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759786816; c=relaxed/simple;
	bh=/kZll7JU4hPY8292WJEOlZduNcm/gkWFMlzyj93BMH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N3GF8l4Jd8gBBNjkrX4RoxpoP52FUK2m/ZjZiXrLkKPkEUS5KfcLRsZ1ngGZ5GiYc2kxC+llWuRQ4BJgfCTaGFRVMaqjqt1u4QjsCuU823gQxfk3+hPvbnH4NW3Gk3NBoQx5uIsNW8gV1r5cOKmjf6/ms8vYs88v87uDar5vRMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIeAyKTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147ECC4CEF5;
	Mon,  6 Oct 2025 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759786815;
	bh=/kZll7JU4hPY8292WJEOlZduNcm/gkWFMlzyj93BMH4=;
	h=From:Date:Subject:To:Cc:From;
	b=OIeAyKTWAuNc4dsVY0RVql8Ebrw3cZfjK8DjE9V0fHVAVm1AD4iKoYZTUyDBCF21H
	 a69rA1JP2zUKVlmDf8+Lzsb2W/NP/QDUmB7X1eIBDYWzBtiwOzUoearrcJmmjBasAR
	 gUR1bRTlChHg3HHcYUQwNb68CPAy0eH55x2B04qraJc2wuqQ99d0whd5Tn9Vghqnr9
	 KqI0AJ9cL8rbYN77gJeilPs7h/VxKxwycQmBGmYE5J7dAj2lSbkpkDMfzYKAwHl54i
	 ZSAbjMtCcyYDSU1CG2b11A7o0/I3rGliPkS6kseaguTcJegFfGaMKtzwPLdBA3ETUo
	 EPbEJc8EY7ppQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 06 Oct 2025 14:39:56 -0700
Subject: [PATCH] scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=e
 for hostprogs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-kbuild-hostprogs-werror-fix-v1-1-23cf1ffced5c@kernel.org>
X-B4-Tracking: v=1; b=H4sIACs35GgC/x3MPQqAMAxA4atIZgNtRQevIg7aRg2KlcQ/EO9uc
 fze8B5QEiaFOntA6GTluCbYPAM/detIyCEZnHGlNabCuT94CThF3TeJo+JFIlFw4Bt7qrqCrCv
 C4CEdNqGU/3vTvu8Hs5ge320AAAA=
X-Change-ID: 20251006-kbuild-hostprogs-werror-fix-be6a3e123dfc
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Askar Safin <safinaskar@gmail.com>, Sam James <sam@gentoo.org>, 
 Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=nathan@kernel.org;
 h=from:subject:message-id; bh=/kZll7JU4hPY8292WJEOlZduNcm/gkWFMlzyj93BMH4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlPzG1f7P2ebuZt9f+b93uhXa/OL6k+qGy4z0Rfdu7l3
 xbrHOMtO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEsrYwMswq/p9/ZJFQ/3Xp
 B1PDDMqSlJUdN12Mq/7ldE5Tk7c7cw0jw+unXmfOWnNdOLpN8Ebd560e1se+rElzD9kfznygdNq
 VMywA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit 27758d8c2583 ("kbuild: enable -Werror for hostprogs")
unconditionally enabled -Werror for the compiler, assembler, and linker
when building the host programs, as the build footprint of the host
programs is small (thus risk of build failures from warnings are low)
and that stage of the build may not have Kconfig values (thus
CONFIG_WERROR could not be used as a precondition).

While turning warnings into errors unconditionally happens in a few
places within the kernel, it can be disruptive to people who may be
building with newer compilers, such as while doing a bisect. While it is
possible to avoid this behavior by passing HOSTCFLAGS=-w or
HOSTCFLAGS=-Wno-error, it may not be the most intuitive for regular
users not intimately familiar with Kbuild.

Avoid being disruptive to the entire build by depending on the explicit
opt-in of CONFIG_WERROR or W=e to enable -Werror and the like while
building the host programs. While this means there is a small portion of
the build that does not have -Werror enabled (namely scripts/kconfig/*
and scripts/basic/fixdep), it is better than not having it altogether.

Fixes: 27758d8c2583 ("kbuild: enable -Werror for hostprogs")
Link: https://lore.kernel.org/20251005011100.1035272-1-safinaskar@gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.extrawarn | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1434cb6208cb..6af392f9cd02 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -223,9 +223,11 @@ KBUILD_USERCFLAGS	+= -Werror
 KBUILD_USERLDFLAGS	+= -Wl,--fatal-warnings
 KBUILD_RUSTFLAGS	+= -Dwarnings
 
-endif
-
-# Hostprog flags are used during build bootstrapping and can not rely on CONFIG_ symbols.
+# While hostprog flags are used during build bootstrapping (thus should not
+# depend on CONFIG_ symbols), -Werror is disruptive and should be opted into.
+# Only apply -Werror to hostprogs built after the initial Kconfig stage.
 KBUILD_HOSTCFLAGS	+= -Werror
 KBUILD_HOSTLDFLAGS	+= -Wl,--fatal-warnings
 KBUILD_HOSTRUSTFLAGS	+= -Dwarnings
+
+endif

---
base-commit: 2ea77fca84f07849aa995271271340d262d0c2e9
change-id: 20251006-kbuild-hostprogs-werror-fix-be6a3e123dfc

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


