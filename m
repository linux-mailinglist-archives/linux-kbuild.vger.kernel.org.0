Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533E3247997
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 00:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbgHQWCl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 18:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729306AbgHQWCf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:35 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E225C061344
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:34 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id y7so11855449qvj.11
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=kIk9FUx7DIlhGhFIt2N6cpuJCia592mQ/iQfMoiZ3iE=;
        b=gQoHfUpbLM0sDU/kmKlEItWnjMkZ07La/np9HovfFux6Z2VP9+/zZrQWA4ecIjJgvq
         dnD+gK0MB87V5MirFehxDF/9Y0qyw5jGSnVPfhphz46yfpH/a+RlENfRfPyt87lKvXNt
         3M8YGTf9geBnYZq62BRsxzKcJtfiB7A2JPR7UVcm63uyarEjTgfrxkjaTulCAKeb73LZ
         exzQUda0T8aom4mtZLMJVL/LVK8eWeJNZoH1geb6HQxDryALTxFmCJwMm+oFzaxPCUpi
         A0f2OynWzgOjSsioBKP8o4nkCzdHdYSkPkC8fIcVqpZ5VTuRGrg4J4X3JxxkwMH7CMgJ
         uOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=kIk9FUx7DIlhGhFIt2N6cpuJCia592mQ/iQfMoiZ3iE=;
        b=NQJldEmnSQh0cm0LORObY3szeVblm80HlFlJl2nhW+STjMbD0TDiJcuGpZxliT7XLl
         mz+Fo5IQrOdyd/QYTmCVvi6rkhCrRzrMFifxGi7qswv9DWRhwcMPUCpbi3o/5Cg+qMgu
         Z2GR1OefbrNG42OzZVGQG7ivZmxYPaHtUqSGGXKyWCKdPSqUz+0RkOFgKV62ocj1mMkr
         SdJYynu5u3lfpm3EnNGK0T3vtJiyTViNHNwkB9Kli+kmYBdg/MgtmYXTLADMImiQvEMD
         XVgH/qOI3z+FT9CiiOWiueG7oRIhortC9LYV5Qerhcb/tgozuao4IiBVP8opKdEaUv2c
         bZJw==
X-Gm-Message-State: AOAM533CK+4/unQyrX/PZdiQHT9bJ5X42xWO3dFgt2QpDmOGIFWe+SBZ
        GIzhwwKcdYMlHZ9dX3nlgRQTxCE1AHURjXp12Nw=
X-Google-Smtp-Source: ABdhPJze4jPqkvcvZSWv8Q0KrJb4yDurztXHgzvX3/5K52RQR+v2CCftP6RNB8hQqPr5ZzSxOih+qN1vIkvEECe6SWQ=
X-Received: by 2002:ad4:470f:: with SMTP id k15mr16321629qvz.216.1597701753768;
 Mon, 17 Aug 2020 15:02:33 -0700 (PDT)
Date:   Mon, 17 Aug 2020 15:02:12 -0700
In-Reply-To: <20200817220212.338670-1-ndesaulniers@google.com>
Message-Id: <20200817220212.338670-5-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH 4/4] x86: don't build CONFIG_X86_32 as -ffreestanding
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

i386_defconfig build+boot tested with GCC and Clang. Removes a pretty
old TODO from the codebase.

Fixes: 6edfba1b33c7 ("x86_64: Don't define string functions to builtin")
Suggested-by: Arvind Sankar <nivedita@alum.mit.edu>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
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
2.28.0.220.ged08abb693-goog

