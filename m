Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9352706B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgIRUPD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgIRUPD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:15:03 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C681C0613E0
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:14:58 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id r9so6661898ybd.20
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=0FkP4B0/Lnp0DM8m5kyaL0nHymB5hvp+911UgypF4fg=;
        b=BHDVtSDHetldKKo2hdUPaejxOUg5e/yc8Cf5jPF8KvuEYU3GPeekWljxiMYHIrEQq0
         SlyjQ7nTB2hb4xCe7jrH9NeG7+TDkN36Iz/j80rDR1o/RiwSrjXAJOEYsiCKVTp1EsS6
         kPHqV1oAHjGCvpXDEdRkyfZWKXgLztHP1xvR0z0sbav9R8NYsmyZq8qKO5Ia151oKysY
         OCZWaSCUeytDPg1IKXVAcTOAuX1oTxatIgD0DWK0uypAG8DRSWlWJ4vJsZUQFtoH7CT/
         NjL3ZYY2wH7uPQXbbCEmQSU4LkhsBSSMBwvyPvVqydWk1LcDUSp0FxblKNC9q59gwKrA
         ljEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0FkP4B0/Lnp0DM8m5kyaL0nHymB5hvp+911UgypF4fg=;
        b=cxejWwjLqkifchrmtPipLJ+eZav8N6dQRW1FNqXT0V9hPtfOTT+lAQYoaaQ2qMVG6r
         3nNbx5e+cyWWbLZomy+GO1oNauxZiN1EDhba7VflX1+htXTTT7LaLVw2Q184niA7zZFs
         Sc01bbrYYeS3GiTLvzY/dfjhWG4TgKSL47UChS3Kl6M6z7gPBhNCByjVwKtxH046K2bb
         3p3OQnsxKZYzc/9PurCics0LB+m3pETMp112Sci9KDL+XoRsoIUtm5uULtkdON5FFKVT
         01ZpfNCJFVF9Za4inMCnW52TmZVePOXy3/aq/+kAAvF1n3igROH8GjJeFhI2rwsfVcln
         G5gw==
X-Gm-Message-State: AOAM5308qMpwPZh5E5V1bUHC6bWNB/xv7u5mf19i3h/HhLSslVFTKcDa
        5wMH7iVkvCs2SdttLoa7ed39xm74QCFBlQiBOuo=
X-Google-Smtp-Source: ABdhPJwQq1wvH1AAA6gtJNKkwcmiCxJWA5rmyg/i+mPJ3ehFUf0yVGK9jkmjYXbCBq8XTq/g+Yqu8LuBqPuiMAszYNA=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:cf15:: with SMTP id
 f21mr5192645ybg.408.1600460097335; Fri, 18 Sep 2020 13:14:57 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:14 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-9-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 08/30] kbuild: add support for objtool mcount
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

This change adds build support for using objtool to generate
__mcount_loc sections.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 Makefile               | 38 ++++++++++++++++++++++++++++++--------
 kernel/trace/Kconfig   |  5 +++++
 scripts/Makefile.build |  9 +++++----
 3 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 24fd733c142e..d2fb3cd0f506 100644
--- a/Makefile
+++ b/Makefile
@@ -858,17 +858,34 @@ ifdef CONFIG_HAVE_FENTRY
   ifeq ($(call cc-option-yn, -mfentry),y)
     CC_FLAGS_FTRACE	+= -mfentry
     CC_FLAGS_USING	+= -DCC_USING_FENTRY
+    export CC_USING_FENTRY := 1
   endif
 endif
 export CC_FLAGS_FTRACE
-KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
-KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
 ifdef CONFIG_DYNAMIC_FTRACE
-	ifdef CONFIG_HAVE_C_RECORDMCOUNT
-		BUILD_C_RECORDMCOUNT := y
-		export BUILD_C_RECORDMCOUNT
-	endif
+  ifndef CC_USING_RECORD_MCOUNT
+  ifndef CC_USING_PATCHABLE_FUNCTION_ENTRY
+    # use objtool or recordmcount to generate mcount tables
+    ifdef CONFIG_HAVE_OBJTOOL_MCOUNT
+      ifdef CC_USING_FENTRY
+        USE_OBJTOOL_MCOUNT := y
+        CC_FLAGS_USING += -DCC_USING_NOP_MCOUNT
+        export USE_OBJTOOL_MCOUNT
+      endif
+    endif
+    ifndef USE_OBJTOOL_MCOUNT
+      USE_RECORDMCOUNT := y
+      export USE_RECORDMCOUNT
+      ifdef CONFIG_HAVE_C_RECORDMCOUNT
+        BUILD_C_RECORDMCOUNT := y
+        export BUILD_C_RECORDMCOUNT
+      endif
+    endif
+  endif
+  endif
 endif
+KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
+KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
 endif
 
 # We trigger additional mismatches with less inlining
@@ -1213,11 +1230,16 @@ uapi-asm-generic:
 PHONY += prepare-objtool prepare-resolve_btfids
 prepare-objtool: $(objtool_target)
 ifeq ($(SKIP_STACK_VALIDATION),1)
+objtool-lib-prompt := "please install libelf-dev, libelf-devel or elfutils-libelf-devel"
+ifdef USE_OBJTOOL_MCOUNT
+	@echo "error: Cannot generate __mcount_loc for CONFIG_DYNAMIC_FTRACE=y, $(objtool-lib-prompt)" >&2
+	@false
+endif
 ifdef CONFIG_UNWINDER_ORC
-	@echo "error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel" >&2
+	@echo "error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, $(objtool-lib-prompt)" >&2
 	@false
 else
-	@echo "warning: Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel" >&2
+	@echo "warning: Cannot use CONFIG_STACK_VALIDATION=y, $(objtool-lib-prompt)" >&2
 endif
 endif
 
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a4020c0b4508..b510af5b216c 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -56,6 +56,11 @@ config HAVE_C_RECORDMCOUNT
 	help
 	  C version of recordmcount available?
 
+config HAVE_OBJTOOL_MCOUNT
+	bool
+	help
+	  Arch supports objtool --mcount
+
 config TRACER_MAX_TRACE
 	bool
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a467b9323442..6ecf30c70ced 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -178,8 +178,7 @@ cmd_modversions_c =								\
 	fi
 endif
 
-ifdef CONFIG_FTRACE_MCOUNT_RECORD
-ifndef CC_USING_RECORD_MCOUNT
+ifdef USE_RECORDMCOUNT
 # compiler will not generate __mcount_loc use recordmcount or recordmcount.pl
 ifdef BUILD_C_RECORDMCOUNT
 ifeq ("$(origin RECORDMCOUNT_WARN)", "command line")
@@ -206,8 +205,7 @@ recordmcount_source := $(srctree)/scripts/recordmcount.pl
 endif # BUILD_C_RECORDMCOUNT
 cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),	\
 	$(sub_cmd_record_mcount))
-endif # CC_USING_RECORD_MCOUNT
-endif # CONFIG_FTRACE_MCOUNT_RECORD
+endif # USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
 ifneq ($(SKIP_STACK_VALIDATION),1)
@@ -230,6 +228,9 @@ endif
 ifdef CONFIG_X86_SMAP
   objtool_args += --uaccess
 endif
+ifdef USE_OBJTOOL_MCOUNT
+  objtool_args += --mcount
+endif
 
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
-- 
2.28.0.681.g6f77f65b4e-goog

