Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F81B3118DF
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 03:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhBFCs5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 21:48:57 -0500
Received: from condef-05.nifty.com ([202.248.20.70]:64831 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbhBFCkf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 21:40:35 -0500
X-Greylist: delayed 439 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Feb 2021 21:40:27 EST
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-05.nifty.com with ESMTP id 1161oMY8006119;
        Sat, 6 Feb 2021 10:50:22 +0900
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1161nRBC018896;
        Sat, 6 Feb 2021 10:49:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1161nRBC018896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612576168;
        bh=gpqQwaTvQcIqHtmt2nFODRlCdmq9NF34DAVw/eO4LAI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xYLjqAKAFhZ7L8wWrUHU+f+rp9RE+9j96zr5TzdVyUtlVyPZKa57vlv/nGOhe06Jd
         u/2vChzUiemzJAIZRtihqPnysW5SVDOQlF8yJovsKbm0ZFQh2R7qmbJ2rS7Az7orN3
         ImD6agICIWZISkrkJXFjxEg44/z6+pvesHPTTglDuaSuD4yOKOpj4wR6H5RLBUCWH/
         iES7fa+4xRyExlCyJnvDd5q0DNskyqMNxuYoV5OJJGFuYXBe2j0kxaCPiymDLoFNIY
         STUAG51U3uW6vtSG6J4OFNGbUn0W02b4R+QX91NlLVqt6FoofQslICCAs8ROSMeT1u
         mq/81Sum/A+vw==
X-Nifty-SrcIP: [209.85.215.173]
Received: by mail-pg1-f173.google.com with SMTP id r38so5757555pgk.13;
        Fri, 05 Feb 2021 17:49:27 -0800 (PST)
X-Gm-Message-State: AOAM532VwZVWFDxm/lTTN05yzODKa8kB932pzg7Fnt63m16X0MZbTWVR
        sL8A69u5rMUndSh7wAKf3KBbryTyzdDmViB7huo=
X-Google-Smtp-Source: ABdhPJzY87ngLMxF79uzibs1VF2FhW8F8uzZsWLUNAu8V4Bgg5khj0mUN7eHENn7VCuiLIGBtO6iBpmDzuYnFLO/Tlg=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr7335315pgi.175.1612576167170;
 Fri, 05 Feb 2021 17:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20210205220125.2931504-1-ndesaulniers@google.com>
In-Reply-To: <20210205220125.2931504-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Feb 2021 10:48:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKHvjTcnic=ZKntH3NY5meehQbJuBr34y9_tn8b-Ym0w@mail.gmail.com>
Message-ID: <CAK7LNARKHvjTcnic=ZKntH3NY5meehQbJuBr34y9_tn8b-Ym0w@mail.gmail.com>
Subject: Re: [PATCH] Makefile: reuse CC_VERSION_TEXT
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 6, 2021 at 7:01 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> I noticed we're invoking $(CC) via $(shell) more than once to check the
> version.  Let's reuse the first string captured in $CC_VERSION_TEXT.
>
> Fixes: 315bab4e972d ("kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE")


I did not touch this hunk because I have a plan
for different refactoring, but I have never got
around to do it.

Anyway, you beat me, and I will pick this up.
But, the Fixes tag is questionable because
this is code refactoring.




> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a85535eb6a7d..70034d7c1051 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -557,7 +557,13 @@ ifdef building_out_of_srctree
>         { echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
>  endif
>
> -ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> +# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> +# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> +# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> +# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> +CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
> +
> +ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> @@ -576,12 +582,6 @@ KBUILD_AFLAGS      += $(CLANG_FLAGS)
>  export CLANG_FLAGS
>  endif
>
> -# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> -# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> -# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> -# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> -CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
> -
>  ifdef config-build
>  # ===========================================================================
>  # *config targets only - make sure prerequisites are updated, and descend
> --
> 2.30.0.478.g8a0d178c01-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210205220125.2931504-1-ndesaulniers%40google.com.



-- 
Best Regards
Masahiro Yamada
