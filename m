Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B341124908A
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 00:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgHRWFc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 18:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgHRWFa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 18:05:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395C2C061389;
        Tue, 18 Aug 2020 15:05:30 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l2so19619340wrc.7;
        Tue, 18 Aug 2020 15:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:date:from:to:cc:message-id:in-reply-to:references;
        bh=A4eoWs6fryU4D/osu52OvAD2QfV/D24ej0IpCFqId9w=;
        b=EyvuWRHoCZdeE+nkk13jI+3dFA9wn2BqGJdf7o9tNdePLLQTvb8yHToyPU3lPe/jy8
         u93H39xgu0b8wrNOThRoCArI6Lch9ZIPUrBhWEMa7E3d1HkU0oh8A0N0U2cWY3Rj8GFV
         H/ygEZV/rVRyEaE1FJe+4jsLt4KLbNpYum8lV1p6RlLaDk0eguFO5wteYZx+tv399zIf
         yo5d/0z3NtHWRPIqzAaaGQxK1H8HfEn7cFA4JAhZHOG3R9/pvWtCSl38Y61N9Ul6u7a/
         9aEQb7TkpxYseFJCYz1xoRZG2WdxR+N6UOAx4FT/fY/2+DG/HsxWmu1plzNFlUoizwkR
         qrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:from:to:cc:message-id:in-reply-to
         :references;
        bh=A4eoWs6fryU4D/osu52OvAD2QfV/D24ej0IpCFqId9w=;
        b=Sox3dmAJCAEmEAb9xpmiapjICIj+Ea+rcV+mXAJZdBXAShrzgXPY+3JWtL6eR+3AoQ
         W4/ljEM5KOyVpfXOL8fqfBgWrHzKNcB8YglEMVGrwuMxpJ45w2XRPK6J4SHQ3NNC9MuZ
         WB5B2tI+T/FCUg3EbfeonVxNc8wIx/iaxQgg/xAzoL2j4xNvuO/eD8jvCB2DIDQKMJVL
         aTIys0O0JtHpiJD+UaSsSnuBP7ay1OOHfvFCFTukWxaoaBIaEInc01kmcw5Y3OGMGxsE
         XF7D0aFhsjQt1d0eumMzG65rbmUKxKXRA6OFiIr1B0sufzipiq8M3VTNNBxHquMKSrB/
         sX+w==
X-Gm-Message-State: AOAM532z8f4aX7DjCD/MfRsBqdPg/nV5KlHiF3/VclQxlt//73j6WuP/
        HJuGw1/QC8Nk8gt1q+Tuo7q1nm/DKzc/tBdL
X-Google-Smtp-Source: ABdhPJyduOkOreVEw22121PnzKV4KsowmcGoMpLdM6Lfok5PfTs5WY/osMsDHzasPvWjNIfS40/Cgw==
X-Received: by 2002:adf:b353:: with SMTP id k19mr21622174wrd.159.1597788328187;
        Tue, 18 Aug 2020 15:05:28 -0700 (PDT)
Received: from gmail.com (tor-exit-5.zbau.f3netze.de. [185.220.100.244])
        by smtp.gmail.com with ESMTPSA id i22sm41032810wrb.45.2020.08.18.15.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 15:05:27 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Yes. Finally remove '-Wdeclaration-after-statement'
Date:   Tue, 18 Aug 2020 22:05:00 -0000
From:   Michael Witten <mfwitten@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Ingo Molnar <mingo@kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Levon <john.levon@joyent.com>,
        John Levon <levon@movementarian.org>,
        Pavel Machek <pavel@ucw.cz>, Al Viro <viro@zeniv.linux.org.uk>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>
Message-ID: <5820d82432a0485b9a0d40bc093cfeb8@gmail.com>
In-Reply-To: <23e2e6c2d3a24954bccb67a3186019b9@gmail.com>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
  <20200816175303.GB1236603@ZenIV.linux.org.uk>
  <20200817204223.GB12414@amd>
  <87lfid6kpi.fsf@x220.int.ebiederm.org>
  <CAHk-=wj04wKCjHz6b6d7N58xoS4AftnwTUBaXsEekQ5RhfWVnw@mail.gmail.com>
  <20200817220908.GA3701@amd>
  <CAHk-=wh7Rn=8mVi_KWV71ZaQ2HrCz240DbjEJMDdARTwB3CYvA@mail.gmail.com>
  <20200818051717.GA3134537@gmail.com>
  <e986450210154d49aee1a3885d76c862@AcuMS.aculab.com>
  <61f8da080e5fac1bc23cdd68c43f199029c0a788.camel@perches.com>
  <23e2e6c2d3a24954bccb67a3186019b9@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I think there's an important distinction to make between
