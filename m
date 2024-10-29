Return-Path: <linux-kbuild+bounces-4381-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 040829B4C84
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 15:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A062F1F242BE
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 14:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C201917F9;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKv+FT8H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2A13AA3F;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730213395; cv=none; b=G4WelEg2+5dk4/vNPyCA5MA4/KtfDeenNcqwSPVC5bnUipD6XxIMga51F99lTeg9xNRgxyyoMiZmBivnXjvEf065tXe80x3oA52MFUxsSs9kKE/SHw4YnA6bsIsxAez9xhGaUy2O9ualqlOZ87PtrVkSowXrOe5UjqsHtsRXsu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730213395; c=relaxed/simple;
	bh=BlzYljgtvc2MTIkLFj7ZU1rt1YFd3eqaeSD+vg+1nfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDTxJl749S2PtdtODM662t4C7qw5FvZmd1fXMerTi53qURl3G9eXEe+YiGEN+VMq+Q3CECcu4rnFdF2gGG+4JmAwrgJuvlk4sfa0DT4BZWG0p/CBLgxVlYVks3JecEBJV3zKhiWJ/KUyaswy0uLOx8d+Mt72LUCIW3dODnR9eSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKv+FT8H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 530DCC4CEE7;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730213395;
	bh=BlzYljgtvc2MTIkLFj7ZU1rt1YFd3eqaeSD+vg+1nfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IKv+FT8Hd5+iBUKXN49pcWen80JNLhSG1r69vthGvit7CTWE8PJ2gu/StNc4ViVnJ
	 zBmFkKiE9k7HlUD2nn8acuqYVBXKqg/SXDt6ASR6ehDi6kuQFIpEjmJwpYCJDR5sVy
	 SmGmHNXLT8bSTVuTq9Q4SInncT2pOiYDf5qfuy0B8FliWln26csgXPigh/s1v5WRbv
	 wJz8IzHPLsRILvfMA61V6gMezbC+Jb+qEV1Lonx8adE88Ysl/xF4RcEYqGjfO1P03o
	 iOB6DClvRQxJRUudeIyk11ho0l2Llp1wuzYITTbzqlv9eWivvQEd36iWg2wOf5wYBb
	 Rb6KAZyKYkbJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E83D3A661;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
From: Koakuma via B4 Relay <devnull+koachan.protonmail.com@kernel.org>
Date: Tue, 29 Oct 2024 21:49:08 +0700
Subject: [PATCH v3 2/2] sparc/build: Add SPARC target flags for compiling
 with clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-sparc-cflags-v3-2-b28745a6bd71@protonmail.com>
References: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com>
In-Reply-To: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, Koakuma <koachan@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730213393; l=1720;
 i=koachan@protonmail.com; s=20240620; h=from:subject:message-id;
 bh=qC+xpLMUpGByab1qovPWQQ3aHiMZ1dz7yem8GqVZgaw=;
 b=j3CG9BnJ7FWIRbyhXXEAVLB8dkBqluDHfp9prkX2enPrqN3tWd26RoXX/dgFs1O0iNkgciARn
 sw7SoBukKcCDoNEFREPzB0cpBbb11mSllQ7KnMz+fTX23bhUK2DgdHV
X-Developer-Key: i=koachan@protonmail.com; a=ed25519;
 pk=UA59FS3yiAA1cnAAUZ1rehTmr6skh95PgkNRBLcoKCg=
X-Endpoint-Received: by B4 Relay for koachan@protonmail.com/20240620 with
 auth_id=174
X-Original-From: Koakuma <koachan@protonmail.com>
Reply-To: koachan@protonmail.com

From: Koakuma <koachan@protonmail.com>

clang only supports building 64-bit kernel, so we use the
sparc64-linux-gnu target.

See also: https://lore.kernel.org/lkml/e26PTXUXEz8OYXmaeKn4Mpuejr4IOlFfFwdB5vpsluXlYiqDdlyQTYcDtdAny_o4gO4SfPeQCCN2qpyT6e0nog5EaP3xk2SeUPTrF54p1gM=@protonmail.com/T/#m068e010dcf8b99d3510a90d7532bcdb70e2e2c6b

Signed-off-by: Koakuma <koachan@protonmail.com>
---
 Documentation/kbuild/llvm.rst | 3 +++
 scripts/Makefile.clang        | 1 +
 2 files changed, 4 insertions(+)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index 6dc66b4f31a7bb62ba5bb6174730dc0a69ee0bba..bc8a283bc44bbfa9948ad3c9fe8031269ce10be4 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -179,6 +179,9 @@ yet. Bug reports are always welcome at the issue tracker below!
    * - s390
      - Maintained
      - ``LLVM=1`` (LLVM >= 18.1.0), ``CC=clang`` (LLVM < 18.1.0)
+   * - sparc (sparc64 only)
+     - Maintained
+     - ``CC=clang LLVM_IAS=0`` (LLVM >= 20)
    * - um (User Mode)
      - Maintained
      - ``LLVM=1``
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 6c23c6af797fb016232914589c948208345417ad..2435efae67f53a26d55a1c0f1bf254a49d9fc731 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -10,6 +10,7 @@ CLANG_TARGET_FLAGS_mips		:= mipsel-linux-gnu
 CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
 CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
 CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
+CLANG_TARGET_FLAGS_sparc	:= sparc64-linux-gnu
 CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
 CLANG_TARGET_FLAGS_um		:= $(CLANG_TARGET_FLAGS_$(SUBARCH))
 CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))

-- 
2.47.0



