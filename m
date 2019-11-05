Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4F54EF481
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 05:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKEEdl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 23:33:41 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40276 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfKEEdk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 23:33:40 -0500
Received: by mail-pf1-f193.google.com with SMTP id r4so14182486pfl.7;
        Mon, 04 Nov 2019 20:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DqujcQR1IXthEE3N3Fyyf4WD+x8v8s3JUWn5jwtbB54=;
        b=nq87FMhW0QGYvjDC82a2VWAu1KMjc8K7YnphsoihQDNkGiGPYaKsMlE1dX7EIJpAmr
         XJWnhuR6K/rgiM8N9s64n80Z7Gh0GHmU61O3YKR698bE9Zx5gKPlVJWqq62eYi5gmoMg
         GvREtB9FcoAW6ZwVmN+FzvcBxAfWpAuplGk2KG7CCl6BHv8lfBk8WU+iT3txyqkOzcP3
         2yZiYhVX4wDv47wbSfn4qdZJzyZhWlxGUYe6dArB9HHQK9VhyF+puWRPiWcEiduk17Fg
         Jn9S1PpPYnfcOqaPWVgNHdP9Z8z2ASkYi3CP5lqblqzUpn32bt1vTDdMigq1KVi5q6g5
         9LoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DqujcQR1IXthEE3N3Fyyf4WD+x8v8s3JUWn5jwtbB54=;
        b=KzIKFBB9WCIo6CSb277sMS196HjBsVZb2luab+blcw2FBCnQhzCxqAPtCZnVl1ir/p
         HwacrLXWu61Nrw/krcDx/dnenL77Or6spRWlB51vxubLAFdM2b4aeCv3mGmeF9y8ljK5
         pF7o1PHi+ZC+bpeDjvSSoeOMG9Nkz9aTnU5ZVcVitsz3l/G3fzCjdk7tqa33qRCbytAQ
         i4wc60A2D/eKgcuHNV+zUfA0fvQnrjvi9DcgFjJEJ9lvnbadUS6trFzCkfBef7+OzYe3
         AyEWRsfHsU3EhvmgepKhIQC1nszvW48H//Oe2+7D2h6WxOk4bu7iVQ73tTiNhJHGubtu
         vKRA==
X-Gm-Message-State: APjAAAUhrjkaGJUaxjCHLAqgvd2wTw25twr9VsAQ/NS9WjvW1CpL5fta
        xVHiCIeGMPPN8825kCzU3yv9IqK+M9WvsA==
X-Google-Smtp-Source: APXvYqzAqBxJ1xUqZ//4wIi6/fo06V6ubF9lLdiJjyjiRDvfSYJKsBEukT3zV3bSUOsrQqNv4ZVozg==
X-Received: by 2002:aa7:8249:: with SMTP id e9mr35296169pfn.19.1572928419814;
        Mon, 04 Nov 2019 20:33:39 -0800 (PST)
Received: from Gentoo ([103.231.91.66])
        by smtp.gmail.com with ESMTPSA id t8sm19270377pjv.18.2019.11.04.20.33.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 20:33:39 -0800 (PST)
