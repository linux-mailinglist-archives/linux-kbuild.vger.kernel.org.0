Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C29869A7E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Feb 2023 10:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjBQJLj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Feb 2023 04:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjBQJLi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Feb 2023 04:11:38 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12578690
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 01:11:37 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id 79so314000iou.12
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wm0umPVZ0DPbMR0SC6Fc8s0kVXs3TVj3JMgvwdynUc=;
        b=E1ro5b2E81eIiwPEwmuiOWcZqlJcgz8FSDemCwstdjwIk6VMZf5JSv6567JqEdm3lo
         QcuhlruFSoTqHO1SCXWO56tFqPdOQOOg7K6Lopcy+SuUNudcn6dk2hcnRsezcASEze/b
         ivxB7MWiDw4qHjP5MzwTVwjAJEsiPSxQ52p+GfHokqI2kxv+9EuiCqBlB96QcdJb12hJ
         hOMLTYZP043WftuiWHLOfkiVk83Y0uf6XA56DwLIiTLoYTVRd5qt3dauLuR9doklXMcD
         w9CDxk4jBll8wGXRcToLS/dPRWYJ7z8nQLGRKhWQaNGoey/Cuw/z2AUHN5kW/CVjmjyR
         5fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wm0umPVZ0DPbMR0SC6Fc8s0kVXs3TVj3JMgvwdynUc=;
        b=Tw8Up1+Zzdz2fAET1+TLo+NtxkmCNWw9QxDQElAHtxe+r+ByDGDip1NJ5dk6L3NlmA
         9bPZqoPSN/jUa01pevseORwn/oSPRGeQunKDG7mvM+jLH7ndrw0lc091DhWGCekjDUDT
         VOQJSmFKPjICP5qPYZo4oeCf0s/DjAJtZ44SjIbSizIrLKaHdIra2WbfgEB4BAL+n6Lm
         FJ/UXUm3Z2d1hL/W+NAtcbWELAR+nrFUOkEtsLNaX4JUi6xtMGA+CMwGl009nEi5TAwj
         mqFlWExUuoyD706gP7w1Pr17kT1Osbl7WpNBOVlBfTDsF5e4HFhmRf/pMCUfGUsEUNNr
         oP3A==
X-Gm-Message-State: AO0yUKXNNWMpYIyyTGZx15ZVdsNnNWizff6sg/coBWuZnsR2U5JaWnbo
        zqGSbCtgo6+ZmHTASe7t5UhfcaI6rKeL1GWQ8Bfr9A==
X-Google-Smtp-Source: AK7set+JODGnHt30HQ5GaftVO6/VXO8N/bXVXgwVLyXxj6TP1Kq6r1WjJdUyMn9cHCZfIqRkqi7luHeXWavUN0/WnKQ=
X-Received: by 2002:a5d:9859:0:b0:6de:383e:4146 with SMTP id
 p25-20020a5d9859000000b006de383e4146mr2600092ios.48.1676625097139; Fri, 17
 Feb 2023 01:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20230216234522.3757369-1-elver@google.com> <20230216234522.3757369-3-elver@google.com>
In-Reply-To: <20230216234522.3757369-3-elver@google.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Fri, 17 Feb 2023 10:11:00 +0100
Message-ID: <CAG_fn=XPn-gp+FVZi3nERgMq5HzZ6K4Z21sqZ0+BwrAbfCpa2Q@mail.gmail.com>
Subject: Re: [PATCH -tip v4 3/3] kasan: test: Fix test for new meminstrinsic instrumentation
To:     Marco Elver <elver@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        linux-toolchains@vger.kernel.org,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
        Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 17, 2023 at 12:45=E2=80=AFAM Marco Elver <elver@google.com> wro=
te:
>
> The tests for memset/memmove have been failing since they haven't been
> instrumented in 69d4c0d32186.
>
> Fix the test to recognize when memintrinsics aren't instrumented, and
> skip test cases accordingly. We also need to conditionally pass
> -fno-builtin to the test, otherwise the instrumentation pass won't
> recognize memintrinsics and end up not instrumenting them either.
>
> Fixes: 69d4c0d32186 ("entry, kasan, x86: Disallow overriding mem*() funct=
ions")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Marco Elver <elver@google.com>
Tested-by: Alexander Potapenko <glider@google.com>

Now the tests pass with Clang-17 and are correctly skipped with GCC-12.
