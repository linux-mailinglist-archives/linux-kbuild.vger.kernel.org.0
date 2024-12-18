Return-Path: <linux-kbuild+bounces-5178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 519669F6A3D
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 16:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1B21887E3B
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 15:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957DA1B423D;
	Wed, 18 Dec 2024 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1/Oo8xQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC4AD2C;
	Wed, 18 Dec 2024 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734536433; cv=none; b=M012QPkgOZ1fMr2XHJHE9sq7GxBRs/gs2XvD/a0X7DjLArrAc0oq9CNET/URbnL9gVjntICi0LZ7vcUqHs2u6RsIlzyGs1WwXGsv11Cyugm590BpsmyZmGx19vhWEC1/dxyDEcb8nup+2biduj0gai8rCvZAt9f1nfuUx19DjUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734536433; c=relaxed/simple;
	bh=4UXu81Y9Z6hjel3iUJcWt8StxEyhWs1lo6Dz/EHQ+yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGTQFrHe1ENK9Gmel39RYj4Liy4Z4vhIBR85oqHXMSk6/hb+IX2fAyNyUZhmCuc1oRy9uUqgFi4MD/0o8GGBmt89C5ZbPV2Hdp7TIA/eANgNAfiKZuq1U/2708AOKAX5YDM7a277fLWElEQCxYTUduHOg19RrDamL/E3mVEG4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1/Oo8xQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D18C4CECD;
	Wed, 18 Dec 2024 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734536432;
	bh=4UXu81Y9Z6hjel3iUJcWt8StxEyhWs1lo6Dz/EHQ+yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1/Oo8xQwb3FjKZ40FzXuHkV25NXViji3iuyRSY1K3pm79LnJPPMtRYvGcghR5Ke6
	 mpfXSuMofaU0vyGOBnqjwmA+VDoTqhlFwIwC0ks85UskzFhO+J1HBF9wkWpIfvTtJC
	 vxixSau35Mwpa/kfmdYWBuvwMiPuFezpSu+Ov67L0K44hrzTjhubaJKaUCFsa6CwyE
	 iWKxLyoy7ZzqMXBNptPXDbbFeKEc8wlre1Jjeq4934+7S5VJmMRRjOtMEPJNvRDooI
	 al1KjmUO9FU7K3JXW/o73BchCjmtUk8w22xht9dNmVZ3O8bygSTAlIP6b0haUDdETC
	 O7bKoFUSJedPA==
Date: Wed, 18 Dec 2024 15:40:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: Check version of objdump
Message-ID: <20241218-hypnotic-acid-630e8a8d35da@spud>
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
 <20241218-sandfish-hence-5fa18539f7ca@spud>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LousDMB+Lw3TRXhr"
Content-Disposition: inline
In-Reply-To: <20241218-sandfish-hence-5fa18539f7ca@spud>


--LousDMB+Lw3TRXhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 03:14:46PM +0000, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 03:12:51PM -0800, Charlie Jenkins wrote:
> > Similar to ld-version, add a way to check the version of objdump. This
> > should most of the time end up being the binutils version or the llvm
> > version.
> >=20
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>=20
> This fails for allmodconfig and rv32_defconfig with clang. 19.1.1
> according to Bjorn :)

Some additional info from Bjorn:
https://paste.debian.net/1340410
and the steps to reproduce:
https://paste.debian.net/1340408

That should not be reporting 13.0.1, it should be 19.1.x, there's one
included in the toolchains we use from https://mirrors.edge.kernel.org/pub/=
tools/llvm/

13.0.1 looks like a host toolchain?

