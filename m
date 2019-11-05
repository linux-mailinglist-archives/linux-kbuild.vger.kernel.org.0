Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49EFDEF486
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 05:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKEEjh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 23:39:37 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40804 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfKEEjh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 23:39:37 -0500
Received: by mail-pf1-f196.google.com with SMTP id r4so14191469pfl.7;
        Mon, 04 Nov 2019 20:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QgcKeNzml2kJ7COyh9Zvo/FyKDXaI9rX2npXDV06bq0=;
        b=mT8Rz7iKEQE116nXpyp2dh2dA62404UkrmL6elYHA4a2GDXcdafvsnm9iOUdXkywNo
         bDXUJzOJQLuHhHEUGHtBJd3nNbHNHEpHYmGeChZL5p6zcu0M+5oy859v28XpcTyigOgA
         Ts4WKR3gOQwA0sUVru0X5fDNwiaYQapTzQr4BK5enQUs0LR20kAmU63/UtnuvWH5S5Ay
         S3YSXt+Cp24m+ZDVVoHwu+26kd+3LwUCvCFYAOEJ0Gz/91ecdXXIs0WwVObWIpMdswEP
         UDcwmFL2MxqeoHAEp5JfsLe7Umdh9fcwd1bPqlfidE5IYNvbh3Br2uPa71RPFaNwzzD/
         4UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QgcKeNzml2kJ7COyh9Zvo/FyKDXaI9rX2npXDV06bq0=;
        b=Re53xfkD46UNp+mROO6ELY/fcexV96Fx/Vvr8Ck+h8mweDq7vTzUKoNsy1GStjKyT6
         UqympNvQ3BjA01Hn3mTw+YFU205eCzuG80yCFZczgXUOSPXJcNRU2MxNlfx1uW/VY/6b
         CxrgRQZ56TcwSMHNr0EV5KEhK2QreNe9rjLK6Xzt6bOEPGCcaaz7JQU9nhe7pRPFlOa2
         /4MSzNyCjp1l+l0kS/siSEgxPfi89tm+Se993SJvLhha5PsnJosDHoS5BXCHGsEAz0Kr
         zyG8nOKZB5M8R74tNEV+k4khYAA4DJQELX1VMJ3Jp9E8EeXcLrcIVO9BUf/tCdjiBCU9
         /XMg==
X-Gm-Message-State: APjAAAXOe3plMUq30MyanTca6k7edHFyVxOd/pElCWh3Y9x5v5grTZ4q
        Lgri08WNPALIUgY1YwLQMKc=
X-Google-Smtp-Source: APXvYqyi/+2kvo0pirt7/elHBaLM+CN1QPz5/3lz3343jPwkUgMqmjoC091fE43BFYNEB8b/MjQrBQ==
X-Received: by 2002:a17:90a:3651:: with SMTP id s75mr3888934pjb.30.1572928774911;
        Mon, 04 Nov 2019 20:39:34 -0800 (PST)
Received: from Gentoo ([103.231.91.66])
        by smtp.gmail.com with ESMTPSA id i123sm20063164pfe.145.2019.11.04.20.39.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 20:39:34 -0800 (PST)
