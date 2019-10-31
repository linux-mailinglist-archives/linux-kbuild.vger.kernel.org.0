Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D50EA9FC
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2019 05:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfJaEw6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 31 Oct 2019 00:52:58 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45066 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfJaEw6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 00:52:58 -0400
Received: by mail-pl1-f193.google.com with SMTP id y24so2094327plr.12;
        Wed, 30 Oct 2019 21:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FxybZ9yJwvAGqmQstyd8a/qOqroJ30Iefnw+iBliSF0=;
        b=Gk+7CQikvlka63DRZM3oAAKjqADdX8OGoUu4Won8qN2MtbUikHjGsB9KK2454goFxp
         AAjFVMWWpqaLSd4IeYipYLlNTz7bninz6Us4xaakqpqgZoSOR79xL3LBzFcRcRm/lFZy
         RnIql9AuUf8OjyLnPOISDGk2OmbpmpfpFknz6LpVv7TYjzzuTSMecWeygSWFAObBmY6m
         rdKJR81O/z42ClqRXP1RMNin5CZOWRoyGTm9FWw2D1RuFtszM8S43UnH4UT8f2o600Py
         Fzovg0YRz0IBpwQrIY/YE57A33XFaphwkZap4IsWvxZEFUqAvPDhC9RYugqdqGRdevhZ
         izeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FxybZ9yJwvAGqmQstyd8a/qOqroJ30Iefnw+iBliSF0=;
        b=It3So8oYllMdha0YTNmv5k6n84Lrmm2TDEqeNVYqBWgkWXm8hQZTt6BWmmVNLfpwFQ
         7UJP6QOvRLiWWlycaMkfGC2JANxhfIAcR+8zBojGKUeBEWHGOr/L1FucP7kRJOcI8HvI
         CaVPuCqPj98Tk+idEnjDEg07nniETER8x+EXvInDbyHWPQbywr6zMS2itiNn1kmrKS2Q
         NstPfKdeajYzsSB7czIuI5EhX4W40iL+iVnoLgfNso4CONp3u1KtDsLwfOcIgjhAIOYM
         FuZsP4+8UmmaGmAEqVNd6+vX030FgXJa9rKwMgR+tECPjSwznNrY6DmK5Yj+k8PjpPIb
         Drew==
X-Gm-Message-State: APjAAAVOTObu7QvveelqtUqPjn48c1i1DoavMOq6Pr8wI+YnFg9Wnoi1
        BXBtwJbJIe86Sr5FFSq2kTY=
X-Google-Smtp-Source: APXvYqwUdlXWygnIpCfvBW+DxnjHtByVIhVigTqRNQBV64M/OQkpRfLScIXd58hKBNyo9u8zgC8STw==
X-Received: by 2002:a17:902:7791:: with SMTP id o17mr4010230pll.223.1572497577087;
        Wed, 30 Oct 2019 21:52:57 -0700 (PDT)
Received: from Gentoo ([103.231.90.174])
        by smtp.gmail.com with ESMTPSA id 82sm1814906pfa.115.2019.10.30.21.52.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 21:52:56 -0700 (PDT)
Date:   Thu, 31 Oct 2019 10:22:45 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191031045242.GA3130@Gentoo>
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
 <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
 <20191031033722.GA7687@Gentoo>
 <41693d0e-8ff2-bf06-f1a6-e7fb52779f95@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <41693d0e-8ff2-bf06-f1a6-e7fb52779f95@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Thank you so much Randy. I am awfully sorry about the ugly code ,
hopefully come up with a better one. If I understood your expectation.

I know we all are blessed with limited resources like patience.Thanks
for holding this long...little more and we will be over it.

:)

