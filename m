Return-Path: <linux-kbuild+bounces-2761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97994374E
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 22:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E78BD1C2287F
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 20:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7AE2110E;
	Wed, 31 Jul 2024 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="S/Dd5ysZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623886CDBA;
	Wed, 31 Jul 2024 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722458647; cv=none; b=MTeOiZsFIT+C5DF84v2p0lo/btCt8iL/MY7eCX/wHm4Iam/rsW1SOiD/CeQM6BCF8MWEMmHDpL9DbAlIYOgKfkOW4FOuP5mMCvTGj9WsH41+T3AkXkIC/rUvR5xvZv0NeYkRIJItKzxfS7+oXPLMV90oCcf29mC1x6C1cy3N8h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722458647; c=relaxed/simple;
	bh=/XdVYAt7G3/Mi5Brgz+YdXrag0bk6daRF2v2yYgub4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX9Mmatf0HKc3kyfptOXoO2jGgCvld8fDxEtL81Zh3uXueIohg6csaTWn/11ZbkZrOhFNmnyfkM+x4tbrWI0BIU6Z4SuyPflNw2c/HuPqXVhvjhEUyvTW+8WLVImLyfqULUbu1tgjD/IDVdYVLpVxXWJe2s1BNFOfpBM1qug8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=S/Dd5ysZ; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k4hc+2mjONWCmoezqc8BzbnSj0fCe0qUKPYxQEFW1RE=; b=S/Dd5ysZ5myhvxirP5Vm5Uyv7h
	ApIxIv4vCtBXKr++PG1BEJgV4t5RH42/P1DfypBs4TpwBQlaVRSEhi+chvGJ17caxo8uk/3kargH+
	mlD+oDz+2inCKXqimGSk8a6+vGc5dxdQtaOka8lMpXZSCi2KxyYFqAXJ8u7EurFLW8LrvkC5ANlKO
	2ITNeywKAliYiQ5aBrNNer2QduohqVCTMns3HmucYUqT0rQ2BZnMqd3ARQfBaon7C41CtmSl6nJHP
	37/pZtqGumXblpTm0lJU78gQsQVISxmMiK3TiheDlDiZCi4KoJRklwPlME7S0xZAOG2GfTjrBi11R
	b2CMhXMg==;
Received: from [2001:9e8:9fa:4501:3235:adff:fed0:37e6] (port=38360 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sZGAm-009E2d-Ub;
	Wed, 31 Jul 2024 22:43:49 +0200
Date: Wed, 31 Jul 2024 22:43:44 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 1/4] modpost: remove unused HOST_ELFCLASS
Message-ID: <20240731-gainful-smoky-nautilus-f8fdd4@lindesnes>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727074526.1771247-2-masahiroy@kernel.org>

On Sat, Jul 27, 2024 at 04:42:01PM +0900, Masahiro Yamada wrote:
> HOST_ELFCLASS is output to elfconfig.h, but it is not used in modpost.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/mod/mk_elfconfig.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/scripts/mod/mk_elfconfig.c b/scripts/mod/mk_elfconfig.c
> index 680eade89be1..aca96b3aada0 100644
> --- a/scripts/mod/mk_elfconfig.c
> +++ b/scripts/mod/mk_elfconfig.c
> @@ -39,12 +39,6 @@ main(int argc, char **argv)
>  		exit(1);
>  	}
>  
> -	if (sizeof(unsigned long) == 4) {
> -		printf("#define HOST_ELFCLASS ELFCLASS32\n");
> -	} else if (sizeof(unsigned long) == 8) {
> -		printf("#define HOST_ELFCLASS ELFCLASS64\n");
> -	}
> -
>  	endian_test.s = 0x0102;
>  	if (memcmp(endian_test.c, "\x01\x02", 2) == 0)
>  		printf("#define HOST_ELFDATA ELFDATA2MSB\n");
> -- 
> 2.43.0
> 
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

