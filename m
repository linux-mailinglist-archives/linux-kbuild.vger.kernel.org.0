Return-Path: <linux-kbuild+bounces-4856-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3CC9D8C8A
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 19:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E26E6B2421D
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 18:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD001B983F;
	Mon, 25 Nov 2024 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQnLt20d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047441B415F;
	Mon, 25 Nov 2024 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732561120; cv=none; b=SxtMftc13NeekILBVMMaUJGS0cA/85NyGxkTaHkoiWXVj92Tkz26rRRVRF/G7OJT1GBUy+GNpzFVOOzHCoIHooMbCDqpDwlAgslDyZmVyQyvf2N0R7aqhheCBARF5jAFd+haiifBb8VQHkEl32hxW3it4b6FpHn2bpRjY8Vht9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732561120; c=relaxed/simple;
	bh=Fqrnpfc5wrMBhOgBDmW15TU9vQsVhq/EplZwpJQIS7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRal/d3G7dt1TKrKkbsMhUoePvzEtY7G9riTK4xVEc7QQK0D7ViV0X1/09BAO+ZQywOXQfHK6XNWRJefPF+fqMV4pBEuj2gvEZ8/XedpWdedYTzkZAeOhDKxf8l+OaIYuBkND+PmJHvIiKHlgBnIFXx9r2P3up2upgWBSNHADNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQnLt20d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA6AC4CECE;
	Mon, 25 Nov 2024 18:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732561119;
	bh=Fqrnpfc5wrMBhOgBDmW15TU9vQsVhq/EplZwpJQIS7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQnLt20dC4rqMsXjR32O9xRjmTRZUv68cydjbF60dgZXotZON17lHJAmL8WMKk/Ic
	 XSuQTw4u5ItMyV8Q2ji+WlKnn3o4qggMWMnXpqeRlYBNBF9sM27vOP8fkus2UWYDkV
	 Qohq+zmWEtAkD11vRf8ZXyJdhi3i7ugOPbiGOGwisAFyTvFS6nHriX6QP98qNjx0lH
	 z7hIpONn+ht5lDGIyGp5V+0EGEnEt9AZYKbxpqalXHDxG1QrVAvlUiqaSe5Us77HMa
	 VAmSqZUhPieNjGk3ouYNz7t+9mn6/cZCDT88N3JroRTObe/S4v2AgdzLaJKZp+e8Gi
	 8BK5I8Minrzfg==
Date: Mon, 25 Nov 2024 11:58:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: prefer toolchain default for debug information
 choice
Message-ID: <20241125185837.GA495243@thelio-3990X>
References: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
 <20241125145251.GA2067874@thelio-3990X>
 <5fdad1e3-1b0c-4292-9bb1-2f7654d9b816@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fdad1e3-1b0c-4292-9bb1-2f7654d9b816@t-8ch.de>

