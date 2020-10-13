Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79EB028D295
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 18:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbgJMQt1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 12:49:27 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63576 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbgJMQt1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 12:49:27 -0400
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 09DGn6DR032215
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2020 01:49:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 09DGn6DR032215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602607747;
        bh=SYuGvLjIDjs1yH3+gzBSXD6gE7LGnUG8kLmUqJcgqSU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XRO6mX87X7KscGDuDzrisUm2zpTsv1dIR9XEW6gRWB79bj2pxBdQy4neI1riDVKX/
         /5tkFryhFd2IsuF0fri9Uk8Nsy2I6nmFEUFzSVkmPwMAntfG1Zi06yfFu1/DKMYiRP
         VYo+IEjdQosoQiw3Osi5BNKefmDjffcFFXmqTiq7YUf8gW0Pwzx7aqBjxj8CcCF4L4
         ySlLMDA5yfUXcJj0vXhrE3lXM0eZiY3OjWomeFU2DsJ7HrhRQgBFUxoqq9BtxxU/RN
         4Gy0PLozRV+hYSNx1rmEF0aqNG1NtRzqQDhuR3TIPFZbJ5Rm4Z+9Fo0Ra3/DsYkaj9
         H47q2erYrA2jw==
X-Nifty-SrcIP: [209.85.215.174]
Received: by mail-pg1-f174.google.com with SMTP id x16so16790pgj.3
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2020 09:49:07 -0700 (PDT)
X-Gm-Message-State: AOAM530YIsn2qdr3gcIusfD/Ak1LmHjhy22TWaWerLt1k+6B6gf/xYji
        BonCXercR3TXGKe3QPc19UE+HmfoeizwrQ6nr7Q=
X-Google-Smtp-Source: ABdhPJyZ4kt4IpSsTPCdolWUII8z0UDQDPaXX3gIUU1j2Ejgb/zV902kcC54SNpNszR9Y2fnE+A1EUXbV9XbrcqAYXc=
X-Received: by 2002:a63:d242:: with SMTP id t2mr356548pgi.47.1602607746227;
 Tue, 13 Oct 2020 09:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200925222934.GA126388@localhost> <CAK7LNAR5ArP8RGHHOXAauTvXcQgvstP=Ydh8Nc+Kv-0NYhhP2g@mail.gmail.com>
 <20200926084519.GA8344@localhost>
In-Reply-To: <20200926084519.GA8344@localhost>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 14 Oct 2020 01:48:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJZJyMBLkXbCib1B0uZ2qgNyAVkCfA4x=oR8ww73F9jw@mail.gmail.com>
Message-ID: <CAK7LNATJZJyMBLkXbCib1B0uZ2qgNyAVkCfA4x=oR8ww73F9jw@mail.gmail.com>
Subject: Re: "make bindeb-pkg" fails with CONFIG_MODULES disabled
To:     Josh Triplett <josh@joshtriplett.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 26, 2020 at 5:45 PM Josh Triplett <josh@joshtriplett.org> wrote=
:
>
> On Sat, Sep 26, 2020 at 02:45:38PM +0900, Masahiro Yamada wrote:
> > On Sat, Sep 26, 2020 at 7:29 AM Josh Triplett <josh@joshtriplett.org> w=
rote:
> > >
> > > With CONFIG_MODULES disabled, "make bindeb-pkg" fails in
> > > scripts/package/builddeb with:
> > >
> > > find: =E2=80=98Module.symvers=E2=80=99: No such file or directory
> > >
> > > The deploy_kernel_headers function in scripts/package/builddeb calls:
> > >
> > > find arch/$SRCARCH/include Module.symvers include scripts -type f
> > >
> > > But find errors out if any of its command-line arguments doesn't exis=
t.
> > >
> > > This could be fixed by checking whether that file exists first, but i=
f
> > > CONFIG_MODULES is disabled, it doesn't really make sense to build the
> > > linux-headers package at all. Perhaps that whole package could be
> > > disabled when modules are disabled?
> >
> > I agree.
> >
> >
> > How about something like the following?
>
> That looks good to me.
>
> (It would be nice, as well, to have some conditional wrapped around the
> linux-libc-dev package. I had a patch for that a while ago at
> https://lore.kernel.org/lkml/b45738b05bb396e175a36f67b02fa01de4c7472f.158=
3912084.git.josh@joshtriplett.org/
> , but that's probably not the ideal way to do it. I'd love to see a way
> to disable that extra deb, though, as it adds time to the deb build
> process for a package that most people looking to build a deb won't
> need or install.)

I am skeptical about this approach.


I think the ideal way would be
to support individual binary package build in dpkg-buildpackage.

I do not know if it has been already achieved, or
it is a planned feature.





> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index 6df3c9f8b2da..8277144298a0 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -202,8 +202,10 @@ EOF
> >  done
> >
> >  if [ "$ARCH" !=3D "um" ]; then
> > -       deploy_kernel_headers debian/linux-headers
> > -       create_package linux-headers-$version debian/linux-headers
> > +       if is_enabled CONFIG_MODULES; then
> > +               deploy_kernel_headers debian/linux-headers
> > +               create_package linux-headers-$version debian/linux-head=
ers
> > +       fi
> >
> >         deploy_libc_headers debian/linux-libc-dev
> >         create_package linux-libc-dev debian/linux-libc-dev
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index 48fbd3d0284a..88c5e25662bd 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -183,13 +183,6 @@ Description: Linux kernel, version $version
> >   This package contains the Linux kernel, modules and corresponding oth=
er
> >   files, version: $version.
> >
> > -Package: $kernel_headers_packagename
> > -Architecture: $debarch
> > -Description: Linux kernel headers for $version on $debarch
> > - This package provides kernel header files for $version on $debarch
> > - .
> > - This is useful for people who need to build external modules
> > -
> >  Package: linux-libc-dev
> >  Section: devel
> >  Provides: linux-kernel-headers
> > @@ -200,6 +193,17 @@ Description: Linux support headers for userspace
> > development
> >  Multi-Arch: same
> >  EOF
> >
> > +if is_enabled CONFIG_MODULES; then
> > +cat <<EOF >> debian/control
> > +Package: $kernel_headers_packagename
> > +Architecture: $debarch
> > +Description: Linux kernel headers for $version on $debarch
> > + This package provides kernel header files for $version on $debarch
> > + .
> > + This is useful for people who need to build external modules
> > +EOF
> > +fi
> > +
> >  if is_enabled CONFIG_DEBUG_INFO; then
> >  cat <<EOF >> debian/control
> >
> >
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--
Best Regards
Masahiro Yamada
