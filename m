Return-Path: <linux-kbuild+bounces-3064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C42955802
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 15:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08E861F21B5C
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C54D1459F6;
	Sat, 17 Aug 2024 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="WoBeRecr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6991E531;
	Sat, 17 Aug 2024 13:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723900687; cv=none; b=A/xCvTxPj+tp9AHMgqsNky13W7/YYDhhKqZeviTYXAw9v34WMRGVfUJflxRMpKbQmVT4iGRHdrZi1P7PMbboJeSaGtyFoEJ3i7ApAHUAgBNWxMnlL7+VPpTQW3KSYJqS2LyDhOM0OjEhNGar+e4XglPVO7dfhEZRxJCUB2BaPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723900687; c=relaxed/simple;
	bh=HvXmyuHg5GnswCDkAJPVSYjHNNSfv3TKohdSNPIPCZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFHxGZGVm2PnqaATzuXUZBjGp+r4XLo+J8U8POXEt+afHH4Z58pQ6TzVkKpMCg8U4V/pnqY2hetGzIiRj9AGUcwF3mjt4hxG5iNBPBsoHbxYfQNwqknjkoSJa8Bxf97TE4hn0A+f+lM6ZwpIBmSd5qY0afTDO6RgFbswpTAYABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=WoBeRecr; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SgbIPuQb9jRS6bEK3u2c9dEhiPTushvj+p3+mp9gGzw=; b=WoBeRecrG9h5E3blQfEkLRl/4W
	0vh6R/aKkW2Rmq8EDRIiUplqhXk7W0N5DKFlhZqRwPiSUZCkPp+7N/9oQ0WQl9z0fDexLlAwPxh3l
	0GUWnCwsY+sCiqMlQhjY6H+rOPtJRWb4yS3c5XqnzEs4a8bf0Nkt5A2kBTLw54H1pr8eEL0Qh9WT7
	hQ8PZDkDZXQ6QkQ4itVQs2uocW/vfXg/0OIxGimSYAIb/GwWndLcmWHfXPVdjCfPzZ2+eWhhaYrWH
	rTAyqrqrnnUXuc4Bsgj4Xw6Yj/iX5Hdg9X9cSX+KuGHgtNJe/m2wUPYp/4W08PwZrKvXtFiWCvh5O
	G4U83+Zw==;
Received: from [2001:9e8:9db:8201:3235:adff:fed0:37e6] (port=46100 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sfJJX-00DYyR-GG;
	Sat, 17 Aug 2024 15:17:51 +0200
Date: Sat, 17 Aug 2024 15:17:47 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] modpost: improve the section mismatch warning format
Message-ID: <20240817-strong-passionate-gecko-dd86ac@lindesnes>
References: <20240812165455.2156964-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812165455.2156964-1-masahiroy@kernel.org>

On Tue, Aug 13, 2024 at 01:54:51AM +0900, Masahiro Yamada wrote:
> This commit improves the section mismatch warning format when there is
> no suitable symbol name to print.
> 
> The section mismatch warning prints the reference source in the form
> of <symbol_name>+<offset> and the reference destination in the form
> of <symbol_name>.
> 
> However, there are some corner cases where <symbol_name> becomes
> "(unknown)", as reported in commit 23dfd914d2bf ("modpost: fix null
> pointer dereference").
> 
> In such cases, it is better to print the symbol address.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/mod/modpost.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d0f138803207..3e474291258c 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -705,10 +705,7 @@ static char *get_modinfo(struct elf_info *info, const char *tag)
>  
>  static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
>  {
> -	if (sym)
> -		return elf->strtab + sym->st_name;
> -	else
> -		return "(unknown)";
> +	return sym ? elf->strtab + sym->st_name : "";
>  }
>  
>  /*
> @@ -1021,6 +1018,7 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
>  	Elf_Sym *from;
>  	const char *tosym;
>  	const char *fromsym;
> +	char taddr_str[16];
>  
>  	from = find_fromsym(elf, faddr, fsecndx);
>  	fromsym = sym_name(elf, from);
> @@ -1034,10 +1032,17 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
>  
>  	sec_mismatch_count++;
>  
> -	warn("%s: section mismatch in reference: %s+0x%x (section: %s) -> %s (section: %s)\n",
> -	     modname, fromsym,
> -	     (unsigned int)(faddr - (from ? from->st_value : 0)),
> -	     fromsec, tosym, tosec);
> +	if (!tosym[0])
> +		snprintf(taddr_str, sizeof(taddr_str), "0x%x", (unsigned int)taddr);
> +
> +	/*
> +	 * The format for the reference source:      <symbol_name>+<offset> or <address>
> +	 * The format for the reference destination: <symbol_name>          or <address>
> +	 */
> +	warn("%s: section mismatch in reference: %s%s0x%x (section: %s) -> %s (section: %s)\n",
> +	     modname, fromsym, fromsym[0] ? "+" : "",
> +	     (unsigned int)(faddr - (fromsym[0] ? from->st_value : 0)),
> +	     fromsec, tosym[0] ? tosym : taddr_str, tosec);
>  
>  	if (mismatch->mismatch == EXTABLE_TO_NON_TEXT) {
>  		if (match(tosec, mismatch->bad_tosec))
> -- 
> 2.43.0
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

