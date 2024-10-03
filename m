Return-Path: <linux-kbuild+bounces-3896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB3C98F5FE
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 20:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B80BA1F22550
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 18:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0266678B60;
	Thu,  3 Oct 2024 18:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="qowY4HVF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641BD1A2569;
	Thu,  3 Oct 2024 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727979978; cv=none; b=WD0zeCiaAM/+5s0lcP8MeyTKgQd/33c0AkLv1DC3vRfROJOj11kbZaUlhcpnjtXNlGkWUqZf537FP0yNmD+Jx2roC45En/bI1NT3dslPUaAqSl2OyCF+koGrbAUtGbG1D7F/cpqC+B9Jo5EUEEcN2etvUsMTkI78WSDBLtvj4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727979978; c=relaxed/simple;
	bh=NAAIqGTTAByol07ZR67GhGsphnOqN38NN4mHFLSweeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqZr6tDmeLW0rcN2uP095uXCtkmgqDi7Pxqygf5zFssfAs5lxM75szEV0ieJLDDi6jaCHBHlHz24QP30+vcmD3AfJHysHMDTJf45GQuUzcLv1x2RXuoY64QdhiyMgB/djgZZO6f5buS3TRs3jdSRHlA9ak+H/eJPjMX9ucHxJ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=qowY4HVF; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n2rLtsIeOiHOKeMIdChlKIm8yew13McQ9+X6g11hii0=; b=qowY4HVFIrJEC1YO/X8XMMjL9c
	KuNPUmVuG0ieGIEj1YvUt9cMx9kIsukHOozZHelLgDLdVAltWlPsuYAJjhheDPg7RUa2UjLWVGQzD
	ANf3Vn3Wfx6n3YQITJtPAcuNuIfbxYcDCDYNFtZ7gsmZcyqjqvPbonOIJr8nEBZhO+gWx8uSLhcgu
	fQa+Urm9BoIbzojYunZz0YyLnyU9SdyJQbi2CO0UdY549cO1UFGYu5vrIlH/HtOYm+LamtdO/3jdL
	d386ZR4RbAKX9kfKw4UO36nuXDEQSOOtuN16ENqocy+0XCUSqCwqGTcBI7uxxOMrZxOPQKPj1cbU1
	bqURkdIg==;
Received: from [2001:9e8:9d1:b101:3235:adff:fed0:37e6] (port=51730 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swQWY-0066et-FW;
	Thu, 03 Oct 2024 20:26:02 +0200
Date: Thu, 3 Oct 2024 20:25:58 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 09/23] speakup: use SPKDIR=$(src) to specify the source
 directory
Message-ID: <20241003-amusing-knowing-urchin-a5f9cb@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-10-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-10-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:37PM +0900, Masahiro Yamada wrote:
> Since commit b1992c3772e6 ("kbuild: use $(src) instead of
> $(srctree)/$(src) for source directory"), $(src) consistently points
> to the source directory whether this is compiled an as external module
> or not.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/accessibility/speakup/Makefile | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/accessibility/speakup/Makefile b/drivers/accessibility/speakup/Makefile
> index 6f6a83565c0d..14ba1cca87f4 100644
> --- a/drivers/accessibility/speakup/Makefile
> +++ b/drivers/accessibility/speakup/Makefile
> @@ -40,9 +40,7 @@ hostprogs += makemapdata
>  makemapdata-objs := makemapdata.o
>  
>  quiet_cmd_mkmap = MKMAP   $@
> -      cmd_mkmap = TOPDIR=$(srctree) \
> -		  SPKDIR=$(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD),$(srctree)/drivers/accessibility/speakup) \
> -		  $(obj)/makemapdata > $@
> +      cmd_mkmap = TOPDIR=$(srctree) SPKDIR=$(src) $(obj)/makemapdata > $@
>  
>  $(obj)/mapdata.h: $(obj)/makemapdata
>  	$(call cmd,mkmap)
> -- 
> 2.43.0
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

