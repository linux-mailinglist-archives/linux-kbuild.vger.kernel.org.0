Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADEF1FE114
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 16:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbfKOPVX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 10:21:23 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39510 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbfKOPVW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 10:21:22 -0500
Received: by mail-pl1-f194.google.com with SMTP id o9so4871370plk.6;
        Fri, 15 Nov 2019 07:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9e8vLKBq1ELTddnf7Q8D+KRLPBZDwYmPjIAbEpMf9Q8=;
        b=SVyheTGMJIcMZGotTUSCfUdF/SXR3h4qGCCQTWdFanLK4peatYwLEv5bIEdXKPgmw0
         K873flZE1iMRPeCLqy6tlxRonL0jPkoEj+Y6oeXU9RjNknKES9yLAyJVRNGZ1GGwbmCI
         5pxzspziP2cXx4LmWw8P+Ephzx2ZmOx9/D25tgRZt0Pr6bmyy6/Fjrrk8W4YbJh/e0Tf
         ozDmlF3sGSit+0d4XTxbGV5PdkausQ146fcbcXCzjPzJHbUUp/hBBgrVTDGZcJGsyP6L
         2F0U0VlE+IJPJwHf5alt5xQxXXG3mDIrre2ZWsvX5BU7Pa6ds/Jn76MUvmw6qJRyg0xV
         nMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=9e8vLKBq1ELTddnf7Q8D+KRLPBZDwYmPjIAbEpMf9Q8=;
        b=J1w0bw6380QELuBT1gVDiF4wYCZed87zcQ3He0+F34798Vc4wLVpeEKJARceF8JVPa
         rybTfR7vpM/fOT0YPEj67J3fWh06xIunyJuT79XHiLJI1H9HG9WlcZBR7DxGgQa8coGB
         RbnjlhwO7Qw7DjZNqO0p/KpLxx42mqFlj0Ew1aHuq9aSFplB1rltMSq/yNpjnlzBZges
         TnYDsDBYAgtSo7fjcMZ3QkRp+cZKbb3EDqQljqaitJnxdxJmsxh9Z6qzMnI9s3/ncFQS
         I3E47nvKih0NviEU0EiQVFktWbAF+PkC2AvIEgDuKCbEnBjsGjvShq0i35b+V/mgp+m/
         Bwng==
X-Gm-Message-State: APjAAAWVFNCYG3GUizUXsCxCDJqbitV7JJwr2Rpqy5+ApGRFSwX1W5pO
        RK0VAdTOOhQ1BMd2W+GX4ZA=
X-Google-Smtp-Source: APXvYqy5qPeBteqeqWzsB9R82qb64C1OGIIrzlhpsg86AZrKuHMAfuJF2nnVFki4JH6BxDqF7oYhBg==
X-Received: by 2002:a17:90a:23e2:: with SMTP id g89mr19631276pje.127.1573831281830;
        Fri, 15 Nov 2019 07:21:21 -0800 (PST)
Received: from Gentoo ([103.231.91.68])
        by smtp.gmail.com with ESMTPSA id h5sm10159178pjc.9.2019.11.15.07.21.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Nov 2019 07:21:20 -0800 (PST)
Date:   Fri, 15 Nov 2019 20:51:05 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "J. Bruce Fields" <bfields@fieldses.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191115152102.GA23525@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org>
 <20191106044223.GA18076@Gentoo>
 <20191106193010.GG17669@fieldses.org>
 <20191106223918.GB1852@Slackware>
 <CAK7LNASvoh1k=vw6DOyTXa5xYDYNT5uH-5YWS=_95t9XwfAgTQ@mail.gmail.com>
 <20191109111335.GA1198@Gentoo>
 <CAK7LNAR9PrnXWhA6CCvgexpwVfeZxvHiXp_JtKH7Xb1OZDGusw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <CAK7LNAR9PrnXWhA6CCvgexpwVfeZxvHiXp_JtKH7Xb1OZDGusw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10:58 Fri 15 Nov 2019, Masahiro Yamada wrote:
>On Sat, Nov 9, 2019 at 8:14 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> w=
rote:
>>
>> On 16:25 Sat 09 Nov 2019, Masahiro Yamada wrote:
>> >On Thu, Nov 7, 2019 at 7:39 AM Bhaskar Chowdhury <unixbhaskar@gmail.com=
> wrote:
>> >>
>> >> On 14:30 Wed 06 Nov 2019, J. Bruce Fields wrote:
>> >> >On Wed, Nov 06, 2019 at 10:12:26AM +0530, Bhaskar Chowdhury wrote:
>> >> >> On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
>> >> >> >On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
>> >> >> >>BTW.
>> >> >> >>Bruce,
>> >> >> >>Does the current script expect RHEL or something?
>> >> >> >>I do not see 'new-kernel-pkg' on my Ubuntu machine.
>> >> >> >
>> >> >> >I test on Fedora.  Looks like on recent Fedora that's only provid=
ed by
>> >> >> >an rpm "grubby-deprecated", which is an inauspicious name....
>> >> >> >
>> >> >> >I think maybe you're supposed to use "grubby" itself now.  Do you=
 have
>> >> >> >that?
>> >> >> >
>> >> >> >>It would still work with 'new-kernel-pkg: command not found'
>> >> >> >>warning.
>> >> >> >>
>> >> >> >>We could bypass it if we like.
>> >> >> >>
>> >> >> >>command -v new-kernel-pkg && new-kernel-pkg --remove $f
>> >> >> >
>> >> >> >Looks like it's what updates the grub configuration, which is pro=
bably a
>> >> >> >nice thing to do if you can.
>> >> >> >
>> >> >> >--b.
>> >> >>
>> >> >> Bruce,
>> >> >>
>> >> >> Two things,
>> >> >>
>> >> >> If the system doesn't run grub , how the fallback policy???
>> >> >>
>> >> >> This binary "new-kernel-pkg" also missing in other systems too...I=
 can
>> >> >> confirm that... i.e gentoo,slackware,
>> >> >>
>> >> >> So , you are only targeting the rpm based system????
>> >> >
>> >> >It's just what I happen to use.  If someone wants to make it work
>> >> >elsewhere that'd be great, as long as we don't break what already wo=
rks.
>> >> >
>> >> >I think Debian uses grub2-mkconfig?  Might be OK for Fedora too, I
>> >> >dunno.
>> >> >
>> >> >--b.
>> >>
>> >> Okay , thanks for the input. I was trying to write something in
>> >> generalize way , that is why my code spins off.And if you see the
>> >> subject line of my very first attempt to patch written was "removing
>> >> old kernels and modules dir in selective way"... that was it.
>> >>
>> >> Now, there are plenty of distros around, not only rpm based one(yes I=
 do
>> >> agree that ,you wrote it while using and testing on it, but that is
>> >> limited in nature),the broader user base might be using something els=
e.
>> >>
>> >> we simply can not restrict it to certain packaging version or several
>> >> packaging versions of selected distros. We are making and building th=
is
>> >> (worth an effort) to make it as generalized as possible.
>> >>
>> >> Importantly I was only thinking of people who put the stuff in standa=
rd
>> >> places in the FSH and use it. I might be wrong.
>> >>
>> >> As I have said it before, I was no way trying to bypass your work ,but
>> >> it seems very limited in nature to adopted. So trying to widen the
>> >> spectrum.
>> >>
>> >> I am trying to incorporating both the pole, different kind user base =
in
>> >> mind, like you , who don't like to be prompted for this operation and
>> >> assuming things should go well, and you are right.
>> >>
>> >> On the other hand , I am kinda guy , sometime I need to know what is
>> >> going on, so the prompting.
>> >>
>> >> Well, I have never taken into account about modifying the bootloader
>> >> config by looking at your work. Had I been, I would have done it alre=
ady
>> >> and it would be extremely trivial in nature.
>> >>
>> >> Now, Grub, no doubt it's fantastic piece of software, but complexity
>> >> is paramount with it. Don't you think so???  I HAVE NOTHING AGAINST
>> >> GRUB!
>> >>
>> >> I have personally stops using it for years and using something very
>> >> rudimentary and simple and useful. That is because I know what I am
>> >> doing and my system well.
>> >>
>> >> Caveat emptor: that was me, not every one else in the wild. Grub is u=
sed
>> >> by the most distro by default,everybody knows it,but certainly not the
>> >> norm.
>> >>
>> >> I would love to give it a stab again and if you better people feel it=
 is
