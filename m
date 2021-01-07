Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029EE2EC753
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 01:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbhAGA2V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Jan 2021 19:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbhAGA2U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jan 2021 19:28:20 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7AAC061370
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jan 2021 16:27:40 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id t6so2449523plq.1
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jan 2021 16:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d1HllX+KtQtz6uyvQIwE/awff9RMW4+mqkr5aW+j+Tw=;
        b=p/vwm3Duik4bQdTDjz2xqCA+BDXh7KK0s4g7fauuXwfGXdylB08Y60QI54BETKY0yb
         zqoHglDuFnhIMplW1r8cSYFrH06rSRRui+9COIrLsM/X6r4tZxrmUMz+64InAew90dIr
         MRDzwCoFEr8uM3oPIEsghaV2scpdgyusYzfG8bO+5iPx7Tfx5L1Mbq0K6WJnMkm2e02i
         RjeAfQSzEnFWMR4OtHDXcwZcQjOGjIx2+1mSIqmY0S51gPSZMDE1MO3NxjceahMkS9RI
         2vsRMYh7rNlIc9Tj/uadgWQmoQojNGWviI/WSOhonBRqmtjfoxAwQDCFtK2QGPY/tJ1D
         HhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d1HllX+KtQtz6uyvQIwE/awff9RMW4+mqkr5aW+j+Tw=;
        b=TcslobOQ1+Z8Ixy+kffehDNxttdr581CEE5Zx8Iit/ETsPxKKA8nu0hPDdQ5JWZAop
         1xddPDt73jc49VD5HNo12fPowAbvWSfXL4slejfDpxPOgWPsBztxRoJJwBYh+cvCzySK
         PDIXGlJ9KRt9umDJ4gGGRgGWEy2zozckOyBgjfdZAtBMGdj39RMRGiiKVSGHqpW4OxgG
         u4YvoK4M6eywsMae9poS2dbq5IWwP+2C5jHz2cCQ7W59aahEL9I2Eyql+QGGsPO66MYF
         vx5bpMr4tuyjtw+MtKPyct06Ki8CfJnDAG4wDYF3ildgqHW0vhr/V5ctBjMo87piojHZ
         rBeg==
X-Gm-Message-State: AOAM533MK3ryda6JQ82YtqCGj3e1fbowc96JY5HFp3U7MHrXotr0Vv55
        WjeM6mVIXRfHa9o8vqaYxzxJzw==
X-Google-Smtp-Source: ABdhPJyYd1hpcq1ueeESiQ2frIkYJ43FoqoMQNRDlDef/HiQfTVGN6SsaSPDhQLmjUVsHCewWlTAlA==
X-Received: by 2002:a17:902:7d94:b029:da:f673:18b9 with SMTP id a20-20020a1709027d94b02900daf67318b9mr6692465plm.37.1609979259406;
        Wed, 06 Jan 2021 16:27:39 -0800 (PST)
Received: from google.com ([2620:15c:2ce:0:a6ae:11ff:fe11:4abb])
        by smtp.gmail.com with ESMTPSA id z28sm3748257pfr.140.2021.01.06.16.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 16:27:38 -0800 (PST)
Date:   Wed, 6 Jan 2021 16:27:34 -0800
From:   Fangrui Song <maskray@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
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
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Subject: Re: [PATCH 4/4] x86: don't build CONFIG_X86_32 as -ffreestanding
Message-ID: <20210107002734.p62fsyhuo75psta4@google.com>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <20200817220212.338670-5-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200817220212.338670-5-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-08-17, Nick Desaulniers wrote:
>-ffreestanding typically inhibits "libcall optimizations" where calls to
>certain library functions can be replaced by the compiler in certain
>cases to calls to other library functions that may be more efficient.
>This can be problematic for embedded targets that don't provide full
>libc implementations.
>
>-ffreestanding inhibits all such optimizations, which is the safe
>choice, but generally we want the optimizations that are performed. The
>Linux kernel does implement a fair amount of libc routines. Instead of
>-ffreestanding (which makes more sense in smaller images like kexec's
>purgatory image), prefer -fno-builtin-* flags to disable the compiler
>from emitting calls to functions which may not be defined.
>
>If you see a linkage failure due to a missing symbol that's typically
>defined in a libc, and not explicitly called from the source code, then
>the compiler may have done such a transform.  You can either implement
>such a function (ie. in lib/string.c) or disable the transform outright
>via -fno-builtin-* flag (where * is the name of the library routine, ie.
>-fno-builtin-bcmp).
>
>i386_defconfig build+boot tested with GCC and Clang. Removes a pretty
>old TODO from the codebase.
>
>Fixes: 6edfba1b33c7 ("x86_64: Don't define string functions to builtin")
>Suggested-by: Arvind Sankar <nivedita@alum.mit.edu>
>Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>Reviewed-by: Kees Cook <keescook@chromium.org>
>---
> arch/x86/Makefile | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/arch/x86/Makefile b/arch/x86/Makefile
>index 4346ffb2e39f..2383a96cf4fd 100644
>--- a/arch/x86/Makefile
>+++ b/arch/x86/Makefile
>@@ -80,9 +80,6 @@ ifeq ($(CONFIG_X86_32),y)
>         # CPU-specific tuning. Anything which can be shared with UML should go here.
>         include arch/x86/Makefile_32.cpu
>         KBUILD_CFLAGS += $(cflags-y)
>-
>-        # temporary until string.h is fixed
>-        KBUILD_CFLAGS += -ffreestanding
> else
>         BITS := 64
>         UTS_MACHINE := x86_64
>-- 
>2.28.0.220.ged08abb693-goog

Reviewed-by: Fangrui Song <maskray@google.com>

But dropping -ffreestanding causes compiler produced declarations which
require
https://lore.kernel.org/lkml/20210107001739.1321725-1-maskray@google.com/
"x86: Treat R_386_PLT32 as R_386_PC32" as a prerequisite
to build with trunk Clang https://github.com/ClangBuiltLinux/linux/issues/1210

Since there have been more than 4 months, it seems that something else
regressed the non -ffreestanding build. Maybe another -fno-builtin-* is
needed somewhere.
