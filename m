Return-Path: <linux-kbuild+bounces-3060-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC456955709
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 11:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B6C91F210E8
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 09:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E6B143723;
	Sat, 17 Aug 2024 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="I7bsrQiF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63032AF17;
	Sat, 17 Aug 2024 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723888409; cv=none; b=P41DVxGwfGeAlmiHKIAfyTaGT39gtF5vjIREsaJ88xhZxfJ8hENwMthz0xd/F+06Vbb43SIckLovblizU3ur7cLpGA7ZtUdhaHFOSJkOqCnKMsAnheud5nHM0xNKrKAxe8M8iMf8VWJILobhbiWrwBZMLbpAV7fa4wnHU6GZrWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723888409; c=relaxed/simple;
	bh=3L9EMpFqhogJtaIVKYhlHGc8ZVWv8k4R7gVSH3JLUJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQ1tbzFav1+iYLYfdgPtcKrhLQaH8rXhYdbFcL+orxCkGbo0Gd3kIatWLfrFZIX/4++SZnuokxpiMLKqGq15CUp6TNhYKEMhtpGgiPYhyIdRdrgIAIKnrbizDMzetLjlSgVJj3wtZ8LuVreHRMekjsK7fr81Zvn3Mu3ewZOEhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=I7bsrQiF; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1723888384; x=1724493184; i=christian@heusel.eu;
	bh=3L9EMpFqhogJtaIVKYhlHGc8ZVWv8k4R7gVSH3JLUJI=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=I7bsrQiFvy7NELnLEVRiloWvyWGbPuNzK7YTxPhO2yDD1xitNuWVTDrXGJtXS7MT
	 wpLSRtTSsa5hZzgygEZAMAsm6YqLFrMoRvNimWrm2RSkiRYOqrVskKnnp1EyEDQ/S
	 dpqqaGoE7gC05AgSnLevOk+HKeTe5DOEQUQhBbw80vT/58Q7/oRyDaPcphyQ6MiM6
	 eg6hzy1t5F5dp7TR4PoMvaPYOKxR9UWMvXXXfOVYsgC85oyna9Dj/1bnpRGvDOGGb
	 W/nxfrC93JEad9/hH6O8ZvSgxWErIERUxpl3Gv09sJVpOLOJUXL7/6eDbJb8Wf/kt
	 GK+iRcOBDuuZhKBGew==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([78.42.228.106]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MStGi-1saDXS1sJ4-00K760; Sat, 17 Aug 2024 11:53:04 +0200
Date: Sat, 17 Aug 2024 11:53:03 +0200
From: Christian Heusel <christian@heusel.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 2/2] kbuild: pacman-pkg: do not override objtree
Message-ID: <dce91a33-ca97-4fe9-85e1-4b5962eac44f@heusel.eu>
References: <20240816141844.1217356-1-masahiroy@kernel.org>
 <20240816141844.1217356-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ogxep6ph4ncd3u3m"