>> >> necessary, but I need some concrete understanding from you,Masahiro a=
nd
>> >> Randy(who is helping me actively).
>> >>
>> >> Say, You people might come up ,
>> >>
>> >> We need these :
>> >>
>> >> a)
>> >> b)
>> >> c)
>> >>
>> >> and we don't need these:
>> >>
>> >> a)
>> >> b)
>> >> c)
>> >>
>> >>
>> >> My two cents! kindly, flame me with your thoughts.
>> >
>> >
>> >Honestly, I did not even know this script
>> >before you submitted the patch.
>> >
>> :)
>>
>> >I prune stale kernel/modules with my own script,
>> >and I guess people do similar to meet their demand.
>> >
>> I do the same.
>>
>> >I am not sure how many people are using this.
>> Only people who look up in the kernel source scripts directory , nobody
>> else for sure.
>> >If somebody is passionate to improve this script
>> >in a simple way, that is fine, but
>> >I do not want to see messy code for covering various use-cases.
>> Agreed. That is why need guideline from you people(You, Randy and Bruce
>> needs to tell me clearly), like what I mentioned, we can do
>> these and we can not do these. I am asking because you people have had m=
ore
>> exposure ,so might come up with some valid points to build up.
>> >
>
>We have two topics here.
>
>[1]  add the interactive option
For that, my last patch stand , I have covered it in a sane way, please try=
 that
once more with options.Yes , you said, the modules directory should be
pruned at once with kernel. But , every system keeps the modules
directory in different names AFAIK. So, the explicitness of the calling.
>[2]  do nice things for non-rpm systems
Bruce's code cover the base for RPM based system , which can be applied
to other similar distribution using that format.Provided I figure out
the "unknown binary" in the code.

I might add other packaging format distribution to cover. Those will
append behind the existing code.
>
>
>They should be done by separate patches.
>
Agreed. Moduler and clear.
>I think [1] is easy to do in a few liners.
>
My last patch stand.AFAIK...let me know if you feel it should be done
differently.
>
>For [2], I am not sure how well it goes
>until I see an actual patch.
>
That would be a undertaking to deal with the native packaging system for
different distributions.

>--=20
>Best Regards
>Masahiro Yamada

Thanks,
Bhaskar

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3OwloACgkQsjqdtxFL
KRWZlwgAsPgxJUVkDYYqTEAzuKD2TkXqGK42bAJ+JwR+WOTthLWIdNH5L/sYEotH
ZtL0xNGoKW2MwQd6Dk7gqaPrukuenorqy2ecCz1my5fm/DMd0tilKXqXwRZ1FkIX
GGfEFagK6xTTxPri4vq+snYAHkyYPt1vEntGrL0MBrHmOdfDpV0HyZiqmtPljyDZ
1HTjmGdq6UQa/T/W70rBmi7F8O5jdFIwolTgavlgoRVVD0lcX44kUr99vyQlqeFP
jB1UTaPhH2mEAtljmHPh0nyGQ7cPHETZ7nkgSLMpx6FNDcYB22LYr43lvx3LmX6D
/CYfGtzwnbYTLmhQWP9YENGZEdrFxw==
=0+YX
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
