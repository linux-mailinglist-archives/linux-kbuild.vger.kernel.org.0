Return-Path: <linux-kbuild+bounces-3051-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94458955129
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 21:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50E902854C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 19:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBB7824BB;
	Fri, 16 Aug 2024 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="j9IDgbA9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6061C27;
	Fri, 16 Aug 2024 19:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723834870; cv=none; b=QBiNQxKG+puupc4b8TuLsL5TtY8tUJOQYPeGYVaQ0zMDDawTHQPHsLH9p3Ugd5r7/4trK4ic7nJyfZfPRayOjKXkbpIYxumFxDMaVwKC1IWrGVHCKLYRszZhPXUtPiLex8i2zTEWSL6dTd/uKesJCYCSjDSAPhS0uqmN4Jhzj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723834870; c=relaxed/simple;
	bh=Y7iG7kndNsaQxhGLsSPmbX9+y172qeuvSpqwF//M2EM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=m0zP/4v8XwA4VQsS/THciwDCSHzrEOTYsHDjxPkcXoqGVXhMLJWS7pRfbvs0hg3Ez5xkgMVJRAh3ft2a3ErbybimX2ievKkL+PsU3j7aoEk+x6f8Ydr2tdYtoq51kwN+bHNcY0JjYZKdO48e6E0gVOTpcdBlZTx+/mmsToqqozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=j9IDgbA9; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723834864;
	bh=Y7iG7kndNsaQxhGLsSPmbX9+y172qeuvSpqwF//M2EM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=j9IDgbA9MFKnr14EpN0+AqQ3JPwF38iAPOiYlACxQtkHr9pj6/vo9taUIcQtgrC0J
	 N2sAVOgBUcD/2LjJ074u9S0g5BjWePv3kjUiT4ipnzc7Jeqx3b5mIhD3ESQghGVOZQ
	 oiOkjbNArBtCY8KDRPFDZ+NUOpBNGNkS3MhNAeTY=
Date: Fri, 16 Aug 2024 21:01:02 +0200 (GMT+02:00)
From: linux@weissschuh.net
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Message-ID: <72f2bb7f-8f4a-4dec-ae41-f87cef6182b3@weissschuh.net>
In-Reply-To: <20240816141844.1217356-2-masahiroy@kernel.org>
References: <20240816141844.1217356-1-masahiroy@kernel.org> <20240816141844.1217356-2-masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: pacman-pkg: do not override objtree
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <72f2bb7f-8f4a-4dec-ae41-f87cef6182b3@weissschuh.net>

Aug 16, 2024 16:18:56 Masahiro Yamada <masahiroy@kernel.org>:

> objtree is defined and exported by the top-level Makefile. I prefer
> not to override it.
>
> There is no need to pass the absolute pass of objtree. PKGBUILD can

s/pass/path/g

> detect it by itself.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by:=C2=A0 Thomas Wei=C3=9Fschuh <linux@weissschuh.net>


> ---
>
> scripts/Makefile.package | 3 +--
> scripts/package/PKGBUILD | 4 +++-
> 2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 4a80584ec771..2c261a0d42b0 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -147,8 +147,7 @@ snap-pkg:
> PHONY +=3D pacman-pkg
> pacman-pkg:
> =C2=A0=C2=A0=C2=A0 @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree=
)/PKGBUILD
> -=C2=A0=C2=A0 +objtree=3D"$(realpath $(objtree))" \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILDDIR=3D"$(realpath $(objtree))/=
pacman" \
> +=C2=A0=C2=A0 BUILDDIR=3D"$(realpath $(objtree))/pacman" \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CARCH=3D"$(UTS_MACHINE)" \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_MAKEFLAGS=3D"$(MAKEFLAG=
S)" \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_REVISION=3D"$(shell $(s=
rctree)/scripts/build-version)" \
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index e2d9c2601ca9..839cd5e634d2 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -40,7 +40,9 @@ _prologue() {
> =C2=A0=C2=A0=C2=A0 # MAKEFLAGS from makepkg.conf override the ones inheri=
ted from kbuild.
> =C2=A0=C2=A0=C2=A0 # Bypass this override with a custom variable.
> =C2=A0=C2=A0=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> -=C2=A0=C2=A0 cd "${objtree}"
> +
> +=C2=A0=C2=A0 # Kbuild works in the output directory, where this PKGBUILD=
 is located.
> +=C2=A0=C2=A0 cd "$(dirname "${BASH_SOURCE[0]}")"
> }
>
> build() {
> --
> 2.43.0


