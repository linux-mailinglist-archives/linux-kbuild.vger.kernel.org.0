Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD29214F6E6
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 07:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgBAGZX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 01:25:23 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37003 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgBAGZX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 01:25:23 -0500
Received: by mail-pg1-f195.google.com with SMTP id q127so4774004pga.4;
        Fri, 31 Jan 2020 22:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EBuzdcEX5JTT1Pk5WdoUrmH8eH/+zUwYVPCUxPutRHo=;
        b=pPS4EPH2WPWqUUcvjDcMViVJagim4iBnp5ydqeJAMzTXRG9EyuKey21QyHq5AJnEcx
         ezn7OxhMiusou6IZE7wFs7GxYuvHDQtok/I0QJrevDP2aEtRZAbEQrr7g6ynJpaXKHrx
         Fs7/hKY3f5Rq3LTQ8kY7IvYAupeTlwgWDRqpORKkKghPzD1yUZcPKUchNmxPl+P+NLSB
         ocvVGFVmtlR0T60YyAdVPh/QDwF8RiY+sIjC+ijK50FLQivj1YbRM0Umrl3XZU+ZuJzU
         eBl7arvkQAq4NJ2QQWWyDAn31VQ+pkiLosKD3wc9z/sS68foEAp9wNMN/jJXjfRDZ9pX
         smDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EBuzdcEX5JTT1Pk5WdoUrmH8eH/+zUwYVPCUxPutRHo=;
        b=F9yjYK/9wtH7Sx5b/ZBQAof6H9oL3KMqBAFBusJCqRflulbs4sLjQ4P4dXr+OTC2nV
         VOYK0WSaUqXyOQLET3vdPQW+e4R8LNcAt6sDtAwtVFNLwZN/Kle8wbnJLOB+lpwMK1rR
         0rnwtVlehU7tWtdsaPv6KGqMqPPqmj0+rlCfMPTqInOIe1Jh7uQUk2jIK4FZ1bF0dTmN
         lkYlUFhiaDkOxuujuAwVwcT5V4dP499HCh9omRbA9yJeb0Csn0oYYWwfZzXBtHoMo3TO
         pkFi2xWlVGWI3RVZxDjy9n1Bt4jku3n1wZb4MlinvSiUgtKtveky2RBOG1i8hIzJ6iK/
         l+xA==
X-Gm-Message-State: APjAAAUZLxjQ2f4+YOjsT2WNFdtePtUGWYYW0uQZ+6D9orCXrOfBTRkT
        dEfS/T2onOgXtAz+j76u+d8=
X-Google-Smtp-Source: APXvYqzxIs8PpCGxKZZpuV6wsz6WrhnlruFneh+hB4Qm1o0YNQ/rHjtvjHGgbxIvx/FYeWLDIPBJpQ==
X-Received: by 2002:a63:3c1b:: with SMTP id j27mr12888932pga.152.1580538322299;
        Fri, 31 Jan 2020 22:25:22 -0800 (PST)
Received: from localhost.localdomain ([149.248.18.167])
        by smtp.gmail.com with ESMTPSA id v4sm13191971pgo.63.2020.01.31.22.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 22:25:21 -0800 (PST)
From:   Changbin Du <changbin.du@gmail.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc:     Alexander Potapenko <glider@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 2/2] x86: Disable both KASAN and UBSAN for some booting code
Date:   Sat,  1 Feb 2020 14:24:59 +0800
Message-Id: <20200201062459.7150-3-changbin.du@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200201062459.7150-1-changbin.du@gmail.com>
References: <20200201062459.7150-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now we have disabled KASAN for some special files properly which might
prevent kernel to boot. We also need to disable UBSAN for some of these
files:
  o For code which could operate in one-one mapping mode. In this case,
    kernel would crash at accessing data parameter when invoking UBSAN
    handlers.
  o Since UBSAN handlers are instrumented by KASAN, so invoking UBSAN
    handlers before KASAN is initiated also is not allowed.

