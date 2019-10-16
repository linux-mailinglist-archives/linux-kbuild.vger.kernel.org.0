Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C50ED858A
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 03:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbfJPBgT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Oct 2019 21:36:19 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33571 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfJPBgT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 21:36:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so13638891pfl.0;
        Tue, 15 Oct 2019 18:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QgAe4xYxB5jPjSQpz9ktlhB3AkGxrIcyycu/dMTn2CM=;
        b=nKGp8B12O5+R4Tt5Hks9vUJPiaxotVkrXBd7XsNtRMLCOygxV5N9D5tYGVidp8X7Hz
         NytzWXgYBWk5R+bzGU6TbzidEM9d26aM/DFIThNKwo4rhnsTC720eQlmr4lW6sEuvwM+
         NjqXRgUx1/ylDnP9/uOvIv9ooUm0DdS8XdUxW4lh6Aq99gjA+aC+ldgkCHW8Qcncqs5a
         9sVYaG5q4dc+F5E1jGTv1xloFztQeX3H/O55uM9TetgieGxlcDE/QK017u3MMbMwZT3k
         /+yuKIVcA0V0TgF7tY0DpxxJWCvpOkt0q9AYzDraum966W2LxptiB5MtycLtmp09v8ME
         p6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QgAe4xYxB5jPjSQpz9ktlhB3AkGxrIcyycu/dMTn2CM=;
        b=S8rXEYc2xtAWu1VLVL+CrE8p7uj+cddnjiXgCZWPfbVDY1DrJkYwTXH1Ov6eSb/Kvg
         7rsrMcMlLlBvI6dqp9tSDasarnzQ+evQuF4NLd0g3y4KeDf2KAPUbcwHNFKpIGNNGKw2
         69QzFWzZgyVbpW4IAWusGkL5aS4bmrjVpTHkwxXywt0EU5o5gVOQE6Kh0acX5W8FvVIQ
         CLPxZikmZ5QNEjBcXn4VXOkF1A6wzuRyn4HZe+/bd27UxO/oU7U3U6vyxtJeIfYI0mQY
         krY13pjCUK8pg7FLLvxJdFLw+F3O9ELjlLobDjDaEe2ma0yRtWkGAGfBawmOjR6IAiPx
         /eYg==
X-Gm-Message-State: APjAAAUg+O5jwg7g1fh8cvls6gYxTgI/e5JRBHN7fY5QXWLuwGkVSnvX
        3unTmyVa/GdLuTZv/Jm47EY=
X-Google-Smtp-Source: APXvYqyTjS2Pc8tHSHvBN3tq56TXtrY4DCaRC2ZuImG4p78sa3Hp+S8PYXUe1UArY+Hj/vQGV3Wuow==
X-Received: by 2002:a17:90a:a891:: with SMTP id h17mr1811998pjq.32.1571189776736;
        Tue, 15 Oct 2019 18:36:16 -0700 (PDT)
Received: from Gentoo ([103.231.90.170])
        by smtp.gmail.com with ESMTPSA id 11sm21968981pgd.0.2019.10.15.18.36.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 18:36:16 -0700 (PDT)
Date:   Wed, 16 Oct 2019 07:06:04 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        bfields@fieldses.org
Subject: Re: [PATCH] :scripts: prune-kernel : prunning kernel generalize way
Message-ID: <20191016013601.GA13621@Gentoo>
References: <20191015145548.24165-1-unixbhaskar@gmail.com>
 <c075bcce-0d6d-abee-7fb5-80821f2ae3a2@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <c075bcce-0d6d-abee-7fb5-80821f2ae3a2@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16:03 Tue 15 Oct 2019, Randy Dunlap wrote:
>Subject: s/prunning/pruning/
>Subject:  s/:scripts:/scripts:/
>
>On 10/15/19 7:55 AM, Bhaskar Chowdhury wrote:
>> This patch will remove old kernels from system selective way.
>
>                                                 in a selective way.
>
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/prune-kernel | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index 74143f229f84..28fae6c91218 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -33,7 +33,7 @@ printf "\t\n Enlist the installed kernels \n\n\n"
>>  cd $boot_dir && pwd
>>
>>  #Bash experts not recomend to run ls inside script,but you can by runni=
ng that too
>> -# ls -1 vmlinuz-*
>> +# ls -1 vmlinuz-*
>>
>>  #This is the recommended way , little complex but that's what people wa=
nt to see!
>>
>> @@ -42,10 +42,10 @@ find $boot_dir -name "vmlinuz-*" -type f -print0 -ex=
ec ls -1 {} \;
>>  printf "\n\n\n Well, we need to purge some kernel to gain some space.\n=
\n\n"
>>
>>
>> -printf "Please give the kernel version to remove: %s"
>> +printf "Please give the kernel version to remove: %s"
>>  read kernel_version
>>
>> -remove_old_kernel
>> +remove_old_kernel
>>
>>  printf "\n\n Remove associated modules too ... \n\n"
>>
>> @@ -54,7 +54,7 @@ cd $modules_dir && pwd
>>  printf "\n\n\n Enlist the installed modules \n\n\n"
>>
>>  #This is (-1) minus one not l(el)
>> -# ls -1
>> +# ls -1
>>
>>  find $modules_dir -name "$kernel_version-*" -type f -print0 -exec ls -1=
 {} \;
>>
>> @@ -66,14 +66,14 @@ rm -rf $modules_version
>>  printf "\n\n Done \n\n"
>>
>>  printf "\n\n Want to remove another?[Yn] : %s"
>> -read response
>> +read response
>>
>>
>>  if [[ $response =3D=3D "Y" ]]; then
>> - printf "Please give another version to remove : %s"
>> + printf "Please give another version to remove : %s"
>>   read kernel_version
>>
>> -remove_old_kernel
>> +remove_old_kernel
>>
>>  elif [[ $response =3D=3D "n" ]]; then
>>
>> @@ -81,4 +81,4 @@ elif [[ $response =3D=3D "n" ]]; then
>>
>>  fi
>>
>> -exit 0
>> +exit 0
>> --
>> 2.21.0
>>
>
>Trying to apply this patch with 'patch --verbose' says:
>
>checking file scripts/prune-kernel
>Using Plan A...
>Hunk #1 FAILED at 33.
>Hunk #2 FAILED at 42.
>Hunk #3 FAILED at 54.
>Hunk #4 FAILED at 66.
>Hunk #5 FAILED at 81.
>5 out of 5 hunks FAILED
>Hmm...  Ignoring the trailing garbage.
>done
>
>
>Those + and - lines with the same content don't make any sense.
>
>And probably Cc: the author of the script:
>J. Bruce Fields <bfields@fieldses.org>
>
>--=20
>~Randy

Thank you Randy, silly mistakes creeps in...my bad ...will correct that
and resend.
BTW I haven't found Bruce's name anywhere...where did you get it? Or did I
miss the obvious??

Ran against get_maintainers and it only throw a open list , no other
names.So kinda, stump by that.=20

Time to redo it again...huh

Thanks,
Bhaskar

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2mc/0ACgkQsjqdtxFL
KRXh7wgAk8luWf86C5OdriZJqIDDBRmCzV8cjpPvV9ddO6LB/t4Am/ceveiKoBdZ
nfgTUMJTwd+1k2DmovCftBghDSkiKHvhrit2YGaKmhARH8XXkgYn6j6bY+cb5gH7
6OGkIMmpnHfmXhZnlj6EZFNkgiZdoLl5YOKitNhSIk6WK32mjn71Qw/oDELkiLad
5Qfbt2EIlbytdX7i9mKpt/ifdzm25fUufyC0dz9//Fy4G83Oiuj3R+IuAQrV0IMz
6sNiMeKKmHgiadLe7QngSb1G+aYX0Lw4ZR75PZGHaZudfs66d5pLsgEqeKyq8tYp
i1aei3nl2Xvl5slBbCUEqOwYYe5kTw==
=mMoA
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
