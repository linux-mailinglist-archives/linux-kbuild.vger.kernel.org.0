Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64AD2ECD0E
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2019 04:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbfKBDmh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Nov 2019 23:42:37 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42337 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfKBDmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 23:42:37 -0400
Received: by mail-pf1-f196.google.com with SMTP id s5so45691pfh.9;
        Fri, 01 Nov 2019 20:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lw1k1eNbKmMzE6m+Kjjv6TDWOopDzW6krlDDZq7O0vA=;
        b=SyYtM4a78ydUJlnXoAttkvc3KpGfjiJWkTjaXpp7bg8uXIjRNYGXA+R1NUvMWKn6Qd
         b9WDTtzYQTT2lR3lWBZ2cErXZy97nk26uYoxrRqZ/pL9j3tTSgQXdtRGuOCdozMdefp+
         u+8m0oa80HcSplEOq7CffglBZDw2X60fzjbc/xcqLDVzD65q4W0z464pUnjRJBof2MW1
         UI23+ZjVvvBq/hrZBeBq5mN9nv7NADXPwLvIios5ZIzNBjCMOYXFyxov5Secy9Yaso/U
         B6y73r2gQQ2KwYZ/1v/i/B/f9XhLpttLirf9OaLHKHLX+ZJr6vWpg+5SZ4wcQ+pdjTkl
         Yneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lw1k1eNbKmMzE6m+Kjjv6TDWOopDzW6krlDDZq7O0vA=;
        b=plkQeyO+PSvWK1BOwe9MJOYxWe7F12MS/tOLU5e9/zW+TLX+ccaGbhgp8RBFrzA8F7
         WhRJlgCaKYOM/fQ1VpxzUEQgXA2NYHCD/YVK2dCOdUPi3jjS5jqmSd+UF2C7LuUIQBf3
         QsNhGizat4tlRNomeb0qeVijcKIjm1Q8FyDpEIJOVNNdOuz9Qyx/iywI16lmkRfeyWod
         /jwkoO9fjDbEk5pywalqdJRJQHoLBcDjWQvted2ZS3Zcp575uju1wBsZzfOl6S3sINwB
         hPgQ9JN4Rg9oCcX12hsaG5bXJBMt+KB+S4b7Rwre5kAMjsvL+1TklkFJ/cgIuVkSwjNV
         LFLw==
X-Gm-Message-State: APjAAAVABmVVKKT9kzPxCQ9haRHsDXHOqRUh5deRIVZpiiB+Z4sFu1R1
        urqL1C0qbpZLxILIBCdAohw=
X-Google-Smtp-Source: APXvYqxWEikvzWc2hoEx2gbe8XkAglLyGBv9G0chfacYBlCRQLgR7mqMZnmFj6qHguRVN6/vl3M0YA==
X-Received: by 2002:a17:90a:3aed:: with SMTP id b100mr6144739pjc.62.1572666156470;
        Fri, 01 Nov 2019 20:42:36 -0700 (PDT)
Received: from Slackware ([103.231.91.34])
        by smtp.gmail.com with ESMTPSA id x190sm9163802pfc.89.2019.11.01.20.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 20:42:35 -0700 (PDT)
Date:   Sat, 2 Nov 2019 09:12:22 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts:prune-kernel:Removed old kernels and modules dir
 from system
Message-ID: <20191102034222.GA12001@Slackware>
References: <20191101080510.26247-1-unixbhaskar@gmail.com>
 <180b82ba-f90d-e3de-9ce1-c77a79d014d2@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <180b82ba-f90d-e3de-9ce1-c77a79d014d2@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19:04 Fri 01 Nov 2019, Randy Dunlap wrote:
>On 11/1/19 1:05 AM, Bhaskar Chowdhury wrote:
>> This patch allow you to remove old kernels and associated modules
>> directory from the system.You can do it at once with the -r flag
>> and interactively with the -i flag.
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>
>Hi Bhaskar,
>
>I think that you are getting a lot closer with this patch, but
>there are still a few issues.  And of course, it's not up to me
>whether the patch is applied.
>
>See below.
>
Hi Randy,

