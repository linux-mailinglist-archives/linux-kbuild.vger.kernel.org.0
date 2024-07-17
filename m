Return-Path: <linux-kbuild+bounces-2566-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58F933DF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 15:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F681F2246D
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 13:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C8D1802CF;
	Wed, 17 Jul 2024 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="GcG5HsXx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB9180A67;
	Wed, 17 Jul 2024 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224114; cv=none; b=oIy9iPqWuvTdxnl4Z8k5gyxZFt5z6zCzzwmGD5OizbGSlbwNlwoYB6eVsqCN0/mUktwp3uoceSF/6MNyEcHVwSfAxWvKBXftz2aqrovLCash5JpNav0tv5fvRv0K8ObwUm3w5lI6w/wqI72L0F4yqyZgbtmGeGfOY3mse2j0aDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224114; c=relaxed/simple;
	bh=26/dr5cAmLkwt71fXMXzqv2HSto7f9B0eXVmbbFIuSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOBAen3CnPhymZoyKJjK9QKpRYKrdf66Ltm/75UaDy+gR/T7aOqwWoArwLwbv3LbHuuhyMHFvLJNDL8/mhhUdFoUAlYNhqXnR+xqFXnnnFbCRpnD8kbVKU4UzB/udki9ipfsreLiE8kRH84PxpzMLxeVBE2pWoq7LZyMUcRDwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=GcG5HsXx; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1721224089; x=1721828889; i=christian@heusel.eu;
	bh=zkMXoijZV7eiJ9YfLJ7GDQQqbVDLg2X4mipV2q/IZC4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GcG5HsXxTxHzxCYkIwtzVmmLP5eVvEQqHafcS7VBCKF9i6M5whFlNlTHydsT8/rf
	 MYLxwV7hCE4ePSuV6muU631iAl5wGPQfFgFQqbSlskHYZwuqYPH6BctVGQEUzh5iC
	 qljCg35Tvkq5ZRX/kfS8/pVrp5vvUFKDoCRv70426B9BJ/qqJo6NGUm9C4yP4N5/A
	 IzKfABrGMZhDebJ5Ljy4194YNcmCC2bSXzcBcvRMtHvPtgpmJw3yU3T2H91w3GACW
	 sH/GP3OoSLnidrqdNZ+t3BOOZBzK/AM7z9i88YhGrtGZtqf10SpRiJV+5NKf7EyNO
	 cSnznwHbZ+1Ih63d9Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MwwqB-1s9Frv1JN5-00vyVk; Wed, 17
 Jul 2024 15:48:08 +0200
Date: Wed, 17 Jul 2024 15:48:05 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman
 package
Message-ID: <e8786093-384a-4a7e-a536-3915cd4f933f@heusel.eu>
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ppx5wu2zf6pxg7su"
Content-Disposition: inline
In-Reply-To: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
X-Provags-ID: V03:K1:6h2SfEAS3m59m4K+itlN+f26JqHnzWNz84x/VoIzrgwJpzGuy2y
 ho6WisZk9IdJwy/38gwu625vuYP9snx+1A+LotAaZNIVJZJCeacZXQLWWJWLu7sabLsQT3F
 4qcaEjmDRRqC9T9eauqUp+o3bnfFF0nQzR8DYliL/smR0crW34ZtE00fquOj8hlcJ1QE2p6
 OJC4bolf4KpHsWPdk8vQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bM54psEKBGQ=;nurze7erhd4+rZZPGTbLiLcRaoL
 v94cHLExbz1NW/hHZj6yoQnea4F89n8VHXprnWPp0PFcqvjwqC6b0X9NtjkC87kw6n4b0MnjB
 MQQ0eApbq1E88B8jkkdpofrd8qw3Ozg0VaeadZ68px/14Zfj/cBeT7BZCQr7twwaU4xF+TpPc
 zhf/4BVZodVUSLXXRpDcurmmUsPY1uzbqEfDpeActlouMMWZZ5PzE+8NC59YlNm8aCJdtE0Hj
 NC0JX3Y4dbcJfLhc6/8mPijxyCHthhN6JRnyGtf7mwl3wJP9m22h9vrc8cR4guTR7wLmgmco/
 QkOqe2+mGqzNpFJylXvDyuevZk7Vk8WoWeMT7L+3oXaNwLooPpNGByXSAEf0P6UQHPxP/KIVe
 RDXuSlZqvQEt/jEprCcyd2amh+Tyh3AV8yyrn/2MdU0B8Ceu1JCJ0LbKO/rFBAApNA9QtWoan
 i6G48+GkQE0vjadqwbM3s21Ze2QIJCoNzCKJYlFvKxpU1hRmvMPPac1Df5FSt4kFbKGYhJwFf
 0xC+/a8ch3T5CPaLZfr7gw2LPMUYb+w9Mpmx0JHeYaq82t1j1483sqHRdn+wpjeVXXDhZaAox
 amhJi0C5dAxnkyXuKfMHry/Wd08pSFii0Xh2gP9r7o/6q851o25/hKE/9AnCMy/zsSCd6fmoB
 hkOovwJkvL2fVO/N/xqE7Mr9D4/pNjoF9UTrP/t7YOOjz1z3wPuADSQMFeIxsaaPTQA8rnD0O
 6VWL4YdxZ8kGBuUZKo4cUWvjbPNfYbbww==


