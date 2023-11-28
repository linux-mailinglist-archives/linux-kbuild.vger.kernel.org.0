Return-Path: <linux-kbuild+bounces-184-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9CA7FBFC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 17:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDE11B20CB5
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 16:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4BF37D3E;
	Tue, 28 Nov 2023 16:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
X-Greylist: delayed 1442 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Nov 2023 08:55:14 PST
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [95.217.213.242])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E439D6;
	Tue, 28 Nov 2023 08:55:13 -0800 (PST)
Received: from [213.219.164.206] (helo=deadeye)
	by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ben@decadent.org.uk>)
	id 1r80z8-00080L-7u; Tue, 28 Nov 2023 17:30:54 +0100
Received: from ben by deadeye with local (Exim 4.97)
	(envelope-from <ben@decadent.org.uk>)
	id 1r80z7-0000000DbDM-379u;
	Tue, 28 Nov 2023 16:30:53 +0000
Message-ID: <7a2684e680ffe279ed1e586e8ddb24b94c2cf010.camel@decadent.org.uk>
Subject: Re: [PATCH v2] kbuild: deb-pkg: remove the fakeroot builds support
From: Ben Hutchings <ben@decadent.org.uk>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Guillem Jover <guillem@debian.org>, Nathan Chancellor
 <nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>, Nicolas
 Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Date: Tue, 28 Nov 2023 16:30:35 +0000
In-Reply-To: <20231128153858.84932-1-masahiroy@kernel.org>
References: <20231128153858.84932-1-masahiroy@kernel.org>
Autocrypt: addr=ben@decadent.org.uk; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iHFOhYnSgOYjebv1pxSh"
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 213.219.164.206
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-iHFOhYnSgOYjebv1pxSh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-11-29 at 00:38 +0900, Masahiro Yamada wrote:
> In 2017, the dpkg suite introduced the rootless builds support with the
> following commits:
>=20
>   - 2436807c87b0 ("dpkg-deb: Add support for rootless builds")
>   - fca1bfe84068 ("dpkg-buildpackage: Add support for rootless builds")
>=20
> This feature is available in the default dpkg on Debian 10 and Ubuntu
> 20.04.
>=20
> Remove the old method.

This seems reasonable.


> Additionally, export DEB_RULES_REQUIRES_ROOT=3Dno in case debian/rules is
> invoked without dpkg-buildpackage. This change aligns with the Debian
> kernel commit 65206e29f378 ("Allow to run d/rules.real without root").

The Debian linux package has multiple makefiles used recursively
(rather than included).  The referenced commit is kind of a hack to
make rootless builds of a subset of binary packages work when invoking
one of the lower-level makefiles directly.

It works because the package runs dh_builddeb, which checks
DEB_RULES_REQUIRES_ROOT.  But setting DEB_RULES_REQUIRES_ROOT has
absolutely zero effect on dpkg-deb or other low-level tools.

> While the upstream kernel currently does not run dh_testroot, it may
> be useful in the future.

We can do one of:

1. Ignore DEB_RULES_REQUIRES_ROOT, assume that dpkg-deb supports
   --root-owner-group and use it unconditionally (your v1).
2. Check DEB_RULES_REQUIRES_ROOT, do either fakeroot and chown or
   dpkg-deb --root-owner-group (current behaviour), and maybe also do
   the equivalent of dh_testroot.
3. Delegate this to dh_builddeb.  Since we use dh_listpackages now,
   debhelper is already required and this would make things a lot
   simpler.

But the combination of changes in v2 does not make sense to me.

