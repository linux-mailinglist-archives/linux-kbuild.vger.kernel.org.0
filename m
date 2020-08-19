Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728EC24A6BB
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 21:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgHSTR5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 15:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgHSTRQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 15:17:16 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16E6C061757
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:15 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id v11so26785260ybm.22
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=G8ovRmWPY2eQRm47H6TIcE569Ii4rdR2xUKKDLx0xDw=;
        b=f+1YdzdbnkY01Pd/XYpVHaD7EAlrtO9o1mqgVX3oLPHx/Z792m3feItpAM1uCZKM5Z
         3OHZXnaEfnVJasRQIYFL47vXV28lja2DfwwSkfM1PeelFbEGLA8m5KNjWGbiK8gx43xs
         A7OyFY/vF+3FIkW8hJ1M5iw/Cw9gJzmt6lbZioPhP5xoRqa3E/0VCeIA0Gx9xnq3h53F
         63mraLAdmwu/r42O86ItTteBSJ6AsNhCADk/PUC2wzLpRFvqFC+Yt1u85x6Zp4WcWMWN
         9oeDse8CDkhlS2eDIt1rkFdG9oBT3asrqJaAY42oHIat6X6YD2LDWxbBc7yFsAvA+d08
         n7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=G8ovRmWPY2eQRm47H6TIcE569Ii4rdR2xUKKDLx0xDw=;
        b=Mr80UujU29AxPuoEB9Tr2RN4t36zqwnkljIEFhCpET5rvH4exkX6ED693RGAo2DF5F
         bEMnSt1T9XvBHFoNjluYYb9IRDgkgHU0luGS5o1dpMrMtqJJirqtQdWc+rtdL2LJeUrt
         47JHLN6s7AsZbBCMrieeIRQKGzNOBzD6SnfgH4uVG2qv/VQAiqOb/vjaO0l9bKwu94qt
         o9lm8ytkGF6dXOTKpnL2RRORSOZ0Ao7NEgek0ql4sIwa4Z531x2tIuppInq48g/ZFdYT
         wog0JBYcVPNqGNkTrwLfyEE3vKuu6fSI5h5PRKnBM/PyAR42vpJL7nMtBi/amGSLy6pq
         gdJA==
X-Gm-Message-State: AOAM531a+GvXDeupEoIUSFrwfq1Khl/IjAHyYlEijAiRckUpWtepFk1w
        Kcnhjaf9v38DxVBwgzTzbQ5s2yKJhRgdnd/h1Pc=
X-Google-Smtp-Source: ABdhPJxebFBr0V9uyPj7gam8rQ7tQWQYUw52l6hiIAwQkCgQg2ecyY0cl/X05nt6T3z7kD96UyI7rJ2SUevAe92Z0d4=
X-Received: by 2002:a25:502:: with SMTP id 2mr34973593ybf.6.1597864635052;
 Wed, 19 Aug 2020 12:17:15 -0700 (PDT)
Date:   Wed, 19 Aug 2020 12:16:51 -0700
In-Reply-To: <20200819191654.1130563-1-ndesaulniers@google.com>
Message-Id: <20200819191654.1130563-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200819191654.1130563-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2 2/5] Makefile: add -fno-builtin-bcmp
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
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The issue with using `-fno-builtin-*` flags was that they were not
retained during an LTO link with LLVM.  This was fixed in clang-11 by
https://reviews.llvm.org/D71193
(0508c994f0b14144041f2cfd3ba9f9a80f03de08), which is also the minimum
supported version of clang for LTO.  Use `-fno-builtin-bcmp` instead.

With this applid, we can cleanly revert
commit 5f074f3e192f ("lib/string.c: implement a basic bcmp")

Reviewed-by: Kees Cook <keescook@chromium.org>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index e523dc8d30e0..def590b743a9 100644
--- a/Makefile
+++ b/Makefile
@@ -579,6 +579,7 @@ CLANG_FLAGS	+= -no-integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 CLANG_FLAGS	+= -fno-builtin-stpcpy
+CLANG_FLAGS	+= -fno-builtin-bcmp
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
-- 
2.28.0.297.g1956fa8f8d-goog

