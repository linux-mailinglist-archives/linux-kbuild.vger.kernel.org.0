Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617EA247980
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 00:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgHQWCW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 18:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729256AbgHQWCS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:18 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E33C061343
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:18 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id s4so11581312pjq.8
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=SCGP1B0GabBPIIHG5VJ2o7cUGzZ8S7iKHRNNa+xeYyE=;
        b=ImA5y6OSZJsSxIPHsXDdYNsmOWF03t/GCF1wydDTkMNPnwFYHmAoquiUE1s1V7h8jH
         UXrSnaNxxzBdcEXBZ2qo9Qw+m9RgBQRony04zbdg/4XMUNjpbSmAUDgMqTmRtowMDeGJ
         kewoEMjj+PZYqbE9CSY+3R4Cg7XUc+y5DEPvMt22tvVMtoJS1y9zcahOkuDtmU+eVBQd
         cUjgV6APd8twafZwkYF+WYlhVyFPKtSEVN6aqA2n6/C5tzcICXlukjmNMzL9NRiRIMmt
         fcouD5X6n88sMsMTcROVsdKKWRTxpSeWeFuALYEGTrJYLJFF1ez8g5m6ZZJUFKsWVr1Y
         Q9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=SCGP1B0GabBPIIHG5VJ2o7cUGzZ8S7iKHRNNa+xeYyE=;
        b=p4z0v0XxFKoCyPlqKINeBWhpvyoXBtv8mq/ZrEDL13PWXcM/hwEXAMKlzMtBoFHaJv
         lqtRj31uTwUZs6GuTKJxuQIgunSLjDJoNSJMAOdCb2c4tJyQ0fLnjfv+07tdgOunK2NQ
         dTKFuQTzBtAFuKBXUZ2ghHiU5O7RUuLCHwe6zoZsgPNAlaXtYf/a31zjLazV6S+eG79o
         pnCy39MBwB0sCDhvg0a5KJC1k5bArGbE6NUkfPEDGRWC9z13pZO4cIj019+si8IavBhX
         MvIEE5P9eoxesuqAI9K5xse4W18atr1PElP1DLkiESCSSWOJO7R4kC5zYZmyRYDmIFmp
         YkVQ==
X-Gm-Message-State: AOAM532TLvJQk0+UQSFJGBbRylnEEsOi3W67s3VXX0dgSXVPaV/jvBBm
        YTFjmY3SHWUD6/VssRq+ZL1wepUog/y9kIerzNM=
X-Google-Smtp-Source: ABdhPJz+qTv6DNAPpLl1NNFe6vUzEWyhgMT8911arSjyrAqqr+1/c8Xk2osiyz6NvqgiYJnN1HAimTN3fhEsKUXGFR8=
X-Received: by 2002:a62:6142:: with SMTP id v63mr13080841pfb.179.1597701737995;
 Mon, 17 Aug 2020 15:02:17 -0700 (PDT)
Date:   Mon, 17 Aug 2020 15:02:08 -0700
Message-Id: <20200817220212.338670-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
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

-ffreestanding typically inhibits "libcall optimizations" where calls to
certain library functions can be replaced by the compiler in certain
cases to calls to other library functions that may be more efficient.
This can be problematic for embedded targets that don't provide full
libc implementations.

-ffreestanding inhibits all such optimizations, which is the safe
choice, but generally we want the optimizations that are performed. The
Linux kernel does implement a fair amount of libc routines. Instead of
-ffreestanding (which makes more sense in smaller images like kexec's
purgatory image), prefer -fno-builtin-* flags to disable the compiler
from emitting calls to functions which may not be defined.

If you see a linkage failure due to a missing symbol that's typically
defined in a libc, and not explicitly called from the source code, then
the compiler may have done such a transform.  You can either implement
such a function (ie. in lib/string.c) or disable the transform outright
via -fno-builtin-* flag (where * is the name of the library routine, ie.
-fno-builtin-bcmp).

Patch 1 unbreaks the build with ToT clang, which has been red all
weekend, by adding -fno-builtin-stpcpy.
Patch 2 is a revert but adds -fno-builtin-bcmp.
Patch 3 does the same for x86 purgatory.
Patch 4 removes -ffreestanding from i386.

The first patch makes sense for Kbuild, the second maybe akpm@, the
third and forth for x86.  Not sure who should pick up the series (they
can be merged out of order, technically) but I really need the first
patch soon. The 3 latter patches are cleanups.

Nick Desaulniers (4):
  Makefile: add -fno-builtin-stpcpy
  Revert "lib/string.c: implement a basic bcmp"
  x86/boot: use -fno-builtin-bcmp
  x86: don't build CONFIG_X86_32 as -ffreestanding

 Makefile               |  7 +++++++
 arch/x86/Makefile      |  3 ---
 arch/x86/boot/Makefile |  1 +
 arch/x86/boot/string.c |  8 --------
 include/linux/string.h |  3 ---
 lib/string.c           | 20 --------------------
 6 files changed, 8 insertions(+), 34 deletions(-)

-- 
2.28.0.220.ged08abb693-goog