Content-Disposition: inline
In-Reply-To: <20240816141844.1217356-2-masahiroy@kernel.org>
X-Provags-ID: V03:K1:PJ6MV6gZP3tHgVOUvxa6JdpsjxPh9NHxzaFgYMwX1ZoSmweR2xA
 wJ5X00jeq7xGAtF0LlPOwzkgcdsEvZGiY429AM60docB/zi+cwlxFjQzh8L5SGpp9KF6Ev4
 OF04la9B/QNanWDhYDFgnC+Tg/p6QNDKP01uqZl8XN88/hBKyrx2nWSCbu6yTjFZRZ4WeFz
 Q8l7rpJjTrm3f7WW2VX7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KSsCrYC1eow=;mu+9kq5Eq7O6IWblZKe4B2cbINX
 GnGUuLmAJoTCpiVOekaSy7/1Q0OXm1O+CwN5YBKpy6kmRO+CXgPvzIi++WAMzTrwWgAm3k9fn
 g21S6cooU6rS4AUey52i3cfJH/aRNbjBwMptq02rV5S0bI4Nmf00UWjwzvh5HS/au+C00lgqe
 p3J2reJCAOT42QzTqFfAN7id35kJ7vaHNLRTnDzXbTqyDfmh1DWduJGMKhCEIw4JHeQ8ctLon
 02cOZqT777IUZ9HI6MOw5XaYYnBE6rU92Y3bwDm5Az6iY82u5tLi8SguC52HPHfgFMvpFPo3T
 8amJBWJfIHVUuoMiIM6wTdw/wc5jz9WyG9jlXfFSA9OvdUBuAxhtSS1qWKPkqkb2wSrnQ7l7P
 WRllHlHPYTic2mWJ9mninYahwQMsK+onSyEpVGALjDIPYIWclq88upbPajtOl57xBDt7fPpYK
 C/lc/lJBg08qeNc8Nz9DZtJUHSs3mTZ//YDCiAG5CLQ0uJ4rTU0azGhEwEcg0dea/n+M//Up/
 565eQliNFVQ95GXWhgidLNgopwQNrdPhMS9YlKrrDs7XQfbesQG2mXn+qod2i+OQBJXopBwWs
 yyZVv+52w5dATNLWi69Fb5/uRHVZle1MaYizUN0W0Gk232JQHZZjL96vSDZp71dUW0ZdFeUdh
 hnTXU91Xu3dJod6Hh+JeZaaKOjkSmmdKlQtm6zsDD/otJS1qCv+YogMrMLxXgC7kVr+ZgT/jX
 UgkUumLXBBLs7BmmVBDyrj7cqATDlZjiA==


--ogxep6ph4ncd3u3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/08/16 11:18PM, Masahiro Yamada wrote:
> objtree is defined and exported by the top-level Makefile. I prefer
> not to override it.
>=20
> There is no need to pass the absolute pass of objtree. PKGBUILD can
> detect it by itself.

Thomas already spotted the typo in the sentence above :)

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Christian Heusel <christian@heusel.eu>

--ogxep6ph4ncd3u3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmbAcv8ACgkQwEfU8yi1
JYUFqA/+PYJDxjGioTv8bHGc6DI5RtTdcvFHQgNu26iU44asuTcO71sfZZ5vticD
1qCyKzcHI1gWEHg0df5rXzfX5fJp26dIvvmFKGMpKMV+tYpQQMEMwRZ8+0Bbs1aM
4AUokMk3t8AEEhQjOxweiql2DoEXGcy5VJuJPoC0fJsUNOi1kGLJT9GsQH3PLlWb
51W/2r2VIJKSiGa3NU9tJEuRNrL/75ZEJAi9LzOUquxf1PpNglOw9/V0aP1j/qCg
Dij9L0jxq27czMvPL0dmGQ4Gwv7uP7r1Y9l5xc8EXMEIQTNO8zfIzk5Wgyyjt2EE
CKlWYZ28jU90yrvGmgZqbnJJo/kP5wsWftAn32ISlcsLzYGk9ihuNGKbDNhrrRgm
gGEE97jtPAyjH0LZwRxYRN1bWlBRbqCwf3SPntIud2A5GFaOz66uTOOZJRrWEWiD
M3cRHX7agqGvRTY6uf4vNfEWswJeLN3ycz89jX9v7C/x3p+sqmYxMASyj5P3aF4k
yrTKVKJiGW0FVBqZRkncGwy6641Z1wpZ0KLLcLcLVsWIn7Fs2bsnle+nCUmg1RSl
R3WCC8aGgJfeVgvh8MGShAU1KAbFzX94e7u87bRj3qUTTEBWFxP2ghe5VX6i2Fqp
0XsDXItuJt3JbquuuzCh5BcRf8kjenRTyhTuEt122b0FQ2uE4HM=
=4L99
-----END PGP SIGNATURE-----

--ogxep6ph4ncd3u3m--

