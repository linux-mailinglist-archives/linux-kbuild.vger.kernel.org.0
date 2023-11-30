Return-Path: <linux-kbuild+bounces-211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117F67FE4CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 01:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D171C209FB
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 00:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0223385;
	Thu, 30 Nov 2023 00:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0/QhCng"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A09180
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 00:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC47FC433C8;
	Thu, 30 Nov 2023 00:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701304185;
	bh=su3U2MKiTuvW1OU+U/J2IQYwdENWTmkzyZ8QyZdNEjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0/QhCngEgjxDfCEsM0SUqf+OQqLGtQXXDLmbfsUSXufruvxp6uB1B0n4JJ3pmdNE
	 Oqm7YIITtoRNHLBu3PgfJ1a/gLIglbtkfybhJQpJDv7JddHTzSoqPXs0GVxCVyV4hx
	 wv6CsENk5fUnSGGX6DHldk+B2EhE5RrREjA3WPaNBSCiarKLba+lVQ9co9e9chmwBV
	 eTs5K/EP+Qy+PtmTyivnwSGtLGSLBwFP1gRE/ZwtDZ1AvsM1tOQNPXMKKeTtDKaT4V
	 LoQXIMoFjmfWB+bB56e/uv1AFOHzkFJMPvQYLgZOvKKuR/gjNcDNHSg2i8hgufkIGO
	 VzfgT6jznDWvA==
Date: Wed, 29 Nov 2023 17:29:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 2/3] modpost: remove unreachable code after fatal()
Message-ID: <20231130002943.GC2513828@dev-arch.thelio-3990X>
References: <20231125103116.797608-1-masahiroy@kernel.org>
 <20231125103116.797608-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125103116.797608-2-masahiroy@kernel.org>

On Sat, Nov 25, 2023 at 07:31:15PM +0900, Masahiro Yamada wrote:
> fatal() never returns. Remove unreachable code.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/mod/modpost.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index ca0a90158f85..013fc5031bc7 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -473,11 +473,9 @@ static int parse_elf(struct elf_info *info, const char *filename)
>  		fatal("%s: not relocatable object.", filename);
>  
>  	/* Check if file offset is correct */
> -	if (hdr->e_shoff > info->size) {
> +	if (hdr->e_shoff > info->size)
>  		fatal("section header offset=%lu in file '%s' is bigger than filesize=%zu\n",
>  		      (unsigned long)hdr->e_shoff, filename, info->size);
> -		return 0;
> -	}
>  
>  	if (hdr->e_shnum == SHN_UNDEF) {
>  		/*
> @@ -515,12 +513,11 @@ static int parse_elf(struct elf_info *info, const char *filename)
>  		const char *secname;
>  		int nobits = sechdrs[i].sh_type == SHT_NOBITS;
>  
> -		if (!nobits && sechdrs[i].sh_offset > info->size) {
> +		if (!nobits && sechdrs[i].sh_offset > info->size)
>  			fatal("%s is truncated. sechdrs[i].sh_offset=%lu > sizeof(*hrd)=%zu\n",
>  			      filename, (unsigned long)sechdrs[i].sh_offset,
>  			      sizeof(*hdr));
> -			return 0;
> -		}
> +
>  		secname = secstrings + sechdrs[i].sh_name;
>  		if (strcmp(secname, ".modinfo") == 0) {
>  			if (nobits)
> -- 
> 2.40.1
> 

