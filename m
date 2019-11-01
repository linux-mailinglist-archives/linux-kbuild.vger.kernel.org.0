Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D24C8EBCC6
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Nov 2019 05:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfKAEXz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Nov 2019 00:23:55 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39751 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbfKAEXz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 00:23:55 -0400
Received: by mail-pf1-f194.google.com with SMTP id x28so2916470pfo.6;
        Thu, 31 Oct 2019 21:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rGi5xK7KeJU6BhwbAGfxsmei/f72HPNwo/OPEi+x+A0=;
        b=RMAxJ9JorCU7pFEus6RMyPqtN6GmJw6HkyeZRWvxPEi+WlEWHtoEE5ltpgPThS5vds
         oYyDiu/l/vP9jXOEqdb3tVkkPhu24S+6NMGV0RKVWccYBdfPrUCVaC3j1Gc1F2/jghmh
         YCnU9myPp0TTMTYSL44tyJEGEHjKVUrntJaOIy0SLG05mOn920G1SBl1ToaiUYX2UyC4
         gvpmaPs3onAurHehpAuYjuXym79pQbqJILVk3SuarLy6MvFbMJBuADCVKYL+xBW9mnLz
         Eb5PDIqrC7HbA3Z1fqR+eP/tfSjAhzAQ60DedMjRkW6tsbrxXVYumyw87tkeNkyofmhu
         xmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rGi5xK7KeJU6BhwbAGfxsmei/f72HPNwo/OPEi+x+A0=;
        b=DAkYlCTVp6ORInYbukW9eWA6xxJLcWCc4552RVvP+lglBpL1no40MtA26EtCvI5bbW
         6p6lz2wYl4p81y0ek28ATCErDL/1BkN0RPdTm5uPxe2NnoWzuoTlaEGCf3I3Js1lliKw
         o3Co36fF71zcqRHFtqfYRo/qAfoto+cJ1RpHjsX362rQIGmN4GFrf337aeHtiMAoSiq1
         7Orb0a0KYiVi0W1lyldIkVQqZygRUrEKOLnhkhY7vJY8AWKnJmReYGaxPdBB8SnOHD4Z
         lZgjpxyAOYVFmJ9snG/B6EmBxblnOqH0qgnKyWnCeQ+Opn5Qlh7tOank0ztG0uDrikj3
         i87g==
X-Gm-Message-State: APjAAAXEPyETkqKG78Ph2j3Sdb/k0K2w0ddURhORvTdu/P93EDlqIOxL
        9J4gqvtJoKs74G1v20O2FLYeC3fncjA=
X-Google-Smtp-Source: APXvYqxavWfTEm+2VL5DSOUYW8mjoRpoxoYnxy0uQV5hJj7qZ7gGfe+KvIkP5hT7aB12LOyYyjfRlA==
X-Received: by 2002:a17:90a:c097:: with SMTP id o23mr12643280pjs.41.1572582234180;
        Thu, 31 Oct 2019 21:23:54 -0700 (PDT)
Received: from Gentoo ([103.231.91.35])
        by smtp.gmail.com with ESMTPSA id g7sm5028023pgr.52.2019.10.31.21.23.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 21:23:53 -0700 (PDT)
Date:   Fri, 1 Nov 2019 09:53:40 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191101042337.GA3141@Gentoo>
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
 <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
 <20191031033722.GA7687@Gentoo>
 <41693d0e-8ff2-bf06-f1a6-e7fb52779f95@infradead.org>
 <20191031045242.GA3130@Gentoo>
 <809aa850-7a22-a7c5-af21-0e88d1c63dd7@infradead.org>
 <20191031071839.GB3130@Gentoo>
 <875a75ec-bbf1-9d80-a3e1-9c759c9c05e1@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <875a75ec-bbf1-9d80-a3e1-9c759c9c05e1@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08:06 Thu 31 Oct 2019, Randy Dunlap wrote:
