Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5666116FF2A
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 13:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgBZMjh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 07:39:37 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48067 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgBZMjh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 07:39:37 -0500
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01QCdFhx001003;
        Wed, 26 Feb 2020 21:39:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01QCdFhx001003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582720756;
        bh=z6qp7SEaSbOA0Cr/WUj8Kq3ma/bqB52FhxOA8N293hg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UTNmXnIoVw0zKlH35ac1AIuhM9nDCyqAadFsqaBJaSvtxQ+MhXRHLppb0g8gmVE0W
         OsJok6c7h0dd8lyuj24KrPnPITlPerl8vGIGBed7ilmJfbp1mBd+gVO2b3pxBwn61c
         VSqLzq9SC/2QU0ib87HT/sXEnDVqpKucTNPyv4jnWnj8GDTN8Mr3G258r8t/ZhbCLs
         DPeWshMZaEzWdEVhOneC5jE0D1BwJk9paQrN1W4pUoJgtykLmpECHol6yMkrtbQZD5
         V8G8U3ivRTxBePqyoSCBQzqPawo22dm9/LeB5/Nwc5a4jo6m/9TGpBArL9MP8l4kGE
         NpVmLsQeSTjCw==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id y3so911735uae.3;
        Wed, 26 Feb 2020 04:39:16 -0800 (PST)
X-Gm-Message-State: APjAAAWSbFp50xKIqlJav4m8KZH5DdeO9YG3uGXpkvvBAuzzuRIkm9ik
        gc1Be6126Jr8T2jFt3xqn9jhq5iBopK7XeahtZQ=
X-Google-Smtp-Source: APXvYqyf9xqtC1rv/ZiPRIgGKk1y4cOS41DEgTedKfb27rQDtc9qYO2Orrdk943ow2DQykNU60ao4BFPsyEk9B7aS1g=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr3785026uay.25.1582720755290;
 Wed, 26 Feb 2020 04:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <20200225210250.64366-1-ndesaulniers@google.com> <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
 <CA+icZUWcW3+9QdZcACCXP6Yun__Sm_s4+qM4rALdFf=hGBt3FQ@mail.gmail.com>
In-Reply-To: <CA+icZUWcW3+9QdZcACCXP6Yun__Sm_s4+qM4rALdFf=hGBt3FQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 Feb 2020 21:38:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQX0nFWruCgHDEkZsTKT895ahrAVQT12wuJQ_dUQtVrsg@mail.gmail.com>
Message-ID: <CAK7LNAQX0nFWruCgHDEkZsTKT895ahrAVQT12wuJQ_dUQtVrsg@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 26, 2020 at 9:26 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Feb 26, 2020 at 12:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi.
> >
> >
> > On Wed, Feb 26, 2020 at 6:02 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Added to kbuild documentation. Provides more official info on building
> > > kernels with Clang and LLVM than our wiki.
> > >
> > > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > > Changes V1 -> V2:
> > > * s/On going/ongoing/
> > > * add Randy's Suggested-by
> >
> >
> > I do not understand this tag update.
> >
> > As far as I saw the review process,
> > I do not think Randy deserves to have Suggested-by
> > because he just pointed out a typo (on going -> ongoing) :
> > https://patchwork.kernel.org/patch/11401189/#23179575
> >
> > (or, was there off-line activity I had missed?)
> >
>
> Hi Masahiro,
>
> I got some credits from Nick for a review by seeing a typo - not on a
> review of the code - and H. Peter Anvin asked why.
>
> I am not sure what is here the correct credit to give.
> Depends a "Reviewed-by" and/or "Suggested-by" on a technical review?



Documentation/process/submitting-patches.rst

  13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:

is a helpful guideline.







-- 
Best Regards
Masahiro Yamada
