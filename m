Return-Path: <linux-kbuild+bounces-5947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A9A4CDB1
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Mar 2025 22:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B760F3A7312
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Mar 2025 21:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EC41EFFA2;
	Mon,  3 Mar 2025 21:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSqNzfik"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D6B1E5213;
	Mon,  3 Mar 2025 21:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741038766; cv=none; b=ShkbStd3og/imRnrNotGcibAyGc/yUHpFo1aLVMgYeu6xrM9nDS6DZjjQln3R3IpfkfI7YKqRNTsdh86ldKeZF4eEXqC9Okgf6H1GkSuxU6RBPLN9agL8X/q9PR4wL5+6m7UnEloMvhUcrhKbnf7IoXvNtcPDZJQQ5rHpcRAkx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741038766; c=relaxed/simple;
	bh=5u8kfojZwKUUhSAm2BNerYZcjQOmKlfy3X+YC7zYZRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lIMN321zYGShKhKmzyIj0MBiJMpjcHyjEh3Tj1eGL5n1rFA41Pw44ua7flR4297qG8OagesQ4Hl3HPR4mjAjjcoFlSmMD3Bq9n+tB0Sv10+AgIDeXXdBJZ3I5cSaUbKu2iBFTsFxCBSS4fWsvjfS041wYi7bNuyG/Cq7HLUVs28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSqNzfik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A622C4CED6;
	Mon,  3 Mar 2025 21:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741038766;
	bh=5u8kfojZwKUUhSAm2BNerYZcjQOmKlfy3X+YC7zYZRY=;
	h=From:To:Cc:Subject:Date:From;
	b=lSqNzfikbpnoZYDMtA/etknEuUAqP9odrbb3O0I3M7EN/cz8fM3CkX3zyWZ7HTOgW
	 2u/9pGOVduJ9CEgCEvbdFE+l+ZSvgZC9z0GD7KxqmDmrTI80MH1lHRuyrQk/9Ib91Y
	 AoOiOQKQd3v48bMfODpnBrnv6S6WG46oyN/atlHR4oOoBh/vbhhIIW8UpfSXIMzzek
	 RCkfLw+1yvxHC1yiaL6pMfSvb5P715rBp+n+8KEWoJRCHv33rWpdreywLFRmi8TT+t
	 KbNuD9VlrBpe7YzKXCwnYxduER+FLqqQSz5k5gisdpTzhhUtY/wAkdLCeTnFnDh7Q0
	 pjHEk3kgLGVog==
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	David Gow <davidgow@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] kbuild: clang: Support building UM with SUBARCH=i386
Date: Mon,  3 Mar 2025 13:52:41 -0800
Message-Id: <20250303215240.work.379-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=kees@kernel.org; h=from:subject:message-id; bh=5u8kfojZwKUUhSAm2BNerYZcjQOmKlfy3X+YC7zYZRY=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnHVFYGcmZcbd+5tO75XZ8Txdf6H6k+3nnxgvHn8Glfo o5NK3h/t6OUhUGMi0FWTJElyM49zsXjbXu4+1xFmDmsTCBDGLg4BWAiEdcYGWb7+fHoJH6buZ7h jtrvkr7EVOZbsx6u3Capetc31u/KxjRGhvtckmaL3E5/Ypio9d9wXrNrRbrgt38d4ZNDF8z7ovU 4nREA
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
I could not find a cleaner way to do this without hardcoding a test
for i386 UM. Does anyone see a more sane way to accomplish this? The
comment above the CLANG_TARGET_FLAGS seems like it can't be done with
UM's Makefile...

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: llvm@lists.linux.dev
Cc: linux-kbuild@vger.kernel.org
---
 scripts/Makefile.clang | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 2435efae67f5..fa6f9a9be4ac 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -12,8 +12,12 @@ CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
 CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
 CLANG_TARGET_FLAGS_sparc	:= sparc64-linux-gnu
 CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
+ifeq ($(SRCARCH):$(SUBARCH),um:i386)
+CLANG_TARGET_FLAGS		:= i386-linux-gnu
+else
 CLANG_TARGET_FLAGS_um		:= $(CLANG_TARGET_FLAGS_$(SUBARCH))
 CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))
+endif
 
 ifeq ($(CLANG_TARGET_FLAGS),)
 $(error add '--target=' option to scripts/Makefile.clang)
-- 
2.34.1


