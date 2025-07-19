Return-Path: <linux-kbuild+bounces-8073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A493B0B1B7
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 22:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E542D3BF95A
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 20:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4BA21FF27;
	Sat, 19 Jul 2025 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6DY8u0Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8071422DD;
	Sat, 19 Jul 2025 20:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752955807; cv=none; b=WBWQspMXHCJued9YuSq8RLKBO9oFOJxA8znZtJxWIzB+9tW8jMO91WjoW6guNLPlhrh+IyiOjZBKxoV1LOP8cpCdyyRwYYuYCmEs6SgYCfMuPr/jmTst6oWo9LzpnGeS8KZC0/Qz4bTBikDFxQOk4dG0+s7QeC7loDFkl68MV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752955807; c=relaxed/simple;
	bh=Cq/LZcfPIbL/5x2NRYTCVuvf5o76InLZt0XHgDULnG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuwW3A9xMFEsBDuu5Jqk93D4BssRqYaoTLYQx7YUwdnaeY90yPIJFlTE3wceUdnG65mL7Rjw8EVmsTQUriNbGsToC/Ww2rch77dbg+r62cWl1ayjFRbU7pSdUkS4VI6ZE4wN18SnDVwQzDKiXI9oAmlDDUo/RnouxkU+Vkad9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6DY8u0Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2B1C4CEE3;
	Sat, 19 Jul 2025 20:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752955806;
	bh=Cq/LZcfPIbL/5x2NRYTCVuvf5o76InLZt0XHgDULnG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6DY8u0Z2f+wbChxlRb55lieHl3end2LOuOTRP1IHOJsUAAq7e9zh7nXPM5gOJdLl
	 2qeDqM0tMurCwewKqJE9QQ0xWR6Ph9PDGej4xcUAsTew9J/1xSenT8nynZICPc2MFS
	 3YPEFpFX1MuPA3psIsJPQMVcbvcMys9y2/A+GXCGf7h06PnUz8GG9yFyIRQl97OGuN
	 gfKq/HpSgedtH+pEi1PLVzOdGKehiJFWA3Z2d97Vdu3ir/P5+4fBEixYZfcXwaQRdd
	 OQWaxH/ARl3ajEuYlfd1EYZ7D1x7LH76BIeeBvXoc6JaDMCHAdzGCVkHEagfFh3drV
	 H3atKFerHxR9A==
Date: Sat, 19 Jul 2025 16:10:02 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	=?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kheaders: make it possible to override TAR
Message-ID: <20250719201002.GA3285766@ax162>
References: <20230412082743.350699-1-mgorny@gentoo.org>
 <277557da458c5fa07eba7d785b4f527cc37a023f.1752938644.git.sam@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <277557da458c5fa07eba7d785b4f527cc37a023f.1752938644.git.sam@gentoo.org>

On Sat, Jul 19, 2025 at 04:24:05PM +0100, Sam James wrote:
> From: Michał Górny <mgorny@gentoo.org>
> 
> Commit 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226 ("kheaders: make headers
> archive reproducible") introduced a number of options specific to GNU
> tar to the `tar` invocation in `gen_kheaders.sh` script.  This causes
> the script to fail to work on systems where `tar` is not GNU tar.  This
> can occur e.g. on recent Gentoo Linux installations that support using
> bsdtar from libarchive instead.
> 
> Add a `TAR` make variable to make it possible to override the tar
> executable used, e.g. by specifying:
> 
>   make TAR=gtar
> 
> Link: https://bugs.gentoo.org/884061
> Reported-by: Sam James <sam@gentoo.org>
> Tested-by: Sam James <sam@gentoo.org>
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Michał Górny <mgorny@gentoo.org>
> Signed-off-by: Sam James <sam@gentoo.org>
> ---

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I assume that other places that call tar within the build process are
not problematic because they do not use GNU specific options, such as
scripts/Makefile.package and scripts/package/install-extmod-build, or
maybe that people just have not tried building those packages with
bsdtar?

> v3: Rebase, cover more tar instances.
> 
>  Makefile               | 3 ++-
>  kernel/gen_kheaders.sh | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c09766beb7eff..22d6037d738fe 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -543,6 +543,7 @@ LZMA		= lzma
>  LZ4		= lz4
>  XZ		= xz
>  ZSTD		= zstd
> +TAR		= tar
>  
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>  		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
> @@ -622,7 +623,7 @@ export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> -export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> +export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD TAR
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS KBUILD_PROCMACROLDFLAGS LDFLAGS_MODULE
>  export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS
>  
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index c9e5dc068e854..bb609a9ed72b4 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -66,13 +66,13 @@ if [ "$building_out_of_srctree" ]; then
>  		cd $srctree
>  		for f in $dir_list
>  			do find "$f" -name "*.h";
> -		done | tar -c -f - -T - | tar -xf - -C "${tmpdir}"
> +		done | ${TAR:-tar} -c -f - -T - | ${TAR:-tar} -xf - -C "${tmpdir}"
>  	)
>  fi
>  
>  for f in $dir_list;
>  	do find "$f" -name "*.h";
> -done | tar -c -f - -T - | tar -xf - -C "${tmpdir}"
> +done | ${TAR:-tar} -c -f - -T - | ${TAR:-tar} -xf - -C "${tmpdir}"
>  
>  # Always exclude include/generated/utsversion.h
>  # Otherwise, the contents of the tarball may vary depending on the build steps.
> @@ -88,7 +88,7 @@ xargs -0 -P8 -n1 \
>  rm -f "${tmpdir}.contents.txt"
>  
>  # Create archive and try to normalize metadata for reproducibility.
> -tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
> +${TAR:-tar} "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
>      --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
>      -I $XZ -cf $tarfile -C "${tmpdir}/" . > /dev/null
>  
> -- 
> 2.50.1
> 