--ppx5wu2zf6pxg7su
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/07/16 07:52PM, Thomas Wei=C3=9Fschuh wrote:
> pacman is the package manager used by Arch Linux and its derivates.
> Creating native packages from the kernel tree has multiple advantages:
>
> * The package triggers the correct hooks for initramfs generation and
>   bootloader configuration
> * Uninstallation is complete and also invokes the relevant hooks
> * New UAPI headers can be installed without any manual bookkeeping

Additionally, to what already has been mentioned above, this would also
greatly simplify the instructions and the needed setup for bisection if
people run into regressions, as for example in the following documents:

- https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.ht=
ml
- https://wiki.archlinux.org/title/Bisecting_bugs_with_Git

So thank you (up front) for your effort's here, this could greatly help
to improve the debugging experience!

I have tested this patch by just running "make pacman-pkg" and
everything worked as expected (currently booted from the generated
kernel).

As noted in another mail in this thread it would also be cool if just
plain makepkg could be executed (i.e. -s/--syncdeps, -i/--install and
--packagelist) would be interesting, but I think with the current setup
this could become a bit complicated =F0=9F=A4=94

Maybe it's a possiblity to have a "make pacman-pkgbuild" and then expect
the user to interact with the created PKGBUILD..? Idk if that is
actually better

Also is there a canonical way to be notified whenever people report
issues with this or there are patches to it? I'd love to help out if
that is desirable from your side ..

Also I have written some more comments inline below...

> ---
>  .gitignore               |  6 +++
>  Makefile                 |  2 +-
>  scripts/Makefile.package | 14 +++++++
>  scripts/package/PKGBUILD | 99 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 120 insertions(+), 1 deletion(-)
>=20
> diff --git a/.gitignore b/.gitignore
> index c59dc60ba62e..7902adf4f7f1 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -92,6 +92,12 @@ modules.order
>  #
>  /tar-install/
> =20
> +#
> +# pacman files (make pacman-pkg)
> +#
> +/PKGBUILD
> +/pacman/
> +
>  #
>  # We don't want to ignore the following even if they are dot-files
>  #
> diff --git a/Makefile b/Makefile
> index 7372ea45ed3f..768d3dc107f8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1481,7 +1481,7 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
rs \
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES +=3D include/config include/generated          \
>  		  arch/$(SRCARCH)/include/generated .objdiff \
> -		  debian snap tar-install \
> +		  debian snap tar-install PKGBUILD pacman \
>  		  .config .config.old .version \
>  		  Module.symvers \
>  		  certs/signing_key.pem \
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index bf016af8bf8a..0aaa0832279c 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -141,6 +141,19 @@ snap-pkg:
>  	cd $(objtree)/snap && \
>  	snapcraft --target-arch=3D$(UTS_MACHINE)
> =20
> +# pacman-pkg
> +# ----------------------------------------------------------------------=
-----
> +
> +PHONY +=3D pacman-pkg
> +pacman-pkg:
> +	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> +	+objtree=3D"$(realpath $(objtree))" \
> +		BUILDDIR=3Dpacman \
> +		CARCH=3D"$(UTS_MACHINE)" \
> +		KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
> +		KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-version)" \
> +		makepkg
> +
>  # dir-pkg tar*-pkg - tarball targets
>  # ----------------------------------------------------------------------=
-----
> =20
> @@ -221,6 +234,7 @@ help:
>  	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
>  	@echo '  snap-pkg            - Build only the binary kernel snap packag=
e'
>  	@echo '                        (will connect to external hosts)'
> +	@echo '  pacman-pkg          - Build only the binary kernel pacman pack=
age'
>  	@echo '  dir-pkg             - Build the kernel as a plain directory st=
ructure'
>  	@echo '  tar-pkg             - Build the kernel as an uncompressed tarb=
all'
>  	@echo '  targz-pkg           - Build the kernel as a gzip compressed ta=
rball'
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> new file mode 100644
> index 000000000000..eb3957fad915
> --- /dev/null
> +++ b/scripts/package/PKGBUILD
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Maintainer: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> +
> +pkgbase=3Dlinux-upstream
> +pkgname=3D("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers")
> +pkgver=3D"${KERNELRELEASE//-/_}"

