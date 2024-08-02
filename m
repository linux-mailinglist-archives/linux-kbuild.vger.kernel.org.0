Return-Path: <linux-kbuild+bounces-2782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1441B945710
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 06:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37EDC1C23219
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 04:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446CC1C6B2;
	Fri,  2 Aug 2024 04:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OSfU5Tme"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D931C698
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Aug 2024 04:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722572877; cv=none; b=SNuLWMv8/PBJUzNuV3rP2xD1t1EwKiR1z5jTdA6V3DdDQNXQJGs3OVghKkr1Gkk7Q/xYXHgmU8pTGiI5acuOEkPGuTGwCcW9F+MVviAvbWsazUSeAiDHgt0lzyTbZz89vQmlHXvoIQcNHdbmi182sMAVSvEidoJkhZBC0u/E5G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722572877; c=relaxed/simple;
	bh=segjT1OG7E5eb5HHo0lBbw0RZphPoLaVe94DJZS0J9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHD/B+KKIUZMPEV08MBLO6skTWv0qLX+PZmoBNfrLflUREd6fEIc4srhdxd32y9G5646/ycNFOU18yNpXByTKmyGaqCL/nWfwLxV64f+A6JtMDg0VfUAMs3IYV8BW+8FCjYRB09wQHIdAmO7r2gqFkZFvdTORflfyOEQFXwJk7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OSfU5Tme; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 1 Aug 2024 22:27:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722572871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddgK842BSf2obsATdY84g5niktNqv3czZvKQJLs7va8=;
	b=OSfU5Tme6J5m9yLp4gmreIoUlLmygZXsYUa8wjwC7ZiveR4LKQINZJqKG7neWSNoSyGdCZ
	yG5rsB5C3+6olxsgV/QhR88de9eIijmxC3KJjwAg0kh7KQim98L69kfPScmu7SYNpUFj5F
	o7C7Qy4rJTJVXVMruVRXTYXO/UZKK18=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Christian Heusel <christian@heusel.eu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add debug package to pacman PKGBUILD
Message-ID: <b3phqbeo6twxkoxxmx7yxpas5egjdqcfxvaabub5wvlal373q7@jt4rhvwdiqsn>
References: <20240801132945.47963-1-jose.fernandez@linux.dev>
 <20240801183637.GB122261@thelio-3990X>
 <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>
 <20240801192008.GA3923315@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240801192008.GA3923315@thelio-3990X>
X-Migadu-Flow: FLOW_OUT

On 24/08/01 12:20PM, Nathan Chancellor wrote:
> On Thu, Aug 01, 2024 at 08:53:54PM +0200, Thomas Weißschuh wrote:
> > On 2024-08-01 11:36:37+0000, Nathan Chancellor wrote:
> > > Hi Jose,
> > > 
> > > On Thu, Aug 01, 2024 at 07:29:40AM -0600, Jose Fernandez wrote:
> > > > Add a new -debug package to the pacman PKGBUILD that will contain the
> > > > vmlinux image for debugging purposes. This package depends on the
> > > > -headers package and will be installed in /usr/src/debug/${pkgbase}.
> > > > 
> > > > The vmlinux image is needed to debug core dumps with tools like crash.
> > > > 
> > > > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > > > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> > > 
> > > This appears to add a non-trivial amount of time to the build when benchmarking
> > > with Arch Linux's configuration (I measure 9% with hyperfine):
> > 
> > As nothing more is compiled, I guess this is just the additional
> > packaging.
> > 
> > > Benchmark 1: pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too")
> > >   Time (mean ± σ):     579.541 s ±  0.585 s    [User: 22156.731 s, System: 3681.698 s]
> > >   Range (min … max):   578.894 s … 580.033 s    3 runs
> > > 
> > > Benchmark 2: pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")
> > >   Time (mean ± σ):     633.419 s ±  0.972 s    [User: 22247.886 s, System: 3673.879 s]
> > >   Range (min … max):   632.302 s … 634.070 s    3 runs
> > > 
> > > Summary
> > >   pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too") ran
> > >     1.09 ± 0.00 times faster than pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")


