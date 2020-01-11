Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 275A1137C0C
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2020 08:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgAKHTI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Jan 2020 02:19:08 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45449 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgAKHTI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:19:08 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 00B7IcjR030312;
        Sat, 11 Jan 2020 16:18:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 00B7IcjR030312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578727119;
        bh=sHgd8AShfibMn801gDdKF5ofxgr2mTmtOU0IywJZBdY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sj/F5cjD6t6cuqCPWU9JHwg+wjXMM97qiKIyUY/1+BUz7mtCmv2qWXNYUffVogmej
         IFL+1KOG1av0DKkKht2hzMfAnT/WafrecL+/uzjH3O9JVmQYN13RgWfpIlYm/AMj4r
         mBxUsLocebEr51w+KF+08S3/bjyjbfDi3DY5Kyz3o4qj91BaxKAF+ENerxIJR9uz52
         JveP2FfXoH9jwWamHD+CeYa3raj+R4okgZmmV9f0hImwbBc/5S/sLcBfPBVdC7K0rO
         ifkHZze+h+oeLRZSuT2mYcv0KzyLLT0fLYdB5+40Cg363HV00GupcLmYd4w5bhzMcO
         I2jpOLxJ1bWPg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id s16so2734096vsc.10;
        Fri, 10 Jan 2020 23:18:38 -0800 (PST)
X-Gm-Message-State: APjAAAV1kT8Vgc9fkWYyF21/U/Wg45UBHfMZ/X6MAgXmdDPP6M7L0RPK
        ffBlclIcl3mIkIbBxvj0kOrJ4Ptt4jFm3K52noU=
X-Google-Smtp-Source: APXvYqyUSajUsywX5gA06H08LwqxMlYLf9nEkCwF8h7cqZe+koZ7gGRcU99VQaSxykyTf3WFQfpNX9X51TlQmoUZU44=
X-Received: by 2002:a05:6102:3102:: with SMTP id e2mr1335679vsh.179.1578727117672;
 Fri, 10 Jan 2020 23:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20200109161724.9546-1-brgl@bgdev.pl> <CAK7LNAQQcGLq46QOhqHArQvQG8DP2uQDtpn8XoUthNhwu8Aiyg@mail.gmail.com>
 <CAMpxmJUp_sEzf7sO1m=A+16eAhMJtu2Z_O2cZk7XCQeSjNj9+A@mail.gmail.com>
In-Reply-To: <CAMpxmJUp_sEzf7sO1m=A+16eAhMJtu2Z_O2cZk7XCQeSjNj9+A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Jan 2020 16:18:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT8ZgeMRgm1jjnj6P+UPWF-uuJtJj8hmgCsx6JRD2h5rg@mail.gmail.com>
Message-ID: <CAK7LNAT8ZgeMRgm1jjnj6P+UPWF-uuJtJj8hmgCsx6JRD2h5rg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: ignore temporary generated files
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 10, 2020 at 1:38 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> czw., 9 sty 2020 o 17:36 Masahiro Yamada <masahiroy@kernel.org> napisa=C5=
=82(a):
> >
> > On Fri, Jan 10, 2020 at 1:17 AM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > If building gconfig fails, a temporary gtk config file is left in the
> > > kconfig directory and is not ignored by git. Add an appropriate patte=
rn
> > > to .gitignore.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  scripts/kconfig/.gitignore | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
> > > index b5bf92f66d11..d22e6753397d 100644
> > > --- a/scripts/kconfig/.gitignore
> > > +++ b/scripts/kconfig/.gitignore
> > > @@ -3,6 +3,7 @@
> > >  #
> > >  *.moc
> > >  *conf-cfg
> > > +*conf-cfg.tmp
> >
> > I have no idea in which situation this pattern is left.
> >
> > Could you tell me the way to reproduce it?
>
> Sure:
>
> 1. Don't have gtk+ development files installed.
> 2. Run `make gconfig`.
> 3. Watch it fail with the following error message:
>
> ---
> $ make gconfig
> *
> * Unable to find the GTK+ installation. Please make sure that
> * the GTK+ 2.0 development package is correctly installed.
> * You need gtk+-2.0 gmodule-2.0 libglade-2.0
> *
> make[1]: *** [scripts/kconfig/Makefile:212: scripts/kconfig/gconf-cfg] Er=
ror 1
> make: *** [Makefile:568: gconfig] Error 2
> ---
>
> 4. See the file `gconf-cfg.tmp` under scripts/kconfig.
>
> Bart

Thanks for this info.

This seems a kbuild bug, so I fixed the root cause
instead of hiding the garbage files.

https://patchwork.kernel.org/patch/11326631/


--=20
Best Regards
Masahiro Yamada
