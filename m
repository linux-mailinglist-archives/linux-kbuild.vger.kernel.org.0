Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7323E950B
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2019 03:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfJ3Cn0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 22:43:26 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36482 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfJ3Cn0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 22:43:26 -0400
Received: by mail-pl1-f194.google.com with SMTP id g9so263316plp.3;
        Tue, 29 Oct 2019 19:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2WFOomf74Aeo/H05oFNO4I/Hl9NObY9P/rqGXI/Ny6w=;
        b=RYNZso7R5ubBsD2bOroWe40mkK+wfZ7IueD7b50pHMPIvcfjnr6FQhdeU10mTqsWlu
         G9jyI935H9UFVlWIMI61zJ/tugj2c2pUYJbbHsISGQss542V9Uy76dZnIa+nSjCdKw/a
         S1AAFpMQgOwvymE3y/llTdq7dhNCibVfoMzqytN74+yNBAg38Hj4nzOWPWddFaXmNOq7
         0hyyU58MvVDuGwaA4NRZamWxdEw8F0OoxMYAZib6SXUs334HFhUEdtIYf+YWxLLCdHHt
         DEyPWB0+f8aK5Xm6Uy1ROTrkyubaVX8xKwqkq6CtptzxLvhZNV9coY8+f705evre29kV
         Yj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2WFOomf74Aeo/H05oFNO4I/Hl9NObY9P/rqGXI/Ny6w=;
        b=nqd5d5AAqTvMRl1IEewSyaYXQkMGeJ6axn5779Ht+hpblDcp2wBbYrS3A2bvatmhZy
         vFrJNioHAQjo8vkUtgMv3Q8cr8mNDsq439cPxUGAUZl2l4anc8HowgXHebG9YjDvMY9l
         +fdW3fOI+veo3MUuuQlSk6zraNLKZSUReeDLmrTGSOKXQYEF+1xZX/dOR1ek/J7h46yd
         A4kjRZJ6MTnTsuhk0eAUPPrHU+FSqcdSPe/ZDAP6nsb4oJI4jMbNEZVEXjLhfsuG10sB
         c9kxdFYUsuVwbIvk+x93nNu5eOJeWAlAGtF1oKRAcQPrAM9waIQX0RkkyTttUL3exfeT
         uyLA==
X-Gm-Message-State: APjAAAW5lH1A1CbK2eModiIfslSIroWnQFZZOBWb0Ic1GsJSYEPctVel
        Bx64dgwYvuDVaWYjR8rvG64=
X-Google-Smtp-Source: APXvYqw3i6oS+GzOoalFx7JR+bN213g2uK0aEtU+Vvxtc4HUQiYr3FmRbX1f/OHRZHJSvq8yk4kkhQ==
X-Received: by 2002:a17:902:8308:: with SMTP id bd8mr2080758plb.86.1572403405615;
        Tue, 29 Oct 2019 19:43:25 -0700 (PDT)
Received: from ArchLinux ([103.231.90.171])
        by smtp.gmail.com with ESMTPSA id s7sm539480pgq.91.2019.10.29.19.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 19:43:24 -0700 (PDT)
Date:   Wed, 30 Oct 2019 08:13:12 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts:prune-kernel:prune kernel and modules dir from
 the system
Message-ID: <20191030024312.GA1251@ArchLinux>
References: <20191029030030.31659-1-unixbhaskar@gmail.com>
 <de2a4604-e3ba-dab1-c72c-a0ff451541cf@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <de2a4604-e3ba-dab1-c72c-a0ff451541cf@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17:05 Tue 29 Oct 2019, Randy Dunlap wrote:

>Hi,
Thank you Randy, my answers are inline , kindly look.

