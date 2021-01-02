Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4CA2E87F3
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jan 2021 16:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbhABPcC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jan 2021 10:32:02 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:41635 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbhABPcC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jan 2021 10:32:02 -0500
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 102FV3Yb014655;
        Sun, 3 Jan 2021 00:31:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 102FV3Yb014655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1609601464;
        bh=j2fbtGKyQTuw45mkSRvlfyrsJCwexbqktTOakjtc3Ng=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JOYsSubAmOtJ90m+ZEIpNeJ3H4BqsjGEWi1ZhUyLNNT0twCeb774XY8JVunSJgEan
         XMN8aRzvzesXC2MsGNcI9EUo/NJsWOmbSWO3RW1e7L9SSZmCU4mUp6dimsCU6v7VKA
         k+AJgCnpw/nwoEhRtZKwzO+DOfkNCTBHgcVUZVo0AGZQ1NjI5sr/VdvLG/Bxf7Ygbn
         /D9XAlWDX6utK1fQvwGip0ExYqi8rh9c26OUsNHYy9o33OWObmOmnqwLfxxE4h27ja
         vge+qwMW+fjhUNMy+70rjy6/aQHcc7KVHsrEMRquk1jAubAKoilzYPK5Q2PGiDvYx+
         K3XL7O3XGYq8w==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id j1so12184553pld.3;
        Sat, 02 Jan 2021 07:31:04 -0800 (PST)
X-Gm-Message-State: AOAM532YokAjuok4LSK7KKKTGo+EkmmQAJPI1oisvB22o9w6djuzoVtp
        Iosh+w4PxdhXA5a/RcY2nZDSXds+pFul2J62+2w=
X-Google-Smtp-Source: ABdhPJxpcBAzf3cT0Gxixv6edeMiLWg9YsUq6/83FjXp8xGLGE5/dOYhG7/j9KRVw1XvcsIKbThagbjfD+ZHsccL3vI=
X-Received: by 2002:a17:902:9b91:b029:db:f003:c5eb with SMTP id
 y17-20020a1709029b91b02900dbf003c5ebmr65041766plp.1.1609601462940; Sat, 02
 Jan 2021 07:31:02 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
 <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
 <20210101161435.GA344@duo.ucw.cz> <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
 <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
In-Reply-To: <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 3 Jan 2021 00:30:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATkMy88VmyZMfWLJgsU7UAWV_uHCCo6vNBSbWL-3vnzoQ@mail.gmail.com>
Message-ID: <CAK7LNATkMy88VmyZMfWLJgsU7UAWV_uHCCo6vNBSbWL-3vnzoQ@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 2, 2021 at 4:51 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Jan 2, 2021 at 3:55 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Fri, Jan 1, 2021 at 5:14 PM Pavel Machek <pavel@ucw.cz> wrote:
> > >
> > > Hi!
> > > > >
> > > > > > $ dpkg -L kmod | grep bin | grep depmod
> > > > > > /sbin/depmod
> > > > > >
> > > > > > $ which depmod
> > > > > > [ empty ]
> > > > > >
> > > > > > $ echo $PATH
> > > > > > /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
> > > >
> > > > Ok, I think this is a broken setup that has a separate /sbin but does
> > > > not have it in the PATH.
> > >
> > > That's how it is supposed to work, AFAICT. It is so on Debian here,
> > > for example.
> > >
> > > /sbin is for management commands, why would I have it in PATH when
> > > running as normal user?
> > >
> >
> > I am here on Debian/testing AMD64 and waiting for feedback [2].
> >
> > For now I have applied the diff from [1].
> >
> > - Sedat -
> >
> > [1] https://marc.info/?l=linux-kbuild&m=160919738006768&w=2
> > [2] https://marc.info/?l=linux-kernel&m=160919729606750&w=2
>
>
> PATH for the root on Debian is
> /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>
>
> depmod is used from 'make module_install'.
>
> For the native module installation to the host machine,
> module_install is run after 'su -'
> or 'sudo', which successfully finds depmod in /sbin.
>
>
> I also tested 'make deb-pkg' with/without
> rootless builds. It also successfully found depmod
> in /sbin, presumably dpkg tools automatically tweak
> PATH env variable.



I retract this hunk about deb-pkg.

(My test environment in the docker was wrong.)

I tested deb-pkg builds in the full debian installation
in KVM, and confirmed deb-pkg failed to build.

So, 'make deb-pkg' would have broken without
cedd1862be7e6








-- 
Best Regards
Masahiro Yamada
