Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B1220C59D
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 05:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgF1DrX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jun 2020 23:47:23 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:38090 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgF1DrX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 23:47:23 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 05S3l5JJ006592;
        Sun, 28 Jun 2020 12:47:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 05S3l5JJ006592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593316026;
        bh=B7QRYdTs+cbEfWY3NzTlfvGAcsr/cihzW3ryEOQC/Zs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XpUISCZXHoa1LTTiHZ30O0pGybv+avlet7CcpKAGqsPFx47TbFFHuGAxOjj7wDXCv
         9ERXDY2u4YrgUHfsea+OWkE/OYcArvhlntXgbzGff6lKqTJXftN8LE71HBaUztqmDy
         7h734EpyCySWrj4JXPUruHrsU11C9TS9cmNtUDapX98IsBMIUruUqgD8TIoXwwS09s
         Xt57g3MRtBpEHwvT2PlMKvFMBJx1ZOquGPSRVZkv7dqSU/jqVV15euMmCBdPs3JD03
         1uP99x+VL5dnEXr9Yc2RMD7aB1wPS6NwCWBnSAA13pDoeBs8ZEriqezucpFq4d2wuz
         UpoNh9CorPnrw==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id x13so2768437vsx.13;
        Sat, 27 Jun 2020 20:47:06 -0700 (PDT)
X-Gm-Message-State: AOAM530VTpjl2uHVI5n2YVtCeXDeImhkYA1mURkfVOwfwGPiO5Ym6KM2
        saujwvHH7Ac2SOv9hOD2D/a++pju0PvftIC7V7w=
X-Google-Smtp-Source: ABdhPJy6mstsBCRPDmM6qaKFGx1C544+eGw/4U6DuKhkf08CNdu0wQlix1f4gGX/FS7/mMTaTuepEW9puZGjPDX2q+I=
X-Received: by 2002:a67:f813:: with SMTP id l19mr7115810vso.215.1593316024953;
 Sat, 27 Jun 2020 20:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com> <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
 <20200626214026.GB25753@dumbo> <CAK7LNASRL6jaaxZreFK+iDmFHuw6QLSS0n08gZNkyhcsNunAnw@mail.gmail.com>
 <20200627212112.GA18721@dumbo>
In-Reply-To: <20200627212112.GA18721@dumbo>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 12:46:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhsyo0OoS+fibCn3tt4J7_iwfsSn8TvzjxZ4K_bwreUA@mail.gmail.com>
Message-ID: <CAK7LNARhsyo0OoS+fibCn3tt4J7_iwfsSn8TvzjxZ4K_bwreUA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
To:     Domenico Andreoli <domenico.andreoli@linux.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 28, 2020 at 6:21 AM Domenico Andreoli
<domenico.andreoli@linux.com> wrote:
>
> On Sat, Jun 27, 2020 at 09:02:52PM +0900, Masahiro Yamada wrote:
> > On Sat, Jun 27, 2020 at 6:40 AM Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> > > On Fri, Jun 26, 2020 at 03:16:58PM +0900, Masahiro Yamada wrote:
> > > > On Fri, Jun 26, 2020 at 5:51 AM Domenico Andreoli <domenico.andreoli@linux.com> wrote:
>
> [...]
>
> > > > >
> > > > > +       arm64)
> > > > > +               make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> > > > > +               ;;
> > > > > +esac
> > > > > +
> > > >
> > > >
> > > > Or, you can use INSTALL_PATH="${tmpdir}/boot"
> > > > to make it shorter.
> > >
> > > This does not work, INSTALL_DTBS_PATH gets somehow defined along the
> > > twisted path to buildtar and therefore needs to be explicitly specified
> > > for the new destination.
> >
> > It works.
> >
> > See line 1002 of the top Makefile
> >
> > export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)
>
> Exactly. INSTALL_DTBS_PATH is _exported_ in the top Makefile.
>
>
> This is what it seems to happen, in the order:
>
> 1. outer 'make dir-pkg'
>    INSTALL_DTBS_PATH is exported with some content
>
> 2. control arrives to buildtar
>    INSTALL_DTBS_PATH is there as environment variable
>
> 3. inner 'make INSTALL_PATH=${tmpdir}/boot dtbs_install'
>    INSTALL_DTBS_PATH is already set, therefore it is not modified

Sorry, I was wrong.
Your analysis is definitely right.


I will apply v4.

Thanks.




>
> To make the inner invocation work, I see these two options:
>
> 1. 'make INSTALL_DTBS_PATH= INSTALL_PATH=${tmpdir}/boot dtb_install' (untested)
>
> 2. 'make INSTALL_DTBS_PATH=${tmpdir}/boot/dtbs/${KERNELRELEASE} dtbs_install'
>
> I chose 2 but I can switch to 1, if you prefer. No problem.
>
>
> Regards,
> Domenico
>
> --
> rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
> ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05



-- 
Best Regards
Masahiro Yamada
