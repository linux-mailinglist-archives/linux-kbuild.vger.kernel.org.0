Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5592E86B6
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jan 2021 08:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbhABHwk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jan 2021 02:52:40 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45969 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbhABHwk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jan 2021 02:52:40 -0500
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 1027pfKm015162;
        Sat, 2 Jan 2021 16:51:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1027pfKm015162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1609573901;
        bh=P8vdX/CdQBZr5DGs31enHkcYQr+98zYEQ5FMO2kYpqs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wVvdtwcDM/KIfhXuoirH5mecGv9YPGMYnhuVxPWEjF1vP0pagUl2QHRui8w9h3wyn
         EIrMUEyCt9anLjKcsfVF6h2oG3cR26RIOfn951tAfKSEh6LAyxhhAaUtV0UVf+OW9T
         j67Wo4BIwd0Eeyto0DHCN3fVIMqnM2aWlma2PcV7RN6JvgTpwVJ/3F1EzVlL3DQMjD
         U+9jFgLUcQO8CQwVWrOIh/yg1v3G5NsvW0grFNa/6uUILY1Z4TKaHFmnQMDTEbTeJc
         jZG0auziw4dui4qoz0YH8qI8akuI0f2/pbNpz+Me9vhobteKm7FhPnA0kTLyt5rpR5
         A1F+ArMMu+zuQ==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id 11so13353186pfu.4;
        Fri, 01 Jan 2021 23:51:41 -0800 (PST)
X-Gm-Message-State: AOAM53040wZJDJgsq6nHA4gbUBGc9eVY2Mr7H617F0oqw8TxKTHQMcZG
        7RlZDwXLSiNlH+YTvUhbwQ1tJ7S0YIyzqYjkE00=
X-Google-Smtp-Source: ABdhPJwkeCFXUaZLryelFjlauQzCSGSVwCLph3npOK3qeZmZQRLd51UaAX/Weo6156cwHXnNbbcnRaeB3NJ7p/T6Z10=
X-Received: by 2002:a62:820d:0:b029:1ad:d810:6805 with SMTP id
 w13-20020a62820d0000b02901add8106805mr40038143pfd.63.1609573900636; Fri, 01
 Jan 2021 23:51:40 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
 <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
 <20210101161435.GA344@duo.ucw.cz> <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
In-Reply-To: <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 2 Jan 2021 16:51:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
Message-ID: <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
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

On Sat, Jan 2, 2021 at 3:55 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Fri, Jan 1, 2021 at 5:14 PM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Hi!
> > > >
> > > > > $ dpkg -L kmod | grep bin | grep depmod
> > > > > /sbin/depmod
> > > > >
> > > > > $ which depmod
> > > > > [ empty ]
> > > > >
> > > > > $ echo $PATH
> > > > > /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
> > >
> > > Ok, I think this is a broken setup that has a separate /sbin but does
> > > not have it in the PATH.
> >
> > That's how it is supposed to work, AFAICT. It is so on Debian here,
> > for example.
> >
> > /sbin is for management commands, why would I have it in PATH when
> > running as normal user?
> >
>
> I am here on Debian/testing AMD64 and waiting for feedback [2].
>
> For now I have applied the diff from [1].
>
> - Sedat -
>
> [1] https://marc.info/?l=linux-kbuild&m=160919738006768&w=2
> [2] https://marc.info/?l=linux-kernel&m=160919729606750&w=2


PATH for the root on Debian is
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


depmod is used from 'make module_install'.

For the native module installation to the host machine,
module_install is run after 'su -'
or 'sudo', which successfully finds depmod in /sbin.


I also tested 'make deb-pkg' with/without
rootless builds. It also successfully found depmod
in /sbin, presumably dpkg tools automatically tweak
PATH env variable.


Maybe, the problem is when we run 'make modules_install'
for cross compilation, which we do not necessarily
require the root permission.

Users can still adjust PATH in ~/.profile, but
somebody may think breaking the legacy behavior
is annoying.

So, after some consideration, the workaround by Linus
looks good to me.


--
Best Regards
Masahiro Yamada
