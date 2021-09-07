Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E143A402E93
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Sep 2021 20:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237912AbhIGS4w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 14:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhIGS4v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 14:56:51 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B88CC061757
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Sep 2021 11:55:45 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id c6so438726ybm.10
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Sep 2021 11:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i2AA8IYk7sWif5BHJvP2n9h67eD95Nlj2o/omSM1etA=;
        b=ofXwwCmMxAb+RfZSyGPBtR293F5k2kTWAF/Y8cL9HguLjwcO2nMnY3UHBYcnh/Z7Sc
         5sLfzPVm7FSU63bFRGf17/HSOtZfRvu9ydZr9hSplNLOSA/dXGKyf4BDjyyO/55tNHQJ
         UYuQUaq4rtD06pJup2V0skki4uxEHdDXPk03Ia0imkepTIIKdv6HtAc4qs6BmQbiUkmS
         H1iz8119rok2ScFCqERvLpTsvno3Sn5G74A4IDJxjAm4jnMyIkyba3oqfSjSaxv0INzC
         Iiyh4xUOqvW1o8zQdtBE+DtTjLqBgfSZz++ttzLzghFIXgKm9p7oR4u6d03vOqzHAefT
         y8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i2AA8IYk7sWif5BHJvP2n9h67eD95Nlj2o/omSM1etA=;
        b=BpX7DJJdi6tvIhRWvXRKlFAMeR0JGsDL2NUMPvJ7vk+WWj759SrbkCAKcQ5klZ1qhL
         Vs+EsmXq9gt+pHoZmlys0ortzQ4vCcL0nAkyQm92/CplHJwu82RGseRL5Pfo9rxCRTV2
         Gky/avvMNy9MGZMTJqPiNNdfq7vfDA9kpXkanc2c/aaNTcXYdfarxXRnxU+00uOuOM55
         baQm7kWZjup94z9+4NTOnvTEslq/JH4NbayGIYGJieMxMTuwX1o+ezS9TlsHyXB+bwC6
         zLMWH6s93DEmhc02B/DPFpDX2bV8PekKnYjO2L5w0XAFgXBewxKi2YLdCxgyYCi5gynG
         Y+QQ==
X-Gm-Message-State: AOAM533HthblFKivjZjFKArXuxuHEJoxr2IqC81fIBEii0uLB9q2QbnH
        XZVIOwxX4rRjpR8vP90xa/aC9xDOOONa0QRYREtz8Q==
X-Google-Smtp-Source: ABdhPJw7UkXPEwgMJyi+dLDW51RekDyqFlG0WOYhj8wCLwuQL1bigw3N31FwnBw4qmX+09mkRYYHHqMMXKXpixgJk+s=
X-Received: by 2002:a25:bdc6:: with SMTP id g6mr24252084ybk.310.1631040944203;
 Tue, 07 Sep 2021 11:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210907183843.33028-1-ndesaulniers@google.com>
In-Reply-To: <20210907183843.33028-1-ndesaulniers@google.com>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Tue, 7 Sep 2021 11:55:32 -0700
Message-ID: <CAFP8O3Lv6zUYU_pgGpN7T7iwH47YBAeYw5+HJRQi=tDdFHxHyQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        llvm@lists.linux.dev, linux-security-module@vger.kernel.org,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 7, 2021 at 11:39 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> This reverts commit 3fe617ccafd6f5bb33c2391d6f4eeb41c1fd0151.
>
> The above commit seems as though it was merged in response to
> https://lore.kernel.org/linux-hardening/CAHk-=3Dwj4EG=3DkCOaqyPEq5VXa97ky=
UHsBpBn3DWwE91qcnDytOQ@mail.gmail.com/.
>
> While I can appreciate the intent of enabling -Werror, I don't think it
> is the right tool to address the root cause of developers not testing
> certain toolchains or configurations, or taking existing reports they're
> getting serious enough.
>
> Having more appropriate CI or processes in place to prevent untested
> patches from being merged into mainline may also be worth discussing.

