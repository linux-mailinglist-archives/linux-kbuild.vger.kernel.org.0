Return-Path: <linux-kbuild+bounces-4152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2DE9A1116
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 20:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E16A6B24983
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 18:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14FF18BC0E;
	Wed, 16 Oct 2024 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mS8UrMQd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FD116C687;
	Wed, 16 Oct 2024 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729101708; cv=none; b=nevh9ykCi+iTDLjNLvdVcFGKF2g7IXTlFtmtx/sOZirXXErSG6OOO4z5LOJG92kD+E5z2gMaSrJ9wvaeMZklOS4NQXpLyTGr9VUXjfhUlDq456s4wfbABAkqvCRb2oBaXdnVpprybbYh02w8Y7adezrUIlSNsTxoX4vgR9mEhGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729101708; c=relaxed/simple;
	bh=p8eHs9Y0TEJ/D566z+3uJO6byIGR6zjIY92u/N1SKUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ALmtshhGbPMNaQtUUE5efCVzzFHkArDAvh6AWQAW/HEEzuY96H+M70RkN9vIDTc1aBKjTFaEvOBjvg1ibM2yVN1+zA36IMeKR+ovRgwokzBshK2Hl/qq+kt4B2ZclwSeIkq6V0Z3ouaPJ/RFwmdeUtNq9z9Nm974Z2N3AkyQk/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mS8UrMQd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFD7C4CEC5;
	Wed, 16 Oct 2024 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729101708;
	bh=p8eHs9Y0TEJ/D566z+3uJO6byIGR6zjIY92u/N1SKUY=;
	h=From:Date:Subject:To:Cc:From;
	b=mS8UrMQdipOrbiw9iaAXgwSpYRoPQUVPJfOzT3sCRdgvvU+PpzzomvpfaW+rThC5C
	 YE7cgx2Hjr4Z/evfhAMHKVH8gi4ODzjRAwKgDslHepy1T1KiS4ZBC4bpnz/UGiqif5
	 kOPtjjhXEHfoRcQVWReylLS4NP0IKjqsA79vDDZiNaawWphu2g9NvRxzKm1Hx8vPeI
	 PsVw86/qrlg79ieAvRfEmkdEaTgwpJR2Gx/6ZgNwbrh396T83usQOb75iiEnFnGIzw
	 OC/LGSRddlA/W8DYAhmoxHtfjVOLTFAG9kZ9rdSjK/sk/ha4qjsvTwkzhOsYKb+M/O
	 yWEE6ymOqOKUA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 16 Oct 2024 11:01:43 -0700
Subject: [PATCH] kbuild: Fully disable
 -Wenum-{compare-conditional,enum-conversion}
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-disable-two-clang-enum-warnings-v1-1-ae886d7a0269@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIb/D2cC/x2NQQqDQAwAvyI5G3AlWNevFA9bN2pAY9nYWhD/7
 tLjwDBzgnESNuiKExJ/xWTTDK4sYJiDTowSM0Nd1eQq12AUC6+FcT82HJZsIOtnxSMkFZ0M+eE
 9RaLRUwu58k48yu9/ePbXdQN1Z8SCcQAAAA==
X-Change-ID: 20241016-disable-two-clang-enum-warnings-e7994d44f948
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Aleksei Vetrov <vvvvvv@google.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2720; i=nathan@kernel.org;
 h=from:subject:message-id; bh=p8eHs9Y0TEJ/D566z+3uJO6byIGR6zjIY92u/N1SKUY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOn8/7u/ifeLeGzSFxR4vWSCSFV/zBPd648tGed9vz8jQ
 3+DRsfljlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRfgdGhise/JsS57lwF/Mv
 nSBkHd/nuOTAadHPCex5xZtlezX3SjAydLysFH94cknU6/9p7/MtFgkLFK/4PWeJw6msK6FTPjS
 w8gAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

-Wenum-enum-conversion and -Wenum-compare-conditional were strengthened
in clang-19 to warn in C mode, which caused the kernel to move them to
W=1 in commit 75b5ab134bb5 ("kbuild: Move
-Wenum-{compare-conditional,enum-conversion} into W=1") because there
were numerous instances of each that would break builds with -Werror.
Unfortunately, this is not a full solution, as more and more developers,
subsystems, and distributors are building with W=1 as well, so they
continue to see the numerous instances of these warnings.

Since the move to W=1, there have not been many new instances that have
appeared through various build reports and the ones that have appeared
seem to be following similar existing patterns, suggesting that most
instances of these warnings will not be real issues. The only
alternatives for silencing these warnings are adding casts (which is
generally seen as an ugly practice) or refactoring the enums to macro
defines or a unified enum (which may be undesirable because of type
safety in other parts of the code).

Disable the warnings altogether so that W=1 users do not see them.

Cc: stable@vger.kernel.org
Fixes: 75b5ab134bb5 ("kbuild: Move -Wenum-{compare-conditional,enum-conversion} into W=1")
Link: https://lore.kernel.org/ZwRA9SOcOjjLJcpi@google.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I am open to discussion around whether or not to disable this entirely
but I think it needs to be out of W=1.
---
 scripts/Makefile.extrawarn | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1d13cecc7cc7808610e635ddc03476cf92b3a8c1..3f124c80bee5133899047c07bc05e3173ee4c7f0 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -31,6 +31,8 @@ KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
 ifdef CONFIG_CC_IS_CLANG
 # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
 KBUILD_CFLAGS += -Wno-gnu
+KBUILD_CFLAGS += -Wno-enum-compare-conditional
+KBUILD_CFLAGS += -Wno-enum-enum-conversion
 else
 
 # gcc inanely warns about local variables called 'main'
@@ -129,8 +131,6 @@ endif
 KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 KBUILD_CFLAGS += $(call cc-disable-warning, unaligned-access)
-KBUILD_CFLAGS += -Wno-enum-compare-conditional
-KBUILD_CFLAGS += -Wno-enum-enum-conversion
 endif
 
 endif

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241016-disable-two-clang-enum-warnings-e7994d44f948

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


