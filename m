Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D122A5B50
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Nov 2020 01:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730105AbgKDAyC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 19:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730102AbgKDAyC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 19:54:02 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA5CC0401C1
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2020 16:54:02 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id x9so2601600pff.10
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2020 16:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=qAidyqNqiCb5KbKHSVTfkxVbZF8KiimMPZ6+hMhgskc=;
        b=FYNNpzBX6MFClVMxdOh7b6CkI9mB3OkTG7heA7Y2giClCmOwoSCWpJEL3OK24t9y6N
         EwAO3YFverf4ENM++ZVCMBeMwGSfpYOfttiyCwNXnn8ow6IbIMXIGVhAwy4dIhUyeO/t
         BM/m7OSt7rR0T9fRtgw6jRaRvOTC3ZJNRuDFsOfNY22XM6kmNI0Y1usVnGFt37Vxv34o
         UlomziDbwSsBBWbtiypBKIKWrLG8U9bElC4Vydr7rdYmm+gYhDuyYO+RawgIwx9wV+KO
         tOCGgbGliBQFSxGNmv2Z67qJfb6AbPTl9NdRo4b8m7GlAsYRDturv3qZoxx2uQAUsqFv
         LOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qAidyqNqiCb5KbKHSVTfkxVbZF8KiimMPZ6+hMhgskc=;
        b=CexJCjINa2TmcYOrS3fnUFTXyxS5rT6xeDEmv9t3Oua4Z0g7r1nfnW2ppZEmZbcqAg
         1rE2E++DvvZXsOYcYTpKgfD0xlpVSc8IhmkPgdCfKL2P8AFJqv6dA2Munk6qrUlYN5N8
         8sHptFVhVePAJwLiQ1JsnUowRSWyXlX4JgzkVIE5EPx9TV9OqShNB5GneJiieFdsMJcM
         iAlmdooSoThYbW61CZfyjYkE4cdj4wLViY7aBOgtkRyt4Uj5Qa7xUxnJcxAPGjx9XMMD
         tCUF+h+e36uJJWY8cwsAx4wqVY3QXV5cCib2X44amhH3RxmQ8sxaih9C2D8lPgi+/rdW
         Um3g==
X-Gm-Message-State: AOAM531v6hGYA9my0sAv7IxMDtNbnRH5uWFNaVAwo9DDtA/FVsNqYzW7
        Gw3egKxsePk1BCS1imPVhtBDgEaIf2dKsu1J+CU=
X-Google-Smtp-Source: ABdhPJwYymd8KZYB2PaEJIiNnqOdDUNXtOjIblxRdDuiGCVJeBVp8ioaJCYT5XtUYEzvBNrPCWoEKjNn7MBv/O/Ri9w=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a62:7bcc:0:b029:18b:5859:d5e1 with
 SMTP id w195-20020a627bcc0000b029018b5859d5e1mr503977pfc.40.1604451241501;
 Tue, 03 Nov 2020 16:54:01 -0800 (PST)
Date:   Tue,  3 Nov 2020 16:53:43 -0800
In-Reply-To: <20201104005343.4192504-1-ndesaulniers@google.com>
Message-Id: <20201104005343.4192504-5-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v2 4/4] Kbuild: implement support for DWARF v5
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DWARF v5 is the latest standard of the DWARF debug info format.

Feature detection of DWARF5 is onerous, especially given that we've
removed $(AS), so we must query $(CC) for DWARF5 assembler directive
support.  GNU `as` only recently gained support for specifying
-gdwarf-5.

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

Link: http://www.dwarfstd.org/doc/DWARF5.pdf
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Suggested-by: Jakub Jelinek <jakub@redhat.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile                          | 1 +
 include/asm-generic/vmlinux.lds.h | 6 +++++-
 lib/Kconfig.debug                 | 8 ++++++++
 scripts/test_dwarf5_support.sh    | 9 +++++++++
 4 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100755 scripts/test_dwarf5_support.sh

diff --git a/Makefile b/Makefile
index e23786a4c1c7..9056bac0ff85 100644
--- a/Makefile
+++ b/Makefile
@@ -828,6 +828,7 @@ endif
 
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
+dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
 DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
 ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
 # Binutils 2.35+ required for -gdwarf-4+ support.
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2b3d81b1535..76ce62c77029 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -829,7 +829,11 @@
 		.debug_types	0 : { *(.debug_types) }			\
 		/* DWARF 5 */						\
 		.debug_macro	0 : { *(.debug_macro) }			\
-		.debug_addr	0 : { *(.debug_addr) }
+		.debug_addr	0 : { *(.debug_addr) }			\
+		.debug_line_str	0 : { *(.debug_line_str) }		\
+		.debug_loclists	0 : { *(.debug_loclists) }		\
+		.debug_rnglists	0 : { *(.debug_rnglists) }		\
+		.debug_str_offsets	0 : { *(.debug_str_offsets) }
 
 /* Stabs debugging sections. */
 #define STABS_DEBUG							\
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 03c494eefabd..c5b54ba51060 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -274,6 +274,14 @@ config DEBUG_INFO_DWARF4
 	  It makes the debug information larger, but it significantly
 	  improves the success of resolving variables in gdb on optimized code.
 
+config DEBUG_INFO_DWARF5
+	bool "Generate DWARF5 debuginfo"
+	depends on $(cc-option,-gdwarf-5)
+	depends on $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
+	help
+	  Genereate dwarf5 debug info. Requires binutils 2.35+, gcc 5.1+, and
+	  gdb 8.0+.
+
 endchoice # "DWARF version"
 
 config DEBUG_INFO_BTF
diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
new file mode 100755
index 000000000000..156ad5ec4274
--- /dev/null
+++ b/scripts/test_dwarf5_support.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+# Test that assembler accepts -gdwarf-5 and .file 0 directives, which were bugs
+# in binutils < 2.35.
+# https://sourceware.org/bugzilla/show_bug.cgi?id=25612
+# https://sourceware.org/bugzilla/show_bug.cgi?id=25614
+set -e
+echo '.file 0 "filename"' | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
-- 
2.29.1.341.ge80a0c044ae-goog

