Return-Path: <linux-kbuild+bounces-5859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22DA401FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 22:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4452424586
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 21:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BC920124F;
	Fri, 21 Feb 2025 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myxI1sMM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96EA36AF5;
	Fri, 21 Feb 2025 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740172823; cv=none; b=WRJCJSGuSFKCnW/tDjoofa7wOb1524WgpEqK8IzDhtVocfK05BSdIDLaPyNxEpa7oSxW/OF1pNbgvJuYTebLAu/KIVJt0nNJ74Giue4RQqD5gAm7CxZ3bW9HJjvnBEb7CnfSX1uUZDTnZD/eyu0pikWJBmJ2IlJUpX5EoVByH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740172823; c=relaxed/simple;
	bh=6l55Esk/JWE2IUcizxGDLKnAS3+Yrm1sg9i0T8NQvr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tLdI5vxaRFHI0w0xtADVF8z3tRR8e4s3hYEWnQA00cgsGw1h3+tmUGjUzUB09blu2JHwh9JN6j7rpbMULPKBcL4DrvTZ4h24rmLn0zL2wrQW5htBgg4xwvA4QRkPoAp4z6ezi1gIM4lylXjFEDwPT/SiYQTrWIbQQKlfzrAdiIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myxI1sMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875E1C4CED6;
	Fri, 21 Feb 2025 21:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740172823;
	bh=6l55Esk/JWE2IUcizxGDLKnAS3+Yrm1sg9i0T8NQvr8=;
	h=From:To:Cc:Subject:Date:From;
	b=myxI1sMM0EiOgr3wESX8YGwYtbNN24nEpiPL27pYjFDQGWVoz6DuNGEsxL+plJx1j
	 s1V6KFu+uitYesiCKdLo/pq8RDM6NZ7ZC7InthU2ZVnT6GLUkJSgXfcOjKUHEHPnW2
	 0nqTJ17cKyVBOZzOe+VIxA4Jc4DBbICJWt3StibNg/zLqB5siyJVm78XpivsNyeVZ8
	 JlaGMuJJ07OX1iNX6OCaehydPD5o2SD8HN0a/OKe6HTAKm/NxeLBfO1F40bZb8JKPR
	 uzoAW/VFEaj9ff0vcwOzo/ZFN4NU7/3oBIi6XGVVnqqvkeDxIvprKu4tCB3sx/67pm
	 FiUPDnQ6qMjQg==
From: Arnd Bergmann <arnd@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] kbuild: hdrcheck: fix cross build with clang
Date: Fri, 21 Feb 2025 22:20:07 +0100
Message-Id: <20250221212017.809382-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The headercheck tries to call clang with a mix of compiler arguments
that don't include the target architecture. When building e.g. x86
headers on arm64, this produces a warning like

   clang: warning: unknown platform, assuming -mfloat-abi=soft

Add in the CLANG_FLAGS, which contain the target, in order to make it
build properly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 58a9cbe4eba4..99f9e904adcd 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -10,7 +10,7 @@ UAPI_CFLAGS := -std=c90 -Wall -Werror=implicit-function-declaration
 
 # In theory, we do not care -m32 or -m64 for header compile tests.
 # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
-UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
+UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS) $(CLANG_FLAGS))
 
 # USERCFLAGS might contain sysroot location for CC.
 UAPI_CFLAGS += $(USERCFLAGS)
-- 
2.39.5


