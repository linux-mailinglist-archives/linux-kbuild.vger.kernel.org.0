Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C8827A89A
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Sep 2020 09:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgI1H3g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Sep 2020 03:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgI1H3g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Sep 2020 03:29:36 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B61C0613CF
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2020 00:29:36 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t7so122288pjd.3
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2020 00:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=duHFIQKp8r+w+eGjsvtXP5iTN9kEvFoVdHgd9+rC2Rc=;
        b=lbyEBJGDvqCtyAUz8DenaCxlXwvSCT0kbhnKXe5rZyqFd193yTtQlE/w2nIvyN3BCE
         KnQ137snDVmY+ie2CTxHBHLZokGmDi3VBTZ+0ldyeLnJu77fhBV2oGEglcDyd7E/xvkU
         F8yl6W6xXcmqUHQ6Tu+1e3MIxRo1hIsXsHB2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=duHFIQKp8r+w+eGjsvtXP5iTN9kEvFoVdHgd9+rC2Rc=;
        b=QXgpuXq8zKX6pX+Fo99faun0UK2W3OmC61RpxxVZ86PTqjlqXrOoZcLccwoByaUmwp
         CSdsiztOnJoyJDFYCRVyCMDagQb90//2a0zz7yDhWwq0+rQzx8dl/Qcbpbm2ARYA4l01
         zuZVyGBzA+QeI+rSSIggLWhvY1pj6FMQraD+LSpW813sjyFpMx3tSyc8oQxwG9W0z3Lg
         RUTULVDnHaQMZCsVboogBxEjuU0uvN9LiPvB+Fi6UteY3UNN0piw9IOZC8n3heOlH5lZ
         3h35OgOWK/RvA/vuP/eIHq2Y4GIE55Aco6ZQHgWaGPMzfDP8YZDqXWnIitDVhvVVA5hp
         NQKA==
X-Gm-Message-State: AOAM532xVWWEnQKdjGAH2fM93vh/i+pRqAX/7174vUYPAI66vaXfRG3B
        cBGFDTr1OrcvilzTWhJsC3OLAQ==
X-Google-Smtp-Source: ABdhPJxl1U03NJrmhLqsAFdC3VEgAUanMlZRqMxTOgm9YuC1u35zGfTxsUlr/1DMZbvRbRv6PP2nWg==
X-Received: by 2002:a17:90a:e015:: with SMTP id u21mr171945pjy.33.1601278175944;
        Mon, 28 Sep 2020 00:29:35 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id i9sm386593pfo.138.2020.09.28.00.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 00:29:35 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     groeck@chromium.org, dianders@chromium.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rafael Aquini <aquini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
Date:   Mon, 28 Sep 2020 15:29:29 +0800
Message-Id: <20200928152840.v6.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

trace_printk is meant as a debugging tool, and should not be
compiled into production code without specific debug Kconfig
options enabled, or source code changes, as indicated by the
warning that shows up on boot if any trace_printk is called:
 **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
 **                                                      **
 ** trace_printk() being used. Allocating extra memory.  **
 **                                                      **
 ** This means that this is a DEBUG kernel and it is     **
 ** unsafe for production use.                           **

If DISALLOW_TRACE_PRINTK=1 is passed on the make command
line, the kernel will generate a build-time error if
trace_printk is used. We expect distributors to set this
option for their production kernels.

Note that the code to handle trace_printk is still present,
so this does not prevent people from compiling out-of-tree
kernel modules, or BPF programs.

Also, we are not making this a kernel config option as we
want the developer convenience of being able to reuse a
production kernel config, add trace_printk for debugging,
and rebuild, without any config changes.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes since v5:
 - Rebased, no functional change (moved the Makefile change a
   little lower to keep all the DEBUG stuff together).

Changes since v4:
 - Turns this into a make option, instead of a config
   option, as suggested by Steven Rostedt <rostedt@goodmis.org>.

Changes since v2/v3:
 - Rebase only, v3 didn't exist as I just split out the other
   necessary patches.
 - Added patch 3/3 to fix atomisp_compat_css20.c