It is easy to prove such behavior by adding a line of code that triggers
UBSAN report before kasan_early_init().

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/x86/boot/Makefile            |  2 +-
 arch/x86/boot/compressed/Makefile |  2 +-
 arch/x86/entry/vdso/Makefile      |  3 +--
 arch/x86/kernel/Makefile          | 10 +++++-----
 arch/x86/lib/Makefile             |  2 +-
 arch/x86/mm/Makefile              |  4 ++--
 arch/x86/realmode/Makefile        |  2 +-
 arch/x86/realmode/rm/Makefile     |  2 +-
 8 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 748b6d28a91d..cd1f1ddbd319 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -9,7 +9,7 @@
 # Changed by many, many contributors over the years.
 #
 
-KASAN_SANITIZE			:= n
+SANITIZE			:= n
 OBJECT_FILES_NON_STANDARD	:= y
 
 # Kernel does not boot with kcov instrumentation here.
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 56aa5fa0a66b..82304ccc1e12 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -17,7 +17,7 @@
 #	(see scripts/Makefile.lib size_append)
 #	compressed vmlinux.bin.all + u32 size of vmlinux.bin.all
 
-KASAN_SANITIZE			:= n
+SANITIZE			:= n
 OBJECT_FILES_NON_STANDARD	:= y
 
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 2b75e80f6b41..53728b92374b 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -10,8 +10,7 @@ ARCH_REL_TYPE_ABS += R_386_GLOB_DAT|R_386_JMP_SLOT|R_386_RELATIVE
 include $(srctree)/lib/vdso/Makefile
 
 KBUILD_CFLAGS += $(DISABLE_LTO)
-KASAN_SANITIZE			:= n
-UBSAN_SANITIZE			:= n
+SANITIZE			:= n
 OBJECT_FILES_NON_STANDARD	:= y
 
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 6175e370ee4a..c038ef0fc77c 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -22,11 +22,11 @@ CFLAGS_REMOVE_early_printk.o = -pg
 CFLAGS_REMOVE_head64.o = -pg
 endif
 
-KASAN_SANITIZE_head$(BITS).o				:= n
-KASAN_SANITIZE_dumpstack.o				:= n
-KASAN_SANITIZE_dumpstack_$(BITS).o			:= n
-KASAN_SANITIZE_stacktrace.o				:= n
-KASAN_SANITIZE_paravirt.o				:= n
+SANITIZE_head$(BITS).o					:= n
+SANITIZE_dumpstack.o					:= n
+SANITIZE_dumpstack_$(BITS).o				:= n
+SANITIZE_stacktrace.o					:= n
+SANITIZE_paravirt.o					:= n
 
 OBJECT_FILES_NON_STANDARD_relocate_kernel_$(BITS).o	:= y
 OBJECT_FILES_NON_STANDARD_test_nx.o			:= y
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 5246db42de45..f0da5b35e745 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -9,7 +9,7 @@ KCOV_INSTRUMENT_delay.o	:= n
 # Early boot use of cmdline; don't instrument it
 ifdef CONFIG_AMD_MEM_ENCRYPT
 KCOV_INSTRUMENT_cmdline.o := n
-KASAN_SANITIZE_cmdline.o  := n
+SANITIZE_cmdline.o	  := n
 
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_cmdline.o = -pg
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 98aecb14fbcc..58d58d9208e9 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -4,8 +4,8 @@ KCOV_INSTRUMENT_tlb.o			:= n
 KCOV_INSTRUMENT_mem_encrypt.o		:= n
 KCOV_INSTRUMENT_mem_encrypt_identity.o	:= n
 
-KASAN_SANITIZE_mem_encrypt.o		:= n
-KASAN_SANITIZE_mem_encrypt_identity.o	:= n
+SANITIZE_mem_encrypt.o			:= n
+SANITIZE_mem_encrypt_identity.o		:= n
 
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_mem_encrypt.o		= -pg
diff --git a/arch/x86/realmode/Makefile b/arch/x86/realmode/Makefile
index 682c895753d9..db86f4283808 100644
--- a/arch/x86/realmode/Makefile
+++ b/arch/x86/realmode/Makefile
@@ -6,7 +6,7 @@
 # for more details.
 #
 #
-KASAN_SANITIZE			:= n
+SANITIZE			:= n
 OBJECT_FILES_NON_STANDARD	:= y
 
 subdir- := rm
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index f60501a384f9..61017575dab1 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -6,7 +6,7 @@
 # for more details.
 #
 #
-KASAN_SANITIZE			:= n
+SANITIZE			:= n
 OBJECT_FILES_NON_STANDARD	:= y
 
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
-- 
2.24.0

