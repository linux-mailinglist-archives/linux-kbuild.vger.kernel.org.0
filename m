Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C37969516C
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Feb 2023 21:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjBMUKv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Feb 2023 15:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBMUKu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Feb 2023 15:10:50 -0500
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144E4BDD8
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Feb 2023 12:10:49 -0800 (PST)
Received: by mail-ej1-x64a.google.com with SMTP id nd38-20020a17090762a600b00871ff52c6b5so8246060ejc.0
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Feb 2023 12:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H/B0iwxSfZGzTMto/wFUe2mHRnomv/i3ZrRWf1XIjx4=;
        b=nPgGXYua3QHijtL47+4sZehgs2YZ50vVDnE79BFMT2Nn3zhSJFDjy3hKgjuREuIaba
         xFxnoC55wwn+W29AEm5DPQCYPqlcGfsrzMNF7j6OSG/UflSXkJFc3qSzhZmqQ/eC6LvC
         mi37umZfjpxdVWia4v6tTxmf0W1evKcUzl0yR/+wk1q99aUOCxuQ5uSdsNhaSRGzAEn1
         c6wnTa6TgStYDW+Eq8Izevyj9RyqxNSN3gSvf7BAuTom4orRwusw1+uwtym5GXVJaS6g
         7xtleAGKG+pkbznmI7BzYKCqPpo/+ztobe3x4JMCvUNWih0iH1ITs8GSh37bOQA1dsAc
         bzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/B0iwxSfZGzTMto/wFUe2mHRnomv/i3ZrRWf1XIjx4=;
        b=Xl8rT+aLSAGYrCfWxUp/YcfQGUnedmAzb74lmLUXKbyssSgqpthIPWp+z8OzLfNfnk
         x8NZoRZT1OKkMiQ1mSnyPWdMwJjzHcYhudHvJuC1PNokZUcRcrGqIM05snCodxEQgcIO
         aULrisLNNQBYo2xDKBhkSletMzC8oYcwaFj1A7rNMLQw8DuHHr8HrLtgnWylVfcv6HyF
         y8hdMX+uh7lC4Ye9JW2+BEDmgQJJ+sFYtlUKFpCDfAVpJoJZpWMpE5LBYejP6KF+jukL
         hH3r3YciWEScsRpSdVo3r5T8ivx1vwJKhOA9gOf1Ne6F1PdjHsCdu6zIiSlXdDD63zMn
         wYaw==
X-Gm-Message-State: AO0yUKW3WCISAyNxCUqMP9x7NxUhwkyaqhWJrAc6ynaDxp27W5//fIP5
        5S6yUl0E5jl6/Y3xyZEScAMwKsDEZQ==
X-Google-Smtp-Source: AK7set+RgO+60b8zpnHHhXW/ujdzYUizsadRV8jk/rz/KTazF6oRv7tkA3prs7UoIFTOhCO8DovLDpoubw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6cba:3834:3b50:a0b2])
 (user=elver job=sendgmr) by 2002:a17:906:5a62:b0:877:7480:c75d with SMTP id
 my34-20020a1709065a6200b008777480c75dmr112334ejc.0.1676319047593; Mon, 13 Feb
 2023 12:10:47 -0800 (PST)
Date:   Mon, 13 Feb 2023 21:10:40 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230213201040.1493405-1-elver@google.com>
Subject: [PATCH -tip v2] kasan: Emit different calls for instrumentable memintrinsics
From:   Marco Elver <elver@google.com>
To:     elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Jakub Jelinek <jakub@redhat.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clang 15 will provide an option to prefix calls to memcpy/memset/memmove
with __asan_ in instrumented functions: https://reviews.llvm.org/D122724

GCC will add support in future:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108777

Use it to regain KASAN instrumentation of memcpy/memset/memmove on
architectures that require noinstr to be really free from instrumented
mem*() functions (all GENERIC_ENTRY architectures).

Fixes: 69d4c0d32186 ("entry, kasan, x86: Disallow overriding mem*() functions")
Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Use asan-kernel-mem-intrinsic-prefix=1, so that once GCC supports the
  param, it also works there (it needs the =1).

The Fixes tag is just there to show the dependency, and that people
shouldn't apply this patch without 69d4c0d32186.
---
 scripts/Makefile.kasan | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index b9e94c5e7097..78336b04c077 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -38,6 +38,13 @@ endif
 
 CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
 
+ifdef CONFIG_GENERIC_ENTRY
+# Instrument memcpy/memset/memmove calls by using instrumented __asan_mem*()
+# instead. With compilers that don't support this option, compiler-inserted
+# memintrinsics won't be checked by KASAN.
+CFLAGS_KASAN += $(call cc-param,asan-kernel-mem-intrinsic-prefix)
+endif
+
 endif # CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_SW_TAGS
-- 
2.39.1.581.gbfd45094c4-goog