>=20
> Cheers,
> Conor.
>=20
> > ---
> >  init/Kconfig               | 10 +++++++
> >  scripts/Kconfig.include    |  6 ++++
> >  scripts/objdump-version.sh | 69 ++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 85 insertions(+)
> >=20
> > diff --git a/init/Kconfig b/init/Kconfig
> > index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..0b5d36f939e1de89c12ebdd=
61e4815015314d4f1 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -60,6 +60,16 @@ config LLD_VERSION
> >  	default $(ld-version) if LD_IS_LLD
> >  	default 0
> > =20
> > +config OBJDUMP_IS_GNU
> > +	def_bool $(success,test "$(objdump-name)" =3D objdump)
> > +
> > +config OBJDUMP_IS_LLVM
> > +	def_bool $(success,test "$(objdump-name)" =3D llvm-objdump)
> > +
> > +config OBJDUMP_VERSION
> > +	int
> > +	default $(objdump-version)
> > +
> >  config RUSTC_VERSION
> >  	int
> >  	default $(rustc-version)
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index 33193ca6e8030e659d6b321acaea1acd42c387a4..cb3e2d2564fea8cce780adb=
3be672c9596b7ccf2 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -58,6 +58,12 @@ $(error-if,$(success,test -z "$(ld-info)"),Sorry$(co=
mma) this linker is not supp
> >  ld-name :=3D $(shell,set -- $(ld-info) && echo $1)
> >  ld-version :=3D $(shell,set -- $(ld-info) && echo $2)
> > =20
> > +# Get the objdump name, version, and error out if it is not supported.
> > +objdump-info :=3D $(shell,$(srctree)/scripts/objdump-version.sh $(OBJD=
UMP))
> > +$(error-if,$(success,test -z "$(objdump-info)"),Sorry$(comma) this obj=
dump is not supported.)
> > +objdump-name :=3D $(shell,set -- $(objdump-info) && echo $1)
> > +objdump-version :=3D $(shell,set -- $(objdump-info) && echo $2)
> > +
> >  # machine bit flags
> >  #  $(m32-flag): -m32 if the compiler supports it, or an empty string o=
therwise.
> >  #  $(m64-flag): -m64 if the compiler supports it, or an empty string o=
therwise.
> > diff --git a/scripts/objdump-version.sh b/scripts/objdump-version.sh
> > new file mode 100755
> > index 0000000000000000000000000000000000000000..fa24f8dc2d3c42fd1195fce=
b3c96b27f7127db25
> > --- /dev/null
> > +++ b/scripts/objdump-version.sh
> > @@ -0,0 +1,69 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Print the objdump name and its version in a 5 or 6-digit form.
> > +# Also, perform the minimum version check.
> > +
> > +set -e
> > +
> > +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> > +get_canonical_version()
> > +{
> > +	IFS=3D.
> > +	set -- $1
> > +
> > +	# If the 2nd or 3rd field is missing, fill it with a zero.
> > +	#
> > +	# The 4th field, if present, is ignored.
> > +	# This occurs in development snapshots as in 2.35.1.20201116
> > +	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> > +}
> > +
> > +orig_args=3D"$@"
> > +
> > +# Get the first line of the --version output.
> > +IFS=3D'
> > +'
> > +set -- $(LC_ALL=3DC "$@" --version)
> > +
> > +# Split the line on spaces.
> > +IFS=3D' '
> > +set -- $1
> > +
> > +min_tool_version=3D$(dirname $0)/min-tool-version.sh
> > +
> > +if [ "$1" =3D GNU -a "$2" =3D objdump ]; then
> > +	shift $(($# - 1))
> > +	version=3D$1
> > +	min_version=3D$($min_tool_version binutils)
> > +	disp_name=3D"GNU objdump"
> > +else
> > +	while [ $# -gt 1 -a "$1" !=3D "LLVM" ]; do
> > +		shift
> > +	done
> > +
> > +	if [ "$1" =3D LLVM ]; then
> > +		version=3D$3
> > +		min_version=3D$($min_tool_version llvm)
> > +		disp_name=3D"llvm-objdump"
> > +	else
> > +		echo "$orig_args: unknown objdump" >&2
> > +		exit 1
> > +	fi
> > +fi
> > +
> > +version=3D${version%%[!0-9.]*}
> > +
> > +cversion=3D$(get_canonical_version $version)
> > +min_cversion=3D$(get_canonical_version $min_version)
> > +
> > +if [ "$cversion" -lt "$min_cversion" ]; then
> > +	echo >&2 "***"
> > +	echo >&2 "*** objdump is too old."
> > +	echo >&2 "***   Your $disp_name version:    $version"
> > +	echo >&2 "***   Minimum $disp_name version: $min_version"
> > +	echo >&2 "***"
> > +	exit 1
> > +fi
> > +
> > +echo objdump $cversion
> >=20
> > --=20
> > 2.34.1
> >=20
> >=20
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


--LousDMB+Lw3TRXhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2Ls6QAKCRB4tDGHoIJi
0kuDAQC+EaYIUlICW9MBqdDryPPH7cCjqTfIFcmueFHN4mEhhQEA28HuCVuS/lMp
gmsNZmbDpAA/hZMA5yOmrmxoUxE+qwg=
=XJPD
-----END PGP SIGNATURE-----

--LousDMB+Lw3TRXhr--

