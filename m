Return-Path: <linux-kbuild+bounces-2895-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8F94AE45
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 18:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FAA51C2129A
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 16:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFDF12E1E9;
	Wed,  7 Aug 2024 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UbVzsaE0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD92F3E;
	Wed,  7 Aug 2024 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723048862; cv=none; b=R17Y3LofRhb/1KCTZOvNH9qs/giZxG3zUetsUcEB9On95IWuX+7E5HtDrrLjD/mKF1aBdJJN4fQlH3QBWr9c8yTjHqx0sNzai0TnYb4kfGosqH2qdqsG58KArB36utDWQq0eG6tzSxdtVZSAX9WMVcen2zqDvPJHZ09ak5HKsbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723048862; c=relaxed/simple;
	bh=uXEOf3hPjv5lg+rEOh+cX7HfJt0J2TPKDKBgmLlfsjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzKtqgQ3gCRW9DjwPLPuQRNgodW2tM33EyUgobO4D2ZH0DhK6AEnnP/abyVelWCMT05+uPFtAnx7GT+BiHwIg2HsZSmgFbUMCc2taFJGvDT6oF+JBBBnDsEWLk96chtsO+HgXofPEyE4MqxX235ImOvbIu/2tUswiXFFnMt4HQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UbVzsaE0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723048856;
	bh=uXEOf3hPjv5lg+rEOh+cX7HfJt0J2TPKDKBgmLlfsjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbVzsaE0QadDmzzPCTtfaKenZnw2AsLTlB4q34chBCUdPaUU3TvbTLCpNq9HiFvGh
	 RMhSkngZUTorsj2SVzDlV+JCLXHVcWlfes2eEV5mGJcD+ARcKT/9zIbapvmVMk0XXp
	 kYgGGmrl6k2mdYWedBz3Lu9z1F4PhEYKAEUUpnFU=
Date: Wed, 7 Aug 2024 18:40:55 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jose Fernandez <jose.fernandez@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Christian Heusel <christian@heusel.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <f65f1d49-8c6f-45e9-a4b2-30d4cfff10b1@t-8ch.de>
References: <20240807022718.24838-2-jose.fernandez@linux.dev>
 <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>

On 2024-08-07 22:37:47+0000, Masahiro Yamada wrote:
> On Wed, Aug 7, 2024 at 11:28 AM Jose Fernandez <jose.fernandez@linux.dev> wrote:
> >
> > Introduce a new variable, PACMAN_EXTRAPACKAGES, in the Makefile.package
> > to control the creation of additional packages by the pacman-pkg target.
> >
> > The headers and api-headers packages will be included by default if
> > PACMAN_EXTRAPACKAGES is not set. This changes the previous behavior
> > where api-headers was always included, and headers was conditionally
> > included if CONFIG_MODULES=y. Now, this decision is delegated to the
> > user.
> >
> > To disable extra packages, set PACMAN_EXTRAPACKAGES to an empty value:
> >
> > make pacman-pkg PACMAN_EXTRAPACKAGES=
> >
> > or
> >
> > make pacman-pkg PACMAN_EXTRAPACKAGES=""
> >
> > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> > ---
> > v1 -> v2: Build all extra packages by default. Remove unnecessary lines.
> 
> 
> I see only the main package built by default.

Same.

Do we even need PACMAN_EXTRAPACKAGES in the Makefile?
IMO having it in the PKGBUILD would be enough.
It can still be overriden from the commandline.

> >
> > In a previous patch, there was concern that adding a new debug package
> > would increase the package time. To address this concern and provide
> > more flexibility, this change has been added to allow users to decide
> > which extra packages to include before introducing an optional debug
> > package [1].
> >
> > [1] https://lore.kernel.org/lkml/20240801192008.GA3923315@thelio-3990X/T/
> >
> >  scripts/Makefile.package |  2 ++
> >  scripts/package/PKGBUILD | 11 +++++++----
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index 4a80584ec771..ccdf8ba41f0b 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -144,6 +144,8 @@ snap-pkg:
> >  # pacman-pkg
> >  # ---------------------------------------------------------------------------
> >
> > +PACMAN_EXTRAPACKAGES ?= headers api-headers
> 
> Meaningless line.
> 
> 
> Since 'export' is missing,
> this default line is not propagated to PKGBUILD.
> 
> 
> Nathan also mentioned 'export' would be needed if you wanted to
> describe this here.
> 
> https://lore.kernel.org/linux-kbuild/20240806025853.GB1570554@thelio-3990X/

Same as above.

> > +
> >  PHONY += pacman-pkg
> >  pacman-pkg:
> >         @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > index 663ce300dd06..8de869f9b1d4 100644
> > --- a/scripts/package/PKGBUILD
> > +++ b/scripts/package/PKGBUILD
> > @@ -3,10 +3,13 @@
> >  # Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> >
> >  pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> > -pkgname=("${pkgbase}" "${pkgbase}-api-headers")
> > -if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> > -       pkgname+=("${pkgbase}-headers")
> > -fi
> > +pkgname=("${pkgbase}")
> > +
> > +_extrapackages=${PACMAN_EXTRAPACKAGES:-}
> 
> 
> Instead of adding inconsistent defaults in two places,
> I would write like this:
> 
> _extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers}

Agreed.

> Lastly, I will never accept new error messages
> with CONFIG_MODULES=n.

Could you elaborate?
For me this works fine with CONFIG_MODULES=n.
(After having fixed the above issues so all subpackages are built)

> > +for pkg in $_extrapackages; do
> > +       pkgname+=("${pkgbase}-${pkg}")
> > +done
> > +
> >  pkgver="${KERNELRELEASE//-/_}"
> >  # The PKGBUILD is evaluated multiple times.
> >  # Running scripts/build-version from here would introduce inconsistencies.
> > --
> > 2.46.0

