Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC473F7D7F
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 23:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbhHYVKv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 17:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbhHYVKu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 17:10:50 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F22DC0613C1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 14:10:04 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o10so1688897lfr.11
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E9tATzQmNnf1n87t/HdQMMPUKAwA0uk3NMuEvkkauNQ=;
        b=rDk6QdPmNKIfsBWw+RCk/zTo1/Iz/KktStVviVo1+3U2kouL2fe+6wd/+A6pEaCMzh
         xzM7QapYS3avKaOtSvCRpfQi1VypfGMygawhsTaUr+awCsB60kx+mrvhp8FXcMEcdXqO
         k3IksxDiST5MMM06Rug+w9s0ESAs5BEt6zxwHbiXGdm6tVzS06DDI3L+Lt856rQlitrh
         fVxEvhZ64781J7thqfN5yP8emsMeF7kIh9DgpVHuJN04jnJVHa/d/zG2uAegWku2U2Q2
         Xc1QFKy0jWfRFrx/OwfmhlXYphVlf3P8Fh9tkf4nRNAo32xs40V655CNr61QKh0PP7Fd
         npvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E9tATzQmNnf1n87t/HdQMMPUKAwA0uk3NMuEvkkauNQ=;
        b=JpUhvaSqkeTRWJvj/ynt33+cWXu7/GaB3aSzoKZK78X3Wn5OoN4G/XtTP54SOl61Rc
         arlSMe4jOXgB9FEyjNCy7cgLb8qu2fJqjsZp0EOKygR0MjRlFF2/SnWrxet6f/haXFMx
         TxLBryGeEsmJOsxbRSmVvNYzm//11fPBnF6BfLOvl+hTdx/xRAo0wWR49Z6AoM+T7LtA
         eAdcFp6Yiq7WHlUA0BJbCM3z5cRA7yurNNz6K05Ml6lOjAsaTZWlVNBVNIfzOV5UedGL
         ucvF6HhNHBhI10yY+8bIyzOAXBVlry49tVBbYhQmCRR6OgKAzpI59AFBfqkQtAZFf7Ux
         3xXg==
X-Gm-Message-State: AOAM531WYCoezorrnpiY4HC+k9QLkFZK+rJXdQsrmjFZubzbmxhKiqp9
        Yba3RP+KzquPrTtTo6I9+ZkJHUTWDlU06MWmMuX4Sj+1hoxeOrn6
X-Google-Smtp-Source: ABdhPJxcXkQ87HPRlelKv1H2O2oI5mVq94OOJodcCv7br/8wMY6xYTPcFQlMwHXL2Jn30VXNM/5NnB7UPwjzKfyqj9o=
X-Received: by 2002:a05:6512:3b85:: with SMTP id g5mr87035lfv.368.1629925802350;
 Wed, 25 Aug 2021 14:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210817005624.1455428-1-nathan@kernel.org> <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org> <202108171056.EDCE562@keescook>
 <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org> <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 25 Aug 2021 14:09:50 -0700
Message-ID: <CAKwvOdkaHp5akDyAz_rav5u6gu4SgtjhmzftKgNCPr0LVukHOA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Masahiro Yamada <masahiroy@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 2:18 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Aug 18, 2021 at 3:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On 8/17/2021 11:03 AM, Kees Cook wrote:
> > > On Mon, Aug 16, 2021 at 09:55:28PM -0700, Nathan Chancellor wrote:
> > >> If you/Gustavo would prefer, I can upgrade that check to
> > >>
> > >> ifneq ($(call cc-option, -Wunreachable-code-fallthrough),)
> > >>
> > >> I was just trying to save a call to the compiler, as that is more expensive
> > >> than a shell test call.
> > >
> > > I prefer the option test -- this means no changes are needed on the
> > > kernel build side if it ever finds itself backported to earlier versions
> > > (and it handles the current case of "14" not meaning "absolute latest").
> > >
> > > More specifically, I think you want this (untested):
> >
> > That should work but since -Wunreachable-code-fallthrough is off by
> > default, I did not really see a reason to include it in KBUILD_CFLAGS. I
> > do not have a strong opinion though, your version is smaller than mine
> > is so we can just go with that. I'll defer to Gustavo on it since he has
> > put in all of the work cleaning up the warnings.
>
>
>
> https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
>
>    did two things:
>
>  (1) Change the -Wimplicit-fallthrough behavior so that it fits
>       to our use in the kernel
>
>  (2) Add a new option -Wunreachable-code-fallthrough
>       that works like the previous -Wimplicit-fallthrough of
>       Clang <= 13.0.0
>
>
> They are separate things.
>
> Checking the presence of -Wunreachable-code-fallthrough
> does not make sense since we are only interested in (1) here.
>
>
>
> So, checking the Clang version is sensible and matches
> the explanation in the comment block.
>
>
> Moreover, using $(shell test ...) is less expensive than cc-option.
>
>
> If you want to make it even faster, you can use only
> built-in functions, like this:
>
>
> # Warn about unmarked fall-throughs in switch statement.
> # Clang prior to 14.0.0 warned on unreachable fallthroughs with
> # -Wimplicit-fallthrough, which is unacceptable due to IS_ENABLED().
> # https://bugs.llvm.org/show_bug.cgi?id=51094
> ifeq ($(firstword $(sort $(CONFIG_CLANG_VERSION) 140000)),140000)
> KBUILD_CFLAGS += -Wimplicit-fallthrough
> endif
>
>
>
> The $(sort ...) is alphabetical sort, not numeric sort.
> It works for us because the minimum Clang version is 10.0.1
> (that is CONFIG_CLANG_VERSION is always 6-digit)
>
> It will break when Clang version 100.0.0 is released.
>
> But, before that, we will raise the minimum supported clang version,
> and this conditional will go away.

I'd much rather pay the cost of cc-option to have a more precise
check; Linus is right: when I upgrade AOSP's fork of LLVM, it may not
be the fully released version of clang-14 though we have already moved
the version numbers upstream to clang-14.  I think we should strive to
prefer feature tests over version tests, which are brittle.

```
# Clang would warn about unreachable fall throughs until clang-14.
ifdef CONFIG_CC_IS_CLANG
ifneq ($(call cc-option,-Wunreachable-code-fallthrough),)
KBUILD_CFLAGS += -Wimplicit-fallthrough
endif
endif
```

Is precisely what we want.
-- 
Thanks,
~Nick Desaulniers
