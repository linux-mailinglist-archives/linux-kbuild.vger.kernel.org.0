Return-Path: <linux-kbuild+bounces-3050-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A0955124
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 20:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63256285448
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 18:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059391C37AB;
	Fri, 16 Aug 2024 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KBG6p/Fe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CDB1C3789;
	Fri, 16 Aug 2024 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723834764; cv=none; b=Z7Go+UIg94ItTVhlKtLW9Ys1++LUlV1P5ax3jA+H6wNZMq/qTORbFjQbWfI7leByQgnFKyhKuTPn9fIwk+CZxD+H3PfaQEV6bkhKv2yVXBpyp1sz9qrVP9cyDb4xftpCDZrYu3CWVFwiIippHrWCvzhOQLWIS0Stslr8wEFsAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723834764; c=relaxed/simple;
	bh=IffeA0qv7mHvChcaHwrR1aeAckp41NYO2LPN4ZVKGbE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=if+sJWAJSc+m59kFcOorHhkHUenpehV+SVguA18ZzPFToHCS8lWzJ2o2WTGFeKmMYvdiksVgslFHsB8kZevKe+V4DAjTYD+rSMWWprspYycIRHdpWG+YdYNU46LtxBlQkIGM38xVFEWf1zbnkvfgDD5kI45gh0OVXNCOtgAh0w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KBG6p/Fe; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723834750;
	bh=IffeA0qv7mHvChcaHwrR1aeAckp41NYO2LPN4ZVKGbE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KBG6p/FepcTQ8OQIi8MC9D0pm+FmoM5rZBYDDHxTR2Osb/s1maq5GfA6vPgMOYXyr
	 uOfReO6hFdNqzeX1h76XqQ/YuZPxBiJ42UpjJrXU3luW0k2gELk/2xrcp75HBRoa+I
	 DYn+7lIuPdWDRCuAXpmgIc02oOoZ0Vf77XAcAzx8=
Date: Fri, 16 Aug 2024 20:59:10 +0200 (GMT+02:00)
From: linux@weissschuh.net
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Message-ID: <7d0ec58b-4704-4779-82ab-94ecdcbcd448@weissschuh.net>
In-Reply-To: <20240816141844.1217356-1-masahiroy@kernel.org>
References: <20240816141844.1217356-1-masahiroy@kernel.org>
Subject: Re: [PATCH 1/2] kbuild: pacman-pkg: move common commands to a
 separate function
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <7d0ec58b-4704-4779-82ab-94ecdcbcd448@weissschuh.net>

Aug 16, 2024 16:18:53 Masahiro Yamada <masahiroy@kernel.org>:

> All build and package functions share the following commands:
>
> =C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> =C2=A0 cd "${objtree}"
>
> Factor out the common code.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by:=C2=A0 Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

> ---
>
> scripts/package/PKGBUILD | 17 ++++++++++-------
> 1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index fbd7eb10a52c..e2d9c2601ca9 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -36,11 +36,15 @@ makedepends=3D(
> )
> options=3D(!debug !strip !buildflags !makeflags)
>
> -build() {
> +_prologue() {
> =C2=A0=C2=A0=C2=A0 # MAKEFLAGS from makepkg.conf override the ones inheri=
ted from kbuild.
> =C2=A0=C2=A0=C2=A0 # Bypass this override with a custom variable.
> =C2=A0=C2=A0=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> =C2=A0=C2=A0=C2=A0 cd "${objtree}"
> +}
> +
> +build() {
> +=C2=A0=C2=A0 _prologue
>
> =C2=A0=C2=A0=C2=A0 ${MAKE} KERNELRELEASE=3D"${KERNELRELEASE}" KBUILD_BUIL=
D_VERSION=3D"${pkgrel}"
> }
> @@ -48,10 +52,10 @@ build() {
> _package() {
> =C2=A0=C2=A0=C2=A0 pkgdesc=3D"The ${pkgdesc} kernel and modules"
>
> -=C2=A0=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> -=C2=A0=C2=A0 cd "${objtree}"
> =C2=A0=C2=A0=C2=A0 local modulesdir=3D"${pkgdir}/usr/${MODLIB}"
>
> +=C2=A0=C2=A0 _prologue
> +
> =C2=A0=C2=A0=C2=A0 echo "Installing boot image..."
> =C2=A0=C2=A0=C2=A0 # systemd expects to find the kernel here to allow hib=
ernation
> =C2=A0=C2=A0=C2=A0 # https://github.com/systemd/systemd/commit/edda44605f=
06a41fb86b7ab8128dcf99161d2344
> @@ -76,10 +80,10 @@ _package() {
> _package-headers() {
> =C2=A0=C2=A0=C2=A0 pkgdesc=3D"Headers and scripts for building modules fo=
r the ${pkgdesc} kernel"
>
> -=C2=A0=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> -=C2=A0=C2=A0 cd "${objtree}"
> =C2=A0=C2=A0=C2=A0 local builddir=3D"${pkgdir}/usr/${MODLIB}/build"
>
> +=C2=A0=C2=A0 _prologue
> +
> =C2=A0=C2=A0=C2=A0 if grep -q CONFIG_MODULES=3Dy include/config/auto.conf=
; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "Installing build files..=
."
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${srctree}/scripts/package/in=
stall-extmod-build" "${builddir}"
> @@ -100,8 +104,7 @@ _package-api-headers() {
> =C2=A0=C2=A0=C2=A0 provides=3D(linux-api-headers)
> =C2=A0=C2=A0=C2=A0 conflicts=3D(linux-api-headers)
>
> -=C2=A0=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> -=C2=A0=C2=A0 cd "${objtree}"
> +=C2=A0=C2=A0 _prologue
>
> =C2=A0=C2=A0=C2=A0 ${MAKE} headers_install INSTALL_HDR_PATH=3D"${pkgdir}/=
usr"
> }
> --
> 2.43.0