I just wondered whether the version format was chosen deliberatly
here, as it yields something like 6.10.0_04474_ga1cc539bf882-6 for
example. A similar output is generated by the pkgver() function
suggested in the Wiki which would give something like this:
v6.8.rc5.r84.g9b9c280-1.

https://wiki.archlinux.org/title/VCS_package_guidelines#Git

The most notable difference is the usage of underscores vs. dots, which
is not an issue but also not usually a thing with arch packages.

> +# The PKGBUILD is evaluated multiple times.
> +# Running scripts/build-version from here would introduce inconsistencie=
s.
> +pkgrel=3D"${KBUILD_REVISION}"

As far as I understand this means that the pkgrel is incremented on
every build, which is not really usual. The 'pkgrel' variable is
typically used to indicate changes to the binary package that are
besides an upstream release, i.e. when one changes a compile flag or
similar.

Also on a new upstream release this flag would be reset to 1, while here
we increment the variable monotonically.

So this is not an issue per-se, just a bit unusual compared to how we
handle packages in Arch itself.

See https://wiki.archlinux.org/title/PKGBUILD#pkgrel

> +pkgdesc=3D'Linux'

Maybe expand the description here a little to something like "The Linux
kernel and modules as built from the upstream PKGBUILD", just "Linux"
seems to be a bit short.

> +url=3D'https://www.kernel.org/'
> +# Enable flexible cross-compilation
> +arch=3D(${CARCH})
> +license=3D(GPL-2.0-only)
> +makedepends=3D(
> +	base-devel
> +	bc
> +	cpio
> +	gettext
> +	libelf
> +	openssl
> +	pahole
> +	perl
> +	python
> +	rsync
> +	tar
> +)

Including base-devel is to the makedepends is pretty sneaky, although
none of the make dependencies will ever be installed as we do not sync
the dependencies for the packagebuild as I have noted on the beginning
of this mail (--syncdeps).

> [...]

--ppx5wu2zf6pxg7su
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaXy5UACgkQwEfU8yi1
JYWUchAAqzMqFZS+unDrvMmdFksutqyswfMaeH4s8Z8kiueq0OrnZV68r7z+ZCD1
jtMY5eu7yZFB45R7F1xDC0OzcmyR90c6WMZOu298/xS+1t5EcUBlu3J5koMVod9P
SFhvfZ39H7Tfv0ba+wxL+Cl8LHRekVTLsoUFak4C/T7h9fP6NWLpzdHz8smdFkSr
jEh7O8YJCsXn5rWxF3emU/XBCOrlUb+LAb29WyTng8wL7ccusWdvWgwJJQl0HXu1
zfSaVWbN4D2HmsGpcalGvfCPrfwcTLFs3++tsxcjbvG0mmeMwm1+EvoiTbgqkqFM
eKE36RjXAn/U4gq1K6ngIM6VnQ+xXUHClUpB8xlND3dt/ynG0DnQyviIukkyDuNu
L8+j7V7pm1jYDzV+jMUNtpbuDSd3wmuCsGrfDN4inFavtXi1qLrFNgVK3wMiEa+m
syNUu7oSYxKvSCuRzi3JBRemAlJ+QH9zRp3ud21CvWUovr9u5VBJ5YT93O+zExzR
xfLEZGRzts2IyZKD7Ikf+Z/gZC1c9sUvOC/U1ALnYm1Zcws+LzfJFPdsJyCkPR7v
9+yj2x9tGfFfNnViycNgg/CkxhyEY9WwSEfv0EGcGDOlhgJEYVmHVRiX7uuPwaip
GVYFQugVzuc6i1FT0tHMJpLX+eZuvN2FwJQafAG0pm4543gJBCE=
=qh2L
-----END PGP SIGNATURE-----

--ppx5wu2zf6pxg7su--

