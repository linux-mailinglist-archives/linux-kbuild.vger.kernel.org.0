Return-Path: <linux-kbuild+bounces-4917-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADD9DF50F
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Dec 2024 10:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C409228113A
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Dec 2024 09:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2787080C;
	Sun,  1 Dec 2024 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nWnPhViS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C570828;
	Sun,  1 Dec 2024 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733044062; cv=none; b=Y+4GRHBDT9NOzcggrsfUWQyQPxz3wSRE0sfMfzbploRIH5Xa5hdSGaOgvSEPW6H+AuLBFzMzu5E74NEsBCJgZSo1rcC8Lpv39MYhrKl04PrDWGZh2BcjszxSeVk/Pi+FpvrInf3LrTFMUYH4hDtzIr0PyAyWyzpuy2GgtcaGf3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733044062; c=relaxed/simple;
	bh=tDyqJ+AboZTWobOGJf8LRbTQ3qYwmJ3f7oimo9myEF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/aToRswnHCU97NLm/pUtbcWRZHQySdROzlUKXZteGStDEZ0wm3T7jeTx/n/AQ2gGOfYDz1AhTjOVsa8LltV0xmfJXLDNMNVxeChjtJhd09g09XlF1EXUT9RMp2F9i8LmLa2ZCSaL0w4hDEj0n4S179Z2I9dfuZ0XEpIzsSZvY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nWnPhViS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733043534;
	bh=tDyqJ+AboZTWobOGJf8LRbTQ3qYwmJ3f7oimo9myEF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWnPhViSrmy+Dc3lyibeiuyLJXryBJqmq+wN5kWX59a0s969q3e4Xxs8JxVtB/SkN
	 rio2k/7f20hyPz5LyJtfTaSX+WBoOKc8UAxiIPemszmurWuOU/FkpeMP8TsyyxKBSk
	 IrPX3pAZEFzXXhbwz1e7bNQkXd0LS7S+24eMseL4=
Date: Sun, 1 Dec 2024 09:58:54 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: prefer toolchain default for debug information
 choice
Message-ID: <e367e522-64c5-4741-a348-4ab2545f1d41@t-8ch.de>
References: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
 <20241125145251.GA2067874@thelio-3990X>
 <5fdad1e3-1b0c-4292-9bb1-2f7654d9b816@t-8ch.de>
 <20241125185837.GA495243@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125185837.GA495243@thelio-3990X>

