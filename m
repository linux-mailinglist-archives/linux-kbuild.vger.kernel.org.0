Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7155B1E26AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2020 18:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgEZQQo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 May 2020 12:16:44 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:41747 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgEZQQo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 12:16:44 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 04QGGSbN002250;
        Wed, 27 May 2020 01:16:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 04QGGSbN002250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590509789;
        bh=uPjRTQwS5XbBmKTVTFnwC9LPX23TTVJM7S9st4N2Cx0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F/XRqKR54cLVKukwd8/MV/+PjjWyWqs7ISl7wVH8wSoSqkggeLSyRhf2/8akLARbN
         eLoH4GWiL1e0VjucWJgx9rjfSDRyfC0P4ye2o6d2gXcsnvFrcGC2wVv4n83z+QVzZA
         cCFnfSM/tHZGytL220NBUWNCN6JqEui7tm/usrqkTIV4pLttVo7jXQjcAWK6zH5kSj
         zW3yaTmBrDmEHTtD61OQNr/+lybeYMo198EreWnp03aetTvKVTmcCvlc0/IqeeGBCl
         SbP0gRf856YYx3iu9ZZbS9KqrX6DWB4pduhbbbMxUOV5vghHqRrHMw2xMytk81WzII
         CGCi9Csa852Gw==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id b13so2676605vsm.13;
        Tue, 26 May 2020 09:16:28 -0700 (PDT)
X-Gm-Message-State: AOAM533oTKi9i4PXic8dubxEF2pBJWeObRE1MSs86E9SqgR2/J/x+Zj7
        CZmm5mJxd28Aw4nVkeX84qYpuTuJbAgMfBKqUrs=
X-Google-Smtp-Source: ABdhPJxavmIKiD1M2HJbOFH0B4qglDP86xzHproSsr1FZKQdun7AFDxHgu2+NwR7nOEZq0+9vHWqAa3EOL58nin+1Xw=
X-Received: by 2002:a05:6102:1081:: with SMTP id s1mr1529406vsr.215.1590509787468;
 Tue, 26 May 2020 09:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
 <20200521220041.87368-1-ndesaulniers@google.com> <CAK7LNARtO5Pr2nxpoORSHDFWHbjP0waOmrn_TZ+rXhmYm+TORw@mail.gmail.com>
 <CAKwvOd=qNa4fLY7ymVwvC3TwCH4DNLyEfygoTfBJ2y19xffQUg@mail.gmail.com>
In-Reply-To: <CAKwvOd=qNa4fLY7ymVwvC3TwCH4DNLyEfygoTfBJ2y19xffQUg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 27 May 2020 01:15:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNASkcLx-K+W1va9WxfxZ=7H-w65QbyBt=88dzK1NrrM_PQ@mail.gmail.com>
Message-ID: <CAK7LNASkcLx-K+W1va9WxfxZ=7H-w65QbyBt=88dzK1NrrM_PQ@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile: support compressed debug info
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        David Blaikie <blaikie@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 27, 2020 at 12:53 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Tue, May 26, 2020 at 3:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > > Suggested-by: David Blaikie <blaikie@google.com>
> > > Suggested-by: Nick Clifton <nickc@redhat.com>
> > > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Reviewed-by: Fangrui Song <maskray@google.com>
> > > Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> >
> >
> > Suggested-by seems strange to me, but
> > I decided to not be worried too much.
>
> Ah, sorry, Monday was a holiday.  I unplugged for the long weekend.
> https://en.wikipedia.org/wiki/Memorial_Day
>
> I like the suggestion to simply say "thanks to ..." in the commit
> message and will use that next time.  I was ok to send a v4 with it.


If you send v4, I will replace.

Thanks.





-- 
Best Regards
Masahiro Yamada
