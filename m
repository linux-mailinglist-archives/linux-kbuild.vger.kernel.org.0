Return-Path: <linux-kbuild+bounces-7367-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525EACDAB2
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 11:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D86253A5022
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 09:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C860E28C5C0;
	Wed,  4 Jun 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R813ESye"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E41804A;
	Wed,  4 Jun 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028484; cv=none; b=AbdxxMfh9t8prRKcTbQe4Oa59qRCof/8u5pOo0LxKuj/d5wT4cC9d/gbfMY7LPjy+hs8dAjeQ5ljtrpl8VvL1gzxV9NboPLSjsrS1K0eJzfKCLCUXNyRQhbCv0YaLL3jyN2VIu9mxZEC7sSZ/lZ0IAgn2Yt9Ri+28HA571wTZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028484; c=relaxed/simple;
	bh=FszywAEUd6pZfQDmYpN22h+dypZnSE9YiVfQDrP2LAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqf/X8HJCmIyucK49H3yKygTkOSqsR9dnNr5YEYcBVQ21/dz4VfmYob/zfRGY8tywknrA+FysiyS2FmNPxG2RdG/FMD0ffPtZW3FPJ4/L2kp4E3a1ZbBxf1G8TPrMB1AaZCj5W5bcqjSR2Sx79pyJPWgBe0u6N5pY5P3uM4Gois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R813ESye; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2349f096605so81185015ad.3;
        Wed, 04 Jun 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749028482; x=1749633282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FszywAEUd6pZfQDmYpN22h+dypZnSE9YiVfQDrP2LAA=;
        b=R813ESyeAjcAqnFzw6v3hqWjLBOMQFc6P2YRMNx5YEkMk0UsGmIC9pNx/Wxcnyn89w
         bjtGaF4BMxNiehHNVlCuUxuDEcsMG/S+YrOlFZESX4pSEg9XNkBRDWZVY+yViUjjWChC
         vSqTFbmmbLfNQ9NKWF3osLkDuWY1RK1KQMw6xd5WCPAPtbzL5ARlfwBZtdNQfzDSQL1Q
         /+sOOPjqRvmmeJ5dSTavXXUVBwDIW/DSdw5Ath+byP3+ML4YoueV0WQJNlvm8oZUHJzy
         /pCHH20MR85fO6zl8ct4eZOnDw8SXQmcnBvEVlVAlFHfl5tn1gdKIdsScPqwEPW1r8U/
         VRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028482; x=1749633282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FszywAEUd6pZfQDmYpN22h+dypZnSE9YiVfQDrP2LAA=;
        b=nRpQSoY41m3qYecTI7q9+a3RClc35PNUAUhG/geZBvumZGX63/9jtPqDXVpS/EDFmp
         v0OkNrjxk2yZAckTQJ+zwhMMvpjo7frjATjy/lOIaIHACElJKG0o7ZCu80ZNPP7BAdQP
         sd+sSC88eLUO1glNFpMWd2jVrE4HgVo5QvtG175bWgcr6bqlQXsnCmNDEv/XHqPBKnDS
         ePDXyl8txGRhLowNNMeyXkL7vK+lV0dpeiwdzCkk7R0qp2kvvQil/CIA0Zt0dDbfhN+y
         Fjm4C81+ve0HxRkTwTWgjgMtnQAiMxBqX90cUarn5aB6N99sZUkeoVJoJiKSg2ukpGyC
         4vQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1wtDYFqr+Q5+P/Gt2yredyu3bxj75a/YRld9XVBpfmUhqK45p8OPdeEB1MJdwly0tbdvOWv9wRS4=@vger.kernel.org, AJvYcCXkLsPcUMmCBrMktnJpXehkw7ETyrD+4JfFL2PvuJIOPuGrooo9WFDJ/2U55bL1SIEkLAca9aOxbpoQv/Zf@vger.kernel.org
