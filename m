Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01DF26529C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 23:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgIJVVV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 17:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731123AbgIJOYc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 10:24:32 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D33C0617A9
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2020 07:12:14 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id c10so5425962otm.13
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2020 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kcGVZn8a+TssCx5V7/oWyKJ/qM6HLG6mmAZ+V9sySx8=;
        b=c/e5qR7LPEjderXek+U3xgTpgL77Qrfecxnb6dt5fDoSQpfDhVsU5hfdVc/DB8V8e5
         rt4nLO3Hk3YaGq0en00R7yN6TLbP6H2kZO7HEXL9nS7++wkphfursXDVygtlT1GWEmot
         gehKBV+biiux876gKHzHTwMIX+zkCmuMD7eH0RZigPBf+MqU+nFiCMBZSYGZmY+tVJlF
         aqt9xW4BOX61FwxN0R4Abz0tI0uYLlnkoi88XvNZYWL30aI7hlWeoI0Tl7TZC1f2ffYb
         8qtU+itM2eSEB4zMZqI0PBK+i5O6AK7DfNiUX5UoXj0lNiWI6RolOOFuyDzd6eHRvDQL
         7Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcGVZn8a+TssCx5V7/oWyKJ/qM6HLG6mmAZ+V9sySx8=;
        b=piHPFhS91lfxwrlNDICXI3HBM5VQnpvgKm5axHRB3zIp5NZEswviP86CK8raNQh4tH
         RVUEHZ1DuhVsW10yV0CBELaslrNW28S/SUZQWkTk+rdqb3xDjweSZogvYEKk764ZgOJe
         rcaKFbW5RWZU9f3HdR5uNRnoqWFicQ2A8V/FwCa6GiWVabaRYZ44o1idflLgHALtA5xj
         CZ9GlkIOXHDfhFpyj4HKW6n7R4wOjjSL6lm4lhyVRH9oXKItElqHPD20PO3ccX8i7B2i
         0rFlYU4aHWFek1dThxgcvOD0C/mhNfO99Zr3MDHgouUMHA/ZHntVU6QsmeoCKUWmVxMv
         Ho7w==
X-Gm-Message-State: AOAM532FvAoBP+woBNOskeg0qnxXqBHPbdd+8IQT1K33g8HT0I6ljNut
        bO7nbf36Cv/kQvzG8jQl5efWINGJ9y24m1n0rlIpww==
X-Google-Smtp-Source: ABdhPJw7bnzACBKvQQq7Sx1WBZDpFErocDIwp99VDe4AkTzqzXQ/WOsYfl6eSj9iXfz0s4IZ91iUT0l3c91VSUowd1A=
X-Received: by 2002:a9d:3da1:: with SMTP id l30mr4255115otc.233.1599747133357;
 Thu, 10 Sep 2020 07:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200910134429.3525408-1-masahiroy@kernel.org> <20200910134429.3525408-2-masahiroy@kernel.org>
In-Reply-To: <20200910134429.3525408-2-masahiroy@kernel.org>
From:   Marco Elver <elver@google.com>
Date:   Thu, 10 Sep 2020 16:12:01 +0200
Message-ID: <CANpmjNOcpNLe3T-Qf1gVkqxpLCPQ+yjJZ0wM79jCUrmet_QH0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: move CFLAGS_{KASAN,UBSAN,KCSAN} exports to
 relevant Makefiles
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kasan-dev <kasan-dev@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 10 Sep 2020 at 15:45, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Move CFLAGS_KASAN*, CFLAGS_UBSAN, CFLAGS_KCSAN to Makefile.kasan,
> Makefile.ubsan, Makefile.kcsan, respectively.
>
> This commit also avoids the same -fsanitize=* flags being added to
> CFLAGS_UBSAN multiple times.
>
> Prior to this commit, the ubsan flags were appended by the '+='
> operator, without any initialization. Some build targets such as
> 'make bindeb-pkg' recurses to the top Makefile, and ended up with
> adding the same flags to CFLAGS_UBSAN twice.
>
> Clear CFLAGS_UBSAN with ':=' to make it a simply expanded variable.
> This is better than a recursively expanded variable, which evaluates
> $(call cc-option, ...) multiple times before Kbuild starts descending
> to subdirectories.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile               | 1 -
>  scripts/Makefile.kasan | 2 ++
>  scripts/Makefile.kcsan | 2 +-
>  scripts/Makefile.ubsan | 3 +++
>  4 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ec2330ce0fc5..4b5a305e30d2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -517,7 +517,6 @@ export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
>  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> -export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE CFLAGS_UBSAN CFLAGS_KCSAN
>  export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
>  export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
>  export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 1532f1a41a8f..1e000cc2e7b4 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -47,3 +47,5 @@ CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
>                 $(instrumentation_flags)
>
>  endif # CONFIG_KASAN_SW_TAGS
> +
> +export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
> diff --git a/scripts/Makefile.kcsan b/scripts/Makefile.kcsan
> index c50f27b3ac56..cec50d74e0d0 100644
> --- a/scripts/Makefile.kcsan
> +++ b/scripts/Makefile.kcsan
> @@ -9,7 +9,7 @@ endif
>
>  # Keep most options here optional, to allow enabling more compilers if absence
>  # of some options does not break KCSAN nor causes false positive reports.
> -CFLAGS_KCSAN := -fsanitize=thread \
> +export CFLAGS_KCSAN := -fsanitize=thread \
>         $(call cc-option,$(call cc-param,tsan-instrument-func-entry-exit=0) -fno-optimize-sibling-calls) \
>         $(call cc-option,$(call cc-param,tsan-instrument-read-before-write=1)) \
>         $(call cc-param,tsan-distinguish-volatile=1)

This doesn't apply to -next, which has some KCSAN changes for the next
merge window. Although it seems git-merge figures out the resolution
for the conflict automatically.

Other than that,

Acked-by: Marco Elver <elver@google.com>

Thank you!

> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 27348029b2b8..c661484ee01f 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> +
> +export CFLAGS_UBSAN :=
> +
>  ifdef CONFIG_UBSAN_ALIGNMENT
>        CFLAGS_UBSAN += $(call cc-option, -fsanitize=alignment)
>  endif
> --
> 2.25.1
>
