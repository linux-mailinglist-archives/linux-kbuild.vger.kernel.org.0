Return-Path: <linux-kbuild+bounces-1226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10087A474
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Mar 2024 10:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 408721F2269D
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Mar 2024 09:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3FC1B277;
	Wed, 13 Mar 2024 09:01:17 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95811BDEE
	for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2024 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710320476; cv=none; b=cnj2cexHsRwEHNPR2JI/KHYoxU4EMZoHv8G58jAJ8umkEp2qyhp7slPMAasWzexZ5oZuoxwdadkygMh0cwvBJdo6H5wtxWevw9iu1RMfhJwDRBA1R7esWhbmPVhhLpFg+/BWcQ8Ic9H9H1dad8IxfYuGEoIz8oSQA3Nqlvuhi84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710320476; c=relaxed/simple;
	bh=tPp9wpHnMR+ocs6xYZEuu9COA0lUEBrBrD4AMOa+lKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SadxwPaSBggED0Vt1+UNvKubs65yLqBgRt/Qt8osA0OjnN4+x9X9OuIZxuiVDGe4YeeEVrUtkvgSiDgZ+kFLa2rNDw+o+RKwaU8kw3zr4l1zf95zRFHdbzys0SRd5HbzaATO/Q1mf/TuIq6GlckGTkNjH+Cn+4KHS+jJIDKsDaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkKTq-000386-Ik; Wed, 13 Mar 2024 10:00:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkKTo-0064zd-Do; Wed, 13 Mar 2024 10:00:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkKTo-005Hi3-14;
	Wed, 13 Mar 2024 10:00:56 +0100
Date: Wed, 13 Mar 2024 10:00:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: linux-next: build warning after merge of the mm tree
Message-ID: <psaj3nztnhcxiwjnie3bbpsn7efcsxp3yx3mh54uello22773v@fw5qpqs4gh2i>
References: <20240313150728.12e20208@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2zmul7e526qlrp5s"
Content-Disposition: inline
In-Reply-To: <20240313150728.12e20208@canb.auug.org.au>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org


--2zmul7e526qlrp5s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 03:07:28PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the mm tree, today's linux-next build (powerpc allyesconfig)
> produced this warning:
>=20
> Use of uninitialized value $ENV{"abs_srctree"} in concatenation (.) or st=
ring at /home/sfr/next/next/lib/build_OID_registry line 38.
>=20
> Introduced by commit
>=20
>   325f7b0aaea6 ("lib/build_OID_registry: Don't mention the full path of t=
he script in output")
>=20
> from the mm-nonmm-unstable branch of the mm tree.

Actually the warning doesn't happen on 325f7b0aaea6. The commit is only
problematic in combination with commit

	e2bad142bb3d ("kbuild: unexport abs_srctree and abs_objtree")

=2E This commit suggests to use $(abspath ) or $(realpath ) instead, but I
fail to apply this suggestion here.

Obviously

diff --git a/Makefile b/Makefile
index 5e09b53b4850..f73a73a125e0 100644
--- a/Makefile
+++ b/Makefile
@@ -39,7 +39,7 @@ __all:
 # prepare rule.
=20
 this-makefile :=3D $(lastword $(MAKEFILE_LIST))
-abs_srctree :=3D $(realpath $(dir $(this-makefile)))
+export abs_srctree :=3D $(realpath $(dir $(this-makefile)))
 abs_objtree :=3D $(CURDIR)
=20
 ifneq ($(sub_make_done),1)

would help.

Any ideas how to properly handle that? Would the export be ok?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2zmul7e526qlrp5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXxa0cACgkQj4D7WH0S
/k4L0wgAtFXvi2SKrUZSJkChbQc1i9RRgfE3LyGWBx4rp7IFLOOG1uy8DLMZU9RV
neRZjELj/yIOMwudxBzN//rSvt1Fyg1uwo1F7UEZp2F6AxDoBdH98lCTPTdebALP
8E/rbz4sNjtoadzN+4DascK4hlZSbKCDXkk8YPgR/K/uugB+izgJ1P22tcLu5HIP
rR75ToEKmb6tBHa9lILH5o5uoOtZN/8PjcWZjevhFpQIFQmJLnitnJRQjoyrZDEE
I5f4QBUgL9uwi/FCJVv5TF5CONmqkumagjJ9OaszUxuYEcxW+ANWQAwvzTDH+MTW
6vy9QAnixJkgJV8qKZ6bOYGaST3N+A==
=HkV0
-----END PGP SIGNATURE-----

--2zmul7e526qlrp5s--

