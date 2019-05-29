Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1340B2D30F
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2019 03:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbfE2BD1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 May 2019 21:03:27 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25081 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfE2BD1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 May 2019 21:03:27 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x4T13Ft2004342
        for <linux-kbuild@vger.kernel.org>; Wed, 29 May 2019 10:03:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x4T13Ft2004342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559091796;
        bh=jCFvB+YrbV9fJHJdugjROEKPLOpLpTgL08/q9nI4KGc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gmf80RTwYa2qi09vsE5IVUP87MPwHvnCogJbT2CwHXFGTwzMr4gE99YVDAp+UoKY3
         wy3IWgeceGQKc2Wk3D75nIW54n59a1Ay1IGDDJea7YBbYxq3lW8EoBw9qpgHHvwUkT
         7ceVcSJJyAKYmtWgANPz11LRfRTMuLEq9YkShajbQuYn6xqwTVFYaBS9VNCXO2SJYj
         G8uRF1MVcqEjEk5uuBQSut6mDxCO/ocg/66wN8cnvOPccLtGBLef8E5imnS4aPrtED
         OmQy2XWT4BNpBoAizqNph/HxbgCHrQTzqqowqpoj5BRQlJnL8OMEwGrpOaT8+sxciE
         +jISQWBJhcl9w==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id q64so616130vsd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2019 18:03:16 -0700 (PDT)
X-Gm-Message-State: APjAAAW5WLDzmSA1y3T+SV0XvIJCC/JLPiHJoBGiJzy5oJdo09IQViVe
        DfI/Ule6xMbIeW62EISfpi8pbcg5XZvWzAP7KiA=
X-Google-Smtp-Source: APXvYqxplV/jP2LrS5T89OsCaERGxlf1sVP8AefRu/blvrYdWLLb/iDr3Nm2u2xxA3ooBfhoclfxaf7LFeEhiZunFdA=
X-Received: by 2002:a67:de99:: with SMTP id r25mr44708672vsk.215.1559091795309;
 Tue, 28 May 2019 18:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190528081614.26096-1-mpe@ellerman.id.au> <20190528121009.GA11901@infradead.org>
In-Reply-To: <20190528121009.GA11901@infradead.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 29 May 2019 10:02:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS3iTOeX5b2F7E9PeWqma1_hx7Tbrt2V=3fvrqhSk5Zug@mail.gmail.com>
Message-ID: <CAK7LNAS3iTOeX5b2F7E9PeWqma1_hx7Tbrt2V=3fvrqhSk5Zug@mail.gmail.com>
Subject: Re: [PATCH] powerpc/configs: Rename foo_basic_defconfig to foo_base.config
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 28, 2019 at 9:10 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, May 28, 2019 at 06:16:14PM +1000, Michael Ellerman wrote:
> > We have several "defconfigs" that are not actually full defconfigs
> > they are just a base set of options which are then merged with other
> > fragments to produce a working defconfig.

The default values from Kconfig files are used
where CONFIG options are not specified by the defconfig.

So, I think corenet_basic_defconfig is a full defconfig
even if it contains a single CONFIG option.

Since the difference between "*_defconfig" and "*.config"
is ambiguous in some cases, it depends on the intended usage.


> > The most obvious example is corenet_basic_defconfig which only
> > contains one symbol CONFIG_CORENET_GENERIC=y. But there is also
> > mpc85xx_base_defconfig which doesn't actually enable CONFIG_PPC_85xx.
> >
> > To avoid confusion, rename these config fragments to "foo_base.config"
> > to make it clearer that they are not full defconfigs.
>
> Adding linux-kbuild, maybe we can make the handling of these fragments
> generic and actually document it..

I do not know how it should be documented.



> >
> > Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >  arch/powerpc/Makefile                                | 12 ++++++------
> >  .../{corenet_basic_defconfig => corenet_base.config} |  0
> >  .../{mpc85xx_basic_defconfig => mpc85xx_base.config} |  0
> >  .../{mpc86xx_basic_defconfig => mpc86xx_base.config} |  0
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> >  rename arch/powerpc/configs/{corenet_basic_defconfig => corenet_base.config} (100%)
> >  rename arch/powerpc/configs/{mpc85xx_basic_defconfig => mpc85xx_base.config} (100%)
> >  rename arch/powerpc/configs/{mpc86xx_basic_defconfig => mpc86xx_base.config} (100%)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index c345b79414a9..94f735db2229 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -333,32 +333,32 @@ PHONY += powernv_be_defconfig
> >
> >  PHONY += mpc85xx_defconfig
> >  mpc85xx_defconfig:
> > -     $(call merge_into_defconfig,mpc85xx_basic_defconfig,\
> > +     $(call merge_into_defconfig,mpc85xx_base.config,\
> >               85xx-32bit 85xx-hw fsl-emb-nonhw)
> >
> >  PHONY += mpc85xx_smp_defconfig
> >  mpc85xx_smp_defconfig:
> > -     $(call merge_into_defconfig,mpc85xx_basic_defconfig,\
> > +     $(call merge_into_defconfig,mpc85xx_base.config,\
> >               85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)
> >
> >  PHONY += corenet32_smp_defconfig
> >  corenet32_smp_defconfig:
> > -     $(call merge_into_defconfig,corenet_basic_defconfig,\
> > +     $(call merge_into_defconfig,corenet_base.config,\
> >               85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw dpaa)
> >
> >  PHONY += corenet64_smp_defconfig
> >  corenet64_smp_defconfig:
> > -     $(call merge_into_defconfig,corenet_basic_defconfig,\
> > +     $(call merge_into_defconfig,corenet_base.config,\
> >               85xx-64bit 85xx-smp altivec 85xx-hw fsl-emb-nonhw dpaa)
> >
> >  PHONY += mpc86xx_defconfig
> >  mpc86xx_defconfig:
> > -     $(call merge_into_defconfig,mpc86xx_basic_defconfig,\
> > +     $(call merge_into_defconfig,mpc86xx_base.config,\
> >               86xx-hw fsl-emb-nonhw)
> >
> >  PHONY += mpc86xx_smp_defconfig
> >  mpc86xx_smp_defconfig:
> > -     $(call merge_into_defconfig,mpc86xx_basic_defconfig,\
> > +     $(call merge_into_defconfig,mpc86xx_base.config,\
> >               86xx-smp 86xx-hw fsl-emb-nonhw)
> >
> >  PHONY += ppc32_allmodconfig
> > diff --git a/arch/powerpc/configs/corenet_basic_defconfig b/arch/powerpc/configs/corenet_base.config
> > similarity index 100%
> > rename from arch/powerpc/configs/corenet_basic_defconfig
> > rename to arch/powerpc/configs/corenet_base.config
> > diff --git a/arch/powerpc/configs/mpc85xx_basic_defconfig b/arch/powerpc/configs/mpc85xx_base.config
> > similarity index 100%
> > rename from arch/powerpc/configs/mpc85xx_basic_defconfig
> > rename to arch/powerpc/configs/mpc85xx_base.config
> > diff --git a/arch/powerpc/configs/mpc86xx_basic_defconfig b/arch/powerpc/configs/mpc86xx_base.config
> > similarity index 100%
> > rename from arch/powerpc/configs/mpc86xx_basic_defconfig
> > rename to arch/powerpc/configs/mpc86xx_base.config
> > --
> > 2.20.1
> >
> ---end quoted text---



--
Best Regards
Masahiro Yamada
