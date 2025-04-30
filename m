Return-Path: <linux-kbuild+bounces-6806-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B04AA511A
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F03F987E5C
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 16:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4A225C711;
	Wed, 30 Apr 2025 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sB8gqRen"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8011DE884;
	Wed, 30 Apr 2025 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029041; cv=none; b=uwuRp5Kr1CHJJ67TEz5tKvgpN8tolZHHi0+oICKvwfu6tHFx5HPQ5XFv2gfyeB1LP6cDpdDab1NmCpM8/ZRaE5LtNgmw4bVLzsn2pVlp8NvqmxPPQNiwO/Eeep267TKO/59HtiHFGxedDEkbHjsW7e1FybUiwq+JP2PnFiuO+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029041; c=relaxed/simple;
	bh=DPAfK9Q4sCaXcWduwdjcJsXJ+HPSXe59br4DCXmhWiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1ir8HqovnPBCP2eiDbrGqyIh9rrFwkXNSHtFVsIpio7yxT0sB8Nt3RYpK26pC0edA/eOIGnyU/TGYuc3ccGfEAUuc+8w4BeU/30InJhMwY2Oao6WolB59XcRroCpIq+o5ANN1drHa+7wjeSftFx19s6ZMaKXpumVD/KEjrLRyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sB8gqRen; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB12C4CEE7;
	Wed, 30 Apr 2025 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746029040;
	bh=DPAfK9Q4sCaXcWduwdjcJsXJ+HPSXe59br4DCXmhWiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sB8gqRen/dKesCrMZ6b3LK2oW9nUTerb+KD1rlAXjWjsIGuML16EiwsBJWf2v5lMQ
	 x2SVVOsEhflg3XE5klKm2Gh02zz/L1JExr5Kb0GoUt3r3k//S2hnHkczxPYzQl5spf
	 ze3O/s1+21z3BwVk8azzIrg4MK4eutIa1HQkLKKHHcwU6W7n+NK5Eso+b5p2X7HWG4
	 +4UVR32EGGnhyknvHpID6s79hoPFkGEjNb+uyXWTbpuTapvHLq0yU1XHgZsMK+dga1
	 Xk2lzbN+RBi7JiQC2/wIYMWVWljuqsGZFwgXreinh2XQUIPJo44gxeG1cfh+95nEB5
	 dYFOylyiPmMlw==
Date: Wed, 30 Apr 2025 17:03:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, palmer@dabbelt.com
Subject: Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
Message-ID: <20250430-bronze-unsuited-3f47ce46d8d2@spud>
References: <20250311110616.148682-6-ardb+git@google.com>
 <20250311110616.148682-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/hDT1Nf/m/YMr9zi"
Content-Disposition: inline
In-Reply-To: <20250311110616.148682-9-ardb+git@google.com>


--/hDT1Nf/m/YMr9zi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Palmer

On Tue, Mar 11, 2025 at 12:06:20PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>=20
> The imperative paradigm used to build vmlinux, extract some info from it
> or perform some checks on it, and subsequently modify it again goes
> against the declarative paradigm that is usually employed for defining
> make rules.
>=20
> In particular, the Makefile.postlink files that consume their input via
> an output rule result in some dodgy logic in the decompressor makefiles
> for RISC-V and x86, given that the vmlinux.relocs input file needed to
> generate the arch-specific relocation tables may not exist or be out of
> date, but cannot be constructed using the ordinary Make dependency based
> rules, because the info needs to be extracted while vmlinux is in its
> ephemeral, non-stripped form.
>=20
> So instead, for architectures that require the static relocations that
> are emitted into vmlinux when passing --emit-relocs to the linker, and
> are subsequently stripped out again, introduce an intermediate vmlinux
> target called vmlinux.unstripped, and organize the reset of the build
> logic accordingly:
>=20
> - vmlinux.unstripped is created only once, and not updated again
> - build rules under arch/*/boot can depend on vmlinux.unstripped without
>   running the risk of the data disappearing or being out of date
> - the final vmlinux generated by the build is not bloated with static
>   relocations that are never needed again after the build completes.
>=20
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Delayed report since I have been slacking on my testing, but looks like
this has broken boot for me on riscv (mpfs-icicle-kit), no output after
"Starting kernel", defconfig should be:
https://raw.githubusercontent.com/ConchuOD/riscv-env/refs/heads/dev/conf/de=
fconfig
Toolchain is llvm 16. LMK if there's some salient info missing.

Cheers,
Conor.

--/hDT1Nf/m/YMr9zi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBJJ7AAKCRB4tDGHoIJi
0u+1AQDPrrfqcbFPHqZrRFANd8o5/dFFHmqp6Ivtzk5hJyBP7QEAh3L/HgSEy3Tq
UwujlNrETQdTL4U1YRjv9pEHtOSz7Q8=
=S5i4
-----END PGP SIGNATURE-----

--/hDT1Nf/m/YMr9zi--