On Mon, Nov 25, 2024 at 04:46:53PM +0100, Thomas Weißschuh wrote:
> Hi Nathan,
> 
> On 2024-11-25 07:52:51-0700, Nathan Chancellor wrote:
> > On Sun, Nov 24, 2024 at 04:58:04PM +0100, Thomas Weißschuh wrote:
> > > Kconfig by default chooses the first entry of a choice setting.
> > > For the "debug information" choice this is DEBUG_INFO_NONE which
> > > disables debug information completely.
> > > 
> > > The kconfig choice itself recommends to use "Toolchain default":
> > > 
> > > 	Choose which version of DWARF debug info to emit. If unsure,
> > > 	select "Toolchain default".
> > > 
> > > Align the actual configuration with the recommendation by providing an
> > > explicit default.
> > > 
> > > This also enables more codepaths from allmodconfig/allyesconfig which
> > > depend on debug information being available.
> > > 
> > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > ---
> > >  lib/Kconfig.debug | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > index 5d9eca035d470f7ba0c5ff932c37fd5869174269..0aefcd103d9012cd8067e5594404358b0e977644 100644
> > > --- a/lib/Kconfig.debug
> > > +++ b/lib/Kconfig.debug
> > > @@ -240,6 +240,7 @@ config AS_HAS_NON_CONST_ULEB128
> > >  choice
> > >  	prompt "Debug information"
> > >  	depends on DEBUG_KERNEL
> > > +	default DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > >  	help
> > >  	  Selecting something other than "None" results in a kernel image
> > >  	  that will include debugging info resulting in a larger kernel image.
> > > 
> > > ---
> > > base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> > > change-id: 20241124-kbuild-allconfig_debug_info-f7449ba15be6
> > > 
> > > Best regards,
> > > -- 
> > > Thomas Weißschuh <linux@weissschuh.net>
> > > 
> > 
> > I am not the biggest fan of this because it appears to have around a 5%
> > penalty in compilation times when I benchmarked building allmodconfig
> > with and without this change.
> > 
> > With LLVM 19.1.4:
> > 
> >   Benchmark 1: DEBUG_INFO_NONE
> >     Time (mean ± σ):     715.858 s ±  0.531 s    [User: 38038.311 s, System: 3718.784 s]
> >     Range (min … max):   715.271 s … 716.307 s    3 runs
> > 
> >   Benchmark 2: DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> >     Time (mean ± σ):     760.749 s ±  0.172 s    [User: 40699.800 s, System: 3817.819 s]
> >     Range (min … max):   760.617 s … 760.943 s    3 runs
> > 
> >   Summary
> >     DEBUG_INFO_NONE ran
> >       1.06 ± 0.00 times faster than DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > 
> > With GCC 14.2.0:
> > 
> >   Benchmark 1: DEBUG_INFO_NONE
> >     Time (mean ± σ):     830.524 s ±  0.342 s    [User: 43901.642 s, System: 4515.917 s]
> >     Range (min … max):   830.135 s … 830.777 s    3 runs
> > 
> >   Benchmark 2: DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> >     Time (mean ± σ):     873.663 s ±  0.150 s    [User: 46102.416 s, System: 4968.065 s]
> >     Range (min … max):   873.565 s … 873.836 s    3 runs
> > 
> >   Summary
> >     DEBUG_INFO_NONE ran
> >       1.05 ± 0.00 times faster than DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > 
> > I understand the desire to have CONFIG_DEBUG_INFO_BTF be selected with
> > allmodconfig for the sake of coverage but that is going to add up for
> > builders doing many builds a day.
> 
> No argument on the increased cost.
> 
> But it's called "allyesconfig" not "ciconfig".
> I do realize that technically it is a Kconfig "choice" which
> does not have a "yes" answer. However I think it does fit the spirit.

Sure, I do not really disagree there. I more interpret allmodconfig and
allyesconfig to mean "build all code" not "build with every option
possible", which is a small distinction but meaningful in this case. Not
saying one is more correct than the other, just saying where I come from
:)

> > Maybe we could add a fragment to kernel/configs for easily flipping
> > this? Another alternative that I have thought about recently is allowing
> > developers to specify a directory that holds out of tree config
> > fragments (KBUILD_FRAGMENTS_DIR?) that would be searched like
> > kernel/configs and arch/*/configs, so that people could maintain their
> > own fragments for easily doing something like:
> > 
> >   allmodconfig debug_info_btf.config
> > 
> > during configuration. Regardless though, if others find this new default
> > desirable, I am fine with it.
> 
> The same could be used by the CI setups :-)
> 
> There should be less CI setups than regular developers, they known more
> about special or expensive configuration quirks and they should already
> have logic to filter and customize build configurations.
> 
> While I'm arguing here to accomodate for my personal laziness, I also do
> think that these are generally valid arguments.
> But if there if it's not convincing enough, I'll drop it.

Yes, I think there is definitely a fine argument here. I am certainly
not here to block anything, just giving my opinion as someone who does a
lot of builds every day :)

> The out of tree fragments idea sounds personally useful but a bit
> inconsistent with the rest of kbuild.
> AFAIK there is nothing similar; for thing like CFLAGS etc.

KCFLAGS in Makefile or Documentation/kbuild/kbuild.rst?

Cheers,
Nathan

