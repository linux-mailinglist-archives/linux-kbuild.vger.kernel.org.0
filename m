Return-Path: <linux-kbuild+bounces-4380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D539B4C80
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 15:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654931F21936
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 14:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD377190679;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzaD8BdS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE12AE7F;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730213395; cv=none; b=rqfdKU6nvZh34qI4hzUWa6zcQJDFIgNPPiwuJGL/ans2B8MWhgd4XA5jGvmFVH611lVnWCdkMKjRMao1tXjTIa6k/JzGRD/0CsMNk24ez97Xy8Pa7L4nv7rBbLkWJR/b08Y9E7HaHKJuUcGxqCLhQbhbkeITRwmL9UGfR9vsJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730213395; c=relaxed/simple;
	bh=DNai7oJ0zOfmdmuloM/IxFLitC4QWuuzG9CMmFEr1rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/+DUqoDpD9GpIqzaUz0Gn3G0DhFrjYNA2OT0XWtUMn22hPLATysN+CS3w/IUcceB4mTJeUQaB7vAQhs7twPF1fr5CT7sNH2lUJkn1Vp93nNUWzMhF3FYwCFdyDYQ+Y+0fTn2JVbF7RRzy5rhro51ufqPspcWiLuUS8u/880XXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzaD8BdS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 444C1C4CECD;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730213395;
	bh=DNai7oJ0zOfmdmuloM/IxFLitC4QWuuzG9CMmFEr1rI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UzaD8BdSY2kirnhryrwYlV/+AIMOBQs5wzu7xVHb8n8ft/2jzbQ5g8w4h8jrXSSUD
	 vVtZRwVpCD1xQ2t3dMtfKi2J5N0cPQtr8C14a5U7T3FiyIWXQTVQIY74yqH8KQb4LH
	 UnH5MGmfJGWCwFYSebC+iAN5JPEJNgR1HEij+vNCaAxFol+PEd+/fKR6IRTXj/j8KN
	 PGmQvDcS45J+zsEfZI2pVrMJdrXpTK7l4b9BBQ6wnSYfIvO8wNAQp2wuMKS5zuZVvX
	 jTSHP//MLDxT90jHA2TfWCpeOHBM5q5KK7qrg3m+U0Bcn5GWQN71O/oXeVhGSDZIXo
	 LNilrz8CBZJtw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE22D3A662;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
From: Koakuma via B4 Relay <devnull+koachan.protonmail.com@kernel.org>
Date: Tue, 29 Oct 2024 21:49:07 +0700
Subject: [PATCH v3 1/2] sparc/build: Put usage of -fcall-used* flags behind
 cc-option
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-sparc-cflags-v3-1-b28745a6bd71@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730213393; l=2721;
 i=koachan@protonmail.com; s=20240620; h=from:subject:message-id;
 bh=j/K37+Baat6IoHsWFp39+kRW4co5mJJ6tRxT2CAjvfU=;
 b=+hjWwxlr7VTHDpLFtlamCVvHi/a0OH/j3VFREyh7jZVAPzEJmwLiEHi3HSeUjllvhM20Uemvd
 cTmir13kw+QD1TCZxCUMeECwfkCF9MB/AMaGO9DaYbHRCEeue6Hqnjs
X-Developer-Key: i=koachan@protonmail.com; a=ed25519;
 pk=UA59FS3yiAA1cnAAUZ1rehTmr6skh95PgkNRBLcoKCg=
X-Endpoint-Received: by B4 Relay for koachan@protonmail.com/20240620 with
 auth_id=174
X-Original-From: Koakuma <koachan@protonmail.com>
Reply-To: koachan@protonmail.com

From: Koakuma <koachan@protonmail.com>

Place -fcall-used* flags behind cc-option so that clang (which doesn't
support them) can still compile the kernel.

This is a safe change, the reasoning is as follows:

In the (normal) 32-bit ABI, %g5 and %g7 is normally reserved, and in
the 64-bit ABI, %g7 is the reserved one.
Linux turns them into volatile registers by the way of -fcall-used-*,
but on the other hand, omitting the flags shouldn't be harmful;
compilers will now simply refuse to touch them, and any assembly
code that happens to touch them would still work like usual (because
Linux' conventions already treats them as volatile anyway).

Signed-off-by: Koakuma <koachan@protonmail.com>
---
 arch/sparc/Makefile      | 4 ++--
 arch/sparc/vdso/Makefile | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index 757451c3ea1df63b948e68a45988c78f5974f9ea..0400078076e588be93a702d1c64eb9fd34466075 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -29,7 +29,7 @@ UTS_MACHINE    := sparc
 # versions of gcc.  Some gcc versions won't pass -Av8 to binutils when you
 # give -mcpu=v8.  This silently worked with older bintutils versions but
 # does not any more.
-KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
+KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu $(call cc-option,-fcall-used-g5) $(call cc-option,-fcall-used-g7)
 KBUILD_CFLAGS  += -Wa,-Av8
 
 KBUILD_AFLAGS  += -m32 -Wa,-Av8
@@ -45,7 +45,7 @@ export BITS   := 64
 UTS_MACHINE   := sparc64
 
 KBUILD_CFLAGS += -m64 -pipe -mno-fpu -mcpu=ultrasparc -mcmodel=medlow
-KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
+KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 $(call cc-option,-fcall-used-g7) -Wno-sign-compare
 KBUILD_CFLAGS += -Wa,--undeclared-regs
 KBUILD_CFLAGS += $(call cc-option,-mtune=ultrasparc3)
 KBUILD_AFLAGS += -m64 -mcpu=ultrasparc -Wa,--undeclared-regs
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 243dbfc4609d804fc221c3591eebe891107ffdab..50ec2978cda5397841daad6ffdc9682811b9b38e 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -46,7 +46,7 @@ CFL := $(PROFILING) -mcmodel=medlow -fPIC -O2 -fasynchronous-unwind-tables -m64
        -fno-omit-frame-pointer -foptimize-sibling-calls \
        -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 
-SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 -fcall-used-g5 -fcall-used-g7
+SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 $(call cc-option,-fcall-used-g5) $(call cc-option,-fcall-used-g7)
 
 $(vobjs): KBUILD_CFLAGS := $(filter-out $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
 

-- 
2.47.0



