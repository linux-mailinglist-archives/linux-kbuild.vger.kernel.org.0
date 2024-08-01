Return-Path: <linux-kbuild+bounces-2777-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D29452D7
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 20:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B711F23FB7
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 18:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6664A13E04C;
	Thu,  1 Aug 2024 18:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmSQVc6X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2D31E4A6;
	Thu,  1 Aug 2024 18:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722537399; cv=none; b=N9yeul6xqRSFlM1okHZRs+U+McX5PwzxpB198xcLr50/vJTcpyZYMWIBf/QmpuN0Sa7kHFjMYClgx9eW6RnCXtc+fQXeWsN+84TyDuv2hkcHMuM8+7fMiBogq6kC8KEu3jua/Qc9ulMvchR3HlOu9rZRgStc1AeXJ3l1+SYxZf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722537399; c=relaxed/simple;
	bh=PeoHuoxmU9Q/WqbUqsTh9k/g5yBob05K8Y+HgyPeJec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Twz7WCvdlrQHuse5XlGzOA2SVHga8G45TLADNAjsf20og8j5ARUd5TjEGnOFtsDzx9P27eIC8lBAv2s63ZKThYGaa7QKJ6BXJ6PBUYLZd7xCwWW2zxZ8Pl+TApslMlQavjJQTuKzUa9k9Qwui4HDGvhyXs+BNBaw5WyMB9g8QI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmSQVc6X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DCFC4AF0D;
	Thu,  1 Aug 2024 18:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722537399;
	bh=PeoHuoxmU9Q/WqbUqsTh9k/g5yBob05K8Y+HgyPeJec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmSQVc6XlWxCal5GHsQ6T/EGPozO86XSG/FrX3kCbebBkQZmi34Bg88+LgRIseB+Q
	 oLLugfbpOeuu77IozWLBZHz/LPqvZ9XqaR08s99Kxxm56iqmyPHs/T0Nk4K4sZfskq
	 X0/9o0LgeAbJy8PnAtYBfXA0m7774l/QA1Y6sy54jd1hXEkfPXzdUJczpSkhNKd1Je
	 RDMuhA4zmOzNbUaOA0IIlHjod4c8j1SMr7u0f5xFi1cqpaucIoemEoJM2S5KpJGj7g
	 0GZXhuGtGQFSNccDjqz7ZQjJL8J43k1F3gbrHlActzHWDLinmaLpRrVN7/hq78Lna0
	 /XdhBy0/inT9Q==
Date: Thu, 1 Aug 2024 11:36:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add debug package to pacman PKGBUILD
Message-ID: <20240801183637.GB122261@thelio-3990X>
References: <20240801132945.47963-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240801132945.47963-1-jose.fernandez@linux.dev>

Hi Jose,

On Thu, Aug 01, 2024 at 07:29:40AM -0600, Jose Fernandez wrote:
> Add a new -debug package to the pacman PKGBUILD that will contain the
> vmlinux image for debugging purposes. This package depends on the
> -headers package and will be installed in /usr/src/debug/${pkgbase}.
> 
> The vmlinux image is needed to debug core dumps with tools like crash.
> 
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>

This appears to add a non-trivial amount of time to the build when benchmarking
with Arch Linux's configuration (I measure 9% with hyperfine):

Benchmark 1: pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too")
  Time (mean ± σ):     579.541 s ±  0.585 s    [User: 22156.731 s, System: 3681.698 s]
  Range (min … max):   578.894 s … 580.033 s    3 runs

Benchmark 2: pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")
  Time (mean ± σ):     633.419 s ±  0.972 s    [User: 22247.886 s, System: 3673.879 s]
  Range (min … max):   632.302 s … 634.070 s    3 runs

Summary
  pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too") ran
    1.09 ± 0.00 times faster than pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")

It would be nice to add some option to avoid building this package for
developers who may not want it (I know I personally would not want it
with that penalty because I do a lot of bisects) or maybe adding a
target to build this package with the rest like 'pacman-pkg-with-dbg' or
something? Also, couldn't vmlinux be obtained from vmlinuz that already
exists in the main package via scripts/extract-vmlinux?

Cheers,
Nathan

> ---
>  scripts/package/PKGBUILD | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 663ce300dd06..beda3db21863 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -6,6 +6,7 @@ pkgbase=${PACMAN_PKGBASE:-linux-upstream}
>  pkgname=("${pkgbase}" "${pkgbase}-api-headers")
>  if grep -q CONFIG_MODULES=y include/config/auto.conf; then
>  	pkgname+=("${pkgbase}-headers")
> +	pkgname+=("${pkgbase}-debug")
>  fi
>  pkgver="${KERNELRELEASE//-/_}"
>  # The PKGBUILD is evaluated multiple times.
> @@ -89,6 +90,15 @@ _package-headers() {
>  	ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
>  }
>  
> +_package-debug(){
> +    pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
> +    depends=(${pkgbase}-headers)
> +
> +    cd "${objtree}"
> +    mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> +    install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
> +}
> +
>  _package-api-headers() {
>  	pkgdesc="Kernel headers sanitized for use in userspace"
>  	provides=(linux-api-headers)
> -- 
> 2.46.0
> 