On 21:32 Wed 30 Oct 2019, Randy Dunlap wrote:
>On 10/30/19 8:37 PM, Bhaskar Chowdhury wrote:
>> Thank you Randy, my response are inline. Please look at it.I am
>> wondering , what else I could do get this damn! thing going??
>> Any clue??
>>=20
>> On 19:33 Wed 30 Oct 2019, Randy Dunlap wrote:
>>> Hi,
>>>
>>> On 10/30/19 2:54 AM, Bhaskar Chowdhury wrote:
>>>> This patch will remove old kernels and modules directorey related
>>>> to that kernel from the system by interactively and silently.Here
>>>> are few interactions with the scripts
>>>>
>>>> 1)
>>>>
>>>> =E2=9C=94 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>>>> 14:52 $ ./scripts/prune-kernel -h
>>>> Usage: prune-kernel [ri]
>>>>
>>>> =C2=A0-r | --remove kernel_ver modules_dir_name
>>>>
>>>> =C2=A0 -i | --interactive use as interactive way
>>>> =C2=A0 =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=
=C2=B759|=E2=9C=94]
>>>> =C2=A0 =C2=A0 14:52 $ ./scripts/prune-kernel --help
>>>> =C2=A0 Usage: prune-kernel [ri]
>>>
>>> That "[ri]" is confusing to me.
>> This are the options one has to pass with the script.Like below:
>
>I know that.  But it's missing '-', so it looks like
>$ prune-kernel r 5.2.5-foobar
>
>would work.
>
Will correct that.
>>>>
>>>> =C2=A0=C2=A0 -r | --remove kernel_ver modules_dir_na]
>>>>
>>>> =C2=A0=C2=A0=C2=A0 -i | --interactive use as interactive way
>>>> =C2=A0=C2=A0 =C2=A02)
>>>>
>>>> =C2=A0=E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=
=B759|=E2=9C=94]
>>>> =C2=A014:52 $ ./scripts/prune-kernel -r 5.3.3
>>>> =C2=A0You need to provide kernel version and modules dir name
>>>> =C2=A0
>>>> =C2=A0=E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=
=B759|=E2=9C=94]
>>>> =C2=A014:53 $ ./scripts/prune-kernel -r
>>>> =C2=A0You need to provide kernel version and modules dir name
>>>> =C2=A0
>>>> =C2=A0=E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=
=B759|=E2=9C=94]
>>>> =C2=A014:54 $ ./scripts/prune-kernel -r 5.3.3 5.3.3-foo
>>>
>>> This one above didn't remove any kernel files.
>>> Needs more testing.
>> It does remove but silently, as you and Bruce asked for this feature.
>
>No, see the code below for -r...
>
Okay ...look like some some uniformity missing
>>>> 3)
>>>>
>>>> $ ./scripts/prune-kernel --remove
>>>> You need to provide kernel version and modules dir name
>>>>
>>>> =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>>>> 14:55 $ ./scripts/prune-kernel --remove 5.3.3
>>>> You need to provide kernel version and modules dir name
>>>>
>>>> =E2=9C=98-1 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>>>> 14:55 $ ./scripts/prune-kernel --remove 5.3.3 5.3.3-foo
>>>>
>>>>
>>>> 4)14:55 $ ./scripts/prune-kernel -i
>>>>
>>>> Enter kernel version to remove or blank/empty to exit:
>>>>
>>>>
>>>> 5)14:57 $ ./scripts/prune-kernel --interactive
>>>>
>>>> Enter kernel version to remove or blank/empty to exit:
>>>> =E2=9C=94 ~/git-linux/linux-kbuild [master|AM 1/1 =E2=86=91=C2=B759|=
=E2=9C=94]
>>>>
>>>>
>>>> 6)14:59 $ ./scripts/prune-kernel --interactive
>>>>
>>>> Enter kernel version to remove or blank/empty to exit:5.3.3
>>>> Please give the full modules directory name to remove:5.3.3-foo
>>>>
>>>>
>>>>
>>>> Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.
>>>>
>>>>
>>>> 7)15:00 $ ./scripts/prune-kernel -i
>>>>
>>>> Enter kernel version to remove or blank/empty to exit:5.3.3
>>>> Please give the full modules directory name to remove:5.3.3-foo
>>>>
>>>>
>>>>
>>>> Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.
>>>>
>>>>
>>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>>> ---
>>>> =C2=A0scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++=
++++++
>>>> =C2=A01 file changed, 63 insertions(+)
>>>>
>>>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>>>> index a25aa2160d47..a91010d0e2af 100755
>>>> --- a/scripts/prune-kernel
>>>> +++ b/scripts/prune-kernel
>>>> @@ -1,3 +1,66 @@
>>>> =C2=A0#!/bin/bash
>>>> =C2=A0# SPDX-License-Identifier: GPL-2.0
>>>> +#This script will delete old kernels and modules directory related to=
 it
