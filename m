Return-Path: <linux-kbuild+bounces-2823-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE289487BD
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 04:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 810CDB2407E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 02:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B595D40856;
	Tue,  6 Aug 2024 02:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvTDUVd+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4663CB;
	Tue,  6 Aug 2024 02:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722913135; cv=none; b=qFtQ8ey3OuyfdmrcccH6N8FpPy8bhdt3nGgWLKsdsnYTzVrcjTzBsdrzRRb6znOqFxc3fy4PYtC8oU2nhH3epyXBU288OJRpFYE4DnwlgoBvWZszguj9ZUNhjjtMLs7lgySEYY3/9Jp/ouzqbu9yGT5UG1I9l4CmWDRR2b2RkVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722913135; c=relaxed/simple;
	bh=X58WHt6Fh8FhmSI41u9K4I6aEokjQtj1VVSgk6cJ98Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zm23xsUv4Z4CUvvFMmrEqynLbaa5gv+QIKHEe3PpXiyXxCWbZQMcGnL/a9EuL61eN1UR2yijglBOqkUaaFLPj+gst78pyp2D3NFPHX2MPlHLOCLx6eNx55YGBXT9neg4wN7mQt60eqn11TF+ZOkF7+T5DMwts5r3kQ4Iv/Fntic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvTDUVd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A7EC4AF0D;
	Tue,  6 Aug 2024 02:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722913135;
	bh=X58WHt6Fh8FhmSI41u9K4I6aEokjQtj1VVSgk6cJ98Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvTDUVd+JKS81TYKSNog2yDXCLbryh4iwwYyZvfodVveaN3QgPT1SAUBDC9rKSXMH
	 lg0o5UK4Qh0gAfT6z2XyIgpzd3MNdnZbocWQ04wb+k0Zx6t8m2uh2M53Msj89fTnhO
	 j7k1//Z4i5psfR+qj2ZWETEx5FLK5Qqfre4gfevcNZsVPHNqLT5xI0kdQ+My37dR3+
	 y1vLmIjDyBkALLZRq3m3rgB7bgFnbcOZhqhD6AGP6/7xVEkxn97x5bUXM5cHsX1XwW
	 a32M+Ugg5Ktr4FAL3oiVF6p3ZaQqZsxzxHyka6x56iODddQqYtrpzqoxGvFPUFsYfu
	 wNd7zGhBOidNQ==
Date: Mon, 5 Aug 2024 19:58:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Christian Heusel <christian@heusel.eu>,
	Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <20240806025853.GB1570554@thelio-3990X>
References: <20240804000130.841636-1-jose.fernandez@linux.dev>
 <c41e3856-29f4-438f-a796-43aa957215d1@t-8ch.de>
 <g5jex6hwlsjwzryo5umw44uotww54h6ccjzzqk3fao5k3ig7df@yg2vhcxr5t6s>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <g5jex6hwlsjwzryo5umw44uotww54h6ccjzzqk3fao5k3ig7df@yg2vhcxr5t6s>

On Mon, Aug 05, 2024 at 04:30:15PM -0600, Jose Fernandez wrote:
> On 24/08/05 04:01PM, Thomas Weißschuh wrote:
> > > This changes the behavior of the pacman-pkg target to only create the
> > > main kernel package by default. The rest of the packages will be opt-in
> > > going forward.
> > 
> > I had the impression that by default all extrapackages should be
> > built. The variable can then be used by expert users where needed.
> > Other Opinions?
> 
> I think switching to defaulting to all packages is a good idea. One concern I 
> had was how regular users would discover the customization options. Expert users
> will likely look at the Makefile and figure out how to opt out.

I think that most users will likely want all of the packages built by
default. I think leaving this to be discovered by power users in the
Makefile is reasonable.

> > > In a previous patch, there was concern that adding a new debug package
> > > would increase t.he package time. To address this concern and provide
> > > more flexibility, this change has been added to allow users to decide
> > > which extra packages to include before introducing an optional debug
> > > package [1].
> > 
> > This paragraph seems like it shouldn't be part of the final commit.
> > If you put it after a line with "---" it will be dropped from the
> > commit, like so:
> > 
> > ---
> > 
> > In a previous patch, ...
> 
> Agreed, I will move this paragraph to below --- for v2.
> 
> > 
> > > 
> > > [1] https://lore.kernel.org/lkml/20240801192008.GA3923315@thelio-3990X/T/
> > > 
> > > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> > > ---
> > >  scripts/Makefile.package |  5 +++++
> > >  scripts/package/PKGBUILD | 11 ++++++++---
> > >  2 files changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > > index 4a80584ec771..146e828cb4f1 100644
> > > --- a/scripts/Makefile.package
> > > +++ b/scripts/Makefile.package
> > > @@ -144,6 +144,10 @@ snap-pkg:
> > >  # pacman-pkg
> > >  # ---------------------------------------------------------------------------
> > >  
> > > +# Space-separated list of extra packages to build
> > > +# The available extra packages are: headers api-headers
> > > +PACMAN_EXTRAPACKAGES ?=
> > 
> > The assignment doesn't do anything.
> > Do we need the documentation if the default enables all subpackages?
> > 
> > > +
> > >  PHONY += pacman-pkg
> > >  pacman-pkg:
> > >  	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> > > @@ -152,6 +156,7 @@ pacman-pkg:
> > >  		CARCH="$(UTS_MACHINE)" \
> > >  		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> > >  		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
> > > +		PACMAN_EXTRAPACKAGES="$(PACMAN_EXTRAPACKAGES)" \
> > 
> > This line is superfluous.
> 
> Ack.

Is it superfluous if PACMAN_EXTRAPACKAGES is not exported to makepkg? If
I remove this while changing the default of PACMAN_EXTRAPACKAGES in
scripts/Makefile.package, its value is not visible in makepkg, so only
the default package gets built. I think

  export PACMAN_EXTRAPACKAGES

is needed after the '?=' assignment line.

> > >  		makepkg $(MAKEPKGOPTS)
> > >  
> > >  # dir-pkg tar*-pkg - tarball targets
> > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > index 663ce300dd06..41bd0d387f0a 100644
> > > --- a/scripts/package/PKGBUILD
> > > +++ b/scripts/package/PKGBUILD
> > > @@ -3,10 +3,15 @@
> > >  # Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > >  
> > >  pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> > > -pkgname=("${pkgbase}" "${pkgbase}-api-headers")
> > > -if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> > > -	pkgname+=("${pkgbase}-headers")
> > > +pkgname=("${pkgbase}")
> > > +
> > > +_extrapackages=${PACMAN_EXTRAPACKAGES:-}
> > > +if [ -n "$_extrapackages" ]; then
> > 
> > No need for this check. The loop over an empty variable work fine.
> 
> Ack. Will update in v2.
>  
> > > +	for pkg in $_extrapackages; do
> > > +		pkgname+=("${pkgbase}-$pkg")
> > 
> > Use consistent variable references: "${pkgbase}-${pkg}"
> 
> Ack. Will update in v2.
> 
> > > +	done
> > >  fi
> > > +
> > >  pkgver="${KERNELRELEASE//-/_}"
> > >  # The PKGBUILD is evaluated multiple times.
> > >  # Running scripts/build-version from here would introduce inconsistencies.
> > > -- 
> > > 2.46.0
> > > 

