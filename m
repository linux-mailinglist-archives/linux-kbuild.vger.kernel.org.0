Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495B024A6B4
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 21:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgHSTRh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 15:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbgHSTR2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 15:17:28 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528C5C061342
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:27 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id 1so16106834qkm.19
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OuLK0vtF0dRJLQuNywRonpISXfPNRGHrBGFIst0MHFI=;
        b=it6ogAFiEgasFY/BOPvy6O/Foy17MRI7R1IECbMRIf/jTsP/cJ8JIoaqKYcyVT/ZBV
         b1hQzk31FQy+8iEkpytd3nthZ4jbovIrYjVMxYqnS3+HY0NwULL8R+8tK1cHvD6Ax5Xz
         OK41QXEI4IIlv6ox/0AdHB/75aC3klHvhCvZlrQaDevBAsaq4BTSbiHCV5joVCPgZKTU
         dggAMLqVkzlK0H44SClcB43UOTcZtdO19cjVuEZNo5PBpiLqCZJD4Wf6BuPdmT38j4FE
         Hu1iP1w8Hm2m2x/vOll7mtQWtz/bA6DW3HFwMoIc3JSCheg8w4pfdCxSVLhSvLe/WKxs
         RsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OuLK0vtF0dRJLQuNywRonpISXfPNRGHrBGFIst0MHFI=;
        b=Eq+Ji4h4GkuDGU7qfXU8w+Tp9v4JNMW57qqOQcbun+qLSHFFaLMD8exe09G9ggphAh
         xzvrY2lEn8gTXRq1DCJzxTq4JxtwuNxrqLC0vF8cwxLK5El+IxRy4HfwcfwE5PmswsrA
         pgPW3b46AbxNvn7dhF++P289oa5nFfpkjR/97EpsVgD579t1mdTnJO2gX4iW0ULieqgu
         NaSPD+9k0b0QwGH+FvghngkXRiNhj2lzC8smJLTZvLvRy52q4ublJIUNVHwDyW9rYT3Z
         Lcf/MQXYPsa0ob2GIRbVC5/AtUNMpnLkhz+WR/8mUF9e/AxuOn4yjKaPvbLqx4nGzZY9
         xr+g==
X-Gm-Message-State: AOAM533G6eNNlqlgILK2EZCwnw/fygz6ONAE9Gm1YIVczGvUCmyheK+n
        RnjJ4pMfhGQt4JrFb4FEDqrfk7h58McFCI9uIW8=
X-Google-Smtp-Source: ABdhPJybzC2cRIjyVbTGIcAbbyv/3nL+YTTCv6sTjuWenHOvyLQE3ASARbEAL9G5mwIYU92auG+3ArLd6RP5ciEy9Po=
X-Received: by 2002:a0c:f84b:: with SMTP id g11mr3652053qvo.184.1597864646404;
 Wed, 19 Aug 2020 12:17:26 -0700 (PDT)
Date:   Wed, 19 Aug 2020 12:16:54 -0700
In-Reply-To: <20200819191654.1130563-1-ndesaulniers@google.com>
Message-Id: <20200819191654.1130563-6-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200819191654.1130563-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2 5/5] x86: don't build CONFIG_X86_32 as -ffreestanding
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

-ffreestanding inhibits all optimizations, which
is the safe choice, but generally we want the optimizations that are
performed. The Linux kernel does implement a fair amount of libc
routines. Instead of -ffreestanding (which makes more sense in smaller
images like kexec's purgatory image), prefer -fno-builtin-* flags to
disable the compiler from emitting calls to functions which may not be
defined.

If you see a linkage failure due to a missing symbol that's typically
defined in a libc, and not explicitly called from the source code, then
the compiler may have done such a transform.  You can either implement
such a function (ie. in lib/string.c) or disable the transform outright
via -fno-builtin-* flag (where * is the name of the library routine, ie.
-fno-builtin-bcmp).

i386_defconfig build+boot tested with GCC and Clang. Removes a pretty
old TODO from the codebase.

Fixes: 6edfba1b33c7 ("x86_64: Don't define string functions to builtin")
Suggested-by: Arvind Sankar <nivedita@alum.mit.edu>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Might be nice to have
https://lore.kernel.org/lkml/CAKwvOdn-mv1D1GEk3pWnPYsyzQRRk5qZFhSi0CYn6tRDo1O_iw@mail.gmail.com/T/#u
first.

 arch/x86/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 4346ffb2e39f..2383a96cf4fd 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -80,9 +80,6 @@ ifeq ($(CONFIG_X86_32),y)
         # CPU-specific tuning. Anything which can be shared with UML should go here.
         include arch/x86/Makefile_32.cpu
         KBUILD_CFLAGS += $(cflags-y)
-
-        # temporary until string.h is fixed
-        KBUILD_CFLAGS += -ffreestanding
 else
         BITS := 64
         UTS_MACHINE := x86_64
-- 
2.28.0.297.g1956fa8f8d-goog

