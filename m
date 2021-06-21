Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36283AF924
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 01:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbhFUXVP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 19:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbhFUXVM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 19:21:12 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5177C061768
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 16:18:57 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id o14-20020a05620a0d4eb02903a5eee61155so13552684qkl.9
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rjB5gl/OyQ1mYdw8idF1qN2FUIQyyWYhNBNVDiw+uvU=;
        b=Fx/5r3tL8gCFAJtd4rl2DAmVtq/Hcag/FqOXfbZTiumpQvK7IpCiwSoO4s2r3Pg4kG
         DjgqzwZbw38zdRoLWEIFqajlU0HyzgooEI43aq0nXoB3xcXQkKM3CW4mob90gDiP9WK2
         hHrDsQKAVpOhYF9U5V1S3QpzKlSx5rhNkESwPwwewApEl53L6IrVLx7uL19uIuHFuiOo
         6lolqnl8of8SHB6qJI16xb6wkcrAAnCL9U5ewHgz0C+f0vibak7dCVxmIJY/mPLRKbjo
         OXIV6b2Ew6sgl0PP+wDqL797jk1u3lvn2QWTbcBZRMFj+LYkj51nlwS6pHOjBj5NB8Kb
         CkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rjB5gl/OyQ1mYdw8idF1qN2FUIQyyWYhNBNVDiw+uvU=;
        b=KQOAHujH0InTr7+CBcHrtPEuJOoKW63JKsOmDeIMowl5zxqnXEExcoE2Ja349QCBLp
         1ioOspddfjGbI0XYJ5vtC8Ik2aHzhLFYeNLlKld40Wb6rhKpsYHZ5wGw2ZHOV24GYcne
         8JUvL9Fpma0PSKMLC1PYBUy/bNp8H3NnQ7t597J6BYelxymsDBHC2xHpbgmX+BbQ8Xuw
         Y19R0cDv9s2D7TEN7bDBiXKCEYs18RLQYCtmqBtluOiprbFhvFwEExwwwM9FVSJe9Kzp
         4F8AGR8y8SIaeepXxzPewZR0P4IRSnwC612R+aDBHOTX/+n5bFvz4tlpoq1YFblB7nqs
         0z/Q==
X-Gm-Message-State: AOAM530le/PVEJSZRwd+E2O0ySKDYbHUqI4J7dHYb+UXmdNazy8bKWHk
        1x2n9HCfrtXo1Qfd077t2gT22rvIz6p8UZcuAw4=
X-Google-Smtp-Source: ABdhPJyXTOipiZC/T1Rh2LGkpucm8jFtJ6//dT3xhNEPf1PixdbviPLfrtW8WqYG2ren4BZlrLSA6JcmNbcRdaRhqhk=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:dfd:ebf9:4ec7:1783])
 (user=ndesaulniers job=sendgmr) by 2002:a25:aea4:: with SMTP id
 b36mr794382ybj.428.1624317536807; Mon, 21 Jun 2021 16:18:56 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:18:21 -0700
In-Reply-To: <20210621231822.2848305-1-ndesaulniers@google.com>
Message-Id: <20210621231822.2848305-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210621231822.2848305-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH v2 2/3] compiler_attributes.h: cleanups for GCC 4.9+
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since
commit 6ec4476ac825 ("Raise gcc version requirement to 4.9")
we no longer support building the kernel with GCC 4.8; drop the
preprocess checks for __GNUC_MINOR__ version. It's implied that if
__GNUC_MAJOR__ is 4, then the only supported version of __GNUC_MINOR__
left is 9.

Cc: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/compiler_attributes.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 225511b17223..84b1c970acb3 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -27,7 +27,7 @@
  */
 #ifndef __has_attribute
 # define __has_attribute(x) __GCC4_has_attribute_##x
-# define __GCC4_has_attribute___assume_aligned__      (__GNUC_MINOR__ >= 9)
+# define __GCC4_has_attribute___assume_aligned__      1
 # define __GCC4_has_attribute___copy__                0
 # define __GCC4_has_attribute___designated_init__     0
 # define __GCC4_has_attribute___externally_visible__  1
@@ -35,8 +35,8 @@
 # define __GCC4_has_attribute___noclone__             1
 # define __GCC4_has_attribute___no_profile_instrument_function__ 0
 # define __GCC4_has_attribute___nonstring__           0
-# define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
-# define __GCC4_has_attribute___no_sanitize_undefined__ (__GNUC_MINOR__ >= 9)
+# define __GCC4_has_attribute___no_sanitize_address__ 1
+# define __GCC4_has_attribute___no_sanitize_undefined__ 1
 # define __GCC4_has_attribute___fallthrough__         0
 #endif
 
-- 
2.32.0.288.g62a8d224e6-goog

