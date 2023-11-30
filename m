Return-Path: <linux-kbuild+bounces-212-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190C7FE4D6
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 01:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED2841F20EFE
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 00:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688E010FB;
	Thu, 30 Nov 2023 00:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3FK9HcP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B98810F6
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 00:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C58FC433C7;
	Thu, 30 Nov 2023 00:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701304329;
	bh=sWTZRFs3LpzmxPcfO3M2aIt9v0k5GfKcQDamobqt17I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3FK9HcPl3lhLpfF6lkcbEeA2aI0sYUCtwwghlEFKnuLYH6krMrGR81GpJY3MmJbT
	 80nRU8sIxCxJ9H5HfLmLQYqg0Zo56C8IxbToyb5Z4W7dO2ayMmXduy2zq7/LS4oGUe
	 Cpkq5Tkd3qhwKt8O6W6WND6FWlpBPgPme9TePxSkCwxA/UDNDFysFcjrsC9BrehP7f
	 IQM93kmasmjIu36h2mNO/7mbqm3u+ORiwCEONIh9nPKzwL9Cmv8amSnGHFx6lSyWBL
	 b9R589WnaarzVSV548Q91I5rgRxVYBwarANnrPu770SVphzPxnntt6A7gmiTHT5Hw5
	 JOJA7mgCVp3LQ==
Date: Wed, 29 Nov 2023 17:32:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 3/3] modpost: move exit(1) for fatal() to modpost.h
Message-ID: <20231130003207.GD2513828@dev-arch.thelio-3990X>
References: <20231125103116.797608-1-masahiroy@kernel.org>
 <20231125103116.797608-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125103116.797608-3-masahiroy@kernel.org>

On Sat, Nov 25, 2023 at 07:31:16PM +0900, Masahiro Yamada wrote:
> fatal() never returns, but compilers are not aware of this fact because
> exit(1) is called within the modpost_log() definition.
> 
> Move exit(1) to the fatal() macro so that compilers can identify
> unreachable code flows.
> 
> Remove the initializer for 'taddr' in section_rel(), as compilers now
> recognize this is not an uninitialized bug.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

While I did not see any warnings when testing, it seems like this patch
should come before patch 2 to avoid any potential problems from dropping
the unreachable code (since the compiler won't be able to infer that
fatal() is __noreturn without this change); doesn't really matter though
so:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/mod/modpost.c | 4 +---
>  scripts/mod/modpost.h | 2 +-
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 013fc5031bc7..696c583a14ec 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -84,8 +84,6 @@ void modpost_log(enum loglevel loglevel, const char *fmt, ...)
>  	vfprintf(stderr, fmt, arglist);
>  	va_end(arglist);
>  
> -	if (loglevel == LOG_FATAL)
> -		exit(1);
>  	if (loglevel == LOG_ERROR)
>  		error_occurred = true;
>  }
> @@ -1415,7 +1413,7 @@ static void section_rel(struct module *mod, struct elf_info *elf,
>  
>  	for (rel = start; rel < stop; rel++) {
>  		Elf_Sym *tsym;
> -		Elf_Addr taddr = 0, r_offset;
> +		Elf_Addr taddr, r_offset;
>  		unsigned int r_type, r_sym;
>  		void *loc;
>  
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 9fe974dc1a52..aaa67b24775e 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -215,4 +215,4 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...);
>   */
>  #define warn(fmt, args...)	modpost_log(LOG_WARN, fmt, ##args)
>  #define error(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
> -#define fatal(fmt, args...)	modpost_log(LOG_FATAL, fmt, ##args)
> +#define fatal(fmt, args...)	do { modpost_log(LOG_FATAL, fmt, ##args); exit(1); } while (1)
> -- 
> 2.40.1
> 

