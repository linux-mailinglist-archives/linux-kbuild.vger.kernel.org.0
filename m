Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218A82C95CA
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 04:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgLADad (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Nov 2020 22:30:33 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:56007 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727626AbgLADad (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Nov 2020 22:30:33 -0500
Received: from localhost.localdomain (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 0B13Roh5015494;
        Tue, 1 Dec 2020 12:27:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0B13Roh5015494
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606793271;
        bh=W22SM8sNj3s46nVGz0HpqYpbIii3yOJZwAwL+xZLxIk=;
        h=From:To:Cc:Subject:Date:From;
        b=1mKHFrmh8tW+SehrLcy917u518YCvxlpi7NX3JBrUxMbbUd9BEKGHGDPkSNYwvekv
         jg3peuQYXYdKuGJcPHSBwPuX8pZNRvcxdfgdWq/9mMi5bIu/g2pFH9VzoJJTExrC0h
         NWK+d1uGIXP0UO2GxQbinCH0yQEneU+IjpxmGh+ADA2SK14+6UNYWBWTSxDdLxWhIC
         2s0XR52uefeQokmqkPCWWHDMYLttmcw/8c82WC7jtBZ+5T6fb+mIYll2wMPyM3fP4U
         dmF6z3cV3oFvC0H+iFIidm4Vi548WNpvCDXyMO1hpVxsMBiaJhOIztNGuIFALs7Utj
         aZqYotBy4930w==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Fangrui Song <maskray@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Enderborg <peter.enderborg@sony.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        "peterz@infradead.org" <peterz@infradead.org>
Subject: [PATCH] Remove $(cc-option,-gdwarf-4) dependency from CONFIG_DEBUG_INFO_DWARF4
Date:   Tue,  1 Dec 2020 12:27:48 +0900
Message-Id: <20201201032748.486928-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The -gdwarf-4 flag is supported by GCC 4.5+, and also by Clang.

You can see it at https://godbolt.org/z/6ed1oW

  For gcc 4.5.3 pane,    line 37:    .value 0x4
  For clang 10.0.1 pane, line 117:   .short 4

Given Documentation/process/changes.rst stating GCC 4.9 is the minimal
version, this cc-option is unneeded.

Note
----

CONFIG_DEBUG_INFO_DWARF4 controls the DWARF version only for C files.

As you can see in the top Makefile, -gdwarf-4 is only passed to CFLAGS.

  ifdef CONFIG_DEBUG_INFO_DWARF4
  DEBUG_CFLAGS    += -gdwarf-4
  endif

This flag is used when compiling *.c files.

On the other hand, the assembler is always given -gdwarf-2.

  KBUILD_AFLAGS   += -Wa,-gdwarf-2

Hence, the debug info that comes from *.S files is always DWARF v2.
This is simply because GAS supported only -gdwarf-2 for a long time.

Recently, GAS gained the support for --dwarf-[3|4|5] options. [1]
And, also we have Clang integrated assembler. So, the debug info
for *.S files might be improved if we want.

In my understanding, the current code is intentional, not a bug.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=31bf18645d98b4d3d7357353be840e320649a67d

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 lib/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index cb8ef4fd0d02..7f80c25497a1 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -258,7 +258,6 @@ config DEBUG_INFO_SPLIT
 
 config DEBUG_INFO_DWARF4
 	bool "Generate dwarf4 debuginfo"
-	depends on $(cc-option,-gdwarf-4)
 	help
 	  Generate dwarf4 debug info. This requires recent versions
 	  of gcc and gdb. It makes the debug information larger.
-- 
2.27.0

