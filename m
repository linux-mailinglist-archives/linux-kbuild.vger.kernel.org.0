Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1662479DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 00:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbgHQWEi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 18:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729284AbgHQWC3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:29 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DAAC061347
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:28 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id n32so10859863pgb.22
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LSuJ265AIHX3+q/k1a/Z37Re9kn2OGu2g13JwIWu2AE=;
        b=SbD3KyARYSzP8T36XfR3PSHqanZP7aAf5JDZqJYGiBhLP4rKgTLGRPXAppDrg1sTl5
         A9PvTf6cNxt3GdMtU0KSlh7GmwXcTGaesG0K0g3xTu8P8G7joqPf8pqpMrmBKfoEbjd6
         PJZiF857IQv87kAQWEqVMLXO4K6nHk5cg7ima1rEYeAq7T29BawPJFtEEEoh/Txl8pWT
         TrKCydEAn6SB0ypdUtIwcrhW5JGeTybo2eNnMFkTEVjjLmLpnN6izcqwyzozEc5lZzCj
         z4Y3sjmLT2yMtfeZS2VtmD78guFvtoZ+47uKaDzT/rFKbG0PUt3gc85QKli8876L8iga
         1+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LSuJ265AIHX3+q/k1a/Z37Re9kn2OGu2g13JwIWu2AE=;
        b=JmWECM7BHDUgyTFVRrmRj9AHwB1NI0VFr+Nea8XGclw/1wv5xBfS6S7yDbKe7xgmpX
         HAe52POZq9q5UwSqNIXYlzMDdPCQtggk+Gyi287sq9XRmJvTDaKvqQDcHD/Bsq6VAV5K
         4yrM1EMtVNhC6kYrJOR50uSOw9UG6Ut3Kd1stDFHy0NwBWOmIt55WW5EPVRZGtxmRixX
         +5PbxBzi4KJsVbhjxHy2ClczbiVgol+TYDIYurGjxc48BNc1CLJMlip0ZcYCaqwEgL2e
         pESuA+mtanUSusmmQOmeZtluEN3YgV2dW61t5yZk65eAQeomquA1b7QH2UD3sRRhMqNi
         zetw==
X-Gm-Message-State: AOAM5316aJYvdtnBab6nLM/bMIGyDJ89YM/vlF50BVX7AQ4/TpBdXiDK
        v9VBSkQfnDvebZh6iglEU9UlsbTHCMn5/CfXM8Q=
X-Google-Smtp-Source: ABdhPJz0bjSGZm+ZdrPGtRtCXBpejLmPe6KZV95C2FmKOvxUsvXkFXAWlKgIMYvfMsU+gy0mVusHMS/N02PzQC8v5VA=
X-Received: by 2002:a62:86ca:: with SMTP id x193mr12601031pfd.152.1597701747572;
 Mon, 17 Aug 2020 15:02:27 -0700 (PDT)
Date:   Mon, 17 Aug 2020 15:02:10 -0700
In-Reply-To: <20200817220212.338670-1-ndesaulniers@google.com>
Message-Id: <20200817220212.338670-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH 2/4] Revert "lib/string.c: implement a basic bcmp"
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "=?UTF-8?q?D=C3=A1vid=20Bolvansk=C3=BD?=" <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 5f074f3e192f10c9fade898b9b3b8812e3d83342.

Use `-fno-builtin-bcmp` instead.

The issue with using `-fno-builtin-*` flags was that they were not
retained during an LTO link with LLVM.  This was fixed in clang-11 by
https://reviews.llvm.org/D71193
(0508c994f0b14144041f2cfd3ba9f9a80f03de08), which is also the minimum
supported version of clang for LTO.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile               |  1 +
 include/linux/string.h |  3 ---
 lib/string.c           | 20 --------------------
 3 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/Makefile b/Makefile
index 211a1b6f6478..722ff5864275 100644
--- a/Makefile
+++ b/Makefile
@@ -964,6 +964,7 @@ endif
 # to provide implementations of these routines, then prevent the compiler from
 # emitting calls to what will be undefined symbols.
 KBUILD_CFLAGS	+= -fno-builtin-stpcpy
+KBUILD_CFLAGS	+= -fno-builtin-bcmp
 
 # include additional Makefiles when needed
 include-y			:= scripts/Makefile.extrawarn
diff --git a/include/linux/string.h b/include/linux/string.h
index b1f3894a0a3e..f3bdb74bc230 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -155,9 +155,6 @@ extern void * memscan(void *,int,__kernel_size_t);
 #ifndef __HAVE_ARCH_MEMCMP
 extern int memcmp(const void *,const void *,__kernel_size_t);
 #endif
-#ifndef __HAVE_ARCH_BCMP
-extern int bcmp(const void *,const void *,__kernel_size_t);
-#endif
 #ifndef __HAVE_ARCH_MEMCHR
 extern void * memchr(const void *,int,__kernel_size_t);
 #endif
diff --git a/lib/string.c b/lib/string.c
index 6012c385fb31..69328b8353e1 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -922,26 +922,6 @@ __visible int memcmp(const void *cs, const void *ct, size_t count)
 EXPORT_SYMBOL(memcmp);
 #endif
 
-#ifndef __HAVE_ARCH_BCMP
-/**
- * bcmp - returns 0 if and only if the buffers have identical contents.
- * @a: pointer to first buffer.
- * @b: pointer to second buffer.
- * @len: size of buffers.
- *
- * The sign or magnitude of a non-zero return value has no particular
- * meaning, and architectures may implement their own more efficient bcmp(). So
- * while this particular implementation is a simple (tail) call to memcmp, do
- * not rely on anything but whether the return value is zero or non-zero.
- */
-#undef bcmp
-int bcmp(const void *a, const void *b, size_t len)
-{
-	return memcmp(a, b, len);
-}
-EXPORT_SYMBOL(bcmp);
-#endif
-
 #ifndef __HAVE_ARCH_MEMSCAN
 /**
  * memscan - Find a character in an area of memory.
-- 
2.28.0.220.ged08abb693-goog

