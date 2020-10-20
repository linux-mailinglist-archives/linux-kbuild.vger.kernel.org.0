Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A1F2932A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Oct 2020 03:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389895AbgJTBP2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Oct 2020 21:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389894AbgJTBP2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Oct 2020 21:15:28 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C957C0613CE;
        Mon, 19 Oct 2020 18:15:26 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id b15so439732iod.13;
        Mon, 19 Oct 2020 18:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tRiShrUt1sTjH+sdv59h0JyXdNaA2SG4GeoIP63o8wM=;
        b=e3krGkYgqO4VmM1cAcJRWfGjadPaXVp9xbvn2O8n1yL4BED5i8IHz19sTvr56wBTug
         0nnsV4GPzaEOEZvUfp6UVSzQhKE5je7a6arDbGDy35PUP1bFLX/NzeWnAwP8UWeVtKQ6
         SZfSM3QaCEfb2GK075DGZc9mXeR67R+GpeWO0kn6hj+hbMxiy07pOZPD+XtUxf3Q2UL7
         ile6TT2sE52qNuNYmiOrun89m517A4R5QBbMTpdz5HWvJdEd1Idr7NR3uIy+8QwaRN03
         BXMtvPxe+Wliiba31xCpgg8s0Erj/HHZiC1vqtXf6cJMJHvT/nW4amGpMHiq4Qi03Sd4
         QVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tRiShrUt1sTjH+sdv59h0JyXdNaA2SG4GeoIP63o8wM=;
        b=YBpSopXyG6t9Z17cT+ilZnv5ThNUjc1xAA+QjrNsCT3C6P9arDy9NmwcA+6Gw9Cwa8
         Xuvda4MwPzXvA94uF2NFhWK+ddrFivX74ZyFpRNcj4mmy3sYizx9mmKI3t/9zMKHGLfc
         3nF9+x5omL7kdqyBSQgo0IjiRdp4Fhx9R78EmnKDOBdSf+E2ZU1vPcVS+DyJoY9pGVWY
         /DOb1z3y+8MRI/PZsfD60ClsJPkht/v72z9ub41qKGODzjLYheF5eJnGMqEMtLxBLO2F
         NOUZCO4pHCYpMr0EpAi33IWeYb+uarHR5w1aDwrnoR/YmVRtPPg6C6n2a4Fin0sx4ZrH
         +zOQ==
X-Gm-Message-State: AOAM530E5+0D2sPtTlI65HpGB3QYRp6Dcc2ugE5MoSg20vRyZqka+IV3
        vD0mYMzNGjJstT/szwtGVE4=
X-Google-Smtp-Source: ABdhPJyLWcIpobZwJhM8mXlvbTqrqTmqKAOLlP7hYWYDqhmVfa6lhMFK/8j6Uvor5L4+wG5pVpG+Yg==
X-Received: by 2002:a6b:7f43:: with SMTP id m3mr399912ioq.114.1603156525808;
        Mon, 19 Oct 2020 18:15:25 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:45d1:2600::3])
        by smtp.gmail.com with ESMTPSA id t16sm357646ild.27.2020.10.19.18.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 18:15:25 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH v2] arm64: vdso32: Allow ld.lld to properly link the VDSO
Date:   Mon, 19 Oct 2020 18:14:07 -0700
Message-Id: <20201020011406.1818918-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201013033947.2257501-1-natechancellor@gmail.com>
References: <20201013033947.2257501-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As it stands now, the vdso32 Makefile hardcodes the linker to ld.bfd
using -fuse-ld=bfd with $(CC). This was taken from the arm vDSO
Makefile, as the comment notes, done in commit d2b30cd4b722 ("ARM:
8384/1: VDSO: force use of BFD linker").

Commit fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to
link VDSO") changed that Makefile to use $(LD) directly instead of
through $(CC), which matches how the rest of the kernel operates. Since
then, LD=ld.lld means that the arm vDSO will be linked with ld.lld,
which has shown no problems so far.

Allow ld.lld to link this vDSO as we do the regular arm vDSO. To do
this, we need to do a few things:

* Add a LD_COMPAT variable, which defaults to $(CROSS_COMPILE_COMPAT)ld
  with gcc and $(LD) if LLVM is 1, which will be ld.lld, or
  $(CROSS_COMPILE_COMPAT)ld if not, which matches the logic of the main
  Makefile. It is overrideable for further customization and avoiding
  breakage.

* Eliminate cc32-ldoption, which matches commit 055efab3120b ("kbuild:
  drop support for cc-ldoption").

With those, we can use $(LD_COMPAT) in cmd_ldvdso and change the flags
from compiler linker flags to linker flags directly. We eliminate
-mfloat-abi=soft because it is not handled by the linker.

Link: https://github.com/ClangBuiltLinux/linux/issues/1033
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Change ifeq ($(LLVM),1) to ifneq ($(LLVM),) to match the main Makefile
  per Vincenzo.

* Carry forward Nick and Vincenzo's tags.

 arch/arm64/kernel/vdso32/Makefile | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 7f96a1a9f68c..79280c53b9a6 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -22,16 +22,21 @@ endif
 
 CC_COMPAT ?= $(CC)
 CC_COMPAT += $(CC_COMPAT_CLANG_FLAGS)
+
+ifneq ($(LLVM),)
+LD_COMPAT ?= $(LD)
+else
+LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
+endif
 else
 CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
+LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
 endif
 
 cc32-option = $(call try-run,\
         $(CC_COMPAT) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
 cc32-disable-warning = $(call try-run,\
 	$(CC_COMPAT) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
-cc32-ldoption = $(call try-run,\
-        $(CC_COMPAT) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
 cc32-as-instr = $(call try-run,\
 	printf "%b\n" "$(1)" | $(CC_COMPAT) $(VDSO_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
 
@@ -122,14 +127,10 @@ dmbinstr := $(call cc32-as-instr,dmb ishld,-DCONFIG_AS_DMB_ISHLD=1)
 VDSO_CFLAGS += $(dmbinstr)
 VDSO_AFLAGS += $(dmbinstr)
 
-VDSO_LDFLAGS := $(VDSO_CPPFLAGS)
 # From arm vDSO Makefile
-VDSO_LDFLAGS += -Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1
-VDSO_LDFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
-VDSO_LDFLAGS += -nostdlib -shared -mfloat-abi=soft
-VDSO_LDFLAGS += -Wl,--hash-style=sysv
-VDSO_LDFLAGS += -Wl,--build-id=sha1
-VDSO_LDFLAGS += $(call cc32-ldoption,-fuse-ld=bfd)
+VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
+VDSO_LDFLAGS += -z max-page-size=4096 -z common-page-size=4096
+VDSO_LDFLAGS += -nostdlib -shared --hash-style=sysv --build-id=sha1
 
 
 # Borrow vdsomunge.c from the arm vDSO
@@ -189,8 +190,8 @@ quiet_cmd_vdsold_and_vdso_check = LD32    $@
       cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check)
 
 quiet_cmd_vdsold = LD32    $@
-      cmd_vdsold = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_LDFLAGS) \
-                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
+      cmd_vdsold = $(LD_COMPAT) $(VDSO_LDFLAGS) \
+                   -T $(filter %.lds,$^) $(filter %.o,$^) -o $@
 quiet_cmd_vdsocc = CC32    $@
       cmd_vdsocc = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_CFLAGS) -c -o $@ $<
 quiet_cmd_vdsocc_gettimeofday = CC32    $@

base-commit: 0fa21cf4489fe11737d56f8056dda1ba0257bd8d
-- 
2.29.0