Changes since v1:
 - Use static_assert instead of __static_assert (Jason Gunthorpe)
 - Fix issues that can be detected by this patch (running some
   randconfig in a loop, kernel test robot, or manual inspection),
   by:
   - Making some debug config options that use trace_printk depend
     on the new config option.
   - Adding 3 patches before this one.

There is a question from Alexei whether the warning is warranted,
and it's possibly too strongly worded, but the fact is, we do
not want trace_printk to be sprinkled in kernel code by default,
unless a very specific Kconfig command is enabled (or preprocessor
macro).

There's at least 3 reasons that I can come up with:
 1. trace_printk introduces some overhead.
 2. If the kernel keeps adding always-enabled trace_printk, it will
    be much harder for developers to make use of trace_printk for
    debugging.
 3. People may assume that trace_printk is for debugging only, and
    may accidentally output sensitive data (theoritical at this
    stage).

 Makefile               | 14 ++++++++++++++
 include/linux/kernel.h | 17 ++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8763a17d6aa4..6630a0e577ff 100644
--- a/Makefile
+++ b/Makefile
@@ -100,6 +100,16 @@ endif
 
 export quiet Q KBUILD_VERBOSE
 
+# Disallow use of trace_printk. Can be used by production kernels.
+ifeq ("$(origin DISALLOW_TRACE_PRINTK)", "command line")
+  KBUILD_DISALLOW_TRACE_PRINTK = $(DISALLOW_TRACE_PRINTK)
+endif
+ifndef KBUILD_DISALLOW_TRACE_PRINTK
+  KBUILD_DISALLOW_TRACE_PRINTK = 0
+endif
+
+export KBUILD_DISALLOW_TRACE_PRINTK
+
 # Kbuild will save output files in the current working directory.
 # This does not need to match to the root of the kernel source tree.
 #
@@ -846,6 +856,10 @@ endif # CONFIG_DEBUG_INFO
 KBUILD_CFLAGS += $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
 
+ifeq ($(KBUILD_DISALLOW_TRACE_PRINTK),1)
+KBUILD_CFLAGS += -DDISALLOW_TRACE_PRINTK
+endif
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
   # gcc 5 supports generating the mcount tables directly
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 73a4834d53a9..6737d0a8a9b4 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -688,6 +688,12 @@ do {									\
 		____trace_printk_check_format(fmt, ##args);		\
 } while (0)
 
+#ifdef DISALLOW_TRACE_PRINTK
+#define ALLOW_TRACE_PRINTK 0
+#else
+#define ALLOW_TRACE_PRINTK 1
+#endif
+
 /**
  * trace_printk - printf formatting in the ftrace buffer
  * @fmt: the printf format for printing
@@ -721,10 +727,13 @@ do {									\
 #define trace_printk(fmt, ...)				\
 do {							\
 	char _______STR[] = __stringify((__VA_ARGS__));	\
+							\
+	static_assert(ALLOW_TRACE_PRINTK, "trace_printk called.");	\
+							\
 	if (sizeof(_______STR) > 3)			\
 		do_trace_printk(fmt, ##__VA_ARGS__);	\
 	else						\
-		trace_puts(fmt);			\
+		do_trace_puts(fmt);			\
 } while (0)
 
 #define do_trace_printk(fmt, args...)					\
@@ -773,6 +782,11 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
  */
 
 #define trace_puts(str) ({						\
+	static_assert(ALLOW_TRACE_PRINTK, "trace_puts called.");	\
+	do_trace_puts(str);						\
+})
+
+#define do_trace_puts(str) ({						\
 	static const char *trace_printk_fmt __used			\
 		__attribute__((section("__trace_printk_fmt"))) =	\
 		__builtin_constant_p(str) ? str : NULL;			\
@@ -794,6 +808,7 @@ extern void trace_dump_stack(int skip);
  */
 #define ftrace_vprintk(fmt, vargs)					\
 do {									\
+	static_assert(ALLOW_TRACE_PRINTK, "ftrace_vprintk called.");	\
 	if (__builtin_constant_p(fmt)) {				\
 		static const char *trace_printk_fmt __used		\
 		  __attribute__((section("__trace_printk_fmt"))) =	\
-- 
2.28.0.681.g6f77f65b4e-goog

