Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC18AEA9B5
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2019 04:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfJaDhj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Oct 2019 23:37:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34768 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfJaDhi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Oct 2019 23:37:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id e4so3020156pgs.1;
        Wed, 30 Oct 2019 20:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mPsPUml0sNW+3Kwo6RoNazHiy7iLhREbWowwWS3FO18=;
        b=Jkb5eNI1vtB6A2ccG7ogqa6y8nNNR6PClJKOXbUDVpOSGBDLkQBAa8ZxYC4DrCZCOP
         e7Tso7UcXs9/sTyknAMWMWyK9zM65y87lFvguZRx2M//JW+XrQM9+gpIAiqCkAIkrVkT
         rEswduWh+wbZc7q3v0n2G8Wkyq2gHbBo3DNvtlIG/q/WLbAMyNvaCjfHmAzbo9o7/F6k
         V5oHtEV+rFvOj1PGoGGaxDS+AU1wJoL2fs7vRnJ5egr9pV+A/bD+ejrdsBpwaIfVoSnv
         v/tQCGJorwYHL366BSff8ksMb6aeL8E5RmNZYzKXMBfhXBs2usLdiV2kIMNYkiXsFCzv
         CfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mPsPUml0sNW+3Kwo6RoNazHiy7iLhREbWowwWS3FO18=;
        b=jds+wxC6XZ3t+7S0e8VOvBlRLCe6nwrf50hokuHIHczftGov29nBbv339gZblMyGvS
         b+g9CzUTVw5fmsffcIejyZuNajXgdPW4UoJsT4JwNNUVMbPZs4+hniYPCV/1T2dJqXe7
         YeHN2lzNEYIEa8Y2QuwzJIac9YXWXNZ6GnX/bbuWqGFD0afhFwqgfwBPs9NRnM/beT13
         HKpNyAS5OuWkvp/unc32OWBMmQlbF1cUkQRiIbfR169LFxrw3Y9inmIoCW5LlHmJtTHZ
         zmnnq2+YCjFV45W7ThSPhcVETvXjEbpik8q0Y73QKpRCufy/PCISWpC8Uf6+bVJZ0V0D
         sgSw==
X-Gm-Message-State: APjAAAXcGx6gY8mIA7WqFdaGtmg2kowtDfMrECh4dYVfsNEq/UameXoQ
        dBIdY+IvRvrTBINIKDP07AOagkGC/1g=
X-Google-Smtp-Source: APXvYqyKM8mcyT5PLsrbF+AZdF2jcPJxngsj4eAxW8Uv2kzTrTUBEifmibsijNPS6voTdyVfD2HspA==
X-Received: by 2002:a17:90a:a00e:: with SMTP id q14mr3896734pjp.132.1572493056916;
        Wed, 30 Oct 2019 20:37:36 -0700 (PDT)
Received: from Gentoo ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id e198sm1387121pfh.83.2019.10.30.20.37.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 20:37:36 -0700 (PDT)
Date:   Thu, 31 Oct 2019 09:07:25 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191031033722.GA7687@Gentoo>
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
 <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thank you Randy, my response are inline. Please look at it.I am
wondering , what else I could do get this damn! thing going??
Any clue??

On 19:33 Wed 30 Oct 2019, Randy Dunlap wrote:
>Hi,
>
>On 10/30/19 2:54 AM, Bhaskar Chowdhury wrote:
>> This patch will remove old kernels and modules directorey related
>> to that kernel from the system by interactively and silently.Here
>> are few interactions with the scripts
>>=20
>> 1)
>>=20
>> =E2=9C=94 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=E2=
=9C=94]
>> 14:52 $ ./scripts/prune-kernel -h
>> Usage: prune-kernel [ri]
>>=20
>>  -r | --remove kernel_ver modules_dir_name
>>=20
>>   -i | --interactive use as interactive way
>>   =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>>  =20
>>   14:52 $ ./scripts/prune-kernel --help
>>   Usage: prune-kernel [ri]
>
>That "[ri]" is confusing to me.
This are the options one has to pass with the script.Like below:
>>=20
>>    -r | --remove kernel_ver modules_dir_na]
>>=20
>>     -i | --interactive use as interactive way
>>   =20
>>  2)
>>=20
>>  =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>>  14:52 $ ./scripts/prune-kernel -r 5.3.3
>>  You need to provide kernel version and modules dir name
>> =20
>>  =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>>  14:53 $ ./scripts/prune-kernel -r
>>  You need to provide kernel version and modules dir name
>> =20
>>  =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>>  14:54 $ ./scripts/prune-kernel -r 5.3.3 5.3.3-foo
>
>This one above didn't remove any kernel files.
>Needs more testing.
It does remove but silently, as you and Bruce asked for this feature.
>
>> 3)
>>=20
>> $ ./scripts/prune-kernel --remove
>> You need to provide kernel version and modules dir name
>>=20
>> =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>> 14:55 $ ./scripts/prune-kernel --remove 5.3.3
>> You need to provide kernel version and modules dir name
>>=20
>> =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>> 14:55 $ ./scripts/prune-kernel --remove 5.3.3 5.3.3-foo
>>=20
>>=20
>> 4)14:55 $ ./scripts/prune-kernel -i
>>=20
>> Enter kernel version to remove or blank/empty to exit:
>>=20
>>=20
>> 5)14:57 $ ./scripts/prune-kernel --interactive
>>=20
>> Enter kernel version to remove or blank/empty to exit:
>> =E2=9C=94 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=E2=
=9C=94]
>>=20
>>=20
>> 6)14:59 $ ./scripts/prune-kernel --interactive
>>=20
>> Enter kernel version to remove or blank/empty to exit:5.3.3
>> Please give the full modules directory name to remove:5.3.3-foo
>>=20
>>=20
>>=20
>> Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.
>>=20
>>=20
>> 7)15:00 $ ./scripts/prune-kernel -i
>>=20
>> Enter kernel version to remove or blank/empty to exit:5.3.3
>> Please give the full modules directory name to remove:5.3.3-foo
>>=20
>>=20
>>=20
>> Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.
>>=20
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>=20
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index a25aa2160d47..a91010d0e2af 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -1,3 +1,66 @@
>>  #!/bin/bash
>>  # SPDX-License-Identifier: GPL-2.0
>> +#This script will delete old kernels and modules directory related to it
>> +#-h with the script will show you the help
>> +#-r with the script take two parameter: kernel_ver and modules_dir_name
>> +#-i with the script allow you do the removing interactive way
>>=20
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
>> +	printf "Usage: $(basename $0) [ri] \n"
>> +	printf "\n -r | --remove kernel_ver modules_dir_name \n"
>> +	printf "\n -i | --interactive use as interactive way \n"
>> +}
>> +
>> +for arg in "$@"
>
>what is the purpose (use) of "arg" here?

