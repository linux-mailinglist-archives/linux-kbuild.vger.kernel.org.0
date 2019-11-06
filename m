Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37F0FF21EC
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 23:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfKFWjf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 17:39:35 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36711 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbfKFWjf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 17:39:35 -0500
Received: by mail-pl1-f194.google.com with SMTP id g9so12194389plp.3;
        Wed, 06 Nov 2019 14:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BMKd8G9zMkgN0f5Y0tqmmKfixfcWLZBRkofJy97iGiI=;
        b=oincruMTn5V9mTz+UjSpw6gCAfrjxD3rHfFUb7+yDs1GwMQc7x76PTRZ3NZep2zds0
         8qMS96GOZIWuWyJDvASCfP6Ljs9u0R4qa50TWVF291ejwe8hCO2iS80we91/vnh6z+9H
         zJCV18tbb53WlYkS7BwPMpLKki+h088raFgCUwxwusQu3CE3rfMhzoeZ81LNzu3u9kwd
         r0ptc6c5MY1grztnZrpIj0nrBUgy79Bcv4xbWadetoC8snyyolC6OcBeHr06lKodLD9t
         42mvfWTxvfiC6LNuBHzPyJapxy238EgOaeHhZdshYdtbQJYBlrONgriFDtUkPwK2zPMW
         6spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BMKd8G9zMkgN0f5Y0tqmmKfixfcWLZBRkofJy97iGiI=;
        b=CO3w/j1XabNst3jqpUANF8TSHAvJofRKrKqvslb4rYB+Hebd5POlTQFv3XAnSkSfDU
         cjzWPvfEATntx3vDKVHnEyoV0UfyuN5nuefHm+g3mC/pAd9BPWtbRz2nrYEnxoy3EU9s
         YyXdWHdQP1zRaNY2gmyTPb9KLIVi5wVvxC2FcbCZo0FLn0ZSvV5jU+JMXVnGJnN58Kwt
         IEWbnGPeFV7tpGn3IVVXCaRboVmNK9zjB8k3nfYKD41ydjx0WPuf3W1TKS4yVCFBkDdH
         7vh1vQG3f/oUFnVPVLoMtf6reUdwuS4U9jxPn8zFjcRpGSPVL/awMtGaQaNuz2gGgQrK
         cZJg==
X-Gm-Message-State: APjAAAWiFZ9GgDqpKnkblpp/Lf0Qhry4XASyUc5lTdnrWSQ7K/iXZflT
        Ys0aQegHm9I4a3Farr53to2XFakvjTE=
X-Google-Smtp-Source: APXvYqw+Mm/Jhhto447HAdZ8pprhH6qVmc3DP2CM+G83oLje4qaSKbFz16GkCebLsIhVSE+yNgPWjg==
X-Received: by 2002:a17:902:346:: with SMTP id 64mr18408pld.283.1573079973779;
        Wed, 06 Nov 2019 14:39:33 -0800 (PST)
Received: from Slackware ([103.231.90.174])
        by smtp.gmail.com with ESMTPSA id k32sm4766756pje.10.2019.11.06.14.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 14:39:32 -0800 (PST)
Date:   Thu, 7 Nov 2019 04:09:18 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191106223918.GB1852@Slackware>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org>
 <20191106044223.GA18076@Gentoo>
 <20191106193010.GG17669@fieldses.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
