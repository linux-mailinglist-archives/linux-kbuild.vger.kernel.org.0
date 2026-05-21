Return-Path: <linux-kbuild+bounces-13298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIVWJDhMD2rRIwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13298-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 20:17:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 010EC5AAEEA
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 20:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2CFE30F5B15
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 18:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE5C3815D8;
	Thu, 21 May 2026 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBshHZmZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDB51CEADB;
	Thu, 21 May 2026 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779387019; cv=none; b=QtOuQ0QlndTxI3O6t+5Vvcy4NoXXcAt079VMjSNzWVRCxACrz/+SB6A2bpnZT5EQ2XYSg1HlBmVxDY615S4cZgcK0zB5saFO3zrx424X3e+xS/0veB9is0vn2h2viLX181L8FJ9Cj3nJNRg9cNNDznkwh/3XbikY/oSpCEUS8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779387019; c=relaxed/simple;
	bh=IFcxYqgTlpRto9ZnWOz7pV5uynzI+jzkHNYxPxI9sUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP/myv5RdQcgWPtupEGi2AcpaTxJa49qJNMSsfg/GRFRiYCz69A2LPq09bmAnX5dqNELkp/2dVGG4aCsSNjYl88YZYrsCEiAirAcM6AZT+MJ1PK9z6RsPqa7U12rFIZUhAWInN0p9wuvz4tfoC2V3aFWPv41ADNqobFKJ6/aHXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBshHZmZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4C5DB1F000E9;
	Thu, 21 May 2026 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779387017;
	bh=7DokcUkQYWxffrlYX00vg2Zeu4i7RlvhyEfxsS4J+FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nBshHZmZiLEksnOhYvnnj3Lnlc3FT7Pivdpel86TAIfYGqNrfYnLHohUs5MSlMdjn
	 ZKXYOz30u1Znv5aLOTxOi4hmjR9x0K/zbQQPomvw3Zc4wSn8G4TBL+LLXR7oU97fKd
	 hJOE55i1fxKOQx+ueC/AgIkoPNoow8Vu5s7mr/NE8fz2k3e5mZ88Gg6dL//JqZJEC/
	 5UuOJh881pt8rMWEGsZ20FGWyTt3XqAU1LI9UEls36W4LI/drc6W09JW4fPSJFb2hZ
	 cY4szys8QOMLohwemWyR/84QEdIswI+VjrCPjpBwr9CncFaHsWCl4IW4H492c4xI6O
	 jPaZ9Lz59fuvA==
Date: Thu, 21 May 2026 20:09:58 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: add optional warnings for changed input
 values
Message-ID: <ag9KdrSivC1Lp4RO@levanger>
Mail-Followup-To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260521022824.38591-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u0AQIKWnEWNmox87"
Content-Disposition: inline
In-Reply-To: <20260521022824.38591-1-pengpeng@iscas.ac.cn>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13298-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 010EC5AAEEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--u0AQIKWnEWNmox87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 10:28:24AM +0800, Pengpeng Hou wrote:
> When reading .config input, Kconfig stores user-provided values first and
> then resolves the final value after applying dependencies, ranges, and
> other constraints.
>=20
> If the final value differs from the user's input, Kconfig already tracks
> that state internally, but it does not provide any focused diagnostic to
> show which explicit inputs were adjusted. This is particularly confusing
> for requested values that get forced down by unmet dependencies or
> clamped by ranges.
>=20
> Add an opt-in diagnostic controlled by KCONFIG_WARN_CHANGED_INPUT. Emit
> the warnings from conf_write() and conf_write_defconfig() after value
> resolution and through the existing message callback path so the default
> behavior stays unchanged and interactive frontends remain usable.
>=20
> Avoid the conf_message() formatting buffer for this diagnostic so long
> warning lists are not truncated before reaching the callback, and mark
> processed symbols as written before the SYMBOL_WRITE check so duplicate
> menu nodes cannot emit duplicate warnings.
>=20
> Document the new environment variable and add tests for both olddefconfig
> and savedefconfig.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260406233001.1-kconfig-wa=
rn-changed-input-pengpeng@iscas.ac.cn/
> - rename "found" to "changed_input_found" as suggested by Nicolas
> - avoid the conf_message() 4096-byte formatting buffer so long warning
>   lists are not truncated before the callback sees them
> - mark each processed symbol as SYMBOL_WRITTEN before checking
>   SYMBOL_WRITE to avoid duplicate warnings for duplicate menu nodes
> - add duplicate-definition selftest coverage
> - do not carry the Reviewed-by/Tested-by tags because v2 changes warning
>   emission and duplicate suppression
>=20
>  Documentation/kbuild/kconfig.rst              |   5 +
>  scripts/kconfig/confdata.c                    | 107 +++++++++++++++++-
>  .../kconfig/tests/warn_changed_input/Kconfig  |  40 +++++++
>  .../tests/warn_changed_input/__init__.py      |  27 +++++
>  .../kconfig/tests/warn_changed_input/config   |   3 +
>  .../tests/warn_changed_input/expected_config  |   6 +
>  .../warn_changed_input/expected_defconfig     |   1 +
>  .../tests/warn_changed_input/expected_stdout  |   4 +
>  8 files changed, 189 insertions(+), 4 deletions(-)
>  create mode 100644 scripts/kconfig/tests/warn_changed_input/Kconfig
>  create mode 100644 scripts/kconfig/tests/warn_changed_input/__init__.py
>  create mode 100644 scripts/kconfig/tests/warn_changed_input/config
>  create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_con=
fig
>  create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_def=
config
>  create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_std=
out
>=20

Thanks a lot!

Tested-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>

--u0AQIKWnEWNmox87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmoPSm4ACgkQB1IKcBYm
EmnAfxAAypsh86H6bp6AlgVjU3kcaVQ8CALAZ/jajg5Xie9qYLnwJLSwj8OnkkJB
EDpMjePcfJtdJIe8eE/b3P4KIfEerSts5vev6wLtMrwTdhMrfjg30TE2ftEmBRXL
Hgb3KFbU5WABzwAwW3FODJkcrBq8bx4S1nbmhPyN13+GJZpky9ERTL0ZzIcb5zqc
+EWdhMyqkVfwJchPsiwTBkPfQIFxxsimU4J9Cs8wQHuechMuWgLgzxl/RbCJK+DL
svzOgcX1Ofl3iIWeTBWVg4aq3jdN/lkJsv2z7wsd4ijDSbH2EA8RI/q0aLfEQVRY
3/ps+X8llp8yLaXwv6PgRckkyQra0ugM4R0Z4+T7LE7GMBrjR3vSeEqWYdbpo9gf
k9IPT1wyVkn67hW7ANU/nNujHeSyBAfu2eJd8TI+MkSLUhIDNYpTnVdY0RUHoL8w
v7W/1xjMwAv80zHGFzuMt1ilFZ6TQ9LeCoIfWgckd2NrwlQLTdTQ+SG5HHzIyB49
jCQICF28oWVHOKHwKR5rtXlfdfu4UXyhlfV3MUPWHU9CXRi9T7EEPaJ+lDV0nbTg
aXKs9intuGfHCrSpEspVK8tArhIUjzSrmd+YGKXpiodEyMjlWh1Pqhu9EAB880os
GxRtkvKPvJ4Zl8sR08knNp6TdkxGRG38zoD5Wzg4vDBsPY4vmkA=
=H1uv
-----END PGP SIGNATURE-----

--u0AQIKWnEWNmox87--