the following 2 kinds of code:

  * The curated code people just want to build.
  * The new patches that maintainers are reviewing.

Certainly, maintainers should have a wide range of tools
at their disposal to probe the quality of a patch; then,
after bending rules of style to taste, the maintainers
declare the merged code to be curated, after which that
merged code need not be probed so invasively every time
it is built.

To this end, I propose the following new patch, which
introduces some build-time switches that will help
people make this distinction.

  As you know, you can save this email to some path:

    /path/to/email.eml

  Then apply and review the patch as follows:

    $ cd /path/to/linux/repo
    $ git reset --hard HEAD
    $ git checkout --detach origin/master
    $ git am --scissors /path/to/email.eml
    $ git log -1 -p

At this point, the patch is intended as a[n] RFC;
I haven't tested it, and just wanted to get the
idea out there.

Sincerely,
Michael Witten

---8<------8<------8<------8<------8<------8<------8<------8<---
Subject: [PATCH] kbuild: Introduce "Warnings for maintainers"
This commit introduces the following new Kconfig options:

  CONFIG_MAINTAINERS_WARNINGS
    |
    +-> CONFIG_WARN_DECLARATION_AFTER_STATEMENT
    |
    +-> CONFIG_WARN_MAYBE_UNINITIALIZED

These produce the following menu items:

  -> Kernel hacking
    -> Compile-time checks and compiler options
      -> Warnings for maintainers                                [NEW]
         * Warn about mixing variable definitions and statements [NEW]
         * Warn about use of potentially uninitialized variables [NEW]

In short:

  * CONFIG_MAINTAINERS_WARNINGS
      is the umbrella control.

  * CONFIG_WARN_DECLARATION_AFTER_STATEMENT
      determines whether "-Wdeclaration-after-statement" is used.

  * CONFIG_WARN_MAYBE_UNINITIALIZED
      determines whether "-Wmaybe-uninitialized" is used.

Currently, the default is "y" for each, but it is expected that
eventually the default will be "n" for CONFIG_MAINTAINERS_WARNINGS.

Running "make" with "W=2" should turn both warnings on, unless
they are thwarted by some other Kbuild logic.

Signed-off-by: Michael Witten <mfwitten@gmail.com>
---
 arch/arm64/kernel/vdso32/Makefile |  7 +++-
 lib/Kconfig.debug                 | 64 +++++++++++++++++++++++++++++++
 scripts/Makefile.extrawarn        |  1 +
 tools/power/acpi/Makefile.config  |  7 +++-
 tools/power/cpupower/Makefile     |  7 +++-
 tools/scripts/Makefile.include    |  9 ++++-
 6 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 5139a5f19256..8cc997b9ccef 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -88,7 +88,12 @@ VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                -std=gnu89
 VDSO_CFLAGS  += -O2
 # Some useful compiler-dependent flags from top-level Makefile
-VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
+ifeq($(CONFIG_WARN_DECLARATION_AFTER_STATEMENT), y)
+	VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement)
+endif
+ifeq($(CONFIG_WARN_MAYBE_UNINITIALIZED), y)
+	VDSO_CFLAGS += $(call cc32-option,-Wmaybe-uninitialized)
+endif
 VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
 VDSO_CFLAGS += $(call cc32-option,-fno-strict-overflow)
 VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e068c3c7189a..4e3a87ce77c8 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -308,6 +308,70 @@ config FRAME_WARN
 	  Setting this too low will cause a lot of warnings.
 	  Setting it to 0 disables the warning.
 
