Return-Path: <linux-kbuild+bounces-3666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1E97EB41
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 14:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3E8F1C20FE3
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 12:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02AB823AC;
	Mon, 23 Sep 2024 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="HKll8kdr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899AA433D6;
	Mon, 23 Sep 2024 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727093127; cv=none; b=CegKhKXz4oky9u7u+peMs5uZC/X7kXHxWyYgnLv80jmeKCdluA6ci7iPe/0hTOHx7it9ROEZKzKhcfbV3yRbIPlTU+F2aRlq0iubu5bE1gk7LNlSBaXAmrqhTGN/aftuIoYKTjHyoybgH/XC1Ex6UmXRBIqfwZdHKjHCX98KPrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727093127; c=relaxed/simple;
	bh=e6/cCkl9xt+sSAhW7MJqEIlIIHBhlH0yspIFy+Cgd60=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=lyhTE4uEqnWFz3wUCm9xNuZelggL/x4aD0RJrO9DfdeDaD+H49pVkO3IGPrT52sYie3RpBj6SMbaAL5jLg4SfEjRnqOyNn6ahm5WoZ32X6YjoCQ7h/ZN3TA4Q75RMuSyqKSvxLX8z3BDTCOBWgGsPlYUcKv0lrXv58W93M3gy2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=HKll8kdr; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1727093111;
	bh=e6/cCkl9xt+sSAhW7MJqEIlIIHBhlH0yspIFy+Cgd60=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=HKll8kdr8JeTpP9+fAjO87d06BuPszrfmhYVBj6izpnVsQPqW22ZmZPCY3b0hlbFM
	 KvpvuzmefTt86A7azqp1KKx1RYdPguV+Q5fFkkOmZmfEYgXdfgiUKUyAx2SuAVsa8R
	 hCLQ+sTGr0Pul8TQhI52Piq6vf2H/5DhsPgyV0as=
Date: Mon, 23 Sep 2024 14:05:08 +0200 (GMT+02:00)
From: linux@weissschuh.net
To: 1127955419@qq.com
Cc: christian@heusel.eu, nathan@kernel.org, masahiroy@kernel.org,
	nicolas@fjasle.eu, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, zachwade.k@gmail.com
Message-ID: <13565319-6dc6-4f15-ae02-3b3e760efa01@weissschuh.net>
In-Reply-To: <tencent_7DE03EC9AEAFF374BDAB9CCCF4C047EF2305@qq.com>
References: <tencent_7DE03EC9AEAFF374BDAB9CCCF4C047EF2305@qq.com>
Subject: Re: [PATCH] kbuild: add package-dbg to pacman packages
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <13565319-6dc6-4f15-ae02-3b3e760efa01@weissschuh.net>

Hi,

Sep 23, 2024 13:58:06 1127955419@qq.com:

> From: Li XingYang <1127955419@qq.com>
>
> The current pacman package does not include the debuginfo package
> add debuginfo package that include vmlinux
> vmlinux is very useful when debugging the kernel using crash

This is already implemented in
"kbuild: add debug package to pacman PKGBUILD"
which is in the kbuild tree.

https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/=
commit/?h=3Dkbuild&id=3D4929f5b95f6b20ae10f2c409fb2ca58253e73706

>
> Signed-off-by: Li XingYang <1127955419@qq.com>
> ---
> scripts/package/PKGBUILD | 14 +++++++++++++-
> 1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 663ce300dd06..4b5c435e5eaa 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -5,7 +5,7 @@
> pkgbase=3D${PACMAN_PKGBASE:-linux-upstream}
> pkgname=3D("${pkgbase}" "${pkgbase}-api-headers")
> if grep -q CONFIG_MODULES=3Dy include/config/auto.conf; then
> -=C2=A0=C2=A0 pkgname+=3D("${pkgbase}-headers")
> +=C2=A0=C2=A0 pkgname+=3D("${pkgbase}-headers" "${pkgbase}-dbg")
> fi
> pkgver=3D"${KERNELRELEASE//-/_}"
> # The PKGBUILD is evaluated multiple times.
> @@ -100,6 +100,18 @@ _package-api-headers() {
> =C2=A0=C2=A0=C2=A0 ${MAKE} headers_install INSTALL_HDR_PATH=3D"${pkgdir}/=
usr"
> }
>
> +_package-dbg() {
> +=C2=A0=C2=A0 pkgdesc=3D"debuginfo for the ${pkgdesc} kernel"
> +
> +=C2=A0=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> +=C2=A0=C2=A0 cd "${objtree}"
> +=C2=A0=C2=A0 local builddir=3D"${pkgdir}/usr/${MODLIB}/build"
> +=C2=A0=C2=A0 mkdir -p "${builddir}"
> +
> +=C2=A0=C2=A0 echo "Installing vmlinux..."
> +=C2=A0=C2=A0 cp vmlinux "${builddir}/vmlinux"
> +}
> +
> for _p in "${pkgname[@]}"; do
> =C2=A0=C2=A0=C2=A0 eval "package_$_p() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(declare -f "_package${_p#$pk=
gbase}")
> --
> 2.46.1


