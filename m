Return-Path: <linux-kbuild+bounces-4850-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4057D9D8A14
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 17:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD1F0B37586
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 14:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502ED1B218C;
	Mon, 25 Nov 2024 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q26UpezS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C01B218A;
	Mon, 25 Nov 2024 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732546374; cv=none; b=Sn26Qjrmi0i++zG3uxCZPEdfy/9dDsSSY6yrCvkRzH0F0w/9AlPoIncOYeDmwErUEdQw1l74t2ijyAilxN1XdlEW1cfmB9tWXbObTpVNkPtr/W9tzUYAvVwbC87466aR3Z8IkUJNuLOkqKDYYPE/vDxEnINO5U4D3wLWKYHBu8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732546374; c=relaxed/simple;
	bh=oqhy9e2J5epV4x7uNnvqT47Lb5Y9aVgtKCBMDtMl5w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0rYkTYyIuFfBZQsI3sLU8vtGdbT1pAEh/OGkSzO5ioykcD+xVyjqWiuLGSY9vQspbvDN7daO0tfsMtxMGXUq6lUkvoOyksgCRWzztJveIbHWp4HM9iJSaW/N2WK6ql1TfJq5KmM7yIVYrRNAlajk15LvhshnSHc/zn4FHGD5no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q26UpezS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E070C4CECE;
	Mon, 25 Nov 2024 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732546373;
	bh=oqhy9e2J5epV4x7uNnvqT47Lb5Y9aVgtKCBMDtMl5w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q26UpezSdvx5Gfgz5TLt3/VHkChCuOBtRwN4IhDyJwrFHZZdGQINMYtUzjaBAgP25
	 JSVqC6XcxoN9DpW4nnnsi6I5+YQKvFNkLaAe4ZC2LZU0+8xHop+JNpoYu5sjkpYdQU
	 EU5dICDKEh93MF1q15c9/6QbM8OZnXZ9JhiZi1z4riRIhPXO0NQ4SG9ITmd17dP88P
	 SQrhc/hZUt5r7Aiz0Kak0JUmdvn+GSMQFruQWgGrWDW1P7q4zR6EsdWlDtwL8QXS0H
	 svi407GcA10F7VjrPJVRYbilLsSSHQ1OcleNgxr3pOZvBqa3xdWRVOTdZyJaIrg6fm
	 OSKb9Tp/pkuwA==
Date: Mon, 25 Nov 2024 07:52:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: prefer toolchain default for debug information
 choice
Message-ID: <20241125145251.GA2067874@thelio-3990X>
References: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>

Hi Thomas,

On Sun, Nov 24, 2024 at 04:58:04PM +0100, Thomas Weißschuh wrote:
> Kconfig by default chooses the first entry of a choice setting.
> For the "debug information" choice this is DEBUG_INFO_NONE which
> disables debug information completely.
> 
> The kconfig choice itself recommends to use "Toolchain default":
> 
> 	Choose which version of DWARF debug info to emit. If unsure,
> 	select "Toolchain default".
> 
> Align the actual configuration with the recommendation by providing an
> explicit default.
> 
> This also enables more codepaths from allmodconfig/allyesconfig which
> depend on debug information being available.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  lib/Kconfig.debug | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 5d9eca035d470f7ba0c5ff932c37fd5869174269..0aefcd103d9012cd8067e5594404358b0e977644 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -240,6 +240,7 @@ config AS_HAS_NON_CONST_ULEB128
>  choice
>  	prompt "Debug information"
>  	depends on DEBUG_KERNEL
> +	default DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>  	help
>  	  Selecting something other than "None" results in a kernel image
>  	  that will include debugging info resulting in a larger kernel image.
> 
> ---
> base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> change-id: 20241124-kbuild-allconfig_debug_info-f7449ba15be6
> 
> Best regards,
> -- 
> Thomas Weißschuh <linux@weissschuh.net>
> 

I am not the biggest fan of this because it appears to have around a 5%
penalty in compilation times when I benchmarked building allmodconfig
with and without this change.

With LLVM 19.1.4:

  Benchmark 1: DEBUG_INFO_NONE
    Time (mean ± σ):     715.858 s ±  0.531 s    [User: 38038.311 s, System: 3718.784 s]
    Range (min … max):   715.271 s … 716.307 s    3 runs

  Benchmark 2: DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
    Time (mean ± σ):     760.749 s ±  0.172 s    [User: 40699.800 s, System: 3817.819 s]
    Range (min … max):   760.617 s … 760.943 s    3 runs

  Summary
    DEBUG_INFO_NONE ran
      1.06 ± 0.00 times faster than DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT

With GCC 14.2.0:

  Benchmark 1: DEBUG_INFO_NONE
    Time (mean ± σ):     830.524 s ±  0.342 s    [User: 43901.642 s, System: 4515.917 s]
    Range (min … max):   830.135 s … 830.777 s    3 runs

  Benchmark 2: DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
    Time (mean ± σ):     873.663 s ±  0.150 s    [User: 46102.416 s, System: 4968.065 s]
    Range (min … max):   873.565 s … 873.836 s    3 runs

  Summary
    DEBUG_INFO_NONE ran
      1.05 ± 0.00 times faster than DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT

I understand the desire to have CONFIG_DEBUG_INFO_BTF be selected with
allmodconfig for the sake of coverage but that is going to add up for
builders doing many builds a day.

Maybe we could add a fragment to kernel/configs for easily flipping
this? Another alternative that I have thought about recently is allowing
developers to specify a directory that holds out of tree config
fragments (KBUILD_FRAGMENTS_DIR?) that would be searched like
kernel/configs and arch/*/configs, so that people could maintain their
own fragments for easily doing something like:

  allmodconfig debug_info_btf.config

during configuration. Regardless though, if others find this new default
desirable, I am fine with it.

Cheers,
Nathan

