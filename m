Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110D827063B
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgIRUPL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgIRUPL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:15:11 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE5CC0613D7
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:09 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id h15so4407669pfr.3
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=K8zImTLReF05TErj4+HOAXGu6YGSM1wWftERjd6zSXY=;
        b=O4aL90TvE4llVBU6Z0ndgSX9n+HK3JOWxE5fYd3jLf4UdRHgOfxM4GokiDr2rHZQ5Y
         2S1tWqXy6QXI6V8BRIFCAB8inlLLGlunaNqAEEl+V3RYk+xBOCzHwaLFTJskZ3r5xQeG
         wRfGL7JUNWS2RBdp3cUVMwbgcfUnmvGH8Yh4sqEmk/tTvERZk06+UvODsTGPhyR2vXe3
         RA2SqSl1Q0ZSdldYyKcvOMbw7bcksln+yDchPN4jXuGZ6/U+52OB8u5thT98yesgNfnz
         NVoM2Cu1Sfwc+jcRvFiw4KDwMGrLIyh7i3P37FphlI6sRP8YVrv4+R99WOGRu6gEUYRu
         0AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=K8zImTLReF05TErj4+HOAXGu6YGSM1wWftERjd6zSXY=;
        b=n/ElaiwmJ+YAqDNqDMP77YT7z1QcyylPWBD+7PU5te9hwu11C6TQoYuYbw1zy63Mk5
         1bWVSZrYDs004UxKc8l5s+KLYsH/6tDecoUvLyHW6It67h8uR60C9ojEI3kAeKk3By4C
         GC7+r1E0tfoR6JVd345WpeF37KY1OmUx7F+ebbofFthmq4V6QJ10paIFLqUlKBoKoJqO
         lzopht523ak6Fbfqnt/Aw00YzWEUvLdWPz8q0TRquecfU53dB/kdvp1LMJ+aUHphb35D
         j6E4aUkDpH9pAU5f4I7rf+UjqzEtkAUnvB/+VaCoB1DStBRVyiYeUSmbF/ZOwHMhHGu2
         ibVQ==
X-Gm-Message-State: AOAM530p8Pe+Aq4DD56XzMShEVExVuoMyzGoz1ucmd5ZwlZfu7bR6DeW
        ojcB8G9u/fLGOpBXqVaoJ/qHVqk19pQ2rxCTq20=
X-Google-Smtp-Source: ABdhPJzlGWM/RB0RyiyE2KM3MIKE1UtXk00h26ZK1WTewpuCN9eJRsYcziyZsYst8dQvQffxBp2wtJk2sL6MXkU8ehs=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:cb0f:: with SMTP id
 z15mr13951080pjt.76.1600460109195; Fri, 18 Sep 2020 13:15:09 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:19 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-14-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 13/30] kbuild: lto: postpone objtool
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With LTO, LLVM bitcode won't be compiled into native code until
modpost_link, or modfinal for modules. This change postpones calls
to objtool until after these steps, and moves objtool_args to
Makefile.lib, so the arguments can be reused in Makefile.modfinal.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/Kconfig              |  2 +-
 scripts/Makefile.build    | 22 ++--------------------
 scripts/Makefile.lib      | 11 +++++++++++
 scripts/Makefile.modfinal | 19 ++++++++++++++++---
 scripts/link-vmlinux.sh   | 23 ++++++++++++++++++++++-
 5 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 520e900efc75..727be15ba19e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -600,7 +600,7 @@ config LTO_CLANG
 	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
-	depends on !FTRACE_MCOUNT_RECORD
+	depends on HAVE_OBJTOOL_MCOUNT || !(X86_64 && DYNAMIC_FTRACE)
 	depends on !KASAN
 	depends on !GCOV_KERNEL
 	select LTO
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 44b6d964bcad..541dbe791743 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -218,30 +218,11 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
 endif # USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
+ifndef CONFIG_LTO_CLANG
 ifneq ($(SKIP_STACK_VALIDATION),1)
 
 __objtool_obj := $(objtree)/tools/objtool/objtool
 
