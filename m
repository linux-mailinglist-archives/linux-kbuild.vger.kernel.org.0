Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8692F42FBD0
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Oct 2021 21:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242694AbhJOTP7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Oct 2021 15:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242670AbhJOTPy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Oct 2021 15:15:54 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD883C061764
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Oct 2021 12:13:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y26so45902741lfa.11
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Oct 2021 12:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HBzr0B3tGGPW4EBa2LvZed6scqvnq5Oml+sl03YQDio=;
        b=BA/5lSdu+5ROrNUsKhvi+0xgDXMbeH1IeW/bUOWfcmhvn1b5gplsN/lhjVCre6mi7A
         T02zPFwlJIn5jPNjwH4oOtQyucvs6lBBcy+OrsPY3YL/FYdY0J233zlFzQbbtj4HgTc2
         L9417guhXF0JmPaEr+m4IC2Neu+S/CP0pe8W1DeWsGEaRfcbKuXMoiVVLIsmZUAZYhDW
         i839MhmZ7hNt4oiL/fD/Ou4ujKkHeGGDRRmS1Lm9czlqguFwu1qDQyHbuiiIuclaTR8n
         zgTo8mkTKOfB8QZ+Z9qaTsaUNQSAUoM7AdYTjJhuqe3g1u8w9OuBkFHS5pOcW6IIJz3a
         cmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HBzr0B3tGGPW4EBa2LvZed6scqvnq5Oml+sl03YQDio=;
        b=oOw7GVDcRFG2oabOu2OBRYV0LeZroYSyutWzaLQAeSkgrSsTuANDrBx0NYXdhyVF6C
         +zrZr/hVKmGDv9sQDf1Ut9LnNyM6pkhwrplepCt15NZjO3xi+thaF9gMfSN7/gaI/1VN
         g9LySqNUdzSGshiL8ax9JpLwX1um1WQ119sXwfV5ID29cxupKqTDnYJ0/mHrHu2Dxzze
         VACTkREOQ3BBlOMGMXJmPIrOYkN9g37V6e+9dk6KnCzWl13oeci78HLUqRUJR9SM8UaX
         jkEfSXuhrSi69i6zEzhNCxfxycgpiEGh0lmhJk7HHnrEUyHdl8GLWiaLb+IdTRbIRjr6
         L3AA==
X-Gm-Message-State: AOAM5315R9V68UgoBXs0hww4+Mx1j92Z1gSCiMkz/F6S7RDmcVH1gBpT
        m/BP/JKSp114BaOmZjJQiBurCnn/QLKGBGfb6lM5uw==
X-Google-Smtp-Source: ABdhPJz8/p6IXPlhwfOmIFLJc3rweNG7wsVdft9QVM6g2UNGOxECgfrMdFD6Bhxm1ySa6xlaQxoW0bTsBpferjnjiCE=
X-Received: by 2002:a05:6512:3ba3:: with SMTP id g35mr13415925lfv.651.1634325224740;
 Fri, 15 Oct 2021 12:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <1634167668-60198-1-git-send-email-ashimida@linux.alibaba.com>
 <CAKwvOdkv70XDdK-k3n4ycFQsz+h7V-sTiH8RuxxaLofp-okweQ@mail.gmail.com> <722d9662-e27c-2efb-e8cf-d505b6950475@linux.alibaba.com>
In-Reply-To: <722d9662-e27c-2efb-e8cf-d505b6950475@linux.alibaba.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 15 Oct 2021 12:13:33 -0700
Message-ID: <CAKwvOdnMvBP-1=YbXTpYOgWqCBy44tUvWdtMXp8p485bYnPYNQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH V4]ARM64: SCS: Add gcc plugin to support Shadow
 Call Stack
To:     Dan Li <ashimida@linux.alibaba.com>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        catalin.marinas@arm.com, will@kernel.org, keescook@chromium.org,
        nathan@kernel.org, tglx@linutronix.de, akpm@linux-foundation.org,
        samitolvanen@google.com, frederic@kernel.org, rppt@kernel.org,
        mark.rutland@arm.com, yifeifz2@illinois.edu, rostedt@goodmis.org,
        viresh.kumar@linaro.org, andreyknvl@gmail.com,
        colin.king@canonical.com, ojeda@kernel.org,
        luc.vanoostenryck@gmail.com, elver@google.com,
        nivedita@alum.mit.edu, ardb@kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 15, 2021 at 11:29 AM Dan Li <ashimida@linux.alibaba.com> wrote:
>
>
>
> On 10/15/21 2:44 AM, Nick Desaulniers wrote:
> >   On Wed, Oct 13, 2021 at 4:28 PM Dan Li <ashimida@linux.alibaba.com> wrote:
> >> --- a/include/linux/compiler-gcc.h
> >> +++ b/include/linux/compiler-gcc.h
> >> @@ -50,6 +50,10 @@
> >>   #define __latent_entropy __attribute__((latent_entropy))
> >>   #endif
> >>
> >> +#if defined(SHADOW_CALL_STACK_PLUGIN) && !defined(__CHECKER__)
> >> +#define __noscs __attribute__((no_shadow_call_stack))
> >> +#endif
> >
> > Cool this is a nice addition, and something I don't think that clang
> > has.  For any new feature, having a function attribute to disable it
> > at the function granularity is nice, and plays better with LTO than -f
> > group flags.  Though that begs the question: what happens if a __noscs
> > callee is inlined into a non-__noscs caller, or vice versa?
> Thanks Nick,
>
> According to my understanding, all inline optimizations in gcc should
> happen before inserting scs insns (scs and paciasp/autiasp use the
> same insertion point). Therefore, the check for the __noscs attribute
> will also occur after all inlining is completed.
>
> As in the following example:
> - Since __noscs attribute is specified, scs_test1 does not insert scs insns
> - Since normal functions scs_test2/3 uses x30, it needs to insert scs insns
> - Since __noscs attribute is specified, scs_test4 after inlining does not
> need to insert scs insns
>
> __always_inline __noscs void scs_test1(void)
> {
>      asm volatile("mov x1, x1\n\t":::"x30");
> }
>
> //scs insns inserted after function inline
> void scs_test2(void)
> {
>      scs_test1();
> }

That may be surprising to developers.  Perhaps __always_inline on
scs_test1 is distracting this test case, but I suspect it may not make
a difference.  This particular issue comes up time and again with
stack protectors; ie. the callee is marked no stack protector, then
gets inlined into a caller and suddenly gets a stack protector.

>
> __always_inline void scs_test3(void)
> {
>      asm volatile("mov x3, x3\n\t":::"x30");
> }
>
> //no scs insns inserted
> __noscs void scs_test4(void)
> {
>      scs_test3();
> }
>
> ffff800010012900 <scs_test1>:
> ffff800010012900:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
> ffff800010012904:       910003fd        mov     x29, sp
> ffff800010012908:       aa0103e1        mov     x1, x1
> ffff80001001290c:       a8c17bfd        ldp     x29, x30, [sp], #16
> ffff800010012910:       d65f03c0        ret
>
> ffff800010012914 <scs_test2>:
> ffff800010012914:       f800865e        str     x30, [x18], #8
> ffff800010012918:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
> ffff80001001291c:       910003fd        mov     x29, sp
> ffff800010012920:       aa0103e1        mov     x1, x1
> ffff800010012924:       a8c17bfd        ldp     x29, x30, [sp], #16
> ffff800010012928:       f85f8e5e        ldr     x30, [x18, #-8]!
> ffff80001001292c:       d65f03c0        ret
>
> ffff800010012930 <scs_test3>:
> ffff800010012930:       f800865e        str     x30, [x18], #8
> ffff800010012934:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
> ffff800010012938:       910003fd        mov     x29, sp
> ffff80001001293c:       aa0303e3        mov     x3, x3
> ffff800010012940:       a8c17bfd        ldp     x29, x30, [sp], #16
> ffff800010012944:       f85f8e5e        ldr     x30, [x18, #-8]!
> ffff800010012948:       d65f03c0        ret
> ffff80001001294c:       d503201f        nop
>
> ffff800010012950 <scs_test4>:
> ffff800010012950:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
> ffff800010012954:       910003fd        mov     x29, sp
> ffff800010012958:       aa0303e3        mov     x3, x3
> ffff80001001295c:       a8c17bfd        ldp     x29, x30, [sp], #16
> ffff800010012960:       d65f03c0        ret
> > I noticed that __noscs isn't actually applied anywhere in the kernel,
> > yet, at least in this series.  Were there any places necessary that
> > you've found thus far?
> At present, I have not found a function that must use the __noscs
> attribute in the kernel. I have only used this attribute in test cases.


-- 
Thanks,
~Nick Desaulniers
