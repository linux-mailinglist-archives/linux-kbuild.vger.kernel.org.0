Return-Path: <linux-kbuild+bounces-7809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBBAEFB7D
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 16:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 702FB1726DE
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 14:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D499B275B05;
	Tue,  1 Jul 2025 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HfD9ep41"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95DF148FE6
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378321; cv=none; b=XCUBHQMJ29UvBGQvYztbzat89pevI3RjpqOe+e6+BY1Y0k9/Bk8CF7oRsTC1GbfAwwt3Jb18poJiHsQktycHqDbFa8rhfhY9oee+2r6JVYLXOm8xnYq81FSXoxLVq/TwV1VCIhJfhND0EwxZXbgqBTZb3YJppPaevD9GFmzbo2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378321; c=relaxed/simple;
	bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiJCG2bF11rk9Tmf5cXyZspQjZpGs2XnCV3GCrTVmw83uBuK9v1QCWei+5+hz891XIra9qoFmDWCHvy8st+mwM0WQzImb6omls5HRM+5hH206SHvR0QW2BTve50Gn6SaaRjf9ROeR56EiR4SkkbtC/fMMGhkM/Y5yDW4kJrA6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HfD9ep41; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0b6532345so1299295666b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jul 2025 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751378318; x=1751983118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
        b=HfD9ep41EZ2K48tldagWmkSGYZYIGZE84ao+oDsMUHHqKv7lyHop2RhOfB4D6ZKV+y
         sHN+z6sR8MMkYzZDc0GZybPWwniHXsCsSU/yMTHWPyfri4flsbsCojulCFGHpqSeOJZz
         7f07XLEdts83gojGJNRl9YgNjQTt12qTL7bzQ2r32q1EY6JJLXCVeaHEt7yrssNEAhDU
         1ybGv5TAv/PSpwVzMV9RkTrAMKS2u3HUSDZLWp8JngxGw6RjWrBKEkmPev0I2AIAmaLS
         Mi30E+GrjtW3VCKEkT9vbAaqxTdVOCrvdfEtg09wlr006KPUp+w7KQjBYNf+25199HUI
         HQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751378318; x=1751983118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
        b=Jhyh1gEIjI+ipO5mccZrGP/d+0bFCXBL4YIWa40NOM95q0cAJzgeWpAf8S3D6pl7Gz
         0h0DgXQXMTnsqVM2QeAmcEwfJzD6Ggdr2c4Fpo+aPVq2m7JVUu1k7974ObaorRk/gjJG
         aQ9IKJK4CaDUHeTE8wPptTQsyRVsBfG7qRjCZIykG7LEK3CpUe2UukPOAgbbJYiSF7tK
         YnkvDKCBhFWFsd2k+rguZBcnTFSa3uhkBUnT69JdKNE4rP9jcH6e1lq7vTBCqzgMsg6Z
         aVEEfb4K94U1XThO93LcRO6C6uuNQhmldpMZJyaeDwyPD93wavyHxrSUzSGmv4vlR+Se
         HOEg==
X-Forwarded-Encrypted: i=1; AJvYcCXsNqZlpfk2+/GJgb36VooRC0rA2+E/HERjQdT6nKu5IOYklbryuiwlICJdqxtNaTxeJspQJPQ2mrm/qB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytfSQep+kthYphPgxVrs2DhdTSJL7kAyjHB+HLe4mef8IavmaN
	6BO1UbnGflyDYearIq/qO4/6ddnK0rBa/3BYsUvxsFwSCP9/SxQk9X+OYIiYstCgQf0=
X-Gm-Gg: ASbGnctIICerhMtcrFzfsndEzfWqXVeQpT31G7UTIRT7Omr0YPb8uKmsjT1alJnQyP+
	fjxxk9PD8timdPP3yRBU4H6Zb1prE59UAJ3qkx1O1iU2ldgzD/0vGRmvct0FE5Moyqywet37rbb
	XsUSJJ/pHjR5K6IwyXjkzEzPpRS2O0tWJgqKo/klpiYP6+j31eNhDlualwE9XhCkmzQuKrfF4/h
	/Fut7VjWJqx8stgBj1Wa+I5L+I6yXQ90q/HiX673ss0PWA0ZZs+wSj9q0ZJeFSSDiiiFaAtkc3t
	eDE1dBsVX9jwf00Hl4wqK39JOI4R3gyVtBkBmAgLKqyUa7g/dBw6FEeAjDWnLIrlO/bULUiJGH5
	nxnBC/dyYi4VDZNW9yFG2xOYpZmsZ
