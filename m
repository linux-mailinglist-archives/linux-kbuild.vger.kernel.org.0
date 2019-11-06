Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE6EDF0DC9
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 05:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730944AbfKFE3l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 23:29:41 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41835 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730583AbfKFE3l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:29:41 -0500
Received: by mail-pf1-f193.google.com with SMTP id p26so17852736pfq.8;
        Tue, 05 Nov 2019 20:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cEzk/8oDOYv4rMZYFovcOC7T1s33B/sHCx+vVjslo00=;
        b=MRQqUCi8y0aLkzs4AZYTW/zPFCyBHiASaOkVNuVKqNmwCvsbkmKdrTPGqd2MBG+m/l
         Nq0jiD8KcAi3guexyAxW8BVf165wcY3RLdtPv0UO3Ifo6kj9JbpWsCPuJsxSLCxqk1aP
         m0iNsgcXprGPrKH92kdqkNNAYFmUOoZpq/Vxs30xSP5OAvRTI4uuT4M43XmwWV2mY95y
         FNLx7brsby7djad1ukEO9PEISqaaE07N/dw4n+vP88Wtv0jAMdM8rUliFssn1kFkKROw
         sfHgf00bMM9iJjIsAxXQd9/qwiyPQ2e0SPu/roKXVPfUFj9YH08m+w+2kjS6qQ+s7W7Y
         EH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cEzk/8oDOYv4rMZYFovcOC7T1s33B/sHCx+vVjslo00=;
        b=T1wdjtYBuI23QnCqnLggNuZs//elGWYd0diSoYcouX+5xvCJcMVRuNXDJChOrjbQxD
         f7sI9zV8bcsXNT2Lx/ciC3ZLqVzhCDX1wfIrVFoczt9/ptLdGclhL0Jfz7z6suot/z6y
         ntRkXlVjxRQ/3JX6U2bKB4v8Du74r8KyCYntvPJRCwLuo2wlKNCFAQNh0Oboc/pQHuIs
         CLqTtyv44wGvRc4MKNHLPX6tlfSUORbI+xLGqIeE+kHBGWegLBufbv3QbN3kMhP758ax
         dWN9t2sruKd97LuIoIKkYE8yyKi/5/vY/lp6gwR5OfE8NGxu81WToAHR6P/K+KAfyGDl
         Lv8A==
X-Gm-Message-State: APjAAAWiFFs26ikLgKvPJ3pIcAlcu9k3SqUS7AElRHmRbIisEk1pOieq
        7rhAnp58egAt6roXxID1aPI=
X-Google-Smtp-Source: APXvYqysVoWGJ9Z+UwDC3VuCLB8LAqU9bY3x482YFddWnGSmoUKOHhg9EUeJZyiXGJ8AFXvUhBToRw==
X-Received: by 2002:a62:1c89:: with SMTP id c131mr807915pfc.168.1573014579877;
        Tue, 05 Nov 2019 20:29:39 -0800 (PST)
Received: from Gentoo ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id x9sm1048459pje.27.2019.11.05.20.29.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 20:29:39 -0800 (PST)
Date:   Wed, 6 Nov 2019 09:59:25 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "J. Bruce Fields" <bfields@fieldses.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191106042922.GD20442@Gentoo>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106031027.GA20442@Gentoo>
 <CAK7LNAQVhUS=WNoqgWQaS2-MJ9KoVBXurop8_vS5OC1VPtVTKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQVhUS=WNoqgWQaS2-MJ9KoVBXurop8_vS5OC1VPtVTKw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 13:03 Wed 06 Nov 2019, Masahiro Yamada wrote:
>On Wed, Nov 6, 2019 at 12:10 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> =
wrote:
>>
>> On 11:53 Wed 06 Nov 2019, Masahiro Yamada wrote:
>> >On Tue, Nov 5, 2019 at 11:32 AM J. Bruce Fields <bfields@fieldses.org> =
wrote:
>> >>
>> >> On Mon, Nov 04, 2019 at 06:03:13PM -0800, Randy Dunlap wrote:
>> >> > On 11/1/19 11:30 PM, Bhaskar Chowdhury wrote:
>> >> > > This patch allow you to remove old kernels and associated modules
>> >> > > directory from the system.You can do it at once with the -r flag
>> >> > > and interactively with the -i flag.
>> >> > >
>> >> > > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> >> > > ---
>> >> > >  scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++---=
------
>> >> > >  1 file changed, 65 insertions(+), 17 deletions(-)
>> >> >
>> >> > Hi,
>> >> > I believe that this script now does what the patch author intends i=
t to do.
>> >> > It does have a few whitespace issues, but no big deals.  (see below)
>> >>
>> >> My original comment stands: looks like it prompts for full module path
>> >> and kernel versions which means it's no more convenient than just doi=
ng
>> >> an "ls" and then removing the ones you want to.  (In fact, with "rm"
>> >> you'd also get the benefit of tab completion....)
>> >>
>> >> It's quite different from the original script and I don't really see =
the
>> >> advantage.
>> >>
>> >> --b.
>> >
>> >I am with Bruce.
>> >
>> >This patch is trying to replace everything
>> >with worse code.
>> Well,Masahiro,
>> I won't mind dropping the idea, which you already concluded.But, would
>> you care to let me know how worse the code seems to be????
>
>
>As far as I understood this script,
>it is useful to delete stale versions with a single command.
>
>scripts/prune-kernel  5.2-rc1  5.2-rc2  5.2-rc3
>
>
>This patch is dropping the 'for f in "$@"' loop,
>so you would end up with running this script multiple times.
>
>scripts/prune-kernel -r  5.2-rc1  5.2-rc1
>scripts/prune-kernel -r  5.2-rc2  5.2-rc2
>scripts/prune-kernel -r  5.2-rc3  5.2-rc3
>
Yes, true. You don't want all the stale kernels to be discarded at once,
do you???
>
>What is funny is, it takes the kernel_version and modules_version
>separately.
Lack of farsight of mine ...will take your suggestion. Should have
realized it before, but was writing for different purpose.

>And now it requires -r option for the default behavior.
Because other flags are involved and they do different things.

>I see nothing cool overall.
>
Meh... I am interpreting you "cool" literal way...which you certainly
didn't mean it...do you??
>
>
>J. Bruce Fields suggested:
>"But if somebody does actually use it as-is, it'd be nicer to keep the
>current behavior and add an option ("-i" or something) for the
>interactive behavior."
>
Yes, that's true ...and now I understood. On the contrary ,if I
recollect properly, Bruce ,once told that he won't if do something which
will be useful to the wider users..not sure that stands anymore.
>
>I want to see a patch if and only if
>you can add -i without intrusively changing the current code.
>
Hopefully , you wish get fulfilled sooner than later.
>
>Masahiro
>
>
>
Bhaskar
>
>> >
>> >BTW.
>> >Bruce,
>> >Does the current script expect RHEL or something?
>> >I do not see 'new-kernel-pkg' on my Ubuntu machine.
>> >
>> >It would still work with 'new-kernel-pkg: command not found'
>> >warning.
>> >
>> >We could bypass it if we like.
>> >
>> >command -v new-kernel-pkg && new-kernel-pkg --remove $f
>> >
>> >
>> >
>> >Masahiro Yamada
>> >
>> >
>> >
>> >> >
>> >> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
>> >> >
>> >> >
>> >> > > diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> >> > > index e8aa940bc0a9..01d0778db71f 100755
>> >> > > --- a/scripts/prune-kernel
>> >> > > +++ b/scripts/prune-kernel
>> >> > > @@ -1,21 +1,69 @@
>> >> > >  #!/bin/bash
>> >> > >  # SPDX-License-Identifier: GPL-2.0
>> >> > > +#This script will remove old kernels and modules directory relat=
ed to it.
>> >> > > +#"-r" or "--remove" show how to silently remove old kernel and m=
odules dir.
>> >> > > +# "-h" or "--help" show how to use this script or show without p=
arameter.
>> >> > > +#"-i" or "--interactive" show how to remove interactively.
>> >> > > +
>> >> > > +flag=3D$1
>> >> > > +kernel_version=3D$2
>> >> > > +modules_version=3D$3
>> >> > > +boot_dir=3D/boot
>> >> > > +modules_dir=3D/lib/modules
>> >> > > +
>> >> > > +remove_old_kernel() {
>> >> > > +   cd $boot_dir
>> >> > > +   rm -If vmlinuz-$kernel_version System.map-$kernel_version con=
fig-$kernel_version
>> >> > > +   return 0
>> >> > > +}
>> >> > > +
>> >> > > +remove_old_modules_dir() {
>> >> > > +   cd $modules_dir
>> >> > > +   rm -rf $modules_version
>> >> > > +   return 0
>> >> > > +}
>> >> > > +
>> >> > > +usage() {
>> >> > > +   printf "Usage: $(basename $0) [-ri]\n"
>> >> > > +   printf "\n -r or --remove  kernel_version modules_version\n"
>> >> > > +   printf "\n -i or --interactive do as interactive way\n"
>> >> > > +   return 0
>> >> > > +}
>> >> > > +
>> >> > > +case "$flag" in
>> >> > > +   -i | --interactive)
>> >> > > +           printf "\nEnter kernel version to remove or blank/emp=
ty to exit:"
>> >> > > +           read kernel_version
>> >> > > +           if [[ $kernel_version !=3D "" ]]; then
>> >> > > +                   remove_old_kernel
>> >> > > +                   printf "\nRemoved kernel version:$kernel_vers=
ion from the system.\n\n"
>> >> >
>> >> > space after ':'
>> >> >
>> >> > drop one \n above.
>> >> >
>> >> > > +                   printf "Please give the full modules director=
y name to remove:"
>> >> > > +                   read modules_version
>> >> > > +                   if [[ $modules_version !=3D "" ]]; then
>> >> > > +                           remove_old_modules_dir
>> >> > > +                           printf "\n\nRemoved modules directory=
:$modules_version from the system.\n\n"
>> >> >
>> >> > space after ':'
>> >> >
>> >> > drop one \n above.
>> >> >
>> >> > > +                   else
>> >> > > +                           exit 1
>> >> > > +                   fi
>> >> > > +           fi
>> >> > > +           ;;
>> >> > > +   -h | --help)
>> >> > > +           usage
>> >> > > +           exit 0
>> >> > > +           ;;
>> >> > > +   -r | --remove)
>> >> > > +           if [[ $# -ne 3 ]]; then
>> >> > > +                    printf "You need to provide kernel version a=
nd modules directory name.\n"
>> >> > > +                    exit 1
>> >> > > +            else
>> >> > > +                    remove_old_kernel
>> >> > > +                    remove_old_modules_dir
>> >> > > +           fi
>> >> > > +           ;;
>> >> > > +   *)
>> >> > > +           usage
>> >> > > +           exit 1
>> >> > > +           ;;
>> >> > > +esac
>> >> > >
>> >> > > -# because I use CONFIG_LOCALVERSION_AUTO, not the same version a=
gain and
>> >> > > -# again, /boot and /lib/modules/ eventually fill up.
>> >> > > -# Dumb script to purge that stuff:
>> >> > >
>> >> >
>> >> > OK, the former script's loop is removed.. good.
>> >> > But the 2 preceding blank lines are not removed, so the script
>> >> > now ends with 2 unnecessary blank lines.
>> >> >
>> >> > > -for f in "$@"
>> >> > > -do
>> >> > > -        if rpm -qf "/lib/modules/$f" >/dev/null; then
>> >> > > -                echo "keeping $f (installed from rpm)"
>> >> > > -        elif [ $(uname -r) =3D "$f" ]; then
>> >> > > -                echo "keeping $f (running kernel) "
>> >> > > -        else
>> >> > > -                echo "removing $f"
>> >> > > -                rm -f "/boot/initramfs-$f.img" "/boot/System.map=
-$f"
>> >> > > -                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
>> >> > > -                rm -rf "/lib/modules/$f"
>> >> > > -                new-kernel-pkg --remove $f
>> >> > > -        fi
>> >> > > -done
>> >> > > --
>> >> >
>> >> >
>> >> > --
>> >> > ~Randy
>> >
>> >
>> >
>> >--
>> >Best Regards
>> >
>> >Masahiro Yamada
>
>
>
>--=20
>Best Regards
>Masahiro Yamada

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3CTB8ACgkQsjqdtxFL
KRW5NAgA0uVcwzRFLEvGndfy6LOeW2pEg7NLPhU6RiPRpAdGpvf4U02sO6H7B3DR
TC47joFXWmi8cbrQVQYyjlCspa2EenGfaD6qQWLtuYUoEux++H2CWsd1cyw1U6UX
LYv5Ibs3htO0LRjt+0r79Rt+v6RMucrs0A1Z3zrYrTJOPAhyQzaPJ6GZv06asx9Z
A9dC+An5s2tlirX3oKp/ERRBliR5WLHR+G3Yiae3JtwtjYtVXBgs9RuVjrrwsblJ
PcULONU318O8M2WGjNkASmnyN18TqSBtZltive5e7F+CnNNZ58QkwMe+zSJeYbcS
89FEJ3oG87N+PHp5XOXg+PJ9k1x7Cg==
=UI0O
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--
