Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8772E423E
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Dec 2020 16:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404872AbgL1PTL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Dec 2020 10:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404813AbgL1PTK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Dec 2020 10:19:10 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAAEC06179F;
        Mon, 28 Dec 2020 07:18:15 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id e7so5983748ile.7;
        Mon, 28 Dec 2020 07:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=OHzDwo9Udb5Sifio+VlqFP3IX6Ej2AdNRQcvhW/TDYk=;
        b=Qb83gkIDe6aV89hjUlGtUDel/KJYOw/rUnFzk+UK19vXxaWdlxN4FIefguSXHYCiUI
         pYztFuT+g5GyfdVm3GfVXowATETydMfORezM49Bx36JylirqZAAr+6aa4iIggzQOhgu5
         lKBukXpfLr3QN/xFxWnqh9oXC7R3zDaczJoY6Mrp6cxOEMDvG12yeQvl+E+5MvH9gPDt
         RqYE1wxDVyPtXeXe/LrnLH5A90xxl34yR64v7cJBltcjrID/HkQabn1k06fEUjVylZJg
         YVor95hH9qMViWaLITka2MMz9lOVfo6gzqa21xA1DWbx/ORyDpN+CTwpeyxx+PirPLqK
         PS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=OHzDwo9Udb5Sifio+VlqFP3IX6Ej2AdNRQcvhW/TDYk=;
        b=boOEFYnagHhuk4wXzIzHdOm6yAaHE1ND5GONPj78o/GNhjUi0Mek4u51fy1tAp2qJW
         vqf8kYw5RybkRKGZvjSusrCzxGWj3vfiFFWzeitN7sgZ0q6qXfpWTt7R3/kL5o37Svop
         FsGF5iIMB1S2cWy4MclknKr94MXT/R4z0VBcGU+TMf806qnTP8ZAzQJrjk2tNvDOVmSY
         +NVQtakJ1pCFUmbglEdik2zsMQgJ9QttIucyQ0U3vjt0dmIA6suV8kOa653hH+NKCInb
         yBPbmHmyfFTNv+NVSHAZDnaMKoO1eUJEVRG8n/CMHwR+2d5Ok09KL5uTSIlMye4ycXpu
         rfLA==
X-Gm-Message-State: AOAM5335pbbcf+Y2TpObmjIf0jumYg2XH5H5036XSBQ0CImSNEE1u0GD
        /2R7m+pMZEu5GY/B99SL95+UMWEuwSdHDNzY3Yw=
X-Google-Smtp-Source: ABdhPJxHl5tWAo02eEkMHSy8sQJJMiFSyj605xsHW5CJoug0tDSRo8EVnd36hS4znixpcWu4ke6w86HvrvgPteIXyzI=
X-Received: by 2002:a92:d0d:: with SMTP id 13mr32820993iln.209.1609168694871;
 Mon, 28 Dec 2020 07:18:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
In-Reply-To: <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 28 Dec 2020 16:18:03 +0100
Message-ID: <CA+icZUVEz91343V2joisOeUoNpK6fHu36aX914_ajF8C8FzAmQ@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 28, 2020 at 9:04 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, Dec 28, 2020 at 8:30 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > [ Please CC me I am not subscribed to LKML and linux-kbuild ML ]
> >
> > Hi Linus, Hi Mashiro,
> >
> > thanks for the Linux v5.11-rc1 release.
> >
> > With a new release I always do my first builds with my distro's
> > default compiler and linker (GCC v10.2.1 and GNU/ld BFD v2.35.1).
> > ( It's approx. 40% faster than LLVM toolchain v11.0.1-rc2 here on
> > Debian/testing AMD64. )
> >
> > The only warning I see for the first time (with v5.10.3 not observed):
> >
> >   sh ./scripts/depmod.sh depmod 5.11.0-rc1-1-amd64-gcc10-bfd
> > Warning: 'make modules_install' requires depmod. Please install it.
> > This is probably in the kmod package.
> >
> > The only change I see in this area is:
> >
> > 436e980e2ed5 kbuild: don't hardcode depmod path
> >
> > depmod from kmod Debian package is placed and I have no /sbin in my
> > user's path (and not before?):
> >
> > $ dpkg -L kmod | grep bin | grep depmod
> > /sbin/depmod
> >
> > $ which depmod
> > [ empty ]
> >
> > $ echo $PATH
> > /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
> >
> > OK, this is a warning, but might confuse other users.
> >
> > Please, let me know if you need further information and keep me CCed.
> >
> > Thanks.
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://git.kernel.org/linus/436e980e2ed526832de822cbf13c317a458b78e1
>
> [ Correct email-address of linux-kbuild ML ]
>
> This might be distro-specific:
>
> [ /etc/login.defs ]
>
> 99:# *REQUIRED*  The default PATH settings, for superuser and normal users.
> 100:#
> 101:# (they are minimal, add the rest in the shell startup files)
> 102:ENV_SUPATH
> PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
> 103:ENV_PATH    PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
>
> What is your recommendation?
>

For now, I reverted the above commit and use DEPMOD="/sbin/depmod".

Can I pass DEPMOD="/sbin/depmod" to my make line to override the
default DEPMOD in the top level Makefile?

- Sedat -
