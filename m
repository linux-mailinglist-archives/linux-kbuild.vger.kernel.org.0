Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912BE1C4C76
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2020 05:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgEEDFl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 May 2020 23:05:41 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25270 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgEEDFl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 May 2020 23:05:41 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 04535Oma001530;
        Tue, 5 May 2020 12:05:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 04535Oma001530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588647925;
        bh=7pzFWZ+G9qpXTN4C61MUU29XguMs9OYlbJNsdNGfSfU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sD5LQfjUMZW/+6W5ap9AHsWx45Oxcwi2meGBANQ8HQXiWCd3sCQ8rTeEJON64IXYk
         Xzp4aIQDGndSGhY6dIbW6belAcrrIWC3mRQpCtmcQuLUAhimQzuVD8qyAZlvvuckMI
         R6+fkdQoRZlPemDqPYGqj1y2pNy83t+OKLu9MEsb//w2FSwPnD02AtAUMPYKT4IIrO
         BlA9F6VhoJHWNiZybbwGbjBX2BWTNmJDVDQXH+zEqKPfjyOOpuVl+1jNjD9kalEcv6
         jPMbPnBoGjXWaV16O1O0xQVu4RIzTjdDY2ai3MjQ49fdts+/pCalaD9qhzycfF4F1N
         FjTiUtYXAi7UQ==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id b10so381505vsh.1;
        Mon, 04 May 2020 20:05:25 -0700 (PDT)
X-Gm-Message-State: AGi0Pua0m0mbL6UqyQAH6LXxJH0fDLqzdEnig0Cd7hHcY3j2g7yJArKg
        MDsgLGbO4NF1D1htXr3kh87QRdP/NU+h9ELEmAw=
X-Google-Smtp-Source: APiQypIVLbiCyi3UVlzZqvVq4xSo4WhtHlo5CE5Wd081k8YxTyEAtaRSh+pUvaI6stqG0JDc5lQtYCJiwrLalo0VJTA=
X-Received: by 2002:a67:3293:: with SMTP id y141mr1020371vsy.54.1588647923948;
 Mon, 04 May 2020 20:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200504020651.37031-1-masahiroy@kernel.org> <20200504020651.37031-2-masahiroy@kernel.org>
 <CAL_JsqLRUAEmh3kwEo+T-dMhXZTBH_kwbBwKzZyhJMR5P92pwA@mail.gmail.com>
In-Reply-To: <CAL_JsqLRUAEmh3kwEo+T-dMhXZTBH_kwbBwKzZyhJMR5P92pwA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 5 May 2020 12:04:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASGKrovgqEzSgqZRU0kAsh7rhZ78fZ21VrdKvmP2XH0JQ@mail.gmail.com>
Message-ID: <CAK7LNASGKrovgqEzSgqZRU0kAsh7rhZ78fZ21VrdKvmP2XH0JQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts/dtc: compile separate dtc-yaml
To:     Rob Herring <robh+dt@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?TWFyZWsgQmVo77+977+9w6Ju?= <marek.behun@nic.cz>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 5, 2020 at 4:15 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, May 3, 2020 at 9:07 PM Masahiro Yamada <masahiroy@kernel.org> wro=
te:
> >
> > Marek Beh=C3=BAn reported a case where pkg-config fails to detect the
> > libyaml-dev package, which is presumably a bug of the distro.
> >
> > Irrespective of that, I am not a big fan of pkg-config in the Makefile
> > parse stage. The cost of pkg-config is quite small, but it is evaluated
> > everytime we run make, even when we do 'make mrproper'. This commit
> > changes the Makefile to not rely on pkg-config at all.
>
> I don't really love the solution here... I'm inclined to just make
> libyaml always required. Anyone building dtbs should care about
> validating them. However, there's some dts files sprinkled in the tree
> such as DT unittests and I don't want to break allmodconfig for CI,
> 0-day, etc. Though eventually we may have to.
>
> > The normal build should not require libyaml-dev while we need to compil=
e
> > dtc with libyaml for the schema check.
> >
> > Build two dtc variants:
> >
> >   scripts/dtc/dtc      for *.dts -> *.dtb
> >   scripts/dtc/dtc-yaml for *.dts -> *.dt.yaml
>
> My longer term plan is to integrate the schema checks into dtc. This
> would be some sort of plugin to dtc found or specified at run-time. It
> would eliminate the need for 2 passes of dtc and the 2nd case will go
> away.


OK.



> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -246,6 +246,7 @@ quiet_cmd_gzip =3D GZIP    $@
> >  # DTC
> >  # --------------------------------------------------------------------=
-------
> >  DTC ?=3D $(objtree)/scripts/dtc/dtc
> > +DTC_YAML ?=3D $(objtree)/scripts/dtc/dtc-yaml
>
> Can we make 'DTC' override both and keep this an internal detail.
>

No. For parallel building *.dtb and *.dt.yaml,
they must be separate instances.


> > +HOSTLDLIBS_dtc-yaml :=3D -lyaml
>
> Does this work for yocto? As we had this before commit 067c650c456e.
> Not clear if this changed for any reason or just 'let's use pkg-config
> everywhere'.
>
> Or is there another way to fix yocto issue and we can just check the
> header exists. I assume yocto needs some prefix in front of
> '/usr/include/yaml.h'?
>

My bad - I missed 067c650c456e

We need pkg-config to deal with yocto.


Sorry, I take back this series.

--=20
Best Regards
Masahiro Yamada
