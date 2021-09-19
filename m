Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4584741091C
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Sep 2021 04:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhISCEX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 Sep 2021 22:04:23 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30422 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhISCEF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Sep 2021 22:04:05 -0400
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 18J22EkM018406;
        Sun, 19 Sep 2021 11:02:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 18J22EkM018406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632016935;
        bh=VqZM/S++/961bT3iqEcU4Nq8VDDaawzzm/jisNoSgow=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NandBl9/LYCSjX8qyEXsPUdhS/nrzNT1t44a9eKdBDkKGxB53WcOTBqdRgL6w3COJ
         IJzvoVHFW+tX2xny9ZiM+t+lUOYD73jAo20MR50DGC3GgwMbJfycpbJHikU8OZKK00
         hf3g1tpZ1PBnH5faS1KGxqGaJy2DU9YFARB43WZv4V6eB0JhzZEpLPicw5i/siD8Za
         3ekfxPa1aoz6djw+k07Wf6iZ4QZn5mr7xjBHLTA1tIHUqfKmX9uONNv0defhu8umlA
         gDQt61L2wMz+3xntJiJCLUJE0Lo46XeVLgsnLaEvWoHmG3APtwVtfxWCdub6UE2O8+
         vxJ2wpGHZkKPA==
X-Nifty-SrcIP: [209.85.216.46]
Received: by mail-pj1-f46.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so12721985pjc.3;
        Sat, 18 Sep 2021 19:02:15 -0700 (PDT)
X-Gm-Message-State: AOAM532Eo6mcMZD56d1POe8zI2oV/ScvoUeXHrfDKHGFFA5PgTxGMY7G
        8+w6+i8aY6AS+t/HvosYy59pah94XFEcMMDtORw=
X-Google-Smtp-Source: ABdhPJwWvGV7ovGk9qEOpyXz7Kvcfm9vWIeAHvxgCqmPjM2G9sxLxnggbok97kOnT2oy9/RKHQIph5YC1FnmzPNUbvM=
X-Received: by 2002:a17:902:e04d:b0:13a:70c9:11b8 with SMTP id
 x13-20020a170902e04d00b0013a70c911b8mr16018399plx.82.1632016934585; Sat, 18
 Sep 2021 19:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210916184017.1881473-1-nathan@kernel.org> <20210916184017.1881473-3-nathan@kernel.org>
In-Reply-To: <20210916184017.1881473-3-nathan@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 19 Sep 2021 11:01:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvjeaGVEMBfnr-8FEYJwV3uLe9U7VwPrHbyfo+ByKNBw@mail.gmail.com>
Message-ID: <CAK7LNAQvjeaGVEMBfnr-8FEYJwV3uLe9U7VwPrHbyfo+ByKNBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: Add -Werror=ignored-optimization-argument
 to CLANG_FLAGS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 17, 2021 at 3:42 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Similar to commit 589834b3a009 ("kbuild: Add
> -Werror=unknown-warning-option to CLANG_FLAGS").
>
> Clang ignores certain GCC flags that it has not implemented, only
> emitting a warning:
>
> $ echo | clang -fsyntax-only -falign-jumps -x c -
> clang-14: warning: optimization flag '-falign-jumps' is not supported
> [-Wignored-optimization-argument]
>
> When one of these flags gets added to KBUILD_CFLAGS unconditionally, all
> subsequent cc-{disable-warning,option} calls fail because -Werror was
> added to these invocations to turn the above warning and the equivalent
> -W flag warning into errors.
>
> To catch the presence of these flags earlier, turn
> -Wignored-optimization-argument into an error so that the flags can
> either be implemented or ignored via cc-option and there are no more
> weird errors.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Applied to linux-kbuild. Thanks.



>  scripts/Makefile.clang | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 4cce8fd0779c..51fc23e2e9e5 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -29,7 +29,12 @@ CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  else
>  CLANG_FLAGS    += -fintegrated-as
>  endif
> +# By default, clang only warns when it encounters an unknown warning flag or
> +# certain optimization flags it knows it has not implemented.
> +# Make it behave more like gcc by erroring when these flags are encountered
> +# so they can be implemented or wrapped in cc-option.
>  CLANG_FLAGS    += -Werror=unknown-warning-option
> +CLANG_FLAGS    += -Werror=ignored-optimization-argument
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> --
> 2.33.0
>


-- 
Best Regards
Masahiro Yamada
