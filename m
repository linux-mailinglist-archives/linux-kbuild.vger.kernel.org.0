Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCF624A6B9
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 21:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgHSTRy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 15:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbgHSTRX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 15:17:23 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BACAC061757
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:23 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id x6so22052041ybp.10
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/urKDqIkN4zGAhl6LxHMUbH10s5ZvVFc504ba3S5u7E=;
        b=RqgI8CJyXmWUn6Vo8lcLGmL7Sryn+W/FkZ33sxWqlgyz8meu39k4+6oomx7QFIBp3x
         Gg+82ihdMho3l7JJ+S2CfjEP3vQubdhyeoQjj85loSSZleZOVl/jOK3cGE8XEH01Ej2N
         AbQ/Vy7C7JnBDZKmbQ+iklaXV4MNxz3nqNMJxtOowSWnBqpDLp9YXD8p4zPXjqRgGid9
         DF9aV54NmI8wKPj4ZWIE4q6Hj/KIDGSRh80b9cn08g+O8nK8QAGEuQ1iYxBDUmPybqOx
         5zO6eUDXW1sIoB9BFjqIqf3ncr2pKUn9kYElgbeTJbWgIVBEyg7Xn7mdJSFdCsmpBLdU
         DioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/urKDqIkN4zGAhl6LxHMUbH10s5ZvVFc504ba3S5u7E=;
        b=XqNrQLIVm2AT5JH6JQNuPPNrONr4Llx+C1jNnFFTGKbM+iFy5VKFx0d01lI66ofT9H
         n7Ux+h09FvBon1U1NEH1nv8BycETeROAmx5/+1LAxnJ9i/9R0I+Qur9bDiNsXFrlRxsG
         SP+lBlCj9yC4bARO2JYdS0mPGTSn0N0mZ4154augo8A5K4I6b42hgLbRqtlIadI4bgDa
         PgA4SJFZSPrcyC9p+1k2/YbpDNJSyEC4ZYacay0xRnCQBck92qpMeKf5hw6skO0QLRlI
         nBqZrbNSYVFQFQ5PvjUZ6dgRdN1I6f1fqL3UcSZwEuc57EYIraPDevIuXyt80dTjDeDS
         eqQw==
X-Gm-Message-State: AOAM533/loz2y+jh3OWv5h4XysH7cfz9AhrHqY1EMlnDSxzyGLIZukQo
        OXFbbrHY9ZZ7jvQ+ePGZEvxV2pJhINEC8lWy66Y=
X-Google-Smtp-Source: ABdhPJxkKEkPVTHl269NKfdD2vrGr8Zp3w5z/UJIqWfoTv/OqXKdyliMdkTMwO8mqpQXuu+Uw3MDyewftRdnreJ7fJE=
X-Received: by 2002:a25:c2c7:: with SMTP id s190mr34810966ybf.161.1597864642671;
 Wed, 19 Aug 2020 12:17:22 -0700 (PDT)
Date:   Wed, 19 Aug 2020 12:16:53 -0700
In-Reply-To: <20200819191654.1130563-1-ndesaulniers@google.com>
Message-Id: <20200819191654.1130563-5-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200819191654.1130563-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2 4/5] x86/boot: use -fno-builtin-bcmp
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

We're reverting
commit 5f074f3e192f ("lib/string.c: implement a basic bcmp")
in favor of -fno-builtin-bcmp. Remove the additional definition here,
too.

arch/x86/purgatory/Makefile uses -ffreestanding, so there's no risk of
this libcall optimization occurring for arch/x86/boot/purgatory.ro.

arch/x86/boot/Makefile resets KBUILD_CFLAGS, so make sure to reset this
flag that was set for the top level Makefile.

Fixes: 4ce97317f41d ("x86/purgatory: Do not use __builtin_memcpy and __builtin_memset")
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/x86/boot/Makefile | 1 +
 arch/x86/boot/string.c | 8 --------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index fe605205b4ce..ef7f15bfceab 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -70,6 +70,7 @@ KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
 KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
+KBUILD_CFLAGS	+= -fno-builtin-bcmp
 GCOV_PROFILE := n
 UBSAN_SANITIZE := n
 
diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 8a3fff9128bb..23d91aa7691e 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -37,14 +37,6 @@ int memcmp(const void *s1, const void *s2, size_t len)
 	return diff;
 }
 
-/*
- * Clang may lower `memcmp == 0` to `bcmp == 0`.
- */
-int bcmp(const void *s1, const void *s2, size_t len)
-{
-	return memcmp(s1, s2, len);
-}
-
 int strcmp(const char *str1, const char *str2)
 {
 	const unsigned char *s1 = (const unsigned char *)str1;
-- 
2.28.0.297.g1956fa8f8d-goog

