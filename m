Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECAC279126
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Sep 2020 20:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgIYSw4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Sep 2020 14:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgIYSw4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Sep 2020 14:52:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79036C0613D4
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2020 11:52:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id y14so3328723pgf.12
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2020 11:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZgS7XDEsT9SMTtkEmVVEM4fmyQz20jTcKbyopJIbVnw=;
        b=i45TaUrxjWnjsCtpXFgjDDNUxvfhpASIJqWcjzD+jnQ+4XKmPLT8dYlHXa0G1ua5T3
         +bxWGE2GyWu6o5ZmPkCP3rn5jVAIdkjCaXm45P8lmPCQl1oUZeIkYNsGsIuIsvyI+GvM
         HId4R+rb4bosAqQnZBEv1OZVlpQTmnnhOGdeL2LRcac1fg/0ZrZKiBHZMEwbJ/S8UvTX
         SdwNNi9x+sm/yeJC7NuuPZHnSQHotIqPENQYFpKNirxSEcP8bWF0IzP82bAWnhpPW4WV
         1ZkMd453i1dNh4WRKPjDcjwmauPQsOkCXbqgaLYhpWFPbWF0za6aHKcWSCX20fLpuBP4
         HZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZgS7XDEsT9SMTtkEmVVEM4fmyQz20jTcKbyopJIbVnw=;
        b=UBsca/udqcWhAIFFpHRRjUjeYeRtaDpt0uL/i02A+Yz2N8hC5icmipbBMgHQeVNy5T
         92seXTWM+R1HwmXR/dOEzLQo5RrcyTcybEc3Gv39N9k23B0wCcjYXIecJMijUqbh1GEo
         RO15wHIQmAUMSo+GSMmmLal0shrhFaniQJiHEjs24mUT0OSXL0EK3HvAW2psC4JuxbTl
         b1dC07H1lD6EDMPm9gASFbbmZbysrBMDvrBRhNnvQHtW7ItHIq56KprEv6YAE5BO2blG
         xE58tHK8GTgxyHi/sfO8mdqe9FCbwWXmBZA6mwdAnuI7AVAPZN0Kgb0DHkBdRDOft6Qh
         ugvg==
X-Gm-Message-State: AOAM53349IrUp1cAkdwoeODgOEN7Qw21AOVBBt1Dj89+SEIaYZGzfvCa
        J8wzgzcVLpXN5QMmn/cVm54AepGhe3HbqePtOZ5STQ==
X-Google-Smtp-Source: ABdhPJy+MEhEaLmhJqtkWqku+8YPx5qhAdu39H1TNZDPwP4dsq+Y9vk7jXDi9d2KcOuNMczaA9kdzk4W0jK/+c1Xo0A=
X-Received: by 2002:a17:902:ed11:b029:d1:f385:f4e7 with SMTP id
 b17-20020a170902ed11b02900d1f385f4e7mr758865pld.56.1601059975629; Fri, 25 Sep
 2020 11:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200925152121.20527-1-f.fainelli@gmail.com>
In-Reply-To: <20200925152121.20527-1-f.fainelli@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 25 Sep 2020 11:52:44 -0700
Message-ID: <CAKwvOdmxkwA7NPSj-bSarurjWc7Vs2vzuT3PnaCJhA00pRWyYA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Fix clang target examples
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "open list:CLANG/LLVM BUILD SUPPORT" 
        <clang-built-linux@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 25, 2020 at 8:21 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> clang --target=<triple> is how we can specify a particular toolchain
> triple to be use, fix the two occurences in the documentation.

Ah right, my mistake.  It's either double dash+equals, or single
dash+space.  Thanks for the patch.  Masahiro, would you mind picking
this up?

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/kbuild/llvm.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 334df758dce3..dae90c21aed3 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -39,10 +39,10 @@ which can help simplify cross compiling. ::
>         ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
>
>  ``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
> -``CROSS_COMPILE`` is used to set a command line flag: ``--target <triple>``. For
> +``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
>  example: ::
>
> -       clang --target aarch64-linux-gnu foo.c
> +       clang --target=aarch64-linux-gnu foo.c
>
>  LLVM Utilities
>  --------------
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
