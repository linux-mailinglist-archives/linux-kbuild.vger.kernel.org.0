Return-Path: <linux-kbuild+bounces-2012-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5EF8FD776
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 22:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D6B7285E9A
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 20:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647DA154445;
	Wed,  5 Jun 2024 20:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="xhewSclk";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="LROdDy7A";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="W7b8z39V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599ED15099F
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717619168; cv=none; b=jzA6YWxshkqihWGw3RkyToV3F4aEHNvflMD5tSpVg4zy7hCDRrSsEbVfM+9BCkZKhAtWM19xBsTl2lD/hiNxGqVEToJ6kHLzEzKV8G0jsWjJIrHp9Rzsjv5eLojMviVdFInII1+iA5UNkjHfjzbuHuvxOdCeANsVZCtuGxY7dy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717619168; c=relaxed/simple;
	bh=+Vz9TeN9BeN8ZjnlkW6G+oEKYEN2ezcWaR0jJUFXCI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKMxOR6vZ6LgNH3Xff139mQRhQ1448yRBGma51cGb4pd+z8V8x+dCwBgDIW4msL6sHOIYrRgCdvjDfanpKUregzOTGO1z3gy1sp4xlnj7nvIxP2cGim2SqP6guaeV6is6B2lukp7OKizm9be+Xtv/ooZI34lVrZYqJ+c1kbajsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=xhewSclk reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=LROdDy7A; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=W7b8z39V; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1717620060; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=O06RkS7enRps0vHi5srkPVELhghQko9mdCYiK9u37wA=; b=xhewSclk6tvKfiS+q2T0RnOKNM
	7oX8P9/fOvNAhWFz+Ug7hW3/Eok9CjVhGrsVRzMLsRol954cGUa8g8Iw/OAXCjNFkOVTHcZJpAumm
	pkJV8O4nQ4ILqts+omasf9gfpU0TfVAsMoito7cDViJNrqO4ZY/4d3TLQ+YanjtcYNE+doEK9QxmD
	uPKLUNnPkUwqJgcETd23dscxqO7rnfvXyIAiAYSXuj2w2iMnW2h4x/lgD5uGSxHHbNi9HWxwaHOff
	ioScbpaXbdmqvc3QeEtT/zRcagjVluATCjJRnG+QDokkOsxFlv1bs/xEMxEHNeX15Q0VTMKDkc91C
	mAShgaxg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1717619160; h=from : subject :
 to : message-id : date;
 bh=O06RkS7enRps0vHi5srkPVELhghQko9mdCYiK9u37wA=;
 b=LROdDy7AoAwS9wXYethDBJOLJRMDzlK1kNmiE9TiIDHT72QZedkTDMd1yarSwlvLwrKy3
 sj6iBcmqBiVvFFmCHzpHzJnlq5rfeODZqVzmGuiaccbreszUnyiP62Rdxec2yNp/BLL3r4p
 UWyuQKIdy5ksz3Kd5vo6mrY7VYjfDFBS/MpSFIDEw0b1jOhA0bSOa92XonT7mrDLX+Zp7Mm
 NfYhSeCQDmTn0zqdntLbE9AvJX4b6haH7qv+NHSFIDqmgQYR+C51N2on491wo+golSt9GGI
 3ZpQXxUYCKfSl26yyNhuC1H4B+g1LD6nFcJTvjOMSAsvQX49diL6ulzXjM7w==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sExCd-TRk0J4-57; Wed, 05 Jun 2024 20:25:47 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sExCc-4o5NDgriTI7-mSQR; Wed, 05 Jun 2024 20:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1717619145; bh=+Vz9TeN9BeN8ZjnlkW6G+oEKYEN2ezcWaR0jJUFXCI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W7b8z39VARQ29g3bGhWmwvAxsg5hTVRth9KT+EjdBpJDdch0FyEosoSEszo7VjHpc
 BsENU3KQuLuQC5mHho7BUEklxOa83OP88QYkoIUDlOA/qBJEMO+W7cfNfEyveCmb1M
 zZlYsy4leHn9P3wv0mFx4Z/JpnwWPhTWt7GjOEdg=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 25301449F3; Wed,  5 Jun 2024 22:25:45 +0200 (CEST)
Date: Wed, 5 Jun 2024 22:25:45 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] kconfig: refactor conf_set_all_new_symbols() to
 reduce indentation level
Message-ID: <ZmDJya3X1rwtHteD@fjasle.eu>
References: <20240602125416.976336-1-masahiroy@kernel.org>
 <20240602125416.976336-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mlfnEBJWXlybmKlf"
Content-Disposition: inline
In-Reply-To: <20240602125416.976336-2-masahiroy@kernel.org>
X-Smtpcorp-Track: KwayAABq89gT.qSALFrBoNe_T.EaIKYgsYPoT
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sP1Qs_fKIH
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>


