Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3CF4180A7
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Sep 2021 10:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbhIYJBN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 Sep 2021 05:01:13 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:43493 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235512AbhIYJBM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Sep 2021 05:01:12 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 18P8xE6r026464;
        Sat, 25 Sep 2021 17:59:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 18P8xE6r026464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632560355;
        bh=VSaTfxm3GlYBwjwX5ZuqpRBmhpWvdvRSYqYsc+xN7Jc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=H9uMhR5szng0mUulN0X8+5NfHjnQ3I2oqQVZgc5POa9OR6hfGsYzwdsA4ue8h1l0b
         ycwAkXPxD8ZwCdZtKavsDj/Cvfw9j725MntcY4TE/MPeFG3hgP1sQ1bNgN+1tbHBgS
         ucNhmIHTx+gL4Fla2mYpwT+8nbcmrfPB0mF3K+rwCjJb6WWeJ8iq0Rw2twBZkSbcnl
         DxbJrxp3z34hRF+Ch+EOrlTpd8Rzvsv91V915burP79HlDi8KnEzFtCYUskJMQIErW
         btNoiZw9DplCJkbS0JXQ32ZNJTNelolm0W0T3IbNBaPyKi6YwyvF/nCIP4j2aN1zkN
         H+NKPKPlGltiw==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so8917709pjb.1;
        Sat, 25 Sep 2021 01:59:15 -0700 (PDT)
X-Gm-Message-State: AOAM533klIZJR7xFZVq4l4Pc76r5V3K/rzy9k5We5TVmf73zusSp93gF
        wO95j63lCXS95CJhmqvJ52K4fJhR6jt471ry16o=
X-Google-Smtp-Source: ABdhPJxjT5huoCIq4kNkjdSWXjkwpERp6tF7pvCY2dU2OcPM1Nyp4cp4pnx7lJIIDMqLSYE3wK7bQu5T/Lj8py7AOFg=
X-Received: by 2002:a17:90a:4305:: with SMTP id q5mr7404961pjg.119.1632560354382;
 Sat, 25 Sep 2021 01:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210920213957.1064-1-richard@nod.at> <20210920213957.1064-2-richard@nod.at>
 <boris.20210922090732@codesynthesis.com> <1402570794.96583.1632295660867.JavaMail.zimbra@nod.at>
 <boris.20210922165140@codesynthesis.com> <1942256037.97524.1632327460626.JavaMail.zimbra@nod.at>
In-Reply-To: <1942256037.97524.1632327460626.JavaMail.zimbra@nod.at>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Sep 2021 17:58:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQjqLznMfk1u7FmpjZuwSfWnSinoHJxzGfCLcTSm19pog@mail.gmail.com>
Message-ID: <CAK7LNAQjqLznMfk1u7FmpjZuwSfWnSinoHJxzGfCLcTSm19pog@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: Deny command substitution in string values
To:     Richard Weinberger <richard@nod.at>
Cc:     Boris Kolpackov <boris@codesynthesis.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 23, 2021 at 1:17 AM Richard Weinberger <richard@nod.at> wrote:
>
> Boris,
>
> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Boris Kolpackov" <boris@codesynthesis.com>
> > An: "richard" <richard@nod.at>
> > CC: "masahiroy" <masahiroy@kernel.org>, "linux-kernel" <linux-kernel@vg=
er.kernel.org>, "linux-kbuild"
> > <linux-kbuild@vger.kernel.org>
> > Gesendet: Mittwoch, 22. September 2021 17:18:43
> > Betreff: Re: [PATCH 2/2] kconfig: Deny command substitution in string v=
alues
>
> > Richard Weinberger <richard@nod.at> writes:
> >
> >> > So effectively it's now impossible to include ` or $ in kconfig
> >> > string values. Seems like a major, backwards-incompatible
> >> > restriction.
> >>
> >> Do you have a working example?
> >
> > You mean of a project that uses kconfig and that is capable of
> > handling string values with these characters? If so, then yes,
> > see for example, libbuild2-kconfig[1] which is a build system
> > module that implements kconfig-based configuration support for
> > build2. In particular, it exposes values from .config  as
> > buildfile variables but it doesn't do this by sourcing .config.
> > Instead it loads .config using the kconfig API and then sets
> > the corresponding buildfile variables programmatically.
>
> I had a config setting of Linux in mind. :-)
>
> >
> >> Since the config is sourced in the scripts/setlocalversion it will
> >> not work correctly anyway.
> >
> > The actual file being sources is include/config/auto.conf, not
> > .config, right?
> >
>
> Yes. auto.conf is .config post processed.
> This is exactly where my mitigation takes place.
>
> >> > I think if this is really desired, then it should be re-done with
> >> > escaping (similar to ") rather than outright banning inconvenient
> >> > characters.
> >>
> >> Escaping is not so easy since the very same content is included
> >> in shell scripts (sertlocalversion), in Makefiles and in C files.
> >
> > Again, I don't think it's .config that gets included in C files but
> > rather include/generated/autoconf.h, right?
> >
>
> Yes. But the key/values are taken as-is.
>
> Just add some odd characters to your .config, build the kernel and observ=
e
> the breakage at different levels.
> Or something like CONFIG_DEFAULT_HOSTNAME=3D"`touch owned`". ;-)
>
> >> At least I didn't find find a good way to escape these characters
> >> such that all three programming environments will accept it.
> >
> > If my understanding is correct, then you are concerned with the
> > autoconf functionality: the auto.conf makefile and autoconf.h
> > header, and not the .config file itself. Perhaps it will be less
> > disruptive to do the escaping (or banning) at that level?
>
> My concern is that currently a .config file can contain hostile content
> that will get executed at build time.
> .config files are often blindly shared across untrusted developers.
> So I thought that mitigating this whole is worth it.
>
> > Specifically:
> >
> > 1. If you do escaping at that level, then you can do it differently
> >   for auto.conf and autoconf.h. Though auto.conf still seems to be
> >   read by both make and shell.
>
> I need to think about that. Thanks for the pointer.
>
> Thanks,
> //richard


I recalled that we discussed this a few years ago.

https://lore.kernel.org/all/20180217203945.2515-1-richard@nod.at/


include/config/auto.conf is just a sub-set of .config
with "# CONFIG... is not set" dropped.

If we do some escapings in it is not feasible
as you mentioned, due to the difference of escaping
between makefile and shell-scripts.

$$ for makefiles
\$  for shell scripts


If we go this way, perhaps, we need to generate two files
include/config/autoconf.mk and include/config/autoconf.sh


BTW, xtensa relies on having $ in the .config file.

masahiro@grover:~/workspace/linux-kbuild$ find . -name '*_defconfig' |
xargs grep '\$'
./arch/xtensa/configs/cadence_csp_defconfig:CONFIG_INITRAMFS_SOURCE=3D"$$KE=
RNEL_INITRAMFS_SOURCE"


If we make this decision, we need to persuade xtensa folks
to not do this...





--=20
Best Regards
Masahiro Yamada