On 2024-11-25 11:58:37-0700, Nathan Chancellor wrote:
> On Mon, Nov 25, 2024 at 04:46:53PM +0100, Thomas Weißschuh wrote:
> > On 2024-11-25 07:52:51-0700, Nathan Chancellor wrote:
> > > On Sun, Nov 24, 2024 at 04:58:04PM +0100, Thomas Weißschuh wrote:
> > > > Kconfig by default chooses the first entry of a choice setting.
> > > > For the "debug information" choice this is DEBUG_INFO_NONE which
> > > > disables debug information completely.
> > > > 
> > > > The kconfig choice itself recommends to use "Toolchain default":
> > > > 
> > > > 	Choose which version of DWARF debug info to emit. If unsure,
> > > > 	select "Toolchain default".
> > > > 
> > > > Align the actual configuration with the recommendation by providing an
> > > > explicit default.
> > > > 
> > > > This also enables more codepaths from allmodconfig/allyesconfig which
> > > > depend on debug information being available.
> > > > 
> > > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > ---
> > > >  lib/Kconfig.debug | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > > index 5d9eca035d470f7ba0c5ff932c37fd5869174269..0aefcd103d9012cd8067e5594404358b0e977644 100644
> > > > --- a/lib/Kconfig.debug
> > > > +++ b/lib/Kconfig.debug
> > > > @@ -240,6 +240,7 @@ config AS_HAS_NON_CONST_ULEB128
> > > >  choice
> > > >  	prompt "Debug information"
> > > >  	depends on DEBUG_KERNEL
> > > > +	default DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > > >  	help
> > > >  	  Selecting something other than "None" results in a kernel image
> > > >  	  that will include debugging info resulting in a larger kernel image.
> > > > 
> > > > ---
> > > > base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> > > > change-id: 20241124-kbuild-allconfig_debug_info-f7449ba15be6
> > > > 
> > > > Best regards,
> > > > -- 
> > > > Thomas Weißschuh <linux@weissschuh.net>
> > > > 
> > > 
> > > I am not the biggest fan of this because it appears to have around a 5%
> > > penalty in compilation times when I benchmarked building allmodconfig
> > > with and without this change.
> > > 
> > > With LLVM 19.1.4:
> > > 
> > >   Benchmark 1: DEBUG_INFO_NONE
> > >     Time (mean ± σ):     715.858 s ±  0.531 s    [User: 38038.311 s, System: 3718.784 s]
> > >     Range (min … max):   715.271 s … 716.307 s    3 runs
> > > 
> > >   Benchmark 2: DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > >     Time (mean ± σ):     760.749 s ±  0.172 s    [User: 40699.800 s, System: 3817.819 s]
> > >     Range (min … max):   760.617 s … 760.943 s    3 runs
> > > 
> > >   Summary
> > >     DEBUG_INFO_NONE ran
> > >       1.06 ± 0.00 times faster than DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > > 
> > > With GCC 14.2.0:
> > > 
> > >   Benchmark 1: DEBUG_INFO_NONE
> > >     Time (mean ± σ):     830.524 s ±  0.342 s    [User: 43901.642 s, System: 4515.917 s]
> > >     Range (min … max):   830.135 s … 830.777 s    3 runs
> > > 
> > >   Benchmark 2: DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > >     Time (mean ± σ):     873.663 s ±  0.150 s    [User: 46102.416 s, System: 4968.065 s]
> > >     Range (min … max):   873.565 s … 873.836 s    3 runs
> > > 
> > >   Summary
> > >     DEBUG_INFO_NONE ran
> > >       1.05 ± 0.00 times faster than DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > > 
> > > I understand the desire to have CONFIG_DEBUG_INFO_BTF be selected with
> > > allmodconfig for the sake of coverage but that is going to add up for
> > > builders doing many builds a day.
> > 
> > No argument on the increased cost.
> > 
> > But it's called "allyesconfig" not "ciconfig".
> > I do realize that technically it is a Kconfig "choice" which
> > does not have a "yes" answer. However I think it does fit the spirit.
> 
> Sure, I do not really disagree there. I more interpret allmodconfig and
> allyesconfig to mean "build all code" not "build with every option
> possible", which is a small distinction but meaningful in this case. Not
> saying one is more correct than the other, just saying where I come from
> :)

FWIW SCHED_CLASS_EXT and some netfilter components also depend on debug
info and are therefore currently not part of all{mod,yes}config.
Looking at current trends I expect more subsystems to be in the same
boat over time.

The (small) BTF support code is also affected.

> > > Maybe we could add a fragment to kernel/configs for easily flipping
> > > this? Another alternative that I have thought about recently is allowing
> > > developers to specify a directory that holds out of tree config
> > > fragments (KBUILD_FRAGMENTS_DIR?) that would be searched like
> > > kernel/configs and arch/*/configs, so that people could maintain their
> > > own fragments for easily doing something like:
> > > 
> > >   allmodconfig debug_info_btf.config
> > > 
> > > during configuration. Regardless though, if others find this new default
> > > desirable, I am fine with it.
> > 
> > The same could be used by the CI setups :-)
> > 
> > There should be less CI setups than regular developers, they known more
> > about special or expensive configuration quirks and they should already
> > have logic to filter and customize build configurations.
> > 
> > While I'm arguing here to accomodate for my personal laziness, I also do
> > think that these are generally valid arguments.
> > But if there if it's not convincing enough, I'll drop it.
> 
> Yes, I think there is definitely a fine argument here. I am certainly
> not here to block anything, just giving my opinion as someone who does a
> lot of builds every day :)

Thanks for your input!
The general interest seems to be very limited.

> > The out of tree fragments idea sounds personally useful but a bit
> > inconsistent with the rest of kbuild.
> > AFAIK there is nothing similar; for thing like CFLAGS etc.
> 
> KCFLAGS in Makefile or Documentation/kbuild/kbuild.rst?

Indeed. I meant for "similar" to mean "pointing to file locations
outside of the source tree".
But looking at it again, this is probably not a good argument.
Having such a feature would also help us for the nolibc testsuite.

