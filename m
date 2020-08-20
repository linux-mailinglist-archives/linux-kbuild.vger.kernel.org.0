Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5213B24ABF7
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Aug 2020 02:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgHTAPT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 20:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgHTAPS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 20:15:18 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAF9C061757;
        Wed, 19 Aug 2020 17:15:18 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id i26so269824edv.4;
        Wed, 19 Aug 2020 17:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:date:from:to:cc:message-id:in-reply-to:references;
        bh=qlZrZsyJKktoPbDCVlirtzb5dFKCXFnC9zbiDtQnGUQ=;
        b=NoqVG2GSt5HdYyByd+EcS60uDgK8AuE33cwqwg9Bk0XRaNFFCO/Xo7v3pPP7W6J7vD
         P7V+htl42otoC88y37oHutbnI69YBq/PjncSQUbq5qAHYLC/7Toso0q6YYT9n31SN7+J
         JsrirqkddZgzcHkMFocf7Yy6jW6wLpWH64jWGtfEy10tqouk0rq4INm8Tefj+t9uGVV9
         Q8L4p/Cy8iZnsBEI5gqt+s3BhDdzD4lJIkaepFvxlkY+xjdK0ihzEkEDlsW592zay9bg
         X0aAEcNtDSovCM55ydTBl0jePrRVx8au3eQ0v0hXveDEmZBhzQz9YMZUJPEWvKKRnkv/
         obrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:from:to:cc:message-id:in-reply-to
         :references;
        bh=qlZrZsyJKktoPbDCVlirtzb5dFKCXFnC9zbiDtQnGUQ=;
        b=ULrRJiipGEb8A/R8+WkG8NaBPPFtGPYXTfw4ArJh1brEVpfwgUs0a0QOVzjWeOA+MV
         KN+jE1W6dX4TKfqFK9mtJXUpyl5YcAMX3obiv6A7WkEJgw/nz4Um6a3GkYFDiGicHrZl
         kxRA7X4+MQtNmnfz9YpIZa+fAG/mTx/2Fton60Ii3J+mU7TEvrCGgiAAs5QteOnOFE+1
         KoPQRAHs+1OISUoDXB2z2eaKTswhJT/JreildkclV/PCwUW1NOBwzqJkeEj5tFGxyhDC
         4/tUBPofTYq05RWHpTrgecfufHNeCaiIFfnhm/w5WwDpce+8kVfZGKU1FmvIAWYm55Vd
         3Gdg==
X-Gm-Message-State: AOAM533IZCaSncdYrrqxIdkGCKU8XSI5EJA2cuXRXP/9GdtJvBfP4gHT
        tiU5LppBAqhKCo3+AH99XnV50gp6+Z92ARIi
X-Google-Smtp-Source: ABdhPJx6Fy1bUmCWVz+4/DP7eijLtSvBnTTxgMa8pFG9ZAe/CrnQ7R0QZvcAYanoxiI7ng6pC+JyLQ==
X-Received: by 2002:a05:6402:c12:: with SMTP id co18mr495503edb.297.1597882516185;
        Wed, 19 Aug 2020 17:15:16 -0700 (PDT)
Received: from gmail.com ([185.191.126.240])
        by smtp.gmail.com with ESMTPSA id d23sm271734ejj.74.2020.08.19.17.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 17:15:15 -0700 (PDT)
Subject: [RFC v2] kbuild: Introduce "Warnings for maintainers"
Date:   Thu, 20 Aug 2020 00:15:00 -0000
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
        Pavel Machek <pavel@ucw.cz>,
        David Laight <David.Laight@aculab.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>
Message-ID: <6f33e183801543429ebf8dea4a009694@gmail.com>
In-Reply-To: <3b508e7d9d2a44079d161707819dfd88@gmail.com>
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
  <5820d82432a0485b9a0d40bc093cfeb8@gmail.com>
  <3b508e7d9d2a44079d161707819dfd88@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This revision of the patch makes the following notable changes:

  * The high-level control is placed in:

      scripts/Makefile.extrawarn

  * Interactions between "make W=2" and CONFIG_* are handled
    explicitly.

  * The new conditional logic within the makefiles uses 2 spaces
    for indentation rather than a tab character; this is because
    the tab character has special meaning in a makefile, and it
    is therefore best not to use it unless necessary.

  * The files under the following directory have been left alone:

      tools/

    It appears more work needs to be done to communicate ".config"
    settings to the build infastructure in that subtree.

  * This patch has been lightly tested on my machine:

      $ b()
        {
          make "$@" V=1 2>&1 |
            grep --color=always \
              -e declaration-after-statement \
              -e maybe-uninitialized \
              -e no-maybe-uninitialized \
              -e ^
        }
      $ b
      [...]
      $ b W=2
      [...]

    Look for the highlighted "-W" names; also, note that the
    following option gets passed to the compiler when required:

      -Wno-maybe-uninitialized

Sincerely,
Michael Witten

