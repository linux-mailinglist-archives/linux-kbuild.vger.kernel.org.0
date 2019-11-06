Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC9CF0DB5
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 05:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfKFEVK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 23:21:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38326 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbfKFEVJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:21:09 -0500
Received: by mail-pg1-f193.google.com with SMTP id 15so3045318pgh.5;
        Tue, 05 Nov 2019 20:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wIzfgOKnO/lGrX+ef2GtUYa+0bY7jbfAN1kzE2a0nQQ=;
        b=HNYU0NIJz4X01+UbKSr0DzVeQfaDJ4dPjqaGidRXEB7mXVxYac57FsZc6eijtJ420V
         AdPnPf6rKC/hcoGpIb3ZshGMRhkAuYYFdbwAWzJvN37BI2UhaS3DuE497ISs5Jpc86uB
         ILHY8Kr4pc7dRa5SwhgD3f+7nF5Ysy+l8LaT+36DgwQkaSN7RLRCTdb7UiKtveQBQAUX
         /7xxk3vRpJwQ50A0xUS976yrWI28vVVpypmNEzos9aq3UbtjtnQRTPIuJv60VdCSqCce
         KsGxcpgjuCh/K78+HDL+EXJCGQPfMSlq0qkXwPgmBGju3dRbUYdXgJXzJ/y3cwVwmMwX
         Uzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wIzfgOKnO/lGrX+ef2GtUYa+0bY7jbfAN1kzE2a0nQQ=;
        b=iOPtp11HbTwvPH/To+T+elWAAl0pWZC2HCY/SaiyM5VPAgSr4uWzvFlBZefUkWsDpy
         pTQ63gnQfCEBePHrfgtqPS+cbQuTKreOnOjvIKMLNABMsVZAdBOT2COo2UKHHobRBr6i
         kHd0DnSS8hteeaiEWU+qm7OKX//qNKBTaIyGqkUJk7pf6NQrIjS3EUKCWJ+DB8OXkfz/
         HYR+sRCSGR6LEcB++TjTolgHt68HGuzWmg6TMGs1bwgMAztyyH+4Z3W7CQeqjyVo9ZCW
         TPrgGAQKo12KJkJFifT5Fz4wnXzLCrF7po0swcYAYXi0G2uXinHZ2TNpSzd1AH4HCb3n
         5f4Q==
X-Gm-Message-State: APjAAAVAQdmEAh78Qn730sRbN17Zuvhk5Yt2AFlJ96B59EmPJ+sg9uow
        pAd/Uxyv45wdeM5mZ1KTp8o=
X-Google-Smtp-Source: APXvYqysaLQD/cmxKECrOo5O1nDhuBISxxwV/3P+TZn9aKj2VklTk+U4j5eKPXK6jgJYq8fI8N+BUg==
X-Received: by 2002:a05:6a00:10:: with SMTP id h16mr776712pfk.27.1573014067272;
        Tue, 05 Nov 2019 20:21:07 -0800 (PST)
Received: from Gentoo ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id x186sm11493840pfx.105.2019.11.05.20.21.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 20:21:06 -0800 (PST)
Date:   Wed, 6 Nov 2019 09:50:52 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:patch-kernel:bash syntax replace,correct one
Message-ID: <20191106042049.GC20442@Gentoo>
References: <20191025080544.7209-1-unixbhaskar@gmail.com>
 <CAK7LNAT1=e36tLgPcHUOxKUSCH7MW3egYuJMtY+OfZWvHRxfGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <CAK7LNAT1=e36tLgPcHUOxKUSCH7MW3egYuJMtY+OfZWvHRxfGA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 13:15 Wed 06 Nov 2019, Masahiro Yamada wrote:
>On Fri, Oct 25, 2019 at 5:06 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> =
wrote:
>>
>> This patch will replace backquote to dollar parenthesis syntax
>> for better readability.Corrected one.
>
>Talking about the commit subject,
>which part is 'bash syntax' ?
>
>One more thing,
>"correct one" is not the correct way to send
>a new patch version.
>See the patch submission from other people.
>The version number is enclosed in the square brackets.
>
>[PATCH v2]
>
>
>The commit subject should describe what it does
>in imperative mood.
>
>https://patchwork.kernel.org/patch/11205593/
You are right ..my mistake ..shouldn't have included the=20
"correct one" ...and you are absolutely right..."bash syntax"
is as vague and confusing .

Again , Would you mind if I send you the correct one with=20
proper subject line and explained what changed.

