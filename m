Return-Path: <linux-kbuild+bounces-2011-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8BD8FD700
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 22:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64E0D1F21930
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 20:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9193015533F;
	Wed,  5 Jun 2024 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="dcurUYUe";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mwhlop8g";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="sitLeI8N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5680B156F49
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717617856; cv=none; b=jU4K+/cPOvjem/RzY6fpF8uMY4lj4oyA0l//TdFplx1cMkMaiFKjSdz9Pbd8g8B+q/7GktTJ7SUL5ATgCBG5ar3OYDw+q5bHqkuYM/kpl1J59xRug/s9e/f2yPw6rQuuEq6epCf38Ycp1A7tffA0QtjP/ffVlHK7wwIxrcqAf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717617856; c=relaxed/simple;
	bh=OMXHz65ianF/zdL9RSgS5h+YFr4aVzOgHGtndZuWElk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laqFNxsZmckdcsmshtL2sNd6w5vXyOpRcnHy3Aopoo+9EgD53UxCNMmOuqa5Ik05rAEt2RulLYB0ZerXxFrwPqa84J1GDoaW5rZAEupCObTreqGFeUuep3dto1IMRQjsqt3ikSsHWbf/g+7g9iKtshz2BsJAmwT3Jn1Wdhc7QH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=dcurUYUe reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mwhlop8g; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=sitLeI8N; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1717618748; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=hI8PYfUa34J/pUrQBdmNc4tSBP3E/+lFN4ku65+o7DE=; b=dcurUYUeup3hDlCGckF6YD+XZU
	rfdc2HNTTb6E7PcKxOr74QKuxHsak57KNFCkYFNV2ELkLw5XOkFbDyQJ3MQoYpdtyOWRSwPkw75rM
	hBjEY7joe5G9dZEfbXTBxpjZhWqfuZetrLHl1ghD3rZTe4F35+oFpYnV8GsW2whjwQOsuT8xZcVcN
	mOPfQZhe6zTe6tVwZDObMpGQ8VDjpCRew4O2366Ye3gLfyS1z4Fmet8xDbt3aRol8QfIy4GpJw+Mu
	vwRHTtSK/bSHgBQHC/Um3Ek4L9L5IVsqdk6GwhVrCpyhcaNaAJOSeaXtIFPHxELT+2Qzn2Bz2qGAu
	cR+ra4Yw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1717617848; h=from : subject :
 to : message-id : date;
 bh=hI8PYfUa34J/pUrQBdmNc4tSBP3E/+lFN4ku65+o7DE=;
 b=mwhlop8ghNoJeGr8afPj0oCzDF3bpISazWvPci9QxSqi4+BC0w0Gjcc4D6W6SC5rDna/j
 qZRaaqGcwn9BB3BniGkoMw4UvDx93OgoU9Sh49q8XFUeN8tAb0r137UpbvZezyQK6A1j3rz
 biLanGK/9D3ZUmx2OOGgEVMOD32Ie0fhb5YKXaSNhMIm6FQNUeSG83OMD9KyiMtn8oyTxlu
 VHPPPg/oNub8JNFhgJlYEqT/BSBi747tUXmtyzqukV9TBurpUi/DIFBqO+qB5zUQbpBI2T6
 qvseSsN5LhDNAXq8EXkTdQLjrKpx1LaoUhfdT6za37rDVb4kt4cglf7ZS2MA==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sEwql-TRjzyF-19; Wed, 05 Jun 2024 20:03:11 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sEwqi-FnQW0hPu2PL-mjc7; Wed, 05 Jun 2024 20:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1717617784; bh=OMXHz65ianF/zdL9RSgS5h+YFr4aVzOgHGtndZuWElk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sitLeI8N6RiEuPgDGrS1wIFgN3ab4GJGMvCzN0bRnEWu/qooQVl+is3XNC8+544w9
 5+Pgk3ijaTsqrxar6+8VG2Q6IsbSRglw5SXWlE0LzxHWNRtGDr3OvIZcdf3ju5g5k5
 SNvGbl7W8wpFswZNEfj7hhE0ccUQrJSQeByGeNNk=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id B6BD2449F3; Wed,  5 Jun 2024 22:03:03 +0200 (CEST)