--mlfnEBJWXlybmKlf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2024 at 09:54:15PM +0900 Masahiro Yamada wrote:
> The outer switch statement can be avoided by continue'ing earlier the
> loop when the symbol type is neither S_BOOLEAN nor S_TRISTATE.
>=20
> Remove it to reduce the indentation level by one. In addition, avoid
> the repetition of sym->def[S_DEF_USER].tri.
>=20
> No functional change intended.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  scripts/kconfig/conf.c | 61 +++++++++++++++++++++---------------------
>  1 file changed, 30 insertions(+), 31 deletions(-)
>=20
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 9a20e9e9bdad..cf8193fc00fc 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -218,43 +218,42 @@ static bool conf_set_all_new_symbols(enum conf_def_=
mode mode)
>  	}
> =20
>  	for_all_symbols(sym) {
> -		if (sym_has_value(sym) || sym->flags & SYMBOL_VALID)
> +		tristate val;
> +
> +		if (sym_has_value(sym) || sym->flags & SYMBOL_VALID ||
> +		    (sym->type !=3D S_BOOLEAN && sym->type !=3D S_TRISTATE))
>  			continue;
> -		switch (sym_get_type(sym)) {
> -		case S_BOOLEAN:
> -		case S_TRISTATE:
> -			has_changed =3D true;
> -			switch (mode) {
> -			case def_yes:
> -				sym->def[S_DEF_USER].tri =3D yes;
> -				break;
> -			case def_mod:
> -				sym->def[S_DEF_USER].tri =3D mod;
> -				break;
> -			case def_no:
> -				sym->def[S_DEF_USER].tri =3D no;
> -				break;
> -			case def_random:
> -				sym->def[S_DEF_USER].tri =3D no;
> -				cnt =3D rand() % 100;
> -				if (sym->type =3D=3D S_TRISTATE) {
> -					if (cnt < pty)
> -						sym->def[S_DEF_USER].tri =3D yes;
> -					else if (cnt < pty + ptm)
> -						sym->def[S_DEF_USER].tri =3D mod;
> -				} else if (cnt < pby)
> -					sym->def[S_DEF_USER].tri =3D yes;
> -				break;
> -			default:
> -				continue;
> +
> +		has_changed =3D true;
> +		switch (mode) {
> +		case def_yes:
> +			val =3D yes;
> +			break;
> +		case def_mod:
> +			val =3D mod;
> +			break;
> +		case def_no:
> +			val =3D no;
> +			break;
> +		case def_random:
> +			val =3D no;
> +			cnt =3D rand() % 100;
> +			if (sym->type =3D=3D S_TRISTATE) {
> +				if (cnt < pty)
> +					val =3D yes;
> +				else if (cnt < pty + ptm)
> +					val =3D mod;
> +			} else if (cnt < pby) {
> +				val =3D yes;
>  			}
> -			if (!(sym_is_choice(sym) && mode =3D=3D def_random))
> -				sym->flags |=3D SYMBOL_DEF_USER;
>  			break;
>  		default:
> -			break;
> +			continue;
>  		}
> +		sym->def[S_DEF_USER].tri =3D val;
> =20
> +		if (!(sym_is_choice(sym) && mode =3D=3D def_random))
> +			sym->flags |=3D SYMBOL_DEF_USER;
>  	}
> =20
>  	sym_clear_all_valid();
> --=20
> 2.40.1
>=20
>=20

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>



--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--mlfnEBJWXlybmKlf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmZgycQACgkQB1IKcBYm
EmmNpw//UNaTItKxl1xfxquC6HZL/5u/yWCjDc7lS5gD6KLhf0Jma2mncjEY3j5G
QwYpACT+9SYsIBv9ZIoEjWhrQ+uZSx8ZEzPaWU8BrgZ6bMpATrgFIShAG7mNaQPy
GAJR84elQbQ7C0DUJ+kQTObhNzhnZ9zd5mqdGq7htsVE63u4pdtU8stJntOuX3dV
6jcth+0yf/jnssH+JOvmg7j5uOeZUytOFWMgutVSg2g4yQw+BSBLzbSnfSt5/2Ik
Eyorsn4RutCkTzTZR6aXCkYzAaouJAZmmVoyKTwDyVsy8TcMSgDacPoJ9G2LalIs
tNUaLN2e/+g8mItcu5bzeT0WgoqydSAAgtDWldskx3QsbGUsNQSn8XW+a/tFiXvg
de5jJeC8Zh18tJGVJfFTxDzl09RZrXS2cCNaIxkeFUwXYJs2FJh1IWL9vuGPOhDb
o0wqLX1LdMBwGncV4Lq167N7P7Dz6XFVwF4lXTRhGgdBjfKKlSNrQGMhx9QmpURH
mBIy+Ej8AGvIfoRgjT8gY3MbHGNSQpTt1XAZig0/kJmD6RIwMhco92kp3THJBAm9
Ls9DGB2ez+oItAK+poBkqBw/j/wBtKGoJewVUOZ7j71AmoZNhS0vs7DU/c2h87Y6
RXfS+e/wqObDGq3egiSz/Z2yxvzfmo1vichnE8zQ2ciGtC1xoKY=
=qZNG
-----END PGP SIGNATURE-----

--mlfnEBJWXlybmKlf--

