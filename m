Return-Path: <linux-kbuild+bounces-2798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB816946A8A
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 18:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D03D0B20C15
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 16:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28768111AA;
	Sat,  3 Aug 2024 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wA5xlVN7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59765134A9
	for <linux-kbuild@vger.kernel.org>; Sat,  3 Aug 2024 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722703312; cv=none; b=JKijnW4uZdXC22HE9dyfsVARHxTy7E1UK1k0O5vEL6O7ob8VJXpUhREhDNIDvoLMjJb1RzaAprjNpuiYlc/qoyrkpJrj8MImlJHfRNsrQgMpAOeYS6t/QJ23xgJ2VRV9b2FBu93J5YBL1l4WGbMOSUot2DQccio+hxn7+sw8KOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722703312; c=relaxed/simple;
	bh=AIPHh3YY0b1E395k3ojag8Ih1w+NfKXvY9hUiy1FWGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcTkSEm21QjjCHXPFtLQmNrLh7aM2+IJsuwqQ6rzhSg/RM+MCu0R01qZUv8K9fW6v5lxNZw5KpuJRh9yO3dy+MO0TXuCwn8nuU72gWyhdPm5vSaq5em3Vu5qBXazAOKEllLMiI/rtba81NAmGHzHh3hAaaPmEyZH1XzyK3Q4/BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wA5xlVN7; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 3 Aug 2024 10:41:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722703306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZphFsshp0TTD8+qqLP9XBEJeiNlRL6TQA7BXs3ThRe0=;
	b=wA5xlVN7aZsUJZQFyy5AeOVhbNfJW4w9Y2fE6j7BIkJUPXiuMu5GBqObhuZiE+E1bI8htB
	5OSa50Y4nsBgSBgvMrQ4/3EZtcp2nTxPR2gtDlOZx9QhLWq5SxpgvQxsgS83AYN5rHlBtK
	0cFijPB1iNU3VLnzRznjHpj78FVks+w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Christian Heusel <christian@heusel.eu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add debug package to pacman PKGBUILD
Message-ID: <rqkzyzyii3ctwfve5l6bqdiza5b2m2macs44zkvrxwhuwy4e7c@q5d4pe7jh3la>
References: <20240801132945.47963-1-jose.fernandez@linux.dev>
 <20240801183637.GB122261@thelio-3990X>
 <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>
 <20240801192008.GA3923315@thelio-3990X>
 <b3phqbeo6twxkoxxmx7yxpas5egjdqcfxvaabub5wvlal373q7@jt4rhvwdiqsn>
 <8b5bc8ec-de33-45fe-964a-85a87947ccab@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b5bc8ec-de33-45fe-964a-85a87947ccab@t-8ch.de>
X-Migadu-Flow: FLOW_OUT

