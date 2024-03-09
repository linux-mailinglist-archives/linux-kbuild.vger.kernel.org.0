Return-Path: <linux-kbuild+bounces-1198-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E434C8773D8
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Mar 2024 21:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE12C1C20A2D
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Mar 2024 20:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D888316FF30;
	Sat,  9 Mar 2024 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="2+7G9thL";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Q8JUfZC8";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="gFOY0eJg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i652.smtp2go.com (e2i652.smtp2go.com [103.2.142.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF94D9F2
	for <linux-kbuild@vger.kernel.org>; Sat,  9 Mar 2024 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710015909; cv=none; b=N+hxvYz1lFRxrGqyirdSn7ZRC4UCGmQEA9uCnbTl9yHtTC8GdHIuNjv9E5fMwCldb4B/kZGJC2b0TLAkYw4DitE84F972xdvfDku8bSIPh5WFSnB/tLttGrjeE0nQywaPbF/e+FuET46hzarSUDspp3mE+0p8daw04zKkUHayNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710015909; c=relaxed/simple;
	bh=dl2VisRpJYnYlk9wJru0VHfQwZoHEewY2ivg3LESeOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdRJgsv33XBXV3KnQEPqCjj+3jsvSgosfOm0kZWr5fTCb5oV62+4NuL9zFpd5DcgyObl8XLSZYeEdcFVM/0IoiYAgvQ1TxpoVNdEcv1mU4s3HLPUGgR7mjR+4+Y6UFg4IfS2iK0/D7kYwph0tv3qDxd+PtU6sDBdSV97VM/BQAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=2+7G9thL reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Q8JUfZC8; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=gFOY0eJg; arc=none smtp.client-ip=103.2.142.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1710016803; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=mtqDjolUsWaeGKZ24iwFO2dVVvu6hdYgTIfsUsr0MCs=; b=2+7G9thL
	dEBF03zsN5dRdmsH/cOAJDTn+YTxVMZyj+aKmTKrszRvF7/h3F+16GeEFevx8ptRWUWJ2h1+huXyS
	0HFSkLGzp4uSdmZ4xpMpkuH0pMuiVRHYldWIk54dbBwzNaS74nT3w0zffzg2bEL6BILNBlWddUhnb
	xT5/W5UnV234um1Y7QRyGMoXoJ+G4yplpbSdA4G7CnJs2FpuLh9FYe3JpOVrYefH7vql4yGHtDuo9
	mSglyNm/y7UffuySRgg+UMM2wJcJ5sFC9qZbsGBT6a8wUEKH/wgCLgZDao8Bb7UikH1vCL5DrR0RI
	N2uUwkD9rCY9WlfmzXgeV5qoYQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1710015903; h=from : subject :
 to : message-id : date;
 bh=mtqDjolUsWaeGKZ24iwFO2dVVvu6hdYgTIfsUsr0MCs=;
 b=Q8JUfZC8nanWA0RfDdpMFCDVC6q31K2dV203EeWHSV+cuoQZbiyrAlJ9nF2Gy+oSR46Uo
 aEt16RQaINN2FB6DB9lms/gecmYiyJWdW1CsI8WJ+k2+t9WKcbbL6BD6XP/EOQPI2L+s/jm
 4iJ/UBnmJzwKUr8cv3LlGXT9EwvPLVIuikURHUV2EA72uR9tjtDtngMUzyeVzRoV9VYeJry
 nS4mE6nIent8bOJl1bautOXI6DQ3kU5gmiL+8/HX3ahEd179CoGNpvLpG1HNpDwyuF9v6jx
 BT2/iuSlOtx2dtPMo3vWbw9IVbKPZOtBDp6FCslw/trIBw3Cp/gUP4+3Pv/w==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rj3FO-qt4IRI-BW; Sat, 09 Mar 2024 20:24:47 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rj3FN-4Xd4Kv-2H; Sat, 09 Mar 2024 20:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1710015883; bh=dl2VisRpJYnYlk9wJru0VHfQwZoHEewY2ivg3LESeOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gFOY0eJg5FUIQdh/aBrJrJCwJcsMD8QIkwANt46Po5BLaEUPsEusNWxcO/dCUbNT8
 u/8egPqkCYkuowOi9F+POkzHtXO5y1D0OwUOIbAnEq6iuQOih2CKB4PfOQdNT2SjJ+
 CbGghSUYssfAjqYG90k159U++gBZHN3pvY7PXwis=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id A42F93CF3F; Sat,  9 Mar 2024 21:24:42 +0100 (CET)
Date: Sat, 9 Mar 2024 21:24:42 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] kconfig: add some Kconfig env variables to make help
Message-ID: <ZezFirN5okYdhL1U@fjasle.eu>
References: <CAK7LNAQ8OyNMeGzVoTRg-sHDZ4YK0EKY_eEWNepekaibO_ZKwg@mail.gmail.com>
 <20240229021010.GM11972@google.com>
 <CAK7LNASujf8m4PpMyoCC1cTN_YGeG1HVaOR+3pZx5=3OJp=85A@mail.gmail.com>
 <20240229034739.GN11972@google.com>
 <CAK7LNAS-mOxY884pLEMwWaX+wgzXdc6+=vqN=wfHBekuKL5ryA@mail.gmail.com>
 <20240301043316.GO11972@google.com>
 <ZeG2PRYmdO0r44kS@buildd.core.avm.de>
 <20240301142844.GP11972@google.com>
 <ZeVtIwua9T5prwUl@buildd.core.avm.de>
 <CAK7LNAT7+GbXaF6MW18YvEeF4ZZLrn6sOutHPNxcoL_RD1Utyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nQS4gEj3tiVtUJKn"
Content-Disposition: inline
In-Reply-To: <CAK7LNAT7+GbXaF6MW18YvEeF4ZZLrn6sOutHPNxcoL_RD1Utyw@mail.gmail.com>
X-Smtpcorp-Track: 1rM3FN4bd4Kv2H.7UWOBS6D7eN9x
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sP8TmRGQtl
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>


--nQS4gEj3tiVtUJKn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 01:46:35AM +0900 Masahiro Yamada wrote:
> On Mon, Mar 4, 2024 at 3:41=E2=80=AFPM Nicolas Schier <n.schier@avm.de> w=
rote:
> >
> > On Fri, Mar 01, 2024 at 11:28:44PM +0900, Sergey Senozhatsky wrote:
> > > On (24/03/01 12:04), Nicolas Schier wrote:
> > > > Perhaps it might be a compromise to let 'make help' point to the
> > > > kbuild/kconfig documentation?
> > >
> > > Yes, I was thinking the same. A one-liner description per-env var
> > > and point to documentation if one-liner is not enough
> > >
> > >       KCONFIG_BARREL_ROLL     - kconfig does a barrel roll
> > >       KCONFIG_FOO_BAR         - kconfig does foo and then bar (see
> > >       documentation for details)
> >
> > No, I thought about leaving out any concrete examples but just adding a
> > sentence like:
> >
> >   kconfig and kbuild allow tuning and checks by settings various
> >   environment variables, cp. Documentation/kbuild/ for details.
> >
> > Then there is no need to re-document each variable in 'make help' but
> > those who are new are explicitly pointed to the maintained
> > documentation.
>=20
>=20
> That can be a compromised way, but it sounds silly...
>=20
> Is it helpful at least for people who know 'make help'
> but do not know Documentation/kbuild/?

Touch=C3=A9, that's probably right.

Kind regards,
Nicolas

--nQS4gEj3tiVtUJKn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmXsxX4ACgkQB1IKcBYm
EmnwBhAAht/u1aC8A5IC+/JVNytMj45JZ2OmKLjf1CWbxsZAx4eF0oFpxul4vOyJ
gqu5nPoC5A/oUSi/l6HQtwctj57NV1i+VNkQk+r7rEdBvb6hmo5pAfgpJNPmIVIx
gv/lL8XB0tJ26NcGv83kMIfH/3XOcedNrMO1969SQ4yz53Kdb4JwSURZfAQtVWIi
PT5ktVrpC48f+5WEfY4lAxELgkO57QoYTUNs1xeQhsecTpHkb4t6kRUNoKYIRR5I
zvMoV5rHk1gtiUmaZg0+0XS+K040VUdluQnXtDx1E1e1O5cXac27dpkLeUzElSXU
rJw7FL83bafFwWlXDGM47jmM6sL2F3ugE0vtRqKeMkxXFFOjF/lGhaIKKgD73QtM
AOxMyRLt+B48myvkYaToisDieXDw5EQCCmqcrgrEtRAJlcCJBW2S+GNbNMKc9R23
uTJP+iag6p1zubKjUldFyeXl1vtCpqia5Y9FrPatX+FzF/5x8Oo/GjkvYqhjxTYh
mu1W+Qx6y7A2xcbiiG+RiQN3nHC9pOD4kl+JzIUu3oIl8tmgpfyuNPvvk6Zp1uic
owlJammmvdFjd02be5dF04tOOT+LLoihGy52kedAsN1TRdkrIiTqBDWccTzLabeq
sJF3wdVozxezi2dcvQhyWNxVVuN5MM9SSSPZGF9rRFFx3GW4hGE=
=ELdL
-----END PGP SIGNATURE-----

--nQS4gEj3tiVtUJKn--

