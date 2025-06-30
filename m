Return-Path: <linux-kbuild+bounces-7797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74EAEE7AB
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 21:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5062A3A3C2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 19:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE53292B4D;
	Mon, 30 Jun 2025 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NIHefduY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C49928C2CB
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2025 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312435; cv=none; b=taV1QSzDbItSy0OA6VXdK7wGNzokPhDMt40Czq1IZ4NCDjfGSw7fDRCkf+eum9PW+Q7roEw5rFotdLEeNm2cMPCP0DpdwwyyepNLMPYu7fSUbGgPQclE1Ka6tFJKVnc4jd7bI0x240j/4EqQDn4l6299k5Uu37a59fBpdJhRvMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312435; c=relaxed/simple;
	bh=pHWbAsMkiissQol33kasQB9R5YP+XhPouHV1dv5aHmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuT8iyh7/DH5d2F04qmI3Gj4PVWVvUjc2Y1vh8xUP2dWnC1OqtWqKRN3lZZKzmAfzfxn6eHNTBQP0nYHQx7HlaPfqPvHljMhV45XEheVC9hEYGiVYhankSeI/+V0xS1fv3Xp8p6VDRR0esnsOsriwGJ5j5y6t+dphwU/X2OJs54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NIHefduY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso4248456a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2025 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751312431; x=1751917231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dR+iJ3QhujZDf9uIL5BF8Crqd+xW0xxgvhgkDwkmlVM=;
        b=NIHefduYguH+MmVZH0xIOU3Z6hxL54g3KXR1qGLeg29QWT0UMxDEiw3s5lnEgwyiwd
         SLpm/5EiH4OV5T1Eu7+3AKIeyqE5VsfuFBJkUKaAZMD+ZlJtNTafqRVCMpFDgdQs4Ck1
         LOy12QgMF6G0x3QOdANGVuOXmrzIvXnXMxkv4zy8VFaz2zUnU6ZNs/bAaW1hCq+FLd2S
         zX2bAc8RtFkgRqojyPpA5sjcdxVl+5htvCfB72951v53Kq4PFePtnQpqxbAx/Xcs3LZP
         3MvKRjIGLxbk4nRhs88V5x9mMS2Xv/jarGcR7/DVFKmz+A/X+8Ei4aSJYC5scmj39v67
         /M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312431; x=1751917231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR+iJ3QhujZDf9uIL5BF8Crqd+xW0xxgvhgkDwkmlVM=;
        b=G/7I1oA+FkBCKO1iO0H1gcwVO9pl3ofnHU4Sr0PlwyLCftSFnXAESsjfQ6uytlvE+z
         NE2p1KtO7t9EqHI4xemjLDbtIBiQt9UwI6H68GdxdbDLOzwI/39niMX4i4Myxw/RuaUd
         0zDpKCQBYUJQBZIez5IfTG0uen7nTLAXMRuU39Ugu7h2lm2sCDWIB1xUFUbwgy50lWPr
         qCevF6K9c4dqwlJYjMtXfSFstYxQhU4P4AD9vdYwQVst0qYB5TdLB4K8gGdAKvZ7trjA
         dbmgkcQR4cMqoOdGMYqTCegXDFUC3yeWVH2PL9G7u9RAbxfLMmRYegQtDH6bSWvqiVEp
         4kMA==
X-Forwarded-Encrypted: i=1; AJvYcCXXrl6u1wUaF9YS+9qNQB8W/pBnHxtdDar3v9br1Q8lt7TGEEtMsWVMaYnm61HfWAH/YTBMzkGTtAhGTj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qxln3R3e130/j9IAn4/M1PPxWW3+VJ3LndfGQnc+5taHXnaK
	MXSbVxN4HGb5kXcVY4ccf6vy3nDKzVOOZLWH/zkpLlL5g1pHUO6U4VtjVAYWeaSS70U=
X-Gm-Gg: ASbGncuaAQumTABMF8IuP8FfQyW1JXGbAd88u9h1brQFiWoghS4fcZqln0mgENOqGNB
	vJ/uQzOICmWL2XFF50xiq+tBuuozMKXRTNxxztwIVZI+TrI0nVuj53oGxtNdijy1UoI0AiOm9W8
	MAoOKWtJe9ZK9c1bb1q2dxPNl5qfZoeJ4otgl7+QL0IAQowRwatRJLYy+6V4uQP/alWEuQV7LWe
	qrI7hmxYci7aTrNaf5c/4XOxNfRr0cLkVV5m8KU/CGvjy3ETdB/e+dMIShCRg05m8e2qn/QCvcU
	Kt/6G2nMf+s3mPW/bHAx2EBPKna0dLZpN5WgJrlcld+BOceqsASNRL+do68Pe3Xd7Tw=
X-Google-Smtp-Source: AGHT+IFIK2J9cXl/IPVjclluGd+dCHIOY4XSHNTiiXWjiYenvLUpWycOI0CzQur+qLe9BeZY0Ev9Xw==
X-Received: by 2002:a05:6402:34c6:b0:5ff:ef06:1c52 with SMTP id 4fb4d7f45d1cf-60c88d65540mr13395717a12.3.1751312431328;
        Mon, 30 Jun 2025 12:40:31 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60c8f794b62sm5566982a12.68.2025.06.30.12.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:40:30 -0700 (PDT)