Ben.

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
> Changes in v2:
>   - add DEB_RULES_REQUIRES_ROOT=3Dno to debian/rules
>=20
>  scripts/Makefile.package     | 4 +---
>  scripts/package/builddeb     | 8 +-------
>  scripts/package/debian/rules | 2 ++
>  3 files changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 0c3adc48dfe8..a81dfb1f5181 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -109,8 +109,6 @@ debian-orig: linux.tar$(debian-orig-suffix) debian
>  		cp $< ../$(orig-name); \
>  	fi
> =20
> -KBUILD_PKG_ROOTCMD ?=3D 'fakeroot -u'
> -
>  PHONY +=3D deb-pkg srcdeb-pkg bindeb-pkg
> =20
>  deb-pkg:    private build-type :=3D source,binary
> @@ -125,7 +123,7 @@ deb-pkg srcdeb-pkg bindeb-pkg:
>  	$(if $(findstring source, $(build-type)), \
>  		--unsigned-source --compression=3D$(KDEB_SOURCE_COMPRESS)) \
>  	$(if $(findstring binary, $(build-type)), \
> -		-R'$(MAKE) -f debian/rules' -j1 -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debia=
n/arch), \
> +		-R'$(MAKE) -f debian/rules' -j1 -a$$(cat debian/arch), \
>  		--no-check-builddeps) \
>  	$(DPKG_FLAGS))
> =20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index d7dd0d04c70c..2fe51e6919da 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -36,19 +36,13 @@ create_package() {
>  	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
>  		| xargs -r0 md5sum > DEBIAN/md5sums"
> =20
> -	# Fix ownership and permissions
> -	if [ "$DEB_RULES_REQUIRES_ROOT" =3D "no" ]; then
> -		dpkg_deb_opts=3D"--root-owner-group"
> -	else
> -		chown -R root:root "$pdir"
> -	fi
>  	# a+rX in case we are in a restrictive umask environment like 0077
>  	# ug-s in case we build in a setuid/setgid directory
>  	chmod -R go-w,a+rX,ug-s "$pdir"
> =20
>  	# Create the package
>  	dpkg-gencontrol -p$pname -P"$pdir"
> -	dpkg-deb $dpkg_deb_opts ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pd=
ir" ..
> +	dpkg-deb --root-owner-group ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build =
"$pdir" ..
>  }
> =20
>  install_linux_image () {
> diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
> index 3dafa9496c63..f23d97087948 100755
> --- a/scripts/package/debian/rules
> +++ b/scripts/package/debian/rules
> @@ -5,6 +5,8 @@ include debian/rules.vars
> =20
>  srctree ?=3D .
> =20
> +export DEB_RULES_REQUIRES_ROOT :=3D no
> +
>  ifneq (,$(filter-out parallel=3D1,$(filter parallel=3D%,$(DEB_BUILD_OPTI=
ONS))))
>      NUMJOBS =3D $(patsubst parallel=3D%,%,$(filter parallel=3D%,$(DEB_BU=
ILD_OPTIONS)))
>      MAKEFLAGS +=3D -j$(NUMJOBS)

--=20
Ben Hutchings
For every complex problem
there is a solution that is simple, neat, and wrong.


--=-iHFOhYnSgOYjebv1pxSh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmVmFasACgkQ57/I7JWG
EQlg7hAAi221IYvXWHElPmBfQfGsjyT/CJQkFMksCYNxOPUgV464Vh8phOsSr4Ux
kuhlU5HlO4+1dYdqCwpuMiXtFMyuVtEToik3Dom2RLMFZuWC8J6B2e5wF9XWjb/U
59uy9xm537NQU658w632ubnQLQQHPash20xD8E0re0Wn1kcVKn0qK35ZZHANIaqO
p0rY7wY7+mFVowOR/mYDYebFYFQ71ujcFVs2B/gXA5a2X1UIA+aX9xRGtCd8Jho6
kTH+DlBTM20dGpcZEsqQ0e0Wv9jeLaz7RC+VvnQABcEqq51W/NdjOYmInAfpf8n2
EEbZcn6Wm4CUYvokZA42VYJbZgcRv7G2UAO8OxvVNh5C146fk6/l2qBaI+vOpmvt
RNbcO+3sVBW9Ti2HVarCfFzonYyI3kqLQ45e5PVh35dShD/O9LbfMJQ18gaYvLB7
NkKmFNvp/maZsumVd+NnFduoIyYQ8as4qWmNZJNXIjf/ciTGnSl77MEEmInpYPez
pMzGUQ8LidO19tcds2SXVhPl0drm8FEf9EksdH/c/T4QU6A/CpiydG8xdxXCU5MO
aPuYp6FMVZKBuoMQZkme2Tyx4DWYozg2F+XR90LW4Rset338eox51iXLPWuAVwcd
pMi2ltnhKhNTzPzG9JsBmiDF0gXgavZrMiXeWi22YIVf9qXH+Ro=
=k7nd
-----END PGP SIGNATURE-----

--=-iHFOhYnSgOYjebv1pxSh--