This variable is used in case statement below.
>what is the purpose of the for loop?
>
It scan through all the parameters pass .
>Is any 'shift' needed to consume (or discard) the first 3 positional
>command line arguments?
Nope, that is not required. And I haven't use any.
>
>> +do
>> +	case "$flag" in
>> +		-i | --interactive)
>> +			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
>> +			read kernel_version
>> +			if [[ $kernel_version !=3D "" ]]; then
>> +				remove_old_kernel
>> +				printf "Please give the full modules directory name to remove:%s"
>> +				read modules_version
>> +				if [[ $modules_version !=3D "" ]]; then
>> +					remove_old_modules_dir
>> +					printf "\n\n\n Removed kernel version:$kernel_version and associat=
ed modules:$modules_version ...Done. \n"
>
>This message is only printed if $modules_version is non-empty.  If it is e=
mpty,
>remove_old_kernel() has silently removed some kernel files (if they existe=
d).
it will fail to remove anything if the kernel_version or modules_version
are empty and importantly exit.
>
>> +				else
>> +					exit 1
>> +				fi
>> +			fi
>> +			;;
>> +		-h | --help)
>> +			usage
>> +			exit 1
>> +			;;
>> +		-r | --remove)
>> +			if [[ $# -ne 3 ]]; then
>> +				printf "You need to provide kernel version and modules dir name\n"
>> +				exit 1
>> +			else
>> +				cd $boot_dir
>> +				rm -f $kernel_ver
>
>That 'rm' doesn't remove any files.  Compare what remove_old_kernel() does.
No,it is not using that function rather take the parameter from the
commandline and get into boot dir match with it and remove it.
>
>> +				cd $modules_dir
>> +				rm -rf $modules_dir_name
>> +			fi
>> +			;;
>> +	esac
>> +done
>> --
>
>The script, after this patch is applied, still contains the old script's f=
or-loop
>at the end of the "new" prune-kernel script.

Amazing! now it needs some explanation how I did...you probably want
that ..here are the steps....
1)fetch that prune-kernel file from repos , which contains Bruce's code
in it.
2) get inot it by editior, remove all except first two lines i.e bash
interpreter and PSDX .
3)Save and commit it locally.
4) Write my own code
5) save it and commit it locally.
6) go one level up use checkpatch to see anything bad creeps in
7) Fixed the damn things if it reports.
8) create the patch
9) test it
10) Send it.

Now, how the heck , that for loop is getting staying there is a mystry
to me!! Look like that is ruin all the work.
irk...
>
>Nack.
>
>--=20
>~Randy

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl26VusACgkQsjqdtxFL
KRU8Pwf/eIERMg8q3PZ5HJKHoCXv5QSSgU9JUSvOKb2djHo2igkrh/CaEbXhPUlO
cx2bGWFlGuTEauqhtHQdjhINEjONAcniyHwgDwzuixUcjghuKH8CM/FSJvBQ1DjN
Z4SheFRmZsEMwcuJwNqmtUr+soiM+yM2CHiUDT5RjPGlByGdlExaYeVarykiakC6
P4e77eaP1N/Gz4pVQ7zetHBJLnnrYFmLPD/gfxs0F60MnHgyu2zGEmXI4mk3UZiR
YMhO/lowLGYKdtKRgk8zXHdeuKKaE8RA++ow3trQcJ4Cz85JNyqWSIUzKTJkySBP
j8OOJBfXmWFYpIlpwtsaSiIbyq/36g==
=zL2g
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
