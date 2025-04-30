Return-Path: <linux-kbuild+bounces-6825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C3AA586C
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 00:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04D13BC5FF
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 22:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BE222A4D2;
	Wed, 30 Apr 2025 22:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="st1n5EdK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0C834545;
	Wed, 30 Apr 2025 22:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053806; cv=none; b=eY0f0Y/8IOiHEAcDe/gP/OaRyJmjjTgXUDvR7R6lJkoh9g8zzcr2hRPVP6rCsB8j/Yj1OR12YDVP0soDgAsPYLm01Uvw4u3VqKhhQuceJyAvYLjEAehsHgKB7ovz4E3dxhQgk6aVGdMyzcnAINr5ltsSk4K2CemeSSeB3HgJ4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053806; c=relaxed/simple;
	bh=/xOwbU5+ed/8fEvKgMPKKxMfTBakbgn8YBkdvdq0rso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b8AoZ+6Or1m7ZAG5E3aRl/5fEcJzAeErDVFVQ4k8uHHAoKQ34RYX97ax5MzMOZhRet4lWUld5Eb1Xk60he/YMVe3o4qngTb6dAVnlRSK5eJeaaxkuBoqKDHGSZMpLBvGy+qhAYJm8ZdHRDNRuWq5RznAbhPYA69NkviwzZXzjtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=st1n5EdK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4B3C4CEE7;
	Wed, 30 Apr 2025 22:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053805;
	bh=/xOwbU5+ed/8fEvKgMPKKxMfTBakbgn8YBkdvdq0rso=;
	h=From:Date:Subject:To:Cc:From;
	b=st1n5EdKTzbAv59cJyBOXTg0Q0iPY9+y3i960YA/MJWXOrQvrSaijF9qI6r1ilAbc
	 wPiU0FIDcgJPYjthVJEl7s+D25rje3gX1QhcGxodsyyXkGido7CtD+PAZE+4F2odiy
	 NUPg/VBA4JamlPJ7zc/oMKOW2m4ut1+COq7np61su6uEEe0bJJoxum53L3zbDJuLUv
	 TxcVC0D5QvfPJ0Nj3AiF+RHnQmsWIAFwZcV59jVKJTbHXw2tNhyoItRBuQGY/o39U1
	 VvBVr8en0slTY1A9hYAaD0ubV3pmR5ZTSaY4a92Pg3PjZALbb9ekAmjwiO1Df2Atdz
	 zrNjTGlYgKEoQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 30 Apr 2025 15:56:34 -0700
Subject: [PATCH] kbuild: Properly disable
 -Wunterminated-string-initialization for clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-unterminated-string-init-clang-v1-1-10eab729bf3d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKGqEmgC/x2N0QqCQBQFf0XucxdWzWj9lehB9GgH6ip3twjEf
 2/pcWCY2SXBiSR9tYvjw8TVCtSnSsbHYAuUU2FpQtOFcxv0bRn+og0Zk6bstEVpzDo+i67XOHd
 Ai3iJkBLZHDO//8Htfhw/acc3T3AAAAA=
X-Change-ID: 20250430-unterminated-string-init-clang-89f5ee3e969e
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5056; i=nathan@kernel.org;
 h=from:subject:message-id; bh=/xOwbU5+ed/8fEvKgMPKKxMfTBakbgn8YBkdvdq0rso=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlCq9YILWpoi2qNWzFTt33fjwP9LOdFSqPcj+9492Qn1
 7WGlz/vdJSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJhFkz/NORe/JZe8Gji116
 76vtA86UnV927cq7q00VWbEy+k4SCi4M/50LjOUOOWRn8LpEbr7pmTb1tLVRZ6LmibBE9ufF/dP
 7WQE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang and GCC have different behaviors around disabling warnings
