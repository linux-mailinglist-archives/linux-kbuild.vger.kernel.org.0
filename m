Return-Path: <linux-kbuild+bounces-2838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6DC949330
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 16:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90FC4281686
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 14:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3054B1D54E9;
	Tue,  6 Aug 2024 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="FtW3ZM8A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70851D2795;
	Tue,  6 Aug 2024 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722954899; cv=none; b=LQT/NrA6NfELZ9xF4xrLhvrorh8DwkAQbPaOS9wpLwsbmLsSj0qGnjqnDZzBCvF9LB98yje/aEEzd5RltSTZVuO3uDpp2QC2J9WucaLTliPSf3PJxDn1lYCAmNsLnCsl60RI0Y4rlwIKTf7yqfzmA1UO5Hn9VSy1x7q+Ym6JBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722954899; c=relaxed/simple;
	bh=lBcajSh9rV2plGk+LAnyxk7BfVpJGadJLEjOWw1jtvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6Za0t0Wa4phyluosyy+36lFLNLhcWEreLeyo0SGCk1iah7kIEYk0zRe3SXeveAqQJKDM5Up/aKvRQUwc5Y+y6SQOPY+4ZWV4I4rX7FwNreXdwYyssW1Kl6dYP3XSIz8rrBKn7z8A4TJsWfShWxVwSWyepfj10o6NWXvFjc+vUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=FtW3ZM8A; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1722954878; x=1723559678; i=christian@heusel.eu;
	bh=lBcajSh9rV2plGk+LAnyxk7BfVpJGadJLEjOWw1jtvQ=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FtW3ZM8AIvMRdZZiJDUu/oOgd82M696iohAJOSlg2I2EP/FL4mBfWtQtm462oICr
	 3n2oHQxttyc9fTKss9amFBpJs9rX4JMuhlADgYeHqDD5dmjGpzI51YKYzquAhrp5f
	 2L6l11C3C45ZkpItEjdNRYFyluMQQJUIgdXIkdEfC+F2N6Nr/jdYgnRBnHAMC29rQ
	 etGDV5yrWPbG3El0Z/eEqrg6vmjz12nMVZRYrCcx7lqWkd4IxdcJjtrLO7iFscYMN
	 hVVbHBCevOJQOFEi9vuE60oBlEb6ros5Wolk9SbmHKXxzpBFZlAqvZ7Mnmd5hFNmi
	 ky9RlbpbfokqKVVACA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([147.142.139.110]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MfHQp-1rznJP2X0d-00eJ9n; Tue, 06 Aug 2024 16:28:52 +0200
Date: Tue, 6 Aug 2024 16:28:51 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Jose Fernandez <jose.fernandez@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add debug package to pacman PKGBUILD
Message-ID: <68b454bb-8d29-4a89-bcca-5ba5a1991209@heusel.eu>
References: <20240801132945.47963-1-jose.fernandez@linux.dev>
 <20240801183637.GB122261@thelio-3990X>
 <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6zsmai3kwid5skfe"
Content-Disposition: inline
In-Reply-To: <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>
X-Provags-ID: V03:K1:crWIXUOk/Cl8iZR95Z7kr6tJojeAme99XgmIVXCT3ABRxb8eQ+j
 T9vOMaUIrsL5BvxPZ/MzUu0R8ONkK7ze9Vqn12hJKqy0QRFcfErnSJrReRNCbM7U9OWYINz
 dB8CufeQEc/xc55t4TxVlVLMEdWrEc6/7NTpyP6hkbpgccXfP+r2ffhmSd0apgESFCBwdf7
 OuNOLPIVKtE6qS0yyVnSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lHE4Hze/r9A=;MSIU40XQWeooumCwYV8rQTIw6fL
 W1Csh7g5AhwwqRvohvL/c3478VGbuEnK70Lx7jakILa9ny4I6zx/7n3WowLn4XMn51q8jImi1
 fJOGx8aEa1GWj5OuBt+76g/xHFu2Fu0w1vnkAek3hKG/ENt2njUVD7kDaxuHm2EXC57feLA9q
 DJmbc+pGdS+LzsITk0dAQ0Nc0U2QxQUppE/qyBwvRj8kPK8EahZIAgNx8+TwAUul6D+7Sutay
 +84POowyyn0MRECDbME9+M9FCe3fA2TLWiZ2HZOXLRoCaLiysy7dscJ80YLm7+tXC0bcaGkVx
 X7b2VAeq7rk8lM1LRYns2m8DwoeUM+O2hSVWpUsdqjyqPLJnrwgw/78rvlcWsbLHwieh3YRL5
 8Wkr9b8BaZYXQRf4PgH5m05AjW53leRqq+zT7PFewf6Q2ySkgIc+4mBUT18bUYe5EK+MD5d8c
 Gq+G4FX7ueVrt0TwrWMo5y9QO+KPi8eSJEMFbnYyFwCq0BQnGdIzvXeNdWfMtd1ztqHQzwomZ
 bbkteANywDXVJTxFER47TrSvCYM7qo7ujTqEAvVAKwuOPGJIwtP8UvG3N14CWzCCo+iKT4kCB
 vHZfybhxeRGLpiKtyQ3rw1iOt6S7b3HapOQY2ILQxZwi5nIdJyxGsdRDDQIM+ANBf6VGPsw4x
 2nBQNVUowoSZTo4/cwb+WEu6oGQd5bkhcjoH3obUo017J/6fArSuipp+4qjzyKiYmQ+K7rhA5
 r9tchlY8vqtHyP74WnokVdBUhpNDH6RSg==


--6zsmai3kwid5skfe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/08/01 08:53PM, Thomas Wei=DFschuh wrote:
> On 2024-08-01 11:36:37+0000, Nathan Chancellor wrote:
> > Hi Jose,
> >=20
> > On Thu, Aug 01, 2024 at 07:29:40AM -0600, Jose Fernandez wrote:
> > > Add a new -debug package to the pacman PKGBUILD that will contain the
> > > vmlinux image for debugging purposes. This package depends on the
> > > -headers package and will be installed in /usr/src/debug/${pkgbase}.
> > >=20
> > > The vmlinux image is needed to debug core dumps with tools like crash.
> > >=20
> > > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> >=20
> > This appears to add a non-trivial amount of time to the build when benc=
hmarking
> > with Arch Linux's configuration (I measure 9% with hyperfine):
>=20
> As nothing more is compiled, I guess this is just the additional
> packaging.

I would expect that the overhead stems from the extra compression that
needs to be done for the resulting package and depending on what you
have set in your /etc/makepkg.conf this can add significant overhead.
For packages that are not planned to be distributed it might make sense
to completely disable compression[0] by setting PKGEXT. The referenced
forum discussion also explains that this can be hard-disabled in the
PKGBUILD itself, but I would prefer if we could respect the user config
in that regard (especially for people who would like to save some space
on their system).

Additionally the default makepkg configuration is ZSTD compression with
a few parameters that are pretty time consuming (as they are meant to be
used by packagers), which will most likely be reverted again in favour
of a more widely applicable set of defaults with the next pacman
package release. See [2] for the related discussion on the Arch Linux
bugtracker.

The rest of the changes looks fine to me, adding in some configuration
options on which package is actually built via the other patch also
sounds good.

Reviewed-by: Christian Heusel <christian@heusel.eu>

Cheers,
Christian

[0]: https://bbs.archlinux.org/viewtopic.php?id=3D127894
[1]: https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/iss=
ues/23

--6zsmai3kwid5skfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmayMyMACgkQwEfU8yi1
JYVcFBAAiqg05CLMKPzjUby5/gKPm83LMQ+TH/roEf990lEefgFgOiAW51BG+4/z
vAz/VOP4BNgdn4EH9snXxDpdE1aVTcB/L2z5a4gW5fnBXIs3aAqxnLuw0Q31hlz+
fnRewydHFU+at0lN3iMO8TC9wuOYs3i0cwjeLf/HEjAj6fetuhkRJ/0WyDXUYvs7
cwTMrm1/lhjVjjiF7N0hs4caU30+6B43Jy629GuD9P6Cjp4aTokTqnFVzsPVCEH5
IZkqn4MxV2GZiuUpUiHxkAnJ7rIwGe/QNkBQOAN+zxKHpXWAe8/7W+Nvxdk8rruu
Z1XzujbpKnuW8RG6qBRukPEbzTF+2wOcUEr03hd7iq0NN4QQngLbuGawY57TMwg/
w5eRfaqdknGXe+9qL3cXsLHYkizacryuZHv9j1+yWBlIxoPXQbU87smGZdxIgwJk
Rk9/g0Me4B2WOH1WmBBDxK0JftSs37QL08MwocNzR+U+2jJmCbccZrpGIiZDKiJK
RS1NpnEJuMNko7QKUktx6ukH6l90qJcBdz9xO+IIvatwN1ZK7idGmzan2XmteorD
Wn206SdnawX/+bABFm6NCRthdPwLTyU1GBMYUyBArzEPDoMffN1dYzvuHx3/7Aqz
WZeCaA6Z3jyhrk4sgyXXoOpya88KhSqvXYZSK9TfIgPh2Y6/by8=
=NoZj
-----END PGP SIGNATURE-----

--6zsmai3kwid5skfe--

