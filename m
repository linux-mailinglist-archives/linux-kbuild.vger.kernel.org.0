Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A56605486
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Oct 2022 02:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiJTAjR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Oct 2022 20:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiJTAjQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Oct 2022 20:39:16 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00839192BAB
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 17:39:15 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id x13so11870398qkg.11
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 17:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tWFty6dFQpYyrkEdAH1uJ4wkhdCD5dnU4AL+htgFXmY=;
        b=GyjTTjrEberaB84XqhfJGUe6Z01GsAcKjAHnBqgJULvR918dxSuZNti9tMFPxpuGlE
         MYZAPh1ARSVn2/jBiolCEQ3kg9ZQ9llE8CPAlIrRJxj2yWaHhmOhxJ9mpdfddf98hnfa
         Es3WUJRJ1Fv9UyZKqqXCbXXO+DHe7Ajo9i65c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWFty6dFQpYyrkEdAH1uJ4wkhdCD5dnU4AL+htgFXmY=;
        b=yDVrBhBXBrPbpSYjIms/l6Ij63K2RL/3eNAt2XPgTYg0UganiF9cGHqL7VKn1DzeWL
         bIBhaXcXJnWABmCHNthhUM1Cj0FC77fyjrs1hiRNAX1tI45cQZ8cf9gl2mxJvdH6szbW
         5SoZja19Xh5qO9dGlSeKR7EcctlgJeM+p/bzRmVHdCDGPfIX4dKAdXH7j6tp72GaqLNY
         Q/ralolEwjjVzj2ztwLshcbFSf9GuzEnbourywoQWN0j+Oj0bOSkK/3rSCvrVUg1dhlp
         qiPmtWb19TO4q2gV9I7dyweMHdp3i4zATwRve1tyheLjs0xNKFqMpyPFSNfYhLk4/zBQ
         5Puw==
X-Gm-Message-State: ACrzQf0xM8qxHriyWam6RQdX8q2Jcw7o6QnmNhtUh/cCa5L+UyrdLLd7
        dDaKboTjMVhYpTMVrYScDr8yG0heFz2D3w==
X-Google-Smtp-Source: AMsMyM7j8JOZReV7tCUFX/JaW4BSRHZ1j03a0iUXWbmR0968nn9EQZzm3Cfu1xN5wkAh9X9yhHapow==
X-Received: by 2002:a05:620a:f89:b0:6e1:c279:fb9f with SMTP id b9-20020a05620a0f8900b006e1c279fb9fmr7469121qkn.310.1666226354835;
        Wed, 19 Oct 2022 17:39:14 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id i15-20020a05620a404f00b006ee91ab3538sm6597854qko.36.2022.10.19.17.39.13
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 17:39:13 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id f22so12822281qto.3
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 17:39:13 -0700 (PDT)
X-Received: by 2002:a05:622a:420d:b0:38d:961c:a57c with SMTP id
 cp13-20020a05622a420d00b0038d961ca57cmr8975604qtb.678.1666226353131; Wed, 19
 Oct 2022 17:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <CAHk-=wit-67VU=kt-8Ojtx04m6wxfqypKLzW7CuSeEH_9MYZvw@mail.gmail.com> <Y1CP/uJb1SQjyS0n@zx2c4.com>
In-Reply-To: <Y1CP/uJb1SQjyS0n@zx2c4.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 19 Oct 2022 17:38:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whg00wpUzNLs0obmMKA3GhUnLzat9syA1=_tfi8Ms8TLg@mail.gmail.com>
Message-ID: <CAHk-=whg00wpUzNLs0obmMKA3GhUnLzat9syA1=_tfi8Ms8TLg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: treat char as always unsigned
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-toolchains@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 19, 2022 at 5:02 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Given I've started with cleaning up one driver already, I'll keep my eye
> on further breakage.

I wonder if we could just check for code generation differences some way.

I tested a couple of files, and was able to find differences, eg

  # kernel/sched/core.c:8861: pr_info("task:%-15.15s state:%c",
p->comm, task_state_to_char(p));
 - movzbl state_char.149(%rax), %edx # state_char[_60], state_char[_60]
 + movsbl state_char.149(%rax), %edx # state_char[_60], state_char[_60]
   call _printk #

because the 'char' for the '%c' is passed as an integer. And the
tracing code has the

        .is_signed = is_signed_type(_type)

initializers, which obviously change when the type is 'char'.

But I also checked a number of other files that didn't have that
pattern at all, and there was zero code generation difference, even
when the "readable asm" output itself had some changes in some of the
internal label names.

That was what my old 'sparse' trial thing was actually *hoping* (but
failed) to do, ie notice when the signedness of a char actually
affects code generation. And it does in fact seem fairly rare.

Having some scripting automation that just notices "this changes code
generation in function X" might actually be interesting, and judging
by my quick tests might not be *too* verbose.

             Linus