On 24/08/02 05:40PM, Thomas Weißschuh wrote:
> On 2024-08-01 22:27:45+0000, Jose Fernandez wrote:
> > On 24/08/01 12:20PM, Nathan Chancellor wrote:
> > > On Thu, Aug 01, 2024 at 08:53:54PM +0200, Thomas Weißschuh wrote:
> > > > On 2024-08-01 11:36:37+0000, Nathan Chancellor wrote:
> > > > > On Thu, Aug 01, 2024 at 07:29:40AM -0600, Jose Fernandez wrote:
> > > > > > Add a new -debug package to the pacman PKGBUILD that will contain the
> > > > > > vmlinux image for debugging purposes. This package depends on the
> > > > > > -headers package and will be installed in /usr/src/debug/${pkgbase}.
> > > > > > 
> > > > > > The vmlinux image is needed to debug core dumps with tools like crash.
> > > > > > 
> > > > > > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > > > > > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> > > > > 
> > > > > This appears to add a non-trivial amount of time to the build when benchmarking
> > > > > with Arch Linux's configuration (I measure 9% with hyperfine):
> > > > 
> > > > As nothing more is compiled, I guess this is just the additional
> > > > packaging.
> > > > 
> > > > > Benchmark 1: pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too")
> > > > >   Time (mean ± σ):     579.541 s ±  0.585 s    [User: 22156.731 s, System: 3681.698 s]
> > > > >   Range (min … max):   578.894 s … 580.033 s    3 runs
> > > > > 
> > > > > Benchmark 2: pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")
> > > > >   Time (mean ± σ):     633.419 s ±  0.972 s    [User: 22247.886 s, System: 3673.879 s]
> > > > >   Range (min … max):   632.302 s … 634.070 s    3 runs
> > > > > 
> > > > > Summary
> > > > >   pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too") ran
> > > > >     1.09 ± 0.00 times faster than pacman-pkg @ c5af4db0563b ("kbuild: add debug package to pacman PKGBUILD")
> > 
> > 
> > Hi Nathan,
> > Thanks for taking the time to benchmark the change. I did notice that the build 
> > time for the -debug package felt a bit longer than I expected. I attributed it
> > to having to package a large file.
> > 
> > > > > It would be nice to add some option to avoid building this package for
> > > > > developers who may not want it (I know I personally would not want it
> > > > > with that penalty because I do a lot of bisects) or maybe adding a
> > > > > target to build this package with the rest like 'pacman-pkg-with-dbg' or
> > > > > something? 
> > 
> > My original idea was to add a make config to enable the -debug package, ie:
> > `make pacman-pkg DEBUG=1`. Your suggestion of a separate target is also a good
> > idea. I don't have strong opinion on this, so I'm open to what you and Thomas
> > prefer.
> 
> I'm also in favor of a variable.
> The new target would be implemented through a variable anyways.
> Instead of a specific variable it should be more generic.
> The -api-headers package is most likely used even less than the debug one.
> 
> PACMAN_EXTRAPACKAGES="headers api-headers debug"
> (Assuming the main kernel package will always be built)

Thomas,
I will work a new patch that adds a PACMAN_EXTRAPACKAGES variable to 
determine which extra packages to build. The main kernel package will always
be built, and we will stop building -headers and -api-headers by default.

To confirm, this also means I should remove the CONFIG_MODULES check from the
PKGBUILD, correct?

> 
> > > > > Also, couldn't vmlinux be obtained from vmlinuz that already
> > > > > exists in the main package via scripts/extract-vmlinux?
> > 
> > I didn't know you could do that. However, I suspect that more people will 
> > encounter this issue and will want the vmlinux file available without knowing
> > you can extract it from vmlinuz. I think it's better to have it available 
> > explicitly in a package.
> 
> Agreed.
> 
> > > > 
> > > > Jose:
> > > > 
> > > > In the vanilla PKGBUILD vmlinux is part of the linux-headers package:
> > > > linux-headers /usr/lib/modules/6.10.2-arch1-1/build/vmlinux
> > > > 
> > > > Given that you already gate the new -debug package on CONFIG_MODULES,
> > > > why not add the file to that package?
> > 
> > Hi Thomas,
> > My only concern with that approach is that it won't address Nathan's concern
> > about increasing the build time. I think an opt-in -debug package is the best
> > solution to address this.
> > 
> > Additionally, Peter from CachyOS (cced) shared this merge request with me:
> > https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/merge_requests/3
> > 
> > It looks like the vanilla PKGBUILD will start including a debug package as well.
> > I think it may be good to align with the pattern they will be using.
> 
> This looks very good. But I it seems it will be some time pacman 7.0
> will be available (especially in the derivate distros)
> Also even with this the custom configuration mechanism would still be
> used.
> 
> > > > 
> > > > Then we could still discuss if it makes sense to gate vmlinux on
> > > > CONFIG_MODULES or if -headers should be enabled unconditionally again.
> > > 
> > > I think having -headers be enabled/built by default is probably okay
> > > since a regular user/builder might have external modules that need to be
> > > rebuilt against the new kernel. However, I (and likely many other
> > > upstream developers, however many use Arch) never build external modules
> > > against my kernels, so it would be nice to have some way to opt out of
> > > this penalty. I suspect it is just compressing down such a massive
> > > vmlinux that causes this? I have not had access to a build log with my
> > > testing, so unsure.
> > > 
> > > > Or we wait for somebody to show up and ask for it.
> > > 
> > > I won't insist though so if we want to wait for someone else, that's
> > > fine with me too.
> > 
> > I will lean on your preference for how to proceed with this. I'm happy to make
> > the changes you think are best. To me, it appears that the next iteration to 
> > satisfy everyone is to make the -debug package opt-in via a new make target or
> > a make config option.
> 
> Ack.

