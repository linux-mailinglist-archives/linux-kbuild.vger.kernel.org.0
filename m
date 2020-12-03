Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E522CDCE0
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 18:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgLCR5y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 12:57:54 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:29796 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgLCR5y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 12:57:54 -0500
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 0B3Hu1Bo005973;
        Fri, 4 Dec 2020 02:56:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 0B3Hu1Bo005973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1607018162;
        bh=ZcOLrQALbkb3/RzN2wo8pY/7fxO5cxpSceGF1gZMUyE=;
        h=From:To:Cc:Subject:Date:From;
        b=zRWDfBnWe5Sb3hEMTMoPzz34OwUxzIgKG6A9mbjpMnMpSLiS0/dmGzO7rifsoRFZJ
         zjgK/nFq5PrQGoV1DX/mN/Wyr3fAtlW/MH8TcydHE/dknSLNCuEppl4L1TvB3rQFgw
         x4qqw42NgkuCCqFS8w5SnFhg46MNknCX9wA03xyOsSxufxI1s/FtYX83ANXBErtzRV
         sLTP5fAB9s0oiDKGWEF4sTFmYCG8EuHJ5Gwhq3/4WRLQ0Q9ytE+ggA3sitwNwixvGM
         XbVFc/yv2t97AgrwvVGjWs7TGQVbHXGxYn0u3XrLKDbhh7FGCJMgyLgzAA7UBXWFUn
         pAlGBCctgWnwQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: avoid split lines in .mod files
Date:   Fri,  4 Dec 2020 02:55:51 +0900
Message-Id: <20201203175551.573123-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

"xargs echo" is not a safe way to remove line breaks because the input
may exceed the command line limit and xargs may break it up into
multiple invocations of echo. This should never happen because
scripts/gen_autoksyms.sh expects all undefined symbols are placed in
the second line of .mod files.

One possible way is to replace "xargs echo" with
"sed ':x;N;$!bx;s/\n/ /g'" or something, but I rewrote the code by
using awk because it is more readable.

This issue was reported by Sami Tolvanen; in his Clang LTO patch set,
$(multi-used-m) is no longer an ELF object, but a thin archive that
contains LLVM bitcode files. llvm-nm prints out symbols for each
archive member separately, which results a lot of dupications, in some
places, beyond the system-defined limit.

This problem must be fixed irrespective of LTO, and we must ensure
zero possibility of having this issue.

Link: https://lkml.org/lkml/2020/12/1/1658
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ae647379b579..4c058f12dd73 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -252,6 +252,9 @@ objtool_dep = $(objtool_obj)					\
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 cmd_gen_ksymdeps = \
 	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
+
+# List module undefined symbols
+undefined_syms = $(NM) $< | $(AWK) '$$1 == "U" { printf("%s%s", x++ ? " " : "", $$2) }';
 endif
 
 define rule_cc_o_c
@@ -271,13 +274,6 @@ define rule_as_o_S
 	$(call cmd,modversions_S)
 endef
 
-# List module undefined symbols (or empty line if not enabled)
-ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
-else
-cmd_undef_syms = echo
-endif
-
 # Built-in and composite module parts
 $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call if_changed_rule,cc_o_c)
@@ -285,7 +281,7 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 
 cmd_mod = { \
 	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
-	$(cmd_undef_syms); \
+	$(undefined_syms) echo; \
 	} > $@
 
 $(obj)/%.mod: $(obj)/%.o FORCE
-- 
2.27.0

