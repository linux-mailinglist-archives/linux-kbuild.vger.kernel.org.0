Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E1D3EF90D
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 06:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhHRERK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 00:17:10 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54369 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhHRERK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 00:17:10 -0400
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17I4GDob010755;
        Wed, 18 Aug 2021 13:16:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17I4GDob010755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629260174;
        bh=u+KzkIZNFPABZpmtSGRCIoTvtezCpdOxcTloBpyZCGo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jwf/Bmhl1vgxqzWLTy95GIxPAoJO6cEXc6zwjl4aDPSFgIVseAjqKA5ScHKoOGBB+
         c9w/gFPH0YPtbNGDsrKfozm61Qi8i6IiswcukTWmhCZvGCZ2VCulhsbJES1g/Szf6m
         NpD0yYZ5ACR1cWLuUo9suvGPsEI4UxfdIwDpPZxckO7RiPszB15vCWDoYEMzas/bJN
         hAtq3/mSwvBet38Jn+72/5OmvON2pGPrTM6qAVrLuu4Krns0gvhoXB4e4RPaf1yQhV
         XpMPqmCO0+f5tWnbdvzyJaGZLGmvc/xFXVk0kFIiL0lS50pIi2PZEruNeJgFYYlIep
         8dkvGdG0vlPiw==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id bo18so1874505pjb.0;
        Tue, 17 Aug 2021 21:16:14 -0700 (PDT)
X-Gm-Message-State: AOAM532iGl/TSfv+ZN5st2Qyn8mizJ5dfufrZBrbIoNHH5Fmaksy0RfO
        +m8186rhMt+bzwmdfaKC6eQZmEZZmelwdNFEBgI=
X-Google-Smtp-Source: ABdhPJwRWHqQYxHOSvmBHtdtPwclwMiGtse484aWVNvPuAahWF6qXQVhoiIJ+p9VOCix6zRbsoGlYKPjYkwZKycH9L4=
X-Received: by 2002:a17:902:bc41:b029:12d:3f9b:401e with SMTP id
 t1-20020a170902bc41b029012d3f9b401emr5540904plz.47.1629260173523; Tue, 17 Aug
 2021 21:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210817005624.1455428-1-nathan@kernel.org> <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org> <202108171056.EDCE562@keescook>
 <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org> <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
 <71d76c41-7f9b-6d60-ba4f-0cd84596b457@embeddedor.com> <202108171602.159EB2C7EA@keescook>
 <72ae69b4-6069-ade5-a12b-8ee0435f803a@kernel.org>
In-Reply-To: <72ae69b4-6069-ade5-a12b-8ee0435f803a@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Aug 2021 13:15:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQW6LMnfU6reTNzDLneX+mBFSKHgbF5epQ+6GQZr7vWLQ@mail.gmail.com>
Message-ID: <CAK7LNAQW6LMnfU6reTNzDLneX+mBFSKHgbF5epQ+6GQZr7vWLQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Philip Li <philip.li@intel.com>,
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

On Wed, Aug 18, 2021 at 8:23 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 8/17/2021 4:06 PM, Kees Cook wrote:
> > On Tue, Aug 17, 2021 at 04:33:25PM -0500, Gustavo A. R. Silva wrote:
> >>
> >>
> >> On 8/17/21 16:17, Masahiro Yamada wrote:
> >>> On Wed, Aug 18, 2021 at 3:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >>>>
> >>>> On 8/17/2021 11:03 AM, Kees Cook wrote:
> >>>>> On Mon, Aug 16, 2021 at 09:55:28PM -0700, Nathan Chancellor wrote:
> >>>>>> If you/Gustavo would prefer, I can upgrade that check to
> >>>>>>
> >>>>>> ifneq ($(call cc-option, -Wunreachable-code-fallthrough),)
> >>>>>>
> >>>>>> I was just trying to save a call to the compiler, as that is more expensive
> >>>>>> than a shell test call.
> >>>>>
> >>>>> I prefer the option test -- this means no changes are needed on the
> >>>>> kernel build side if it ever finds itself backported to earlier versions
> >>>>> (and it handles the current case of "14" not meaning "absolute latest").
> >>>>>
> >>>>> More specifically, I think you want this (untested):
> >>>>
> >>>> That should work but since -Wunreachable-code-fallthrough is off by
> >>>> default, I did not really see a reason to include it in KBUILD_CFLAGS. I
> >>>> do not have a strong opinion though, your version is smaller than mine
> >>>> is so we can just go with that. I'll defer to Gustavo on it since he has
> >>>> put in all of the work cleaning up the warnings.
> >>>
> >>>
> >>>
> >>> https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
> >>>
> >>>     did two things:
> >>>
> >>>   (1) Change the -Wimplicit-fallthrough behavior so that it fits
> >>>        to our use in the kernel
> >>>
> >>>   (2) Add a new option -Wunreachable-code-fallthrough
> >>>        that works like the previous -Wimplicit-fallthrough of
> >>>        Clang <= 13.0.0
> >>>
> >>>
> >>> They are separate things.
> >>>
> >>> Checking the presence of -Wunreachable-code-fallthrough
> >>> does not make sense since we are only interested in (1) here.
> >>>
> >>> So, checking the Clang version is sensible and matches
> >>> the explanation in the comment block.
> >
> > I thought one of the problems (which is quickly draining away) that
> > needed to be solved here is that some Clang trunk builds (that report
> > as version 14) don't yet have support for -Wunreachable-code-fallthrough
> > since they aren't new enough.
>
> Philip, how often is the kernel test robot's clang version rebuilt?
> Would it be possible to bump it to latest ToT or at least
> 9ed4a94d6451046a51ef393cd62f00710820a7e8 so that we do not get bit by
> this warning when we go to enable this flag?
>
> I do not know of any other CI aside from ours that is testing with tip
> of tree clang and ours should already have a clang that includes my
> patch since it comes from apt.llvm.org.
>
> >>> # Warn about unmarked fall-throughs in switch statement.
> >>> # Clang prior to 14.0.0 warned on unreachable fallthroughs with
> >>> # -Wimplicit-fallthrough, which is unacceptable due to IS_ENABLED().
> >>> # https://bugs.llvm.org/show_bug.cgi?id=51094
> >>> ifeq ($(firstword $(sort $(CONFIG_CLANG_VERSION) 140000)),140000)
> >>> KBUILD_CFLAGS += -Wimplicit-fallthrough
> >>> endif
>
> Very clever and nifty trick! I have verified that it works for clang 13
> and 14 along with a theoretical clang 15. Gustavo, feel free to stick a


I am not the inventor of this code, though :-)

I mimicked the code in Buildroot:
https://github.com/buildroot/buildroot/blob/2021.05/Makefile#L104





-- 
Best Regards
Masahiro Yamada
