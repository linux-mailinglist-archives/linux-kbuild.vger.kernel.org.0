Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB08C293F8F
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Oct 2020 17:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731652AbgJTP2r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Oct 2020 11:28:47 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52160 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731618AbgJTP2q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Oct 2020 11:28:46 -0400
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 09KFSUwW006246;
        Wed, 21 Oct 2020 00:28:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 09KFSUwW006246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603207711;
        bh=fLFRzEvvNzfFsNVp4IIsqKfXSgcuY+m+zTzeT0OEPHc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pzCyoBVn02DG7/NlIu2Y7SoRNq6iGpFJIufs6FxVWD9sz0hgWqeK9BM66FNBVDurh
         Azk7xWTbIA+9YlHk6UI6O5g1DEWB5i4KhSsRYf7HhA/r26zNO2Pv291LEdlZJfsyBM
         +90XRWhSzARfHhCaQ9rHFHPeZ0QbFdYjtfrvd5djqPGis51zgaGi9RvBNUbJCnT7kv
         J4vC0sVX+6LKapQ4pG4ovQTgq0+dCZB5yMW+K1j3TF+90CULVPAKP4rYXgY2hHTzr1
         dqbyo7h2P+M7bpsRhE/LeTVF943yazbz2kGccPIE5mkOhk2348c1+eHqWH5lI/ZKW7
         dhBMjm8b9Fjiw==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id b23so1297500pgb.3;
        Tue, 20 Oct 2020 08:28:30 -0700 (PDT)
X-Gm-Message-State: AOAM531pgIzzfxcais/kbB852twjqXfCr5XVYvktCHoZD+kFmMNRm1NG
        vfxddVgSs4pk3MPitrvtqOV8SvoB4RvEaFBHXss=
X-Google-Smtp-Source: ABdhPJwv00rwCOxn6r3kEx5Nwh11Wij9Tdiv85e+WfZh6WfKUKKNqrY8psass3JjliDhHTNcnc5iXw64s1fBklyCJOo=
X-Received: by 2002:aa7:90cf:0:b029:156:2bff:5a87 with SMTP id
 k15-20020aa790cf0000b02901562bff5a87mr3233217pfk.63.1603207709884; Tue, 20
 Oct 2020 08:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201014110132.2680-1-mark@klomp.org> <20201017120135.4004-1-mark@klomp.org>
In-Reply-To: <20201017120135.4004-1-mark@klomp.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 21 Oct 2020 00:27:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATi5X_UjeEwP_+BJETOoVHZTxdh3e=e2SJZbvH69MHM+g@mail.gmail.com>
Message-ID: <CAK7LNATi5X_UjeEwP_+BJETOoVHZTxdh3e=e2SJZbvH69MHM+g@mail.gmail.com>
Subject: Re: [PATCH V2] Only add -fno-var-tracking-assignments workaround for
 old GCC versions.
To:     Mark Wielaard <mark@klomp.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ian Rogers <irogers@google.com>,
        Andi Kleen <andi@firstfloor.org>,
        linux-toolchains@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Florian Weimer <fw@deneb.enyo.de>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 17, 2020 at 9:02 PM Mark Wielaard <mark@klomp.org> wrote:
>
> Some old GCC versions between 4.5.0 and 4.9.1 might miscompile code
> with -fvar-tracking-assingments (which is enabled by default with -g -O2).
> commit 2062afb4f added -fno-var-tracking-assignments unconditionally to
> work around this. But newer versions of GCC no longer have this bug, so
> only add it for versions of GCC before 5.0. This allows various tools
> such as a perf probe or gdb debuggers or systemtap to resolve variable
> locations using dwarf locations in more code.
>
> Changes in V2:
> - Update commit message explaining purpose.
> - Explicitly mention GCC version in comment.
> - Wrap workaround in ifdef CONFIG_CC_IS_GCC
>
> Signed-off-by: Mark Wielaard <mark@klomp.org>
> Acked-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Andi Kleen <andi@firstfloor.org>
> Cc: linux-toolchains@vger.kernel.org
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Cc: Florian Weimer <fw@deneb.enyo.de>
> Cc: Sedat Dilek <sedat.dilek@gmail.com>
> ---

Applied to linux-kbuild. Thanks.



>  Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 51540b291738..964754b4cedf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -813,7 +813,11 @@ KBUILD_CFLAGS      += -ftrivial-auto-var-init=zero
>  KBUILD_CFLAGS  += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
>  endif
>
> -DEBUG_CFLAGS   := $(call cc-option, -fno-var-tracking-assignments)
> +# Workaround for GCC versions < 5.0
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
> +ifdef CONFIG_CC_IS_GCC
> +DEBUG_CFLAGS   := $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> +endif
>
>  ifdef CONFIG_DEBUG_INFO
>  ifdef CONFIG_DEBUG_INFO_SPLIT
> --
> 2.18.4
>


-- 
Best Regards
Masahiro Yamada
