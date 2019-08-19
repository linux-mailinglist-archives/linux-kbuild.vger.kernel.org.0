Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41EC994B13
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 18:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfHSQ7J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 12:59:09 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46846 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfHSQ7J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 12:59:09 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x7JGx4Gt023745;
        Tue, 20 Aug 2019 01:59:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x7JGx4Gt023745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566233944;
        bh=R7hDNBgDCcquJ88PrNFMaEESLDBuyk1JNcuZRj2NKoI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JWbgfxAlKlCcfU+ahxEwgIpPOySV/o4vcc6N+qA5uu/9hkmIw81ildxvIa598sdPQ
         TQqRKWfRHMlXsSXlur7gsItivD6yEjUUr52D2QTRJ6zu8YMGV6DDTlJ0TnYEYX4GLh
         GxzGOfxAxfKFlHLowhABJljoiQLRnVBAd8824qBRqgDgu+uKfFrfLnOIlafwgWg9ie
         TQJEn2fOkQ7Lh0LHX63F1Ff4fywZZWSJg7pYsngpV/QHLy5AL4ZkFKyA/t5lRpKjZw
         TTD4w1jUAwBTRrsZASwHhgERMdIVNFLpcH14P9LPBIEOP43Dxz/wwMNWshFm1n3tsr
         MUkPXkyxXf8yA==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id b20so1648593vso.1;
        Mon, 19 Aug 2019 09:59:04 -0700 (PDT)
X-Gm-Message-State: APjAAAV+6LCVZCSi6Ys36Jlefsltx3bweGcUlz/3itzjv2zZqslk3mZ3
        kXfYGij7IqQpu2cYfoCQje5Zxxv0hNd8ukIYRfo=
X-Google-Smtp-Source: APXvYqx4WmkIZOmlPiscofBH0qslYpRvg23rRxNe/fzapPnb+tm1NWUcox3nAeicLKTc1jNXej+U978Dlb+YMVsZiaw=
X-Received: by 2002:a05:6102:20c3:: with SMTP id i3mr14856390vsr.155.1566233943217;
 Mon, 19 Aug 2019 09:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190819105138.5053-1-yamada.masahiro@socionext.com> <20190819160920.GA108942@archlinux-threadripper>
In-Reply-To: <20190819160920.GA108942@archlinux-threadripper>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 20 Aug 2019 01:58:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDQPixBfWp8od1=13w+hcycYbyTX9+G-gqEHHwXxDCvA@mail.gmail.com>
Message-ID: <CAK7LNARDQPixBfWp8od1=13w+hcycYbyTX9+G-gqEHHwXxDCvA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: enable unused-function warnings for W= build with Clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Burton <paul.burton@mips.com>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nathan,

On Tue, Aug 20, 2019 at 1:09 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Aug 19, 2019 at 07:51:38PM +0900, Masahiro Yamada wrote:
> > GCC and Clang have different policy for -Wunused-function; GCC does
> > not report unused-function warnings at all for the functions marked
> > as 'static inline'. Clang does report unused-function warnings if they
> > are defined in source files instead of headers.
> >
> > We could use Clang for detecting unused functions, but it has been
> > suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
> > warning for unused static inline functions").
> >
> > So, we never notice left-over code if functions in .c files are
> > marked as inline.
> >
> > Let's remove __maybe_unused from the inline macro. As always, it is
> > not a good idea to sprinkle warnings for the normal build. So, these
> > warnings will be shown for the W= build.
> >
> > If you contribute to code clean-up, please run "make CC=clang W=1"
> > and check -Wunused-function warnings. You will find lots of unused
> > functions.
> >
> > Some of them are false-positives because the call-sites are disabled
> > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > unused-function warnings because it might affect the compiler's
> > optimization. When I need to fix unused-functions warnings, I prefer
> > adding #ifdef or __maybe_unused to function definitions.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> So if I understand everything correctly, this change allows us to start
> finding unused static inline functions with clang at W=1 but disables
> -Wunused-function by default... I am not sure that is a good tradeoff
> as I am pretty sure that W=1 is fairly noisy for clang although I
> haven't checked lately. I'd argue most regular developers do not build
> with W=1 meaning -Wunused-function generally will not be run with clang
> at all, missing stuff like this:


Try "git log --grep=W=1"

Some people are making efforts to fix W=1 warnings.
I believe somebody will start to remove unused static inline functions.



>
> https://lore.kernel.org/lkml/20190523010235.GA105588@archlinux-epyc/
>
> https://lore.kernel.org/lkml/1558574945-19275-1-git-send-email-skomatineni@nvidia.com/
>
> Furthermore, per the documemtation [1], -Wno-unused-function will also
> disable -Wunneeded-internal-declaration, which can help find bugs like
> commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> mlxplat_mlxcpld_msn201x_items").
>
> [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function


How about this?

KBUILD_CFLAGS += -Wno-unused-function
KBUILD_CFLAGS += -Wunneeded-internal-declaration



> Is there a way to conditionally remove __maybe_unused from the inline
> defintion so that we keep the current behavior but we can still
> selectively find potentially unused functions?

It would be possible by tweaking include/linux/compiler_types.h
but I am not a big fan of uglifying the 'inline' replacement any more.


-- 
Best Regards
Masahiro Yamada
