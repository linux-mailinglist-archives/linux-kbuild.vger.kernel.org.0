Return-Path: <linux-kbuild+bounces-2569-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFEF93402D
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAEEBB20F10
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 16:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0D9181CE8;
	Wed, 17 Jul 2024 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shbXjLPJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26003181B9A;
	Wed, 17 Jul 2024 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721232729; cv=none; b=YDDQLhvYV6xK0hx7fN2GCG7cbHPJE2yo5XunprWs58eQrWJlBFFACmGl8E3kSZ9UP31DRvXkZuYTITdDfmbA1E8jRhKx3I+7BFkv4qHmKpL8WIv84W/DBo2Jra8eSlpMMdCxEmtINR4J3H4nKjJXAKbNDRydZ8t5+LOruhhC/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721232729; c=relaxed/simple;
	bh=RAy/ksV3bI+jYpZMEbAnaO3B61n/1HcPTXV7BHINhDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZrpVRd0jLwt4v5v79TUj2fMO3wJwvzT0yJMrhKO+tYlwgOw/63O4eQwi78wq01El7wJDPZO2NOPsYD9aHt+za8KDB/po7YcVMkR/P1y0UWXsYyCJ96QZh/WFeH4xk5+82vDmAki5W0ZxRlpqkzrmVqRUMtV5BkM0LzbfjOb+83g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shbXjLPJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5132C4AF0B;
	Wed, 17 Jul 2024 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721232728;
	bh=RAy/ksV3bI+jYpZMEbAnaO3B61n/1HcPTXV7BHINhDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=shbXjLPJXdRB1tVuUt0uLxZSsuyUDn5AMTlsJxjNvye+zdF07wlNebxOI3d7Qcm73
	 EA0tE0PAnr4MtBgVPn5NrDa+gQOKkLuaVPiaQLyheI3gV3gfDG/bK3wTJqrCdk+OPR
	 KeVhHVfpkivSAxT0vlD9sKhMYMrqdCkOIJuousO8DaY22Wvko5Pzh39D2xNousN4H+
	 Z2AApmNlwYnUNayL7Bz4BoJVCPN+3BXPeruNC2JFtczLyFrU4QQlUdAwetSauJjkyg
	 TqIWU4IpdyWH7aVirsZnzAs6bG2Cu4z1ZnnxPwiwohZnuBZUonEdPL2M4GnzDkh4E9
	 9x1uwC++Z0mZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDECC3DA61;
	Wed, 17 Jul 2024 16:12:08 +0000 (UTC)
From: Koakuma via B4 Relay <devnull+koachan.protonmail.com@kernel.org>
Date: Wed, 17 Jul 2024 23:10:15 +0700
Subject: [PATCH v2 1/2] sparc/build: Remove all usage of -fcall-used* flags
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-sparc-cflags-v2-1-259407e6eb5f@protonmail.com>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
In-Reply-To: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 Koakuma <koachan@protonmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721232727; l=2404;
 i=koachan@protonmail.com; s=20240620; h=from:subject:message-id;
 bh=BmBOSeK5N1Oy/bbdHrIC4l2mSYFoxSF/u0TXtn+HPh4=;
 b=MDVSlMcoYXgsyyvNQtnK9WTRCXYuPfjMAj3GvKKG5BXguIwLI3+64HoWlTSXoJtvYHolxIPZQ
 VI+Ux/+2ko0C0mb15ccb41nEUfBNAcPw2n5uAA2Dd+rz808U+R8Z+yE
X-Developer-Key: i=koachan@protonmail.com; a=ed25519;
 pk=UA59FS3yiAA1cnAAUZ1rehTmr6skh95PgkNRBLcoKCg=
X-Endpoint-Received: by B4 Relay for koachan@protonmail.com/20240620 with
 auth_id=174
X-Original-From: Koakuma <koachan@protonmail.com>
Reply-To: koachan@protonmail.com

From: Koakuma <koachan@protonmail.com>

Remove all usage of -fcall-used* flags so that all flags used are
portable between GCC and clang.

The reasoning is as follows:

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
index 757451c3ea1d..7318a8b452c3 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -29,7 +29,7 @@ UTS_MACHINE    := sparc
 # versions of gcc.  Some gcc versions won't pass -Av8 to binutils when you
 # give -mcpu=v8.  This silently worked with older bintutils versions but
 # does not any more.
-KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
+KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu
 KBUILD_CFLAGS  += -Wa,-Av8
 
 KBUILD_AFLAGS  += -m32 -Wa,-Av8
@@ -45,7 +45,7 @@ export BITS   := 64
 UTS_MACHINE   := sparc64
 
 KBUILD_CFLAGS += -m64 -pipe -mno-fpu -mcpu=ultrasparc -mcmodel=medlow
-KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
+KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -Wno-sign-compare
 KBUILD_CFLAGS += -Wa,--undeclared-regs
 KBUILD_CFLAGS += $(call cc-option,-mtune=ultrasparc3)
 KBUILD_AFLAGS += -m64 -mcpu=ultrasparc -Wa,--undeclared-regs
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 243dbfc4609d..e009443145af 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -46,7 +46,7 @@ CFL := $(PROFILING) -mcmodel=medlow -fPIC -O2 -fasynchronous-unwind-tables -m64
        -fno-omit-frame-pointer -foptimize-sibling-calls \
        -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 
-SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 -fcall-used-g5 -fcall-used-g7
+SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5
 
 $(vobjs): KBUILD_CFLAGS := $(filter-out $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
 

-- 
2.45.2



