Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35EC8292E80
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Oct 2020 21:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731002AbgJSTaq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Oct 2020 15:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730938AbgJSTaq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Oct 2020 15:30:46 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8637DC0613D0
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2020 12:30:44 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 10so553412pfp.5
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2020 12:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EU0W4JOrAsDzHZM0eV3e2S82ZfAJTNvMxl+0MvAvfDg=;
        b=fo55FkmpDj2Wd4crXqqRBUpvhedGsQAZs0ESCJjBuDL3zYKONdan7hYDQFaCu3xvL4
         Pd0w+dTDPRCOLS1wEK6lbWHhMJVFXRIzmk0axXsy5lmZmczHwGodHywaotzBd26ID2mh
         Rk+w3lBoII+3/Al9kOh6oLl/qZORekVRmEokgc9pOeocR9Ts+DUkGSrmpDqcf6FygnRE
         XTBStEHrM5sbXsD4LKaLGQeocyFnv3mZfFbUOBtMTygMPBIGqotlHBAiqwIIHoX+A6Y3
         mu4/ptCbNp57ytRdurmXG2ll2s76//3jR9ZVtLAIgFMNSmMTugXuFlVbQOgIzQzTSxiz
         wnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EU0W4JOrAsDzHZM0eV3e2S82ZfAJTNvMxl+0MvAvfDg=;
        b=V57o12o5AtvXyNESXQ8X7V//YyfKwCINzULMC2UCAcpUJTSBwSmZO7MPTlk00QQ/c3
         k7AUhf2vYi0tiNZGkNeqAypBI6A7XqKKc1yN1iqaVMiWwfaK9yKT7hzw6VXO8bVUJVhN
         FTN9G7NKxzVIq0JyDbDbcqZR84u4NZaiyqjBshbRie7T0BODL5FkzFms924ZlF7tewhY
         tGTYCjSCj1HOBcxIXWFhoTTS+K1YvFeJRKesB6BCkU59nh44MnLwvGN6JR0OEHRLgtjX
         4yQqMV4R7I3iRfwB104oL0FmMkVaOdgRw187Vp7+D+k3heMW3FHiBz0mgQPAE9VN3lAr
         zs9w==
X-Gm-Message-State: AOAM531bchlGNQZ5Om5PsBrUJYM4uQ3lBNAhBrd5gmans3LhYAElgqi7
        x7Tu/aPcNUIWaFiEl/sfEhHhv6BAztX7OItHtvoFoA==
X-Google-Smtp-Source: ABdhPJwDXgjoOZFe5sUJ+y5bswoNcDzvWO8SoMgKBYYDcSFtvREyvztwYPGgp8ewpMupFHP/ZGUuP9U3zMq3LtWyj10=
X-Received: by 2002:a63:f74a:: with SMTP id f10mr1082418pgk.263.1603135843831;
 Mon, 19 Oct 2020 12:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201014110132.2680-1-mark@klomp.org> <20201017120135.4004-1-mark@klomp.org>
In-Reply-To: <20201017120135.4004-1-mark@klomp.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Oct 2020 12:30:32 -0700
Message-ID: <CAKwvOdnXPs7-0Q8tdDiNGAWDpT3tc6EkjhDhZLdogwokG4JhUg@mail.gmail.com>
Subject: Re: [PATCH V2] Only add -fno-var-tracking-assignments workaround for
 old GCC versions.
To:     Mark Wielaard <mark@klomp.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ian Rogers <irogers@google.com>,
        Andi Kleen <andi@firstfloor.org>,
        linux-toolchains@vger.kernel.org,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Florian Weimer <fw@deneb.enyo.de>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 17, 2020 at 5:02 AM Mark Wielaard <mark@klomp.org> wrote:
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

Thanks for adding the comment. That will help us find+remove this when
the kernel's minimum supported version of GCC advances to gcc-5.  The
current minimum supported version of GCC according to
Documentation/process/changes.rst is gcc-4.9 (so anything older is
irrelevant, and we drop support for it).  If gcc 4.9 supports
`-fno-var-tracking-assignments` (it looks like it does:
https://godbolt.org/z/oa53f5), then we should drop the `cc-option`
call, which will save us a compiler invocation for each invocation of
`make`.

> +endif
>
>  ifdef CONFIG_DEBUG_INFO
>  ifdef CONFIG_DEBUG_INFO_SPLIT
> --
> 2.18.4
>


-- 
Thanks,
~Nick Desaulniers
