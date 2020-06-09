Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54ADD1F3644
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 10:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgFIIoB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 04:44:01 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46502 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgFIIoA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 04:44:00 -0400
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0598haRb017078;
        Tue, 9 Jun 2020 17:43:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0598haRb017078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591692217;
        bh=e8kX0+5aGomAzLwDsXnzt7jasyQhhg0XP9lhP9IXPok=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fP0jVfTAk6akBMgPVPPA3p6Y0Ulv0419MpUjT+J9wsSlCBbAzycBoIUl2gDNB1jSS
         Cm94XjY3pxqxU/IQ5lzmUc0AK9ZF10o3UJKhw6Cn88LdGKixfwpX7hybImJ2+Mogt6
         r6v85oPLqCdTBAXgPmuFUZV9MzeWHuU4guv1UGBsgAhX23LZptFa0JI1Gd5lzGtsT2
         oR9DumhL4QhQ7CsgECZ258jOHelYARefS6XXEizZe0oPdbUpKYheBngNw6kjNOIcd5
         SG3Z/CdxrV+c/s4bt3+HxdEDHRSg3lXkDOOh5ryX/2FzJywpb5v2Mu+Hvxt2QoM1P1
         dD88G7xfIA51w==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id t23so4665259vkt.5;
        Tue, 09 Jun 2020 01:43:37 -0700 (PDT)
X-Gm-Message-State: AOAM531XkVId4NxK68IW+qom+wdNxh5K4HR5P4yCNnxu/zhrLxdhJKj5
        UhwzK/F8e++7DWH2l0Cx5xCgrq79a8YBoWYMcPg=
X-Google-Smtp-Source: ABdhPJybdBuXIdcm3NMMi6Ok/3bLzxD0AhR1+SsWG36SJ3zutgqHQCXiV0trFSvK6U8ZsdUDvxzrdAGQuxmy1e2pyNI=
X-Received: by 2002:a1f:1f04:: with SMTP id f4mr1717684vkf.73.1591692216276;
 Tue, 09 Jun 2020 01:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200511042149.1712876-1-masahiroy@kernel.org>
 <20200608020256.GA256950@roeck-us.net> <20200609062012.GA499862@kroah.com> <CAK8P3a2Pn22c8Z=w0FD15w4_+7LCWOpcbJ9b-Skh5iXzBjEx1g@mail.gmail.com>
In-Reply-To: <CAK8P3a2Pn22c8Z=w0FD15w4_+7LCWOpcbJ9b-Skh5iXzBjEx1g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 9 Jun 2020 17:42:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARM8UoE_L8EzhqQquu5FQwrUZLwrtjTFW_Va5ygBwhRmg@mail.gmail.com>
Message-ID: <CAK7LNARM8UoE_L8EzhqQquu5FQwrUZLwrtjTFW_Va5ygBwhRmg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make module name conflict fatal error
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 9, 2020 at 4:52 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jun 9, 2020 at 8:20 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Jun 07, 2020 at 07:02:56PM -0700, Guenter Roeck wrote:
> > > Hi,
> > >
> > > On Mon, May 11, 2020 at 01:21:49PM +0900, Masahiro Yamada wrote:
> > > > I think all the warnings have been fixed by now. Make it a fatal error.
> > > >
> > >
> > > Not entirely. With this patch in the tree, I get:
> > >
> > > Building sparc64:allmodconfig ... failed
> > > --------------
> > > Error log:
> > > error: the following would cause module name conflict:
> > >   drivers/char/adi.ko
> > >   drivers/input/joystick/adi.ko
> > > make[1]: *** [modules_check] Error 1
> > > make[1]: *** Waiting for unfinished jobs....
> > > make: *** [__sub-make] Error 2
> > >
> > > Reverting this patch fixes the problem.
> >
> > As it doesn't look like either of these drivers can be "auto-loaded"
> > based on hardware detection, I don't know what to suggest as for
> > renaming either of them.
> >
> > Any ideas?
>
> I see zero chance of a kernel actually needing to provide both drivers,
> given that the hardware is 20 years apart and gameports are almost
> exclusive to x86 PCs. How about an ugly hack:
>
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 940b744639c7..6f73f02059b5 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -45,6 +45,7 @@ config JOYSTICK_A3D
>  config JOYSTICK_ADI
>         tristate "Logitech ADI digital joysticks and gamepads"
>         select GAMEPORT
> +       depends on ADI!=m # avoid module name conflict
>         help
>           Say Y here if you have a Logitech controller using the ADI
>           protocol over the PC gameport.
>
>       Arnd


I am OK with this.
Thank you.


-- 
Best Regards
Masahiro Yamada
