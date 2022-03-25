Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6533C4E7B5F
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Mar 2022 01:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiCYRgt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Mar 2022 13:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbiCYRgr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Mar 2022 13:36:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7CFD4452
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Mar 2022 10:35:04 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z12so724729lfu.10
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Mar 2022 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yIMApoDu0cSTb9UHBH+0bGiaMNz8inAICwvHUwG31uM=;
        b=fImwDEmarxWlMb6gMb1DB3uyeS0b4STGPcZKODQdrNUIGD5G9Kqoh0FWkcCAPqbziQ
         HIDiJvpOAZ/Hvsyijyg/cAIgAtvr9nzllE3BZOBmRvLYdvbfnrL0+xcorU8NV97pFVmz
         6HjdVE2BWnwep3mBHwh1GU9827E94rVX0KV9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yIMApoDu0cSTb9UHBH+0bGiaMNz8inAICwvHUwG31uM=;
        b=1LrF2Yqw8cQ7a1NQbuGJiraVACSLtbKPdbY+85m0iqnWrKm9SlOYW3J7dbpLfbjvoT
         Uq70DW6jIySaetjVMpiVV9igo5FmbvC0DOSD82bjkWkDG7wH7EgCBZU8w4fdeeV7fsYg
         ITbcJAXgdEQ6CaajVDmATQNUI+zPGywWDAClkHfMZzXQW4a0+uYQRC/s7cjQSWEkm7xN
         9fCowEINM9kRSVBhYR+8YYyizTfONrt1mVByLp4QnH4TdzlOe+pT7UU3DhN0plcII77I
         24p3rmaZeB++N5bQknal2IFJ6xOzYuoGD8SHeKoeJns/xBHb/Hs97oj6IAt4Oxd5D0Uk
         AZLg==
X-Gm-Message-State: AOAM533GLiAqR5JPf6ihWDunsnxKe7fikKj5VQTNdy6CNGMC+6SyAlVW
        eQ6g5fm6ldnvtHZEa1l5Z6uxzJlV3GhhkI1bstw=
X-Google-Smtp-Source: ABdhPJwxhhQK9UUuix+gyBxURZNKTp61IOhK0r5Y5ZaRwiWDcu5KLmAspKt9LpR+Mie+xlce22MQRg==
X-Received: by 2002:a2e:b54f:0:b0:249:1f79:d50f with SMTP id a15-20020a2eb54f000000b002491f79d50fmr9102401ljn.338.1648228832993;
        Fri, 25 Mar 2022 10:20:32 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id y23-20020a2e95d7000000b00247e4e386aasm751775ljh.121.2022.03.25.10.20.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 10:20:32 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id o6so11177150ljp.3
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Mar 2022 10:20:32 -0700 (PDT)
X-Received: by 2002:a2e:a5c4:0:b0:249:9ec3:f2b with SMTP id
 n4-20020a2ea5c4000000b002499ec30f2bmr8829088ljp.358.1648228831778; Fri, 25
 Mar 2022 10:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220325131348.3995-1-andriy.shevchenko@linux.intel.com> <CAK7LNAR9HS7LK5D-07i8_tFcwd=uiHEFu05n0t_UuFZExcfBpw@mail.gmail.com>
In-Reply-To: <CAK7LNAR9HS7LK5D-07i8_tFcwd=uiHEFu05n0t_UuFZExcfBpw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Mar 2022 10:20:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGsKD=DYgYqYUDzGKT8BOPLhqebw2YB6PCuZenE3qEzA@mail.gmail.com>
Message-ID: <CAHk-=wjGsKD=DYgYqYUDzGKT8BOPLhqebw2YB6PCuZenE3qEzA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Makefile.extrawarn: Turn off -Werror when extra
 warnings are enabled
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 25, 2022 at 7:35 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> WERROR should not be enabled for regular builds.

No.

WERROR should be on for regular builds.

It's W=1 that is questionable. It enables warnings that are often
false positives, and if you use W=1 (and particularly W=2) then that's
_your_ problem.

W=1 is most definitely not "regular builds". It's only for people who
want to deal with crazy compiler warnings.

I want WERROR on as widely as possible, because I'm really sick and
tired of developers not noticing when they add warnings because they
did a "regular build"

Stop this idiocy where you think warnings are acceptable.

                Linus