I agree that -Werror by default needs more discussion.
Default WERROR makes building old kernels with new compilers more painful.

CI systems could do a better job surfacing compiler warnings if they
don't do it currently.

> I'd also like to see such a patch sent formally to the list for
> discussion and have time to soak in next rather than be merged directly
> into mainline without either.
>
> -Werror is great for preventing new errors from creeping in when a
> codebase is free of warnings for all configs and all targets and the
> toolchain is never updated. Unfortunately, none of the above is the case
> for the Linux kernel at this time.
>
> The addition of new compiler diagnostic flags in the -W group to -Wall
> make toolchain updates excessively more painful. This can lead to
> commits that disable warnings rather than work towards addressing them.
> Some diagnostics are useful but take incredible work or churn to
> completely free a codebase from them.
>
> Warning can be upgraded to errors with -Werror=3Dfoo or downgraded from
> errors back to warnings via -Wno-error=3Dfoo. -Wno-error=3Dfoo is a doubl=
e
> edged sword; it doesn't help you spot the introduction of additional
> instances of that warning easily.
>
> This change has caused nearly all of our CI to go red, and requires us
> to now disable CONFIG_WERROR until every last target and every last
> config is addressed. Rather than require everyone to disable the above
> config to keep builds going, perhaps certain CI systems should instead
> set CFLAGS_KERNEL=3D-Werror.
>
> Why don't we just fix every warning? We have been, for years, and we're
> still not done yet. See our issue tracker below, contributors wanted.
>
> With more time/active discussion, we can probably land something more
> appropriate. It should involve the Kbuild maintainer and list.
>
> For instance, I have questions around how should such a config interact
> with randconfigs and allconfigs. This config also seems to duplicate the
> existing CONFIG_PPC_DISABLE_WERROR without merging the two.
>
> I do recognize the irony of someone who's spent a lot of time cleaning
> up warnings to be advocating for disabling -Werror...it's not lost on
> me. Our Pixel (n=C3=A9e Nexus) team has been effectively carrying an out =
of
> tree patch enabling -Werror since before I ever contributed to the
> kernel.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1449
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile     |  3 ---
>  init/Kconfig | 14 --------------
>  2 files changed, 17 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d45fc2edf186..6bc1c5b17a62 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -785,9 +785,6 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      :=
=3D -fstack-protector-strong
>
>  KBUILD_CFLAGS +=3D $(stackp-flags-y)
>
> -KBUILD_CFLAGS-$(CONFIG_WERROR) +=3D -Werror
> -KBUILD_CFLAGS +=3D $(KBUILD_CFLAGS-y)
> -
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CPPFLAGS +=3D -Qunused-arguments
>  # The kernel builds with '-std=3Dgnu89' so use of GNU extensions is acce=
ptable.
> diff --git a/init/Kconfig b/init/Kconfig
> index 8cb97f141b70..e708180e9a59 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -137,20 +137,6 @@ config COMPILE_TEST
>           here. If you are a user/distributor, say N here to exclude usel=
ess
>           drivers to be distributed.
>
> -config WERROR
> -       bool "Compile the kernel with warnings as errors"
> -       default y
> -       help
> -         A kernel build should not cause any compiler warnings, and this
> -         enables the '-Werror' flag to enforce that rule by default.
> -
> -         However, if you have a new (or very old) compiler with odd and
> -         unusual warnings, or you have some architecture with problems,
> -         you may need to disable this config option in order to
> -         successfully build the kernel.
> -
> -         If in doubt, say Y.
> -
>  config UAPI_HEADER_TEST
>         bool "Compile test UAPI headers"
>         depends on HEADERS_INSTALL && CC_CAN_LINK
>
> base-commit: 4b93c544e90e2b28326182d31ee008eb80e02074
> --
> 2.33.0.153.gba50c8fa24-goog
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
