Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9AA0125971
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 03:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfLSCBH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 21:01:07 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:31096 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbfLSCBG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 21:01:06 -0500
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id xBJ20q9C011481;
        Thu, 19 Dec 2019 11:00:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xBJ20q9C011481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576720852;
        bh=QOTas5vQTBofSUexmhGe4jI4sFihib4RSush13icE/k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w13+p6XFVqmjA182xDuwF9EntTzNZiB8xWufPOT4nOyXvzE+zU9gV1YpKHLB69IXU
         3eBTcKHrd6hPlO1Yz7TAAsvISX1/EuYIdttkIwdpN52P7BpO9T0MQPjPuSFLH+40q7
         9d9s2E/AXcL92Zr9LCUTrZpgjvHDZ+tlMYT2oNeRvvaRGDVb8hKpNQlnQT3KgA5wvn
         BwbHd92AQyO4r4wg09wX2cCh/6sZUCLyOPcMeSR1ClJh6X3F/Zt1mxwBuPQslPB+OM
         1XR4LCW45LRQQilYGcVTcuKd76kW+1XO5a9MRb4ECJ5MUp5KU4VLNj7rgM4Z9czAmj
         nrjPG6jS+5OTA==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id g7so1202294vkl.12;
        Wed, 18 Dec 2019 18:00:52 -0800 (PST)
X-Gm-Message-State: APjAAAXcCnzZBFkUyxBIje2BXjyD6RkEzk0DCKE0O0OteM1h1MdKGfgP
        m09UzgoGxzNUe2N+wWzqFdMIi1v8bRKeUKmw57A=
X-Google-Smtp-Source: APXvYqxyTSGcJ6sgBf9xLoRWa6x60OBdPGEKSoRXEwsVKCWPPI5AdU5lskpXpcz8ruL5VPFGLzKYA05JhO0pI0n3X2I=
X-Received: by 2002:a1f:8cd5:: with SMTP id o204mr4208837vkd.66.1576720851468;
 Wed, 18 Dec 2019 18:00:51 -0800 (PST)
MIME-Version: 1.0
References: <201912181000.82Z7czbN%lkp@intel.com> <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
 <20191218172353.GO22665@localhost>
In-Reply-To: <20191218172353.GO22665@localhost>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Dec 2019 11:00:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNATztV-a3maL+vqQhbVsLBD_dsy+wbOZQ5ofQfbZQGGuLA@mail.gmail.com>
Message-ID: <CAK7LNATztV-a3maL+vqQhbVsLBD_dsy+wbOZQ5ofQfbZQGGuLA@mail.gmail.com>
Subject: Re: kbuild obj-m directory descend (was: Re: [PATCH] serdev: fix
 builds with CONFIG_SERIAL_DEV_BUS=m)
To:     Johan Hovold <johan@kernel.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        kbuild test robot <lkp@intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Thu, Dec 19, 2019 at 2:23 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Dec 18, 2019 at 09:38:42AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > Commit 54edb425346a ("serdev: simplify Makefile") broke builds with
> > serdev configured as module. I don't understand it completely yet, but
> > it seems that
> >
> >       obj-$(CONFIG_SERIAL_DEV_BUS) +=3D serdev/
> >
> > in drivers/tty/Makefile with CONFIG_SERIAL_DEV_BUS=3Dm doesn't result i=
n
> > code that is added using obj-y in drivers/tty/serdev/Makefile being
> > compiled. So instead of dropping $(CONFIG_SERIAL_DEV_BUS) in serdev's
> > Makefile, drop it in drivers/tty/Makefile.
>
> I was just looking into this when you commented on this off-list.
>
> The offending patch is broken since it effectively makes
> CONFIG_SERIAL_DEV_BUS bool (built-in or disabled), but for some reason
> those symbols do not end up in vmlinux (despite being compiled) when you
> add a built-in object goal under a directory that was entered using
> obj-m.
>
> That seems like a bug to me and contradicts the kbuild documentation
> (3.6):
>
>         Example:
>
>         #fs/Makefile
>         obj-$(CONFIG_EXT2_FS) +=3D ext2/
>
>         If CONFIG_EXT2_FS is set to either =E2=80=98y=E2=80=99 (built-in)=
 or =E2=80=98m=E2=80=99
>         (modular) the corresponding obj- variable will be set, and
>         kbuild will descend down in the ext2 directory. Kbuild only uses
>         this information to decide that it needs to visit the directory,
>         it is the Makefile in the subdirectory that specifies what is
>         modular and what is built-in.
>
> I tried adding other targets to obj-y directly and they are also are not
> included, seemingly since the directory was entered using obj-m.
>
> Masahiro or Michal, can you shed some light?
>
> Johan


I saw similar questions in ML in the past.
Yes, this is how Kbuild works;
Kbuild only links objects in Makefiles visited by obj-y.

If you use
    obj-m +=3D serdev/
all objects in serdev/ are considered as modular.

I think it is better to make the document
clarify this.


--=20
Best Regards
Masahiro Yamada
