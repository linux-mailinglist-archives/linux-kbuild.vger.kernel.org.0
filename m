Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4DDA219117
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 22:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgGHUBI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 16:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgGHUBH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 16:01:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15892C061A0B;
        Wed,  8 Jul 2020 13:01:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id s26so6798741pfm.4;
        Wed, 08 Jul 2020 13:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ToVQ5jnkfZO4cOvrMVw/H9BXTF3xW5Rfd911FLp9ico=;
        b=kZ8r90rckl0NlrYmrKQUzD7195fxWcl6FsDYLaiWSm+kJpqCHhhnvjqYyNVeTBypFy
         a1hmy5bXHYVEgHLj8tGPNhfaDLMTyzxL9RDrlmnhDwvz84kvtwDbsT/6En2qYvZ3BIjl
         eIN50Nsw40HHfUC6h2MhCGX8TIe7SysD3qIhJX2fjSCX5WxAq4FsSw5a4RKPifAHLmai
         9kysYE6+IxYYiUc53bdKJWZx+Nljg/gr7LYasG0kUbsVlLils+EMZI1vli3eKqZk2XnA
         0hx1JsOUPuxkwz80IYqU/FrDb/Zi63jMefNA5hwZpZuZAl/X2uaaJD5YLcZBFCHh5jNk
         D7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ToVQ5jnkfZO4cOvrMVw/H9BXTF3xW5Rfd911FLp9ico=;
        b=CgucVkimv6AP7yxb8DG5gQmIFEufIASeDuRU26mE0frBglQI+7/0HsfxxJxirdFNEt
         Zl2/t7wO7gnGJHg3lUi4Pzjmr8Za+hNDw82gLXIHaLKJHmDHFnhX6Smae5JkE89IHmqz
         /J+a8ny9/1AN89GcpppwzULesR/x0DgO5ecroLzt5JbXJOxkA6acJDTJ5s1OKLYJxONw
         DMVmH5IDJ2e/KtYWrnFnuiUraILjok182DhxHVB+6uH10gD3lQS9bvvQsZX6q7zb0yEL
         axdAQ5sbCMXj6dxR8m+Uf26EeEUc+RabqoPpUEeDeiOn9nr1CiZiD3yWr+ZiV+3QvAvD
         xq8A==
X-Gm-Message-State: AOAM533n+FMWWhdf9vtUvX46fBdudjExP35ATZxwb1hU5wOiBeu5EzIr
        HlzwC5olgjzD8DcU/Zl4He1XtsUPnaQ/cBHZ3xM=
X-Google-Smtp-Source: ABdhPJyK38F+wgnctkrrB+nr3gsimZfQjgyvXOlUwuiutIHYJ0mNmVzLBopyqSrYFyAUZpSzmXllHuyMrGx/71R9Atc=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr44326488pgn.4.1594238466508;
 Wed, 08 Jul 2020 13:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com>
 <20200708190756.16810-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20200708190756.16810-1-rikard.falkeborn@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 23:00:50 +0300
Message-ID: <CAHp75VeA1GGvaxyzraWOO-4zQNC3sbcawsYwWXCNBWavtZGBuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Move -Wtype-limits to W=2
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kees Cook <keescook@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>,
        mm-commits@vger.kernel.org,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 8, 2020 at 10:08 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
>
> -Wtype-limits is included in -Wextra which is added at W=1. It warns
> (among other things) that 'comparison of an unsigned variable `< 0` is
> always false. This causes noisy warnings, especially when used in
> macros, hence it is more suitable for W=2.
>

Suggested-by: Arnd ?

LGTM!

> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
> See also discussion at https://lore.kernel.org/lkml/CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com/
>
>  scripts/Makefile.extrawarn | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 4aea7cf71d11..62c275685b75 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -35,6 +35,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
>  # The following turn off the warnings enabled by -Wextra
>  KBUILD_CFLAGS += -Wno-missing-field-initializers
>  KBUILD_CFLAGS += -Wno-sign-compare
> +KBUILD_CFLAGS += -Wno-type-limits
>
>  KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
>
> @@ -66,6 +67,7 @@ KBUILD_CFLAGS += -Wshadow
>  KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
>  KBUILD_CFLAGS += -Wmissing-field-initializers
>  KBUILD_CFLAGS += -Wsign-compare
> +KBUILD_CFLAGS += -Wtype-limits
>  KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
>  KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
>
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