Date: Wed, 5 Jun 2024 22:03:03 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] kconfig: remove tristate choice support
Message-ID: <ZmDEd9KpCvnLBobT@fjasle.eu>
References: <20240602125416.976336-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z5IY1njxa83vktCR"
Content-Disposition: inline
In-Reply-To: <20240602125416.976336-1-masahiroy@kernel.org>
X-Smtpcorp-Track: ceBKo9f1s52W.KQQt0sKhFodj.q1BvjwMgBfl
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sjF3jDkxxc
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>


--z5IY1njxa83vktCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2024 at 09:54:14PM +0900 Masahiro Yamada wrote:
> I previously submitted a fix for a bug in the choice feature [1], where
> I mentioned, "Another (much cleaner) approach would be to remove the
> tristate choice support entirely".
>=20
> There are more issues in the tristate choice feature. For example, you
> can observe a couple of bugs in the following test code.
>=20
> [Test Code]
>=20
>     config MODULES
>             def_bool y
>             modules
>=20
>     choice
>             prompt "tristate choice"
>             default A
>=20
>     config A
>             tristate "A"
>=20
>     config B
>             tristate "B"
>=20
>     endchoice
>=20
> [Bug 1] the 'default' property is not correctly processed
>=20
> 'make alldefconfig' produces:
>=20
>     CONFIG_MODULES=3Dy
>     # CONFIG_A is not set
>     # CONFIG_B is not set
>=20
> However, the correct output should be:
>=20
>     CONFIG_MODULES=3Dy
>     CONFIG_A=3Dy
>     # CONFIG_B is not set
>=20
> The unit test file, scripts/kconfig/tests/choice/alldef_expected_config,
> is wrong as well.
>=20
> [Bug 2] choice members never get 'y' with randconfig
>=20
> For the test code above, the following combinations are possible:
>=20
>                A    B
>         (1)    y    n
>         (2)    n    y
>         (3)    m    m
>         (4)    m    n
>         (5)    n    m
>         (6)    n    n
>=20
> 'make randconfig' never produces (1) or (2).
>=20
> These bugs are fixable, but a more critical problem is the lack of a
> sensible syntax to specify the default for the tristate choice.
> The default for the choice must be one of the choice members, which
> cannot specify any of the patterns (3) through (6) above.
>=20
> In addition, I have never seen it being used in a useful way.
>=20
> The following commits removed unnecessary use of tristate choices:
>=20
>  - df8df5e4bc37 ("usb: get rid of 'choice' for legacy gadget drivers")
>  - bfb57ef0544a ("rapidio: remove choice for enumeration")
>=20
> This commit removes the tristate choice support entirely, which allows
> me to delete a lot of code, making further refactoring easier.
>=20
> This includes the revert of commit fa64e5f6a35e ("kconfig/symbol.c:
> handle choice_values that depend on 'm' symbols"). It was suspicious
> because it did not address the root cause but introduced inconsistency
> in visibility between choice members and other symbols.
>=20
> [1]: https://lore.kernel.org/linux-kbuild/20240427104231.2728905-1-masahi=
roy@kernel.org/T/#m0a1bb6992581462ceca861b409bb33cb8fd7dbae
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  Documentation/kbuild/kconfig-language.rst     | 11 +---
>  scripts/kconfig/conf.c                        | 56 ++-----------------
>  scripts/kconfig/confdata.c                    | 17 +-----
>  scripts/kconfig/gconf.c                       |  5 +-
>  scripts/kconfig/mconf.c                       | 28 +++-------
>  scripts/kconfig/menu.c                        | 27 ---------
>  scripts/kconfig/nconf.c                       | 28 ++--------
>  scripts/kconfig/parser.y                      | 23 +++++---
>  scripts/kconfig/qconf.cc                      |  2 +-
>  scripts/kconfig/symbol.c                      | 24 +-------
>  scripts/kconfig/tests/choice/Kconfig          | 17 ------
>  scripts/kconfig/tests/choice/__init__.py      | 10 ----
>  .../tests/choice/alldef_expected_config       |  3 -
>  .../tests/choice/allmod_expected_config       |  3 -
>  .../tests/choice/allno_expected_config        |  3 -
>  .../tests/choice/allyes_expected_config       |  3 -
>  .../tests/choice/oldask0_expected_stdout      |  4 --
>  scripts/kconfig/tests/choice/oldask1_config   |  1 -
>  .../tests/choice/oldask1_expected_stdout      |  9 ---
>  .../tests/choice_value_with_m_dep/Kconfig     | 21 -------
>  .../tests/choice_value_with_m_dep/__init__.py | 16 ------
>  .../tests/choice_value_with_m_dep/config      |  2 -
>  .../choice_value_with_m_dep/expected_config   |  3 -
>  .../choice_value_with_m_dep/expected_stdout   |  4 --
>  scripts/kconfig/tests/inter_choice/Kconfig    | 25 ---------
>  .../kconfig/tests/inter_choice/__init__.py    | 15 -----
>  scripts/kconfig/tests/inter_choice/defconfig  |  1 -
>  .../tests/inter_choice/expected_config        |  4 --
>  28 files changed, 42 insertions(+), 323 deletions(-)
>  delete mode 100644 scripts/kconfig/tests/choice/oldask1_config
>  delete mode 100644 scripts/kconfig/tests/choice/oldask1_expected_stdout
>  delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
>  delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/__init_=
_.py
>  delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/config
>  delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/expecte=
d_config
>  delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/expecte=
d_stdout
>  delete mode 100644 scripts/kconfig/tests/inter_choice/Kconfig
>  delete mode 100644 scripts/kconfig/tests/inter_choice/__init__.py
>  delete mode 100644 scripts/kconfig/tests/inter_choice/defconfig
>  delete mode 100644 scripts/kconfig/tests/inter_choice/expected_config
>=20
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kb=
uild/kconfig-language.rst
> index 555c2f839969..dc50b5b12577 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -399,16 +399,9 @@ choices::
>  	"endchoice"
> =20
>  This defines a choice group and accepts any of the above attributes as
> -options. A choice can only be of type bool or tristate.  If no type is
> -specified for a choice, its type will be determined by the type of
> -the first choice element in the group or remain unknown if none of the
> -choice elements have a type specified, as well.
> +options.
> =20
> -While a boolean choice only allows a single config entry to be
> -selected, a tristate choice also allows any number of config entries
> -to be set to 'm'. This can be used if multiple drivers for a single
> -hardware exists and only a single driver can be compiled/loaded into
> -the kernel, but all drivers can be compiled as modules.
> +A choice only allows a single config entry to be selected.

oh, I wasn't aware of that multi-selectable 'm' feature.  I think it's real=
ly
good to get rid of this, thanks!


Patch looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>



Kind regards,
Nicolas


--z5IY1njxa83vktCR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmZgxHMACgkQB1IKcBYm
EmndVQ/+I/hxjhcRiNRPAJ9qRVyn/3ZBwjUOjOMTPNkGV4aLvtPtnMRB9u6WpyoJ
Rk6URdeJXpDIP8OpqexJsXCxR0gaPL2ejHaHU/TbuKab7c+SKn6/xl9FWqUdWRxu
H9pZ76HLFddKIjGag9GhwyKABeyCS34KxPRiBCFsnjIpyA5fu3DHZhAgOn1CeNWM
4bFAKsq6RjyCqQt7oEEnMTnIfy6yDLuUi9sCByHLAN/CN4ABea2jElTH1gANuglD
u78qOY/iDBY/crm7xJsVQ3W9/yL/ekOBfsPyydwsG0HnhpxaMCFlQ9shFoJsHM2o
CqyaX84nqOFizbP4UHDstJUtiXlnLJIn9P91pjZ7AIrvS24KX6avFSihD5kTwjlr
5YeTynEpzae0OPCIW6SoGFBBTrP35FJj7MeccjTSndnAKKPAN524sZHvElbEGr55
1xQeRioQb1oqIGP/UvXMwReCD6Bev+8JmpbZwxRgrgb1G7VguFeJwbmIPef7ctwi
1yhx+wpntv6bc9cIc4MwaQLuAsK2HPT+KPl+PuoH/iKFv+kPI+buM75NXJuep8x1
kUsCPvDvYeuITGfsV7ICF/qWQxLtI0NsWVvMBDwqBzLf3GwQxwyhy5a+m51V5bet
zVf4QZbZZGTTgWhxyIxLHOU9MbUdHfKuQrZTjiBwyPzen5Ii0YE=
=cH/K
-----END PGP SIGNATURE-----

--z5IY1njxa83vktCR--

