Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514BE624F7D
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Nov 2022 02:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbiKKBXk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 20:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiKKBXk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 20:23:40 -0500
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D526168
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 17:23:37 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 2AB1NIlB008863
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Nov 2022 10:23:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 2AB1NIlB008863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1668129798;
        bh=gnUe+x8XiIYQcBXhwR3cr2G4OhlpnWneN0Mim5th8XM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SNXhCvh9/mg5JwNsUCm0rBPxiI7M2Pz2DUhTNcSCLwLzmfPlrAqJQ8J1iDBW5ITEW
         TtMNRJ2n5dAbxPBLNFslIqdHHqEjsVInIp8EoXmpQYKtmvaHmMil9KmnFcaiQhSXGa
         madGWg67JDXy5ZH/Og9xah+b1S+82C9c0IjWfYH+JwmcfWmxuGGofm1sAbmVxTLuTB
         OZlejwWORZaHdHKwtL5t2StcGp5TSDg6u2AQmPsjsu4aY9bCZ/tWvAQbkTbc/Ybr4l
         wBXHWDl6FElqMxJejHj6tsN/sMWx2RL7APpMLG526cjLHbJFmgy3NGshvFFlPnvfQZ
         hauQwO4io9g6Q==
X-Nifty-SrcIP: [209.85.167.173]
Received: by mail-oi1-f173.google.com with SMTP id v81so3671820oie.5
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 17:23:18 -0800 (PST)
X-Gm-Message-State: ACrzQf0LdpVTbbKDjL7uXM8FC03JUXVG0jMyeBBOlXcrWQEw3DhCURDu
        oKSHYXNa+FwwSbK+Q2qT4+4J9Ax5M3VQONilcIw=
X-Google-Smtp-Source: AMsMyM47UNQhQ1d7JIoXCcefZalxfdn7CehzPHeb8VX5QfUzx/L11u5BNKWZJ/cliMfdLz51Ght8SNE4rYb6ISl1VWg=
X-Received: by 2002:a05:6808:f09:b0:354:28ae:23b3 with SMTP id
 m9-20020a0568080f0900b0035428ae23b3mr2498277oiw.287.1668129797681; Thu, 10
 Nov 2022 17:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20221110150425.164386-1-nicolas@fjasle.eu> <20221110150425.164386-4-nicolas@fjasle.eu>
 <CAKwvOdk4Dde9b9SE8UBy+RuSCwD2GHhBDBRsMHadK-imsuMvEA@mail.gmail.com>
In-Reply-To: <CAKwvOdk4Dde9b9SE8UBy+RuSCwD2GHhBDBRsMHadK-imsuMvEA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 11 Nov 2022 10:22:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyzbvu_A6u8+71GuFjBvV8rYznZg3_HSt3HG_z_0i3Cg@mail.gmail.com>
Message-ID: <CAK7LNARyzbvu_A6u8+71GuFjBvV8rYznZg3_HSt3HG_z_0i3Cg@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add linux-kbuild's patchwork
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 11, 2022 at 5:34 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Nov 10, 2022 at 7:05 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > Add patchwork URL for Kconfig and Kbuild.
>
> Interesting, I didn't know this existed. Masahiro, do you use patchwork?


Yes. I use patchwork.


Actually, I did not know the Q: field either.



>
> I think regardless, this link is helpful.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> >
> > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 45c88bb34b6b..b031b52e32a2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11026,6 +11026,7 @@ KCONFIG
> >  M:     Masahiro Yamada <masahiroy@kernel.org>
> >  L:     linux-kbuild@vger.kernel.org
> >  S:     Maintained
> > +Q:     https://patchwork.kernel.org/project/linux-kbuild/list/
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig
> >  F:     Documentation/kbuild/kconfig*
> >  F:     scripts/Kconfig.include
> > @@ -11087,6 +11088,7 @@ R:      Nick Desaulniers <ndesaulniers@google.com>
> >  R:     Nicolas Schier <nicolas@fjasle.eu>
> >  L:     linux-kbuild@vger.kernel.org
> >  S:     Maintained
> > +Q:     https://patchwork.kernel.org/project/linux-kbuild/list/
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> >  F:     Documentation/kbuild/
> >  F:     Makefile
> > --
> > 2.37.2
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
