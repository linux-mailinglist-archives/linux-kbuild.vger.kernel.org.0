Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C443DC966
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Aug 2021 05:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhHADH7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 31 Jul 2021 23:07:59 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32018 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhHADH6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Jul 2021 23:07:58 -0400
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 17137PXN010101;
        Sun, 1 Aug 2021 12:07:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 17137PXN010101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627787245;
        bh=Y6cGd+AS0nIk8K6tDuSpbs8rK8MDD8gLz5pZSZgefaY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Xj3T603svLWCDIOyuL8r6sHggBUX9DI61d2Oja1aIDvnprDmOjHzMdAH0jlv07pkI
         k6vaTgH3Fio0+MvLKCfIIAFHEO5D9nZrS/rLkjm+Slq8LDvDpGoKIZZRehZAcJqSIv
         t+SI4vmE5UhbgCSN/xMsS+blE9dewNh8Pu4ptlCY1C661fQ22tjWHxWnlvcVrqeodf
         R6cvXbDTx1gfHgZYUgEL88/iphQ2XTS82hNd8xPGKYDXrClkhGbI6IgnP5i5U5CwtN
         lAs0UzBn4MEw+5uaKEyAIk155cO5ieWqb81TTfx7QNcIsqZkBl/4zzedQqPxo7yKol
         ZMcVjCWep7odQ==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so9342364pjb.2;
        Sat, 31 Jul 2021 20:07:25 -0700 (PDT)
X-Gm-Message-State: AOAM5312lVaRUZYPuCq5EhGalL4TXLg8Bm75gVEVkzQE3Cn0ZHdQ4QSx
        noVVfon3SvQOgpztXkiI+GcuCIr7ZDdnhXJXZmk=
X-Google-Smtp-Source: ABdhPJwvJ3Qtr+D3JsXIXaZg/AF6yklUXmSBTrT5wNChga0WU1tPd3vlAQBpApbbvnnnpuTmiqSy9pauIKltQ/jtjmA=
X-Received: by 2002:a65:498a:: with SMTP id r10mr1600876pgs.7.1627787244686;
 Sat, 31 Jul 2021 20:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210729001254.327661-1-masahiroy@kernel.org> <CAPotdmRSCnuTwHXc3Fi5b4w3TjEbJmwWUig4mcSNgFo7gXKNHw@mail.gmail.com>
In-Reply-To: <CAPotdmRSCnuTwHXc3Fi5b4w3TjEbJmwWUig4mcSNgFo7gXKNHw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 1 Aug 2021 12:06:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ++vpMyr4YMp1T-RsyAT1DeL0jrGO3JYuSGm6oUA+uVQ@mail.gmail.com>
Message-ID: <CAK7LNAQ++vpMyr4YMp1T-RsyAT1DeL0jrGO3JYuSGm6oUA+uVQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: cancel sub_make_done for the install target to
 fix DKMS
To:     John S Gruber <johnsgruber@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 31, 2021 at 2:38 AM John S Gruber <johnsgruber@gmail.com> wrote:
>
> On Wed, Jul 28, 2021 at 8:13 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Since commit bcf637f54f6d ("kbuild: parse C= and M= before changing the
> > working directory"), external modules invoked by DKMS fail to build
> > because M= option is not parsed.
> >
> > I wanted to add 'unset sub_make_done' in install.sh but similar scripts,
> > arch/*/boot/install.sh, are duplicated, so I set sub_make_done empty
> > in the top Makefile.
> >
> > Fixes: bcf637f54f6d ("kbuild: parse C= and M= before changing the working directory")
> > Reported-by: John S Gruber <johnsgruber@gmail.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index bb10a93edf5c..4193092f7c38 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1316,6 +1316,16 @@ PHONY += scripts_unifdef
> >  scripts_unifdef: scripts_basic
> >         $(Q)$(MAKE) $(build)=scripts scripts/unifdef
> >
> > +# ---------------------------------------------------------------------------
> > +# Install
> > +
> > +# Many distros have the custom install script, /sbin/kernelinstall.


I fixed up  /sbin/kernelinstall to /sbin/installkernel


Applied to linux-kbuild.



> > +# If DKMS is installed, 'make install' will eventually recuses back
> > +# to the this Makefile to build and install external modules.
> > +# Cancel sub_make_done so that options such as M=, V=, etc. are parsed.
> > +
> > +install: sub_make_done=
> > +
> >  # ---------------------------------------------------------------------------
> >  # Tools
> >
> > --
> > 2.27.0
> >
>
> This patch tested successfully on my system on 5.14.0-rc3.





-- 
Best Regards
Masahiro Yamada
