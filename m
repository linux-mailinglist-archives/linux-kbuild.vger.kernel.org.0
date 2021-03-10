Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4C53337DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 09:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbhCJIxf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 03:53:35 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:53844 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhCJIxa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 03:53:30 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5B2821C0B80; Wed, 10 Mar 2021 09:53:28 +0100 (CET)
Date:   Wed, 10 Mar 2021 09:53:28 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-kernel@vger.kernel.org
Cc:     Amy Parker <enbyamy@gmail.com>, linux-gcc@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: Alternative compilers to GCC/Clang
Message-ID: <20210310085328.GA21872@duo.ucw.cz>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20210202053307.GB28542@1wt.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Hello! My name's Amy. I'm really impressed by the work done to make
> > Clang (and the LLVM toolchain overall) able to compile the kernel.
> > Figured I might as well donate my monkey hours to helping make it run
> > on other compilers as well. I haven't been able to find any that use
> > the same arguments structure as GCC and Clang (read: you can pass it
> > in as CC=3Dcompilername in your $MAKEOPTS). Any compilers along that
> > route anyone here has worked with that I could work with?
>=20
> If you're interested, you should have a look at TCC (tiny CC) :
>=20
>      https://repo.or.cz/tinycc.git
>=20
> It compiles extremely fast, implements some subsets of gcc (a few
> attributes for example), but is far from being able to compile a kernel
> (at least last time I checked). Its speed makes it very convenient for
> development. I made some efforts to make haproxy support it (and provided
> some fixes to tcc) as it compiles the whole project in 0.5 second instead
> of ~10 seconds with a modern gcc. It could probably compile a kernel in
> 15-20 seconds if properly supported, and this could be particularly handy
> for development and testing.

For the record, yes, something that compiles kernel fast would be very
very nice.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYEiJCAAKCRAw5/Bqldv6
8p11AKCDwTTMrx+W0hdAZUHUMPePkUqsMwCfecQRePV2o724Cd/lGV4I13rQfKA=
=wTkl
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
