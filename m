Return-Path: <linux-kbuild+bounces-2384-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63683927D9D
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 21:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 181E3286818
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 19:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CF9130A7C;
	Thu,  4 Jul 2024 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="zwMzpPZI";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="BX6VYiF4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1306F54660;
	Thu,  4 Jul 2024 19:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720120282; cv=none; b=FCC8x7my9gp+iGCM8hBUF3XG96eQgeEiYhxadkkfE3pMO1wHgW71mTvYALUf5ALDI4Jn0H1Zi3HH4lGnj/hyJv01G32UhkZp2D/V+TP5fuzKp8NZKRRMBxt41855AYWv/kLevz2crq71irydAnjVhVJXVzjIYJKV9QqwA6zPFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720120282; c=relaxed/simple;
	bh=MnR2VE8s4uHXYE8DuhV1RCcVEr+EVjp6DyGa4zUQluY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IcgrPhcedlVdgqfSoTabp+fmTk2xcvBoX6wtcq0YrGYbZBEWpe6W4RoG5+uEu+bAA71ZmCbeoWOYolPSBgvpmCD/WANvSOey07UrGVEORKbpOtApyqRWo/YysyVZdnO6Jt3KnrBBfhW+ziRoMPVMr8gJGCXmiejoFNv3Cg131II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=zwMzpPZI; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=BX6VYiF4; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Message-ID: <63c53ab962254e49d0eb3a67a067b48023d679b0.camel@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1720119771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnR2VE8s4uHXYE8DuhV1RCcVEr+EVjp6DyGa4zUQluY=;
	b=zwMzpPZIeyp7VXTvDo8R2elZXdMguX1hr/tzg5zx3N1mFuzvlmdPIDGSq/rpRP2pItteZ/
	yDi8wQSuPZd1aKN1UlaRBrs+qIYx9A0PNodLyLzplt5+O69nKQPWwGV5bznP1ndwPmAJaA
	o2I3XtpsKKlV0MHjZSU6F62vwwyWVVpkwTx9yo7/XbSIgsoaS57TfOrBgkrcordiTtrWWj
	/b0/Wp/rSnhNquF6OvNy5Vv1GMs7ivVTkl9Ni+Y8dXC5cFsLn/vKQXKxs2ZH7oxHr8KBur
	sT1iSxlnmeVJ6Cf5xRjm/SFBZUxE/8J+KxuRuFiYQULGsmx7kQLYIARP49B+goJxPkDou3
	UABfelJPvNRTeTikRZcGXpk3FwQ+1Sqf/Bqfmc2PJXybL3q1MtX84fmZ4GTD/PGLnq710u
	6CXvWRWw43KG+skOQA3zm8dCD3Dyw1b9TzdBkbNvKqNazyXIGmI+O/GkJWyG3IeoClN2Zv
	l3ix7G7MHpGRLRPEvpT2W/d1jp4/sbXxH49bA6uH+SV7WaEUFLhhrhBxmkll8eRti8U/lx
	ug9JOIb+UKE8s1vg9hDW4Ilr4RjdqsXpk1nJaJZO3J0KuVCRb04c5aH1TKF4uRJ7oX7cFr
	QSRA3OGMi/XAlb1GZtULmbPm1F/uctpNsRtthGvZD7UZenQMJdJVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1720119771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnR2VE8s4uHXYE8DuhV1RCcVEr+EVjp6DyGa4zUQluY=;
	b=BX6VYiF4kwI3+WUZ18I5WqDkgjIUDfyQWb7/GZ+w31moK2A0wPh/IIkR2dqzOl2pRKvXAG
	qnsAKuL0hpH0naDw==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=heftig smtp.mailfrom=heftig@archlinux.org
Subject: Re: [PATCH] kbuild: add script and target to generate pacman package
From: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Date: Thu, 04 Jul 2024 21:02:50 +0200
In-Reply-To: <20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net>
References: <20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-07-04 at 18:36 +0200, Thomas Wei=C3=9Fschuh wrote:
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> new file mode 100644
> index 000000000000..29daf357edc1
> --- /dev/null
> +++ b/scripts/package/PKGBUILD
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> +# Maintainer: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Nitpick: Normally these lines are sorted newest to oldest, with the
current maintainer(s) at the top.

> +
> +pkgbase=3Dlinux-upstream
> +pkgname=3D("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
> +pkgver=3D"${KERNELRELEASE//-/_}"
> +pkgrel=3D"$KBUILD_REVISION"
> +pkgdesc=3D'Linux'
> +url=3D'https://www.kernel.org/'
> +arch=3D("$UTS_MACHINE")
> +options=3D(!strip)

You should have !debug !strip here, otherwise makepkg can attempt (and
will fail) to gather source files, creating an empty
/usr/src/debug/$pkgbase.

Might also be worth considering !buildflags (to turn off injection of
CFLAGS etc) and !makeflags (to turn off injection of MAKEFLAGS).

> +license=3D(GPL-2.0-only)
> +
> +build() {
> +=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"

I think you can have this export at the top level instead of in each
function.

> +=C2=A0 cd "$objtree"
> +
> +=C2=A0 ${MAKE} -f "${srctree}/Makefile"
> +
> +}
> +
> +package_linux-upstream() {
> +=C2=A0 pkgdesc=3D"The $pkgdesc kernel and modules"
> +
> +=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> +=C2=A0 cd "$objtree"
> +=C2=A0 local modulesdir=3D"$pkgdir/usr/$MODLIB"
> +
> +=C2=A0 echo "Installing boot image..."
> +=C2=A0 # systemd expects to find the kernel here to allow hibernation
> +=C2=A0 # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7=
ab8128dcf99161d2344
> +=C2=A0 install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

An invocation of make that could also use ${MAKE} for consistency.

> +
> +=C2=A0 # Used by mkinitcpio to name the kernel
> +=C2=A0 echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
> +
> +=C2=A0 echo "Installing modules..."
> +=C2=A0 ${MAKE} INSTALL_MOD_PATH=3D"$pkgdir/usr" INSTALL_MOD_STRIP=3D1 \
> +=C2=A0=C2=A0=C2=A0 DEPMOD=3D/doesnt/exist modules_install=C2=A0 # Suppre=
ss depmod
> +
> +=C2=A0 # remove build link
> +=C2=A0 rm -f "$modulesdir/build"
> +}
> +
> +package_linux-upstream-headers() {
> +=C2=A0 pkgdesc=3D"Headers and scripts for building modules for the $pkgd=
esc kernel"
> +
> +=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> +=C2=A0 cd "$objtree"
> +=C2=A0 local builddir=3D"$pkgdir/usr/$MODLIB/build"
> +
> +=C2=A0 echo "Installing build files..."
> +=C2=A0 "$srctree/scripts/package/install-extmod-build" "$builddir"

Should we be using this script upstream as well instead of our
homegrown mess of install commands?

> +
> +=C2=A0 echo "Adding symlink..."
> +=C2=A0 mkdir -p "$pkgdir/usr/src"
> +=C2=A0 ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
> +}
> +
> +package_linux-upstream-api-headers() {
> +=C2=A0 pkgdesc=3D"Kernel headers sanitized for use in userspace"
> +=C2=A0 provides=3D(linux-api-headers)
> +=C2=A0 conflicts=3D(linux-api-headers)
> +
> +=C2=A0 export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> +=C2=A0 cd "$objtree"
> +
> +=C2=A0 ${MAKE} headers_install INSTALL_HDR_PATH=3D"$pkgdir/usr"
> +}
> +
> +# vim:set ts=3D8 sts=3D2 sw=3D2 et:


