Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E346295622
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Oct 2020 03:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894780AbgJVBoy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Oct 2020 21:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894789AbgJVBoy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Oct 2020 21:44:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CEEC0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2020 18:44:52 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y14so123901pfp.13
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2020 18:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8b52jnuI2BVnQsT5yuf1ZFjurcL3wRE0q6QKCs+W/ic=;
        b=gM1BzOuYy1hNwnMDy57Fpgxq6UiFoiYlEhzGQcJkRtkmbEIhxr5RUnmjByY6Bq4qGY
         9gzi3JMiGvaxtbwnWVCYuqjcXkMATr2D40mX4T1OJm36jfgKyGVGa+pv3XiUN0vdcPfA
         ug6sqAa/kw/+zI5KkTFqRkaReZDArH33TFvsOlFVJhYuFK/nZSZS8NNYor5x5MH5i3zE
         VrCl7trw7w+eIa5Ce43LGG30gsdm8Ab7HdtSGGz1kW1GGdq704opkXkhUiSQOUycs3Z5
         XIC3NU6VoUTkwWPmep1ehKgTmo8Wua7DqjoQEveYdUBR9Q68FYn5nXbJEKBRf+hyy6qA
         95Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8b52jnuI2BVnQsT5yuf1ZFjurcL3wRE0q6QKCs+W/ic=;
        b=oRLx61o6OvmkCsUZ+6XrGgqhN2d+yAc9gEJ3bbpmEyU//HXmjGxYSkqf0BQg7qwNiI
         O9pM582mUxQDLYujAWyQBXIyeGov+M5uE9kpp4IITJSdf9K2nf1FOVXFSXY2QAdqGmGJ
         xBE8PeFEDNxDn2l5fwvf1VDdEumCOKNBXX0jLnynYEW4nVTHUgv1PggsJUBpyCr1BYUT
         MONPaGOkZb3uYq01K4MiDdrlKZVGNJ6LSmbZjjbTb0E3EDS/3EPIQiIkP009MCCLx8b7
         pEX2mlALSDXhmz1dreAByTHL2AiaDjNF6iHCtmMxFlYK89SkyE8l1I1LY7mZy78TM/7A
         3TOA==
X-Gm-Message-State: AOAM533PyU5Vam20iUtlA6WDt84KqYYsS37Z8eBtrrY+UC4ytM0461MI
        ffkD8RXfqYkpyjV9SPkpJPqUhhLj+MEvAw==
X-Google-Smtp-Source: ABdhPJww/9NSVQCb0oAEiW+gX1m9KlMH88Kcwt0ZzRoZFncIhbDGjbyXP7m8w6M9lqkoT4TjhB4PZw==
X-Received: by 2002:a63:f84c:: with SMTP id v12mr324479pgj.125.1603331091866;
        Wed, 21 Oct 2020 18:44:51 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:a6ae:11ff:fe11:4abb])
        by smtp.gmail.com with ESMTPSA id v24sm118930pgi.91.2020.10.21.18.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 18:44:51 -0700 (PDT)
Date:   Wed, 21 Oct 2020 18:44:48 -0700
From:   Fangrui Song <maskray@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
Message-ID: <20201022014448.mcx5n7unf7kkka3o@google.com>
References: <20201022012106.1875129-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201022012106.1875129-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-10-21, 'Nick Desaulniers' via Clang Built Linux wrote:
>DWARF5 is the latest standard of the DWARF debug info format.
>
>Feature detection of DWARF5 is onerous, especially given that we've
>removed $(AS), so we must query $(CC) for DWARF5 assembler directive
>support. Further -gdwarf-X where X is an unsupported value doesn't
>produce an error in $(CC). GNU `as` only recently gained support for
>specifying -gdwarf-5.
>
>The DWARF version of a binary can be validated with:

To be more correct: this is just the version number of the .debug_info section.
Other sections can use different version numbers.
(For example, GNU as still does not support version 5 .debug_line)

