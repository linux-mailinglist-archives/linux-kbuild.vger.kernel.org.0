Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251C524A6AE
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 21:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgHSTRI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 15:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgHSTRF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 15:17:05 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E065C061757
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:05 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e1so12122253ybk.14
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=efiHHkgEE+CqxH/d5/JVGKFvb03OVNHvP+6tS83wQTA=;
        b=OPGqsRDr301KcIzCldz6WJJy9VBaYiXVyvRIguhEG0mHItwSbwmZ3OYYYnr3lSQw8z
         saZGrGV98qN5vUKsUZ6K+jx72/kiM7nPUPFzUiNs2zk/+IEd9Aqcepwu7b242kUUu2En
         T3bZL+t8wWTa5W9dTY+OfCYRh603Ox4p2mtxHTr6ZGaHVCf7P1ztBgCjy6rtaQxlT8dD
         DiE1NCywYnYaxxC91+VVqOXFdmlUzkXUGU0a/FSjXkvJbT4sjkwP0tU9mCM2ss++dNMg
         wVjnZOGXx0WpVNHVwWyA8RtQP+2QopXWlNUa5/SeQi9Z9c5DR2U4ThJd/2cfAtYdHAUa
         rF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=efiHHkgEE+CqxH/d5/JVGKFvb03OVNHvP+6tS83wQTA=;
        b=LIPQ1kpO+NsZjnhf4vRydaSmL6L8qHq0dnB3bnW2hSUUC/wW+YzJbMBAiOXj9hN1eX
         ZyUMdPISaSKmGPYf3kOrxDkZFV1olhNmGAW4i+VugpchhDlOUvxWMCSp/6aTi0Xr74+0
         pxgx+NgNqpDl1dfQWqCGmgzA3OCapJN9kKXIMPb83O0NE/H1i/4U+TvSx0YsRtuxHTsr
         fPBjrYhm3Tn/TkVjakMo9UxjT3l0+QdzL4qprTavYjIZ0ocyd07jmNFTEuETgfeW/pVf
         gm3QqzyEzTJqPKiNMUxMbThGKXvU3B0m68BZs00JRDQpc3t9qMZ72CPnj/iIeyN5ISJA
         tm7Q==
X-Gm-Message-State: AOAM531sTrwitreG0CHw71MhkLdY/RTLUHPXVQKobSzGCKXd0rcxk07j
        AjrSHlEoaCAyxw1ivy7zjjAk2+nu4Ds1ZjIXmGw=
X-Google-Smtp-Source: ABdhPJy/hRQI6MDpI3HydaZnOmr3CT858pQRkKElz+rZHlgLweGs650io4t9lHlAbTzpTPNopzfL6lZbGKAASJ4cZz8=
X-Received: by 2002:a25:25cc:: with SMTP id l195mr36922173ybl.383.1597864622679;
 Wed, 19 Aug 2020 12:17:02 -0700 (PDT)
Date:   Wed, 19 Aug 2020 12:16:49 -0700
Message-Id: <20200819191654.1130563-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2 0/5] -ffreestanding/-fno-builtin-* patches
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

A recent "libcall optimization" addition to LLVM will emit libcalls to
stpcpy, which the kernel doesn't provide an implementation, breaking
almost all kernel builds with ToT Clang. Disable it for clang.

We discussed providing an implementation, but the interface is generally
unsafe as it provides no bounds checking.

-fno-builtin-foo doesn't prevent GCC from emitting calls to foo, and GCC
doesn't currently do the same libcall optimizations. If it ever does,
then we can resurrect these implementations, but right now, YAGNI. So we
only add these flags to CLANG_FLAGS to solve a Clang specific issue.

The first patch is critical, I'm hoping Masahiro will pick it for the
Kbuild tree and help us to get the fix in 5.9.

The rest are cleanups; sending them for feedback/review/testing.  Once
the first hits mainline, I plan to resend the rest to the x86
maintainers for inclusion in tip.

Nick Desaulniers (5):
  Makefile: add -fno-builtin-stpcpy
  Makefile: add -fno-builtin-bcmp
  Revert "lib/string.c: implement a basic bcmp"
  x86/boot: use -fno-builtin-bcmp
  x86: don't build CONFIG_X86_32 as -ffreestanding

 Makefile               |  2 ++
 arch/x86/Makefile      |  3 ---
 arch/x86/boot/Makefile |  1 +
 arch/x86/boot/string.c |  8 --------
 include/linux/string.h |  3 ---
 lib/string.c           | 20 --------------------
 6 files changed, 3 insertions(+), 34 deletions(-)

-- 
2.28.0.297.g1956fa8f8d-goog