included in -Wall and -Wextra and the order in which flags are
specified, which is exposed by clang's new support for
-Wunterminated-string-initialization.

  $ cat test.c
  const char foo[3] = "FOO";
  const char bar[3] __attribute__((__nonstring__)) = "BAR";

  $ clang -fsyntax-only -Wextra test.c
  test.c:1:21: warning: initializer-string for character array is too long, array size is 3 but initializer has size 4 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      1 | const char foo[3] = "FOO";
        |                     ^~~~~
  $ clang -fsyntax-only -Wextra -Wno-unterminated-string-initialization test.c
  $ clang -fsyntax-only -Wno-unterminated-string-initialization -Wextra test.c
  test.c:1:21: warning: initializer-string for character array is too long, array size is 3 but initializer has size 4 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      1 | const char foo[3] = "FOO";
        |                     ^~~~~

  $ gcc -fsyntax-only -Wextra test.c
  test.c:1:21: warning: initializer-string for array of ‘char’ truncates NUL terminator but destination lacks ‘nonstring’ attribute (4 chars into 3 available) [-Wunterminated-string-initialization]
      1 | const char foo[3] = "FOO";
        |                     ^~~~~
  $ gcc -fsyntax-only -Wextra -Wno-unterminated-string-initialization test.c
  $ gcc -fsyntax-only -Wno-unterminated-string-initialization -Wextra test.c

Move -Wextra up right below -Wall in Makefile.extrawarn to ensure these
flags are at the beginning of the warning options list. Move the couple
of warning options that have been added to the main Makefile since
commit e88ca24319e4 ("kbuild: consolidate warning flags in
scripts/Makefile.extrawarn") to scripts/Makefile.extrawarn after -Wall /
-Wextra to ensure they get properly disabled for all compilers.

Fixes: 9d7a0577c9db ("gcc-15: disable '-Wunterminated-string-initialization' entirely for now")
Link: https://github.com/llvm/llvm-project/issues/10359
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I am sending this to Linus since he added
-Wno-unterminated-string-initialization so it seems reasonable to take a
fix for it but if it should just go via Masahiro's kbuild tree, that's
fine as well.
---
 Makefile                   | 7 -------
 scripts/Makefile.extrawarn | 9 ++++++++-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 5aa9ee52a765..94be5dfb81fb 100644
--- a/Makefile
+++ b/Makefile
@@ -1052,13 +1052,6 @@ NOSTDINC_FLAGS += -nostdinc
 # perform bounds checking.
 KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
 
-#Currently, disable -Wstringop-overflow for GCC 11, globally.
-KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-disable-warning, stringop-overflow)
-KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
-
-#Currently, disable -Wunterminated-string-initialization as broken
-KBUILD_CFLAGS += $(call cc-disable-warning, unterminated-string-initialization)
-
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 2d6e59561c9d..d88acdf40855 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -8,6 +8,7 @@
 
 # Default set of warnings, always enabled
 KBUILD_CFLAGS += -Wall
+KBUILD_CFLAGS += -Wextra
 KBUILD_CFLAGS += -Wundef
 KBUILD_CFLAGS += -Werror=implicit-function-declaration
 KBUILD_CFLAGS += -Werror=implicit-int
@@ -56,6 +57,13 @@ KBUILD_CFLAGS += -Wno-pointer-sign
 # globally built with -Wcast-function-type.
 KBUILD_CFLAGS += $(call cc-option, -Wcast-function-type)
 
+# Currently, disable -Wstringop-overflow for GCC 11, globally.
+KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-disable-warning, stringop-overflow)
+KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
+
+# Currently, disable -Wunterminated-string-initialization as broken
+KBUILD_CFLAGS += $(call cc-disable-warning, unterminated-string-initialization)
+
 # The allocators already balk at large sizes, so silence the compiler
 # warnings for bounds checks involving those possible values. While
 # -Wno-alloc-size-larger-than would normally be used here, earlier versions
@@ -82,7 +90,6 @@ KBUILD_CFLAGS += $(call cc-option,-Werror=designated-init)
 # Warn if there is an enum types mismatch
 KBUILD_CFLAGS += $(call cc-option,-Wenum-conversion)
 
-KBUILD_CFLAGS += -Wextra
 KBUILD_CFLAGS += -Wunused
 
 #

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250430-unterminated-string-init-clang-89f5ee3e969e

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


