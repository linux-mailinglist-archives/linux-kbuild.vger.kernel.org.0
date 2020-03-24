Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30678191A3C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 20:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgCXTn7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 15:43:59 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51609 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbgCXTn7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 15:43:59 -0400
Received: by mail-pj1-f65.google.com with SMTP id w9so11576pjh.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 12:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UMwuWt/x8/Lg/gYGKLGY8KESJf2qihGpVN/AvMGP9WM=;
        b=asti5zcyxi28k2F7jzWQqNDZhd7jAk3HIjrN+7+lNozgmuUhj2ejp/YKgjNdMHz7AU
         rozgOmx1ZrcUcvvruvJAVMB/hoG3GRUY1SrRjw2dczW3NWYbnFvgf3noCIUunm7FgFDK
         bWXwF1YShJ50ug40s4xkd8f1Gww+vUp3XyX3AezKCypjnNxpq3TIQ6zyvIhaDg2QscZE
         sNLDKUlC7xJ45ljaKpB0JCbIUe4SQbNGsyPfQpKmIq1379FCdzXp0jF8xDlGgR91ghy9
         I4semSDRHhydpmbihRT7dzkwleFViqPBodmko9HKxFsz17JpJnDbDX61Rep/3ur4Oqqe
         NBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UMwuWt/x8/Lg/gYGKLGY8KESJf2qihGpVN/AvMGP9WM=;
        b=oVkm2GNn+f4V2o4M0m6decNlGTAINi4NhzGeuf++3x9hQDMGro/bXuUvcMP9R3j8ik
         +a1WbxiWZ5wJx7CTmxbpiqqG8738sG0VqCplh8fLXFeMYC1SY0FvhSjDxtQ1ESGSf7qm
         alL9cvfVEKgJWDtNAsXMfi4In4xY/WJJ62F9shJaUHBKBvzcUj2Log5aAYa5qb24Us4q
         5pQJ7HpyYFGs7xYnUgjlaTqAsSYYx6tYFTWBzO5/Yw4Wvjx7JIvV6l7GHVWnzO7lQo8D
         VrAigvlSqvUTy/fIOo3q2eM7w7uYoGA6DvEtFCSUQXKwk+5kt14kJuNErzt0xg+3Joez
         3pRg==
X-Gm-Message-State: ANhLgQ3s/CpqTZIK/ZTFrTFhaxmaVwTaj+j+iDCgOoRSUBp/J6GZI7IV
        Y89OLV/Gv4XrqBpkd5cFslQm6fat6XobIjVHwLH6Pg==
X-Google-Smtp-Source: ADFU+vtvL1sQaYU3l4knK4Hv8fnNBDm40WQmov2Ui0KB+bXxFAzhuxGuCrTB+C8ULDqyjJFc4Lcfu8NZI33UvVjU7ZA=
X-Received: by 2002:a17:90b:8e:: with SMTP id bb14mr6067812pjb.27.1585079036745;
 Tue, 24 Mar 2020 12:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200324161507.7414-1-masahiroy@kernel.org>
In-Reply-To: <20200324161507.7414-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 12:43:46 -0700
Message-ID: <CAKwvOdkLW=Q5-vaFZDY_UOy66ZZoR7yaSd2zKv8N2Gv8PvJgYw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove AS variable
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Network Development <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Just noting that this got rolled up into a 3 patch series:
https://lore.kernel.org/lkml/CAKwvOdkjiyyt8Ju2j2O4cm1sB34rb_FTgjCRzEiXM6KL4muO_w@mail.gmail.com/T/#u

On Tue, Mar 24, 2020 at 9:15 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As commit 5ef872636ca7 ("kbuild: get rid of misleading $(AS) from
> documents") noted, we rarely use $(AS) in the kernel build.
>
> Now that the only/last user of $(AS) in drivers/net/wan/Makefile was
> converted to $(CC), $(AS) is no longer used in the build process.
>
> You can still pass in AS=clang, which is just a switch to turn on
> the LLVM integrated assembler.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 16d8271192d1..339e8c51a10b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -405,7 +405,6 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>  KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>
>  # Make variables (CC, etc...)
> -AS             = $(CROSS_COMPILE)as
>  LD             = $(CROSS_COMPILE)ld
>  CC             = $(CROSS_COMPILE)gcc
>  CPP            = $(CC) -E
> @@ -472,7 +471,7 @@ KBUILD_LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>  CLANG_FLAGS :=
>
> -export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
> +export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200324161507.7414-1-masahiroy%40kernel.org.



-- 
Thanks,
~Nick Desaulniers
