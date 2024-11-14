Return-Path: <linux-kbuild+bounces-4679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64D9C8832
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 11:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10DC2B22F5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 10:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABF41F77B8;
	Thu, 14 Nov 2024 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="M+Yfspy3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A71D95A1;
	Thu, 14 Nov 2024 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581393; cv=none; b=KvWfU3WkXyAko6yeUlulRYDIRPeTaL10n9kUgut/cv0yZa9pnSi+PG3sVCLLvKoagMtiSWYQYT4JGtFYNgXiddUUfw/UnO+rMZTy9imcW8Diubd1W67puX/mYm9mzea2vjl5tFi/SeYISgMO1GiMSNY2U0nYY5cdaPuWdCwGDf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581393; c=relaxed/simple;
	bh=7W7eu2pygcDcLgnMABoonhLlgjl2lp1tEbeN4zKBNko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6EbIgBQFi8JB+wPDKUduOBRwAXrobCyZtnBuAGpniLXiKJspd3vloCuT8GyvL7MREOo5H6fQr8tIHmz9fJWo/a/p1nqjo/HpHsOgStHZuVZW0HCzQ/QVK/fOckLXJjIpkZEIaC5rxjcW25NtbDVfPgKAakSYpHj1D8igM8W/SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=M+Yfspy3; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Uolk4UDksq7SR9H9F0AuamJpW1aIrmeVboAODXQPxw4=; b=M+Yfspy3OI4JGbvprvM94/qLVy
	YO7gBsbuiAui6qNcOG+pYh2BAQPwvohwiJPdiCm3aH5kjUfzy5u8FbQ4ZrMWeqkxmDvjiQIhhCgc9
	q3xdR0dsh3Vj0l393v8xfp+c/YXIvwNSXvw+QLFtW3AQGef3SPqvR2XSZoNjYWn9Cz6eNN7g9xHoI
	PkZlwUTkyp6bcn2F1n9UD5MO6v9dWbN+XUtVu3OhRDEtizPAaX2gv1NQ7Z2kSR12ude3Q8Ng9oCfu
	KT7UDElhj2Fgc8F7o5V4PEcIu9nnneg2KsxInVGhbMJqTCjuByHFCGPHWQPI81bIelAKcIS9YnrLu
	GpKl7hGQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tBXPs-00Buav-RA;
	Thu, 14 Nov 2024 11:49:36 +0100
Date: Thu, 14 Nov 2024 11:49:30 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Morten Linderud <morten@linderud.pw>,
	Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
	Kees Cook <kees@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 11/11] kbuild: suppress echoing of commands in
 --dry-run mode
Message-ID: <20241114-rich-free-hound-6aa0bd@lindesnes>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-12-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-12-vegard.nossum@oracle.com>

On Mon, Aug 19, 2024 at 06:03:08PM +0200, Vegard Nossum wrote:
> If the user ran 'make -n' then we will already print all commands.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d08ade5791c2e..a1a3e96a10ea2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -96,9 +96,10 @@ ifneq ($(findstring 1, $(KBUILD_VERBOSE)),)
>    Q =
>  endif
>  
> -# If the user is running make -s (silent mode), suppress echoing of
> -# commands
> -ifneq ($(findstring s,$(firstword -$(MAKEFLAGS))),)
> +# If the user is running make -s (silent mode) or -n (dry run mode),
> +# suppress echoing of commands
> +ifneq (,$(or $(findstring s,$(firstword -$(MAKEFLAGS))), \
> +	$(findstring n,$(firstword -$(MAKEFLAGS)))))
>  quiet=silent_
>  override KBUILD_VERBOSE :=
>  endif
> -- 
> 2.34.1
> 

I think it makes sense to apply this patch earlier.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

