Return-Path: <linux-kbuild+bounces-8166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1227B11F1C
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 15:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14E4516D568
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 13:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7981139D0A;
	Fri, 25 Jul 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LTMIha5L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61F8635D
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753448480; cv=none; b=a0U3SldDuoElE6dgrprqW1UoMTp3xfF60rVfR3etkLCcKi0IUksgNUBF4qyUjFRB4P9Qgi7iE+t+tmJ/BGwVs3s1JYGiFSUJObecNsSs9t+Ft8evoMs0NT7x8zpODPrZvZgwZ3XNlea0QB8p6iDznRuiM4+0aFPtQfQ4W1MzNE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753448480; c=relaxed/simple;
	bh=YqJNmVi6pq8/MNIC1pcZbfwITTv0HOp+QsTpp/paTWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSsitmN4C/QX1O98Whu/gc+s3OrLkygcuJZ5ajTHCoJd4UdiTwENU/OtnzVowSEWtSifEGL14N2f+uo/nSIQBgO6j0XUnkil5w7tXu2wT41n3zrruQpEsB3qDZ9kJx2TrC9KWh99eZldQm35+VjIacVZaDV5SZmE6pSE3Vu69PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LTMIha5L; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 25 Jul 2025 15:00:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753448476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gutNXS9Y0HT6UAb0t0FG6hv1oTyJPV52YMEDtiNk+4c=;
	b=LTMIha5LgqdpnhfVvGUzVr/VBu3pBfJmkrmUWKuZ+UG82kNkRTj3dZzB4zAHf+/v8KcpTh
	5yrBnFRucFAkmzCm/TUSPPf1mXMolb/gWZPsPi6FA4BMsJnPCfdfgWKq1eGAbjfBH8nNmh
	ERip48/3OJo97Wcs3NIq2mOlbAy+dbI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] kconfig/lxdialog: replace strcpy() with strscpy() in
 inputbox.c
Message-ID: <20250725-violet-mayfly-from-heaven-bd66d2@l-nschier-aarch64>
References: <20250725055928.37658-1-suchitkarunakaran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N82fKxdJzeNZZ0RL"
Content-Disposition: inline
In-Reply-To: <20250725055928.37658-1-suchitkarunakaran@gmail.com>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT


--N82fKxdJzeNZZ0RL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 11:29:28AM +0530, Suchit Karunakaran wrote:
> strcpy() performs no bounds checking and can lead to buffer overflows if
> the input string exceeds the destination buffer size. Replace it with
> strscpy(), which ensures the input is always NULL-terminated and
> prevents overflows.
>=20
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  scripts/kconfig/lxdialog/inputbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdial=
og/inputbox.c
> index 3c6e24b20f5b..8880ccaffa0b 100644
> --- a/scripts/kconfig/lxdialog/inputbox.c
> +++ b/scripts/kconfig/lxdialog/inputbox.c
> @@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *prom=
pt, int height, int width
>  	if (!init)
>  		instr[0] =3D '\0';
>  	else
> -		strcpy(instr, init);
> +		strscpy(instr, init, MAX_LEN + 1);

Did you compile-test this?  strscpy() is not available for user-space.

Kind regards,
Nicolas

--N82fKxdJzeNZZ0RL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmiDf/8ACgkQiMa8nIia
bbjlvA/9FRkUxIkN5aHaFiPItBUMZeSTGzUDRqp67kJQJnUrBVFYsZZTVmvqtgZk
HBw5RABq0WA7LHtPG9zsVsRi8b6vK25xbSrFF6V2st3e4BqxBmfLx4Mvw1XxnSFJ
BcFxZAiI/OuBJmTalmekbtzZYBzTk3FFdhJZwpPSfYnvxHJuxz9Cww8iWpSQZO6S
+ctpdKQq05pisdgz3vSgQP0pp8njL4NUgl1u3tulqMbeom7WVwvCkS5JXaopzIRb
30eoaN5NKhQlN/yJKPkDQDj+mUYac4hD7M4GDnF031K0ToCzs/UUx96XURE2UdKQ
965D0sM43ZJHt0QSiKOV8yytZ8uFewQgjZb9B+OpkBDYL6r1lR5FOkRoglgekhTX
My/WbmDbWxkPVC8HdvDu4AGAuJlCBpW5AgLf91D5+PHha859ekToIbq35dMyrnhS
Zi428c1uH1Jg+Vr97P3ek6IJzGk7y/NjR66jeWfXmCQAIch2S5AuUPa4d8O+G5E+
DpmEZoP8X0jmrMa2qYMUY99KgMtTfzzoiMqEzBXRamQojQBpDIP087RjSbZS1vzB
PAJML0S4Dx5AF3fWxbS09QiZnVl5MdWMoaQQXIEYS4bFSMP00tIC2ojEGzk7IIKn
PAzP5xiQZp/2YcjXKnwmPiFoZaYYf3i/FSIUEOnh0JOwN4EXPT0=
=izPZ
-----END PGP SIGNATURE-----

--N82fKxdJzeNZZ0RL--

