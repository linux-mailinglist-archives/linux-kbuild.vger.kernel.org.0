Return-Path: <linux-kbuild+bounces-4942-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFF79E0A8C
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 18:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF75B282EAC
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 17:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213681DC185;
	Mon,  2 Dec 2024 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="fYi+IZqG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB181DC19A
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Dec 2024 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733162344; cv=none; b=EQxgXgaTBwBWcH0GSlpQKWljzr3UdawySfnvR6JSB3gikVqigI5s34IoRYWrxcpeQ3BK0jlVuauDmayz5uWo9ZJNgfnRZMC+N+L9M7+9V/ug8UU4Z+q68Dzzr49zwL4ueG5U/7QCA2rEVbHtFiDrNc7XLnHn84JbBFHRkzvrBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733162344; c=relaxed/simple;
	bh=uQyn/0vURxi1maWOz7Bbi0fYsfiV/qLlOKQWrNCLXtM=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:Subject:From:Cc:To:Date:Message-ID; b=CQ/yu2UzwqW6EWFuKAhRGp1JyaiUVCLiJPtCBm9yvFKA8C2heJ07LFVpm54hQ/DzT7xzCVc42IYj2glOTzVw4rXRQXsEQRoxxqV/MECmhbZks5vWAU+wuytkbaeTNtXsCZlY9xOpBt1NUDnmpRD+c5boLmyXUHAMrZ/WehwjW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=fYi+IZqG; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (ip2504e6e1.dynamic.kabel-deutschland.de [37.4.230.225])
	by mister-muffin.de (Postfix) with ESMTPSA id 26018304;
	Mon,  2 Dec 2024 18:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1733162333;
	bh=uQyn/0vURxi1maWOz7Bbi0fYsfiV/qLlOKQWrNCLXtM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fYi+IZqGcMW162dt2atsgj+FTTkU1Nwz6gdBi18Wx+J9ZhJBQLvlnOZvAF0tHK1sx
	 qYMONbflUBM/zQyHNVfmOdjvZfzUqZ1VT6LAhmSr5hyBnUABfrG9CIFLXY1hyZPSi+
	 t63gQwSGLeOAodxl6ZqYVTBa0JDOQlr8rJ4WG1kY=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============6624358916724242307=="
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNATyvVGt8j7bcwsWKaophdBU3x53=_UnPajKjtSMtoS9iA@mail.gmail.com>
References: <CAK7LNARMBTf8usS0UxZ06gVZDbTTrhXt73mpVaGZRby-Zcdtsw@mail.gmail.com> <20241128062940.1708257-1-josch@mister-muffin.de> <20241128062940.1708257-2-josch@mister-muffin.de> <CAK7LNATyvVGt8j7bcwsWKaophdBU3x53=_UnPajKjtSMtoS9iA@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Cc: linux-kbuild@vger.kernel.org
To: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 02 Dec 2024 18:58:52 +0100
Message-ID: <173316233246.3934267.15523840202340139145@localhost>
User-Agent: alot/0.10

--===============6624358916724242307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Quoting Masahiro Yamada (2024-12-02 16:42:02)
> > @@ -84,7 +93,26 @@ install_linux_image () { # Tell initramfs builder
> > whether it's wanted export INITRD=3D$(if_enabled_echo CONFIG_BLK_DEV_IN=
ITRD
> > Yes No)
> >
> > -               test -d ${debhookdir}/${script}.d && run-parts --arg=3D=
"${KERNELRELEASE}" --arg=3D"/${installed_image_path}" ${debhookdir}/${scrip=
t}.d
> > +               # run-parts will error out if one of its directory argu=
ments does not
> > +               # exist, so filter the list of hook directories accordi=
ngly.
> > +               hookdirs=3D
> > +               for dir in ${debhookdir}; do
> > +                       test -d "\$dir/${script}.d" || continue
> > +                       hookdirs=3D"\$hookdirs \$dir/${script}.d"
> > +               done
> > +               hookdirs=3D"\${hookdirs# }"
> > +               test -n "\$hookdirs" || exit 0
> > +
> > +               # If more than one hook directory remained, check versi=
on of run-parts. If
> > +               # run-parts is too old, fall back to only processing th=
e first.
> > +               case \$hookdirs in *" "*) if ! run-parts --help 2>&1 \
> > +                               | grep -Fxq "Usage: run-parts [OPTION].=
.. DIRECTORY [DIRECTORY ...]"; then
> > +                               echo "E: run-parts >=3D5.21 is required=
 for multiple hook directories, falling back to $firsthookdir" >&2