X-Google-Smtp-Source: AGHT+IEErW/1m6kWJI/QUl1/GgPvWkXJOdlssf+ecP9RtQLtNt2Q/z8dOm0v3kXyntLM7RrDaEuzZQ==
X-Received: by 2002:a17:907:6089:b0:ae0:c092:ee12 with SMTP id a640c23a62f3a-ae3b0b3b182mr228151766b.22.1751378317932;
        Tue, 01 Jul 2025 06:58:37 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353ca2159sm895363066b.178.2025.07.01.06.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:58:37 -0700 (PDT)
Date: Tue, 1 Jul 2025 15:58:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Agustin Vega-Frias <agustinv@codeaurora.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
Message-ID: <53ugz6qg3rfgpcokrre6sqfr73tdjwiz67dvgvlnbiu6kkyc5u@bapjxdheqrzt>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <87ldp9m7la.ffs@tglx>
 <gbjim7wxszmwfvm523bgyfxf5mk5773pafdxnf2wf4mgaebsmz@qfeejv4ilwxv>
 <877c0smgip.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ew7zmkwgcjmemgph"
Content-Disposition: inline
In-Reply-To: <877c0smgip.ffs@tglx>


--ew7zmkwgcjmemgph
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
MIME-Version: 1.0

On Tue, Jul 01, 2025 at 11:01:18AM +0200, Thomas Gleixner wrote:
> On Mon, Jun 30 2025 at 21:40, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jun 30, 2025 at 08:01:53PM +0200, Thomas Gleixner wrote:
> >> On Mon, Jun 30 2025 at 19:23, Uwe Kleine-K=F6nig wrote:
> >> > The modpost section mismatch checks are more lax for objects that ha=
ve a
> >> > name that ends in "_probe". This is not justified here though, so re=
name
> >>=20
> >> That's a truly bad design or lack of such.
> >>=20
> >> Why can't this muck use foo_driver(name) foo_probe(name) annotations to
> >> make it entirely clear what is tested for instead of oracling it out of
> >> the name itself. That would make it too easy to understand and analyse.
> >
> > I don't understand what you're suggesting here. Either I got it wrong or
> > it is insufficient because every object is checked, not only the driver
> > structs. That would result in more exceptions/special cases than we have
> > now.
> >
> > Anyhow, I agree that depending on the name is unfortunate, maybe we can
> > come up with something more clever?
>=20
> That's what I was referring to. Doing checks based on struct names is a
> bad idea. Having distinct '...driver_probe(name)' and ...driver(name)'
> macros to distinguish the functionality is the proper thing to do and
> way simpler to analyse than names.

A driver struct should have no reference to .init.text (i.e. no callback
to a function marked with __init) no matter if it is registered using
module_platform_driver_probe() or module_platform_driver(). But even if
the requirements for those were different, how do you signal in the
binary if the driver was registered using the normal (i.e
platform_driver_register()) or the platform_driver_probe() way? Or do
you want to check the source file?

And note that if you have that, you covered only platform drivers, with
a bit of luck mostly all drivers (note that console drivers are special
and are allowed to have an __init callback). modpost checks all objects,
not only driver structs.

Best regards
Uwe

--ew7zmkwgcjmemgph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhj6YgACgkQj4D7WH0S
/k6Usgf/VQP7NM8MPg+CfR2etODmmBWc4JfKDQlAng0P/qelWDhiNY9LzE3y8ApZ
Gxx6fIqmcBIU1xHF0+ti0JuOdYyn0baF6SWauNZ+ALSRAYA4HmCJHnnvXzAfWIe8
OzeOfxSjgQLVmfuG2SWsRpjTwYZdQpVBIp6yZVNcf05vBHJfSq8Gywu7kYXCPAs4
0wgGcYfav+7ZadCczVuDd5P5rW2cQzpoSoFaAyGm8Gw3rKu5xEBxUfIATfxWBjTc
nlwkteyoUWXwp3xfWOK5UvKFgg4HA0YaoL5+X3bpn70tVLld/0lp1OWEGEnJvdn9
Fseh/gg5shlM22YYWg5a/+OnxHZLag==
=HqPr
-----END PGP SIGNATURE-----

--ew7zmkwgcjmemgph--