Date: Mon, 30 Jun 2025 21:40:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Agustin Vega-Frias <agustinv@codeaurora.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
Message-ID: <gbjim7wxszmwfvm523bgyfxf5mk5773pafdxnf2wf4mgaebsmz@qfeejv4ilwxv>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <87ldp9m7la.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wb3haxxcye6hb47p"
Content-Disposition: inline
In-Reply-To: <87ldp9m7la.ffs@tglx>


--wb3haxxcye6hb47p
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
MIME-Version: 1.0

Hello,

[adding the people involved with scripts/mod to Cc:]

On Mon, Jun 30, 2025 at 08:01:53PM +0200, Thomas Gleixner wrote:
> On Mon, Jun 30 2025 at 19:23, Uwe Kleine-K=F6nig wrote:
> > The modpost section mismatch checks are more lax for objects that have a
> > name that ends in "_probe". This is not justified here though, so rename
>=20
> That's a truly bad design or lack of such.
>=20
> Why can't this muck use foo_driver(name) foo_probe(name) annotations to
> make it entirely clear what is tested for instead of oracling it out of
> the name itself. That would make it too easy to understand and analyse.

I don't understand what you're suggesting here. Either I got it wrong or
it is insufficient because every object is checked, not only the driver
structs. That would result in more exceptions/special cases than we have
now.

Anyhow, I agree that depending on the name is unfortunate, maybe we can
come up with something more clever?

There are a few more candidates:

$ git grep -E '_driver\>\s*[a-z_0-9]*_(ops|probe|console)\>' next/master
next/master:Documentation/driver-api/usb/typec_bus.rst:   :functions: typec=
_altmode_driver typec_altmode_ops
next/master:drivers/char/virtio_console.c:static struct virtio_driver virti=
o_console =3D {
next/master:drivers/clocksource/timer-nxp-stm.c:static struct platform_driv=
er nxp_stm_probe =3D {
next/master:drivers/irqchip/qcom-irq-combiner.c:static struct platform_driv=
er qcom_irq_combiner_probe =3D {
next/master:drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c:static str=
uct pci_driver aq_pci_ops =3D {
next/master:drivers/net/ethernet/dec/tulip/xircom_cb.c:static struct pci_dr=
iver xircom_ops =3D {
next/master:drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c:static st=
ruct omap_dss_driver panel_dpi_ops =3D {
next/master:drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c:static=
 struct omap_dss_driver dsicm_ops =3D {
next/master:drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035=
q02.c:static struct omap_dss_driver lb035q02_ops =3D {
next/master:drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.=
c:static struct omap_dss_driver nec_8048_ops =3D {
next/master:drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw=
01.c:static struct omap_dss_driver sharp_ls_ops =3D {
next/master:drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.=
c:static struct omap_dss_driver acx565akm_ops =3D {
next/master:drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.=
c:static struct omap_dss_driver td028ttec1_ops =3D {
next/master:drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.=
c:static struct omap_dss_driver tpo_td043_ops =3D {

I already sent patches for the two networking drivers, we're discussing
the irqchip driver here and the omap2 framebuffer drivers are IMHO false
positives. I didn't look into the virtio_console driver, but I guess
that one is ok, too.

The clocksource driver is a bit more difficult, .probe() must be in
__init because it calls sched_clock_register() but using
platform_driver_probe() might not be easy. Markus currently fights with
a similar clocksource driver where the clocksource depends on an mbox
driver that is only probed later. In his case probing the schedclock
returns -EPROBE_DEFER but when the mbox driver is ready the device
cannot be reprobed again as the schedclock driver is already gone. Of
course the error message for -EPROBE_DEFER is suppressed, because that's
what you do for this type of message. So the machine dies with no
explaining output. We seem to have a yak to shave.

Best regards
Uwe

--wb3haxxcye6hb47p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhi6B8ACgkQj4D7WH0S
/k5JQQf+MvfGRxE8gLl5eR7R5qNYN5sF9MHnr+wSGkuroR1rSMVihuU155D+orSd
t4Ud10nk+nB4UFQYc5i2e85IC/OyC/m/R1CMpki7bPc2FKvqNPI4bm6mGgJVr3IF
vj/DAarV6NWnRMEP6ABxG+RoXSCf5Uyja+YTn3n1UBq6MhBtSyVcPrEOaFGgUACN
OkrR85nn5RBFh2iFaD588BGegm7dfYB0R60KSrHi0+IBki/eWEAA8DNBIunTFA4/
OfL1UJBsF6XY+KE1CBBkI/cJsq5TImh4Mz4tJX0/j1FzgA18xYnFGgXqjKhTVS/a
TmzUAtvre8NBZm6HJPFUQRJk6ZHbZA==
=tUHI
-----END PGP SIGNATURE-----

--wb3haxxcye6hb47p--

