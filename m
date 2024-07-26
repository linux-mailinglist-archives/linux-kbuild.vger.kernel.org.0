Return-Path: <linux-kbuild+bounces-2676-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020393D7F0
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 20:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEC072812D3
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 18:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1264E17A580;
	Fri, 26 Jul 2024 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdWW1wA9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08C83987B;
	Fri, 26 Jul 2024 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722017107; cv=none; b=CYLcOOTWKSjUnMP8kGOYP+ERQCHtkMr6iVJRp6KdaK3j6L0u45ROU+wmPhIE2zXMmckv/N6Vnh1tU1juFAnoYJDByAW080ASj7TZz3c1pU2AdBk2RA5R7deOrHUR6PS25+upGQsPz5UIg8iNpgjVcNSKZmcE8yU7adJzTX2oT58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722017107; c=relaxed/simple;
	bh=yEu+Ejhs5AKsucdiH5kbZXMTvd1G+uUl0hNcc8ETyh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XOHWfyDUT4X1HbBSUJN5/HU5Q1PmTERuSEAYJleO5HEPO4EHhJLeCYsmMcXrM2UyIeZJk47WLF6YXpE6s9X60IN2TbORf9RZyC26gbJEsEPv7QhPAaMU5nXpTmk4cmHUzqd/dZaNzTiQavVjKD3rCnNfQ/SeC5sJbX1NywShBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdWW1wA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D402C32782;
	Fri, 26 Jul 2024 18:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722017106;
	bh=yEu+Ejhs5AKsucdiH5kbZXMTvd1G+uUl0hNcc8ETyh8=;
	h=From:Date:Subject:To:Cc:From;
	b=EdWW1wA9QZNXT/UVUELvf62hHOUdCjYwjMdPJwI9I2gBhSBWVOD1cF8oX2FiH4e8A
	 DFnpaSdb5nUEInKZVjl4hgRHhrKmSHuFYGyrbZWhE2wNhqNWwZTAp+9OfxtwRszV3H
	 TrioCEsZI/mG1WsckrfqSfL8LOVgIBmrG5NOTjNYSo9y87vxLq21qy+NtX8daOB0bx
	 haOa9YkIZowSNmWn3D/mDlTwvKx4GcXZDGu6M8Bz1JE4y2ZbPIFs/JazZ0Yz7T7Q3v
	 rRsUGryZg+fSNI4k+aesBoJpgBpswkGOtcVbUOE41vRT1DHTa1qBMRyGY5BYyFk7VH
	 iXIJg26tSFGHQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 26 Jul 2024 11:05:00 -0700
Subject: [PATCH] kbuild: Fix '-S -c' in x86 stack protector scripts
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEvlo2YC/x3MwQqDMAyA4VeRnA3Y0tXpq8gOtstmGFhJwhDEd
 7d4/A7/f4CSMCmMzQFCf1Yua4VrG8jLvH4J+V0NvvOh633ED++4PyOqzfmHmxSjbEXQSE0xPYJ
 PLg3BxQT1sQnV4P5Pr/O8AM9w/gZvAAAA
To: masahiroy@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org
Cc: nicolas@fjasle.eu, maskray@google.com, morbo@google.com, 
 justinstitt@google.com, kees@kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3474; i=nathan@kernel.org;
 h=from:subject:message-id; bh=yEu+Ejhs5AKsucdiH5kbZXMTvd1G+uUl0hNcc8ETyh8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGmLnwYGJKV3Pj8/rXm3yK6m5HMWHL9/qUy8veRi3lVOt
 x+rvzzb1VHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmovaDkWF5Xorp0rPJ50pY
 Z9bPKjijvpJTNZOp8K1eWILiSY39Yn6MDEtnh+Yd6Dw1+RijLdMO56xrUp/ORbx028lr490raWh
 TygcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After a recent change in clang to stop consuming all instances of '-S'
and '-c' [1], the stack protector scripts break due to the kernel's use
of -Werror=unused-command-line-argument to catch cases where flags are
not being properly consumed by the compiler driver:

  $ echo | clang -o - -x c - -S -c -Werror=unused-command-line-argument
  clang: error: argument unused during compilation: '-c' [-Werror,-Wunused-command-line-argument]

This results in CONFIG_STACKPROTECTOR getting disabled because
CONFIG_CC_HAS_SANE_STACKPROTECTOR is no longer set.

'-c' and '-S' both instruct the compiler to stop at different stages of
the pipeline ('-S' after compiling, '-c' after assembling), so having
them present together in the same command makes little sense. In this
case, the test wants to stop before assembling because it is looking at
the textual assembly output of the compiler for either '%fs' or '%gs',
so remove '-c' from the list of arguments to resolve the error.

All versions of GCC continue to work after this change, along with
versions of clang that do or do not contain the change mentioned above.

Cc: stable@vger.kernel.org
Fixes: 4f7fd4d7a791 ("[PATCH] Add the -fstack-protector option to the CFLAGS")
Fixes: 60a5317ff0f4 ("x86: implement x86_32 stack protector")
Link: https://github.com/llvm/llvm-project/commit/6461e537815f7fa68cef06842505353cf5600e9c [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I think this could go via either -tip or Kbuild?

Perhaps this is an issue in the clang commit mentioned in the message
above since it deviates from GCC (Fangrui is on CC here) but I think the
combination of these options is a little dubious to begin with, hence
this change.
---
 scripts/gcc-x86_32-has-stack-protector.sh | 2 +-
 scripts/gcc-x86_64-has-stack-protector.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/gcc-x86_32-has-stack-protector.sh b/scripts/gcc-x86_32-has-stack-protector.sh
index 825c75c5b715..9459ca4f0f11 100755
--- a/scripts/gcc-x86_32-has-stack-protector.sh
+++ b/scripts/gcc-x86_32-has-stack-protector.sh
@@ -5,4 +5,4 @@
 # -mstack-protector-guard-reg, added by
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81708
 
-echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -m32 -O0 -fstack-protector -mstack-protector-guard-reg=fs -mstack-protector-guard-symbol=__stack_chk_guard - -o - 2> /dev/null | grep -q "%fs"
+echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -m32 -O0 -fstack-protector -mstack-protector-guard-reg=fs -mstack-protector-guard-symbol=__stack_chk_guard - -o - 2> /dev/null | grep -q "%fs"
diff --git a/scripts/gcc-x86_64-has-stack-protector.sh b/scripts/gcc-x86_64-has-stack-protector.sh
index 75e4e22b986a..f680bb01aeeb 100755
--- a/scripts/gcc-x86_64-has-stack-protector.sh
+++ b/scripts/gcc-x86_64-has-stack-protector.sh
@@ -1,4 +1,4 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
-echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -m64 -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
+echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -m64 -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q "%gs"

---
base-commit: 1722389b0d863056d78287a120a1d6cadb8d4f7b
change-id: 20240726-fix-x86-stack-protector-tests-b542b1b9416b

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


