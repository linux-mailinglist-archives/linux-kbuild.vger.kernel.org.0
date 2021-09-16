Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF3840EA1D
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Sep 2021 20:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349225AbhIPSnn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Sep 2021 14:43:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348867AbhIPSn2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Sep 2021 14:43:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B876E6103B;
        Thu, 16 Sep 2021 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631817727;
        bh=+Ka55t+zK8hXcliKTLebgVmF2QEIa1Ci4abGrfu4t7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sreg9WjosXGGTgtw/e840hKZkI6/W2sz0RJKHKlfvPnOJvMs/BsHNbUVRCGSlFidD
         o0ACjDq37MUmY6jPhs887PQMPfCmtX4uYm3czgPgBJgdANzspfC9ITaM35/HIkVfa1
         CjC3njZqtRskHPI539xD+hTuBhkniyAkeFiNFni0LR7DEMYIsOHidJHpwCF9MJY/ex
         AQ6yP/7u1VKzRrW2GHf0xiLnhYqHGjcUcFc/zMRh+3iDFSHSXt4xFxOax8YN/1gFfB
         VHTDSeEpOfVgqxoYLPFuWgDYJF8s+qhguk+k66+NvSyjFUzYwpo1Zr3nHotFYWlnmy
         xBbyp2pE/hx0w==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 2/2] kbuild: Add -Werror=ignored-optimization-argument to CLANG_FLAGS
Date:   Thu, 16 Sep 2021 11:40:17 -0700
Message-Id: <20210916184017.1881473-3-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916184017.1881473-1-nathan@kernel.org>
References: <20210916184017.1881473-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Similar to commit 589834b3a009 ("kbuild: Add
-Werror=unknown-warning-option to CLANG_FLAGS").

Clang ignores certain GCC flags that it has not implemented, only
emitting a warning:

$ echo | clang -fsyntax-only -falign-jumps -x c -
clang-14: warning: optimization flag '-falign-jumps' is not supported
[-Wignored-optimization-argument]

When one of these flags gets added to KBUILD_CFLAGS unconditionally, all
subsequent cc-{disable-warning,option} calls fail because -Werror was
added to these invocations to turn the above warning and the equivalent
-W flag warning into errors.

To catch the presence of these flags earlier, turn
-Wignored-optimization-argument into an error so that the flags can
either be implemented or ignored via cc-option and there are no more
weird errors.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.clang | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 4cce8fd0779c..51fc23e2e9e5 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -29,7 +29,12 @@ CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 else
 CLANG_FLAGS	+= -fintegrated-as
 endif
+# By default, clang only warns when it encounters an unknown warning flag or
+# certain optimization flags it knows it has not implemented.
+# Make it behave more like gcc by erroring when these flags are encountered
+# so they can be implemented or wrapped in cc-option.
 CLANG_FLAGS	+= -Werror=unknown-warning-option
+CLANG_FLAGS	+= -Werror=ignored-optimization-argument
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
-- 
2.33.0