Thank you for the review. My understanding below...kindly glean on it..
>> ---
>>  scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>=20
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index a25aa2160d47..373a845792e6 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -1,3 +1,66 @@
>>  #!/bin/bash
>>  # SPDX-License-Identifier: GPL-2.0
>> +#This script will remove old kernels and modules directory related to i=
t.
>> +# "-h" or "--help" show how to use this script or show without paramete=
r.
>> +#"-r" or "--remove" show how to silently remove old kernel and modules =
dir.
>> +#"-i" or "--interactive" show how to remove interactively.
>>=20
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
>> +	printf "Usage: $(basename $0) [-ri] \n"
>> +	printf "\n -r or --remove  kernel_version modules_version \n"
>> +	printf "\n -i or --interactive do as interactive way \n"
>
>In those 3 printf's, drop the ending space before the \n.
>
Will do in next patch.
>> +	return 0
>> +}
>> +
>> +	case "$flag" in
>> +		-i | --interactive)
>> +			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
>
>Drop the %s - it's not needed.

Will do in next patch.
>
>> +			read kernel_version
>> +			if [[ $kernel_version !=3D "" ]]; then
>> +				remove_old_kernel
>> +				printf "Please give the full modules directory name to remove:%s"
>
>Drop the %s here also.

Will do it next patch.
>
>> +				read modules_version
>> +				if [[ $modules_version !=3D "" ]]; then
>> +					remove_old_modules_dir
>> +					printf "\n\nRemoved kernel version:$kernel_version and associated =
modules directory:$modules_version ...Done \n"
>> +				else
>> +					exit 1
>> +				fi
>> +			fi
>
>There is still a small problem here: if I enter a kernel_version and then
>remove_old_kernel() is called, and then I enter "" for modules_version,
>the script exits without that printf line.  I guess that it is possible
>that someone only wants to remove the kernel_version files and not the mod=
ules.
>

I beg to differ. I think keep around old modules only gobbles up the
space(I know it's aplenty these day...but I came from...)..anyway I
thought it would be good to get rid of these stale stuff at once.
>Perhaps the thing to do is just make the prompts and calls and printf tota=
lly
>separate and repeated for kernel_version and modules_version.  Do you see
>what I mean?  or do you have other ideas about this?

Okay, I can understand. I could have done that...but thought instead
show it at once . But again, I will take suggestion and put separate
print statement for kernel removal and modules removal.
>
>> +			;;
>> +		-h | --help)
>> +			usage
>> +			exit 1
>> +			;;
>> +		-r | --remove)
>> +			if [[ $# -ne 3 ]]; then
>> +				printf "You need to provide kernel version and modules directory na=
me \n"
>
>Drop the space before the \n.

Will do it next patch.
>
>> +				exit 1
>> +			else
>> +				remove_old_kernel
>> +				remove_old_modules_dir
>> +			fi
>> +			;;
>> +		*)
>> +			usage
>> +			exit 1
>> +			;;
>> +	esac
>> --
>
>Same comment as before: after applying this patch, the "new" scripts/prune=
-kernel file
>still contains the previous script's for-loop at the end of the "new" scri=
pt.
>
>
I am bemused and confused like hell Randy about this. This probably lack
of understanding about git ...not sure though...

In ,wild dream, can I implement a "real new file" and forget about this
whole chapter of trailing.??

Upfront apologies to Bruce...it seems I am getting defeated by my
shortcoming ...heck..
>--=20
>~Randy

Bhaskar
>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl28+xsACgkQsjqdtxFL
KRUUPwgAskS6Upypx30wOOkoplnopnp7dP8PkM9+PXlWn8Q9iJMmM71ZjD1UBzSQ
rZYL6rsTYPSZkJkAAZdayWTHU6Ttet2F2LOtwCxDMPJvMHWBzffp4IC7+llskLeG
bi1/Z5kl5cyFdlT93rCtssjH28+AdG+z5Wbn+tLRaGU+Bf7w/nwVarulp4UR+mC0
W6/zvGLx+TuLMBP9zAZo9//dcUiCjntQE5z4xg4w91CgD4kLlZUEIQ1P45vYtczq
Rew5jBZ81QTnmHR+5yr4x6zVCOSqSTeFRAPK/LcVThPU8ZNfBM7uUV1Ns99Zacq6
BokIQKZ6n91brYO0goKojNEkFxa6dw==
=LLCI
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
