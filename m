Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A2624F150
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Aug 2020 04:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgHXC7g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 Aug 2020 22:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgHXC7f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Aug 2020 22:59:35 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABE7C061574
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2020 19:59:34 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a79so4065104pfa.8
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2020 19:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K0QJF7R64/4u4uhxHk6Dr7vlf2Ftq1vVohINvK7KjUw=;
        b=JqEFzT+VIrXPJgvfKn25hZpiRIv3iN3PNq43FaH27IXe6EJqUKEJ26viipsh36y50V
         uSkKEVikNVONqsxlpDP3dmBRmy8sB/+SBJ/MFcTRzZZ/lj/1vAf0DG45BQHBgbeBNnqO
         73yyMkJDSNyv6LJa5ucmYhvqX4GZoqcOOnhDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K0QJF7R64/4u4uhxHk6Dr7vlf2Ftq1vVohINvK7KjUw=;
        b=Q1CcRLd0rH94aGmkycaQ5FZ7ju+sPPvu5KiroWEp7JXor3KJyf5u05sHAquyq+sTwN
         wIpjSJY3vRK2dkUDMT3xt5NY0fBZCa+CtIg2jclXVMHHrL5PUP54G/n7aQMr2Did0HSZ
         4qtx8oh13KgpDvQDX6VmZ6hflzOBm8n9+IDyA/2KjLNjCtA87EQHEuriFT+3NTU0tWcT
         xmeAdAMbGJQ5UkCv0f6qLanPMnjwEY1zA7OYn4Hv1UTBruMJB4Hnb/TXS3u8Yfi2j9df
         Ix1w2adeJdItGVnbR7hNL2ywMnjtP1E4tFA7zoZSsdbNyHXKf2/ny18KoSHT86XV3Hye
         GSEQ==
X-Gm-Message-State: AOAM531KZRNJzs41t2M4cVkf1gdOplrIiX+gIiKT8lDZiq2Ys2cI1bqY
        YPjUjaybFnOc/+zVGS4yNET2kQ==
X-Google-Smtp-Source: ABdhPJzJf6RfSrxJg8ML3dQRkPNgII4aES5+W4MBkDjynEWvNKUkwbGWmFwHh4+Ok7tSp18HA89X+Q==
X-Received: by 2002:a63:ee0d:: with SMTP id e13mr2136851pgi.337.1598237974042;
        Sun, 23 Aug 2020 19:59:34 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id 8sm8063058pjx.14.2020.08.23.19.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 19:59:33 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     dianders@chromium.org, groeck@chromium.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Will Deacon <will@kernel.org>, Yue Hu <huyue2@yulong.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
Date:   Mon, 24 Aug 2020 10:59:13 +0800
Message-Id: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
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

 Makefile               | 14 ++++++++++++++
 include/linux/kernel.h | 17 ++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c4470a4e131f2ce..fb8b0d7fb4b2df7 100644
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
@@ -838,6 +848,10 @@ KBUILD_AFLAGS	+= -gz=zlib
 KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
 endif
 
+ifeq ($(KBUILD_DISALLOW_TRACE_PRINTK),1)
+KBUILD_CFLAGS += -DDISALLOW_TRACE_PRINTK
+endif
+
 KBUILD_CFLAGS += $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
 
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 500def620d8f493..7b533b0375596af 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -687,6 +687,12 @@ do {									\
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
@@ -720,10 +726,13 @@ do {									\
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
@@ -772,6 +781,11 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
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
@@ -793,6 +807,7 @@ extern void trace_dump_stack(int skip);
  */
 #define ftrace_vprintk(fmt, vargs)					\
 do {									\
+	static_assert(ALLOW_TRACE_PRINTK, "ftrace_vprintk called.");	\
 	if (__builtin_constant_p(fmt)) {				\
 		static const char *trace_printk_fmt __used		\
 		  __attribute__((section("__trace_printk_fmt"))) =	\
-- 
2.28.0.297.g1956fa8f8d-goog

