Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0524D24A6BA
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 21:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgHSTRy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 15:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgHSTRT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 15:17:19 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1920CC061342
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:19 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id r25so15657041pfg.4
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 12:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=r84xcQbgubHprmQGHdhEie+FBaGO0N4EWuKx2nze9kk=;
        b=gmxsTeXyOkvZXDCuGg2KHf5O47wmcxetM6gPsB3gToKAyGX+XYovB86AzMOWnjdw9Z
         adCND0Oa3n+jwU+LXuL4qWJvHjRWDjBENCVb+P9n9RLRZTt0ZpbW44GSXgBVluwwlOPE
         2sqbGcM+5uDuDxEXwCvTEFXVthhlNnbcix119RUIlOKXpYqVeDZdYUlhiJVsLy4VQD8F
         VydTQqW9K2iN9TjyU9AA603yAo3BsyhmgrP8URp5f6tVo2oPSLflYRIHHFhtUw7lVBBC
         iko4NA+N48dFyc4Z7VaXxlF7HX1xOmQmr3wzCCJLnLiHhd1mbsF+SUh8Inpe20wqVWEA
         NIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=r84xcQbgubHprmQGHdhEie+FBaGO0N4EWuKx2nze9kk=;
        b=X1ldxrAwUYP8N6diiBJOyv5g4lvuCg/hnu7bL+K0zmQ/cBjsypMHevaNe1CCLXx0L2
         7+HMtAAiomzEwX+m5O95wiS+izEf5bF1ADqyZhWijUkYGtr6grhDdK9xoTBchKdQbvEb
         0ZJC5bl8g2jkSA8ekXwkbDDkSfTs7m/FVNuzt8uYHSOTIsuMt3niDTR2k/Y1Uwtfytle
         ra/GOlGnPDBfHtVDo5ZkGzK8SSls0FFuGyX0B5Ptm98EFhUzLVwZWyNnSYQY1NzwRORz
         n/6aNJO8XPEvTMa4HPUnI85uLGtVXHn5jHi58ZFM/xjHXDstmTxyLPIxi5maD57n3/G4
         M9vQ==
X-Gm-Message-State: AOAM530U7trWK21B2i9DjD89mOO4ipZ7lckLCr90bbQ/IH0oA1iD6Cv5
        O4Ocg3e8acdw6LuvbZDgosuUJbaHO6EpCQqJ6f8=
X-Google-Smtp-Source: ABdhPJzj+vobFpRvf1bfd/iF3/8RTnjkeRzHLSF1auGiUuWpv+qFNCVSlRyMOj/B6agWqaCoODouhD0YAJhAwrj2ysI=
X-Received: by 2002:a17:902:c151:: with SMTP id 17mr19141781plj.228.1597864638521;
 Wed, 19 Aug 2020 12:17:18 -0700 (PDT)
Date:   Wed, 19 Aug 2020 12:16:52 -0700
In-Reply-To: <20200819191654.1130563-1-ndesaulniers@google.com>
Message-Id: <20200819191654.1130563-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200819191654.1130563-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2 3/5] Revert "lib/string.c: implement a basic bcmp"
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

This reverts commit 5f074f3e192f10c9fade898b9b3b8812e3d83342.

An earlier commit in the series prevents the compiler from emitting
calls to bcmp as part of "libcall optimization," and there are no
explicit callers, so we can now safely remove this interface.

Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/string.h |  3 ---
 lib/string.c           | 20 --------------------
 2 files changed, 23 deletions(-)

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
2.28.0.297.g1956fa8f8d-goog

