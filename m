Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB30EE6B6B
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2019 04:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbfJ1DWX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Oct 2019 23:22:23 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36756 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfJ1DWW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Oct 2019 23:22:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id v19so5893905pfm.3;
        Sun, 27 Oct 2019 20:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1g4orQhG0h7E4t2LbP2B/HwssccERZrYS4AKVPNiYuM=;
        b=KYyvBlHeRE68I+k8FWgJUUpjKB6EddLKr0q0DoW8yCFnPMBuLEtU19nCVQWfHyrX0i
         i1Es2iZ/XD+TSdJdyPpeeMtQIwQe9YpPB4ZrTiFyT3tUvDKwR79tu95LxokH8lqolS34
         xNxFYNjC9CyIdOFb0WsDFaUKpwrXlbjp0EsKzdoXIoevcbVLTwfRkqdp25IPSkiBtnmd
         hMLMA1//XeKcgsxYuzpF7U4J3JQ+XNOaNKUmR3htc+P/7Bp9j9kYfM43NRiBKB38ym4l
         7Jl4nQ6WU8toAs33Qgus/syV30uD1mlC0aPUtpuslmrkAXFAaA/tow4tb/KBVMbD+DgU
         zeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1g4orQhG0h7E4t2LbP2B/HwssccERZrYS4AKVPNiYuM=;
        b=CoTng9UACva8viIfBAxeuJ2jTCDXxn0TM84sREKLaNSFEMvx+xjDfiIcCpQ0qMRS5M
         /dfKQ16hqWxVfW8Cb2kUjdPkhb30mSqVoaZaoaKV9upBL+ddoOD8fpKkel8QTqxfMK6y
         RXFKFpcch1APIJAl05CO9n54qLKlRWFEWxNKBoNCv3A1fFMgdFYdRp2mFAFhVReXgETc
         /b0D9qPHgIowRu0+7nXF+KtKViO88sVuIas6xAtqeD/UWJWI6RU1oCSsw1JRIIHXgjDL
         VMCrGz47JxIQYPE2tNs4LUt+TcYBeaU5r91lIZnzaURr3SB+cwWfhID9cEPeh6cN1A0F
         WM5Q==
X-Gm-Message-State: APjAAAWfabl/iako7IK5sO5Oq7cu89tiRzfTKvL+CH9zZ0cICnkZ+1Za
        +F/gjVWvjVGzfpCObedvxJo=
X-Google-Smtp-Source: APXvYqyWOyyK9kaAqv4ZffUqxnZ2OmIlluxzugEP/KDNtZT3qIXdpMDbSw+5NkCrqUCZYSnoeVhc0w==
X-Received: by 2002:a17:90a:fc8c:: with SMTP id ci12mr19158724pjb.140.1572232940366;
        Sun, 27 Oct 2019 20:22:20 -0700 (PDT)
Received: from Gentoo ([103.231.91.74])
        by smtp.gmail.com with ESMTPSA id a8sm9232591pff.5.2019.10.27.20.22.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 20:22:19 -0700 (PDT)
Date:   Mon, 28 Oct 2019 08:52:08 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        bfields@fieldses.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts:prune-kernel:prune old kernels and modules dir
Message-ID: <20191028032203.GA28082@Gentoo>
References: <20191025054703.16400-1-unixbhaskar@gmail.com>
 <4adba61c-9c1b-dee3-0a9b-9159dcce5a82@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <4adba61c-9c1b-dee3-0a9b-9159dcce5a82@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thank you Randy to point out the mistakes, will correct it and send it
for your review. Below mention things am doing...