>$ llvm-dwarfdump vmlinux | head -n 5 | grep version
>or
>$ readelf --debug-dump=info vmlinux 2>/dev/null | grep Version
>
>DWARF5 wins significantly in terms of size when mixed with compression
>(CONFIG_DEBUG_INFO_COMPRESSED).
>
>363M    vmlinux.clang12.dwarf5.compressed
>434M    vmlinux.clang12.dwarf4.compressed
>439M    vmlinux.clang12.dwarf2.compressed
>457M    vmlinux.clang12.dwarf5
>536M    vmlinux.clang12.dwarf4
>548M    vmlinux.clang12.dwarf2
>
>Make CONFIG_DEBUG_INFO_DWARF4 part of a Kconfig choice to preserve
>forward compatibility.
>
>Link: http://www.dwarfstd.org/doc/DWARF5.pdf
>Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>---
>RFC because this patch is super half baked, but I'm looking for
>feedback.
>
>I would logically split this into a series of patches;
>1. disable -Wa,gdwarf-2 for LLVM_IAS=1, see also
>  https://github.com/ClangBuiltLinux/linux/issues/716
>  https://github.com/ClangBuiltLinux/continuous-integration/blob/master/patches/llvm-all/linux-next/arm64/silence-dwarf2-warnings.patch
>  that way we can backport for improved LLVM_IAS support.
>2. move CONFIG_DEBUG_INFO_DWARF4 to choice.
>3. implement the rest on top.
>
>I'm pretty sure GNU `as` only recently gained the ability to specify
>-gdwarf-4 without erroring in binutils 2.35, so that part likely needs
>to be fixed.
>
> Makefile                          | 19 ++++++++++++++++---
> include/asm-generic/vmlinux.lds.h |  6 +++++-
> lib/Kconfig.debug                 | 29 +++++++++++++++++++++++++----
> scripts/test_dwarf5_support.sh    |  4 ++++
> 4 files changed, 50 insertions(+), 8 deletions(-)
> create mode 100755 scripts/test_dwarf5_support.sh
>
>diff --git a/Makefile b/Makefile
>index e71979882e4f..0862df5b1a24 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -828,10 +828,23 @@ else
> DEBUG_CFLAGS	+= -g
> endif
>
>-KBUILD_AFLAGS	+= -Wa,-gdwarf-2
>-
>+DWARF_VERSION=2
> ifdef CONFIG_DEBUG_INFO_DWARF4
>-DEBUG_CFLAGS	+= -gdwarf-4
>+DWARF_VERSION=4
>+endif
>+ifdef CONFIG_DEBUG_INFO_DWARF5
>+DWARF_VERSION=5
>+endif
>+DEBUG_CFLAGS	+= -gdwarf-$(DWARF_VERSION)
>+
>+ifneq ($(DWARF_VERSION)$(LLVM_IAS),21)
>+KBUILD_AFLAGS	+= -Wa,-gdwarf-$(DWARF_VERSION)
>+endif
>+
>+ifdef CONFIG_CC_IS_CLANG
>+ifneq ($(LLVM_IAS),1)
>+KBUILD_CFLAGS	+= -Wa,-gdwarf-$(DWARF_VERSION)
>+endif
> endif
>
> ifdef CONFIG_DEBUG_INFO_REDUCED
>diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
>index cd14444bf600..0382808ef9fe 100644
>--- a/include/asm-generic/vmlinux.lds.h
>+++ b/include/asm-generic/vmlinux.lds.h
>@@ -828,7 +828,11 @@
> 		.debug_types	0 : { *(.debug_types) }			\
> 		/* DWARF 5 */						\
> 		.debug_macro	0 : { *(.debug_macro) }			\
>-		.debug_addr	0 : { *(.debug_addr) }
>+		.debug_addr	0 : { *(.debug_addr) }			\
>+		.debug_line_str	0 : { *(.debug_line_str) }		\
>+		.debug_loclists	0 : { *(.debug_loclists) }		\
>+		.debug_rnglists	0 : { *(.debug_rnglists) }		\
>+		.debug_str_offsets 0 : { *(.debug_str_offsets) }

Consider adding .debug_names for the accelerator table.
It is the DWARF v5 version of .debug_pub{names,types} (which are mentioned
a few lines above).

> /* Stabs debugging sections. */
> #define STABS_DEBUG							\
>diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>index 537cf3c2937d..6b01f0e2dad8 100644
>--- a/lib/Kconfig.debug
>+++ b/lib/Kconfig.debug
>@@ -256,14 +256,35 @@ config DEBUG_INFO_SPLIT
> 	  to know about the .dwo files and include them.
> 	  Incompatible with older versions of ccache.
>
>+choice
>+prompt "DWARF version"
>+	depends on DEBUG_INFO
>+	default DEBUG_INFO_DWARF2
>+	help
>+	  Which version of DWARF debug info to emit.
>+
>+config DEBUG_INFO_DWARF2
>+	bool "Generate dwarf2 debuginfo"
>+	help
>+	  Generate dwarf2 debug info.

In documentation, a more official way to refer to the format is: DWARF v2.
(While "DWARF5" and "DWARF v5" are acceptable, the latter is preferred)
Ditto below.

> config DEBUG_INFO_DWARF4
> 	bool "Generate dwarf4 debuginfo"
> 	depends on $(cc-option,-gdwarf-4)
> 	help
>-	  Generate dwarf4 debug info. This requires recent versions
>-	  of gcc and gdb. It makes the debug information larger.
>-	  But it significantly improves the success of resolving
>-	  variables in gdb on optimized code.
>+	  Generate dwarf4 debug info. This requires gcc 4.5+ and gdb 7.0+.
>+	  It makes the debug information larger, but it significantly
>+	  improves the success of resolving variables in gdb on optimized code.
>+
>+config DEBUG_INFO_DWARF5
>+	bool "Generate dwarf5 debuginfo"
>+	depends on DEBUG_INFO
>+	depends on $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
>+	help
>+	  Genereate dwarf5 debug info. Requires binutils 2.35+, gcc 5.1+, and
>+	  gdb 8.0+.
>+
>+endchoice # "DWARF version"
>
> config DEBUG_INFO_BTF
> 	bool "Generate BTF typeinfo"
>diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
>new file mode 100755
>index 000000000000..82c0eea45845
>--- /dev/null
>+++ b/scripts/test_dwarf5_support.sh
>@@ -0,0 +1,4 @@
>+#!/bin/sh
>+# SPDX-License-Identifier: GPL-2.0
>+set -eu
>+echo ".file 0 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
>-- 
>2.29.0.rc1.297.gfa9743e501-goog
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20201022012106.1875129-1-ndesaulniers%40google.com.
