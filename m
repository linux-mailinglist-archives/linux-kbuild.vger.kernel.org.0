Return-Path: <linux-kbuild+bounces-2779-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C31945338
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 21:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB1628239C
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 19:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2B11422D0;
	Thu,  1 Aug 2024 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHD9SGL5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88B1E4A6;
	Thu,  1 Aug 2024 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722540010; cv=none; b=A6bc3fYlWcCvvLpY1tbAI8pHou/JIX90dBv7hhAM9KdYO5UO+3nK59c4pldV8v0K5e2OqzpaqpGbx43KbZ6gS8j0/AluEzwdd4BkHWl14pPJtqT7xGtQR2evh2PRbmmXNy3qYwZmGWv+n8xJLH+0jzWuOMrjCKKB2b7oV+UQoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722540010; c=relaxed/simple;
	bh=fsTGNgIi475UBSTI/TvGiAWNgKFdGbRgzni70GZoeZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bg7uLca6bys88PazRdAiZivMo6M6LyC8QtpPieFDE1yMXfrUQs8esvHlMy/k49iINiFzxXQKuXVbsclJaYj8I/X9bb76INId2DyPMj4JjY2KFk9io61FwLUQAcTlclTFXBdQUwsWEKep2lBF+GZzIXG0/kWUNl/MH6Uu2uwTfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHD9SGL5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED39C32786;
	Thu,  1 Aug 2024 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722540010;
	bh=fsTGNgIi475UBSTI/TvGiAWNgKFdGbRgzni70GZoeZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHD9SGL5eM3znj99fa9tvbOncTHGc1WXGDW03nu1Zas2PqrpgKsjpvYCeI41TODu/
	 RDbO9S5mYKjpWXIGrOMOsL/jbs6ySsQNJxCZ6g0GEm4KfCBVJXITVzMAFhaD9aUph9
	 ykegKbGp0krF74E+DGHyPcLutE6MH/EDedbbgMK44biEoMuFNe8R9zble5hJRNfpCT
	 0gKgGmK9XvQVO4EC4m3scCtNSTWgQI5PWDjXlitsMOFL3BYi8CYaGPuA+gdWroZvHZ
	 3l71hlk7PJstn/HV/T68UCKhrSThLBB+nRfAs2G8WdEGuGQTBil+3QWlsi7hJF0+Zk
	 6nxh2i1QDl1Vg==
Date: Thu, 1 Aug 2024 12:20:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Jose Fernandez <jose.fernandez@linux.dev>,
	Christian Heusel <christian@heusel.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add debug package to pacman PKGBUILD
Message-ID: <20240801192008.GA3923315@thelio-3990X>
References: <20240801132945.47963-1-jose.fernandez@linux.dev>
 <20240801183637.GB122261@thelio-3990X>
 <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>

On Thu, Aug 01, 2024 at 08:53:54PM +0200, Thomas Weißschuh wrote:
> On 2024-08-01 11:36:37+0000, Nathan Chancellor wrote:
> > Hi Jose,
> > 
> > On Thu, Aug 01, 2024 at 07:29:40AM -0600, Jose Fernandez wrote:
> > > Add a new -debug package to the pacman PKGBUILD that will contain the
> > > vmlinux image for debugging purposes. This package depends on the
> > > -headers package and will be installed in /usr/src/debug/${pkgbase}.
> > > 
> > > The vmlinux image is needed to debug core dumps with tools like crash.
> > > 
> > > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> > 
> > This appears to add a non-trivial amount of time to the build when benchmarking
> > with Arch Linux's configuration (I measure 9% with hyperfine):
> 
> As nothing more is compiled, I guess this is just the additional
> packaging.
> 
> > Benchmark 1: pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too")
> >   Time (mean ± σ):     579.541 s ±  0.585 s    [User: 22156.731 s, System: 3681.698 s]
> >   Range (min … max):   578.894 s … 580.033 s    3 runs
> > 
> > Benchmark 2: pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")
> >   Time (mean ± σ):     633.419 s ±  0.972 s    [User: 22247.886 s, System: 3673.879 s]
> >   Range (min … max):   632.302 s … 634.070 s    3 runs
> > 
> > Summary
> >   pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too") ran
> >     1.09 ± 0.00 times faster than pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")
> > 
> > It would be nice to add some option to avoid building this package for
> > developers who may not want it (I know I personally would not want it
> > with that penalty because I do a lot of bisects) or maybe adding a
> > target to build this package with the rest like 'pacman-pkg-with-dbg' or
> > something? Also, couldn't vmlinux be obtained from vmlinuz that already
> > exists in the main package via scripts/extract-vmlinux?
> 
> Jose:
> 
> In the vanilla PKGBUILD vmlinux is part of the linux-headers package:
> linux-headers /usr/lib/modules/6.10.2-arch1-1/build/vmlinux
> 
> Given that you already gate the new -debug package on CONFIG_MODULES,
> why not add the file to that package?
> 
> Then we could still discuss if it makes sense to gate vmlinux on
> CONFIG_MODULES or if -headers should be enabled unconditionally again.

I think having -headers be enabled/built by default is probably okay
since a regular user/builder might have external modules that need to be
rebuilt against the new kernel. However, I (and likely many other
upstream developers, however many use Arch) never build external modules
against my kernels, so it would be nice to have some way to opt out of
this penalty. I suspect it is just compressing down such a massive
vmlinux that causes this? I have not had access to a build log with my
testing, so unsure.

> Or we wait for somebody to show up and ask for it.

I won't insist though so if we want to wait for someone else, that's
fine with me too.

> > Cheers,
> > Nathan
> > 
> > > ---
> > >  scripts/package/PKGBUILD | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > index 663ce300dd06..beda3db21863 100644
> > > --- a/scripts/package/PKGBUILD
> > > +++ b/scripts/package/PKGBUILD
> > > @@ -6,6 +6,7 @@ pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> > >  pkgname=("${pkgbase}" "${pkgbase}-api-headers")
> > >  if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> > >  	pkgname+=("${pkgbase}-headers")
> > > +	pkgname+=("${pkgbase}-debug")
> > >  fi
> > >  pkgver="${KERNELRELEASE//-/_}"
> > >  # The PKGBUILD is evaluated multiple times.
> > > @@ -89,6 +90,15 @@ _package-headers() {
> > >  	ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
> > >  }
> > >  
> > > +_package-debug(){
> > > +    pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
> > > +    depends=(${pkgbase}-headers)
> > > +
> > > +    cd "${objtree}"
> > > +    mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> > > +    install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
> > > +}
> > > +
> > >  _package-api-headers() {
> > >  	pkgdesc="Kernel headers sanitized for use in userspace"
> > >  	provides=(linux-api-headers)
> > > -- 
> > > 2.46.0
> > > 

