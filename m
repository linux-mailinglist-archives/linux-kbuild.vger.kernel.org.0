Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E97245892
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Aug 2020 18:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgHPQgW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Aug 2020 12:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgHPQgA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Aug 2020 12:36:00 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFED5C061786;
        Sun, 16 Aug 2020 09:35:59 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v4so14944373ljd.0;
        Sun, 16 Aug 2020 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:date:from:to:cc:message-id;
        bh=a3HvxMbJN8O8Pk372OctYtEv9DFEIGxh+0Dn03YHbM0=;
        b=rkzxE2I9iYrjfncUm01iSPL+fpmUZTJvYvaHIh2KvkVB1FhtDnBIhvEUKtq0X++cEY
         /63c7okbpmKmVyvbanxRpGepve2LtYQi+PkJBj9fQw+Yb5nFkcp8aV/gg3TGkHYDMeQY
         pCIcMjPJIAb5kssi68HEaLZ7tRXVATnN+J5cCiW8/lQ2ky/4YV0aJXk+sD3Vpm2yBOqr
         WhphYzLpxp0H5ITGS6sSViHGfSJyuHa34yXM+SkdiH1DWM+sx3MTLEqJWHq5loHWF11q
         2FBl+uE4aZizH58x30ZIxEedy3eDbVeZWkLRE+qs37R2s304UrDXBob0FR0U/A5rOhmC
         SyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:from:to:cc:message-id;
        bh=a3HvxMbJN8O8Pk372OctYtEv9DFEIGxh+0Dn03YHbM0=;
        b=kzh3++vUk5dMfbz7Pr87hlv77CJdxOB7ddeyTSRERaJbx4B/4egukk3IiNyqXEQShA
         zURK5RqECb0yTZR6KCRqn+i3iLAY+3URlD8QrzDVATvcydSmCf79tnYnjBzunOvDpw/I
         xR1Ix/768PgKlRewNafVGkCaJxHtvakgUJWQKpxRpr3KBeOIa8gy06hzqpBmO4hax8E5
         HAfhndYiqgUjS6o1sGdnY7y/sx3roVq8ZYIjdcyOcJXnwoG+6PoNJZXYCNN34qRstpGY
         c0kLiAy32MPuQ4ldug+36vLNFaPoniM1qcvQYYlnPOQrNISyFpRHJGB7AGHPJdreY7nw
         /Cuw==
X-Gm-Message-State: AOAM533qPld8exRGSNdD8n85njccCneyJkK/9CEKD+L0wPJYTy96osWk
        Fa7Kvqk2zmHg5VVvEfVCB8o=
X-Google-Smtp-Source: ABdhPJy4YAYo3KWkWAB5zZYmJDxbttk4PCRkDgp1Gljv2EaSTdVTJ+xB4blbv7P/Gy1cGrilJ8p56w==
X-Received: by 2002:a2e:b53b:: with SMTP id z27mr5786172ljm.441.1597595753776;
        Sun, 16 Aug 2020 09:35:53 -0700 (PDT)
Received: from gmail.com (tor-exit-2.zbau.f3netze.de. [185.220.100.253])
        by smtp.gmail.com with ESMTPSA id g21sm3875496ljh.103.2020.08.16.09.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 09:35:52 -0700 (PDT)
Subject: [PATCH] Makefile: Yes. Finally remove '-Wdeclaration-after-statement'
Date:   Sun, 16 Aug 2020 16:35:00 -0000
From:   Michael Witten <mfwitten@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Message-ID: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is not just a matter of style; this is a matter of semantics,
especially with regard to:

  * const Correctness.
    A const-declared variable must be initialized when defined.

  * Conditional Compilation.
    When there is complex interaction between compile-time
    configuration options, it's essential to be able to
    make declarations where needed; otherwise unnecessary
    gymnastics are required to silence the compiler.

Gentleman... Just let people say exactly what they mean to say.

Requiring every declaration to be at the top of a block is an
antiquated, vestigial naivete from a time when C was just a
glorified abstraction over conventional patterns in assembly
programming.

We are not just programming anymore. We are now encoding our
very thoughts, and thus we need this expressiveness in order
to capture those thoughts with sufficient clarity.

Therefore, this commit removes:

  -Wdeclaration-after-statement

Signed-off-by: Michael Witten <mfwitten@gmail.com>

---
 Makefile                          | 3 ---
 arch/arm64/kernel/vdso32/Makefile | 1 -
 tools/power/acpi/Makefile.config  | 1 -
 tools/power/cpupower/Makefile     | 1 -
 tools/scripts/Makefile.include    | 1 -
 5 files changed, 7 deletions(-)

diff --git a/Makefile b/Makefile
index 254e80a96b23..88ad4e430834 100644
--- a/Makefile
+++ b/Makefile
@@ -900,9 +900,6 @@ endif
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 
-# warn about C99 declaration after statement
-KBUILD_CFLAGS += -Wdeclaration-after-statement
-
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
 
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 5139a5f19256..672008c735fb 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -88,7 +88,6 @@ VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                -std=gnu89
 VDSO_CFLAGS  += -O2
 # Some useful compiler-dependent flags from top-level Makefile
-VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
 VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
 VDSO_CFLAGS += $(call cc32-option,-fno-strict-overflow)
 VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
diff --git a/tools/power/acpi/Makefile.config b/tools/power/acpi/Makefile.config
index 54a2857c2510..70ac50cfd7eb 100644
--- a/tools/power/acpi/Makefile.config
+++ b/tools/power/acpi/Makefile.config
@@ -64,7 +64,6 @@ OPTIMIZATION := $(call cc-supports,-Os,-O2)
 
 WARNINGS := -Wall
 WARNINGS += $(call cc-supports,-Wstrict-prototypes)
-WARNINGS += $(call cc-supports,-Wdeclaration-after-statement)
 
 KERNEL_INCLUDE := $(OUTPUT)include
 ACPICA_INCLUDE := $(srctree)/../../../drivers/acpi/acpica
diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index c8622497ef23..d389179d4484 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -118,7 +118,6 @@ OPTIMIZATION := $(call cc-supports,-Os,-O2)
 
 WARNINGS := -Wall -Wchar-subscripts -Wpointer-arith -Wsign-compare
 WARNINGS += $(call cc-supports,-Wno-pointer-sign)
-WARNINGS += $(call cc-supports,-Wdeclaration-after-statement)
 WARNINGS += -Wshadow
 
 override CFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index a7974638561c..83c2a5a1ed15 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -21,7 +21,6 @@ endif
 # Include saner warnings here, which can catch bugs:
 #
 EXTRA_WARNINGS := -Wbad-function-cast
-EXTRA_WARNINGS += -Wdeclaration-after-statement
 EXTRA_WARNINGS += -Wformat-security
 EXTRA_WARNINGS += -Wformat-y2k
 EXTRA_WARNINGS += -Winit-self
-- 
2.22.0

