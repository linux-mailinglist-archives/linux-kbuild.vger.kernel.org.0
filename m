Return-Path: <linux-kbuild+bounces-2768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C694451E
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 09:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0191C217F4
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 07:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DA012D760;
	Thu,  1 Aug 2024 07:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="NGW1LMRT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1A18E0E;
	Thu,  1 Aug 2024 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495892; cv=none; b=AtH9LZTwETB2kh8IClqPM2XLBidmn9bT3UGmRnB9cdubiddB5df0FytHBpMd57pvWWOdsJGEdE3lhtHyGJ2PcyPll1YqqmiEvSrT23lo7OfYw5y3irMyY+k4tY2lln3XwTCMJtNNED2HXzuthHsZ78crue0MMi5BK9b8pboDt7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495892; c=relaxed/simple;
	bh=BaVlJRN/6hPJp9l19L8ToU280ekcfomw2D+4NZlM194=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT8/MEbysTMb0M5/qScjCKM8/3tGZzqX60lYSzFySv5SV8BQBPG8AkQI14zJvcidmIbiIOk4y2Utz7TNItURD6xHfy11qufTeZsEA52TrvJdDMNYSFfuIFYKeSaQf31gziAyQpQcf/tjO2xB3aK8GQDpt2R2XObjdL/avq2xfmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=NGW1LMRT; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=61UZKpDQzaF9GUCZxf/tmbLRyDF/Ip+EC4Mbam9rse8=; b=NGW1LMRTNP+8JbP8ljr89Daoqp
	FeZQCOKnWc74tPRBET6YrJYarkgVly2uJckeL6nSiN+LMPUDXy4TLjDep2JtZHERzhxSL1Kzw84fd
	s9zEFZJDdb2pEbT8UwZODl1Q45OKMiBRx0SxwcOe5jEN6tEyYCIG3fj0lT7Mx5f9Pzb2uGlRtuSxy
	Q2reyXVpy1uLnU/DzHhni0YGOvw5r5P1VaDj3OeFsDysmqcowBoaZ0QDhGiLntjlI7P3DIX4lBa3Q
	RXEyO2MbACcKAX8FBOHKDXzKk5gbGYU/FoRwlNLHHleouzZc1s4KbTfXKFFt+Km1jJislEO3DFuzE
	69o5xB/g==;
Received: from [2001:9e8:9df:2b01:3235:adff:fed0:37e6] (port=51948 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sZPra-00AnRX-R9;
	Thu, 01 Aug 2024 09:04:39 +0200
Date: Thu, 1 Aug 2024 09:04:33 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when
 possible
Message-ID: <20240801-peculiar-soft-oarfish-acc596@lindesnes>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org>
 <20240731-soft-kittiwake-of-election-a1dfa0@lindesnes>
 <CAK7LNASR4KtTnP5sq32DNsbauFwMrtw8Q800ZyjCiqetFooYdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASR4KtTnP5sq32DNsbauFwMrtw8Q800ZyjCiqetFooYdQ@mail.gmail.com>

On Thu, Aug 01, 2024 at 11:37:30AM +0900, Masahiro Yamada wrote:
> On Thu, Aug 1, 2024 at 6:10 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > On Sat, Jul 27, 2024 at 04:42:04PM +0900, Masahiro Yamada wrote:
> > > A long standing issue in the upstream kernel packaging is that the
> > > linux-headers package is not cross-compiled.
> > >
> > > For example, you can cross-build Debian packages for arm64 by running
> > > the following command:
> > >
> > >   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
> > >
> > > However, the generated linux-headers-*_arm64.deb is useless because the
> > > host programs in it were built for your build machine architecture
> > > (likely x86), not arm64.
> > >
> > > The Debian kernel maintains its own Makefiles to cross-compile host
> > > tools without relying on Kbuild. [1]
> > >
> > > Instead of adding such full custom Makefiles, this commit adds a small
> > > piece of code to cross-compile host programs located under the scripts/
> > > directory.
> > >
> > > A straightforward solution is to pass HOSTCC=${CROSS_COMPILE}gcc, but it
> > > would also cross-compile scripts/basic/fixdep, which needs to be native
> > > to process the if_changed_dep macro. (This approach may work under some
> > > circumstances; you can execute foreign architecture programs with the
> > > help of binfmt_misc because Debian systems enable CONFIG_BINFMT_MISC,
> > > but it would require installing QEMU and libc for that architecture.)
> > >
> > > A trick is to use the external module build (KBUILD_EXTMOD=), which
> > > does not rebuild scripts/basic/fixdep. ${CC} needs to be able to link
> > > userspace programs (CONFIG_CC_CAN_LINK=y).
> > >
> > > There are known limitations:
> > >
> > >  - GCC plugins
> > >
> > >    It would possible to rebuild GCC plugins for the target architecture
> > >    by passing HOSTCXX=${CROSS_COMPILE}g++ with necessary packages
> > >    installed, but gcc on the installed system emits
> > >    "cc1: error: incompatible gcc/plugin versions". I did not find a
> > >    solution for this because 'gcc' on a foreign architecture is a
> > >    different compiler after all.
> > >
> > >  - objtool and resolve_btfids
> > >
> > >    These are built by the tools build system. They are not covered by
> > >    the current solution.
> > >
> > > I only tested this with Debian, but it should work for other package
> > > systems as well.
> > >
> > > [1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/rules.real#L586
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/package/install-extmod-build | 34 ++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> > > index cc335945dfbc..0b56d3d7b48f 100755
> > > --- a/scripts/package/install-extmod-build
> > > +++ b/scripts/package/install-extmod-build
> > > @@ -43,4 +43,38 @@ mkdir -p "${destdir}"
> > >       fi
> > >  } | tar -c -f - -T - | tar -xf - -C "${destdir}"
> > >
> > > +# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebuild host
> > > +# programs using ${CC}. This assumes CC=${CROSS_COMPILE}gcc, which is usually
> > > +# the case for package building. It does not cross-compile when CC=clang.
> > > +#
> > > +# This caters to host programs that participate in Kbuild. objtool and
> > > +# resolve_btfids are out of scope.
> >
> > Just for clarification: Why do you call both "out of scope" here?
> > Because they're not being built by kbuild, or because they will never be
> > needed for building oot kmods?
> 
> 
> I meant the former.
> 
> 
> Debian applies a tricky patch to the tools build system
> in order to cross-compile objtool:
> 
> https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/patches/debian/fixdep-allow-overriding-hostcc-and-hostld.patch
> 
> It is not an elegant solution, though.
> 
> 
> I still believe the right thing to do is
> converting Makefiles for objtool and resolve_btfids into Kbuild style.
> 
> 
> objtool and resolve_btfids are necessary for building external modules,
> when CONFIG_OBJTOOL=y and CONFIG_DEBUG_INFO_BTF=y, respectively.
> If these comments are confusing, I can delete them.

I think it's good to mention that cross-built linux-headers package is
still broken for CONFIG_OBJTOOL=y and CONFIG_DEBUG_INFO_BTF=y.  I think
I'd add a sentence to the commit message and keep the comment here as it
is.

Kind regards,
Nicolas


