Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E90F0CB9
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 04:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731233AbfKFDKq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 22:10:46 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36163 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730562AbfKFDKp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 22:10:45 -0500
Received: by mail-pf1-f195.google.com with SMTP id v19so17733150pfm.3;
        Tue, 05 Nov 2019 19:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=61rW3ZN687Kx3j+VgwRzZNWD70+TlJxx1UgOBW1jhZs=;
        b=RlwfvW2FHvnQ+TqEQmEQXdzw9lKZuOOTOuydSdJA0wohAfLqDmCFF9z7AFR8fphKRW
         Bw/OXm/vlqfX0LkDGNiqXT5TG1pu/YcY+vdq7gUml4ZMzO4QgRHKRtlbehBmCJ1Fz6T+
         KV1lsj5D8SeZJh37loLRcMjNlY8XkPxDdocc0SLfE8l10xgRB5nh3tRBkNczxfkzbIxm
         aJ5Y7Z802lg56hEdudzKNA37kmYZ+wnaRgR4gjh9ZFMwgh1WzVxNh6lfRMU5CMqEY7cF
         l0v+3wrL1Z4qpWsS6D9AOaPDqKnTUhqK0NP0qR/ewdTYP+RJNQatfdxOyZ2MnRrv1HYR
         ZV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=61rW3ZN687Kx3j+VgwRzZNWD70+TlJxx1UgOBW1jhZs=;
        b=nQF2Rf4q2fmp40xpy6hM6OrVl/pQNEffbUQaoUh8E09rtT7dSqKry4bdyG9kGAp27r
         mfELtNfNIAQ2FeCRr4KsV6f4EayEFIVUVsdyCOBbUqXDvmEs/WZ+qKBqm42semuGbBZe
         DRdm64E8+RjfOAlvMZtRfpJ2/AbJHC/jBpJuH/JriKBH1c/Vyolc9s0bzWjs1I+Pk+KZ
         fTD2PuJuCQhBABAOZ78nTpxvxqvUY/9ogXcAoXW8725sceLOvbEciJe2nvKVTTsLBNe4
         1btyxk0ivd4irmI2sBDXwricHnhKqhDc4lzPr28BHnwGaVDboYwiEbSRIoyftB/7KdVc
         WoJw==
X-Gm-Message-State: APjAAAXDJGnCncJvP8DCxN1ePV8b9W9LnYsEziagfAAHQwWnOTN+1it/
        9YM85QUXv8Jv955vThtrMFc=
X-Google-Smtp-Source: APXvYqxa/auhPBR0HVhmqJA1NTLFPujr+I2Qoyq8gC+9dsGyZ4ocI2p833oFKzyrnNYhYSqwjSStSA==
X-Received: by 2002:a63:de0b:: with SMTP id f11mr242482pgg.8.1573009844516;
        Tue, 05 Nov 2019 19:10:44 -0800 (PST)
Received: from Gentoo ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id a21sm816475pjv.20.2019.11.05.19.10.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 19:10:43 -0800 (PST)
Date:   Wed, 6 Nov 2019 08:40:30 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "J. Bruce Fields" <bfields@fieldses.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191106031027.GA20442@Gentoo>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 11:53 Wed 06 Nov 2019, Masahiro Yamada wrote:
>On Tue, Nov 5, 2019 at 11:32 AM J. Bruce Fields <bfields@fieldses.org> wrote:
>>
>> On Mon, Nov 04, 2019 at 06:03:13PM -0800, Randy Dunlap wrote:
>> > On 11/1/19 11:30 PM, Bhaskar Chowdhury wrote:
>> > > This patch allow you to remove old kernels and associated modules
>> > > directory from the system.You can do it at once with the -r flag
>> > > and interactively with the -i flag.
>> > >
>> > > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> > > ---
>> > >  scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++---------
>> > >  1 file changed, 65 insertions(+), 17 deletions(-)
>> >
>> > Hi,
>> > I believe that this script now does what the patch author intends it to do.
>> > It does have a few whitespace issues, but no big deals.  (see below)
>>
>> My original comment stands: looks like it prompts for full module path
>> and kernel versions which means it's no more convenient than just doing
>> an "ls" and then removing the ones you want to.  (In fact, with "rm"
>> you'd also get the benefit of tab completion....)
>>
>> It's quite different from the original script and I don't really see the
>> advantage.
>>
>> --b.
>
>I am with Bruce.
>
>This patch is trying to replace everything
>with worse code.
Well,Masahiro,
I won't mind dropping the idea, which you already concluded.But, would
you care to let me know how worse the code seems to be????
>
>
>BTW.
>Bruce,
>Does the current script expect RHEL or something?
>I do not see 'new-kernel-pkg' on my Ubuntu machine.
>
>It would still work with 'new-kernel-pkg: command not found'
>warning.
>
>We could bypass it if we like.
>
>command -v new-kernel-pkg && new-kernel-pkg --remove $f
>
>
>
>Masahiro Yamada
>
>
>
>> >
>> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
>> >
>> >
>> > > diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> > > index e8aa940bc0a9..01d0778db71f 100755
>> > > --- a/scripts/prune-kernel
>> > > +++ b/scripts/prune-kernel
>> > > @@ -1,21 +1,69 @@
>> > >  #!/bin/bash
>> > >  # SPDX-License-Identifier: GPL-2.0
>> > > +#This script will remove old kernels and modules directory related to it.
>> > > +#"-r" or "--remove" show how to silently remove old kernel and modules dir.
>> > > +# "-h" or "--help" show how to use this script or show without parameter.
>> > > +#"-i" or "--interactive" show how to remove interactively.
>> > > +
>> > > +flag=$1
>> > > +kernel_version=$2
>> > > +modules_version=$3
>> > > +boot_dir=/boot
>> > > +modules_dir=/lib/modules
>> > > +
>> > > +remove_old_kernel() {
>> > > +   cd $boot_dir
>> > > +   rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
>> > > +   return 0
>> > > +}
>> > > +
>> > > +remove_old_modules_dir() {
>> > > +   cd $modules_dir
>> > > +   rm -rf $modules_version
>> > > +   return 0
>> > > +}
>> > > +
>> > > +usage() {
>> > > +   printf "Usage: $(basename $0) [-ri]\n"
>> > > +   printf "\n -r or --remove  kernel_version modules_version\n"
>> > > +   printf "\n -i or --interactive do as interactive way\n"
>> > > +   return 0
>> > > +}
>> > > +
>> > > +case "$flag" in
>> > > +   -i | --interactive)
>> > > +           printf "\nEnter kernel version to remove or blank/empty to exit:"
>> > > +           read kernel_version
>> > > +           if [[ $kernel_version != "" ]]; then
>> > > +                   remove_old_kernel
>> > > +                   printf "\nRemoved kernel version:$kernel_version from the system.\n\n"
>> >
>> > space after ':'
>> >
>> > drop one \n above.
>> >
>> > > +                   printf "Please give the full modules directory name to remove:"
>> > > +                   read modules_version
>> > > +                   if [[ $modules_version != "" ]]; then
>> > > +                           remove_old_modules_dir
>> > > +                           printf "\n\nRemoved modules directory:$modules_version from the system.\n\n"
>> >
>> > space after ':'
>> >
>> > drop one \n above.
>> >
>> > > +                   else
>> > > +                           exit 1
>> > > +                   fi
>> > > +           fi
>> > > +           ;;
>> > > +   -h | --help)
>> > > +           usage
>> > > +           exit 0
>> > > +           ;;
>> > > +   -r | --remove)
>> > > +           if [[ $# -ne 3 ]]; then
>> > > +                    printf "You need to provide kernel version and modules directory name.\n"
>> > > +                    exit 1
>> > > +            else
>> > > +                    remove_old_kernel
>> > > +                    remove_old_modules_dir
>> > > +           fi
>> > > +           ;;
>> > > +   *)
>> > > +           usage
>> > > +           exit 1
>> > > +           ;;
>> > > +esac
>> > >
>> > > -# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
>> > > -# again, /boot and /lib/modules/ eventually fill up.
>> > > -# Dumb script to purge that stuff:
>> > >
>> >
>> > OK, the former script's loop is removed.. good.
>> > But the 2 preceding blank lines are not removed, so the script
>> > now ends with 2 unnecessary blank lines.
>> >
>> > > -for f in "$@"
>> > > -do
>> > > -        if rpm -qf "/lib/modules/$f" >/dev/null; then
>> > > -                echo "keeping $f (installed from rpm)"
>> > > -        elif [ $(uname -r) = "$f" ]; then
>> > > -                echo "keeping $f (running kernel) "
>> > > -        else
>> > > -                echo "removing $f"
>> > > -                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
>> > > -                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
>> > > -                rm -rf "/lib/modules/$f"
>> > > -                new-kernel-pkg --remove $f
>> > > -        fi
>> > > -done
>> > > --
>> >
>> >
>> > --
>> > ~Randy
>
>
>
>--
>Best Regards
>
>Masahiro Yamada

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3COZ8ACgkQsjqdtxFL
KRWVrAf/f7XlGHTm+DCHQQvJc/N5CFlmb0pqxDZadAw3T/yDSA7HDcGjNQlxb3Gb
9+/ald1wwaxhsFlbQ+hd0tRDPljsz6uoQlKTW+/JfBxPi+SFoojAZUhx18t7d7AK
fruM+AjZ7nfIRmQil8zcIOp5U7WDJ26UveAcWwuDN/u/EsdqOCUJqOYYhph91L1W
trl+5LD4NerIA8+7ULBB1wIto1Bf4F7KH3K5Qbl2aC+wLkWsEVN+VkIMjy0cTkdj
q9SwT7VGmETkRa+NiUWgthM97z/mzdFafkHpPNMNyM/+Dlhww9Zc4sYF23yBzkwt
xAUXFEQ2FFpIw48SYEZBAlVdQBijsw==
=NThd
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