Date:   Tue, 5 Nov 2019 10:09:21 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191105043918.GB27350@Gentoo>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
In-Reply-To: <20191105023243.GA16635@fieldses.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 21:32 Mon 04 Nov 2019, J. Bruce Fields wrote:
>On Mon, Nov 04, 2019 at 06:03:13PM -0800, Randy Dunlap wrote:
>> On 11/1/19 11:30 PM, Bhaskar Chowdhury wrote:
>> > This patch allow you to remove old kernels and associated modules
>> > directory from the system.You can do it at once with the -r flag
>> > and interactively with the -i flag.
>> >=20
>> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> > ---
>> >  scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++---------
>> >  1 file changed, 65 insertions(+), 17 deletions(-)
>>=20
>> Hi,
>> I believe that this script now does what the patch author intends it to =
do.
>> It does have a few whitespace issues, but no big deals.  (see below)
>
>My original comment stands: looks like it prompts for full module path
>and kernel versions which means it's no more convenient than just doing
>an "ls" and then removing the ones you want to.  (In fact, with "rm"
>you'd also get the benefit of tab completion....)

Hi Bruce,
I am forcing user to put full modules directory name,kinda engagement=20
to the process.It is not a trivial operation, so the users should be=20
aware.
OHT Could you please state what else you would like to be inducted in
the so it can be useful?? So sorry for my weak memory if you already=20
explicitly stated something like that before.

Thanks,
Bhaskar
>
>It's quite different from the original script and I don't really see the
>advantage.
>
>--b.
>
>>=20
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>>=20
>>=20
>> > diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> > index e8aa940bc0a9..01d0778db71f 100755
>> > --- a/scripts/prune-kernel
>> > +++ b/scripts/prune-kernel
>> > @@ -1,21 +1,69 @@
>> >  #!/bin/bash
>> >  # SPDX-License-Identifier: GPL-2.0
>> > +#This script will remove old kernels and modules directory related to=
 it.
>> > +#"-r" or "--remove" show how to silently remove old kernel and module=
s dir.
>> > +# "-h" or "--help" show how to use this script or show without parame=
ter.
>> > +#"-i" or "--interactive" show how to remove interactively.
>> > +
>> > +flag=3D$1
>> > +kernel_version=3D$2
>> > +modules_version=3D$3
>> > +boot_dir=3D/boot
>> > +modules_dir=3D/lib/modules
>> > +
>> > +remove_old_kernel() {
>> > +	cd $boot_dir
>> > +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$ke=
rnel_version
>> > +	return 0
>> > +}
>> > +
>> > +remove_old_modules_dir() {
>> > +	cd $modules_dir
>> > +	rm -rf $modules_version
>> > +	return 0
>> > +}
>> > +
>> > +usage() {
>> > +	printf "Usage: $(basename $0) [-ri]\n"
>> > +	printf "\n -r or --remove  kernel_version modules_version\n"
>> > +	printf "\n -i or --interactive do as interactive way\n"
>> > +	return 0
>> > +}
>> > +
>> > +case "$flag" in
>> > +	-i | --interactive)
>> > +		printf "\nEnter kernel version to remove or blank/empty to exit:"
>> > +		read kernel_version
>> > +		if [[ $kernel_version !=3D "" ]]; then
>> > +			remove_old_kernel
>> > +			printf "\nRemoved kernel version:$kernel_version from the system.\=
n\n"
>>=20
>> space after ':'
>>=20
>> drop one \n above.
>>=20
>> > +			printf "Please give the full modules directory name to remove:"
>> > +			read modules_version
>> > +			if [[ $modules_version !=3D "" ]]; then
>> > +				remove_old_modules_dir
>> > +				printf "\n\nRemoved modules directory:$modules_version from the s=
ystem.\n\n"
>>=20
>> space after ':'
>>=20
>> drop one \n above.
>>=20
>> > +			else
>> > +				exit 1
>> > +			fi
>> > +		fi
>> > +		;;
>> > +	-h | --help)
>> > +		usage
>> > +		exit 0
>> > +		;;
>> > +	-r | --remove)
>> > +		if [[ $# -ne 3 ]]; then
>> > +			 printf "You need to provide kernel version and modules directory =
name.\n"
>> > +			 exit 1
>> > +		 else
>> > +			 remove_old_kernel
>> > +			 remove_old_modules_dir
>> > +		fi
>> > +		;;
>> > +	*)
>> > +		usage
>> > +		exit 1
>> > +		;;
>> > +esac
>> >=20
>> > -# because I use CONFIG_LOCALVERSION_AUTO, not the same version again =
and
>> > -# again, /boot and /lib/modules/ eventually fill up.
>> > -# Dumb script to purge that stuff:
>> >=20
>>=20
>> OK, the former script's loop is removed.. good.
>> But the 2 preceding blank lines are not removed, so the script
>> now ends with 2 unnecessary blank lines.
>>=20
>> > -for f in "$@"
>> > -do
>> > -        if rpm -qf "/lib/modules/$f" >/dev/null; then
>> > -                echo "keeping $f (installed from rpm)"
>> > -        elif [ $(uname -r) =3D "$f" ]; then
>> > -                echo "keeping $f (running kernel) "
>> > -        else
>> > -                echo "removing $f"
>> > -                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
>> > -                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
>> > -                rm -rf "/lib/modules/$f"
>> > -                new-kernel-pkg --remove $f
>> > -        fi
>> > -done
>> > --
>>=20
>>=20
>> --=20
>> ~Randy

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3A/PMACgkQsjqdtxFL
KRUyqQgAya3BYL2iEMk0N3b1/Ji3TVzjrhaMrYM1bc6MDs7UA83ikBBG7C/dSmZ9
3l9ANXfEnjaF64FpuLTNE2pT/tVxEj+xQz5iWw3JXV9TR7P2rq6814LH4b3hXX54
A9r0sIRz0xwCMq7ihtNtgXziyviLp8UkUjIK+1C4vQ0h9/CvP0YETq8fgRWASMrS
2+VErRPd06DryAAnapz9CnZz2Fju6S4mA2aaTJ3hiDLNmbj++6IoNQw+r5MZrWde
yUqPQcfAzxs6/GIuUPK3uStudgofQjCKbHbPho9jjmwXrNSFH6/0/pjz5R91oMu9
AWpkl0vkvAvzLsjRIeMG/MmClx0c3w==
=VReA
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