Thanks for the heads up Masahiro!
>
>
>
>
>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/patch-kernel | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/scripts/patch-kernel b/scripts/patch-kernel
>> index 033d5916797d..6f9443336f9a 100755
>> --- a/scripts/patch-kernel
>> +++ b/scripts/patch-kernel
>> @@ -153,7 +153,7 @@ applyPatch () {
>>      echo "failed.  Clean up yourself."
>>      return 1;
>>    fi
>> -  if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -prin=
t`" ]
>> +  if [ "$(find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -pri=
nt)" ]
>>    then
>>      echo "Aborting.  Reject files found."
>>      return 1;
>> @@ -175,7 +175,7 @@ reversePatch () {
>>                 echo "failed.  Clean it up."
>>                 exit 1
>>         fi
>> -       if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' =
-print`" ]
>> +       if [ "$(find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')'=
 -print)" ]
>>         then
>>                 echo "Aborting.  Reject files found."
>>                 return 1
>> @@ -189,7 +189,7 @@ reversePatch () {
>>  # set current VERSION, PATCHLEVEL, SUBLEVEL, EXTRAVERSION
>>  # force $TMPFILEs below to be in local directory: a slash character pre=
vents
>>  # the dot command from using the search path.
>> -TMPFILE=3D`mktemp ./.tmpver.XXXXXX` || { echo "cannot make temp file" ;=
 exit 1; }
>> +TMPFILE=3D$(mktemp ./.tmpver.XXXXXX) || { echo "cannot make temp file" =
; exit 1; }
>>  grep -E "^(VERSION|PATCHLEVEL|SUBLEVEL|EXTRAVERSION)" $sourcedir/Makefi=
le > $TMPFILE
>>  tr -d [:blank:] < $TMPFILE > $TMPFILE.1
>>  . $TMPFILE.1
>> @@ -200,7 +200,7 @@ then
>>      exit 1
>>  fi
>>
>> -NAME=3D`grep ^NAME $sourcedir/Makefile`
>> +NAME=3D$(grep ^NAME $sourcedir/Makefil)
>>  NAME=3D${NAME##*=3D}
>>
>>  echo "Current kernel version is $VERSION.$PATCHLEVEL.$SUBLEVEL${EXTRAVE=
RSION} ($NAME)"
>> @@ -216,8 +216,8 @@ fi
>>
>>  #echo "stopvers=3D$stopvers"
>>  if [ $stopvers !=3D "default" ]; then
>> -       STOPSUBLEVEL=3D`echo $stopvers | cut -d. -f3`
>> -       STOPEXTRA=3D`echo $stopvers | cut -d. -f4`
>> +       STOPSUBLEVEL=3D$(echo $stopvers | cut -d. -f3)
>> +       STOPEXTRA=3D$(echo $stopvers | cut -d. -f4)
>>         STOPFULLVERSION=3D${stopvers%%.$STOPEXTRA}
>>         #echo "#___STOPSUBLEVEL=3D/$STOPSUBLEVEL/, STOPEXTRA=3D/$STOPEXT=
RA/"
>>  else
>> @@ -306,7 +306,7 @@ if [ x$gotac !=3D x ]; then
>>                 HIGHESTPATCH=3D0
>>                 for PATCHNAMES in $patchdir/patch-${CURRENTFULLVERSION}-=
ac*\.*
>>                 do
>> -                       ACVALUE=3D`echo $PATCHNAMES | sed -e 's/^.*patch=
-[0-9.]*-ac\([0-9]*\).*/\1/'`
>> +                       ACVALUE=3D$(echo $PATCHNAMES | sed -e 's/^.*patc=
h-[0-9.]*-ac\([0-9]*\).*/\1/')
>>                         # Check it is actually a recognised patch type
>>                         findFile $patchdir/patch-${CURRENTFULLVERSION}-a=
c${ACVALUE} || break
>>
>> --
>> 2.20.1
>>
>
>
>--
>Best Regards
>Masahiro Yamada

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3CSh4ACgkQsjqdtxFL
KRUwlAf+O5wAm3YHUF2jhx+joYQsMi6YTg/zQPEOM40ULGV0Hayt69pYZj9Nn8kL
JX9RvzBe5JmcWNmLStxVjgJW9yU3oQt/mg565m80f/U8vVBg5Jb2/uFCRki2QG6E
T5TXic+yrnIMAd4pCUlUws4hzsE7SlTDTWj0e32ZOeK+ZMPS+d188qoCnQP0zmBT
P6KbGl6j+WNVRpOCk5+0BrLfMPZHGDCSyMZvB+JhdYJS/5XRAM97tfu5RXblVITn
MCr+de9SAvKc48wLys+nJQSp8hPr0U/MEQ83IeNUizKD07kb1ifHEuo7195pINvk
p3rbdS8BPtEORnfCfHZQDdsmZnjZyQ==
=iycT
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
