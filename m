Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F25203FD4
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2020 21:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730295AbgFVTC0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jun 2020 15:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730020AbgFVTCZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jun 2020 15:02:25 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8644C061795
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2020 12:02:24 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k1so7969063pls.2
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2020 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=zQ7Fc6ymovBX46AtuWXiLA7hl6B9Jd4vMKWs5H4KplE=;
        b=DBz0dKuszl36wXQ6sn5V61cf5DmaVK4x/ZlfgB01Olr6OHelbW+AmTvvVCWxX4vWj+
         vNHU7zBFKqECPB1XvmmPLVKYUvqlj/OLuKxtRcitLtNhxWLh3H2CBFfmUFWAKn8vXbKd
         FHeIHXFaZxD7DGc7iOkJG042M594aXF1wpO+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zQ7Fc6ymovBX46AtuWXiLA7hl6B9Jd4vMKWs5H4KplE=;
        b=Jt8ufdJlGGk4G5E+RNkqbek6fhMkAnZ9vZDBnABBK5HiKSovxYgnCke74pjOffgcuV
         ti5s3zMrTLYNMCsyPTNUxAFgpW9LZfnOl1VQdi6egQ68M/Wvu0ZH1wkVED+4J/DWOWrU
         YvXDX5gHuXcuvpcYfPyIPE5gtpLR9TRR4etStIWN19/ZkhAt58gZKXh+Zt797fyDZAO1
         a3rcMMTSdws+UzJL7Jy1rcNSe5NbwaAquJDNL8eBp+sJe0ilQyEpJbKCS/Wj4rTJOhS4
         +u55Nae742zk0q6ucRCV6nSBVGVXIW8lhR735gbnVuBnIQ6uMrOO2jEtHdT86LEh2lAD
         ehZA==
X-Gm-Message-State: AOAM532gHaW7Ef/QYhrPzRG1RTN5pOJeqPSnP6PXPlJ727dToihKhfFp
        lUJnpmXYD4v4V3fiNGDWw3vuRg==
X-Google-Smtp-Source: ABdhPJzYWGx1/QYv1WNGyh6xIyuMqFkAlAYkLY1QYvZf7PS/CQ3PsKEfg6ITZ1U79y+4dkHywK+pbw==
X-Received: by 2002:a17:902:8a95:: with SMTP id p21mr19614038plo.230.1592852544295;
        Mon, 22 Jun 2020 12:02:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id dw17sm238180pjb.40.2020.06.22.12.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:02:23 -0700 (PDT)
Date:   Mon, 22 Jun 2020 12:02:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
        linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Provide way to actually disable stack protector
Message-ID: <202006221201.3641ED037E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some builds of GCC enable stack protector by default. Simply removing
the arguments is not sufficient to disable stack protector, as the stack
protector for those GCC builds must be explicitly disabled. (Removing the
arguments is left as-is just to be sure there are no ordering problems. If
-fno-stack-protector ended up _before_ -fstack-protector, it would not
disable it: GCC uses whichever -f... comes last on the command line.)

Fixes: 20355e5f73a7 ("x86/entry: Exclude low level entry code from sanitizing")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile                          | 4 +++-
 arch/Kconfig                      | 3 ---
 arch/arm/boot/compressed/Makefile | 4 ++--
 arch/x86/entry/Makefile           | 3 +++
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index ac2c61c37a73..b46e91bf0b0e 100644
--- a/Makefile
+++ b/Makefile
@@ -762,7 +762,9 @@ ifneq ($(CONFIG_FRAME_WARN),0)
 KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
 endif
 
-stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
+DISABLE_STACKPROTECTOR := $(call cc-option,-fno-stack-protector)
+export DISABLE_STACKPROTECTOR
+stackp-flags-y                                    := $(DISABLE_STACKPROTECTOR)
 stackp-flags-$(CONFIG_STACKPROTECTOR)             := -fstack-protector
 stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
 
diff --git a/arch/Kconfig b/arch/Kconfig
index 8cc35dc556c7..1ea61290900a 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -478,9 +478,6 @@ config HAVE_STACKPROTECTOR
 	  An arch should select this symbol if:
 	  - it has implemented a stack canary (e.g. __stack_chk_guard)
 
-config CC_HAS_STACKPROTECTOR_NONE
-	def_bool $(cc-option,-fno-stack-protector)
-
 config STACKPROTECTOR
 	bool "Stack Protector buffer overflow detection"
 	depends on HAVE_STACKPROTECTOR
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 00602a6fba04..3693bac525d2 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -84,9 +84,9 @@ endif
 
 # -fstack-protector-strong triggers protection checks in this code,
 # but it is being used too early to link to meaningful stack_chk logic.
-nossp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
 $(foreach o, $(libfdt_objs) atags_to_fdt.o, \
-	$(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt $(nossp-flags-y)))
+	$(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt \
+			      $(DISABLE_STACKPROTECTOR)))
 
 # These were previously generated C files. When you are building the kernel
 # with O=, make sure to remove the stale files in the output tree. Otherwise,
diff --git a/arch/x86/entry/Makefile b/arch/x86/entry/Makefile
index b7a5790d8d63..79902decc3d1 100644
--- a/arch/x86/entry/Makefile
+++ b/arch/x86/entry/Makefile
@@ -10,6 +10,9 @@ KCOV_INSTRUMENT := n
 CFLAGS_REMOVE_common.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
 CFLAGS_REMOVE_syscall_32.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
 CFLAGS_REMOVE_syscall_64.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
+CFLAGS_common.o += $(DISABLE_STACKPROTECTOR)
+CFLAGS_syscall_32.o += $(DISABLE_STACKPROTECTOR)
+CFLAGS_syscall_64.o += $(DISABLE_STACKPROTECTOR)
 
 CFLAGS_syscall_64.o		+= $(call cc-option,-Wno-override-init,)
 CFLAGS_syscall_32.o		+= $(call cc-option,-Wno-override-init,)
-- 
2.25.1


-- 
Kees Cook
