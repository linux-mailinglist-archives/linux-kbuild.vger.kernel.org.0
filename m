Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 293B8F0DEC
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 05:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731236AbfKFEml (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 23:42:41 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34306 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbfKFEml (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:42:41 -0500
Received: by mail-pl1-f194.google.com with SMTP id k7so10844406pll.1;
        Tue, 05 Nov 2019 20:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cIuJZ4nPP4cCojXpnWCVdMukg25mjzBjgF+7wEWdpsI=;
        b=Hesx4ZnPBNj+w/qspcQajktHQxZZt0+26Ys9W+iMmskDFyCW5SbMF4Af1ax/Tvc594
         a96FiA4KqlpDekVWwY+GbSiaIdwRlfZKaSGp0PhXnxv6alrjaIsCBSX1TVOzinvKyjcU
         62rUOYbO5QDftCbF6VZ0asjsxJBFje1kr/ek7n7Eg+vQqFGA9qQzodBFooNq/dtqW0Eg
         dbl9kBu5flFzhGXk5lj59chw3HqL0lXWpxF4FoYHm+7qLo/TnDP3VCQdbuGXK0Oy10ty
         NxgCAbMyoP8SpikllozncW/537tXR7MZJPRcfRBRR3y4GE9MTbSm/qOgNHD1W5OJA1b4
         Mfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cIuJZ4nPP4cCojXpnWCVdMukg25mjzBjgF+7wEWdpsI=;
        b=oCMtwrnJoTqd4X3euIflGhiB1Y97gLRapKXMxUZAZVaYVf8xCdCEFVjnT5Rln0Weii
         Dag8u3wkFl4XvkVX+IVCpAJ4iW9uwkDF26ahHh9RMdpb/lnvXwmn9vI/zj2lyLfybHLQ
         zItNzTm9QjnWezwxazrHaMsPmmSzYOe+kD06Dg+86MTYqPamY97xVi9/F7aYDTCmerMB
         gY5/7XLACReyipXu2C1WE/C/DGGcKKeacIvR+/8OumdQg1HnNMduesrFNVii7OpYnZAs
         B5bCVYDz54uLDNbygmVOiFwmEztLKiBVq0KhG/TXSyci5ZQlNN4x0I8e2vX2BiK5MuJ3
         As9A==
X-Gm-Message-State: APjAAAV3bCWCmVgDkQvxW+C8y3pzY1GJ7Jus3GsW3+YpbTqU4l64EmUp
        xX2N5Nntf10UK//lEJUmOQc=
X-Google-Smtp-Source: APXvYqxILu8y8Za0MwKQBqOhhS0Yc10HoNrS8Nh9TbR1Uul69k3UKSvgyLT3dSk4mfp+zT3zCek4vQ==
X-Received: by 2002:a17:902:b091:: with SMTP id p17mr507719plr.13.1573015360577;
        Tue, 05 Nov 2019 20:42:40 -0800 (PST)
Received: from Gentoo ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id x10sm16936116pfn.36.2019.11.05.20.42.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 20:42:39 -0800 (PST)
Date:   Wed, 6 Nov 2019 10:12:26 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191106044223.GA18076@Gentoo>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20191106043120.GB6355@fieldses.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
>On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
>> BTW.
>> Bruce,
>> Does the current script expect RHEL or something?
>> I do not see 'new-kernel-pkg' on my Ubuntu machine.
>
>I test on Fedora.  Looks like on recent Fedora that's only provided by
>an rpm "grubby-deprecated", which is an inauspicious name....
>
>I think maybe you're supposed to use "grubby" itself now.  Do you have
>that?
>
>> It would still work with 'new-kernel-pkg: command not found'
>> warning.
>>=20
>> We could bypass it if we like.
>>=20
>> command -v new-kernel-pkg && new-kernel-pkg --remove $f
>
>Looks like it's what updates the grub configuration, which is probably a
>nice thing to do if you can.
>
>--b.

Bruce,

Two things,

If the system doesn't run grub , how the fallback policy???

This binary "new-kernel-pkg" also missing in other systems too...I can
confirm that... i.e gentoo,slackware,

So , you are only targeting the rpm based system????=20

~
Bhaskar

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3CTykACgkQsjqdtxFL
KRWY0Qf+OSbac++mWERchiwDUMOUyNUaoVi0cAGXnvWNdGZfWhHQVcEDkCZzWzrz
vdWhgESith3kZHDQ4Mp++SqWl7Ps8vj1qZob+d9DFnma9LL/4OP5SobjAVsOlfkt
j33vf8kcAzfbVmmB9qojTQ1jxRcdSGVCyBpjQtmxJZd5juYR6SRsgZblVLAZkIrh
QxdaQEVqokbsrwi02XXeL8cBo1JWLm8g0ININYHGT4Vw/H0MdJgB0wFMobl0E1Pj
5gwn+LJGtBNh9RJOnnO4slxA1oxBR+8t92KrEnAMJnYvBe0gu2ggscoJiLJ4hndU
FGqNjXncYGU2l3hhpqxdtxq2m6N7OQ==
=hHCq
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
