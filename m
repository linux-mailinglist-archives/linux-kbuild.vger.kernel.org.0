Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEF53DC95E
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Aug 2021 04:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhHAC4O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 31 Jul 2021 22:56:14 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:35472 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbhHACyP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Jul 2021 22:54:15 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 1712rmh9026849;
        Sun, 1 Aug 2021 11:53:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 1712rmh9026849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627786429;
        bh=THjjh/MBwu064N8PkuAcVIKWQNUJvheL3ECQMRV6TXY=;
        h=From:To:Cc:Subject:Date:From;
        b=UJHptJ/kaKMT3uyJLtLPf+FssuOTtM1kiCjqkAKJPPGpHL3M5/7RK5m+BDVGgHolC
         97D7tjP5b45A+13Y4u1mL6oxFZX6BNPTx/4fNFCxs3/sj/beTLEZx4DAxUkahl18wV
         pdgoEEVPc1l2mzGIoWUlFA4Ee8ZQCyoZ4wMpe9xjpLRap+9l/3C/aBEK9Pjc/swEeS
         LukERFhly3jl16O7Z5tMODZLBtbvjaRvqbB5mpj7LRcZmkLRE+qL8Y+7/Jh52n4e6F
         PR9Xxbj0pfo5sJ+dxpyoOOzfZyUw4CB3u9/Be6z7mUltIlXilmueKrTn2N+3DbF6X8
         6T9ewVL+TVKQw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: warn if a different compiler is used for external module builds
Date:   Sun,  1 Aug 2021 11:53:46 +0900
Message-Id: <20210801025346.93877-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is always safe to use the same compiler for the kernel and external
modules, but in reality, some distributions such as Fedora release a
different version of GCC from the one used for building the kernel.

There was a long discussion about mixing different compilers [1].

I do not repeat it here, but at least, showing a heads up in that
case is better than nothing.

Linus suggested [2]:
  And a warning might be more palatable even if different compiler
  version work fine together. Just a heads up on "it looks like you
  might be mixing compiler versions" is a valid note, and isn't
  necessarily wrong. Even when they work well together, maybe you want
  to have people at least _aware_ of it.

This commit shows a warning unless the compiler is exactly the same.

  warning: the compiler differs from the one used to build the kernel
    The kernel was built by: gcc (GCC) 11.1.1 20210531 (Red Hat 11.1.1-3)
    You are using:           gcc (GCC) 11.2.1 20210728 (Red Hat 11.2.1-1)

Check the difference, and if it is OK with you, please proceed at your
risk.

To avoid the locale issue as in commit bcbcf50f5218 ("kbuild: fix
ld-version.sh to not be affected by locale"), pass LC_ALL=C to
"$(CC) --version".

[1] https://lore.kernel.org/linux-hardening/efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com/
[2] https://lore.kernel.org/lkml/CAHk-=wgjwhDy-y4mQh34L+2aF=n6BjzHdqAW2=8wri5x7O04pA@mail.gmail.com/

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6b555f64df06..f4cc77a10413 100644
--- a/Makefile
+++ b/Makefile
@@ -583,7 +583,7 @@ endif
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
-CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
+CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))
 
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 ifneq ($(CROSS_COMPILE),)
@@ -1731,6 +1731,16 @@ clean-dirs := $(KBUILD_EXTMOD)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps \
 	$(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-cache
 
+PHONY += prepare
+# now expand this into a simple variable to reduce the cost of shell evaluations
+prepare: CC_VERSION_TEXT := $(CC_VERSION_TEXT)
+prepare:
+	@if [ "$(CC_VERSION_TEXT)" != $(CONFIG_CC_VERSION_TEXT) ]; then \
+		echo >&2 "warning: the compiler differs from the one used to build the kernel"; \
+		echo >&2 "  The kernel was built by: "$(CONFIG_CC_VERSION_TEXT); \
+		echo >&2 "  You are using:           $(CC_VERSION_TEXT)"; \
+	fi
+
 PHONY += help
 help:
 	@echo  '  Building external modules.'
@@ -1742,7 +1752,7 @@ help:
 	@echo  ''
 
 # no-op for external module builds
-PHONY += prepare modules_prepare
+PHONY += modules_prepare
 
 endif # KBUILD_EXTMOD
 
-- 
2.27.0