---8<------8<------8<------8<------8<------8<------8<------8<---
This commit introduces the following new Kconfig options:

  CONFIG_MAINTAINERS_WARNINGS
    |
    +-> CONFIG_WARN_DECLARATION_AFTER_STATEMENT
    |
    +-> CONFIG_WARN_MAYBE_UNINITIALIZED

These produce the following menu items:

  -> Kernel hacking
    -> Compile-time checks and compiler options
      * Warnings for maintainers                                [NEW]
        * Warn about mixing variable definitions and statements [NEW]
        * Warn about use of potentially uninitialized variables [NEW]

In short:

  * CONFIG_MAINTAINERS_WARNINGS (default: y)
      is the umbrella control.

  * CONFIG_WARN_DECLARATION_AFTER_STATEMENT (default: y)
      determines whether "-Wdeclaration-after-statement" is used.

  * CONFIG_WARN_MAYBE_UNINITIALIZED (default: n)
      determines whether "-Wmaybe-uninitialized" is used.

Currently, the default is "y" for CONFIG_MAINTAINERS_WARNINGS,
which should lead to the same warning behavior that existed before
this commit; however, it is intended that eventually the default
will be "n" for CONFIG_MAINTAINERS_WARNINGS.

Running "make" with "W=2" should turn on both warnings, unless
they are thwarted by some other Kbuild logic.

Signed-off-by: Michael Witten <mfwitten@gmail.com>
---
 lib/Kconfig.debug                 | 64 +++++++++++++++++++++++++++++++++++++++
 Makefile                          |  6 ----
 scripts/Makefile.extrawarn        | 28 +++++++++++++++++
 arch/arm64/kernel/vdso32/Makefile |  7 ++++-
 4 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e068c3c7189a..b59185dc85bd 100644
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
+	default n
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
diff --git a/Makefile b/Makefile
index 9cac6fde3479..51a503411d5b 100644
--- a/Makefile
+++ b/Makefile
@@ -900,9 +900,6 @@ endif
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 
-# warn about C99 declaration after statement
-KBUILD_CFLAGS += -Wdeclaration-after-statement
-
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
 
@@ -920,9 +917,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 # Another good warning that we'll want to enable eventually
 KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
 
-# Enabled with W=2, disabled by default as noisy
-KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
-
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= $(call cc-option,-fno-strict-overflow)
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 62c275685b75..a9c90a50785b 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -4,6 +4,8 @@
 #
 # There are three warning groups enabled by W=1, W=2, W=3.
 # They are independent, and can be combined like W=12 or W=123.
+#
+# Also, this adds other warnings that can be switched on via .config
 # ==========================================================================
 
 KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
@@ -17,6 +19,9 @@ endif
 
 export KBUILD_EXTRA_WARN
 
+extrawarn_already_added_-Wdeclaration-after-statement := n
+extrawarn_already_added_-Wmaybe-uninitialized := n
+
 #
 # W=1 - warnings which may be relevant and do not occur too often
 #
@@ -68,7 +73,13 @@ KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
 KBUILD_CFLAGS += -Wmissing-field-initializers
 KBUILD_CFLAGS += -Wsign-compare
 KBUILD_CFLAGS += -Wtype-limits
+
+KBUILD_CFLAGS += -Wdeclaration-after-statement
+extrawarn_already_added_-Wdeclaration-after-statement := y
+
 KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
+extrawarn_already_added_-Wmaybe-uninitialized := y
+
 KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
 
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN2
@@ -93,3 +104,20 @@ KBUILD_CFLAGS += $(call cc-option, -Wpacked-bitfield-compat)
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN3
 
 endif
+
+#
+# Maintainers' Warnings
+#
+ifeq ($(extrawarn_already_added_-Wdeclaration-after-statement), n)
+  ifeq ($(CONFIG_WARN_DECLARATION_AFTER_STATEMENT), y)
+      KBUILD_CFLAGS += -Wdeclaration-after-statement
+  endif
+endif
+
+ifeq ($(extrawarn_already_added_-Wmaybe-uninitialized), n)
+  ifeq ($(CONFIG_WARN_MAYBE_UNINITIALIZED), y)
+    KBUILD_CFLAGS += $(call cc-option,-Wmaybe-uninitialized)
+  else
+    KBUILD_CFLAGS += $(call cc-disable-warning,maybe-uninitialized)
+  endif
+endif
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 5139a5f19256..561f98f27edd 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -88,7 +88,12 @@ VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                -std=gnu89
 VDSO_CFLAGS  += -O2
 # Some useful compiler-dependent flags from top-level Makefile
-VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
+ifeq ($(CONFIG_WARN_DECLARATION_AFTER_STATEMENT), y)
+  VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement)
+endif
+ifeq ($(CONFIG_WARN_MAYBE_UNINITIALIZED), y)
+  VDSO_CFLAGS += $(call cc32-option,-Wmaybe-uninitialized)
+endif
 VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
 VDSO_CFLAGS += $(call cc32-option,-fno-strict-overflow)
 VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
--
2.22.0

