Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21919295600
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Oct 2020 03:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894657AbgJVBVQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Oct 2020 21:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894655AbgJVBVQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Oct 2020 21:21:16 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A251C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2020 18:21:14 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id z22so65797qtn.15
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2020 18:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=Js6xKSsQarFSzAqlLNbqSKDvsIAL2Ulu7vmD2P/qCQ0=;
        b=G2Rk3NTNeizVUXrrKW3VThtrUg6KYQV+3OC3BDc+RG+hwSeMAw8v4iHA2xRdRG9n5I
         MD65Qj5qKfMSrhANDPNJF3GBlcvoYBnrhpGQqNMm+n/F3/oERzkjI6iRTeWU+5OrRokI
         UvzX33T3DP4Zitx8mfsPIsnmVidmUlKBXa1HPdwo9NSCFwJeUV8cdNintLOB44QUXA4G
         26FUiN7HUU1+CVQxQ70Chvu9Kdv1qGw3+KNfjBGzQfoPeWKH+S/2OwFfW4D2+5u64FUk
         WTLmfT58xbVKnedhfOCVmvItSXlFylKG+mPPD1nniNaEqU8jshaZECJJQ/QtY1h6+GnH
         3C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=Js6xKSsQarFSzAqlLNbqSKDvsIAL2Ulu7vmD2P/qCQ0=;
        b=HVCETHUcARv2V0n0+m/sy4NaADS6ShucqniiZFY+f0esWU0HJ+Onr4yBwZTreuBWK7
         tTyTINR0v7QVmek6/eUF55nPP8t8FuHOgN5jMQjgpOenufR+sh6ZY8XbjXfdu2g97lNv
         v4zaC804OZY4v4GxFMI43pgoRGvFCXrERvzHJyHk8NZNn+dKGVCKaqsKBR/d0Kxpnp/w
         xDrBHyxTFexJuqwCTiRVEUxM9PCz0qq1PqLZW2OXj8sEbksx3OlNBCVBGEW7E+xZt12q
         VGaYHxo5tGTAI2apoS5eu/s2as3uJAm7JqgwnAtaQ2kNVitz7dFJJcn1zRCUgcdoS9r7
         S26Q==
X-Gm-Message-State: AOAM530tmSXKEhYumP+KmN6ftEtNm8Wi6bIDBQOI4mYe7WdKC544/4DQ
        czC33zqqbUCmn604shHJ8nj/K2FEyTGFFGmNzrM=
X-Google-Smtp-Source: ABdhPJz0SSMBINA49bRVpz0emfxWblgj2Vtj9m0koC11+YrVkgaDJTH+v+wseUqhJOu6t+1FbwDXI1SZZzHQ0rtA2h0=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:ad4:46a8:: with SMTP id
 br8mr234132qvb.24.1603329673641; Wed, 21 Oct 2020 18:21:13 -0700 (PDT)
Date:   Wed, 21 Oct 2020 18:21:06 -0700
Message-Id: <20201022012106.1875129-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH] Kbuild: implement support for DWARF5
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-toolchains@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DWARF5 is the latest standard of the DWARF debug info format.

Feature detection of DWARF5 is onerous, especially given that we've
removed $(AS), so we must query $(CC) for DWARF5 assembler directive
support. Further -gdwarf-X where X is an unsupported value doesn't
produce an error in $(CC). GNU `as` only recently gained support for
specifying -gdwarf-5.

The DWARF version of a binary can be validated with:
$ llvm-dwarfdump vmlinux | head -n 5 | grep version
or
$ readelf --debug-dump=info vmlinux 2>/dev/null | grep Version

DWARF5 wins significantly in terms of size when mixed with compression
(CONFIG_DEBUG_INFO_COMPRESSED).

363M    vmlinux.clang12.dwarf5.compressed
434M    vmlinux.clang12.dwarf4.compressed
439M    vmlinux.clang12.dwarf2.compressed
457M    vmlinux.clang12.dwarf5
536M    vmlinux.clang12.dwarf4
548M    vmlinux.clang12.dwarf2

Make CONFIG_DEBUG_INFO_DWARF4 part of a Kconfig choice to preserve
forward compatibility.

Link: http://www.dwarfstd.org/doc/DWARF5.pdf
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
RFC because this patch is super half baked, but I'm looking for
feedback.

I would logically split this into a series of patches;
1. disable -Wa,gdwarf-2 for LLVM_IAS=1, see also
  https://github.com/ClangBuiltLinux/linux/issues/716
  https://github.com/ClangBuiltLinux/continuous-integration/blob/master/patches/llvm-all/linux-next/arm64/silence-dwarf2-warnings.patch
  that way we can backport for improved LLVM_IAS support.
