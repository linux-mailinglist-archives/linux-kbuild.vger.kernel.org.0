Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72DB2CCB23
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 01:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgLCApe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 19:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgLCApe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 19:45:34 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FD9C0617A6
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 16:44:48 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 131so134004pfb.9
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 16:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Awsiky2ci1zA1MBQSVEQaSufyEGxvmxb51uiJPSU/eI=;
        b=gnDHZ32hE2yYVI6wu4DNBt/GPOkB5Y3vLqrTE5tcGhdFC2UnK0BpuB94OS0nlohfaF
         DJWFm5skJCkVSN1p5lgEHWnhMaTVvhYypSoT7hClvy8aceAjqW4v5UOyxo46Cpfon+t6
         l6zO5r/knnPXUJHRiVf3O8lRK9x5VMDKeYo1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Awsiky2ci1zA1MBQSVEQaSufyEGxvmxb51uiJPSU/eI=;
        b=SHWbkFBa2fUFbCNF9ERTn9KWdW+m3KzqzHrwOO5mcg5fc1ilPGeAC/eg/tpUnPYrr6
         qZTyLK7OESwcxxkEmXXNoOMhoiefNk+4NWzV1ss+uloJ71/G4X+SMa7wNbqzQV94xcfP
         Aqo7x3yC6WQt/I9cyfmoZxipex304c7ad2UJdugqLfLX9hwH0PZdQjP6SVUCKlpP7sD7
         6IiHAeMaa9/iEygL5CLWFbI8kMzqoAMIBXmB5SHXbPwN4HjLiIz65e3TreAjp4e2dQyw
         /+xiwRM4Sl8pASIco2xBaVEQbMutxLQlvPdfNBn9Za/+rLNtu3rOJm6wW3hBC1/ohqIB
         ZIqg==
X-Gm-Message-State: AOAM5316aaswdG63B1Glfe/Y2tH/xQHoMLK5TbafHbtfJ8kfqg4I5SLk
        YGSTKX0EJYnJePZNCnvAT2oWOg==
X-Google-Smtp-Source: ABdhPJzE9Hk09mEagFYAepfWDEb1OXqs5tNH6rGVKRk+qJkULDzb9l06smcj/oDbTgIDFGrz6s3goQ==
X-Received: by 2002:a62:2a8c:0:b029:197:a56b:8e79 with SMTP id q134-20020a622a8c0000b0290197a56b8e79mr557423pfq.51.1606956287644;
        Wed, 02 Dec 2020 16:44:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l7sm184758pgi.44.2020.12.02.16.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 16:44:46 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] Clean up UBSAN Makefile
Date:   Wed,  2 Dec 2020 16:44:30 -0800
Message-Id: <20201203004437.389959-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

This series attempts to address the issues seen with UBSAN's object-size
sanitizer causing problems under GCC. In the process, the Kconfig and
Makefile are refactored to do all the cc-option calls in the Kconfig.
Additionally start to detangle -Wno-maybe-uninitialized, disable
UBSAN_TRAP under COMPILE_TEST for wider build coverage, and expand the
libusan tests.

Thanks!

-Kees

v2:
- Add reviewed/tested-bys (Nathan Chancellor)
- Reorganize -Wno-maybe-uninitialized changes
- Split up UBSAN_MISC features and document them
- Expand libubsan tests
v1: https://lore.kernel.org/lkml/20201002221527.177500-1-keescook@chromium.org/

Kees Cook (7):
  ubsan: Remove redundant -Wno-maybe-uninitialized
  ubsan: Move cc-option tests into Kconfig
  ubsan: Disable object-size sanitizer under GCC
  ubsan: Disable UBSAN_TRAP for all*config
  ubsan: Enable for all*config builds
  ubsan: Remove UBSAN_MISC in favor of individual options
  ubsan: Expand tests and reporting

 Documentation/dev-tools/ubsan.rst |   1 +
 lib/Kconfig.ubsan                 | 128 +++++++++++++++++++++++++-----
 lib/test_ubsan.c                  |  74 +++++++++++++++--
 scripts/Makefile.ubsan            |  49 ++++--------
 4 files changed, 188 insertions(+), 64 deletions(-)

-- 
2.25.1

