Return-Path: <linux-kbuild+bounces-3617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E079697BF39
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 18:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C0A281D7F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 16:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF1D1BBBEA;
	Wed, 18 Sep 2024 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="ccF2I4h/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5A01487F1;
	Wed, 18 Sep 2024 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726677885; cv=none; b=Aa9VKVS6RYwR4t2IgKHwemMaZFXHvgxdzm+7icM16OxDaETMmOqlt82RgaMnkph/geFD4PN36lgsd+hwSRbZWwdlQFxqCxQcEvPiS1w1Jm7QbBVecB40nXlfi2a/jrkRX1sH2KzXQck3mUcawGr17Sx53q8cYJCzY2k2edwjKfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726677885; c=relaxed/simple;
	bh=9/VnDkvtrLa7nWwA+GJMS6WzKe6zhrMoxkTBhN3uVDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCTiYpSRQj7AjG7Wr+tiU+QM+hScAMuf6Ymqcq3Wof6/vYBWbM6XsYBX1lWOlCrUJ4oBNmYneH5q08/uC46/Tc/e0BP5EaLHKlro2i5xuzNTmT99ZEUJhHMEHUoIimxFTshS4AXzp4ZEWndRNdDX/7ZcIYYpfz0ASuZh4O1LRe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=ccF2I4h/; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726677879; bh=9/VnDkvtrLa7nWwA+GJMS6WzKe6zhrMoxkTBhN3uVDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccF2I4h/pj2V2mfpLWn1wn4ED/Cf/pDTEHtIWz7ufMwGMx69x++DcfG2BuEtKvbf7
	 zh3MRScPDJab676rrVCoIYZSl6RXiFUOy8VdB9D45wt8+eUKnj93/iCWOwCQmk/HUp
	 EydzJBCQes47GM/q6/TsJH5A99s8rFuS2KsJ0H5k=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 18 Sep 2024 18:44:39 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 50EBD807D7;
	Wed, 18 Sep 2024 18:44:39 +0200 (CEST)
Date: Wed, 18 Sep 2024 18:44:38 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 05/23] kbuild: doc: describe the -C option precisely for
 external module builds
Message-ID: <ZusDdv3iCK1MbWDq@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-6-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9eJBiiMknvqp2VUc"
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-6-masahiroy@kernel.org>
X-purgate-ID: 149429::1726677879-A8EC52FF-E8EE556B/0/0
X-purgate-type: clean
X-purgate-size: 2828
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean


--9eJBiiMknvqp2VUc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 11:16:33PM +0900, Masahiro Yamada wrote:
> Building external modules is typically done using this command:
>=20
>   $ make -C <KERNEL_DIR> M=3D<EXTMOD_DIR>
>=20
> Here, <KERNEL_DIR> refers to the output directory where the kernel was
> built, not the kernel source directory.
>=20
> When the kernel is built in-tree, there is no ambiguity, as the output
> directory and the source directory are the same.
>=20
> If the kernel was built in a separate build directory, <KERNEL_DIR>
> should be the kernel output directory. Otherwise, Kbuild cannot locate
> necessary build artifacts such as the .config file, etc. This has been
> the method for building external modules based on the kernel compiled in
> a separate directory for over 20 years. [1]
>=20
> If you pass the kernel source directory to the -C option, you must also
> specify the kernel build directory using the O=3D option. This approach
> works as well, though it results in a slightly longer command:
>=20
>   $ make -C <KERNEL_SOURCE_DIR> O=3D<KERNEL_BUILD_DIR> M=3D<EXTMOD_DIR>
>=20
> Some people mistakenly believe that O=3D should point to a separate output
> directory for external modules when used together with M=3D. This commit
> adds more clarification to Documentation/kbuild/kbuild.rst.
>=20
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/=
commit/?id=3De321b2ec2eb2993b3d0116e5163c78ad923e3c54
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  Documentation/kbuild/kbuild.rst  | 5 +++++
>  Documentation/kbuild/modules.rst | 9 ++++++---
>  2 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Nicolas Schier <n.schier@avm.de>

--9eJBiiMknvqp2VUc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmbrA3UACgkQiMa8nIia
bbiRrw//QspnPyl+EcEm+TM4mtr398AHoExac7pNOmEZ/7hcPwZAIbFd1wr3XnuE
7mgW/Q2MnHeQCqskIkjwIxJEKymj6HcU1ind0SNGmUgj+1+s+3OeFXyv88GGUJ+J
x267CPjBKVfvrV5yLA5xg9FZlcNLs8SxqmE4JHP2sjvJ5817b+OSGurGDJjdY5on
lcjqXizlRw1L84jSVxU8sh/3FDuMu584vgf+PxD+OuSc737CjINk9YxIuMMFCuIG
DAV7zoe8PXsFlQt25+0jEYLqr46aJLcVDWfvIsCvruTiBQfG6ENhzhvoLZqoegHI
4FMQHxM6SjWyH7EwgMfA3cq6Ak8O9dFj3pIaRvlFuCDjFvpu/MokwguGuim3OTf1
czU4xEyYyIgr7zLEpCTBNvcUAGpbK9d7QDLOi9LjJTB9kvsSCnTFkP88QlGpnuw3
IpUUmZRa5rnAWteSwXQsdDFlViwg+7XpiZ/AmTWWsvh6MMi/cvkt2exaxVIudssG
yra2p1UIsdrZeowah0i26uiWkwoO/GvgS876d4ZFNPMsoLJBfdGxup3Wx/aOcdzW
1d/ihV4ZinUjoZs+CVxguGV29wcbcSgqlTfrJhoM2HcksmBqcgONmzutuxw6gVGU
unE4Zu2tk1iZVgs4/5zZCgcpNWWQ/c6DXxcZn/zLs5RHi48PB8c=
=3FZj
-----END PGP SIGNATURE-----

--9eJBiiMknvqp2VUc--