+config MAINTAINERS_WARNINGS
+	bool "Warnings for maintainers"
+	default y
+	help
+	  These warnings may be useful to maintainers and contributors
+	  when patches are being prepared and reviewed; they may yield
+	  false positives, and are therefore intended to be turned off
+	  for a normal build.
+
+config WARN_DECLARATION_AFTER_STATEMENT
+	bool "Warn about mixing variable definitions and statements"
+	depends on MAINTAINERS_WARNINGS
+	default y
+	help
+	  Turn on the following gcc command-line option:
+
+	    -Wdeclaration-after-statement
+
+	  Traditionally, C code has been written such that variables
+	  are defined at the top of a block (e.g., at the top of a
+	  function body); C99 removed this requirement, allowing the
+	  mixing of variable definitions and statements, but the
+	  tradition has remained a convention of the kernel's coding
+	  style.
+
+	  When reviewing patches, a maintainer may wish to turn this
+	  warning on, in order to catch variable definitions that have
+	  been placed unnecessarily among the statements, and thereby
+	  enforce the dominant coding style.
+
+	  Of course, sometimes it is useful to define a variable among
+	  the statements, especially in the following cases:
+
+	    * Declaring a const variable.
+	    * Dealing with conditional compilation.
+
+	  Therefore, this warning is intended to be turned off for a
+	  normal build, where all of the code has already been merged
+	  succesfully into the repository.
+
+config WARN_MAYBE_UNINITIALIZED
+	bool "Warn about use of potentially uninitialized variables"
+	depends on MAINTAINERS_WARNINGS
+	default y
+	help
+	  Turn on the following gcc command-line option:
+
+	    -Wmaybe-uninitialized
+
+	  Serious bugs can result from using a variable whose value
+	  has never been explicitly initialized. When this warning
+	  is turned on, the compiler will use heuristic analyses of
+	  the code to determine whether a variable has been properly
+	  initialized before it is ever used.
+
+	  However, the heuristic nature of the analyses has often
+	  caused many false positive warnings that programmers find
+	  irritating; sometimes, bugs are introduced in the process
+	  of simply trying to silence the warning.
+
+	  Therefore, this warning is intended to be turned off for a
+	  normal build, where all of the code has already been merged
+	  succesfully into the repository.
+
 config STRIP_ASM_SYMS
 	bool "Strip assembler-generated symbols during link"
 	default n
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 62c275685b75..afadbdcc7c53 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -68,6 +68,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
 KBUILD_CFLAGS += -Wmissing-field-initializers
 KBUILD_CFLAGS += -Wsign-compare
 KBUILD_CFLAGS += -Wtype-limits
+KBUILD_CFLAGS += -Wdeclaration-after-statement
 KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
 KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
 
diff --git a/tools/power/acpi/Makefile.config b/tools/power/acpi/Makefile.config
index 54a2857c2510..6fe0b34eddd7 100644
--- a/tools/power/acpi/Makefile.config
+++ b/tools/power/acpi/Makefile.config
@@ -64,7 +64,12 @@ OPTIMIZATION := $(call cc-supports,-Os,-O2)
 
 WARNINGS := -Wall
 WARNINGS += $(call cc-supports,-Wstrict-prototypes)
-WARNINGS += $(call cc-supports,-Wdeclaration-after-statement)
+ifeq($(CONFIG_WARN_DECLARATION_AFTER_STATEMENT), y)
+	WARNINGS += $(call cc-supports,-Wdeclaration-after-statement)
+endif
+ifeq($(CONFIG_WARN_MAYBE_UNINITIALIZED), y)
+	WARNINGS += $(call cc-supports,-Wmaybe-uninitialized)
+endif
 
 KERNEL_INCLUDE := $(OUTPUT)include
 ACPICA_INCLUDE := $(srctree)/../../../drivers/acpi/acpica
diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index c8622497ef23..8d26c2003d7d 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -118,7 +118,12 @@ OPTIMIZATION := $(call cc-supports,-Os,-O2)
 
 WARNINGS := -Wall -Wchar-subscripts -Wpointer-arith -Wsign-compare
 WARNINGS += $(call cc-supports,-Wno-pointer-sign)
-WARNINGS += $(call cc-supports,-Wdeclaration-after-statement)
+ifeq($(CONFIG_WARN_DECLARATION_AFTER_STATEMENT), y)
+	WARNINGS += $(call cc-supports,-Wdeclaration-after-statement)
+endif
+ifeq($(CONFIG_WARN_MAYBE_UNINITIALIZED), y)
+	WARNINGS += $(call cc-supports,-Wmaybe-uninitialized)
+endif
 WARNINGS += -Wshadow
 
 override CFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index a7974638561c..a9acd52b5e84 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -17,11 +17,18 @@ OUTDIR := $(shell cd $(OUTPUT) && pwd)
 $(if $(OUTDIR),, $(error output directory "$(OUTPUT)" does not exist))
 endif
 
+#
+# Maintainers' Warnings
+#
+MAINTAINERS_WARNINGS-y :=
+MAINTAINERS_WARNINGS-$(CONFIG_WARN_DECLARATION_AFTER_STATEMENT) += -Wdeclaration-after-statement
+MAINTAINERS_WARNINGS-$(CONFIG_WARN_MAYBE_UNINITIALIZED) += -Wmaybe-uninitialized
+
 #
 # Include saner warnings here, which can catch bugs:
 #
 EXTRA_WARNINGS := -Wbad-function-cast
-EXTRA_WARNINGS += -Wdeclaration-after-statement
+EXTRA_WARNINGS += $(MAINTAINERS_WARNINGS-y)
 EXTRA_WARNINGS += -Wformat-security
 EXTRA_WARNINGS += -Wformat-y2k
 EXTRA_WARNINGS += -Winit-self
-- 
2.22.0

