Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DBA3DC09A
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 23:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbhG3V6V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 17:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232889AbhG3V5Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 17:57:24 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35EDC0613C1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:57:17 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id n192-20020a25dac90000b029054c59edf217so12020585ybf.3
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Uxes+3KgPBRk8hTWxCPQ73ggKqkGn4KDKi7P3lIrrmE=;
        b=oc1f766nm3acj6+MDjD1DuR6HSNGjlZACN22j3AEU+tm2ixEvAsPi4NY9NgAH7/XFB
         9hQ2/USNVLptc+faEsxpdHrfRjOxvEh+oIJATF9MXWPrhjgsATyy3b0+RwgsPAICdTHU
         xoCNXWfdNstm+ki2AarW0LFNSYl1g1WQXW41en2IMhV03rJuj/L3d/lkUpXjFF64qE7n
         L1UzelynWRnrA8maMsnJI2cRPpeBRsEHD6kRFXI+oQae4Lxz75Q69jrivcmL73vou5Up
         CDhu9f9OKCKr2dTCgM3JXCHfQ1Vo4K3LXXv7MG7NYKQ3AtVlknBgoAaW2aEbJUW9xg8t
         p1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Uxes+3KgPBRk8hTWxCPQ73ggKqkGn4KDKi7P3lIrrmE=;
        b=e7zUseD9J183hExufIeqhXeoT0vo9kOyfgbE0hXd9y87sK72kyJZiD1QRUGuxlW+Ol
         7/iNqwDXGePQDF6VAX0oNZsKGA2BuxWso1ICGVjYsXUkxIRiALvlE8H7hWpweis3kyVH
         yrq3drvVnZZIK6JhJRu3JZaPHrU0+id0eZ111RbUNyXfg6eZDV3i2WHJfERk8RcdnkTf
         DPc54Y6RPmFZlzqa8iKLtbjLFdZ6lBzUcKgePdtFbnmRKV1zJuAwekA31JdDylWDnr/h
         NCNlS+2mRip3Ehu06yOIi4bNx/5e1oWY56fiVHN/b4Eb/AeTW0sCUaALgR3GB7G9UOmx
         mPxQ==
X-Gm-Message-State: AOAM5307AE0xudGH0BjM5+7QUCM1PpK/TLlmZHm774mqN17ag9Ml9Y9c
        Vpj+WAuTP36mAazs+ZlA3mT/GEVMk+bS8hrs260=
X-Google-Smtp-Source: ABdhPJwl6cu/t0jKDt6ug/TY82VXGRaNCSrMNcfRStG8akTrd1tIaDakBYvUhyZJGcozttMUufdQisFyuKxgyRR0HGc=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:ca8b:b433:7c1d:90d])
 (user=ndesaulniers job=sendgmr) by 2002:a25:cf8a:: with SMTP id
 f132mr6504203ybg.387.1627682237084; Fri, 30 Jul 2021 14:57:17 -0700 (PDT)
Date:   Fri, 30 Jul 2021 14:57:07 -0700
In-Reply-To: <20210730215708.276437-1-ndesaulniers@google.com>
Message-Id: <20210730215708.276437-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210730215708.276437-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v5 2/3] Makefile: infer --target from ARCH for CC=clang
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We get constant feedback that the command line invocation of make is too
long when compiling with LLVM. CROSS_COMPILE is helpful when a toolchain
has a prefix of the target triple, or is an absolute path outside of
$PATH.

Since a Clang binary is generally multi-targeted, we can infer a given
target from SRCARCH/ARCH.  If CROSS_COMPILE is not set, simply set
--target= for CLANG_FLAGS, KBUILD_CFLAGS, and KBUILD_AFLAGS based on
$SRCARCH.

Previously, we'd cross compile via:
$ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1
Now:
$ ARCH=arm64 make LLVM=1 LLVM_IAS=1

For native builds (not involving cross compilation) we now explicitly
specify a target triple rather than rely on the implicit host triple.

Link: https://github.com/ClangBuiltLinux/linux/issues/1399
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v3 -> v4:
* Reword commit message and oneline, as per Nathan.
* Drop documentation change (it's the next patch, could be squashed in,
  I guess).
* Drop LLVM_IAS=1 requirement, as per Masahiro.
* Carry Arnd's and Nathan's AB/RB/TB tags, confirmed OK on IRC+Discord.

Changes v2 -> v3:
* Drop check/requirement for LLVM=1, as per Masahiro.
* Change oneliner from LLVM=1 LLVM_IAS=1 to CC=clang LLVM_IAS=1.
* Don't carry forward Nathan's RB/TB tags. :( Sorry Nathan, but thank
  you for testing+reviewing v2.
* Update wording of docs slightly.

Changes v1 -> v2:
* Fix typos in commit message as per Geert and Masahiro.
* Use SRCARCH instead of ARCH, simplifying x86 handling, as per
  Masahiro. Add his sugguested by tag.
* change commit oneline from 'drop' to 'infer.'
* Add detail about explicit host --target and relationship of ARCH to
  SRCARCH, as per Masahiro.

Changes RFC -> v1:
* Rebase onto linux-kbuild/for-next
* Keep full target triples since missing the gnueabi suffix messes up
  32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
  drop references to arm64.
* Flush out TODOS.
* Add note about -EL/-EB, -m32/-m64.
* Add note to Documentation/.

 scripts/Makefile.clang | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 297932e973d4..f983f65dd9f5 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -1,6 +1,32 @@
-ifneq ($(CROSS_COMPILE),)
+# Individual arch/{arch}/Makefiles should use -EL/-EB to set intended
+# endianness and -m32/-m64 to set word size based on Kconfigs instead of
+# relying on the target triple.
+ifeq ($(CROSS_COMPILE),)
+ifeq ($(SRCARCH),arm)
+CLANG_FLAGS	+= --target=arm-linux-gnueabi
+else ifeq ($(SRCARCH),arm64)
+CLANG_FLAGS	+= --target=aarch64-linux-gnu
+else ifeq ($(SRCARCH),hexagon)
+CLANG_FLAGS	+= --target=hexagon-linux-gnu
+else ifeq ($(SRCARCH),m68k)
+CLANG_FLAGS	+= --target=m68k-linux-gnu
+else ifeq ($(SRCARCH),mips)
+CLANG_FLAGS	+= --target=mipsel-linux-gnu
+else ifeq ($(SRCARCH),powerpc)
+CLANG_FLAGS	+= --target=powerpc64le-linux-gnu
+else ifeq ($(SRCARCH),riscv)
+CLANG_FLAGS	+= --target=riscv64-linux-gnu
+else ifeq ($(SRCARCH),s390)
+CLANG_FLAGS	+= --target=s390x-linux-gnu
+else ifeq ($(SRCARCH),x86)
+CLANG_FLAGS	+= --target=x86_64-linux-gnu
+else
+$(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)
+endif # SRCARCH
+else
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
-endif
+endif # CROSS_COMPILE
+
 ifeq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -integrated-as
 else
-- 
2.32.0.554.ge1b32706d8-goog

