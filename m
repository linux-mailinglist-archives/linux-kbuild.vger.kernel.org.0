Return-Path: <linux-kbuild+bounces-5087-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038909EE2F8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 10:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06CA8284D9E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 09:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B72920E6EE;
	Thu, 12 Dec 2024 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="aIQXsJCP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51C20E706;
	Thu, 12 Dec 2024 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995596; cv=none; b=OAVGVZ6kY734a3pnT3v3sO2DixApKuUC3k0BvTymrbPkUrRMQMZBRdLHs4OAtnY9obR5i3NgQJ5fyHTZePHHCPg/NTaU3lGiqZ1OpnxJ/46BmUQFV6JV0CO16t2YaBXG4gpH2GNPrYtUCEXIriGw9ZK3sh7ulQ1X4tsI+nSsaBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995596; c=relaxed/simple;
	bh=F+ijhRT1Ra+dpE1exus3lUVaHvjOrw606sX/l7stzLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdQdPj1dr9zZHFZMPFGbDZSVu7ENpoI2qKgrp8w36XPb3iofwFBE2EW2Ffl7G1JXBCMB/ToyRcfBe/rzXcscGu9M3MsBrUzRlHNYjG55W0yJP0fJEyFC6gQmWGsWnfKWXVizXznLwuITxwkMH9WTpSJ4/iKcE01jx+RrxICPPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=aIQXsJCP; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nNOzwgYX7fgt2HKMOrQX0yGSiQy3hz/RokbllOCjOaA=; b=aIQXsJCP82z7rf4bUvcQD5jOJW
	vgSQE0txlmwCbmTpIKzRpT61jEHN1lv+lYJ3dvHz/zjNATuv1KLzSj8jf0WmCYhYBEdIIT2SQXIKd
	k3Wzam9mk4TWa4pejZ/X0Q+Z2BbhbYSi9xaVCjzqw1daA4V322TwaJrh1DBsmTxBuXyV9OrVTy5iN
	hkcBukgCMvjm98mUmW0CyJNHZazCB54srgvEHIKOzSAAkMrysByyZNVWjYLjTcEX3T4v3Hvl8yQOq
	LGdDfMlABQ30fuFD7RUlb7dYiiKF7aBaV3VIy+4zN7A5jIOEHum2T3G8saNu6KCOdRYfM5B98XT1t
	B22b8kew==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tLfSj-008ybk-7A;
	Thu, 12 Dec 2024 10:26:25 +0100
Date: Thu, 12 Dec 2024 10:26:21 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] kbuild: deb-pkg: add debarch for ARCH=um
Message-ID: <20241212-pretty-steadfast-gerbil-cb1edf@lindesnes>
References: <20241203111459.3331534-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203111459.3331534-1-masahiroy@kernel.org>

On Tue, Dec 03, 2024 at 08:14:45PM +0900, Masahiro Yamada wrote:
> 'make ARCH=um bindeb-pkg' shows the following warning.
> 
>   $ make ARCH=um bindeb-pkg
>      [snip]
>     GEN     debian
> 
>   ** ** **  WARNING  ** ** **
> 
>   Your architecture doesn't have its equivalent
>   Debian userspace architecture defined!
>   Falling back to the current host architecture (amd64).
>   Please add support for um to ./scripts/package/mkdebian ...
> 
> This commit hard-codes i386/amd64 because UML is only supported for x86.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/package/mkdebian | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 4ffcc70f8e31..b038a1380b8a 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -70,6 +70,13 @@ set_debarch() {
>  			debarch=sh4$(if_enabled_echo CONFIG_CPU_BIG_ENDIAN eb)
>  		fi
>  		;;
> +	um)
> +		if is_enabled CONFIG_64BIT; then
> +			debarch=amd64
> +		else
> +			debarch=i386
> +		fi
> +		;;
>  	esac
>  	if [ -z "$debarch" ]; then
>  		debarch=$(dpkg-architecture -qDEB_HOST_ARCH)
> -- 
> 2.43.0
> 
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