In-Reply-To: <20191106193010.GG17669@fieldses.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:30 Wed 06 Nov 2019, J. Bruce Fields wrote:
>On Wed, Nov 06, 2019 at 10:12:26AM +0530, Bhaskar Chowdhury wrote:
>> On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
>> >On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
>> >>BTW.
>> >>Bruce,
>> >>Does the current script expect RHEL or something?
>> >>I do not see 'new-kernel-pkg' on my Ubuntu machine.
>> >
>> >I test on Fedora.  Looks like on recent Fedora that's only provided by
>> >an rpm "grubby-deprecated", which is an inauspicious name....
>> >
>> >I think maybe you're supposed to use "grubby" itself now.  Do you have
>> >that?
>> >
>> >>It would still work with 'new-kernel-pkg: command not found'
>> >>warning.
>> >>
>> >>We could bypass it if we like.
>> >>
>> >>command -v new-kernel-pkg && new-kernel-pkg --remove $f
>> >
>> >Looks like it's what updates the grub configuration, which is probably a
>> >nice thing to do if you can.
>> >
>> >--b.
>>=20
>> Bruce,
>>=20
>> Two things,
>>=20
>> If the system doesn't run grub , how the fallback policy???
>>=20
>> This binary "new-kernel-pkg" also missing in other systems too...I can
>> confirm that... i.e gentoo,slackware,
>>=20
>> So , you are only targeting the rpm based system????
>
>It's just what I happen to use.  If someone wants to make it work
>elsewhere that'd be great, as long as we don't break what already works.
>
>I think Debian uses grub2-mkconfig?  Might be OK for Fedora too, I
>dunno.
>
>--b.

Okay , thanks for the input. I was trying to write something in
generalize way , that is why my code spins off.And if you see the
subject line of my very first attempt to patch written was "removing
old kernels and modules dir in selective way"... that was it.

Now, there are plenty of distros around, not only rpm based one(yes I do
agree that ,you wrote it while using and testing on it, but that is
limited in nature),the broader user base might be using something else.

we simply can not restrict it to certain packaging version or several
packaging versions of selected distros. We are making and building this
(worth an effort) to make it as generalized as possible.=20

Importantly I was only thinking of people who put the stuff in standard
places in the FSH and use it. I might be wrong.

As I have said it before, I was no way trying to bypass your work ,but
it seems very limited in nature to adopted. So trying to widen the
spectrum.

I am trying to incorporating both the pole, different kind user base in
mind, like you , who don't like to be prompted for this operation and
assuming things should go well, and you are right.

On the other hand , I am kinda guy , sometime I need to know what is
going on, so the prompting.=20

Well, I have never taken into account about modifying the bootloader
config by looking at your work. Had I been, I would have done it already
and it would be extremely trivial in nature.

Now, Grub, no doubt it's fantastic piece of software, but complexity
is paramount with it. Don't you think so???  I HAVE NOTHING AGAINST
GRUB!

I have personally stops using it for years and using something very
rudimentary and simple and useful. That is because I know what I am
doing and my system well.=20

Caveat emptor: that was me, not every one else in the wild. Grub is used
by the most distro by default,everybody knows it,but certainly not the
norm.

I would love to give it a stab again and if you better people feel it is
necessary, but I need some concrete understanding from you,Masahiro and
Randy(who is helping me actively).

Say, You people might come up ,

We need these :

a)
b)
c)=20

and we don't need these:

a)
b)
c)


My two cents! kindly, flame me with your thoughts.

~Bhaskar

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3DS5IACgkQsjqdtxFL
KRV7Rgf+OMwhspUynXOGPUZfJm3a7pgGlvYmk7wseYUHUHD1binTyLxb77HXYIFZ
AUpLuLOJYvWkJlfYzUWdrEYfU08+xxt38lp+M7wQgNEY8dBSk9paB++dk7TAnGAS
FfbDvW+4vOoaw6pooIvdzWCSVe+MrfvX5Fhr59/VzW9iJ/d6NTirTo0MjoKlsgJi
/6NWndrkD7yl0ARLXJqPT74OsYeTHPxvcPC0Z9EoUZTl+wRGWCDnb0fG065Phoc4
IU7ndS1AU149FyPQxON/SfrA39CtlzSs76kcaoyJwFmF1faAmFZWboZa5R0NxjXB
/3FGNxq/s6LJGTwOTRlj87zaryftuQ==
=amex
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
