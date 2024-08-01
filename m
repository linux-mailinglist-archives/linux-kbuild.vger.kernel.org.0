Return-Path: <linux-kbuild+bounces-2778-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEFE945307
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 20:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28C831C2152A
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 18:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F6E1465AB;
	Thu,  1 Aug 2024 18:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="EOLgAaFr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D393A143883;
	Thu,  1 Aug 2024 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722538450; cv=none; b=g6n/l6iurajewAJRkidoZ73Dd2qHmQQqxVQ0PeyQBniaAVQaRFRfqXUlgljfc09pUC1BozwC5A7oVSadRmn/3ygXBzc1CVKewepJIGhb1lGXDOoXmHjdR7mVJS35P5UYu9rhfirbuRrRchdc3pPEiN4AljNik2URhQ8RY3su+lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722538450; c=relaxed/simple;
	bh=vQ68Tu50ORkbkk0z4U6ZbmxtV7LgErua3b+hp17DI7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HavhokiSqe4m1tBjG1JyXhDhEoQYhlNxSyOhnFvOt4Ku3yhQC4StDZD8t71mQfA7a+VSL0GSf6LM3jTxupncKbfHckZzXa1FxmET/jMwsWhuIwlLc+2oFy5E62XHp+E1zXsBoQS4jUs+M+KIVgIUBoY2zvyWsyhpQhXCxS6ZFes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=EOLgAaFr; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722538434;
	bh=vQ68Tu50ORkbkk0z4U6ZbmxtV7LgErua3b+hp17DI7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOLgAaFrh7T1Vwqyl7+3xmT+OhZGCB6u/WYDyjaByBanZXzObHZuNGP1c5pWFNyb7
	 OMAJcYtpfukDT+voQAGVSvFi+iO5DbMIB1yax2J6Fw9qgLag6k9zh5rt3F9MLO1xye
	 06q7tzb1KZWivU2gJpaaiojhPrZUeE8q3z6K80og=
Date: Thu, 1 Aug 2024 20:53:54 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, 
	Jose Fernandez <jose.fernandez@linux.dev>
Cc: Christian Heusel <christian@heusel.eu>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add debug package to pacman PKGBUILD
Message-ID: <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>
References: <20240801132945.47963-1-jose.fernandez@linux.dev>
 <20240801183637.GB122261@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240801183637.GB122261@thelio-3990X>

On 2024-08-01 11:36:37+0000, Nathan Chancellor wrote:
> Hi Jose,
> 
> On Thu, Aug 01, 2024 at 07:29:40AM -0600, Jose Fernandez wrote:
> > Add a new -debug package to the pacman PKGBUILD that will contain the
> > vmlinux image for debugging purposes. This package depends on the
> > -headers package and will be installed in /usr/src/debug/${pkgbase}.
> > 
> > The vmlinux image is needed to debug core dumps with tools like crash.
> > 
> > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> 
> This appears to add a non-trivial amount of time to the build when benchmarking
> with Arch Linux's configuration (I measure 9% with hyperfine):

As nothing more is compiled, I guess this is just the additional
packaging.

> Benchmark 1: pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too")
>   Time (mean ± σ):     579.541 s ±  0.585 s    [User: 22156.731 s, System: 3681.698 s]
>   Range (min … max):   578.894 s … 580.033 s    3 runs
> 
> Benchmark 2: pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")
>   Time (mean ± σ):     633.419 s ±  0.972 s    [User: 22247.886 s, System: 3673.879 s]
>   Range (min … max):   632.302 s … 634.070 s    3 runs
> 
> Summary
>   pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too") ran
>     1.09 ± 0.00 times faster than pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")
> 
> It would be nice to add some option to avoid building this package for
> developers who may not want it (I know I personally would not want it
> with that penalty because I do a lot of bisects) or maybe adding a
> target to build this package with the rest like 'pacman-pkg-with-dbg' or
> something? Also, couldn't vmlinux be obtained from vmlinuz that already
> exists in the main package via scripts/extract-vmlinux?

Jose:

In the vanilla PKGBUILD vmlinux is part of the linux-headers package:
linux-headers /usr/lib/modules/6.10.2-arch1-1/build/vmlinux

Given that you already gate the new -debug package on CONFIG_MODULES,
why not add the file to that package?

Then we could still discuss if it makes sense to gate vmlinux on
CONFIG_MODULES or if -headers should be enabled unconditionally again.
Or we wait for somebody to show up and ask for it.

> Cheers,
> Nathan
> 
> > ---
> >  scripts/package/PKGBUILD | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > index 663ce300dd06..beda3db21863 100644
> > --- a/scripts/package/PKGBUILD
> > +++ b/scripts/package/PKGBUILD
> > @@ -6,6 +6,7 @@ pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> >  pkgname=("${pkgbase}" "${pkgbase}-api-headers")
> >  if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> >  	pkgname+=("${pkgbase}-headers")
> > +	pkgname+=("${pkgbase}-debug")
> >  fi
> >  pkgver="${KERNELRELEASE//-/_}"
> >  # The PKGBUILD is evaluated multiple times.
> > @@ -89,6 +90,15 @@ _package-headers() {
> >  	ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
> >  }
> >  
> > +_package-debug(){
> > +    pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
> > +    depends=(${pkgbase}-headers)
> > +
> > +    cd "${objtree}"
> > +    mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> > +    install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
> > +}
> > +
> >  _package-api-headers() {
> >  	pkgdesc="Kernel headers sanitized for use in userspace"
> >  	provides=(linux-api-headers)
> > -- 
> > 2.46.0
> > 