On 11:24 Sun 27 Oct 2019, Randy Dunlap wrote:
>On 10/24/19 10:47 PM, Bhaskar Chowdhury wrote:
>> This patch will remmove old kernel and associated modules directory from
>> the system.
>>=20
>> Few interaction with the script ,below=20
>>=20
>> 1) =E2=9C=94 ~/git-linux/linux-kbuild [master =E2=86=91=C2=B718|=E2=9C=
=94]
>> 10:40 $ ./scripts/prune-kernel
>>=20
>>=20
>> 2)10:41 $ ./scripts/prune-kernel -h
>> You need to use this script like this :
>>=20
>>   ./scripts/prune-kernel -r kernel_version  modules_directory_name
>>  ./scripts/prune-kernel -i  option for interactive way to  use it.
>>=20
>>=20
>> 3) 10:41 $ ./scripts/prune-kernel -r 5.2.2 5.2.2-gentoo
>> Removed  kernel version:5.2.2 and modules directory:5.2.2-gentoo from
>> the system.
>>=20
>>=20
>> 4)10:41 $ ./scripts/prune-kernel -i
>>=20
>>=20
>>  Want to removing old kernels and modules dir [YN]: Y
>>  Please give another version to remove: 5.2.2
>
>These 2 lines above could (should) be combined into one line. E.g.:
>
>Enter kernel version to remove or blank/emtpy to exit:
>
>>  /boot/vmlinuz-5.3.7-050307-generic
>>  /boot/vmlinuz-5.3.6-050306-generic
>>  find: =E2=80=98/boot/efi=E2=80=99: Permission denied
>
>too noisy.
>
modified , it will not spit this again.
>>  Please give the full modules directory name to remove: 5.2.2-gentoo
>>  5.3.6-050306-generic
>>  5.3.7-050307-generic
>
>too noisy.
>
Same as above ...modified and will not spit again.
>>=20
>>=20
>>   Removed kernel version:5.2.2 and associated modules:5.2.2-gentoo
>>   ..Done.
>>=20
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>> To Bruce,
>> I have incorporated all the changes you asked for ,kindly review.
>>=20
>>  scripts/prune-kernel | 75 +++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 56 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index e8aa940bc0a9..292ba70d7770 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -1,21 +1,58 @@
>>  #!/bin/bash
>>  # SPDX-License-Identifier: GPL-2.0
>> -
>> -# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
>> -# again, /boot and /lib/modules/ eventually fill up.
>> -# Dumb script to purge that stuff:
>> -
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
>> +#This script will delete old kernels and modules directory related to i=
t interactively.
>> +#if you choose "-i" as interactive otherwise it will just go ahead and =
do the stuff once
>> +#you mentione the kernel_version and modules_directory_name as paramete=
r.
>
>        mention
>or better:
>        enter
>
Replaced with mentioned word i.e enter.

>> +flag=3D$1
>
>$flag is not used anywhere.
>
For interactive use case we need that.

>> +kernel_ver=3D$2
>
>remove_old_kernel() uses $kernel_version, not $kernel_ver.
>
>> +modules_dir_name=3D$3
>
>remove_old_modules_dir() uses $modules_version, not $modules_dir_name.
>
>> +boot_dir=3D/boot
>> +modules_dir=3D/lib/modules

>need a blank line here.
Fixed.
>
>> +remove_old_kernel() {
>> +	cd $boot_dir
>> +	find $boot_dir -name "vmlinuz-*" -type f -exec ls -1 {} \;
>
Removed.
>why the 'ls'?  too noisy IMO.
>
>> +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kern=
el_version
>> +	return 0
>> +}
>
>need a blank line here.
>
Fixed.

>> +remove_old_modules_dir() {
>> +	cd $modules_dir
>> +	find $modules_dir -maxdepth 0 -type d -exec ls -1 {} \;
>
>'ls' is too noisy.
Removed.
>
>> +	rm -rf $modules_version
>> +	return 0
>> +}
>> +while getopts :hir opt;
>
>$opt is not used anywhere.
It is required, without it , looks like this:

getopts: usage: getopts optstring name [arg]
>
>Does 'getopt's support long option strings?  E.g.,
>--interactive, --help, --remove.
>
Yes ..

