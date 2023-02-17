Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1159F69B1E5
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Feb 2023 18:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjBQRhe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Feb 2023 12:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBQRhc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Feb 2023 12:37:32 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BB172E10
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 09:37:24 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id u13so930598pfk.8
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 09:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mlKR2SiEJ9tOPTNmRsqma/dHgH/w4UzqWx3jVVxzeg=;
        b=migPS26i9ayo0dZyifkQsjJFRFjwczCfQxVsVdLlQAL+xJQYnT8f1P9sSl7YwpHeJO
         P6MKU4AZSEgHtpPHNLWEO0J4cF0yYhHfBuVZG4ME/Hpz3UPzTVKGYw/ED+SyAjIlldtU
         BGAvwwP2BXIXxUz8o+hi4YmOi4cELlPvSJvtwB+ng1WkSEquYRtr+8pWafc4BGUFx6FD
         i+uS5ybMOCaI16xcw07H7T+O6P7Ia7w8tp8zcyfZ9BjHKsXsZBH8cCpQ6eAlGYS5nLf+
         VZOOz1JRAUod5NhxhBAblCkkmnc8vnPEt/EOK2lZo/9yAi7Em3lnBqUWovYOXMWBcSSw
         0PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mlKR2SiEJ9tOPTNmRsqma/dHgH/w4UzqWx3jVVxzeg=;
        b=qqBmYkKRAFTi2Rn2PRLA/b0ss5n5WSPXKBvhvR5Wz9qsqqc1p+c+cZU1EVhPk+2ZOp
         JZ6+A+vykUwbemAEBNId6OWoPaSV/z4Y8FzLPu9oCUyQCQeFOrads/5sepC1lLhEqyuF
         YeC2FJ1JWZt8PrErpAS0jJlbPbXujx3iVbsjmnQ4yJJUXZR5S4AXCJdjSwDzy6kvZuBa
         sJ6Fe7AuOuXvxta8ST3RdWw68efv51wQzc/2+y3BIMIQH6oiXoe+5g2+ZSZeoLN3ifzq
         Qlg9phtZCEvGfXLnQmpEtyf4WCCTSAl3bZS8Ej7NHGtVjTcj8nivJSIehKaO0G1SlXHV
         aRgw==
X-Gm-Message-State: AO0yUKUy1LWGOgnXlLbwP6khhiklNc3rTgDSazHirpAfu1uRq3I0c08j
        4J4snfOYVoxVgkKG14hFU/kYNg==
X-Google-Smtp-Source: AK7set/ym8sElylcfRcqXuEurT6gudqqgiO6T1wua2i14AVZZXN7k9VYEpaEeb/jJEdmAggzjvJ53A==
X-Received: by 2002:a62:140f:0:b0:5a8:5424:d13b with SMTP id 15-20020a62140f000000b005a85424d13bmr1712775pfu.21.1676655443710;
        Fri, 17 Feb 2023 09:37:23 -0800 (PST)
Received: from localhost.localdomain ([124.123.168.102])
        by smtp.gmail.com with ESMTPSA id m4-20020aa79004000000b0056be1581126sm3393702pfo.143.2023.02.17.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 09:37:22 -0800 (PST)
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
To:     elver@google.com
Cc:     akpm@linux-foundation.org, andreyknvl@gmail.com,
        dvyukov@google.com, glider@google.com, jakub@redhat.com,
        kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-toolchains@vger.kernel.org, mingo@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, peterz@infradead.org,
        ryabinin.a.a@gmail.com,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH -tip v4 1/3] kasan: Emit different calls for instrumentable memintrinsics
Date:   Fri, 17 Feb 2023 23:07:13 +0530
Message-Id: <20230217173713.90899-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216234522.3757369-1-elver@google.com>
References: <20230216234522.3757369-1-elver@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> Clang 15 provides an option to prefix memcpy/memset/memmove calls with
> __asan_/__hwasan_ in instrumented functions: https://reviews.llvm.org/D122724

> GCC will add support in future:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108777

> Use it to regain KASAN instrumentation of memcpy/memset/memmove on
> architectures that require noinstr to be really free from instrumented
> mem*() functions (all GENERIC_ENTRY architectures).

> Fixes: 69d4c0d32186 ("entry, kasan, x86: Disallow overriding mem*() functions")
> Signed-off-by: Marco Elver <elver@google.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>


Tested Kunit tests with clang-15, clang-16 and gcc-12 the reported
issues got fixed.

ref:
https://lkft.validation.linaro.org/scheduler/job/6172341#L618
https://lkft.validation.linaro.org/scheduler/job/6172351#L618
https://lkft.validation.linaro.org/scheduler/job/6172338#L618

https://lore.kernel.org/all/CA+G9fYvZqytp3gMnC4-no9EB=Jnzqmu44i8JQo6apiZat-xxPg@mail.gmail.com/

--
Linaro LKFT
https://lkft.linaro.org
