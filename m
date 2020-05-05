Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD291C5030
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2020 10:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgEEIYm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 May 2020 04:24:42 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54216 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgEEIYl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 May 2020 04:24:41 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0458ODXX025004;
        Tue, 5 May 2020 17:24:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0458ODXX025004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588667054;
        bh=awhKCUwBKnrY0PuQr1ZiYwWdjhoVOMuvHRPkGvuPBig=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=19phWRHzfucRuYFNCHmJtFb/7S9prMsy4+8xbnqO2UzkhhIYF3PDX0zkECzWjC9rP
         VPAamfUmx8FZXAphNx0xNboKMDcOukT7A2gcRIn5FCh1ayXqJHXEAtUsrQGAtftYFz
         W7Cvk0kQy/30DfPXhks3p0xkdNyI8HT6TMYNRqEF/cTlVyjYHauACGyZNE1jCpZQ/l
         8ds8YhANRh5mAySe5wJNhhi6I5mbhg5kDnw07OH4xijc4kOtyLzIHvcMT3jZSPGDk0
         w9mP4m2pOj9g7xBrqBtjUyAcWg3gH0ssTP3shR9uL568wRIrMQj7P5fNcspyhfCtfj
         CQjHfOgzUYTBw==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id s11so708794vsq.13;
        Tue, 05 May 2020 01:24:14 -0700 (PDT)
X-Gm-Message-State: AGi0PuYKwtPisPWvtbIE6iMSgusOIidWXM9PZtE+ANDGO/86n6KbzLNn
        JuP2HABB6yJnbP93suimd+6mFbO/t9pr/uQH+3A=
X-Google-Smtp-Source: APiQypI+NF72kYXUBGhjZ7K//d9ckRGDhIKCAkr5ao2a5eh/orzgnX4ljHTKFkr5raukyfp0MWA96AsQ9GOht6LNT1E=
X-Received: by 2002:a67:6e07:: with SMTP id j7mr1604563vsc.181.1588667052874;
 Tue, 05 May 2020 01:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200504020651.37031-1-masahiroy@kernel.org> <20200504020651.37031-2-masahiroy@kernel.org>
 <CAL_JsqLRUAEmh3kwEo+T-dMhXZTBH_kwbBwKzZyhJMR5P92pwA@mail.gmail.com> <CAK7LNASGKrovgqEzSgqZRU0kAsh7rhZ78fZ21VrdKvmP2XH0JQ@mail.gmail.com>
In-Reply-To: <CAK7LNASGKrovgqEzSgqZRU0kAsh7rhZ78fZ21VrdKvmP2XH0JQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 5 May 2020 17:23:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNATXCKYfogvYxpaKW+CE0KwMeNjHfLpSemFAHdBzG0yGDQ@mail.gmail.com>
Message-ID: <CAK7LNATXCKYfogvYxpaKW+CE0KwMeNjHfLpSemFAHdBzG0yGDQ@mail.gmail.com>
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

On Tue, May 5, 2020 at 12:04 PM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> On Tue, May 5, 2020 at 4:15 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Sun, May 3, 2020 at 9:07 PM Masahiro Yamada <masahiroy@kernel.org> w=
rote:
> > >
> > > Marek Beh=C3=BAn reported a case where pkg-config fails to detect the
> > > libyaml-dev package, which is presumably a bug of the distro.
> > >
> > > Irrespective of that, I am not a big fan of pkg-config in the Makefil=
e
> > > parse stage. The cost of pkg-config is quite small, but it is evaluat=
ed
> > > everytime we run make, even when we do 'make mrproper'. This commit
> > > changes the Makefile to not rely on pkg-config at all.
> >
> > I don't really love the solution here... I'm inclined to just make
> > libyaml always required. Anyone building dtbs should care about
> > validating them. However, there's some dts files sprinkled in the tree
> > such as DT unittests and I don't want to break allmodconfig for CI,
> > 0-day, etc. Though eventually we may have to.
> >
> > > The normal build should not require libyaml-dev while we need to comp=
ile
> > > dtc with libyaml for the schema check.
> > >
> > > Build two dtc variants:
> > >
> > >   scripts/dtc/dtc      for *.dts -> *.dtb
> > >   scripts/dtc/dtc-yaml for *.dts -> *.dt.yaml
> >
> > My longer term plan is to integrate the schema checks into dtc. This
> > would be some sort of plugin to dtc found or specified at run-time. It
> > would eliminate the need for 2 passes of dtc and the 2nd case will go
> > away.
>
>
> OK.
>
>
>
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -246,6 +246,7 @@ quiet_cmd_gzip =3D GZIP    $@
> > >  # DTC
> > >  # ------------------------------------------------------------------=
---------
> > >  DTC ?=3D $(objtree)/scripts/dtc/dtc
> > > +DTC_YAML ?=3D $(objtree)/scripts/dtc/dtc-yaml
> >
> > Can we make 'DTC' override both and keep this an internal detail.
> >
>
> No. For parallel building *.dtb and *.dt.yaml,
> they must be separate instances.
>
>
> > > +HOSTLDLIBS_dtc-yaml :=3D -lyaml
> >
> > Does this work for yocto? As we had this before commit 067c650c456e.
> > Not clear if this changed for any reason or just 'let's use pkg-config
> > everywhere'.
> >
> > Or is there another way to fix yocto issue and we can just check the
> > header exists. I assume yocto needs some prefix in front of
> > '/usr/include/yaml.h'?
> >
>
> My bad - I missed 067c650c456e
>
> We need pkg-config to deal with yocto.
>
>
> Sorry, I take back this series.


On my second thought, we can search libyaml
in non-standard path without pkg-config.


Kbuild provides a way to specify additional flags
for building host tools.

make  HOSTCFLAGS=3D<install-dir-in-yocto>/include
      HOSTLDFLAGS=3D<install-dir-in-yocto>/lib




--=20
Best Regards
Masahiro Yamada
