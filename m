Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197DC20E354
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390606AbgF2VNI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730134AbgF2S5n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:57:43 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65F7C031C5A
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jun 2020 10:39:07 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y18so7372897plr.4
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jun 2020 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymZPYXlQnFHAh4p3MfqCbK0ew51uYtV97Wu+f+eSAbk=;
        b=eWpyylI85AglLaoIbXKzgT6INWjE87+tmdZZnx1ZJBJZGzUDo44tIyHwfSnXs9UAnK
         GFO1nStX3pLJCvkUKDiYfLpuvRhlsZ50stz4D6ueFL6OC2H6TDM/KPyeHnDlp1F4dyYZ
         IoUn4Q9g2K4c/FroVZbyT4tTwtB454OK2eUFxaTQGLxVezqM6fXAdeHPWgBj2kMU731k
         b5Hv5ZIT9nSInEuw34rqU43ogvIy8wuX7a3v6Q4gFbiuD/Cpp7M1UoZbHpUtqh53dw7M
         2VDEuwXMia3oKnJXpCt6D3LJUPa9OLIUbKUCXcCIebNSTZ3vFPexaa6WyhOzf7G5cR/T
         EUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymZPYXlQnFHAh4p3MfqCbK0ew51uYtV97Wu+f+eSAbk=;
        b=NA01KaIsZdq9CmHCQOnWHuhvXrw7P2kwZe38Jv2FqnfyH7YWUqRsX7+Z0oni2Dzxw1
         mZYiQZF7d5Do4va3SojFLYhxdWzRJsSjY45fVq+9okYEt1zl98ObC5/wGcIvV5g0qXpL
         n5zWBzUuffZMrCyFnv1X8wfXdeSd6og/foa8rWYATvaMmmsAm2MElk6Wf7Rcyi/zB5Hj
         0//qj6+HOyuYwlCQdtAYInSwU5+vuCLdfzOTfEdDMG8ABS4PEJdRxl7jdPEQ+EbEQqNN
         xRJbrURTJOyYba7gvIMhUe+9/zzvZHA7dos5lmkLuBY717Rgn2FHKnd7QJVs+P/Po+bz
         xJeQ==
X-Gm-Message-State: AOAM533aIHAnFM//gl0MoVg2Cv7/2sO3xmwT1VHOH02l5pZ/CMO8JOuN
        CWtM//K8Nr88itz8wrsf8nP9cqRUxh+ojXbhWtloFa69BJk=
X-Google-Smtp-Source: ABdhPJx7WdyCIxUBawfx7KsliaWmLRKCViWely/imMPZEbhEYUYv0E0W0mfsBENNOc2Iz6VkBFm7Y7EZ+oiIH0Zwjfw=
X-Received: by 2002:a17:902:7208:: with SMTP id ba8mr14269978plb.179.1593452347063;
 Mon, 29 Jun 2020 10:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200629085911.1676554-1-masahiroy@kernel.org>
In-Reply-To: <20200629085911.1676554-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 29 Jun 2020 10:38:56 -0700
Message-ID: <CAKwvOd=qe5KE1vdUYQmpsW2zmDbk5i-MgRujs9B7wqnAj+af0w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make Clang build userprogs for target architecture
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 29, 2020 at 1:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Programs added 'userprogs' should be compiled for the target
> architecture i.e. the same architecture as the kernel.
>
> GCC does this correctly since the target architecture is implied
> by the toolchain prefix.
>
> Clang builds standalone programs always for the host architecture
> because the target triple is currently missing.
>
> Fix this.
>
> Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")

This is a neat feature I didn't know about; looks relatively new.
What's the test case command line invocation to test this with Clang?

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 73948798ce3f..cac29cc2ec25 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -970,8 +970,8 @@ LDFLAGS_vmlinux     += --pack-dyn-relocs=relr
>  endif
>
>  # Align the bit size of userspace programs with the kernel
> -KBUILD_USERCFLAGS  += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> -KBUILD_USERLDFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> +KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> +KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))

That should be fine.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
https://www.gnu.org/software/make/manual/html_node/Text-Functions.html

>
>  # make the checker run with the right architecture
>  CHECKFLAGS += --arch=$(ARCH)
> --


-- 
Thanks,
~Nick Desaulniers
