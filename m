Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EA22BFFBF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 06:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbgKWFz1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 00:55:27 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:39080 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWFz1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 00:55:27 -0500
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0AN5st9O021305;
        Mon, 23 Nov 2020 14:54:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0AN5st9O021305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606110896;
        bh=jn3Xu+gxS+yWMV9eBhulgLuXbYWjP5oBQjfFqDpmzY4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T491TVaek5ejhy5WnCdkY1uhdZfagbwBFIowPiHtahBnqZOZdf6CZ5RF7Yl+57m4O
         9z9pO7eEjemse4isWl8o1gG5vtqFS/qGykc951QDN99mER7P8X1hTUzXNieOLPj1MD
         tONrhXSp8fy9f/6PzxM+YvKaVLEYhf08GY4eKzdf0hKGQVHwMbIGUBzLKYG89tENAn
         vaEMIpe4zzlGLSLHwAFFe6et32xgogH8SN113MFH7Qn2hkJEViYmGrctYRRSc4Nmpy
         OvMmsuaIPUJCrVI2M/WxlZ0BgOIX9uxB04ZLJd4AIPO9u1I2WxGorsQsfVhxQxiopt
         ZUbYRxkY68YjQ==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id e8so1976767pfh.2;
        Sun, 22 Nov 2020 21:54:55 -0800 (PST)
X-Gm-Message-State: AOAM531TZhYGOZbu2rewsDKNZQ+IZygdbjEEBvGoJ8Vvdgj3g39558LC
        D7WvQ6/yYuxxLxQjtWEpa1fZKHbUZkdqfQ1SAIc=
X-Google-Smtp-Source: ABdhPJxGkXrZMIP7JaTuIdt1sUF+7ujQ2MBxVPjd1INAwlaqzJYTdmn/mDahUunCTT9xNgt03FQR8lDtryIWh5tHnUk=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr14030652pgu.175.1606110894996;
 Sun, 22 Nov 2020 21:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20201102034001.409945-1-masahiroy@kernel.org>
In-Reply-To: <20201102034001.409945-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Nov 2020 14:54:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATQuajMK6K3HBE3U4JAHEZVXr1aqmPeC2Y=Xwp3bafszg@mail.gmail.com>
Message-ID: <CAK7LNATQuajMK6K3HBE3U4JAHEZVXr1aqmPeC2Y=Xwp3bafszg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: show Qt version in the About dialog
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Kolpackov <boris@codesynthesis.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 2, 2020 at 12:40 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> You can get the Qt version by running "pkg-config --modversion Qt5Core"
> or something, but this might be useful to get the runtime Qt version
> more easily. Go to the menu "Help" -> "About", then you can see it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>  scripts/kconfig/qconf.cc | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index cbe749b44b1a..d000869b787c 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1799,10 +1799,13 @@ void ConfigMainWindow::showIntro(void)
>  void ConfigMainWindow::showAbout(void)
>  {
>         static const QString str = "qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n"
> -               "Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n\n"
> -               "Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n";
> +               "Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n"
> +               "\n"
> +               "Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n"
> +               "\n"
> +               "Qt Version: ";
>
> -       QMessageBox::information(this, "qconf", str);
> +       QMessageBox::information(this, "qconf", str + qVersion());
>  }
>
>  void ConfigMainWindow::saveSettings(void)
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
