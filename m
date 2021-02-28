Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0452327106
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Feb 2021 07:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhB1GLr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Feb 2021 01:11:47 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:55338 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhB1GLq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Feb 2021 01:11:46 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 11S6Aagt009638;
        Sun, 28 Feb 2021 15:10:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 11S6Aagt009638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614492637;
        bh=FJq1WB6jfuuQwA03yL38QkuEaI3B/IvVwfnLKPEhnqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zWqk94IXNju6rrod56k/XYMKz3fEZ0bLHtWdJ4nkcKY102BetYLxLHpkooOw5kJkO
         aV0U4EdCKBcssoSEoDbWEJ/YQg/sLu9TwECwDxdmBLz2siwfl9S6OtmSgC6W6AKrLj
         W8ftunhw3cOIJhVUcT0LRI1ZYQXEMkX4IRM/IcI53DLHznkheVmmIzMg1M8MsjqHRU
         PVUPPZ1l+Vbdc6FtKiyaDQFBrPYDGFfP4+f5YWpQYM/tk1M5gF8dO32dL2aCI9mmm/
         V00LffCEAAEQg+jjSjVoXAA6dSJ6aE5pHCTKj/IBVkeforVCTDTC1bpCJqZIlADm0a
         hOUVGaEhN7pcQ==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 3/4] kbuild: spilt cc-option and friends to scripts/Makefile.compiler
Date:   Sun, 28 Feb 2021 15:10:27 +0900
Message-Id: <20210228061028.239459-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210228061028.239459-1-masahiroy@kernel.org>
References: <20210228061028.239459-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/Kbuild.include is included everywhere, but macros such as
cc-option are needed by build targets only.

For example, when 'make clean' traverses the tree, it does not need
to evaluate $(call cc-option,).

Split cc-option, ld-option, etc. to scripts/Makefile.compiler, which
is only included from the top Makefile and scripts/Makefile.build.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                  |  4 ++
 scripts/Kbuild.include    | 80 ---------------------------------------
 scripts/Makefile.build    |  1 +
 scripts/Makefile.compiler | 77 +++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+), 80 deletions(-)
 create mode 100644 scripts/Makefile.compiler

diff --git a/Makefile b/Makefile
index 2253e31a6bcf..eec7a94f5c33 100644
--- a/Makefile
+++ b/Makefile
@@ -582,6 +582,10 @@ KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
+# Include this also for config targets because some architectures need
+# cc-cross-prefix to determine CROSS_COMPILE.
+include $(srctree)/scripts/Makefile.compiler
+
 ifdef config-build
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 509e0856d653..82dd1b65b7a8 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -67,86 +67,6 @@ define filechk
 	fi
 endef
 
-######
-# gcc support functions
-# See documentation in Documentation/kbuild/makefiles.rst
-
-# cc-cross-prefix
-# Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
-# Return first <prefix> where a <prefix>gcc is found in PATH.
-# If no gcc found in PATH with listed prefixes return nothing
-#
-# Note: '2>/dev/null' is here to force Make to invoke a shell. Otherwise, it
-# would try to directly execute the shell builtin 'command'. This workaround
-# should be kept for a long time since this issue was fixed only after the
-# GNU Make 4.2.1 release.
-cc-cross-prefix = $(firstword $(foreach c, $(1), \
-			$(if $(shell command -v -- $(c)gcc 2>/dev/null), $(c))))
-
-# output directory for tests below
-TMPOUT = $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
-
-# try-run
-# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
-# Exit code chooses option. "$$TMP" serves as a temporary file and is
-# automatically cleaned up.
-try-run = $(shell set -e;		\
-	TMP=$(TMPOUT)/tmp;		\
-	TMPO=$(TMPOUT)/tmp.o;		\
-	mkdir -p $(TMPOUT);		\
-	trap "rm -rf $(TMPOUT)" EXIT;	\
-	if ($(1)) >/dev/null 2>&1;	\
-	then echo "$(2)";		\
-	else echo "$(3)";		\
-	fi)
-
-# as-option
-# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
-
-as-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
-
-# as-instr
-# Usage: cflags-y += $(call as-instr,instr,option1,option2)
-
-as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
-
-# __cc-option
-# Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
-__cc-option = $(call try-run,\
-	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
-
-# cc-option
-# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
-
-cc-option = $(call __cc-option, $(CC),\
-	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
-
-# cc-option-yn
-# Usage: flag := $(call cc-option-yn,-march=winchip-c6)
-cc-option-yn = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
-
-# cc-disable-warning
-# Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
-cc-disable-warning = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
-
-# cc-ifversion
-# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
-
-# ld-option
-# Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
-ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
-
-# ld-ifversion
-# Usage:  $(call ld-ifversion, -ge, 22252, y)
-ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
-
-######
-
 ###
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
 # Usage:
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 750d6d5225af..d74d3383666e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -36,6 +36,7 @@ subdir-ccflags-y :=
 -include include/config/auto.conf
 
 include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.compiler
 
 # The filename Kbuild has precedence over Makefile
 kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
new file mode 100644
index 000000000000..5f759ecc4f04
--- /dev/null
+++ b/scripts/Makefile.compiler
@@ -0,0 +1,77 @@
+######
+# gcc support functions
+# See documentation in Documentation/kbuild/makefiles.rst
+
+# cc-cross-prefix
+# Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
+# Return first <prefix> where a <prefix>gcc is found in PATH.
+# If no gcc found in PATH with listed prefixes return nothing
+#
+# Note: '2>/dev/null' is here to force Make to invoke a shell. Otherwise, it
+# would try to directly execute the shell builtin 'command'. This workaround
+# should be kept for a long time since this issue was fixed only after the
+# GNU Make 4.2.1 release.
+cc-cross-prefix = $(firstword $(foreach c, $(1), \
+			$(if $(shell command -v -- $(c)gcc 2>/dev/null), $(c))))
+
+# output directory for tests below
+TMPOUT = $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
+
+# try-run
+# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# automatically cleaned up.
+try-run = $(shell set -e;		\
+	TMP=$(TMPOUT)/tmp;		\
+	TMPO=$(TMPOUT)/tmp.o;		\
+	mkdir -p $(TMPOUT);		\
+	trap "rm -rf $(TMPOUT)" EXIT;	\
+	if ($(1)) >/dev/null 2>&1;	\
+	then echo "$(2)";		\
+	else echo "$(3)";		\
+	fi)
+
+# as-option
+# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
+
+as-option = $(call try-run,\
+	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
+
+# as-instr
+# Usage: cflags-y += $(call as-instr,instr,option1,option2)
+
+as-instr = $(call try-run,\
+	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
+
+# __cc-option
+# Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
+__cc-option = $(call try-run,\
+	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
+
+# cc-option
+# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
+
+cc-option = $(call __cc-option, $(CC),\
+	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
+
+# cc-option-yn
+# Usage: flag := $(call cc-option-yn,-march=winchip-c6)
+cc-option-yn = $(call try-run,\
+	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
+
+# cc-disable-warning
+# Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
+cc-disable-warning = $(call try-run,\
+	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
+
+# cc-ifversion
+# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
+cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
+
+# ld-option
+# Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
+ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
+
+# ld-ifversion
+# Usage:  $(call ld-ifversion, -ge, 22252, y)
+ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
-- 
2.27.0

