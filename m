Return-Path: <linux-kbuild+bounces-4858-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 305CA9D8D8C
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 21:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8984163E0B
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 20:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDD91B3950;
	Mon, 25 Nov 2024 20:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="SubjMiTN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D015B10D;
	Mon, 25 Nov 2024 20:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732567771; cv=none; b=ZQBrnyOZCMTnUBfwCM7268GOF96C+DbwXk+53nkQtsNYXIzkuNxunJkHgk8RN6bObRh635tdHAdc3s1vxcONanb+eXjuSg+9gPwRkvqD0agUri7/pjXHU4eFZrVebbpRHXRBA8qTlZvf7qmgffMYVx5g/k4z6xVvK/JAwhCKDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732567771; c=relaxed/simple;
	bh=wLwycS1Z1YxxUELou2OFF6z2PRpJ4qM63nEtm/WU90Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXnzcsCuCWdUhvrBON2RsAGvahJkhvA5G1Ln+yts1y7SpTCLlmxBiu27qzdRdGcYxPMddMpzV/mBCJJzpuI5aGTGBSS0GRMmZFE+1I2mnl6ghRxdYQxomrpmtjduot4H6sfhEqezHS8zi019nWCQ2p3AEnv62biVTVRFwvjteto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=SubjMiTN; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g0/1/jZQOIqwS559r+jizPOTmczdhSNyGXEX7ArQI1A=; b=SubjMiTNSQQxvG24qfVdfnoa9/
	LGZanrfQMhZJ11YrLDCZ6zTfs2Dv8o6460KeFJL2igHDRVjhqetuVjfxBRqW5fIPfxO/I+tf73EjL
	SnBQxU5iEhkNOUO12gnd16reTZvVsalzF/55CqwfJd9uUzAebrDr1ynsJ/HmIL5KVcU2orQKzxpz4
	bJqyPQ3mlslUIATP9SqVCr5AMLYxSKd3AD2ExPw+2MY/J6sag1mWf+ifEyTf0l43sfm01p00SA3t6
	YgQTrVgmJcQi3q2/iCV9u/NxSMPRB+8zMcu1bdRZfTuNThKxtV1bD9qqbHzpAQYAOe5ZCrPFBERmy
	ZXpI2Ztg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tFg19-00BHcm-Fk;
	Mon, 25 Nov 2024 21:49:11 +0100
Date: Mon, 25 Nov 2024 21:49:08 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: add python3:native to build dependency
Message-ID: <20241125-straight-rottweiler-of-assurance-d7101d@lindesnes>
References: <20241123082736.26822-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123082736.26822-1-masahiroy@kernel.org>

On Sat, Nov 23, 2024 at 05:26:45PM +0900, Masahiro Yamada wrote:
> Python3 is necessary for running some scripts such as
> drivers/gpu/drm/msm/registers/gen_header.py
> 
> Both scripts/package/kernel.spec and scripts/package/PKGBUILD already
> list Python as the build dependency.
> 
> Do likewise for scripts/package/mkdebian.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index fc3b7fa709fc..4ffcc70f8e31 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -202,7 +202,7 @@ Build-Depends-Arch: bc, bison, cpio, flex,
>   gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
>   kmod, libelf-dev:native,
>   libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
> - rsync
> + python3:native, rsync
>  Homepage: https://www.kernel.org/
>  
>  Package: $packagename-$version
> -- 
> 2.43.0
> 
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