>>>> +#-h with the script will show you the help
>>>> +#-r with the script take two parameter: kernel_ver and modules_dir_na=
me
>>>> +#-i with the script allow you do the removing interactive way
>>>>
>>>> +flag=3D$1
>>>> +kernel_ver=3D$2
>>>> +modules_dir_name=3D$3
>>>> +boot_dir=3D/boot
>>>> +modules_dir=3D/lib/modules
>>>> +
>>>> +remove_old_kernel() {
>>>> +=C2=A0=C2=A0=C2=A0 cd $boot_dir
>>>> +=C2=A0=C2=A0=C2=A0 rm -If vmlinuz-$kernel_version System.map-$kernel_=
version config-$kernel_version
>>>> +=C2=A0=C2=A0=C2=A0 return 0
>>>> +}
>>>> +
>>>> +remove_old_modules_dir() {
>>>> +=C2=A0=C2=A0=C2=A0 cd $modules_dir
>>>> +=C2=A0=C2=A0=C2=A0 rm -rf $modules_version
>>>> +=C2=A0=C2=A0=C2=A0 return 0
>>>> +}
>>>> +
>>>> +usage() {
>>>> +=C2=A0=C2=A0=C2=A0 printf "Usage: $(basename $0) [ri] \n"
>>>> +=C2=A0=C2=A0=C2=A0 printf "\n -r | --remove kernel_ver modules_dir_na=
me \n"
>>>> +=C2=A0=C2=A0=C2=A0 printf "\n -i | --interactive use as interactive w=
ay \n"
>>>> +}
>>>> +
>>>> +for arg in "$@"
>>>
>>> what is the purpose (use) of "arg" here?
>>=20
>> This variable is used in case statement below.
>
>I can't find any use of 'arg' anywhere else in the script.
>Please show me where it is.
My bad and apologies for overlooking.
>
>>> what is the purpose of the for loop?
>>>
>> It scan through all the parameters pass .
>
>What is this script supposed (expected) to do with multiple arg parameters?
>
It uses multiple parameter
>>> Is any 'shift' needed to consume (or discard) the first 3 positional
>>> command line arguments?
>> Nope, that is not required. And I haven't use any.
>>>
>>>> +do
>>>> +=C2=A0=C2=A0=C2=A0 case "$flag" in
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -i | --interactive)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf "\nEnter kernel version to remove or blank/empty to exit:%s"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
ad kernel_version
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 [[ $kernel_version !=3D "" ]]; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 remove_old_kernel
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printf "Please give the full modules directory name t=
o remove:%s"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 read modules_version
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if [[ $modules_version !=3D "" ]]; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remove_old_modules_dir
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf "\n\n\n Removed kernel=
 version:$kernel_version and associated modules:$modules_version ...Done. \=
n"
>>>
>>> This message is only printed if $modules_version is non-empty.=C2=A0 If=
 it is empty,
>>> remove_old_kernel() has silently removed some kernel files (if they exi=
sted).
>> it will fail to remove anything if the kernel_version or modules_version
>> are empty and importantly exit.
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fi
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -h | --help)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 us=
age
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ex=
it 1
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -r | --remove)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 [[ $# -ne 3 ]]; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printf "You need to provide kernel version and module=
s dir name\n"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 exit 1
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 el=
se
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cd $boot_dir
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rm -f $kernel_ver
>>>
>>> That 'rm' doesn't remove any files.=C2=A0 Compare what remove_old_kerne=
l() does.
>> No,it is not using that function rather take the parameter from the
>> commandline and get into boot dir match with it and remove it.
>
>But it doesn't do that.  I tested it.  It should be more like what
>rmeove_old_kernel() does:
>
>		rm -If vmlinuz-$kernel_ver System.map-$kernel_ver config-$kernel_ver
>
>and if not, please explain why not.
Okay, again some uniformity missing in the code, I would like to your
suggested method,i.e call remove_old_kernel to do the job instead of=20
depending on individual kernel.
>
>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cd $modules_dir
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rm -rf $modules_dir_name
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>>>> +=C2=A0=C2=A0=C2=A0 esac
>>>> +done
>>>> --=20
>>>
>>> The script, after this patch is applied, still contains the old script'=
s for-loop
>>> at the end of the "new" prune-kernel script.
>>=20
>> Amazing! now it needs some explanation how I did...you probably want
>> that ..here are the steps....
>> 1)fetch that prune-kernel file from repos , which contains Bruce's code
>> in it.
>> 2) get inot it by editior, remove all except first two lines i.e bash
>> interpreter and PSDX .
>> 3)Save and commit it locally.
>> 4) Write my own code
>> 5) save it and commit it locally.
>> 6) go one level up use checkpatch to see anything bad creeps in
>> 7) Fixed the damn things if it reports.
>> 8) create the patch
>> 9) test it
>> 10) Send it.
>>=20
>> Now, how the heck , that for loop is getting staying there is a mystry
>> to me!! Look like that is ruin all the work.
>> irk...
>
>I don't know.  I just know that it's not working AFAICT.
Thank you, will be more vigilant in next iteration.
>
>--=20
>~Randy
>

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl26aI8ACgkQsjqdtxFL
KRW+mAf/eB23eSUl/UF5kJCG2NwpR2LEmdfWhHfoz72ZAqUYeMdyWwlbdrH12JGZ
hq/XvIrBa+TE2IvAWjJv4Mx0mKH3sIjDNNu0X1UghgfiIE4igK05fDweMr1WBLTW
rYfqX1USGyqBeqSLC/wFBj3pU2Q8Xs0cSQEALD9diUd8MAEqzA1br0jH5dYbFuMa
K+8ZKFdMcprTE4L7qj39cLat+stDelYJydCOiF7Tn9r4oNKPUujvjZiSJ5XHwShd
VCjs5IDJSQ5catXrSBx+lAPJYkPto6ppe55CKmfeny//hiXrQFocnoTHAD3waJMS
66TZgpB3Ji/vZCYsK8SRo8FzmM/Y6w==
=Ixc+
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
