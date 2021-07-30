Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D259F3DB3E7
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 08:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237559AbhG3GvH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 02:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237463AbhG3GvG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 02:51:06 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9222C061765;
        Thu, 29 Jul 2021 23:51:02 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id m13so10189885iol.7;
        Thu, 29 Jul 2021 23:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t11HKxEEH4asV/wZXTqt9J2Oni9bsKp96UbDJNXP4DE=;
        b=aKIp6ToGQeADU6hv6MlwcrPSol1BzQUQs9GX42LLESv9E8jJ095bPtgdnQ0Fzf+x+b
         1yX6Yw4wR8GVGcufOq4oDpF6tFNaxHFrwXQINBq28/V+VAoQ/lSl/9kbpcskxqN+mP/+
         OBSP9OfRfi7fKoGGda7RGbmkUYdDpVEOM/BFPmJ1LIht+22HIdoSjkEeWVfmb9s/UcDA
         oJUmHRIr0dfYxGaLDKTK7E9pV00xMkD/3RVLo+IVsRn/IHYRexYkfR7qsjg7pG0REDvc
         OKTabGVA4ktuF5yx1DE+oz8Llp2YZwh0z0NtkvssKuJcC6HYdQgvqHj8DNMJkm973biG
         IUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t11HKxEEH4asV/wZXTqt9J2Oni9bsKp96UbDJNXP4DE=;
        b=qUgCiYuxNKyR0g/bNNtyK3SEVkDttEgqotBacC8YwvUxAnpRzYf9xi33kHChAB5Nxq
         NehKljiDR29Co2nYKqMuKYG8lU0QsL8k0MKP3wV53r5wo8ff9KY/IyruHqHTlZ0tPIIj
         peUjqxdVqgMnDgeI+XAv2SwVCHQQOOAxbRz/1VKYIHjfkk/pMxielTuRGTyoQ4u3JVQ6
         jiLTZh/EqxhEQiI7/RqT5JZ35Q2dBzRSyQF0+4zL2nRIPBp/tmPGvzIyHTjUY2uvNyVI
         /3VvDD4tAIZIQqBdFHTk/7XU1fMC0739rR23KtLqN18JYNBMo073yeidXfBOAJfAVghJ
         gKNg==
X-Gm-Message-State: AOAM533m1dd8zlI+qbr9sRh/Yth1EqoHOUe5ecoxJQeIfDhZHD8NJIQ9
        MPywAz0AsbpfwCww4Ot59HO9PbAIgNdRAtJpEet7kiV9
X-Google-Smtp-Source: ABdhPJyOF5nkGh/vdzLEcEPiQt8GaA5L8wh8PI6zmY2VPiGoxjiKfolqJBFRP1sRzcl5wz98kTRuH3ENrb6h6Dd1qdY=
X-Received: by 2002:a02:9508:: with SMTP id y8mr953957jah.28.1627627862194;
 Thu, 29 Jul 2021 23:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210729165039.23896-1-ndesaulniers@google.com>
 <20210729165039.23896-3-ndesaulniers@google.com> <44117d0c-51b7-1f68-f752-ba53de503b14@kernel.org>
 <CAKwvOdm0xs4ikb0K0_b8Az0T=Kxu_-6AHjWHOhjsKZb3hTrH2A@mail.gmail.com>
In-Reply-To: <CAKwvOdm0xs4ikb0K0_b8Az0T=Kxu_-6AHjWHOhjsKZb3hTrH2A@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 30 Jul 2021 08:50:51 +0200
Message-ID: <CANiq72kya-9zeGN4uTqLMbAUMDGu-SQXRAwS9UTxceeObbN9yg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 CC=clang LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 30, 2021 at 2:19 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> maximally flexible."  We don't want folks generally using CC=clang;
> preferably they'd use LLVM=1.  I need to rewrite our docs to make that
> more explicit and straightforward.  And if folks would prefer to use
> CC=clang for whatever reason, let them explicitly state CROSS_COMPILE
> then.

Perhaps it would be nice to clarify the "level of support" for
`CC=clang` too, in particular long-term when `LLVM=1` works for all
architectures.

In other words, is `CC=clang` going to remain supported/maintained, or
it will be something that will still compile/boot but not expected to
be used by anyone in production, or dropped altogether (not the `CC`
option itself, of course, I refer to the mix of toolchains)?

Thanks,

Cheers,
Miguel
