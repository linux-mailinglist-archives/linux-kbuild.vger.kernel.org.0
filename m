Return-Path: <linux-kbuild+bounces-271-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB78075BC
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 17:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F106DB20FFD
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 16:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13210495D6;
	Wed,  6 Dec 2023 16:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt49WcsQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30C048CCE;
	Wed,  6 Dec 2023 16:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35927C433C9;
	Wed,  6 Dec 2023 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701881397;
	bh=MIcvo5VKLktCV7iYkrFuhwma68u8LDf8q38/g/mtYpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gt49WcsQsjZorSfQU8Hm9z6pyjA9z5Synz3BXnyWZScwzjBpHu0rS1eSVU1TvmcIF
	 ibKSro8OcLDsjat9d7B9a+TnKHqyRMaO7JNok4TNYCGgujdG6FsFZGeqbeENMJqGo6
	 bHwbMWx5rUK0AntnCZe8hmRBepgU4c3kcGuCXTVGzG3zEpyyLMzJ03VPIXqr8HiVXx
	 6bCOQvYEZ8I2bNl+OskCPw3KT48VIicv0OAHFA+efymkmEJrX6gYVyf6+dwZaXieqI
	 FfVyUOuLlb1se5lneErtOhfPzaJInRDgpe6KDfkSzAH+ubqf7MVOmWhfF+8lQNRY/x
	 yK0hMIy/6w9Sg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 06 Dec 2023 09:49:47 -0700
Subject: [PATCH v2 2/2] kbuild: Enable
 -Wincompatible-function-pointer-types-strict in W=1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-2-91311b4c37b0@kernel.org>
References: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-0-91311b4c37b0@kernel.org>
In-Reply-To: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-0-91311b4c37b0@kernel.org>
To: masahiroy@kernel.org
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
 keescook@chromium.org, samitolvanen@google.com, nicolas@fjasle.eu, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2034; i=nathan@kernel.org;
 h=from:subject:message-id; bh=MIcvo5VKLktCV7iYkrFuhwma68u8LDf8q38/g/mtYpw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKkFy4xtpBWds09d/b/tY6nA1lpbZfNyzf2vzs9y5XwXd
 yzc3SKpo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkYRkjw9s/pqynFsQUdR96
 IVU4IenIFWMWD31Ll4Bvsw8aPVfSU2f4X8jxJv7zuVrNv/39TYHdEQU9BZ4HuVxz3Pj1D7K661X
 xAgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

-Wincompatible-function-pointer-types-strict aims to catch clang kernel
Control Flow Integrity (kCFI) violations at build time (rather than run
time) by validating function pointer assignments against the expected
prototype, similar to the existing -Wincompatible-function-pointer-types
that is considered a hard error in the kernel. The -strict variant
requires the types to match exactly, as opposed to just matching in
terms of ABI compatibility. This is primarily visible with int/unsigned
int in lieu of enum types or vice versa.

The tree is not completely clean, so this warning cannot currently be
enabled unconditionally. However, there are only warnings in one
subsystem ('drivers/counter'), so it is really close. In order to
benefit from CI infrastructure that tests with W=1, enable this warning
at that level, so that new instances have a chance of being caught and
fixed during development.

This should eventually be a hard error in a similar manner as
Wincompatible-function-pointer-types but some subsystems test
with W=1 + CONFIG_WERROR=n, so it would be rude to break their builds
when they do not care about warnings outside of their subsystem.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 3f94915fab37..1452dd874a07 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -99,6 +99,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wformat-overflow)
 KBUILD_CFLAGS += $(call cc-option, -Wformat-truncation)
 KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
 KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
+KBUILD_CFLAGS += $(call cc-option, -Wincompatible-function-pointer-types-strict)
 
 KBUILD_CPPFLAGS += -Wundef
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1

-- 
2.43.0