The modified version(implemented your suggestions) of the=20
script and their interaction will send in next patch mail.
>
>On 10/28/19 8:00 PM, Bhaskar Chowdhury wrote:
>> This patch will remove old kernel and modules directory from=20
>> the system interactive way and also at once ,provied the parameter
>> given to the invoking script.
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/prune-kernel | 58 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>=20
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index 58a7650ce592..a6c990450ddc 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -1,2 +1,60 @@
>>  #!/bin/bash
>>  # SPDX-License-Identifier: GPL-2.0
>> +#This script will delete old kernels and modules directory related to i=
t,both
>> +#automated and interactive way, if you choose -i or --interactive as pa=
rameter.
>> +#For normal operation you have to invoke this script like below
>> +#prune-kernel -r kernel_ver modules_dir_name
>> +flag=3D$1
>> +kernel_ver=3D$2
>> +modules_dir_name=3D$3
>> +boot_dir=3D/boot
>> +modules_dir=3D/lib/modules
>> +
>> +remove_old_kernel() {
>> +	cd $boot_dir
>> +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kern=
el_version
>> +	return 0
>> +}
>> +
>> +remove_old_modules_dir() {
>> +	cd $modules_dir
>> +	rm -rf $modules_version
>> +	return 0
>> +}
>> +
>> +usage() {
>> +	printf "Usage: $(basename $0) [-ri] \n"
>> +	printf "\n -r | --remove kernel_ver modules_dir_name \n"
>> +	printf "\n -i | --interactive use as interactive way \n"
>> +}
>> +
>> +while getopts :hir opt;do
>
>what is the purpose of "opt" above?
Getting rid of it, using alternative mechanism.
>It is not used AFAICT.
>
>My internet searching says that 'getopts' does not support "--options" (lo=
ng options).
>But then $flag is used below, not $opt, so the long options are just suppo=
rted
>by "flag=3D$1" at the beginning of the script.
>
Right.
>
>> +	case "$flag" in
>> +		-i | --interactive)
>> +			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
>> +			read kernel_version
>> +			if [[ $kernel_version !=3D "" ]]; then
>> +				remove_old_kernel
>> +				printf "Please give the full modules directory name to remove:%s"
>> +				read modules_version
>
>Need to handle modules_version =3D "" here.
>
Exit if they fail to provide one...inducting that.
>> +				remove_old_modules_dir
>> +				printf "\n\n\n Removed kernel version:$kernel_version and associate=
d modules directory:$modules_version ..Done.\n"
>> +			else
>> +				exit 1
>> +			fi
>> +			;;
>> +		-h | --help)
>> +			usage
>> +			exit 1
>> +			;;
>> +		-r | --remove)
>
>What happens if a user enters:
>
>./scripts/prune-kernel -r
>and no kernel_ver or modules_dir_name after -r?
Simply die.That is also putting in,because not putting=20
anything will defeat the purpose of having the flag in=20
first place.
>
>> +			shift $(( OPTIND -1 ))
>
>What is the purpose of the 'shift' since there is no loop to process more =
options?
>
Getting rid of it ,as we opted for different mechanism.
>> +			cd $boot_dir
>> +			rm -f $kernel_ver
>> +			cd $modules_dir
>> +			rm -rf $modules_dir_name
>> +			printf "Removed kernel version:$kernel_ver and modules directory:$mo=
dules_dir_name from the system. \n\n"
>> +			exit 0
>> +			;;
>> +	esac
>> +done
>
>This patch does not delete the original script loop, so that still follows
>after the 'done' above.  Was that intentional?
This is confuse me! not sure  what you meant. Did you meant to say
the do loop inside does not match with this pair???=20
>
>--=20
>~Randy



--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl24+LsACgkQsjqdtxFL
KRVnzAf/bSjiy38NlfoWuaKR31XnyKoJ45zCUtvo3gY96+hof0bbNkHmdZQ/Lxxe
QlOufbv8B8biNcZB5gxEH+XLsLEqq8mu4DtvOrVaGxIE2AETcYRNF7ifMY3NduZL
cpvdF5tR5mst0GBSIW+Q+kfviiYhK4xOVf3g23al7UqLFgMg/eMcAPHACvmFERhg
GG4ATfNCuMzVtGrJCxGgd8kXNc3yLF4b9GLy92umfF0r5lsqp9sLwIf+gBATwSqJ
jYIfu68CEG5qDJZjXlc5AelJYm432i6m3UOQZeYoFHDklEmFtC5/m9A3zemx8cHn
RXI9q02R8l3Ia/RLRVEI0QLUmOatIg==
=4ETu
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
