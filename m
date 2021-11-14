Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC40944F5D1
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Nov 2021 01:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhKNAzS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Nov 2021 19:55:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:36494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229988AbhKNAzS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Nov 2021 19:55:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9ED0B60E08;
        Sun, 14 Nov 2021 00:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636851145;
        bh=a7rUixXoOZQp5X2wsqpJXaQKajCRpv8Zr8OGdkADNKE=;
        h=Date:From:To:Cc:Subject:From;
        b=I6z0nfnmBkhxShhcNHI2xLBcXgJlYR/PpE7wePerxMdrN1itMua/M48YN3hcr+KzT
         PtkU62WHBnsA0KyBRDcgZqzkIzUYeyJxx28aTseUvZoyIxhfFaRUy2rpILoGLRgJea
         ugnkXbF4GLa4BmJu0jCvhTquUecxgYkjcXtBmKUagLQn8G3wD++5HgagKeSYvPOmf0
         pg50BJ71JYA6Hk4tJ78r9kl6lilk9Ud33MsIMV1oIPBB/7/sxD+r1bG1Twg6QLckBb
         Ela3NnrNA4uFxTxvBhMGNPJbtXzazGcCRxBwz8WJeK6TQ/i2E6vxpFZmKCUVR/Iy0Z
         c+7SigdMfTw6w==
Date:   Sat, 13 Nov 2021 18:57:25 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH] kconfig: Add support for -Wimplicit-fallthrough
Message-ID: <20211114005725.GA27075@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add Kconfig support for -Wimplicit-fallthrough for both GCC and Clang.

The compiler option is under configuration CC_IMPLICIT_FALLTHROUGH,
which is enabled by default.

Special thanks to Nathan Chancellor who fixed the Clang bug[1][2]. This
bugfix only appears in Clang 14.0.0, so older versions still contain
the bug and -Wimplicit-fallthrough won't be enabled for them, for now.

This concludes a long journey and now we are finally getting rid
of the unintentional fallthrough bug-class in the kernel, entirely. :)

[1] https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
[2] https://bugs.llvm.org/show_bug.cgi?id=51094

Link: https://github.com/KSPP/linux/issues/115
Link: https://github.com/ClangBuiltLinux/linux/issues/236
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Co-developed-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 Makefile     | 6 +-----
 init/Kconfig | 5 +++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 30c7c81d0437..f18a50daad00 100644
--- a/Makefile
+++ b/Makefile
@@ -786,7 +786,7 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
 KBUILD_CFLAGS += $(stackp-flags-y)
 
 KBUILD_CFLAGS-$(CONFIG_WERROR) += -Werror
-KBUILD_CFLAGS += $(KBUILD_CFLAGS-y)
+KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
@@ -798,10 +798,6 @@ KBUILD_CFLAGS += -Wno-gnu
 KBUILD_CFLAGS += -mno-global-merge
 else
 
-# Warn about unmarked fall-throughs in switch statement.
-# Disabled for clang while comment to attribute conversion happens and
-# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
-KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=5,)
 # gcc inanely warns about local variables called 'main'
 KBUILD_CFLAGS += -Wno-main
 endif
diff --git a/init/Kconfig b/init/Kconfig
index 11f8a845f259..b0582cd3e096 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -885,6 +885,11 @@ config ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 config CC_HAS_INT128
 	def_bool !$(cc-option,$(m64-flag) -D__SIZEOF_INT128__=0) && 64BIT
 
+config CC_IMPLICIT_FALLTHROUGH
+	string
+	default "-Wimplicit-fallthrough=5" if CC_IS_GCC
+	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
+
 #
 # For architectures that know their GCC __int128 support is sound
 #
-- 
2.27.0