X-Gm-Message-State: AOJu0YweJkstegG7TcX/nXCv8QxoSZVTg7SqFMx0DJcr/CFdwJ34Jwk4
	9/fp94jDztsp/nTaiWY6FYpKtjbfMKSYKXdy3En9ocXC5PlbeucFsfpCYUaWtw==
X-Gm-Gg: ASbGncu+I5HUu/fge6d9P3hX/gtS2QCsIlWJ9hybONKbnUfQi9nSGZm1B2ssSMN34sO
	rzkza9i+i79rWSewz5UxtO/dsmMEC1UsfWdwoTprCIqTTgBlhXVB5DuT9t/eJqmXGOAZ1YrG39R
	nWrMd9TqIPgnz0n0oi+OtjMvJbSdK1LVJUHgbUeBw5OgEAGOoUhD7KSg+CkzDfRfg03Ekm7SCh/
	3YqLNnVEzUsrqRX3yPucY7gai4zlUM0Pp7wX6MbFxdJf01JvjSF/rKf2Xl2ZlwgzixVzPh0kOj/
	TA+GR6YU7cGT/XhAZ0fp4uE09SPyZUb73S5xXFi/Zcx2+St/F+w=
X-Google-Smtp-Source: AGHT+IFXXw3Cek6NZAMJnlbjJ2ADflh+cuXsfA08GrFx//AYT30qt4aR46N3RX9ZYq9Vtsp3SRWyMA==
X-Received: by 2002:a17:902:cf04:b0:235:c781:c305 with SMTP id d9443c01a7336-235e11cc0ffmr37347475ad.24.1749028482211;
        Wed, 04 Jun 2025 02:14:42 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e39749esm9346875a91.32.2025.06.04.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:14:41 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 60ACF4208F51; Wed, 04 Jun 2025 16:14:38 +0700 (WIB)
Date: Wed, 4 Jun 2025 16:14:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
	Matthias Maennich <maennich@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] module: Wrap EXPORT_SYMBOL_GPL_FOR_MODULES() example in
 literal code block
Message-ID: <aEAOfrOofriBIaxz@archie.me>
References: <20250604005110.13040-1-bagasdotme@gmail.com>
 <95f14895-5c30-44e6-b185-824aacf0f997@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Xyd1jlyKOGXQY5c"
Content-Disposition: inline
In-Reply-To: <95f14895-5c30-44e6-b185-824aacf0f997@suse.com>


--/Xyd1jlyKOGXQY5c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 11:10:07AM +0200, Petr Pavlu wrote:
> On 6/4/25 2:51 AM, Bagas Sanjaya wrote:
> > Stephen Rothwell reports htmldocs warning:
> >=20
> > Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphas=
is start-string without end-string. [docutils]
> >=20
> > Fix the warning by wrapping EXPORT_SYMBOL_GPL_FOR_MODULES() example in
> > literal code block, just like other examples in symbol namespaces
> > documentation.
> >=20
> > Fixes: 707f853d7fa3 ("module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() h=
elper")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/linux-next/20250526180350.06b825de@canb=
=2Eauug.org.au/
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>=20
> An earlier patch for the problem was sent in
> https://lore.kernel.org/all/20250526211039.163449-1-khaledelnaggarlinux@g=
mail.com/.
>=20
> The fix should go through the kbuild tree as the problem currently
> originates on its for-next branch.

OK, thanks! I didn't see Khaled's patch as I was in hurry...

--=20
An old man doll... just what I always wanted! - Clara

--/Xyd1jlyKOGXQY5c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEAOeQAKCRD2uYlJVVFO
owP0AP9D0w+Mp+HobeVQlnxBW/zchuohdhXwQmzHLHFyD5K42AEAqWPuLS9+yoj4
RfC111nByFzWYJOSNtuKOJ4PGtA50Ac=
=/Mkh
-----END PGP SIGNATURE-----

--/Xyd1jlyKOGXQY5c--

