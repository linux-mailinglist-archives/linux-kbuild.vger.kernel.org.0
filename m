Return-Path: <linux-kbuild+bounces-199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCBD7FE00A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 20:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619CC282A5E
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 19:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D894F374C8;
	Wed, 29 Nov 2023 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="WRYOue0L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B32519A5
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:02:23 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5cdc0b3526eso910987b3.1
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1701284542; x=1701889342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PcBKeJsKt+Roasz0v1naRUxWIOpYBtLfQ5xNPiC6TzM=;
        b=WRYOue0LYBINaOhdiCni9ywvTheDnT9AJz8e8BfJCIHjWXBMKRPobgdxaEZxTf8Oo9
         aYPhedOUEIkfExb6ZooTfAVms6Jpc4at5dSRvHGHRHSkbsLESS+yEr/+Tv3UpvL1PUSo
         Yq+3RjXDFIj0c2TzQwUOPnyXZPUbf4v7r20Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284542; x=1701889342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcBKeJsKt+Roasz0v1naRUxWIOpYBtLfQ5xNPiC6TzM=;
        b=Jj9p5K9LRicTlAMIaMq3cC8/X8KOwL7TvTMzDgUu0I/WR0mMktsko21X8/0zuwKxpT
         krGAnEhPDDluAUXMGdub2xrcR3BtKzCKgAtEvO4MxOlp8JSI25AC/Abe4IfmeViO2dA8
         fmLFIkCNX8bIW1xslGjmA/rLJVukwqDveTQ+yK/y/taWZJV08nyMuX9rXfvBV/Rse3c6
         mwZ5QS+253ybqXnZxtSxRSw0UQWDAI53rDCUYLGDsesTIkIIyy23LRJ1irJjGv/GmD7p
         pNHoBpQc23I/r+XllPuYSfp+Id4OHsJQOduBXbJLllg3sjAYad6CWTGCaWf2GXMjDUOo
         k00A==
X-Gm-Message-State: AOJu0Yw6sWtD5DWv9lpP0edOZblPVdY8eE1NWCtmX7OHByXa+lEtUmiH
	n76J0GfuwZX80aYF8T81rDnuyA==
X-Google-Smtp-Source: AGHT+IHzHkSwEXPTpHD57NNGdkBTndkGP7v7ThfK3Xt/uxEh/1wuIb2yMo1BQbLzKgaGrors4qyDxw==
X-Received: by 2002:a0d:dd48:0:b0:5ca:befc:a40d with SMTP id g69-20020a0ddd48000000b005cabefca40dmr15747142ywe.24.1701284542439;
        Wed, 29 Nov 2023 11:02:22 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-9fa4-b7c8-6a9a-173e.res6.spectrum.com. [2603:6081:7b00:6400:9fa4:b7c8:6a9a:173e])
        by smtp.gmail.com with ESMTPSA id gb12-20020a05690c408c00b005cf2d42a7b2sm3225892ywb.93.2023.11.29.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 11:02:22 -0800 (PST)
Date: Wed, 29 Nov 2023 14:02:20 -0500
From: Tom Rini <trini@konsulko.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>,
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v7 2/2] arm64: boot: Support Flat Image Tree
Message-ID: <20231129190220.GN2513409@bill-the-cat>
References: <20231129172200.430674-1-sjg@chromium.org>
 <20231129172200.430674-3-sjg@chromium.org>
 <30f32467-51ea-47de-a272-38e074f4060b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vJJLzijI2B35z7R9"
Content-Disposition: inline
In-Reply-To: <30f32467-51ea-47de-a272-38e074f4060b@pengutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett


--vJJLzijI2B35z7R9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 07:59:00PM +0100, Ahmad Fatoum wrote:
> Hi,
>=20
> a few more comments after decompiling the FIT image:
>=20
> On 29.11.23 18:21, Simon Glass wrote:
> > +    with fsw.add_node('kernel'):
> > +        fsw.property_string('description', args.name)
> > +        fsw.property_string('type', 'kernel_noload')
>=20
> The specification only says no loading done, but doesn't explain what it
> means for a bootloader to _not_ load an image. Looking into the U-Boot co=
mmit
> b9b50e89d317 ("image: Implement IH_TYPE_KERNEL_NOLOAD") that introduces t=
his,
> apparently no loading means ignoring load and entry address?
>=20
> I presume missing load and entry is something older U-Boot versions
> were unhappy about? Please let me know if the semantics are as I understo=
od,
> so I can prepare a barebox patch supporting it.

So the matching side for this series in U-Boot is:
https://patchwork.ozlabs.org/project/uboot/list/?series=3D382849&state=3D*

And in short, for IH_TYPE_KERNEL_NOLOAD we do our best to use it
in-place. For decompression we allocate some space to decompress to.

--=20
Tom

--vJJLzijI2B35z7R9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmVnirIACgkQFHw5/5Y0
tywO/Qv/c1oNc+/ouJBT1KN2K5RbgEALOt+sPZhysWelxhSqkcPlCjb5gfuJ7ajV
Ul6k85FSpkGagwKzxfHCIxhuhNRgNTJ5CQZCZ5MwXV/H8oWad0dUVVbIbcWwe11/
y9nWedxeH0poGkNULDIDQZr6d76QRvZjl631Xsz/jgTYlCXtTCin55blEo4d1oqL
L203Zw/qoqem8gHc3UEUcVBfudB3hKE5NVKarLqcbW179w0tnKnCTunDWC8+Hseh
FgcJ5m+x4xn4bkNkEiPZnVwhWFLsu90PAUY7SCGt1dyilThXE2WYoYGLULi3OeLz
3EzdtJkMPqy65I95k1+fAYBHaKN/EecR7nytt7XxP/8SE/N/Qt4R72L5Uf/CCjVs
WbPx6LV02Ig8z4F5sH3JXgaw3W0xrYWH7F9rhSbxGiWi7OAFosfXFsGTSbShpBuC
rKD+0n8q2yqyuPBpOOV18L33WCapVyvWwjf24ozKiUiaitcXvQ5REdRVp20/bhq8
55QIYmgN
=y4fu
-----END PGP SIGNATURE-----

--vJJLzijI2B35z7R9--