>=20
> Same comment as in the previous version.
> If both /etc/kernel/postinst.d/ and /usr/share/kernel/postinst.d/ exist,
> can we assume the run-parts>=3D5.12 on that system?

since KDEB_HOOKDIR can now be any directories and any number of directories,
the question should rather be: if more than one directory from KDEB_HOOKDIR
exists, can we assume that run-parts>=3D5.12 exists on that system?

Personally, I'd prefer a best-effort fallback mechanism. The alternative wo=
uld
be that kernel installation would just error out in case a (buggy) package =
on a
distro ships something in /usr/share/kernel/postinst.d/ but failed to also
declare a versioned dependency against debianutils. The error message cannot
(or rather only with considerable effort) tell the user *why* their kernel
installation errored out. By only considering the first hook directory
(probably /etc) in those situation, the kernel would succeed to install and=
 the
hooks from the (buggy) package would be skipped. I understand that such a
behaviour comes with its own set of disadvantages. One could also argue, th=
at
it is better to error out loudly in case of an error instead of hiding a
message prefixed with a "E:" in a bunch of console output when a kernel pac=
kage
gets installed.

What is your position on this question? What behaviour would you prefer? If=
 you
strongly prefer the kernel installation to error out loudly if run-parts is=
 too
old, then my next patch will implement just that. I think whether "we can
assume run-parts>=3D5.12" depends on what we declare to be the right way to=
 hold
this feature. If we say "packages must declare this versioned dependency an=
d if
they fail to do this then it is their bug and not ours" then yes, then we c=
an
assume run-parts>=3D5.12 in case of multiple directories.

> Do we need to check the help message and offer the fallback mechanism?

The answer two that question depends on the answer to the last question. If=
 we
want to error out loudly with unsupported run-parts, then no help message h=
as
to be checked. Otherwise, when we want to check what version of run-parts we
have, then there are two options. Either parsing the --version output (whic=
h is
not trivial itself because run-parts prints six lines of copyright informat=
ion)
or parsing the --help output. The debianutils maintainer encouraged using t=
he
latter option which is why I chose that one.

Thanks!

cheers, josch
--===============6624358916724242307==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElFhU6KL81LF4wVq58sulx4+9g+EFAmdN9VkACgkQ8sulx4+9
g+Hntw//RuQPuPkaWTE+A6z+6enRoy3qZb4RxvepPAt9FHm7HJtQ0IhyB0B3XOjG
e3EgQCzIm65fnrXDAGj7lJg/ablpnDENmJR98Eq7KzeIva5KQBemJzfoO1R+5eQO
9kh/es8YSR4KElviMMmmXBMRax/am5QZ+Ar+6ryqJYjduxvqxB2joMR7Ibqrq8vD
/jq8aZ7FkqwmqEZ52OicBr9HlOxwdBMOSWFNAxoUbmFFgcNl/7z0fO1T1gGQ+Kuq
xdEl+z15cZmPNqtUVIJl5Q/5TCbLmNpCG2iLH4u4vXNwu9/SsN0CZgOFkIOnZREJ
AFpIuoJbdGuUZOqk/06HAviliNLe3unJq+n3o1XIe1/Hz3QJLqyPgFfGxdW/ecQM
aXTvv7lAD70f1GldODCoGQEX5DAMhsnBH81/MJVMiQMJzkF52fBIwk4Hkk5NIzWh
EtHBGlFSzSMoW0RqHwZVD/JXi2zVvDDexfaHXaC2gtEPmG5o8qQcD8rUmzYx48u/
5884BKm0jqYjR55BMFq/Qx/G1jLo9TnDrYcjxPCLsdd9dF3Wh9oQmXk+z7ndCvrb
hD6c+69r2dtEbq33YR+xe9o+iqaOPcv813sLSFD+I/MTJtAFwGSMS2sbo1y2hgei
TbhaYjirBuSJfoCZK0Wj6KMZJPorSkddFXSk3oK975qrRBTJoE8=
=HThX
-----END PGP SIGNATURE-----

--===============6624358916724242307==--

