Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02E22E86D3
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jan 2021 10:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbhABJOR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jan 2021 04:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbhABJOP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jan 2021 04:14:15 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB66C061573;
        Sat,  2 Jan 2021 01:13:34 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id n4so20557207iow.12;
        Sat, 02 Jan 2021 01:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Keu1yyLVZG5seVdc6tJ66n5iwYE0Kazrqr+VW7YgVT0=;
        b=NYjL5do/hV5uSjyahTo/m13faRmWdSav6B17OE9VpcTgmbA7WjcC0Nhwwpu924g2l9
         /3GWwG09OqHvZ1+wEtBqbuGnGoX6eZxs4rg7gmFNkTgAjo45Wd9GMpqSvGS2vhi1aCdM
         7v7bQEYw/yxzW9Lf3fmvqapowqa+99bk8Bw3Sa37O67WabK7FPZ/ok9FSsPjbLiPACOk
         qtcClQghBd4lf4ccqUn5w1T5Sek73o46iUlN1biK9LqQuD7owuGq8Q9Xt1Zn3zDzzkk4
         6XZAbk3XrkguxkDKUh3rh4Ro6nAc9o/6BNE64/p/Dc92FPPjThACcvMfmdCfr4FunEqh
         vTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Keu1yyLVZG5seVdc6tJ66n5iwYE0Kazrqr+VW7YgVT0=;
        b=BXp31sCLR/uLnktMmtO8RJTC1GRVvWSZb2wUBapRTpuIsKO3I8QLTIgsPl1Rxg0O8A
         ZxLfA9z+QPsgl4iZ7IX1vOaMPlAwOemiOprSbL0Nuk8Lg/khLMSU2mqaST/GPBKKOvo2
         9niFXcazfUOPd9JcGdhu9AzzCxNkVdql8M9vdBJTBmBSdJmT65a6huQKNhJgt4NBIKki
         einj4nFMRCREyQ8ph+KaJWrGa2ZQFUm2Y/OS2i5rvxfNm5lM3C1fgof9iDd95I480God
         SRcCIZ5O6q94ScoGFRl7OPhl5oKZR30Vg21aU6YCBWVgyQ63U5SMnEbKG00E9+FbdIg3
         21bA==
X-Gm-Message-State: AOAM533tnLkwhj5c85kQOvnroHc/NQk3quakeEfDuGCawVdD72jDgukb
        fs3oryalX/kMCSdtUVK9hbhg7FRlP6CHC0xbGUk=
X-Google-Smtp-Source: ABdhPJxMauuS5dr3VSN9PnhoImPhuJmDSrl/XRrw3TOKwTpnnaS68IbRdrjJ0M5oHkqBNvoDI96rJZ3iHAC2gX8KOMc=
X-Received: by 2002:a02:a304:: with SMTP id q4mr54100952jai.97.1609578813746;
 Sat, 02 Jan 2021 01:13:33 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
 <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
 <20210101161435.GA344@duo.ucw.cz> <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
 <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
In-Reply-To: <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 2 Jan 2021 10:13:22 +0100
Message-ID: <CA+icZUXyfv0sOP=UG6oeoxpHbEpOrufJzzUWb3ZOpE_TMQerwQ@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 2, 2021 at 8:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
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
>
>
> Maybe, the problem is when we run 'make modules_install'
> for cross compilation, which we do not necessarily
> require the root permission.
>
> Users can still adjust PATH in ~/.profile, but
> somebody may think breaking the legacy behavior
> is annoying.
>
> So, after some consideration, the workaround by Linus
> looks good to me.
>

Happy new 2020+1,

Thanks for your feedback Masahiro.

Building a Linux kernel on Debian is mostly done using fakeroot binary
(so I do) - so in the user's (PATH) environment.

I cannot speak for the case of cross-compilation as I never used it in
the last years.

We are in the transition "Xmas -> New year -> Weekend" so a lot of
user's of Debian system will not test and hit the problem.
To be honest I wondered why there were no more reports on this.
With upcoming Sunday/Monday we will have Linux v5.11-rc2 released
which has an elegant solution by restoring common legacy behaviour by
putting "sbin" to the end of "PATH" (search).

Regards,
- Sedat -
