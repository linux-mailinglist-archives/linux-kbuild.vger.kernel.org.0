Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96AC7DDB4E
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Oct 2019 00:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfJSWQv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Oct 2019 18:16:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37346 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfJSWQv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Oct 2019 18:16:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id p1so5349508pgi.4;
        Sat, 19 Oct 2019 15:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=neYPV4O6frDBM2uwsYoI4BWVv8uN+9ZdFVUzQZVuc9Q=;
        b=oVJ0X8lNKFn0GNlABECBrOmC34jy2kcFNErjXr8gQTomtzdD7iCNLD1fBtnTUy8cHR
         Zyc2itVcNY2l+lUtP0PoFj+DUubsKso5XfQz8OAiesLK6mfc/Y9qWnF3HIWaLHbq2qHA
         JrqxslPSJ4uu0IunwSptSYa8lzVKcfQJABNwUBN/eWDULSqlBMb/oCz5sQ6+jKc50/Dr
         tiKeykCkQ8aqlGKzfnqjYV4DC4WLx5Axka4JCY2ZaxSDtQjFaD2NkGKVzo8wMyhWS4Cs
         ltDP4CrXJ3z3M2jYk6uOgzW0oNJc/h56ByfuU1FbcuEF1cuBu1Q0ckEANGJ/pX18PC4q
         PjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=neYPV4O6frDBM2uwsYoI4BWVv8uN+9ZdFVUzQZVuc9Q=;
        b=CDg5Gt9IjsXE4j7BBqHslfgAsMWuMnJvvyXaR3QA0sKlwPxKZHVPojPNJnWAdWkAm+
         ddHqma7n+WtcVeGP7Sq1W55QG3B+s8+RM+T1jwzz507KNign5vvWb0GXTBqopaY/yCo3
         V+w8lntMW/bK3bwWelCmzu0ZslFiPCniJvGwSyblCx0cdEYPw/sXulGuKZLbJD+Mvmqr
         cOI+NDdAri22yR6qjJ+ORRxotbDR1PFSarOU1Rm9AMQuEiBONG8K4Jpqa+PGBYTSIn+e
         XLMjkCoAjqQu/mzpoofiUMKS4hC3TlnvXYpKsTbHmarXfTDQvT1TTrspqBebMFSk0EV6
         RONA==
X-Gm-Message-State: APjAAAVkizQ3WXrPPmj18zc+BgD+Ad4+xLKgEKwPJrRaPGjmcnOwohgl
        kdpFxnGfffq6W0mVPaGXMJNTaO9sUZzplg==
X-Google-Smtp-Source: APXvYqwwwFoN0tmBp/66ZVTRFN2yNdemrcPhfEAWs27kgv3IQXI6AXy2fuFo9QPcx/e/NkQ8c7JbdA==
X-Received: by 2002:a63:fe44:: with SMTP id x4mr17492279pgj.118.1571523409086;
        Sat, 19 Oct 2019 15:16:49 -0700 (PDT)
Received: from Gentoo ([103.231.90.170])
        by smtp.gmail.com with ESMTPSA id f6sm10935260pfq.169.2019.10.19.15.16.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Oct 2019 15:16:48 -0700 (PDT)
Date:   Sun, 20 Oct 2019 03:46:35 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rdunlap@infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: prune-kernel : prune kernels generalized way
Message-ID: <20191019221632.GA17010@Gentoo>
References: <20191019130722.8067-1-unixbhaskar@gmail.com>
 <20191019160142.GA31839@fieldses.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20191019160142.GA31839@fieldses.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12:01 Sat 19 Oct 2019, J. Bruce Fields wrote:
>On Sat, Oct 19, 2019 at 06:37:22PM +0530, Bhaskar Chowdhury wrote:
>> This patch will remove old kernel from the system in a selective way.
>
>Please don't comment out code, just delete it, git's there to keep the
>old code.
>
I thought it would be more appropriate to know user why it's written in
first place.So ,deleting is not a good idea!

>There's some redundant code that should be inside a loop.
I don't want to make thing unnecessary complicated. Two more line
,scripts like this, doesn't harm at all. Easy for readability.
>
>A little more detail in the changelog might be useful to those of us who
>are lazy about reading bash script....
>
More "unnecessary" words doesn't make the actual purpose of the scripts
more helpful. I believe the single line I put is good enough for the
people to capture the essence.
>Looks like this just prompts for each individual delete?  Actually it
>looks like it requires the user to enter the module path and kernel
>version for each one which makes it not much more convenient use than a
>bare "ls" and "rm".
>
No , it is not. You missed out the point. The user should be reminded
what they are upto and precisely what is needed. I don't care who the
user are. This is operation just can not be done airy-fairy way.
>I personally use this in unattended scripts.  I mean, I don't really
>care what we do with this, as I use my own copy of the script, so
>whatever's useful to more people is fine.
>
Yes, you wrote it for your convenience, and that's great. I am thinking
of putting broader user base, so the verbosity and explicitness.
>But if somebody does actually use it as-is, it'd be nicer to keep the
>current behavior and add an option ("-i" or something) for the
>interactive behavior.
Subtle thing is not my cup of tea, honestly lack of bent of mind always
prevent me to doing that kind of thing.What you mention a flag would be
great and pretty trivial . But the whole point of having this script to
be "usable" lies somewhere else.
>
>--b.
>
Bruce, I am no way trying to demean or over riding your thought and
work. Just trying to make things work for everyone else. I just took it
your good work to extend it , certainly others could have done much
better if they stab on it,including you. No, doubt about it.

Thanks,
Bhaskar
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/prune-kernel | 86 ++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 72 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index e8aa940bc0a9..9d839a4e4539 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -5,17 +5,75 @@
>>  # again, /boot and /lib/modules/ eventually fill up.
>>  # Dumb script to purge that stuff:
>>=20
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
>> +#for f in "$@"
>> +#do
>> +#       if rpm -qf "/lib/modules/$f" >/dev/null; then
>> +#                echo "keeping $f (installed from rpm)"
>> +#        elif [ $(uname -r) =3D "$f" ]; then
>> +#                echo "keeping $f (running kernel) "
>> +#        else
>> +#                echo "removing $f"
>> +#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
>> +#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
>> +#                rm -rf "/lib/modules/$f"
>> +#                new-kernel-pkg --remove $f
>> +#       fi
>> +#done
>> +boot_dir=3D/boot
>> +modules_dir=3D/lib/modules
>> +
>> +function remove_old_kernel(){
>> +	cd $boot_dir
>> +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kern=
el_version
>> +}
>> +
>> +function remove_old_modules_dir(){
>> +	cd $modules_dir
>> +	rm -rf $modules_version
>> +}
>> +
>> +printf "\n\n Enlist the installed kernels \n\n"
>> +
>> +
>> +find $boot_dir -name "vmlinuz-*" -type f -exec ls -1 {} \;
>> +
>> +printf "\n\n\n Please give the kernel version to remove: %s"
>> +read kernel_version
>> +
>> +if [[ $kernel_version =3D=3D "" ]];then
>> +	exit 1
>> +else
>> +	remove_old_kernel
>> +fi
>> +
>> +printf "\n\n Enlist the installed modules directory \n\n"
>> +
>> +find $modules_dir -maxdepth 0 -type d -exec ls -1 {} \;
>> +
>> +printf "\n\n Please give the full modules directory name to remove: %s"
>> +read modules_version
>> +
>> +if [[ $modules_version =3D=3D "" ]];then
>> +	printf "You have forgotten to give the modules dir to remove"
>> +else
>> +	remove_old_modules_dir
>> +fi
>> +
>> +printf "\n\n\n Removed kernel version:$kernel_version and associated mo=
dules:$modules_version ...Done \n"
>> +
>> +while :
>> + do
>> +    printf "\n\n Do you want to remove another?[YN]: %s"
>> +    read response
>> +       if [[ $response =3D=3D "Y" ]];then
>> +	 printf "Please give another version to remove: %s"
>> +	 read kernel_version
>> +	 remove_old_kernel
>> +	 printf "Please give the full modules directory name to remove: %s"
>> +	 read modules_version
>> +	 remove_old_modules_dir
>> +	 printf "\n\n\n Removed kernel version:$kernel_version and associated =
modules:$modules_version ..Done \n\n"
>> +      elif [[ $response =3D=3D "N" ]];then
>> +	 exit 1
>> +    fi
>> + done
>> --
>> 2.21.0

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2rizwACgkQsjqdtxFL
KRU5dQgAsFrij05JHiZC8W3Y4tZhQfUG+waVCGU4/0Ryc1nFqvbLTnTRW6Yc9hI+
PAMpXDzlZR3Fgig09I46RoRdJVqiuqD3WD+WMCKi+GigxQHaQqzA/LjG4nf4LMyI
iPJEsghN0RGWodRQqXSKH35ToVxvrQgAEhu2NvEGaRMLIsys9G+Kci8L2NZoxDMz
isw5oRHOUb2QDL1/rZAF/L0I9zo1lGuqsqb/Pk7KMHynyIGJC9x68FpC9HRRmLcs
30treoZ/ozFBFtyx5ZL48GObw5298a1OEqxyaKduyQen3hRlsgol/UsStIOxrKMW
7eWAShdqmKYHarSB2wYA9OjfnPPoew==
=arbh
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
