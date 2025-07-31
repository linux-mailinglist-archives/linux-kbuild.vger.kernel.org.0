Return-Path: <linux-kbuild+bounces-8260-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58641B175C6
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 19:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44BAD3BC7C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 17:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C245C22FF2E;
	Thu, 31 Jul 2025 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O/trRe2m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348841C5F06
	for <linux-kbuild@vger.kernel.org>; Thu, 31 Jul 2025 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753983883; cv=none; b=cPfVfszHCQzvrkh8jW3JE6BWp9LBbt76g3WNVCMcft4pyfSw3XW/P3nubL5cBBKaPS/Zd1/Co4psTlD02lDyNbecxMm5gfKDKSpQssPvBoXw/jl4tvm9TAAndLiCH6qdW8WwbFfYd6h/n1EacvcjnnZPQUcaTrJBvq4qgOeyTx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753983883; c=relaxed/simple;
	bh=7gGIMGh/3jsRXTtasZYGfVRx3yBOQzuOOtr1gnmQTj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZFbT3kAfj+xxvegrhnP9QlbBUfPX0IWHG7pgVtDHrn8FhCjeIzqnEYpST5UpX6CsN+MVfougrULeVQbtflTjSvdaFF0Hwl4PrpXoK7VjjClNGFReSTAllmrYMrm8AP7awrwq/QgXMbOuMBoj5xuSnH29qXtqA73TIR73Rt/mis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O/trRe2m; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 31 Jul 2025 19:44:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753983879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CFXkuSgdEesnKBUmUYq+AOzOMQourb5B+Iihu7BXbFU=;
	b=O/trRe2mcpJdK0nHudv4Wf7TElW2sMNqaGSkBPg1mtx3v3TQq/AZnnAiRppz2I5RJU6/6i
	OBHJH0psV+t32eDHn1BlTjfAYUtD33OWXhBr9I3Y5Hv03KzpVqs7f9EYe8o2NLydd+seO5
	6Brql/Hp5Zoo5qz9oKvar4zimJauZsk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: "David F." <df7729@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: 6.12 and 6.15 building fixdep / modpost for amd64 instead of 686.
Message-ID: <20250731-attractive-lionfish-of-love-a01cd7@lindesnes>
References: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
 <aItVnueRx5QW2Zds@fjasle.eu>
 <CAGRSmLuAKjg=0P=67_M2d1bfDNwWpyHQAuZZCmY=ZNNC62BW5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xTpnEyJgt6LfhWnA"
Content-Disposition: inline
In-Reply-To: <CAGRSmLuAKjg=0P=67_M2d1bfDNwWpyHQAuZZCmY=ZNNC62BW5Q@mail.gmail.com>
X-Operating-System: Debian GNU/Linux 13.0
X-Migadu-Flow: FLOW_OUT


--xTpnEyJgt6LfhWnA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > > I build the amd64 kernel on a debian based linux 686 version.
> > > Building the 6.6.x kernel, everything was fine (fixdep/modpost were
> > > ELF32), however I jumped to 6.12.x / 6.15.x versions and now the
> > > system is building them as ELF64 which means I can't build my custom
> > > kernel module.
> > >
> > > To make the kernel(s) I use: make bindeb-pkg

On Thu, Jul 31, 2025 at 08:38:59AM -0700, David F. wrote:
> Linux devuan-chimaera 5.10.0-31-686 #1 SMP Debian 5.10.221-1
> (2024-07-14) i686 GNU/Linux
>=20
> It's the one I've been using for a while (Debian Jessy before that), I
> can't do any more upgrades using the built-in upgrade tool because
> whatever happens causes corruption in virtualbox shared folders
> (Windows host).
>=20
> The build is actually:
>=20
> extraversion=3D"EXTRAVERSION=3D-amd64"
> make -j$(nproc) ${extraversion} bindeb-pkg

You have already evaluated to setup a new VM instance with a more=20
up-to-date amd64 system, do you?

Does simple cross-compiling w/o bindeb-pkg work for you?  What is the=20
output of

    make clean
    make V=3D1 scripts/basic/fixdep

?

Kind regards,
Nicolas

--xTpnEyJgt6LfhWnA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmiLq4IACgkQB1IKcBYm
EmnU8g//d2YB+YIbxENbccmy7m3RH88aGGKG7QIKV02mbthgCa+vhjs72+wO/H14
VbIN2rqnJ6TUAFbRZ9WvUXUe5bsi5Ceyb0aZlX6bwJXgSnd4pjSkiEBnoQjzI4Ll
NwknvCog72POLcbHZycyGdwBLx4XSrBL1KFypvvtZNAKtCyzK0juUynw1DLRW2hO
o7RwqLjRPr2IySfe5xhHaMKw0K+ZPsMUrMuodwhkVXEzM2MQ1SmYMeLzzKzvm7Xu
db8OQw01tNw1eOdol8vG+Govp8sOYnBCJAw30CoTZeNdSM5Gp5iuYoFby0LicWLw
DJaC6vPz2ja+eQM4gIvWSZy/BBpbl7yDMm3KFfZJyXVrfoIwPnSgqEzr8hTto2Tu
373lPAV+sX/gfyglQyodn5Gj8G+FycPNVBE1Ob5aiBBPWm8BSnfRNWtB/ymIjfFr
wdErAqRnnnB77GB05WWyOp6keSoBiIUDoqcMim0ecJkzGC1q8BrcwyzsYRfWtjYY
U4rcgxZ00CTS/MA+HDkQFitggtlVkA2D5oTTTSpcp7iQX10MK71avrJtzXQ6qPVO
uCYGxTNHkOtxmwF51HPXnBIUOyykhvyGz0Jpis735DzVAlwYWujNnCKL/y2piq9E
S4ku4JFE4buI98m1CwpDE/2UeUcbv9OQDb4IF4NnDE5rgehksds=
=62ZM
-----END PGP SIGNATURE-----

--xTpnEyJgt6LfhWnA--

