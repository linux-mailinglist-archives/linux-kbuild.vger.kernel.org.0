Return-Path: <linux-kbuild+bounces-4854-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50F9D89A1
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 16:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5411623E8
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 15:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20AB29415;
	Mon, 25 Nov 2024 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UO36P0Vy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E032AD25;
	Mon, 25 Nov 2024 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732549632; cv=none; b=YE9MUuOusipRyOZ/1qUMJ1bg9muFQhB+IhOyT93gO4SJc+hFsstPQTG4sXx+pVEBpe+uHxUVnXEZUuoR8TKF9b3MwBojUVKiaI+vaYE6gB4xtrxfYF0BVF0+lPgHF+L8NrOE24wKIG4lepb3GUYPwkCvv3IIsm1PYf9WRHQxNNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732549632; c=relaxed/simple;
	bh=MznzshigUxB+GhTJcUIaBAh1DkWS4z1iJApj0Pb3qWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzizM5pNbaywO4mYSVIN0Y3rC21SwmcrW/htaxCVAkvDbEU7HCl9FGmkwT+qyVZvDcqzFeEumLu+lnNniSOWGkHZjOXy4hLhuiI1n8TXu6ZYuWryvbi1ZpEmu9eF/jPKoC1l+ue+ePbV4FnOX+UWwNYMFkAsg/MHXRxkAFtfOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UO36P0Vy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1732549628;
	bh=MznzshigUxB+GhTJcUIaBAh1DkWS4z1iJApj0Pb3qWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UO36P0Vy8FKrFoex2BEBZvpmaW40gAV6BDQrijhhgxzK02Z1/6WgySopQ7CM02T7u
	 FjdtJV677czbU17jJzWQcx4uvSOyY8Sibu643wcVTXf8aFzPAQDNOKORXA21EZtdKD
	 RIGYpLa6uIuoLEJe5D8jP9fgHgVYgJnu2gX0wzeM=
Date: Mon, 25 Nov 2024 16:46:53 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: prefer toolchain default for debug information
 choice
Message-ID: <5fdad1e3-1b0c-4292-9bb1-2f7654d9b816@t-8ch.de>
References: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
 <20241125145251.GA2067874@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125145251.GA2067874@thelio-3990X>

Hi Nathan,

On 2024-11-25 07:52:51-0700, Nathan Chancellor wrote:
> On Sun, Nov 24, 2024 at 04:58:04PM +0100, Thomas Weißschuh wrote:
> > Kconfig by default chooses the first entry of a choice setting.
> > For the "debug information" choice this is DEBUG_INFO_NONE which
> > disables debug information completely.
> > 
> > The kconfig choice itself recommends to use "Toolchain default":
> > 
> > 	Choose which version of DWARF debug info to emit. If unsure,
> > 	select "Toolchain default".
> > 
> > Align the actual configuration with the recommendation by providing an
> > explicit default.
> > 
> > This also enables more codepaths from allmodconfig/allyesconfig which
> > depend on debug information being available.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  lib/Kconfig.debug | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 5d9eca035d470f7ba0c5ff932c37fd5869174269..0aefcd103d9012cd8067e5594404358b0e977644 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -240,6 +240,7 @@ config AS_HAS_NON_CONST_ULEB128
> >  choice
> >  	prompt "Debug information"
> >  	depends on DEBUG_KERNEL
> > +	default DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> >  	help
> >  	  Selecting something other than "None" results in a kernel image
> >  	  that will include debugging info resulting in a larger kernel image.
> > 
> > ---
> > base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> > change-id: 20241124-kbuild-allconfig_debug_info-f7449ba15be6
> > 
> > Best regards,
> > -- 
> > Thomas Weißschuh <linux@weissschuh.net>
> > 
> 
> I am not the biggest fan of this because it appears to have around a 5%
> penalty in compilation times when I benchmarked building allmodconfig
> with and without this change.
> 
> With LLVM 19.1.4:
> 
>   Benchmark 1: DEBUG_INFO_NONE
>     Time (mean ± σ):     715.858 s ±  0.531 s    [User: 38038.311 s, System: 3718.784 s]
>     Range (min … max):   715.271 s … 716.307 s    3 runs
> 
>   Benchmark 2: DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>     Time (mean ± σ):     760.749 s ±  0.172 s    [User: 40699.800 s, System: 3817.819 s]
>     Range (min … max):   760.617 s … 760.943 s    3 runs
> 
>   Summary
>     DEBUG_INFO_NONE ran
>       1.06 ± 0.00 times faster than DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> 
> With GCC 14.2.0:
> 
>   Benchmark 1: DEBUG_INFO_NONE
>     Time (mean ± σ):     830.524 s ±  0.342 s    [User: 43901.642 s, System: 4515.917 s]
>     Range (min … max):   830.135 s … 830.777 s    3 runs
> 
>   Benchmark 2: DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>     Time (mean ± σ):     873.663 s ±  0.150 s    [User: 46102.416 s, System: 4968.065 s]
>     Range (min … max):   873.565 s … 873.836 s    3 runs
> 
>   Summary
>     DEBUG_INFO_NONE ran
>       1.05 ± 0.00 times faster than DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> 
> I understand the desire to have CONFIG_DEBUG_INFO_BTF be selected with
> allmodconfig for the sake of coverage but that is going to add up for
> builders doing many builds a day.

No argument on the increased cost.

But it's called "allyesconfig" not "ciconfig".
I do realize that technically it is a Kconfig "choice" which
does not have a "yes" answer. However I think it does fit the spirit.

> Maybe we could add a fragment to kernel/configs for easily flipping
> this? Another alternative that I have thought about recently is allowing
> developers to specify a directory that holds out of tree config
> fragments (KBUILD_FRAGMENTS_DIR?) that would be searched like
> kernel/configs and arch/*/configs, so that people could maintain their
> own fragments for easily doing something like:
> 
>   allmodconfig debug_info_btf.config
> 
> during configuration. Regardless though, if others find this new default
> desirable, I am fine with it.

The same could be used by the CI setups :-)

There should be less CI setups than regular developers, they known more
about special or expensive configuration quirks and they should already
have logic to filter and customize build configurations.

While I'm arguing here to accomodate for my personal laziness, I also do
think that these are generally valid arguments.
But if there if it's not convincing enough, I'll drop it.

The out of tree fragments idea sounds personally useful but a bit
inconsistent with the rest of kbuild.
AFAIK there is nothing similar; for thing like CFLAGS etc.


Thomas

