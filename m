Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752502479B2
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 00:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgHQWC6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 18:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729301AbgHQWCc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:32 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3016C061343
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:31 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x6so15140094ybp.10
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9SBJtwgo4QVHI3Sdc2C7hxhI+hybE6P8MqvKEbw6VA0=;
        b=VGxOIYRqvHa4OmoZURsCdy57u/bUJl6KzXrNgmOYkyrfrvR66YapPh4X97oYZQWWRg
         PPSFP8ab88uJEB4dM5x690TZN4TeToNbmWek+tEXy/8FIxeHJogFlT3E+cY+vwQJJh+V
         UqzXvJ6LICQvDFw0d2Wfm5VbtDO+s2FYD4Z5rXsmF8BSsaOhwv8nwSBJYe5TuGUqZ28r
         eUqYly78IEZl2y2yTtKRIxrBG9WbrXpbJCxrKKp9G5eVg4dNrjD4kHGgxygmNlFo55ul
         32YKIftLGlp4bO7YlOx051frMawUBgZZgnhziC63JGQbuH6MBwfbeUvcpyUofVzXzab8
         HUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9SBJtwgo4QVHI3Sdc2C7hxhI+hybE6P8MqvKEbw6VA0=;
        b=LfyRSlYwNRCb5J9JjYHLXwj4adx/L29HIf3mg2BN/DIW/8ixREEPBb+6C2mPM1qbGA
         fZjmvTJOBvSB0/+tDutb0wmQG3wT9kcYWdJKtfxHCxp00B/t0TAJjblXLw/GeEVT6vuC
         r4pz6g3y1IaTiornqVa1Z6qXZlDIEvrGeFF+AEKH4sBcpxy6bIFCRrFjGfO278mldFDq
         rKFh0jXLBMZALYycon8G43WkGjF931Nkhe5ieW6p6egnzJNQqbgT2LUzy6J6ZGv6yKxz
         KWfUZ/qigqPvWeEDEx5zlbsqgdTTQIr1/+442pTjiR6p+q2U9SKLs3D/Xcd0qSbD+VHV
         ix1Q==
X-Gm-Message-State: AOAM5312njKcY72y33439PUOWoO5ShaQZws3EiwxJB4dUdYLEXSF2l4C
        73mFUgaQsc8MT1y3IMvZVcj3MQ81/2jr6dwwfVs=
X-Google-Smtp-Source: ABdhPJyJAr0txHHVKZqlGNMtvo97G00mjqcvpxwQOE5FwBgb1PBKiVkhfn3k+w3BBZIVVlLui27r6uHth2/gthlkOD8=
X-Received: by 2002:a25:3f83:: with SMTP id m125mr22563936yba.324.1597701750925;
 Mon, 17 Aug 2020 15:02:30 -0700 (PDT)
Date:   Mon, 17 Aug 2020 15:02:11 -0700
In-Reply-To: <20200817220212.338670-1-ndesaulniers@google.com>
Message-Id: <20200817220212.338670-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH 3/4] x86/boot: use -fno-builtin-bcmp
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
2.28.0.220.ged08abb693-goog