>On 10/31/19 12:18 AM, Bhaskar Chowdhury wrote:
>> On 22:27 Wed 30 Oct 2019, Randy Dunlap wrote:
>>> On 10/30/19 9:52 PM, Bhaskar Chowdhury wrote:
>>>>>>> That=C2=A0'rm'=C2=A0doesn't=C2=A0remove=C2=A0any=C2=A0files.=C2=A0=
=C2=A0Compare=C2=A0what=C2=A0remove_old_kernel()=C2=A0does.
>>>>>> No,it=C2=A0is=C2=A0not=C2=A0using=C2=A0that=C2=A0function=C2=A0rathe=
r=C2=A0take=C2=A0the=C2=A0parameter=C2=A0from=C2=A0the
>>>>>> commandline=C2=A0and=C2=A0get=C2=A0into=C2=A0boot=C2=A0dir=C2=A0matc=
h=C2=A0with=C2=A0it=C2=A0and=C2=A0remove=C2=A0it.
>>>>>
>>>>> But=C2=A0it=C2=A0doesn't=C2=A0do=C2=A0that.=C2=A0=C2=A0I=C2=A0tested=
=C2=A0it.=C2=A0=C2=A0It=C2=A0should=C2=A0be=C2=A0more=C2=A0like=C2=A0what
>>>>> rmeove_old_kernel()=C2=A0does:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm=C2=A0-If=C2=A0vmli=
nuz-$kernel_ver=C2=A0System.map-$kernel_ver=C2=A0config-$kernel_ver
>>>>>
>>>>> and=C2=A0if=C2=A0not,=C2=A0please=C2=A0explain=C2=A0why=C2=A0not.
>>>> Okay,=C2=A0again=C2=A0some=C2=A0uniformity=C2=A0missing=C2=A0in=C2=A0t=
he=C2=A0code,=C2=A0I=C2=A0would=C2=A0like=C2=A0to=C2=A0your
>>>> suggested method,i.e call remove_old_kernel to do the job instead of d=
epending=C2=A0on=C2=A0individual=C2=A0kernel.
>>>
>>> The simplest thing to do is set kernel_version=3D$kernel_ver
>>> and then call remove_old_kernel().
>>> And set modules_version=3D$modules_dir_name and call remove_old_modules=
_dir().
>>>
>>> But it would be cleaner to pass a parameter (kernel_version) to the
>>> remove_old_kernel() function and to pass a parameter (modules_dir) to t=
he
>>> remove_old_modules_dir() function.
>>=20
>>>
>>=20
>> Thank you...I have just modified the code and call both the function
>> under remove option. BTW I didn't set the extra variable $kernel_ver nam=
e it $kernel_version and instead of $modules_dir_name name it $mo
>> dules_version.
>>=20
>> Capturing command line parameter in $kernel_version and $modules_version
>>=20
>> Is that fine? Here is a code snippet:
>
>Yes, that should be OK.
>
>> -r | --remove)
>> =C2=A0 if [[ $# -ne 3 ]]; then
>> =C2=A0=C2=A0 printf "You need to provide kernel version and modules dire=
ctory
>> =C2=A0=C2=A0 name \n"
>> =C2=A0=C2=A0 exit 1
>> =C2=A0=C2=A0 else
>> =C2=A0=C2=A0 remove_old_kernel
>> =C2=A0=C2=A0 remove_old_modules_dir
>> =C2=A0=C2=A0 fi
>>=20
>>=20
>> I have just test it and it works.
>>=20
>>=20
>> And about solitary r option without hypen is ignoring and doing nothing.
>>=20
>> Means, if I pass ./scripts/prune-kernel r 5.3.3
>> it simply ignore and does nothing.Only with the hypen it can work.
>
>Is that how it should be?
>or what would you expect that to do?
Yes it should be. Any malformed parameter should be discarded,except
what explicitly given in code form,as help reminder.
OR
Do you want me to reminds user that they are missing thing to operate
correctly??=20

>
>--=20
>~Randy
Bhaskar
>

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl27s0EACgkQsjqdtxFL
KRV81wf/cMmIASLvGNbAxdbZY/7xnsdsaOWLsfH5c4twHsVwm74Zbasdq8s1l5Kn
z8CZeWxKOKsItEY52g2vXbyDMFkk2La77kHZo4O5hQOmenRMaD9M7wcWqSCOJg59
EbhMUt7RLpJLDKYTtegoGIyNgVZXfV8PpH6iKIvNscyJPMNBvppgRKkn80MWoG7k
i0rMI6kvchwilxhVz/LPbJgKrIayhriKIBfTbDracSdX+WtJMQbAjdWRgGk0rmGe
wS0p8nwJmmqXSc/qrrgZPR9VxsknVNMm/PzKS9CTE+GvELjXS8MeG3iwauQ4hx2K
B255AW+zobp0IQGwTqH7VwO0u2GzLQ==
=3y5/
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