Date:   Tue, 5 Nov 2019 10:03:26 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191105043323.GA27350@Gentoo>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18:03 Mon 04 Nov 2019, Randy Dunlap wrote:
>On 11/1/19 11:30 PM, Bhaskar Chowdhury wrote:
>> This patch allow you to remove old kernels and associated modules
>> directory from the system.You can do it at once with the -r flag
>> and interactively with the -i flag.
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++---------
>>  1 file changed, 65 insertions(+), 17 deletions(-)
>
>Hi,
>I believe that this script now does what the patch author intends it to do.
>It does have a few whitespace issues, but no big deals.  (see below)
>
>Tested-by: Randy Dunlap <rdunlap@infradead.org>
>
>
Thank you Randy..
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index e8aa940bc0a9..01d0778db71f 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -1,21 +1,69 @@
>>  #!/bin/bash
>>  # SPDX-License-Identifier: GPL-2.0
>> +#This script will remove old kernels and modules directory related to i=
t.
>> +#"-r" or "--remove" show how to silently remove old kernel and modules =
dir.
>> +# "-h" or "--help" show how to use this script or show without paramete=
r.
>> +#"-i" or "--interactive" show how to remove interactively.
>> +
>> +flag=3D$1
>> +kernel_version=3D$2
>> +modules_version=3D$3
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
>> +	printf "Usage: $(basename $0) [-ri]\n"
>> +	printf "\n -r or --remove  kernel_version modules_version\n"
>> +	printf "\n -i or --interactive do as interactive way\n"
>> +	return 0
>> +}
>> +
>> +case "$flag" in
>> +	-i | --interactive)
>> +		printf "\nEnter kernel version to remove or blank/empty to exit:"
>> +		read kernel_version
>> +		if [[ $kernel_version !=3D "" ]]; then
>> +			remove_old_kernel
>> +			printf "\nRemoved kernel version:$kernel_version from the system.\n\=
n"
>
>space after ':'
>
>drop one \n above.
>
Will do.
>> +			printf "Please give the full modules directory name to remove:"
>> +			read modules_version
>> +			if [[ $modules_version !=3D "" ]]; then
>> +				remove_old_modules_dir
>> +				printf "\n\nRemoved modules directory:$modules_version from the sys=
tem.\n\n"
>
>space after ':'
>
>drop one \n above.
>
Will do.
>> +			else
>> +				exit 1
>> +			fi
>> +		fi
>> +		;;
>> +	-h | --help)
>> +		usage
>> +		exit 0
>> +		;;
>> +	-r | --remove)
>> +		if [[ $# -ne 3 ]]; then
>> +			 printf "You need to provide kernel version and modules directory na=
me.\n"
>> +			 exit 1
>> +		 else
>> +			 remove_old_kernel
>> +			 remove_old_modules_dir
>> +		fi
>> +		;;
>> +	*)
>> +		usage
>> +		exit 1
>> +		;;
>> +esac
>>=20
>> -# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
>> -# again, /boot and /lib/modules/ eventually fill up.
>> -# Dumb script to purge that stuff:
>>=20
>
>OK, the former script's loop is removed.. good.
>But the 2 preceding blank lines are not removed, so the script
>now ends with 2 unnecessary blank lines.
>
Will do.
>> -for f in "$@"
>> -do
>> -        if rpm -qf "/lib/modules/$f" >/dev/null; then
>> -                echo "keeping $f (installed from rpm)"
>> -        elif [ $(uname -r) =3D "$f" ]; then
>> -                echo "keeping $f (running kernel) "
>> -        else
>> -                echo "removing $f"
>> -                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
>> -                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
>> -                rm -rf "/lib/modules/$f"
>> -                new-kernel-pkg --remove $f
>> -        fi
>> -done
>> --
>
>
>--=20
>~Randy
>
Bhaskar

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3A+48ACgkQsjqdtxFL
KRVpDQgA0c8060YO3XdTlh547axg5JL0CI+xBlRvYOltRP7LNrqoGYssxXzJAvoW
vr6f6dvhWoN3a+KGfiYRiWAxejFVGbwGeT7rBCz21tt/gvkG+8QKkvKttysT5g3m
1LL/s0XFh5qrnayU0tLb7Ql07s9MXegrJn9iUKqimATOow/SVGqN3/YJwNwtS3bR
cNx2aDfzRxBnFuwrFLO3nsMtI8slQtl8nryCrMekhug13qYCS21UJATyv4qnE8eP
seeuGNDrPAKV/HIvLxrt+C0ZjScnSuoNgCVu93LmF+LMDc7mB/LGruFbE6md996v
iqmNpGgkbpSjL68VG9FWvqGNDaiTgg==
=08zP
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
