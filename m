Return-Path: <linux-kbuild+bounces-4488-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F07B09BA53B
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 12:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27D871C20E1C
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 11:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC4B156C40;
	Sun,  3 Nov 2024 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="eUvx8csu";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="iGCUu8zG";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="eQaB+Tfp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F115B149
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Nov 2024 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730632637; cv=none; b=q1cVHlvSRNF2FsBRBe7ujKG8NCq1vq7F/VGyiA38dtPx8iFR17zqxan5weuqA9VV82NsuitNAAk84Ly5jnazHS7dPDAdywDfM334T9QhQ3v0BW7QGu712m+VCCAJVzl2hd4jFvG9vwpMfH/jy7o9QyuYQ+V/NGv7fsujSFaio5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730632637; c=relaxed/simple;
	bh=epNaclD40qMK6ns/PiFXxTWyIj3yUc5vZo9AfIb3Q48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPD9XM/19r8km+n0Go7OcMK2unmaXoLpIHpXyAV64SNJow7YTBJg6hFzQV0O2NF9ktYERttkrWMUseu2I4eywNw1mbXBWYD0S3SWHVLeP0quZhKqlPmmd3pQIxEEjwEw6mENtXI25bx6QifpFnkUUQfpHiMnay96h6tXdWsTmRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=eUvx8csu reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=iGCUu8zG; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=eQaB+Tfp; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1730633521; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=epNaclD40qMK6ns/PiFXxTWyIj3yUc5vZo9AfIb3Q48=; b=eUvx8csu3lOsKzf5I1fmRNuAkd
	760EL5J7pyAOKStIGC2ZQOYRXguIQSHBduf0sCSjqyb4Xyo+C7mD5ftqa15sNrfJFz0By1hDELMiD
	TpLKe0Arrb7s+P6rx1l+4IydoGi/2CroSmUpEPsYCsMkxw3a7v73ICUrWHmc9D/xv2KW6qKdAj48C
	tS8TaxwRt7JVTZUIEs80iSabW2nF5s88UmGVmmnmlYAjFqM/AFuBBDRdaGP9ZmNlpFfTXfzR4SiG1
	dq4fyhHhOTV5GpzLXTsaV/cN+jSmgB7pS/0mF0aWHMWDHfRmeqZHEbaBvI12MmheIoFNJGpxL7xEJ
	VVjmXw0A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1730632621; h=from : subject :
 to : message-id : date;
 bh=epNaclD40qMK6ns/PiFXxTWyIj3yUc5vZo9AfIb3Q48=;
 b=iGCUu8zGe9HRJze1RRPYgPoxz8doyQT1K4E0n2pp5sSmK1ykQiNZF0C7NgZI/TtGIFiSR
 ZOpQcZ3/Q8TnOjBHI+mExlrYR1kvxGIy3ZdtK/5Ah9j7SvC5vHoBlYby9bpKLjcgon7Ksm1
 RipC4t7udMaiEwpH6GnqLNx4/Uu97vDNJ1oNP/jR47eB5tZm6Qzkyx4wj1gI30LRj3xjU0M
 SuWi9BieyfhovoTOCi9oxxokdwXd8DvJriD/FgfyLL2FWIXS0VBmt1S7329dBsxMV5KQkDK
 sK/RLq7w/75P+djH40zWW4MJLFn4inDwNu72NbzHQxUfWyKu1i+rXycpYf9g==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7YZj-qt4CHQ-PL; Sun, 03 Nov 2024 11:15:20 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7YZi-FnQW0hPu9qe-lfIC; Sun, 03 Nov 2024 11:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1730632512; bh=epNaclD40qMK6ns/PiFXxTWyIj3yUc5vZo9AfIb3Q48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQaB+TfpTTRxWwJemmySS/Ao6+4lHvIUaBtC+lQVScK2pXMR1mLIHFH3DlWkz54Cx
 49EpSHZ+j1eHUtOTAM6qV/g0Tqyzkl0RtRioxieeNceuqqHHdthyOf0/9FuWBwCQbd
 MsuxMkm6on3p6RrxlwNoYPC7EUXXenOk8Yrdz9TQ=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 0E3513D7C2; Sun,  3 Nov 2024 12:15:11 +0100 (CET)
Date: Sun, 3 Nov 2024 12:15:11 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Morten Linderud <morten@linderud.pw>,
 Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
 Kees Cook <kees@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 01/11] kbuild: ignore .config rule for make
 --always-make
Message-ID: <ZydbP_bQQXghWYSR@fjasle.eu>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-2-vegard.nossum@oracle.com>
 <ZyaUkK57P4sL2uqm@fjasle.eu>
 <CANiq72kJDTaTy91+QN_STHf9ppeiWtzuVORX+Zp36zbFApZ8HA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AIf+jbmdOnB4tqTq"
Content-Disposition: inline
In-Reply-To: <CANiq72kJDTaTy91+QN_STHf9ppeiWtzuVORX+Zp36zbFApZ8HA@mail.gmail.com>
X-Smtpcorp-Track: V1RpDrV1W7Tc.sbC3aM2xTGa8.kzp77gnc3D_
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sJea5VhC7H
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>


--AIf+jbmdOnB4tqTq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2024 at 10:39:07PM +0100 Miguel Ojeda wrote:
> On Sat, Nov 2, 2024 at 10:08=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu=
> wrote:
> >
> > As we still also support make v3.80 to v4.0, please use $(short-opts)
> > defined around line 27.
>=20
> We moved to 4.0 in 5f99665ee8f4 ("kbuild: raise the minimum GNU Make
> requirement to 4.0") -- or do you mean something else / am I missing
> something?

oh yes, thanks. I missed that,

Kind regards
Nicolas

--AIf+jbmdOnB4tqTq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmcnWzcACgkQB1IKcBYm
EmnDLA/7BevexIawqKVjjAa84E6g7gL5tDLaiGM6EQbfnRQ95Id8RGiUY+kEnPT4
b7djXVDqfo3XmA4VztyAFjV0HxdvyPo273IMrLxVI9/94H5R82FwvGxCXZEYU+Gk
jb5gXGGDfGHWdGRMPArgxkr1dj3bunKoDljrwf8dYA6fc4Ik5qmkSNeL4zQdBLnl
MnQIx6uVXVFeY9YC2JFt+/kWOieBtdW0EVxzM4n+YSoA1HAFU4eK0gVg8Nv9MBhR
/xrVUTJpA0dk2N2W9Ppr4fu8IShtbnoUJwWEPXcaZxKXgdFnbbjsX6tO57y8f9v0
yluVEFTpYuglAzD5WhY1hfKgNOqqNvsATh/9E8JJm8hitbBPHbnCmF5IsrJ1TrRM
Y1MQG4/9uPXrf/+lvhHuanuLEFeRHDyYi6HVQU3/OitoWSou4DMXBMwJsNcUsOu2
6+vs4T7nXcob5aFxcTYYaqa6d6bccxhJsG8Yrb2J0n2sRCddds2i1AVlpOLSv54Z
mPU5w3bmaAtiUj9KSoTNMUqcorrXMSJB3j7emilmPWp5bpwfFARm4kPLt85yFC/R
R/LeIzW+SN7bN9C27wi5Ss3D/SW0rSyCDkEMElpIbcniy8a657N7gtb8poSex3KD
cKGSto2JeOuYOpn9jeHhczZKlsQEhU7rBeCQS0JtilXIdTtwBr4=
=ReWd
-----END PGP SIGNATURE-----

--AIf+jbmdOnB4tqTq--

