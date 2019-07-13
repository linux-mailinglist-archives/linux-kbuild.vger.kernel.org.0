Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E97867815
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jul 2019 06:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfGMEDd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Jul 2019 00:03:33 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60348 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfGMEDd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jul 2019 00:03:33 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6D41CNu028128;
        Sat, 13 Jul 2019 13:01:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6D41CNu028128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562990474;
        bh=z0USyPFcDe0lYTty79Xrc/2Svd1fu++aAKo3U0lUKss=;
        h=From:To:Cc:Subject:Date:From;
        b=IYy1JIWKd+fTzAd16ANSIaN2inSmetCf+au6W58fIAwxgrLCuorS2sqQUY8oJR/uJ
         sdazD0gimDgdL2i/WARX632fTm4ogpfeLMhM8XTlGtFwogw2OAsmI6G3qAmlrGgV6o
         BNNobHLFyf8XUEGFN1bf99IItFD6a+xM4UkqxDRg5kwiyfHU0xiQ1yrjvNPm0sjFtP
         zGmWjHB6gDBG6AenNGkJq0CRCjZ+vTuWp8AXk2bV4UzN6mbaojW/T7lIHYmWIyO6OJ
         1HGEpxd5INn81rIDTg2tmRmdAEmTdnMu2aQLUuu2FDn3cSOC6uXAZe63F+s78ngaXL
         j81nvnu7Hkhow==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org
Subject: [PATCH] kbuild: add --hash-style= and --build-id unconditionally
Date:   Sat, 13 Jul 2019 13:01:10 +0900
Message-Id: <20190713040110.18210-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As commit 1e0221374e30 ("mips: vdso: drop unnecessary cc-ldoption")
explained, these flags are supported by the minimal required version
of binutils.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                          | 6 ++----
 arch/arm/vdso/Makefile            | 3 +--
 arch/arm64/kernel/vdso32/Makefile | 4 ++--
 arch/sparc/vdso/Makefile          | 3 +--
 arch/x86/entry/vdso/Makefile      | 5 ++---
 5 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 2c5d00ba537e..969182105dbd 100644
--- a/Makefile
+++ b/Makefile
@@ -900,10 +900,8 @@ KBUILD_CPPFLAGS += $(ARCH_CPPFLAGS) $(KCPPFLAGS)
 KBUILD_AFLAGS   += $(ARCH_AFLAGS)   $(KAFLAGS)
 KBUILD_CFLAGS   += $(ARCH_CFLAGS)   $(KCFLAGS)
 
-# Use --build-id when available.
-LDFLAGS_BUILD_ID := $(call ld-option, --build-id)
-KBUILD_LDFLAGS_MODULE += $(LDFLAGS_BUILD_ID)
-LDFLAGS_vmlinux += $(LDFLAGS_BUILD_ID)
+KBUILD_LDFLAGS_MODULE += --build-id
+LDFLAGS_vmlinux += --build-id
 
 ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
 LDFLAGS_vmlinux	+= $(call ld-option, -X,)
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index ca85df247775..87b7769214e0 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -13,8 +13,7 @@ ccflags-y += -DDISABLE_BRANCH_PROFILING
 ldflags-$(CONFIG_CPU_ENDIAN_BE8) := --be8
 ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
 	    -z max-page-size=4096 -nostdlib -shared $(ldflags-y) \
-	    $(call ld-option, --hash-style=sysv) \
-	    $(call ld-option, --build-id) \
+	    --hash-style=sysv --build-id \
 	    -T
 
 obj-$(CONFIG_VDSO) += vdso.o
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 288c14d30b45..60a4c6239712 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -96,8 +96,8 @@ VDSO_LDFLAGS := $(VDSO_CPPFLAGS)
 VDSO_LDFLAGS += -Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1
 VDSO_LDFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
 VDSO_LDFLAGS += -nostdlib -shared -mfloat-abi=soft
-VDSO_LDFLAGS += $(call cc32-ldoption,-Wl$(comma)--hash-style=sysv)
-VDSO_LDFLAGS += $(call cc32-ldoption,-Wl$(comma)--build-id)
+VDSO_LDFLAGS += -Wl,--hash-style=sysv
+VDSO_LDFLAGS += -Wl,--build-id
 VDSO_LDFLAGS += $(call cc32-ldoption,-fuse-ld=bfd)
 
 
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 5a9e4e1f9f81..324a23947585 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -115,8 +115,7 @@ quiet_cmd_vdso = VDSO    $@
 		       -T $(filter %.lds,$^) $(filter %.o,$^) && \
 		sh $(srctree)/$(src)/checkundef.sh '$(OBJDUMP)' '$@'
 
-VDSO_LDFLAGS = -shared $(call ld-option, --hash-style=both) \
-	$(call ld-option, --build-id) -Bsymbolic
+VDSO_LDFLAGS = -shared --hash-style=both --build-id -Bsymbolic
 GCOV_PROFILE := n
 
 #
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 39106111be86..4c234a18638a 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -179,9 +179,8 @@ quiet_cmd_vdso = VDSO    $@
 		       -T $(filter %.lds,$^) $(filter %.o,$^) && \
 		 sh $(srctree)/$(src)/checkundef.sh '$(NM)' '$@'
 
-VDSO_LDFLAGS = -shared $(call ld-option, --hash-style=both) \
-	$(call ld-option, --build-id) $(call ld-option, --eh-frame-hdr) \
-	-Bsymbolic
+VDSO_LDFLAGS = -shared --hash-style=both --build-id \
+	$(call ld-option, --eh-frame-hdr) -Bsymbolic
 GCOV_PROFILE := n
 
 #
-- 
2.17.1

