Return-Path: <linux-kbuild+bounces-711-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAE840BD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 17:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78684B23ED4
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 16:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A214159563;
	Mon, 29 Jan 2024 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSTjNExZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3CB1586CF;
	Mon, 29 Jan 2024 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546100; cv=none; b=mpepAgmGw+md2U0J7F8Wi/jG2WI3aaV0lqkET5gXKITANzE9hWpcHsJkYb9pemL9mQFlxErY043266tkW2PNUHC8+E7KTX/51eLo9CXKcB4OpV7md9XUmnXEJ2IvYY8kNX5ZglLceiaNco6WfyeFTIEKXZZdQpHj45G4q5K6/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546100; c=relaxed/simple;
	bh=Wu1OKNYbCiYgPJM2i8fejz4JjG575xDKZoC5YQd9GYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eudzmVFysv38Jc10RFyz1J2AnrSugqppmil5Yi/S+c5BFLzTlkaw/nC51eqcgQAxE60xeChEpcdMaxmeW4kZuXVSQfom2Fw/hNoXsk2XHiBd5OG8BbC5fgPHWIStV+rXUnvhGD0oo/SGWJokmqx1uYNB2J8+2ueMPexOqw1kd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSTjNExZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF00AC433C7;
	Mon, 29 Jan 2024 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706546099;
	bh=Wu1OKNYbCiYgPJM2i8fejz4JjG575xDKZoC5YQd9GYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSTjNExZ95GXA7MF8Qf06BC+taxVtRXstLf/pOMlFzsSrlrCKGGQ3wWZKvTOXYiTi
	 G2/MzX75J3zo3CU/uGFbipfqdho7oJMAvDlkgXtlM1qrEhAznZeDaJB8nIgSV5CnCw
	 1bIukPbM9um+u4MIAVn1r5grxaETugls45qtHsFCF3baMCYjRUWPG5MoO0F6Xcc74r
	 mKy3aNE14JemgVSKQ/yx74ftaH/rfMwRNbDCbn5Cpg438yvrnc1r1Lpi8n7HjJfm2Y
	 wcsB5e84HNCJsKCr6v9mfLhAWCDlYf6EeSLD0LJXGUcfMsCIVPIyEPK8zZyjvIdot7
	 6GlZMQnQVQqQA==
Date: Mon, 29 Jan 2024 16:34:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	masahiroy@kernel.org, nicolas@fjasle.eu, andy.chiu@sifive.com,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of
 tree LLVM
Message-ID: <20240129-unripe-pleading-d2753b766e88@spud>
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1q3FkTd2sMJG0Xcz"
Content-Disposition: inline
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>


--1q3FkTd2sMJG0Xcz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 10:32:10AM -0700, Nathan Chancellor wrote:
> Hi all,
>=20
> Eric reported that builds of LLVM with [1] (close to tip of tree) have
> CONFIG_AS_HAS_OPTION_ARCH=3Dn because the test for expected failure on
> invalid input has started succeeding.
>=20
> This Kconfig test was added because '.option arch' only causes an
> assembler warning when it is unsupported, rather than a hard error,
> which is what users of as-instr expect when something is unsupported.
>=20
> This can be resolved by turning assembler warnings into errors with
> '-Wa,--fatal-warnings' like we do with the compiler with '-Werror',
> which is what the first patch does. The second patch removes the invalid
> test, as the valid test is good enough with fatal warnings.
>=20
> I have diffed several configurations for the different architectures
> that use as-instr and I have found no issues.
>=20
> I think this could go in through either the kbuild or RISC-V tree with
> sufficient acks but I will let them fight over who takes it :)

I think RISC-V would be good, since building the vector crypto stuff
also needs this fix.

Tested-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--1q3FkTd2sMJG0Xcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbfTrgAKCRB4tDGHoIJi
0ob+AQDBwkCVj1DkP4muPEw8AsT7KZJY94Op0baq5wXjGDRNTAD/RCCqOlvMAubB
5ztb++AITl6EoOWcpOAJltxBK/wv2AQ=
=cmxz
-----END PGP SIGNATURE-----

--1q3FkTd2sMJG0Xcz--

