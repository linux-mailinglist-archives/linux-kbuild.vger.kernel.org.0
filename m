Return-Path: <linux-kbuild+bounces-4954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574FE9E1815
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B10B165CCE
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 09:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9D41E379C;
	Tue,  3 Dec 2024 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="NR/VmLSs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83B21E376C
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218860; cv=none; b=iw5x3uOeKdKLDh/sKdysq7ci+PSm3Ha/F8+fPj0XOJ5t3YT1lBciyzFJFI9TdNMhgqvaaixRGycYIIiwnNiTUa/MOCbfgZr8YgPEufkLJ2l/o+E0Lysrz0OeV8bhBu0RRNJLwlU/pIaez1h5Z5UI4jpvyH6jS43Rzq34V13nRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218860; c=relaxed/simple;
	bh=jWj+34H3YMxlTA3pZK3mlssWhYPMju5WBILWiMg6MhE=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:Subject:From:Cc:To:Date:Message-ID; b=lO45g4G0XVoZ9YRJKBG+mZZwR5yzEZBVJ00aTnX6WhxH1Ic2v3Ke3sGjwoVcLpLopvEQ3Hsqeaeq9r9IV7m2k8IZeRFQMrHqmlyhO8knR/g1SrBTkCNB9KHtxIyxNgHiGXzUOEL9p451l5jzAFgpk2ZIVz6SE9d+ePymWr79RN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=NR/VmLSs; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (unknown [37.4.230.225])
	by mister-muffin.de (Postfix) with ESMTPSA id 0DD9D304;
	Tue,  3 Dec 2024 10:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1733218856;
	bh=jWj+34H3YMxlTA3pZK3mlssWhYPMju5WBILWiMg6MhE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NR/VmLSsadOMRWJj9nw3icSBPKSU0TzT4jvXiSFfcgkd0GF76nbwwG8eRe1CAFIVr
	 X9heePKZg4913ApQ5LuSB5B0mzp+1LhdwEOw4esrWWPc5UIXaNzz69NLmBxYrNqpD3
	 3SlhOoXBBPReJgWvgj8VjpeT73b81dBpC1OQFitA=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============8636455913696694437=="
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNASiENba_7O2-6utUaWCad=rsFkD5ZMeSheqG64MGhZGQg@mail.gmail.com>
References: <CAK7LNARarqG2Okacbp4TKJAFz9OagB2NF=qs-Cq2rzOW4CA2Bg@mail.gmail.com> <20241203065441.2341579-1-josch@mister-muffin.de> <20241203065441.2341579-2-josch@mister-muffin.de> <CAK7LNASiENba_7O2-6utUaWCad=rsFkD5ZMeSheqG64MGhZGQg@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Cc: linux-kbuild@vger.kernel.org
To: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 03 Dec 2024 10:40:55 +0100
Message-ID: <173321885530.3934267.7112925923730589277@localhost>
User-Agent: alot/0.10

--===============8636455913696694437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting Masahiro Yamada (2024-12-03 10:27:11)
> > @@ -68,11 +70,18 @@ install_linux_image () {
> >         # kernel packages, as well as kernel packages built using make-=
kpkg.
> >         # make-kpkg sets $INITRD to indicate whether an initramfs is wa=
nted, and
> >         # so do we; recent versions of dracut and initramfs-tools will =
obey this.
> > -       debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel}
> > +       debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel /usr/share/kernel}
> > +
> > +       # Only pre-create the first hook directory. Support for more th=
an one hook
> > +       # directory requires run-parts 5.21 and it is the responsibilit=
y of packages
> > +       # creating additional hook directories to declare that dependen=
cy.
> > +       firsthookdir=3D${debhookdir%% *}
> >         for script in postinst postrm preinst prerm; do
> > -               mkdir -p "${pdir}${debhookdir}/${script}.d"
> > +               mkdir -p "${pdir}${firsthookdir}/${script}.d"
>=20
> I still do not understand why this 'mkdir' is needed.
>=20
> linux-image package does not install any script into the hook directory.
> In general, there exist some scripts (e.g. initramfs-tools) already
> under /etc/kernel/*.d/  (and under /usr/share/kernel/*.d/ once the
> new location is used broader).
> If nothing exists under the hook directory, there is no point to
> execute run-parts.

Unless I'm misunderstanding the old code, the existing script *does* create
/etc/kernel/*.d/ (That's the "- mkdir -p" line above) so I wanted to preser=
ve
this behaviour even with more than one directory in KDEB_HOOKDIR. Do I
misunderstand something? Are you saying that with this change, no
/etc/kernel/*.d/ should be created anymore? Why?

> > +       done
> >
> > -               mkdir -p "${pdir}/DEBIAN"
> > +       mkdir -p "${pdir}/DEBIAN"
>=20
> Please drop this noise change.
>=20
> If you want to optimize this, please split it into a separate patch like
> "kbuild: deb-pkg: create DEBIAN directory just once" etc.

Okay, no need to optimize this now. mkdir -p is cheap.

Thanks!

cheers, josch
--===============8636455913696694437==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElFhU6KL81LF4wVq58sulx4+9g+EFAmdO0iQACgkQ8sulx4+9
g+G84w/8C12soywhuafBv5UkSJTU0Wwbpjn3vo9lsGRlZFhWTG33gAtNE8EDKDJH
SMSrC8+BeopYAKXDw80aQdupSbgYE2Ksi2os2uTQT+BtrMenbTvT5HWvUyLYPeqa
OKxgxGDMDoEch/SgxYJAlqt2R6D7bBb7kkeub0y6xwmPMZ+oiiAJPYOUagvSxFlK
d9DtHf/o75hGv5oQpB9QaGQP51XavyvXeFCmf0R86Alh2p5CcMFnfpdb7q6YSGcf
6IvpFm7gSJCyYp7CMz5DirxXfI3P1Bk4qOaWZ938jyk4Ts1TRJbJNLIk25jjDoLA
t4/WTAySBi+ELMu9BF0WWcjjXKK3gMXizR/X9ejqEjOKVylXEWaSg0PZgWF/Neey
z8eCumAvtIav2NOUeGqsq5/uo9j0swIvERqnJBrhF7yHQAYmrBkRb3OUHxU7pTL5
5Nu6xdXRty5txgeqFMwJomG4KcvAcc2/V3sK8eggXYXu9Hty9cxhsy4gTexxws5h
Ss3wbx3Uvtt1ADFoFQ2WVI9u/2fgkQSP9PgsBEyifY3Qfykn3xBF3aCYbLuAA5k5
avteIg+JNZbhLiWa9RkEgcQVkBJ01WEE+KhtPYNjG+OKEejwmRXM5nIhPupcOzZ9
jYL6QueXHbDwvxXkf0YV6Rw2ZqmSa5IiB4biZGHoqH8srR6iHAI=
=yu9k
-----END PGP SIGNATURE-----

--===============8636455913696694437==--

