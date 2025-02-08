Return-Path: <linux-kbuild+bounces-5675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A563A2D55C
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 10:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C96167F8B
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 09:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2171AF0A4;
	Sat,  8 Feb 2025 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="NzWSPYoo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7D1ACEBE;
	Sat,  8 Feb 2025 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739007532; cv=none; b=a5ud7DJT33CN8rVUTFR9uBS1Y2E3KVy9FTNkcRud+bygqX1xpheqoIpD70kZbhElk4Zcpg3zCEv3Oux56hp9xiWPEwUWe36Ka364gmIDCjxcS+gHPvoJFQxb5gthGgVNDfrmDmFwYETnd1bZijit4r7TM5JASoSFKlK3dqpzIwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739007532; c=relaxed/simple;
	bh=OtvcqXUla/K8UNY+nriLDUD2uU8EfjQ5a9s0uTUAKyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ie84hTinKt2yBJPHT3+fIl2tINkaii5Tm+GeJviSW3iLT2DrGYu1tDiQJItaHhvfqJGuZIEt2i0VAItkShDI7QHkG20WP+0berUUseppa9waA2rgqKiDjQ/nSwMaJzIARQlMtcq3gcwkTDorArrWQFc9O4B0iv5dZoZ5hOCLhNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=NzWSPYoo; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dGD9fRkNDw92UVGQWgFKY7vqbTLBDdBMv4Y+LO0w0bU=; b=NzWSPYooIvSf4soTIXcJS8pWWr
	w+1gPrtFYtKxdtanhkyaLjsAzNCnT2ithfhjsNzh1izCdgY5t6UvoVjBSUaM7I+xucFYxFpEKE9Fe
	J3Uor22ci12iMvc59V2N0QpdRG+wXGRXp3l++ZJ4Yxzz0M2tC5Ff4invezZUn6Gn3ic2Bzu8ZmlqF
	/hgV8M0vdEGXmgWg9RMqXhSQjeWRLYsRS0wbbobIbx2j7DgLFSk59qxrEDQjJHl2W++njXCQLgx14
	Ck04kYVcbq0SHcw9pLTlegRtg0vX9jSgc5R9Ny93fb0QvCTWjryjobm4lYioopFTjR3nNVsjbOD1s
	lUBT2Zfg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tghIM-005zB5-JV;
	Sat, 08 Feb 2025 10:38:38 +0100
Date: Sat, 8 Feb 2025 10:38:34 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] modpost: use strstarts() to clean up parse_source_files()
Message-ID: <Z6cmGqMMLHrWddU6@bergen>
References: <20250207175104.412158-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8IbjP6FQEyvyD2v+"
Content-Disposition: inline
In-Reply-To: <20250207175104.412158-1-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux 12.9
Jabber-ID: nicolas@jabber.no


--8IbjP6FQEyvyD2v+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 08 Feb 2025 02:50:55 GMT, Masahiro Yamada wrote:
> No functional changes are intended.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  scripts/mod/sumversion.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> index e79fc40d852f..3dd28b4d0099 100644
> --- a/scripts/mod/sumversion.c
> +++ b/scripts/mod/sumversion.c
> @@ -330,7 +330,7 @@ static int parse_source_files(const char *objfile, st=
ruct md4_ctx *md)
>  			line++;
>  		p =3D line;
> =20
> -		if (strncmp(line, "source_", sizeof("source_")-1) =3D=3D 0) {
> +		if (strstarts(line, "source_")) {
>  			p =3D strrchr(line, ' ');
>  			if (!p) {
>  				warn("malformed line: %s\n", line);
> @@ -344,7 +344,7 @@ static int parse_source_files(const char *objfile, st=
ruct md4_ctx *md)
>  			}
>  			continue;
>  		}
> -		if (strncmp(line, "deps_", sizeof("deps_")-1) =3D=3D 0) {
> +		if (strstarts(line, "deps_")) {
>  			check_files =3D 1;
>  			continue;
>  		}
> --=20
> 2.43.0
>=20

Thanks, looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Do you also want to replace the last strncmp() in=20
scripts/mod/modpost.c?

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e18ae7dc8140..31468923cdf6 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -670,7 +670,7 @@ static char *get_next_modinfo(struct elf_info *info, co=
nst char *tag,
        }
=20
        for (p =3D modinfo; p; p =3D next_string(p, &size)) {
-               if (strncmp(p, tag, taglen) =3D=3D 0 && p[taglen] =3D=3D '=
=3D')
+               if (strstarts(p, tag) =3D=3D 0 && p[taglen] =3D=3D '=3D')
                        return p + taglen + 1;
        }
        return NULL;


Kind regards,
Nicolas



--8IbjP6FQEyvyD2v+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmenJhoACgkQB1IKcBYm
EmlNsA/8Cor/svj/Qi46iKCftYV+ifk/pCIontCJh2+tKA9S96is8R6bPFG6UkNx
F0rF7zWa7fYI20oRk+fLTp91W4nsAmvYRZ46Fn1COTeK/BER3ArL/m7NMjqSQqVK
0k2QKkTKWB2J8GRxNskJnkpUVZOBZVNy1xDzqCWWtyEaVPfibtedOEoU3uJeYcyJ
dXqBMZbqlaPiNEMzN4ZnXtxT/6AVR4bDcfaCdFek8AnLQ2/kEGbVydreJUiUs/WP
sRjokaQzRLN4pVXtB+gYhX3gM2GK1H2cWD4DF9gl2YlbFp3b03gcQCnbz5gnx/C4
XQPAeYZ0lZKFF0+NySdMk4O/i5jzihECOYxxjc+BvYUE9Lz4faXf2HdmhznQTZI+
kaL13s72/wgZn8ZXEbKGDUsDyaOxsZrVDGgLjbRWVom1QCY6qo4Mo06A1RU++E4S
eTbiZBcvLkOlUTR1cPZ3c0rgYT4aL9RQkrylfib719iG/wUsitAjG2MZUjVPGTQG
KRmclOItw0Ha1yh2NemnxV1fcGveeApQDtVyWb6Kxo0G4VlYzA6iYfIJPGDR1KM6
J/0weXPabciM+yweOqAr6jUwiak+Drr0gNpWeZQFIFck7XyoPfVyjWWj7NSf3Gox
fiYisSJysgW+zLSrRrB4IMwjt2QxCd33yH3+2I/b07Ygt/H73q4=
=NmxC
-----END PGP SIGNATURE-----

--8IbjP6FQEyvyD2v+--

