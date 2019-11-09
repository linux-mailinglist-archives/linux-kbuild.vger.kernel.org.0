Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D157F5E9F
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2019 12:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfKILN7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 Nov 2019 06:13:59 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45295 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfKILN7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Nov 2019 06:13:59 -0500
Received: by mail-pf1-f193.google.com with SMTP id z4so6853605pfn.12;
        Sat, 09 Nov 2019 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=78eK2jrUZeiIxshjz/VqK22zUEx3MW/l9JnnnbFaqNs=;
        b=AUG18FdixtPXtdLPCBHZsNONePTcwyPhLqeVur9lQwyq9PzBUpkgrzqFF3frqzYSLl
         HF+mRrVgLaLAxDX5AS87lntx8AAwECVTG0frJlLQuzHCPpZydb2FEcwQolPh2p+qcsoK
         8DgEnTrxtlI1AAj8T8hi0K44qs/bQQSt5F6yju2GS/e6yIkU4CKF54rxToTlNba3ZACs
         GnQjf1HPl66vEXSu4X+fyF4egjcNfqSGsKrwE/xKKxTL3SRZU5QL3SBGLXYijFvUN9Qk
         r9+FZBX/hm+40ODt/3538omlCcsBEWT8i5QlLLAdm5LjDMLS/m5MQxpqsdkQZNSVNUxU
         VbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=78eK2jrUZeiIxshjz/VqK22zUEx3MW/l9JnnnbFaqNs=;
        b=ba7Y0Q4Yc41TNYIFdpmYVgLKoWT0uiPsSwS/CFff9oxwjn2SZFhJT79a9kjn3V9aBB
         1WlDv0udNOxqBccT0Vg8YSHm8UKj8Yof5qBNPleg8ghutcJnj9GRp0XwhnkhlIJezq5X
         cpQI+wNGVkPrIZ7C8ioRsk2WbxU9on1a0N3m6Mly1glDXhr6Pe/LvoduPYQSrpSgPLJj
         hfeiroZ8GQGRIXR0DWDNTuDWfpX0rkAwXQXbkRSPEZEPbPiH1dXphSB9oWQzk8W/s0Fu
         45HohZUZOoEke6oDsOi9q7KIKB+2aTi41lakbw1gVn4LQhXM+altpprTCzGkK7McBCax
         w98w==
X-Gm-Message-State: APjAAAXhM7AwpH4OamEiS0EdhOMeA+86gMULiub/y05ZqeGyJb3axDs9
        564yANNn7HPsAdsSOJJ83ic=
X-Google-Smtp-Source: APXvYqzA3/q9GwWhsl9blAlsAdgWL8nGera5BDEel7BrIqip+rE7v5Ksx3iDbCpD3lCBgzWq29aFrQ==
X-Received: by 2002:a63:5c4a:: with SMTP id n10mr18139659pgm.120.1573298038267;
        Sat, 09 Nov 2019 03:13:58 -0800 (PST)
Received: from Gentoo ([103.231.91.70])
        by smtp.gmail.com with ESMTPSA id b17sm10222821pfr.17.2019.11.09.03.13.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 09 Nov 2019 03:13:57 -0800 (PST)
Date:   Sat, 9 Nov 2019 16:43:40 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "J. Bruce Fields" <bfields@fieldses.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191109111335.GA1198@Gentoo>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org>
 <20191106044223.GA18076@Gentoo>
 <20191106193010.GG17669@fieldses.org>
 <20191106223918.GB1852@Slackware>
 <CAK7LNASvoh1k=vw6DOyTXa5xYDYNT5uH-5YWS=_95t9XwfAgTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <CAK7LNASvoh1k=vw6DOyTXa5xYDYNT5uH-5YWS=_95t9XwfAgTQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16:25 Sat 09 Nov 2019, Masahiro Yamada wrote:
>On Thu, Nov 7, 2019 at 7:39 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> w=
rote:
>>
>> On 14:30 Wed 06 Nov 2019, J. Bruce Fields wrote:
>> >On Wed, Nov 06, 2019 at 10:12:26AM +0530, Bhaskar Chowdhury wrote:
>> >> On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
>> >> >On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
>> >> >>BTW.
>> >> >>Bruce,
>> >> >>Does the current script expect RHEL or something?
>> >> >>I do not see 'new-kernel-pkg' on my Ubuntu machine.
>> >> >
>> >> >I test on Fedora.  Looks like on recent Fedora that's only provided =
by
>> >> >an rpm "grubby-deprecated", which is an inauspicious name....
>> >> >
>> >> >I think maybe you're supposed to use "grubby" itself now.  Do you ha=
ve
>> >> >that?
>> >> >
>> >> >>It would still work with 'new-kernel-pkg: command not found'
>> >> >>warning.
>> >> >>
>> >> >>We could bypass it if we like.
>> >> >>
>> >> >>command -v new-kernel-pkg && new-kernel-pkg --remove $f
>> >> >
>> >> >Looks like it's what updates the grub configuration, which is probab=
ly a
>> >> >nice thing to do if you can.
>> >> >
>> >> >--b.
>> >>
>> >> Bruce,
>> >>
>> >> Two things,
>> >>
>> >> If the system doesn't run grub , how the fallback policy???
>> >>
>> >> This binary "new-kernel-pkg" also missing in other systems too...I can
>> >> confirm that... i.e gentoo,slackware,
>> >>
>> >> So , you are only targeting the rpm based system????
>> >
>> >It's just what I happen to use.  If someone wants to make it work
>> >elsewhere that'd be great, as long as we don't break what already works.
>> >
>> >I think Debian uses grub2-mkconfig?  Might be OK for Fedora too, I
>> >dunno.
>> >
>> >--b.
>>
>> Okay , thanks for the input. I was trying to write something in
>> generalize way , that is why my code spins off.And if you see the
>> subject line of my very first attempt to patch written was "removing
>> old kernels and modules dir in selective way"... that was it.
>>
>> Now, there are plenty of distros around, not only rpm based one(yes I do
>> agree that ,you wrote it while using and testing on it, but that is
>> limited in nature),the broader user base might be using something else.
>>
>> we simply can not restrict it to certain packaging version or several
>> packaging versions of selected distros. We are making and building this
>> (worth an effort) to make it as generalized as possible.
>>
>> Importantly I was only thinking of people who put the stuff in standard
>> places in the FSH and use it. I might be wrong.
>>
>> As I have said it before, I was no way trying to bypass your work ,but
>> it seems very limited in nature to adopted. So trying to widen the
>> spectrum.
>>
>> I am trying to incorporating both the pole, different kind user base in
>> mind, like you , who don't like to be prompted for this operation and
>> assuming things should go well, and you are right.
>>
>> On the other hand , I am kinda guy , sometime I need to know what is
>> going on, so the prompting.
>>
>> Well, I have never taken into account about modifying the bootloader
>> config by looking at your work. Had I been, I would have done it already
>> and it would be extremely trivial in nature.
>>
>> Now, Grub, no doubt it's fantastic piece of software, but complexity
>> is paramount with it. Don't you think so???  I HAVE NOTHING AGAINST
>> GRUB!
>>
>> I have personally stops using it for years and using something very
>> rudimentary and simple and useful. That is because I know what I am
>> doing and my system well.
>>
>> Caveat emptor: that was me, not every one else in the wild. Grub is used
>> by the most distro by default,everybody knows it,but certainly not the
>> norm.
>>
>> I would love to give it a stab again and if you better people feel it is
>> necessary, but I need some concrete understanding from you,Masahiro and
>> Randy(who is helping me actively).
>>
>> Say, You people might come up ,
>>
>> We need these :
>>
>> a)
>> b)
>> c)
>>
>> and we don't need these:
>>
>> a)
>> b)
>> c)
>>
>>
>> My two cents! kindly, flame me with your thoughts.
>
>
>Honestly, I did not even know this script
>before you submitted the patch.
>
:)

>I prune stale kernel/modules with my own script,
>and I guess people do similar to meet their demand.
>
I do the same.

>I am not sure how many people are using this.
Only people who look up in the kernel source scripts directory , nobody
else for sure.
>If somebody is passionate to improve this script
>in a simple way, that is fine, but
>I do not want to see messy code for covering various use-cases.
Agreed. That is why need guideline from you people(You, Randy and Bruce
needs to tell me clearly), like what I mentioned, we can do
these and we can not do these. I am asking because you people have had more
exposure ,so might come up with some valid points to build up.
>
>--=20
>Best Regards
>Masahiro Yamada

Thanks,
Bhaskar

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3Gn1sACgkQsjqdtxFL
KRUHLgf9GSEK31oq15304EzgLzR9bG2AUbz4kSTaGdGkX5asV3xbxgzb6J5H8dFw
TYlG9vyTnYGyN9rl7/w5bOAeTosZpjJjZupBynfhkEoXGS0zf8t3YA2HLG8GLkWE
u9VkMg35jxH4iMpuFZzihi3ubLfSrjWogK0h3UqckDoxbxtyetTGWigpV8y/mtl0
j3SpsOHxuz9QLz8oOwYTOWQ8Z/i4aJJvLUHOba0anLWfJ+rgtvGeUufAWFXjaaVi
mLTnmHtLlwRrx/D6TGRSMJkc/HkmOg8Y7SK370fGlUamD0PeVTV2kWSDmd/PEqyx
iGh8C875TCgWxvxsAW3Lkb32i9GSJg==
=agn5
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
