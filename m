Return-Path: <linux-kbuild+bounces-6068-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D8A5CF22
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BB3B17853D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B115262D37;
	Tue, 11 Mar 2025 19:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2z7xqHD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F721F03F2;
	Tue, 11 Mar 2025 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720745; cv=none; b=cNaRLcI3pT4H6VnfKBvF40rpjeK8LF0AsWyKPa64ngBkyAnN35zgPGDkevyaEf0c8sapXvEOWqNffk1pJp75i7tDMB4kh89UsC9p5ETIyE2FOZ8eFLYtpqa+Kf4hnXnfj7BYgGhuFhDs5jyH9oHmjQWTnLPo4IwSlnOfL8eC2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720745; c=relaxed/simple;
	bh=3d/S8WxmyjbwsOGzzvQQBkHzXVau/+4/fPLg8CUftHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWmk9XAqwvnekbM+GvxKuCw4cNT5wiXFrEW6R5BsTWIs/w0R8/gJGgGvOofHfjy0J9XtL6w8gSxD6aNeJ22a5O79/yRYiBN9BDamVExFW5d7/m62AIoMNAAXCe8WzLVbYeS6TskZghFMdYFngjfICr14OSoZEuQzfjerbIRG9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2z7xqHD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C668C4CEE9;
	Tue, 11 Mar 2025 19:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741720744;
	bh=3d/S8WxmyjbwsOGzzvQQBkHzXVau/+4/fPLg8CUftHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2z7xqHDFF+s71everhZkMQeIXs8UTcaRdSt5W9X9qPZN0ogQ30bB0ApqkhZIqJ2E
	 fltp0iaW3juz1DHBe6SL4EqH1eD6IzS2DmmOXWKCykrvPR6FRY9GsxSTqvtABg7Bbj
	 ruBBtWub1a+YgN1LG0x2gfMA/RVkKpU6G8DuqY+6v+HRank9USMYcGV88uBbtp4xeF
	 TpgM5+xTL70FkiwzMD9azHZas4qjDcLRcG7/OqRKeLDgVB161L/OTg4kk7Mkq0AC9b
	 tJFMaIEPdHEEx6MCo5D/7aCvWW36StLvtCe4O8wVoWNJ00lP1dGFva49lLDxAMwec1
	 o/jkkgfjf0Nfw==
Date: Tue, 11 Mar 2025 20:19:00 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: deb-pkg: remove "version" variable in mkdebian
Message-ID: <20250311191900.GB1958594@ax162>
References: <20250311190238.634226-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311190238.634226-1-masahiroy@kernel.org>

On Wed, Mar 12, 2025 at 04:02:24AM +0900, Masahiro Yamada wrote:
> ${version} and ${KERNELRELEASE} are the same.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Always love less indirection.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/package/mkdebian | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 80ed96561993..6685d13737c1 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -163,7 +163,6 @@ while [ $# -gt 0 ]; do
>  done
>  
>  # Some variables and settings used throughout the script
> -version=$KERNELRELEASE
>  if [ "${KDEB_PKGVERSION:+set}" ]; then
>  	packageversion=$KDEB_PKGVERSION
>  else
> @@ -222,11 +221,11 @@ Build-Depends-Arch: bc, bison, flex,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/
>  
> -Package: $packagename-$version
> +Package: $packagename-${KERNELRELEASE}
>  Architecture: $debarch
> -Description: Linux kernel, version $version
> +Description: Linux kernel, version ${KERNELRELEASE}
>   This package contains the Linux kernel, modules and corresponding other
> - files, version: $version.
> + files, version: ${KERNELRELEASE}.
>  EOF
>  
>  if [ "${SRCARCH}" != um ]; then
> @@ -245,11 +244,11 @@ EOF
>  if is_enabled CONFIG_MODULES; then
>  cat <<EOF >> debian/control
>  
> -Package: linux-headers-$version
> +Package: linux-headers-${KERNELRELEASE}
>  Architecture: $debarch
>  Build-Profiles: <!pkg.${sourcename}.nokernelheaders>
> -Description: Linux kernel headers for $version on $debarch
> - This package provides kernel header files for $version on $debarch
> +Description: Linux kernel headers for ${KERNELRELEASE} on $debarch
> + This package provides kernel header files for ${KERNELRELEASE} on $debarch
>   .
>   This is useful for people who need to build external modules
>  EOF
> @@ -259,11 +258,11 @@ fi
>  if is_enabled CONFIG_DEBUG_INFO; then
>  cat <<EOF >> debian/control
>  
> -Package: linux-image-$version-dbg
> +Package: linux-image-${KERNELRELEASE}-dbg
>  Section: debug
>  Architecture: $debarch
>  Build-Profiles: <!pkg.${sourcename}.nokerneldbg>
> -Description: Linux kernel debugging symbols for $version
> +Description: Linux kernel debugging symbols for ${KERNELRELEASE}
>   This package will come in handy if you need to debug the kernel. It provides
>   all the necessary debug symbols for the kernel and its modules.
>  EOF
> -- 
> 2.43.0
> 

