Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3E75874A
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2019 18:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfF0QkZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Jun 2019 12:40:25 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:24574 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfF0QkY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Jun 2019 12:40:24 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x5RGdDPw001384;
        Fri, 28 Jun 2019 01:39:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x5RGdDPw001384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561653556;
        bh=4f9Bdg3oO7GPeYMOcFqmb0qOWx4/5YC1fL5oEolllJs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JBtHMrOERZXsZ87gj3q5jdcJiisc87Ii1WX9foKDExtNI8ydOePwKsGuQ8eR7P6qg
         +urMpwnuAougAk/P4bVjABn0KbmkyXlnRboswh9rS4rSOeP7mvJJCGvt9pFSR3wFpC
         vCw3dtQfg+W+aRM1mELl5HiCOwvrrl14xU/2LMODDYS3JfQZpBCnVHpKL9ymiZv/lM
         rLUCwlGQboMF0MKKuY9anoSSs8Zr6q9ukd8RLwmPrMWjQhlOaG2A2+VHihL8X9Czfd
         q6xyOm13nHASPnMY/39ykpLPZY612wPCP4VxK12Ep2z7RXCrqKYS1oNW3SjMGPZoDq
         lVZzTpb37u7kA==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v3 2/4] kbuild: do not create wrappers for header-test-y
Date:   Fri, 28 Jun 2019 01:39:00 +0900
Message-Id: <20190627163903.28398-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627163903.28398-1-yamada.masahiro@socionext.com>
References: <20190627163903.28398-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

header-test-y does not work with headers in sub-directories.

For example, you may want to write a Makefile, like this:

include/linux/Kbuild:

  header-test-y += mtd/nand.h

This entry will create a wrapper include/linux/mtd/nand.hdrtest.c
with the following content:

  #include "mtd/nand.h"

To make this work, we need to add $(srctree)/include/linux to the
header search path. It would be tedious to add ccflags-y.

Instead, we could change the *.hdrtest.c rule to wrap:

  #include "nand.h"

This works for in-tree build since #include "..." searches in the
relative path from the header with this directive. For O=... build,
we need to add $(srctree)/include/linux/mtd to the header search path,
which will be even more tedious.

After all, I thought it would be handier to compile headers directly
without creating wrappers.

I added a new build rule to compile %.h into %.h.s

The target is %.h.s instead of %.h.o because it is slightly faster.
Also, as for GCC, an empty assembly is smaller than an empty object.

I wrote the build rule:

  $(CC) $(c_flags) -S -o $@ -x c /dev/null -include $<

instead of:

  $(CC) $(c_flags) -S -o $@ -x c $<

Both work fine with GCC, but the latter is bad for Clang.

This comes down to the difference in the -Wunused-function policy.
GCC does not warn about unused 'static inline' functions at all.
Clang does not warn about the ones in included headers, but does
about the ones in the source. So, we should handle headers as
headers, not as source files.

In fact, this has been hidden since commit abb2ea7dfd82 ("compiler,
clang: suppress warning for unused static inline functions"), but we
should not rely on that.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Tested-by: Jani Nikula <jani.nikula@intel.com>
---

Changes in v3: None
Changes in v2:
  - New patch

 .gitignore                         |  1 -
 Documentation/dontdiff             |  1 -
 Documentation/kbuild/makefiles.txt |  3 +--
 Makefile                           |  1 -
 scripts/Makefile.build             | 10 +++++-----
 scripts/Makefile.lib               |  2 +-
 6 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/.gitignore b/.gitignore
index 4bb60f0fa23b..7587ef56b92d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -22,7 +22,6 @@
 *.elf
 *.gcno
 *.gz
-*.hdrtest.c
 *.i
 *.ko
 *.lex.c
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 554dfe4883d2..5eba889ea84d 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -19,7 +19,6 @@
 *.grep
 *.grp
 *.gz
-*.hdrtest.c
 *.html
 *.i
 *.jpeg
diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index ca4b24ec0399..5080fec34609 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1023,8 +1023,7 @@ When kbuild executes, the following steps are followed (roughly):
 	header-test-y specifies headers (*.h) in the current directory that
 	should be compile tested to ensure they are self-contained,
 	i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
-	this autogenerates dummy sources to include the headers, and builds them
-	as part of extra-y.
+	this builds them as part of extra-y.
 
 --- 6.7 Commands useful for building a boot image
 
diff --git a/Makefile b/Makefile
index f23516980796..7f293b0431fe 100644
--- a/Makefile
+++ b/Makefile
@@ -1648,7 +1648,6 @@ clean: $(clean-dirs)
 		-o -name '*.dwo' -o -name '*.lst' \
 		-o -name '*.su'  \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
-		-o -name '*.hdrtest.c' \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name '*.asn1.[ch]' \
 		-o -name '*.symtypes' -o -name 'modules.order' \
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ee0319560513..776842b7e6a3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -294,14 +294,14 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
-# Dummy C sources for header test (header-test-y target)
+# header test (header-test-y target)
 # ---------------------------------------------------------------------------
 
-quiet_cmd_header_test = HDRTEST $@
-      cmd_header_test = echo "\#include \"$*.h\"" > $@
+quiet_cmd_cc_s_h = CC      $@
+      cmd_cc_s_h = $(CC) $(c_flags) -S -o $@ -x c /dev/null -include $<
 
-$(obj)/%.hdrtest.c:
-	$(call cmd,header_test)
+$(obj)/%.h.s: $(src)/%.h FORCE
+	$(call if_changed_dep,cc_s_h)
 
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3e630fcaffd1..55ae1ec65342 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -67,7 +67,7 @@ extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 endif
 
 # Test self-contained headers
-extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.hdrtest.o,$(header-test-y))
+extra-$(CONFIG_HEADER_TEST) += $(addsuffix .s, $(header-test-y))
 
 # Add subdir path
 
-- 
2.17.1

