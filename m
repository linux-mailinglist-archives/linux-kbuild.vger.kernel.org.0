Return-Path: <linux-kbuild+bounces-9878-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE5C8BE9D
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 21:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1525F4E8198
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 20:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909D633F8B7;
	Wed, 26 Nov 2025 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDMgqPXY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA234321F;
	Wed, 26 Nov 2025 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190161; cv=none; b=DM8ZE7gOlbZtGrwQ5S1nC/srt8kMibhI3qy5CA/afm4ubAL+lN7lZzYMr5dctTFkSQZoGEpmu9mOaQGiAO9Lufxpoo26gHGrp+5wU+Q8ntSz/sq5cyINbNA0SvUONf+pCiGnC/fmlH0xoY8LqlyRhgQ1EMKwW7ISXpB65Qk8BO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190161; c=relaxed/simple;
	bh=zX3X98eW4so3HINCwpv3PaapQBnFQ3CAJqrkDiQqEMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/eu8R/Esl4SrQ6xQgW2y/wOtSxh+NI5QsnURM2xpmoeOt2YUlIvXu2MiZp9UYI530W9R3N8+FXWD8C94TE1jbTGbfYsIg5muNSHAAh7iBpWEOmYwEdfX6JmgYeHrg3gd6ImmWaZvMP+u04OppPGYzYt6FYo2QFdCJcOyI6THMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDMgqPXY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B627DC113D0;
	Wed, 26 Nov 2025 20:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764190161;
	bh=zX3X98eW4so3HINCwpv3PaapQBnFQ3CAJqrkDiQqEMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDMgqPXYUBjD/HrRd0sBrEzGdzDZDXW91qp5Ed6/tpokmCPQXvkCVec4VvIfSee/S
	 KoeJQXZ9k/zNajxDFqbpctTUMlNJFEviUr53JjCP9mG2SKHbiYCc7cQCf1UGHMm/yS
	 wj9KcLnjelK55pDEAXY21iFYn1A6wkDVxCZDCUZrSLZ8W/Je0yLkw34xPQie/yUQw4
	 Ep+YFT14O9Uzp56bvnGNhi7jMQd89CZinwjQXHJ0BR9ue0lNe9hP5DLB7rUR460fks
	 lTmdHil6hn56zgu/R7zalyIgs+T47uU5D62Lzp2D99FB4yYs/e+b16K2z7/aPoPZB8
	 qm/fZ8RZZoe/A==
Date: Wed, 26 Nov 2025 21:48:59 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 2/2] kbuild: add target to build a cpio containing
 modules
Message-ID: <aSdnuxCNjwAma4_X@derry.ads.avm.de>
References: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
 <20251125-cpio-modules-pkg-v2-2-aa8277d89682@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k2d4UkmjES/G39Gg"
Content-Disposition: inline
In-Reply-To: <20251125-cpio-modules-pkg-v2-2-aa8277d89682@pengutronix.de>


--k2d4UkmjES/G39Gg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 02:18:20PM +0100, Ahmad Fatoum wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
>=20
> Add a new package target to build a cpio archive containing the kernel
> modules. This is particularly useful to supplement an existing initramfs
> with the kernel modules so that the root filesystem can be started with
> all needed kernel modules without modifying it.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Simon Glass <sjg@chromium.org>
> Co-developed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  scripts/Makefile.package | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 74bcb9e7f7a4516473481468a0fcf700c3bead33..83bfcf7cb09fd2d69b97e0c19=
a2b99c728835e8d 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -189,6 +189,25 @@ tar-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar
>  tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
>  	@:
> =20
> +# modules-cpio-pkg - generate an initramfs with the modules
> +# ----------------------------------------------------------------------=
-----
> +
> +.tmp_modules_cpio: FORCE
> +	$(Q)$(MAKE) -f $(srctree)/Makefile
> +	$(Q)rm -rf $@
> +	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=3D$@ modules_install

Do you know why '-f $(srctree)/Makefile' is necessary here?  As this
and the make call two lines above call common top-level targets, I do
not see the reason for explicitly adding the Makefile path.  Am I
missing something; or have you observed problems without '-f'?

> +
> +quiet_cmd_cpio =3D CPIO    $@
> +      cmd_cpio =3D $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@=
 $<
> +
> +modules-$(KERNELRELEASE)-$(ARCH).cpio: .tmp_modules_cpio
> +	$(Q)$(MAKE) $(build)=3Dusr usr/gen_init_cpio
> +	$(call cmd,cpio)

Removing the '$(MAKE) $(build)=3Dusr usr/gen_init_cpio' line and adding


PHONY +=3D usr_gen_init_cpio
usr_gen_init_cpio: scripts_basic
	$(Q)$(MAKE) $(build)=3Dusr usr/gen_init_cpio

modules-cpio-pkg: usr_gen_init_cpio


to top-level Makefile could be used to allow make to compile
gen_init_cpio in parallel instead of sequential.  And it simplifies a
possible move of gen_init_cpio from usr/ to scripts/, as Nathan
suggested.

What do you think?  (Top-level Makefile addition should probably better
be integrated into patch 1.)  I can also send this as a follow-up patch
after merging your patches.


Nevertheless,
Tested-by: Nicolas Schier <nsc@kernel.org>

If there are no further remarks, I am going to merge the patch set
before the weekend.

Thanks and kind regards,
Nicolas

--k2d4UkmjES/G39Gg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmknZ7cACgkQB1IKcBYm
EmlUfBAA5pDBUFmSTlvwQGnfdBo3AIGp5rvNoCPJsJ/hSZgMW4cav1ckatPJBalB
+J091VkfAyGzWAOZpI0Ze/fm6xt8QXCkZ4xCi5f7xfySkmB5cEg60WIG5q/Q5d4V
qMMdRmd4QCVYB+mIZbLMS3SWnK7qRnn9dnpQTspXTRmf+gdXgsSyhYsdKmPNABMj
kx9AY/R7onNPhX2D4vY1EHi51lz7aXJm4kCUUe0ibho2kdwhqZdHY2q1+4CvEU3q
P2FZYXzVj6BjafIAhQ7faK9zFYOzIkinRjIBtDPbXOIo3VB+VcXCNr34Wp6ApAuM
xXvl/rXH+JEsUjbp+LwnsSaYew0XcXGXpO+B/3TQaldy1sza6/16xkXH8+tkZavJ
X5gTUKktFp/aJgRZLIrKDPXRE49GrR4O9vh8sQyrXydXh1aWOOZSpoprbolf1+yw
uqg1RGlprBxpw0c2x/jZCQ3VvyUdLs83/gTeTYy9EJN4X+n1mbEwVd6a61NjbnmD
gCUET8eS+2uw3WOz1ckYvyCzfyNggkmgtbnYogI/Vaa2wiDtBRSgeTyfvdCkQvUJ
J78YQHmVPcOpycfvdSXj15TcACUkRvjABRadxhuSqs95FSlsvfV6A5a/yVQbWdyG
40nD6us2o/tZxG7o/QUHjORMJedQHcJu/woGDWXKABNSfFIbLDE=
=qu2e
-----END PGP SIGNATURE-----

--k2d4UkmjES/G39Gg--