2. move CONFIG_DEBUG_INFO_DWARF4 to choice.
3. implement the rest on top.

I'm pretty sure GNU `as` only recently gained the ability to specify
-gdwarf-4 without erroring in binutils 2.35, so that part likely needs
to be fixed.

 Makefile                          | 19 ++++++++++++++++---
 include/asm-generic/vmlinux.lds.h |  6 +++++-
 lib/Kconfig.debug                 | 29 +++++++++++++++++++++++++----
 scripts/test_dwarf5_support.sh    |  4 ++++
 4 files changed, 50 insertions(+), 8 deletions(-)
 create mode 100755 scripts/test_dwarf5_support.sh

diff --git a/Makefile b/Makefile
index e71979882e4f..0862df5b1a24 100644
--- a/Makefile
+++ b/Makefile
@@ -828,10 +828,23 @@ else
 DEBUG_CFLAGS	+= -g
 endif
 
-KBUILD_AFLAGS	+= -Wa,-gdwarf-2
-
+DWARF_VERSION=2
 ifdef CONFIG_DEBUG_INFO_DWARF4
-DEBUG_CFLAGS	+= -gdwarf-4
+DWARF_VERSION=4
+endif
+ifdef CONFIG_DEBUG_INFO_DWARF5
+DWARF_VERSION=5
+endif
+DEBUG_CFLAGS	+= -gdwarf-$(DWARF_VERSION)
+
+ifneq ($(DWARF_VERSION)$(LLVM_IAS),21)
+KBUILD_AFLAGS	+= -Wa,-gdwarf-$(DWARF_VERSION)
+endif
+
+ifdef CONFIG_CC_IS_CLANG
+ifneq ($(LLVM_IAS),1)
+KBUILD_CFLAGS	+= -Wa,-gdwarf-$(DWARF_VERSION)
+endif
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index cd14444bf600..0382808ef9fe 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -828,7 +828,11 @@
 		.debug_types	0 : { *(.debug_types) }			\
 		/* DWARF 5 */						\
 		.debug_macro	0 : { *(.debug_macro) }			\
-		.debug_addr	0 : { *(.debug_addr) }
+		.debug_addr	0 : { *(.debug_addr) }			\
+		.debug_line_str	0 : { *(.debug_line_str) }		\
+		.debug_loclists	0 : { *(.debug_loclists) }		\
+		.debug_rnglists	0 : { *(.debug_rnglists) }		\
+		.debug_str_offsets 0 : { *(.debug_str_offsets) }
 
 /* Stabs debugging sections. */
 #define STABS_DEBUG							\
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 537cf3c2937d..6b01f0e2dad8 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -256,14 +256,35 @@ config DEBUG_INFO_SPLIT
 	  to know about the .dwo files and include them.
 	  Incompatible with older versions of ccache.
 
+choice
+prompt "DWARF version"
+	depends on DEBUG_INFO
+	default DEBUG_INFO_DWARF2
+	help
+	  Which version of DWARF debug info to emit.
+
+config DEBUG_INFO_DWARF2
+	bool "Generate dwarf2 debuginfo"
+	help
+	  Generate dwarf2 debug info.
+
 config DEBUG_INFO_DWARF4
 	bool "Generate dwarf4 debuginfo"
 	depends on $(cc-option,-gdwarf-4)
 	help
-	  Generate dwarf4 debug info. This requires recent versions
-	  of gcc and gdb. It makes the debug information larger.
-	  But it significantly improves the success of resolving
-	  variables in gdb on optimized code.
+	  Generate dwarf4 debug info. This requires gcc 4.5+ and gdb 7.0+.
+	  It makes the debug information larger, but it significantly
+	  improves the success of resolving variables in gdb on optimized code.
+
+config DEBUG_INFO_DWARF5
+	bool "Generate dwarf5 debuginfo"
+	depends on DEBUG_INFO
+	depends on $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
+	help
+	  Genereate dwarf5 debug info. Requires binutils 2.35+, gcc 5.1+, and
+	  gdb 8.0+.
+
+endchoice # "DWARF version"
 
 config DEBUG_INFO_BTF
 	bool "Generate BTF typeinfo"
diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
new file mode 100755
index 000000000000..82c0eea45845
--- /dev/null
+++ b/scripts/test_dwarf5_support.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+set -eu
+echo ".file 0 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
-- 
2.29.0.rc1.297.gfa9743e501-goog

