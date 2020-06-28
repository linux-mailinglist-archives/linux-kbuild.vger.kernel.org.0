Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDB620C66E
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 08:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgF1GRb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 02:17:31 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:21179 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgF1GRb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 02:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593325045;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=m5DGw2srTjGAfAegBLNLm8kQtSc40dBbbxgwlH3oaRo=;
        b=Zbnhwvcm6PVVsWPaGd/gxF5WdWJuu1yn7TcagkTse+T/F6fZw5FSsIdBytnt2CU88x
        Xj5cxXaBuMRr8ya4RaO7FdD/ghGT8KGGCqz9rbpBwj7yVzv8Ns8oWvR6579tHdD4jhsX
        mwqtb3Fys689zyzsx+nAcWd0q+7KyDBloTVsG+hP5r+HZtaaY4jzTrkxnbt1VDwL3GJq
        OLslCvikhZLPaHlbc8DEF+KNVLo8BxgLgMphAkUtB1inJRADeWQlZeTBHQ+elHZte2Ng
        r9vkgXl0t0Kce1j2LnyuHCVgipIgxMROVCa8cJN5KO5VjtvxzCvaGOX1mhymZ/JuXV8L
        YnyA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw47kDQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w5S6HBIFd
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 28 Jun 2020 08:17:11 +0200 (CEST)
Subject: Re: [PATCH] modpost: remove use of non-standard strsep() in HOSTCC code
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAK7LNATCLscXNDZ1RUmbnM5BeV-tvKjz9kQB8eo0SNp10WbjFQ@mail.gmail.com>
Date:   Sun, 28 Jun 2020 08:17:10 +0200
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D851B90-5F85-4136-AF70-E764FDF4D7DD@goldelico.com>
References: <11c1e65b393b4c3ca6118515c77bbf19524dab11.1593074472.git.hns@goldelico.com> <CAK7LNATCLscXNDZ1RUmbnM5BeV-tvKjz9kQB8eo0SNp10WbjFQ@mail.gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

> Am 28.06.2020 um 07:51 schrieb Masahiro Yamada <masahiroy@kernel.org>:
>=20
> On Thu, Jun 25, 2020 at 5:47 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>> strsep() is neither standard C nor POSIX and used outside
>> the kernel code here. Using it here requires that the
>> build host supports it out of the box which is e.g.
>> not true for a Darwin build host and using a cross-compiler.
>> This leads to:
>>=20
>> scripts/mod/modpost.c:145:2: warning: implicit declaration of =
function 'strsep' [-Wimplicit-function-declaration]
>>  return strsep(stringp, "\n");
>>  ^
>>=20
>> and a segfault when running MODPOST.
>>=20
>> See also: https://stackoverflow.com/a/7219504
>>=20
>> So let's add some lines of code separating the string at the
>> next newline character instead of using strsep(). It does not
>> hurt kernel size or speed since this code is run on the build host.
>>=20
>> Fixes: ac5100f5432967 ("modpost: add read_text_file() and get_line() =
helpers")
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> scripts/mod/modpost.c | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> index 6aea65c65745..8fe63989c6e1 100644
>> --- a/scripts/mod/modpost.c
>> +++ b/scripts/mod/modpost.c
>> @@ -138,11 +138,16 @@ char *read_text_file(const char *filename)
>>=20
>> char *get_line(char **stringp)
>> {
>> +       char *p;
>>        /* do not return the unwanted extra line at EOF */
>>        if (*stringp && **stringp =3D=3D '\0')
>=20
> This check does not make sense anymore.
>=20
> Previously, get_line(NULL) returns NULL.
>=20
> With your patch, get_line(NULL) crashes
> due to NULL-pointer dereference.

Well, that is original code.

I have only replaced the strsep() function.
But yes, it looks to be better in addition to
my patch.

>=20
>=20
>=20
>>                return NULL;
>>=20
>> -       return strsep(stringp, "\n");
>> +       p =3D *stringp;
>> +       while (**stringp !=3D '\n')
>> +               (*stringp)++;
>=20
>=20
> Is this a safe conversion?
>=20
> If the input file does not contain '\n' at all,
> this while-loop continues running,
> and results in the segmentation fault
> due to buffer over-run.

Ah, yes, you are right.

We should use

+       while (**stringp && **stringp !=3D '\n')

>=20
>=20
>=20
>> +       *(*stringp)++ =3D '\0';
>> +       return p;
>> }
>=20
>=20
>=20
> How about this?
>=20
> char *get_line(char **stringp)
> {
>        char *orig =3D *stringp;

^^^ this still segfaults with get_line(NULL)

>        char *next;
>=20
>        /* do not return the unwanted extra line at EOF */
>        if (!orig || *orig =3D=3D '\0')
>                return NULL;
>=20
>        next =3D strchr(orig, '\n');
>        if (next)
>                *next++ =3D '\0';
>=20
>        *stringp =3D next;

Yes, this code is easier to understand than my while loop.
And strchr() is POSIX.

So should I submit an updated patch or do you want to submit
it (with a suggested-by: H. Nikolaus Schaller <hns@goldelico.com>)

BR and thanks,
Nikolaus Schaller


