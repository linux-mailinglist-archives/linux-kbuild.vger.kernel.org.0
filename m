Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDBD2B8782
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Nov 2020 23:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgKRWHh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Nov 2020 17:07:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726886AbgKRWHf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Nov 2020 17:07:35 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5CCC061A51
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2020 14:07:35 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id a13so4535128ybj.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2020 14:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=kod53Z9Bn/oLp+88TnQNrWTDZiAkcCd5b++0bm6KqDA=;
        b=Oq8r6SCNamOHoS7iSUmJRRev5DGFdlnvFFu0GIi+STeDi/2VxvM9bYiQjKuTfjLCAf
         X7p4TRLUESowZaZNgKuuIfZO5b2odS7+x2ubT/aFKQrV+o/bQpkDUCuuQ+uEb1OdNofk
         gyWDaXNvo32HCUdIUsKJKgTCnCmshX/5gGSe7kgfDUd1vWxv/fIYYnYCLUe7y1UiwEPL
         1HPFqlQKwycMl+fWUgllMc17t4YP4tBatTmTzNly75QmRLVXHG+shI6tsS1/2JjB03hV
         mCttBb9qsBFxYfJBfWt4guKh937AQ44YGt8peZ1CR7fqFHZAN5cE3N1fTS63ad9uCbFi
         kp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=kod53Z9Bn/oLp+88TnQNrWTDZiAkcCd5b++0bm6KqDA=;
        b=E+NReh7uYiCjCLoGttoyEXwvRNU00aBpZZi1XNpuU5v3TSpv3g2zdJG5wvji70VffX
         V90AsEym6fRRkbLK6Zig62n9rYNZGQuKfutzDcU8lATIg8ejw1xmDXIj1ncQRutMVWj7
         284vzkwuTZMTmj2gkL8MsAnOigBeXJnlZ9d2gV8/+NJXwWAShfiaRCeCKR2Uts8wZaW5
         yuJ1P6HJOyajED1jfaer7xu/FS8E8k7ARAqS2Cdm6ENgb77AZEOke+/DCeNqyIBvZYI+
         tyGm+hnnKGbDLhy9Zgxt689rPhTj0RY3atiqgNFueX7lFf/wAPBwxDyoFE6gI1xRe+Dy
         f4Qw==
X-Gm-Message-State: AOAM533+BMU1KdPRZ+JZ8t+Zsxt3tv6ASzWXAB0zjHYt8LRYzcOBZ8hA
        OowjRyzam/lr4cQFlGMFrJ4UGhdDCjS6t/NP+7s=
X-Google-Smtp-Source: ABdhPJzJieOsn4JuNK/fNek5dpK0KwEKnqVJ5VjcmWHbrJqO30ArGzOEitVj3onNlAiY/AvgfqfGAcAMvdZ4a69M8d0=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:830e:: with SMTP id
 s14mr10156827ybk.213.1605737254956; Wed, 18 Nov 2020 14:07:34 -0800 (PST)
Date:   Wed, 18 Nov 2020 14:07:15 -0800
In-Reply-To: <20201118220731.925424-1-samitolvanen@google.com>
Message-Id: <20201118220731.925424-2-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201118220731.925424-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v7 01/17] tracing: move function tracer options to Kconfig
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Move function tracer options to Kconfig to make it easier to add
new methods for generating __mcount_loc, and to make the options
available also when building kernel modules.

Note that FTRACE_MCOUNT_USE_* options are updated on rebuild and
therefore, work even if the .config was generated in a different
environment.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 Makefile               | 20 ++++++++------------
 kernel/trace/Kconfig   | 16 ++++++++++++++++
 scripts/Makefile.build |  6 ++----
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index e2c3f65c4721..8c8feb4245a6 100644
--- a/Makefile
+++ b/Makefile
@@ -851,12 +851,8 @@ KBUILD_CFLAGS += $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
 
 ifdef CONFIG_FUNCTION_TRACER
-ifdef CONFIG_FTRACE_MCOUNT_RECORD
-  # gcc 5 supports generating the mcount tables directly
-  ifeq ($(call cc-option-yn,-mrecord-mcount),y)
-    CC_FLAGS_FTRACE	+= -mrecord-mcount
-    export CC_USING_RECORD_MCOUNT := 1
-  endif
+ifdef CONFIG_FTRACE_MCOUNT_USE_CC
+  CC_FLAGS_FTRACE	+= -mrecord-mcount
   ifdef CONFIG_HAVE_NOP_MCOUNT
     ifeq ($(call cc-option-yn, -mnop-mcount),y)
       CC_FLAGS_FTRACE	+= -mnop-mcount
@@ -864,6 +860,12 @@ ifdef CONFIG_FTRACE_MCOUNT_RECORD
     endif
   endif
 endif
+ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
+  ifdef CONFIG_HAVE_C_RECORDMCOUNT
+    BUILD_C_RECORDMCOUNT := y
+    export BUILD_C_RECORDMCOUNT
+  endif
+endif
 ifdef CONFIG_HAVE_FENTRY
   ifeq ($(call cc-option-yn, -mfentry),y)
     CC_FLAGS_FTRACE	+= -mfentry
@@ -873,12 +875,6 @@ endif
 export CC_FLAGS_FTRACE
 KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
 KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
-ifdef CONFIG_DYNAMIC_FTRACE
-	ifdef CONFIG_HAVE_C_RECORDMCOUNT
-		BUILD_C_RECORDMCOUNT := y
-		export BUILD_C_RECORDMCOUNT
-	endif
-endif
 endif
 
 # We trigger additional mismatches with less inlining
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a4020c0b4508..927ad004888a 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -595,6 +595,22 @@ config FTRACE_MCOUNT_RECORD
 	depends on DYNAMIC_FTRACE
 	depends on HAVE_FTRACE_MCOUNT_RECORD
 
+config FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
+	bool
+	depends on FTRACE_MCOUNT_RECORD
+
+config FTRACE_MCOUNT_USE_CC
+	def_bool y
+	depends on $(cc-option,-mrecord-mcount)
+	depends on !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
+	depends on FTRACE_MCOUNT_RECORD
+
+config FTRACE_MCOUNT_USE_RECORDMCOUNT
+	def_bool y
+	depends on !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
+	depends on !FTRACE_MCOUNT_USE_CC
+	depends on FTRACE_MCOUNT_RECORD
+
 config TRACING_MAP
 	bool
 	depends on ARCH_HAVE_NMI_SAFE_CMPXCHG
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ae647379b579..2175ddb1ee0c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -178,8 +178,7 @@ cmd_modversions_c =								\
 	fi
 endif
 
-ifdef CONFIG_FTRACE_MCOUNT_RECORD
-ifndef CC_USING_RECORD_MCOUNT
+ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 # compiler will not generate __mcount_loc use recordmcount or recordmcount.pl
 ifdef BUILD_C_RECORDMCOUNT
 ifeq ("$(origin RECORDMCOUNT_WARN)", "command line")
@@ -206,8 +205,7 @@ recordmcount_source := $(srctree)/scripts/recordmcount.pl
 endif # BUILD_C_RECORDMCOUNT
 cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),	\
 	$(sub_cmd_record_mcount))
-endif # CC_USING_RECORD_MCOUNT
-endif # CONFIG_FTRACE_MCOUNT_RECORD
+endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
 ifneq ($(SKIP_STACK_VALIDATION),1)
-- 
2.29.2.299.gdc1121823c-goog