=E2=9C=94 ~/git-linux/linux-kbuild [master =E2=86=91=C2=B727|=E2=9C=9A 1]
08:44 $ ./scripts/prune-kernel --interactive


Enter kernel version to remove or blank/emtpy to exit: 5.2.2
Please give the full modules directory name to remove: 5.2.2-whatever



 Removed kernel version: and associated modules:5.2.2-whatever ..Done.



>> +do=20
>
>'do' has a trailing space after it.  drop it.
>
Certain thing ..this space and tab killing me...how fix these damn thing
Randy??
>> +		 case "$1" in
>
>Is $1 the same as $flag here?

Yes and change it to that variable.

>> +			 -i | --interactive)
>
>bad indentation above.
>
Fixed.
>> +		 printf "\n\n Want to removing old kernels and modules dir [YN]: %s"
>> +		 read response
>> +		 if [[ $response =3D=3D "Y" ]];then
>> +			 printf "Please give another version to remove: %s"
>> +			 read kernel_version
>> +			 remove_old_kernel
>> +			 printf "Please give the full modules directory name to remove: %s"
>> +			 read modules_version
>> +			 remove_old_modules_dir
>> +			 printf "\n\n\n Removed kernel version:$kernel_version and associate=
d modules:$modules_version ..Done. \n\n"
>> +		 elif [[ $response =3D=3D "N" ]];then
>> +			 exit 1
>> +		 fi
>> +		 ;;
>> +	                  -h | --help)
>
>bad indentation.
>
Fixed.
>> +                   =20
>
>line above is just a bunch of spaces.  bad.
>
>> +                     printf "You need to use this script like this :\n
>
>use tabs to indent, not spaces.
>
Fixed.
>> +	             $0 -r kernel_version modules_directory_name\n
>> +                     $0 -i option for interactive way to use it.\n\n"
>
>inconsistent indentation.
>
Fixed.
>> +	     =20
>
>line above is just spaces.  Empty lines are OK, even good for
>readablility, but they should not end with spaces or tabs.
>
Fixed.
>> +	         exit 1
>> +		     ;;
>> +	                 -r | --remove)
>> +			 shift $(( OPTIND - 1 ))
>
>What is the purpose of the shift, when this case ends with exit?
>
Positional parameter shifting

>> +			 rm -f kernel_ver
>
>			       $kernel_ver
>
>Probably need to cd $boot_dir for above 'rm'.
>or just rm -f $boot_dir/$kernel_ver
>
Fixed.
>> +                         cd $modules_dir
>> +	                 rm -rf $modules_dir_name
>> +	                 printf "Removed  kernel version:$kernel_ver and modul=
es directory:$modules_dir_name from the system.\n\n"
>> +			 exit 0
>> +                         ;;
>> + esac
>
>esac indentation does not match case.
>
Fixed
>> +     done
>
>done indentation does not match do.
>
Fixed
>
>Nack.
>

>--=20
>~Randy
Bhaskar

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl22XtUACgkQsjqdtxFL
KRUh1Qf+I4qhlOu6pK0nFfllliB1e+217Hgo68r8W1p5i+WGCjjFtH91hUZb0Z1C
ucOso+PkRNI7ifOBFos/zIXoQe3oXnKeTlDx50FcXpp+GVyKy3UAoA5bwmhrURIw
nSDwDQg709vPyaoTsa4G5sxwH6KjWQA+0aAa2cE6yAg9BfYBNZgROzxhNKwkjSnP
qoRD698tlrFwd31ZXoJd7sOX3TJqks6EGSCzW/U0z2Rx0Q5z+yc3EMMeSlPJLTz4
R6ejCLmRfkZ2ELXFI3euPuQKiAld1BD16Frv0YzgcxPgEPFvBNH6781YzWBvXkW9
F0VFin04vVm0OJZMFNxP6+o7q8mE1Q==
=6BFy
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
