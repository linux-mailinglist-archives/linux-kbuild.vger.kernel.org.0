Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149993AF919
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 01:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbhFUXVI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 19:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFUXVH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 19:21:07 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B845CC061756
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 16:18:52 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id a12-20020ac8108c0000b029023c90fba3dcso646320qtj.7
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 16:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=EuIcmSw5KPdPoDKod6astx8c5RujtZWXcqBmQqWg68Y=;
        b=Rl2f+IVFqR4FXBxc4YAH9IgPYaLlI0oYo4anxkuLff4uba+ORx0p7N9irHcgqyQ+9M
         hmodRj/mKufcXYD11r2VSZ5hDKLyMvdLLLmobp3968Q8QfOqiRIMD5DcevQhK1EJCWRO
         n7YxcGY/61Wgt9WwsRSZ6z3H5yImCbKhYTohLAKNS6nyOkyj4osBjSTdvq78hw1W4QDD
         gvjHiARt6uW5acWJ7Fc8Qw3tqcAV19/d9odEv831VqpKPsvASivqCZg122/+MYAhLcWF
         fQIf8W7RIKXiSmMlSEyeiG7Yu61ytddyLALZ9ISgnTlBZNRvqmVKf3y9TnrsFOaIwbNE
         v2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=EuIcmSw5KPdPoDKod6astx8c5RujtZWXcqBmQqWg68Y=;
        b=L9D7/yhE7dStnOb9hnljGWrUhQKXkJUTTHUCJZy85kWbxI1yfuQYcsYbgxRTHZfUTp
         6JhDGbbhFoZXOJnpfSBjHeALrbay5Ktv08zllseBC9KhBFOAKPAP3DCd4cYYozdnRjZe
         M1BVInq/uv0Gxu4YCMHKiubM7YeD5bLTxI1qNhKiC4vV9svtZM0dnBLEnWPaWDIFZlZW
         +jpy6343US4JaJaEx5oh1yLktvSuQAx8TOeUTk9svyphpJmKXGa/v2bGMFmCQc3dWftW
         y1MP4lbOXLW/CWXD918ZSGhQG7osqnW8VfIdHsv3Fla5Td3DonEJoJ582eCg1zM9HGyj
         R2ZQ==
X-Gm-Message-State: AOAM5303ipDxUsxOkNDdr9zmkb7nCxFlic/OeV+g68tpOR2itARAZ+Pm
        PG79EETCxnNR+TzDdDoVHVOgxIEF40Gs+vNA2u4=
X-Google-Smtp-Source: ABdhPJwXV3AaUVj/zGKNnPsDnVTnkVqvyKrfM+eSMD0ScbK7e4btiOXMggCYiTefAq5RSnQMsJmgFBuwAnoE5CW3OBg=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:dfd:ebf9:4ec7:1783])
 (user=ndesaulniers job=sendgmr) by 2002:a25:3749:: with SMTP id
 e70mr789717yba.53.1624317531803; Mon, 21 Jun 2021 16:18:51 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:18:19 -0700
Message-Id: <20210621231822.2848305-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH v2 0/3] no_profile fn attr and Kconfig for GCOV+PGO
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
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The kernel has been using noinstr for correctness to politely request
that the compiler avoid adding various forms of instrumentation to
certain functions.

GCOV and PGO can both instrument functions, yet the function attribute
to disable such instrumentation (no_profile_instrument_function) was not
being used to suppress such implementation. Also, clang only just
recently gained support for no_profile_instrument_function. GCC has
supported that since 7.1+.

Add a new function annotation __no_profile that expands to
__attribute__((__no_profile_instrument_function__)) and Kconfig values
CC_HAS_NO_PROFILE_FN_ATTR and ARCH_WANTS_NO_INSTR. Make GCOV and PGO
depend on either !ARCH_WANTS_NO_INSTR or CC_HAS_NO_PROFILE_FN_ATTR.

Changes V1 -> V2:
* s/no_profile/no_profile_instrument_function/
* fix trailing double underscore on GCC 4 define, as per Fangrui+Miguel.
* Pick up Fangrui + Miguel's reviewed-by tag.
* Add link to GCC's doc.
* Fix clang's doc format; will appear once clang-13 is released.
* New cleanup patch 2/3. Orthogonal to the series, but while I'm here...

Base is
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/clang/pgo.

Nick Desaulniers (3):
  compiler_attributes.h: define __no_profile, add to noinstr
  compiler_attributes.h: cleanups for GCC 4.9+
  Kconfig: add ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR, depend on
    for GCOV and PGO

 arch/Kconfig                        |  7 +++++++
 arch/arm64/Kconfig                  |  1 +
 arch/s390/Kconfig                   |  1 +
 arch/x86/Kconfig                    |  1 +
 include/linux/compiler_attributes.h | 19 ++++++++++++++++---
 include/linux/compiler_types.h      |  2 +-
 init/Kconfig                        |  3 +++
 kernel/gcov/Kconfig                 |  1 +
 kernel/pgo/Kconfig                  |  3 ++-
 9 files changed, 33 insertions(+), 5 deletions(-)


base-commit: 4356bc4c0425c81e204f561acf4dd0095544a6cb
-- 
2.32.0.288.g62a8d224e6-goog

