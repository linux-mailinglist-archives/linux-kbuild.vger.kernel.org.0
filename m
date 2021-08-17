Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB8A3EF4C6
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 23:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234952AbhHQVTK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 17:19:10 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:38882 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhHQVTH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 17:19:07 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17HLI1VB023215;
        Wed, 18 Aug 2021 06:18:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17HLI1VB023215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629235082;
        bh=MSI1TD6DmtwAkIL5YhYjaZlAoHhedqI42UCC2a2qlt0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ej+gNQWqtFaL08gnRNPE9wjIQ3YnQlrSvVjLVPkkcJ9wVhco8Msqn0TRgDgs4aSUI
         27TCBWrga2omz6XcBmkJGbssqJCqic/4gfn5cRdPssz5ImAh//hwK/2hsu90IESsH1
         YC/WoyH2FCry+Cm1usDXovDEWCsKr8krZHVuKojdbLvK4+90diDwFylsuxNd7/3PRq
         R49WpcTX6aAml5Za36ib/PV+Nb2Ge01+4BuwA149kTL0emNkLb+PepkPDzbEqBSuBC
         aT5BSXsdaNxIhNR6NV+LO5PWDukWZ314qonFNHuf/yd1EOuCeu2WpU77liiy79UJV9
         CDaRa7fBt3tJA==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso897004pjy.5;
        Tue, 17 Aug 2021 14:18:02 -0700 (PDT)
X-Gm-Message-State: AOAM531vdleS33HUTuvk7dTodToBS89zBBYgDz6TQapnloO+86ixn14M
        tJMzm91q6R8F2bEXxSVpvWMlmLZAvphsa5RTCn8=
X-Google-Smtp-Source: ABdhPJzkkxt/pvuzn76iFjDYxl2xUSmMhzgtkdU8/RXu5bYjwSsLA2p3r4fFrhKgTXfuz4yriNyW3rv4UMN6VdrFQAE=
X-Received: by 2002:a17:90a:7384:: with SMTP id j4mr5332691pjg.153.1629235081316;
 Tue, 17 Aug 2021 14:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210817005624.1455428-1-nathan@kernel.org> <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org> <202108171056.EDCE562@keescook>
 <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org>
In-Reply-To: <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Aug 2021 06:17:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
Message-ID: <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 3:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 8/17/2021 11:03 AM, Kees Cook wrote:
> > On Mon, Aug 16, 2021 at 09:55:28PM -0700, Nathan Chancellor wrote:
> >> If you/Gustavo would prefer, I can upgrade that check to
> >>
> >> ifneq ($(call cc-option, -Wunreachable-code-fallthrough),)
> >>
> >> I was just trying to save a call to the compiler, as that is more expensive
> >> than a shell test call.
> >
> > I prefer the option test -- this means no changes are needed on the
> > kernel build side if it ever finds itself backported to earlier versions
> > (and it handles the current case of "14" not meaning "absolute latest").
> >
> > More specifically, I think you want this (untested):
>
> That should work but since -Wunreachable-code-fallthrough is off by
> default, I did not really see a reason to include it in KBUILD_CFLAGS. I
> do not have a strong opinion though, your version is smaller than mine
> is so we can just go with that. I'll defer to Gustavo on it since he has
> put in all of the work cleaning up the warnings.



https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8

   did two things:

 (1) Change the -Wimplicit-fallthrough behavior so that it fits
      to our use in the kernel

 (2) Add a new option -Wunreachable-code-fallthrough
      that works like the previous -Wimplicit-fallthrough of
      Clang <= 13.0.0


They are separate things.

Checking the presence of -Wunreachable-code-fallthrough
does not make sense since we are only interested in (1) here.



So, checking the Clang version is sensible and matches
the explanation in the comment block.


Moreover, using $(shell test ...) is less expensive than cc-option.


If you want to make it even faster, you can use only
built-in functions, like this:


# Warn about unmarked fall-throughs in switch statement.
# Clang prior to 14.0.0 warned on unreachable fallthroughs with
# -Wimplicit-fallthrough, which is unacceptable due to IS_ENABLED().
# https://bugs.llvm.org/show_bug.cgi?id=51094
ifeq ($(firstword $(sort $(CONFIG_CLANG_VERSION) 140000)),140000)
KBUILD_CFLAGS += -Wimplicit-fallthrough
endif



The $(sort ...) is alphabetical sort, not numeric sort.
It works for us because the minimum Clang version is 10.0.1
(that is CONFIG_CLANG_VERSION is always 6-digit)

It will break when Clang version 100.0.0 is released.

But, before that, we will raise the minimum supported clang version,
and this conditional will go away.




> Cheers,
> Nathan
>
> > diff --git a/Makefile b/Makefile
> > index b5fd51e68ae9..9845ea50a368 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -859,11 +859,11 @@ KBUILD_CFLAGS += -Wno-gnu
> >   # source of a reference will be _MergedGlobals and not on of the whitelisted names.
> >   # See modpost pattern 2
> >   KBUILD_CFLAGS += -mno-global-merge
> > +# Warn about unmarked fall-throughs in switch statement only if we can also
> > +# disable the bogus unreachable code warnings.
> > +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough -Wno-unreachable-code-fallthrough,)
> >   else
> > -
> >   # Warn about unmarked fall-throughs in switch statement.
> > -# Disabled for clang while comment to attribute conversion happens and
> > -# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
> >   KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=5,)
> >   endif
> >
> >



-- 
Best Regards
Masahiro Yamada