-objtool_args = $(if $(CONFIG_UNWINDER_ORC),orc generate,check)
-
-objtool_args += $(if $(part-of-module), --module,)
-
-ifndef CONFIG_FRAME_POINTER
-objtool_args += --no-fp
-endif
-ifdef CONFIG_GCOV_KERNEL
-objtool_args += --no-unreachable
-endif
-ifdef CONFIG_RETPOLINE
-  objtool_args += --retpoline
-endif
-ifdef CONFIG_X86_SMAP
-  objtool_args += --uaccess
-endif
-ifdef USE_OBJTOOL_MCOUNT
-  objtool_args += --mcount
-endif
-
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
@@ -253,6 +234,7 @@ objtool_obj = $(if $(patsubst y%,, \
 	$(__objtool_obj))
 
 endif # SKIP_STACK_VALIDATION
+endif # CONFIG_LTO_CLANG
 endif # CONFIG_STACK_VALIDATION
 
 # Rebuild all objects when objtool changes, or is enabled/disabled.
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3d599716940c..745d88172bc7 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -216,6 +216,17 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
 		 $(addprefix -I,$(DTC_INCLUDE))                          \
 		 -undef -D__DTS__
 
+# Objtool arguments are also needed for modfinal with LTO, so we define
+# then here to avoid duplication.
+objtool_args =								\
+	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
+	$(if $(part-of-module), --module,)				\
+	$(if $(CONFIG_FRAME_POINTER), --no-fp,)				\
+	$(if $(CONFIG_GCOV_KERNEL), --no-unreachable,)			\
+	$(if $(CONFIG_RETPOLINE), --retpoline,)				\
+	$(if $(CONFIG_X86_SMAP), --uaccess,)				\
+	$(if $(USE_OBJTOOL_MCOUNT), --mcount,)
+
 # Useful for describing the dependency of composite objects
 # Usage:
 #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 2cb9a1d88434..1bd2953b11c4 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -9,7 +9,7 @@ __modfinal:
 include $(objtree)/include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
-# for c_flags
+# for c_flags and objtool_args
 include $(srctree)/scripts/Makefile.lib
 
 # find all modules listed in modules.order
@@ -34,10 +34,23 @@ ifdef CONFIG_LTO_CLANG
 # With CONFIG_LTO_CLANG, reuse the object file we compiled for modpost to
 # avoid a second slow LTO link
 prelink-ext := .lto
-endif
+
+# ELF processing was skipped earlier because we didn't have native code,
+# so let's now process the prelinked binary before we link the module.
+
+ifdef CONFIG_STACK_VALIDATION
+ifneq ($(SKIP_STACK_VALIDATION),1)
+cmd_ld_ko_o +=								\
+	$(objtree)/tools/objtool/objtool $(objtool_args)		\
+		$(@:.ko=$(prelink-ext).o);
+
+endif # SKIP_STACK_VALIDATION
+endif # CONFIG_STACK_VALIDATION
+
+endif # CONFIG_LTO_CLANG
 
 quiet_cmd_ld_ko_o = LD [M]  $@
-      cmd_ld_ko_o =                                                     \
+      cmd_ld_ko_o +=							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
 		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
 		-T scripts/module.lds -o $@ $(filter %.o, $^);		\
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 3e99a19b9195..a352a5ad9ef7 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -93,8 +93,29 @@ objtool_link()
 {
 	local objtoolopt;
 
+	if [ "${CONFIG_LTO_CLANG} ${CONFIG_STACK_VALIDATION}" = "y y" ]; then
+		# Don't perform vmlinux validation unless explicitly requested,
+		# but run objtool on vmlinux.o now that we have an object file.
+		if [ -n "${CONFIG_UNWINDER_ORC}" ]; then
+			objtoolopt="orc generate"
+		else
+			objtoolopt="check"
+		fi
+
+		if [ -n ${USE_OBJTOOL_MCOUNT} ]; then
+			objtoolopt="${objtoolopt} --mcount"
+		fi
+	fi
+
 	if [ -n "${CONFIG_VMLINUX_VALIDATION}" ]; then
-		objtoolopt="check --vmlinux"
+		if [ -z "${objtoolopt}" ]; then
+			objtoolopt="check --vmlinux"
+		else
+			objtoolopt="${objtoolopt} --vmlinux"
+		fi
+	fi
+
+	if [ -n "${objtoolopt}" ]; then
 		if [ -z "${CONFIG_FRAME_POINTER}" ]; then
 			objtoolopt="${objtoolopt} --no-fp"
 		fi
-- 
2.28.0.681.g6f77f65b4e-goog