Hi Nathan,
Thanks for taking the time to benchmark the change. I did notice that the build 
time for the -debug package felt a bit longer than I expected. I attributed it
to having to package a large file.

> > > It would be nice to add some option to avoid building this package for
> > > developers who may not want it (I know I personally would not want it
> > > with that penalty because I do a lot of bisects) or maybe adding a
> > > target to build this package with the rest like 'pacman-pkg-with-dbg' or
> > > something? 

My original idea was to add a make config to enable the -debug package, ie:
`make pacman-pkg DEBUG=1`. Your suggestion of a separate target is also a good
idea. I don't have strong opinion on this, so I'm open to what you and Thomas
prefer.

> > > Also, couldn't vmlinux be obtained from vmlinuz that already
> > > exists in the main package via scripts/extract-vmlinux?

I didn't know you could do that. However, I suspect that more people will 
encounter this issue and will want the vmlinux file available without knowing
you can extract it from vmlinuz. I think it's better to have it available 
explicitly in a package.

> > 
> > Jose:
> > 
> > In the vanilla PKGBUILD vmlinux is part of the linux-headers package:
> > linux-headers /usr/lib/modules/6.10.2-arch1-1/build/vmlinux
> > 
> > Given that you already gate the new -debug package on CONFIG_MODULES,
> > why not add the file to that package?

Hi Thomas,
My only concern with that approach is that it won't address Nathan's concern
about increasing the build time. I think an opt-in -debug package is the best
solution to address this.

Additionally, Peter from CachyOS (cced) shared this merge request with me:
https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/merge_requests/3

It looks like the vanilla PKGBUILD will start including a debug package as well.
I think it may be good to align with the pattern they will be using.

> > 
> > Then we could still discuss if it makes sense to gate vmlinux on
> > CONFIG_MODULES or if -headers should be enabled unconditionally again.
> 
> I think having -headers be enabled/built by default is probably okay
> since a regular user/builder might have external modules that need to be
> rebuilt against the new kernel. However, I (and likely many other
> upstream developers, however many use Arch) never build external modules
> against my kernels, so it would be nice to have some way to opt out of
> this penalty. I suspect it is just compressing down such a massive
> vmlinux that causes this? I have not had access to a build log with my
> testing, so unsure.
> 
> > Or we wait for somebody to show up and ask for it.
> 
> I won't insist though so if we want to wait for someone else, that's
> fine with me too.

I will lean on your preference for how to proceed with this. I'm happy to make
the changes you think are best. To me, it appears that the next iteration to 
satisfy everyone is to make the -debug package opt-in via a new make target or
a make config option.

Thanks,
Jose

> 
> > > Cheers,
> > > Nathan
> > > 
> > > > ---
> > > >  scripts/package/PKGBUILD | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > > index 663ce300dd06..beda3db21863 100644
> > > > --- a/scripts/package/PKGBUILD
> > > > +++ b/scripts/package/PKGBUILD
> > > > @@ -6,6 +6,7 @@ pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> > > >  pkgname=("${pkgbase}" "${pkgbase}-api-headers")
> > > >  if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> > > >  	pkgname+=("${pkgbase}-headers")
> > > > +	pkgname+=("${pkgbase}-debug")
> > > >  fi
> > > >  pkgver="${KERNELRELEASE//-/_}"
> > > >  # The PKGBUILD is evaluated multiple times.
> > > > @@ -89,6 +90,15 @@ _package-headers() {
> > > >  	ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
> > > >  }
> > > >  
> > > > +_package-debug(){
> > > > +    pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
> > > > +    depends=(${pkgbase}-headers)
> > > > +
> > > > +    cd "${objtree}"
> > > > +    mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> > > > +    install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
> > > > +}
> > > > +
> > > >  _package-api-headers() {
> > > >  	pkgdesc="Kernel headers sanitized for use in userspace"
> > > >  	provides=(linux-api-headers)
> > > > -- 
> > > > 2.46.0
> > > > 

