Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8954EAAE9
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2019 08:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfJaHS5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 31 Oct 2019 03:18:57 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42405 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfJaHS5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 03:18:57 -0400
Received: by mail-pf1-f193.google.com with SMTP id 21so3669113pfj.9;
        Thu, 31 Oct 2019 00:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1aArgnbDaF4vNzrG28Q3wfHxUiG18eeUAr/yEEfdFtc=;
        b=UmOccsOougBbsjpy3d6bIpcYYQRViOd5I2N9QlSOHcN+LY+gwh+F4LbddXm4VitP3m
         0p9aHGlyqKInmhPl71bs3SUqcvSo9WHouNNwRx3wkiyGKDpzj1vu1Z+rvoJCeN85gboE
         2/aNkvj6ym1UXCtm1gtTEQSC6EhlvFLaK/FPZIzPh6w9ghepk1pPbXmkC9oIWcPR+wW1
         yk4xNY0mj8mCvN8CoKSPViECopVuE7fLxZqxI00uArxSuWILkzapGOnfGsQY62rgBMUI
         a9usQw2MP8BVlAYkQPde4mqlQjsoDXp0ejUnlBwbt8mne2z67DQcePna0yLenNWw/wQH
         Uihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1aArgnbDaF4vNzrG28Q3wfHxUiG18eeUAr/yEEfdFtc=;
        b=kgdxFXYNtEafAYHZksu9n5y0c5RIGW4CR/eQvyLzfG60rlCD6e0MRQigfj2F4O8xRd
         /FJEYYoi5sgQGmN1TFHCtTGxe0zS8Tcz3R/nrE25IHEG+jgsq7AjmJKlg2calK36wX68
         ahh4XHRNQsKa1afP9vpAI9Xm/OZOgK4rLQgC0iSmEfl7O0up+7D2Bf/1ogIf0DP1xgmG
         INKqYVTJEGxnTpA8AhA05VBcvaQONIkPypNOrLB0ipUKJI0xQjSPrzkv1ZvDRLfGZYco
         7M9WzekVrZiQtnS8FwAdN5kJ7eH8mih97DAEWDpdlUoIATLNnd0ci2V1IYHqKXuH6zvu
         EoKw==
X-Gm-Message-State: APjAAAUE4qbru6B2JSxNTR68bseBTGKw2QSqISZLNdrZCGJRnc6kh4gL
        AVURT6HYnhZPC2qtwY2k5DQ=
X-Google-Smtp-Source: APXvYqx9nES+bwUHd/B+Dyxjp8g8HMYLV+RwsKVO3akjNB6ve2hIQl8jcptqMNCeRVTyHuuzftDdag==
X-Received: by 2002:a17:90a:2a41:: with SMTP id d1mr5208172pjg.87.1572506334911;
        Thu, 31 Oct 2019 00:18:54 -0700 (PDT)
Received: from Gentoo ([103.231.90.174])
        by smtp.gmail.com with ESMTPSA id e198sm2093458pfh.83.2019.10.31.00.18.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 00:18:54 -0700 (PDT)
Date:   Thu, 31 Oct 2019 12:48:42 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191031071839.GB3130@Gentoo>
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
 <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
 <20191031033722.GA7687@Gentoo>
 <41693d0e-8ff2-bf06-f1a6-e7fb52779f95@infradead.org>
 <20191031045242.GA3130@Gentoo>
 <809aa850-7a22-a7c5-af21-0e88d1c63dd7@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <809aa850-7a22-a7c5-af21-0e88d1c63dd7@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22:27 Wed 30 Oct 2019, Randy Dunlap wrote:
>On 10/30/19 9:52 PM, Bhaskar Chowdhury wrote:
>>>>> That=C2=A0'rm'=C2=A0doesn't=C2=A0remove=C2=A0any=C2=A0files.=C2=A0=C2=
=A0Compare=C2=A0what=C2=A0remove_old_kernel()=C2=A0does.
>>>> No,it=C2=A0is=C2=A0not=C2=A0using=C2=A0that=C2=A0function=C2=A0rather=
=C2=A0take=C2=A0the=C2=A0parameter=C2=A0from=C2=A0the
>>>> commandline=C2=A0and=C2=A0get=C2=A0into=C2=A0boot=C2=A0dir=C2=A0match=
=C2=A0with=C2=A0it=C2=A0and=C2=A0remove=C2=A0it.
>>>
>>> But=C2=A0it=C2=A0doesn't=C2=A0do=C2=A0that.=C2=A0=C2=A0I=C2=A0tested=C2=
=A0it.=C2=A0=C2=A0It=C2=A0should=C2=A0be=C2=A0more=C2=A0like=C2=A0what
>>> rmeove_old_kernel()=C2=A0does:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm=C2=A0-If=C2=A0vmlinu=
z-$kernel_ver=C2=A0System.map-$kernel_ver=C2=A0config-$kernel_ver
>>>
>>> and=C2=A0if=C2=A0not,=C2=A0please=C2=A0explain=C2=A0why=C2=A0not.
>> Okay,=C2=A0again=C2=A0some=C2=A0uniformity=C2=A0missing=C2=A0in=C2=A0the=
=C2=A0code,=C2=A0I=C2=A0would=C2=A0like=C2=A0to=C2=A0your
>> suggested method,i.e call remove_old_kernel to do the job instead of dep=
ending=C2=A0on=C2=A0individual=C2=A0kernel.
>
>The simplest thing to do is set kernel_version=3D$kernel_ver
>and then call remove_old_kernel().
>And set modules_version=3D$modules_dir_name and call remove_old_modules_di=
r().
>
>But it would be cleaner to pass a parameter (kernel_version) to the
>remove_old_kernel() function and to pass a parameter (modules_dir) to the
>remove_old_modules_dir() function.

>

Thank you...I have just modified the code and call both the function
under remove option. BTW I didn't set the extra variable $kernel_ver=20
name it $kernel_version and instead of $modules_dir_name name it $mo
dules_version.

Capturing command line parameter in $kernel_version and $modules_version

Is that fine? Here is a code snippet:

 -r | --remove)
   if [[ $# -ne 3 ]]; then
    printf "You need to provide kernel version and modules directory
    name \n"
    exit 1
    else
    remove_old_kernel
    remove_old_modules_dir
    fi


I have just test it and it works.


And about solitary r option without hypen is ignoring and doing nothing.

Means, if I pass ./scripts/prune-kernel r 5.3.3=20

it simply ignore and does nothing.Only with the hypen it can work.

>--=20
>~Randy
>
Bhaskar

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl26isgACgkQsjqdtxFL
KRVyXAf/ebHDm+R5TuyyrwcURHxUYZQ+vAAH5KziMSdZy7E6XMrQoRX3bmOrUsfd
FQ7ew7Ol3rC6kmHRAVIi60Eqkanyo7ocjwQnrKMAJR7Uxx52HJz+/UBDLpy2xvKL
rrkzvGAmRUrh/J/Fa2sglYZgdFzRP847eXRjFJEpfLdNldSIbTuBIMrtgIPdh2nP
xT/ZCJgmn+kVvLd1Z57pWm5tiyJPnNpdjA6ckiWn2xC2uW2NAvA+/COqOb+I/bgu
DSWu3kLkQncA/SE17PxrlOJyb6RUF3JurM1lnUcF4SaK6IJFhtUgEiqqTo+P9JzH
If6K9voH/VypHZnbIV9hw9OCd2PHmg==
=gnFn
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
