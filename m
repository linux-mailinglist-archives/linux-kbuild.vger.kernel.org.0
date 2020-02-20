Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA4B1658A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2020 08:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgBTHqH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Feb 2020 02:46:07 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48072 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgBTHqH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Feb 2020 02:46:07 -0500
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01K7jnNe017759;
        Thu, 20 Feb 2020 16:45:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01K7jnNe017759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582184750;
        bh=6zhzpzAVSdaGoqnVCzrCzV7UypsIepdCzBEW+mzNg4g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LzqgfMc5G4lrLV1+sfUx8shwfKt4So/roIe/QPFBZsftvSnpYuoiMicA1h6NQHmHL
         KRMW9qD0IKqNMz38uF7hSEK+A5cZQ/hj6QtlKf5DmnNnHMJjoOdlU4xvcXXMKz2I8x
         ipN8SdwcTbtobL5tEqwwlJY9hs2PUmo3GEaN+pJjyNoqKSvWFqO9n8AR9TAecFdmTq
         SmPZegvYZHleOTdJrJMDnugBnSF6JxMCQ/09vtHlgraz1gxRiKU4/MrF8jEzeyZLAY
         PM7nNh1ry9rhrqwvAoUsI8MC9NgygmFLVrKYQOGNnyfjdj8nvrisv5X786gB435ppk
         vMPK1IY94OzGQ==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id b79so2071468vsd.9;
        Wed, 19 Feb 2020 23:45:50 -0800 (PST)
X-Gm-Message-State: APjAAAWqOH3hicYnmZzQ3CInviekLBJkHj93T5eGzbQzOiUTjuGCY2M9
        CbF7i+zsSOP15i7jWj2h8Pbd9eFlTfG4C4qJppw=
X-Google-Smtp-Source: APXvYqzet+Jcd7Q6URYa30drIqNgCGwf5AcZ20DJRwtg2ifTQsVzPG3djvIBPIpQovJgNJWuArA9QZh0McHY/6IivOw=
X-Received: by 2002:a67:6485:: with SMTP id y127mr17007256vsb.54.1582184749282;
 Wed, 19 Feb 2020 23:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20200219074950.23344-1-masahiroy@kernel.org> <nycvar.YSQ.7.76.2002191046520.1559@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2002191046520.1559@knanqh.ubzr>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 20 Feb 2020 16:45:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASubs2oJ8-a-amsEhWjYrfpAx8QxeTzH4PnKsELKyLaUw@mail.gmail.com>
Message-ID: <CAK7LNASubs2oJ8-a-amsEhWjYrfpAx8QxeTzH4PnKsELKyLaUw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nicolas,

On Thu, Feb 20, 2020 at 1:16 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Wed, 19 Feb 2020, Masahiro Yamada wrote:
>
> > The 'imply' statement may create unmet direct dependency when the
> > implied symbol depends on m.
> >
> > [Test Code]
> >
> >   config FOO
> >           tristate "foo"
> >           imply BAZ
> >
> >   config BAZ
> >           tristate "baz"
> >           depends on BAR
> >
> >   config BAR
> >           def_tristate m
> >
> >   config MODULES
> >           def_bool y
> >           option modules
> >
> > If you set FOO=y, BAZ is also promoted to y, which results in the
> > following .config file:
> >
> >   CONFIG_FOO=y
> >   CONFIG_BAZ=y
> >   CONFIG_BAR=m
> >   CONFIG_MODULES=y
> >
> > This ignores the dependency "BAZ depends on BAR".
> >
> > Unlike 'select', what is worse, Kconfig never shows the
> > "WARNING: unmet direct dependencies detected for ..." for this case.
> >
> > Because 'imply' should be weaker than 'depends on', Kconfig should
> > take the direct dependency into account.
> >
> > Describe this case in Documentation/kbuild/kconfig-language.rst for
> > clarification.
> >
> > Commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword") says that
> > a symbol implied by y is restricted to y or n, excluding m.
> >
> > As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
> > by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
> > possible value is BAZ=n.
>
> I don't think this is right. The imply keyword provide influence over
> another symbol but it should not impose any restrictions. If BAR=m then
> BAZ should still be allowed to be m or n.
>
> > @@ -174,6 +174,9 @@ applicable everywhere (see syntax).
> >       n               y               n               N/m/y
> >       m               y               m               M/y/n
> >       y               y               y               Y/n
> > +     n               m               n               N/m
> > +     m               m               m               M/n
> > +     y               m               n               N
>
> Here the last line shoule be y m n N/m.
>
> Generally speaking, the code enabled by FOO may rely on functionalities
> provided by BAZ only when BAZ >= FOO. This is accomplished with
> IS_REACHABLE():
>
>         foo_init()
>         {
>                 if (IS_REACHABLE(CONFIG_BAZ))
>                         baz_register(&foo);
>                 ...
>         }
>
> So if FOO=y and BAZ=m then IS_REACHABLE(CONFIG_BAZ) will be false. Maybe
> adding a note to that effect linked to the "y m n N/m" line in the table
> would be a good idea.
>

I also thought so.

I agree IS_REACHABLE() is much saner approach.

So, do you agree to change the current behavior
as follows?


index d0111dd26410..47dbfd1ee003 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -173,7 +173,7 @@ applicable everywhere (see syntax).
        ===             ===             =============   ==============
        n               y               n               N/m/y
        m               y               m               M/y/n
-       y               y               y               Y/n
+       y               y               y               Y/m/n
        y               n               *               N
        ===             ===             =============   ==============






-- 
Best Regards
Masahiro Yamada
