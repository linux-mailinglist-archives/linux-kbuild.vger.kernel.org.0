Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3F72CB91
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 18:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235891AbjFLQdn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 12:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235721AbjFLQdm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 12:33:42 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B03195
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:33:41 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51458e3af68so7708393a12.2
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686587620; x=1689179620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ64AB6vFE2gCnLICKj93uVfxKBboA+BfLd8wCYY+0E=;
        b=Jsqq+xX5M6BdNzqsIo+DrnRDPg6xQo6OOtPJWwZqVr2YUX0996b4N1ddkh4YqwgxJX
         02I2Vpalg3PFbqtmE1rlBxdxICAHNQ+6xZas+6PyTbDrVazqun9sRqOF+kcoHEvr7Qxm
         NyCbMv7cZOPG/Zm9rWS4jZdHgZFIUqpnypB64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587620; x=1689179620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ64AB6vFE2gCnLICKj93uVfxKBboA+BfLd8wCYY+0E=;
        b=NMP7klIdY/btW/4UTXR/g+wkmN2bPSPHbbkpKQKLmM4xMnNczcFI8L8XElV2gwBb9u
         PV5GyhVmQQ7KP8GxpJSBiTuqGS7y8pa5TvVS469G9BFtgv7C8TJpUMlfKkRmMLTfjQtT
         GPWU/9Y5ISRBO7YwM1vGvKySPRWXUF0kH6l3WSOxYklPuGbU/HtKXRvOm2Rv9e8DdBcf
         W/nAOFkMw8/VS9l46TZC+CfUBaKAb1u+6wHbeAhY4+dUylkIPx3EPx8L9ubjc+xBgvc2
         eDbjwmhYwGxgzVOXixA6PD7T7ylrd5MFh6JnuiLPNqM3TiZFQddkw8XKhVvcJ5sDb0vB
         V7yg==
X-Gm-Message-State: AC+VfDzAIGvxrnGMGsQo+zCnodA9Pq2GLXZDJIy++Tbl2B7bU3x9J72T
        httHe0XVMJf4WXvqk1RXXfs81nVKUtnAl4fL8ZYRzPSX
X-Google-Smtp-Source: ACHHUZ4rofLnGNCcYBA2brm2FeZltLw4jLnW7KJTZbE/1N1FHW2LAFmj+j7v0HJWolpkD4vTlzrkcQ==
X-Received: by 2002:a50:ed8d:0:b0:516:642e:f935 with SMTP id h13-20020a50ed8d000000b00516642ef935mr5458308edr.22.1686587619777;
        Mon, 12 Jun 2023 09:33:39 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id o20-20020aa7c7d4000000b005183ce42da9sm1855298eds.18.2023.06.12.09.33.39
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 09:33:39 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f730c1253fso34474295e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:33:39 -0700 (PDT)
X-Received: by 2002:a05:6402:6d3:b0:514:93b2:f3b1 with SMTP id
 n19-20020a05640206d300b0051493b2f3b1mr5343956edy.40.1686587246075; Mon, 12
 Jun 2023 09:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093539.895253662@infradead.org>
In-Reply-To: <20230612093539.895253662@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Jun 2023 09:27:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPtj9Y+nkMe+s20sntBPoadKL7GLxTr=mhfdONMR=iZg@mail.gmail.com>
Message-ID: <CAHk-=wgPtj9Y+nkMe+s20sntBPoadKL7GLxTr=mhfdONMR=iZg@mail.gmail.com>
Subject: Re: [PATCH v3 33/57] perf: Simplify perf_adjust_freq_unthr_context()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     keescook@chromium.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, masahiroy@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com, nicolas@fjasle.eu,
        catalin.marinas@arm.com, will@kernel.org, vkoul@kernel.org,
        trix@redhat.com, ojeda@kernel.org, mingo@redhat.com,
        longman@redhat.com, boqun.feng@gmail.com, dennis@kernel.org,
        tj@kernel.org, cl@linux.com, acme@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
        paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
        joel@joelfernandes.org, josh@joshtriplett.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
        42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
        john.johansen@canonical.com, paul@paul-moore.com,
        jmorris@namei.org, serge@hallyn.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
        rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
        tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
        luc.vanoostenryck@gmail.com
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

This seems to have the same pattern that I *think* it's entirely
broken, ie you are doing that

                guard(perf_pmu_disable)(event->pmu);

inside a loop, and then you are randomly just removing the

               perf_pmu_enable(event->pmu);

at the end of the loop, or when you do a "continue"./

That's not right.

The thing does not not go out of scope when the loop *iterates*.

It only goes out of scope when the loop *ends*.

Big difference as far as cleanup goes.

So you have not "simplified" the unlocking code, you've broken it. Now
it no longer locks and unlocks for each iteration, it tries to re-lock
every time.

Or have I mis-understood something completely?

               Linus
