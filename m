Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93923DB9FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2019 01:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441690AbfJQXAT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 19:00:19 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37106 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389846AbfJQXAS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 19:00:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id u20so1864942plq.4;
        Thu, 17 Oct 2019 16:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hn50OmnbePcUrBFpzCHHjPlWMo4Zv5ggnBIvFTVy/1c=;
        b=EKxRTbc/ylIrzdUg8QwmKQ8lCf0hAqdDeh7kx/8psoxYyYcnXino7rOgEcNjfGI882
         SWuMmPHiQwkyXmBWHlCLx5flrLT49Pw9Fozp9qoSX0TanKLSGsQqRZNfszGrDnBHNbzW
         s8tK/i+6izd8u/sopL1my3YcDip0WwTJ4muqUvWY/wSu3nflp2PMfF/Mj9xJM3tV0dcf
         p2qu730FSxykyDoX50RRzK2zDH5hp3awi1fWrmRLUtLlVxbgkJPwh7PpBqodSEEvD/Tk
         0PuRLvxpSNscDg62NjiImYB1C9jUV+mU7RdLcf9y8Yexs/LbZFz6q43Gydrt0d7T8U1x
         UvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hn50OmnbePcUrBFpzCHHjPlWMo4Zv5ggnBIvFTVy/1c=;
        b=QzNOZmy3kattwDsp0cRbq/5OYM8QCjyXkp3yqNAFd53Bc6+hLU8Cb62t0umUKe7iyb
         cya9GA1v/v03ng/9JOgRldDxkVbnS0MzZSbppEVYUkzE+4G83+9rtlujdiymome9TCwj
         sd5rqFGkivHDAeuwbHdH8Qy36Sug/jin/T70UoLA9ZCRAJRpqU03HlsC/IUX3UN09KAR
         G2D7CARR7X2fIN/l+2Ih+wsa/+jo1e2iYRhKMaO1Ib6fQwpGiT9+e+uhjZsOmAuZJANm
         Ptga4pBGROjyw43gcOX4BCLwDSylDp7ucNiO/siuYUzv75ndtUjw33G9+UmwzHR/RbvH
         2WfQ==
X-Gm-Message-State: APjAAAUuVJICoz/Zb707vVBV5pMumMAjYqWZdMxGbfbCGGuZWD1lOY1n
        hvov4TiJ+d077OYj+5YjAhtcEm/w1MkSyg==
X-Google-Smtp-Source: APXvYqz+WwsKwsdDNjzRsnSV94v64w6bbgu3jT8vSj22GVocsgOFK1fOyebcH1wRnKPCgbOk+baYUw==
X-Received: by 2002:a17:902:6bc4:: with SMTP id m4mr6573308plt.103.1571353217991;
        Thu, 17 Oct 2019 16:00:17 -0700 (PDT)
Received: from Gentoo ([103.231.90.170])
        by smtp.gmail.com with ESMTPSA id h8sm4437245pfo.64.2019.10.17.16.00.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 16:00:17 -0700 (PDT)
Date:   Fri, 18 Oct 2019 04:30:03 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        bfields@fieldses.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts : prune-kernel : prune kernels generalized way
Message-ID: <20191017230000.GA13667@Gentoo>
References: <20191017063126.2005-1-unixbhaskar@gmail.com>
 <7965fdbe-eb2b-1178-61c3-ad54fa147fb3@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <7965fdbe-eb2b-1178-61c3-ad54fa147fb3@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 13:16 Thu 17 Oct 2019, Randy Dunlap wrote:
>On 10/16/19 11:31 PM, Bhaskar Chowdhury wrote:
>> This patch will remove old kernel from the system in a selective way.
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>> For Randy :
>> =E2=9C=94 ~/git-linux/linux-kbuild [master|AM/REBASE =E2=86=91=C2=B78|=
=E2=9C=94]
>> 11:42 $ ./scripts/checkpatch.pl -f
>> scripts/0001-Fix-all-the-concern-raised-by-Randy.patch
>> total: 0 errors, 0 warnings, 93 lines checked
>>=20
>> scripts/0001-Fix-all-the-concern-raised-by-Randy.patch has no obvious
>> style problems and is ready for submission.
>>=20
>> scripts/prune-kernel | 75 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 75 insertions(+)
>>=20
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index e69de29bb2d1..9461ae2bc122 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -0,0 +1,75 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
>> +# again, /boot and /lib/modules/ eventually fill up.
>> +# Dumb script to purge that stuff:
>> +
>> +#for f in "$@"
>> +#do
>> +#        if rpm -qf "/lib/modules/$f" >/dev/null; then
>> +#                echo "keeping $f (installed from rpm)"
>> +#        elif [ $(uname -r) =3D "$f" ]; then
>> +#                echo "keeping $f (running kernel) "
>> +#        else
>> +#                echo "removing $f"
>> +#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
>> +#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
>> +#                rm -rf "/lib/modules/$f"
>> +#                new-kernel-pkg --remove $f
>> +#        fi
>> +#done
>> +boot_dir=3D/boot
>> +modules_dir=3D/lib/modules
>> +function remove_old_kernel(){
>> +	cd $boot_dir
>> +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kern=
el_verison
>
>typo/spello: not tested:                                                  =
^^^^^^^^^^^^^^
>
/face palm
>> +}
>> +function remove_old_kernel_modules_dir(){
>> +	cd $modules_dir
>> +	rm -rf $modules_version
>> +}
>> +printf "\n\n Enlist the installed kernels \n\n"
>> +
>> +find $boot_dir -name "vmlinuz-*" -type f  -exec ls -1 {} \;
>> +
>> +printf "\n\n\n Please give the kernel version to remove: %s"
>> +read kernel_version
>> +if [[ $kernel_version -eq "" ]];then
>> +	printf "You have forgotten the version to give for removal"
>
>No message needed IMO -- just exit.
>
I though busy user mind should be reminded what they miss, so the msg.=20
>> +	exit 1
>> +else
>> +        remove_old_kernel
>> +fi
>> +
>> +printf "\n\n Enlist the installed modules directory \n\n"
>> +
>> +find $modules_dir  -maxdepth 0 -type d -exec ls -1 {} \;
>> +
>> +printf "\n\n Please give the full modules directory name to remove: %s"
>> +read modules_version
>> +if [[ $modules_version -eq "" ]];then
>> +	printf "You have forgotten to give the modules dir to remove"
>
>ditto.
>
Same login like above if it reaches here, which should not.
>> +else
>> +        remove_old_kernel_modules_dir
>> +fi
>> +
>> +printf "\n\n Removed kernel version: $kernel_version and associated mod=
ules: $modules_version ...Done \n"
>> +while :
>> +  do
>> +     printf "\n\n Do you want to remove another?[YN] : %s"
>> +     read response
>> +
>> +       if [[ $response =3D=3D "Y" ]];then
>
>Odd indentation here.  Some lines use tab, some lines use spaces.
>
Don't know how fix this bloody thing.
>> +	printf "Please give another version to remove : %s"
>> +	read kernel_version
>> +	remove_old_kernel
>> +	printf "\n\n Please give the full modules directory name to remove: %s"
>> +	read modules_version
>> +	remove_old_kernel_modules_dir
>> +        printf "\n\n Removed kernel version: $kernel_version and associ=
ated modules: $modules_version ...Done \n"
>> +
>> +      elif [[ $response =3D=3D "N" ]];then
>> +	   exit 1
>> +      fi
>> +  done
>> --
>> 2.21.0
>
>
>And lastly, 'patch' will apply this patch cleanly, but it ends up with
>almost all of this patch inserted into the new prune-kernel source file
>before the current contents of the prune-kernel source file,
>so I think that the emailed patch file has a problem.
>
Duh! that shit ...should have realized it before ...
>--=20
>~Randy
>
Thanks Randy for the heads up.

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2o8m0ACgkQsjqdtxFL
KRU9GAf+K+uMac1DNj+yAGyQcaXyUs3kvQtBfyLEacjl2ppnCzu7cLIAhtHAAFaK
Tc025f13QdHL8oYH6HS7ME/SyrDqgHUeulk0vWU9QzmnC+wU2NEnYcX5vXhHfXL/
gbhlR0UV7L8BNpPUQ6KNr/2UNugTdaDMdL2vfBd7qIo7jDGXZxF1elFTBqZXwU47
QZ/MG/9h3/E8yVc1EtbT9/WsuQOhGDH7+1djciMi4P0leYEmfXlC/hBxkREqq1ps
C6DxdyOWzaVE4aFzCz7C2/qJsETB2DH5cilo+txZZKIeterftdUbxS9rGbFVCLGN
nqRgM1vaRiBdtiEAdcEoIGqP5832bQ==
=Cl31
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
