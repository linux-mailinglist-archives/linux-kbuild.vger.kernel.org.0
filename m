Return-Path: <linux-kbuild+bounces-2505-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B99309309FE
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 14:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59B9D1F215D3
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 12:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B588F745E2;
	Sun, 14 Jul 2024 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="plMF9s5I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0406B3BB23;
	Sun, 14 Jul 2024 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720961909; cv=none; b=gt1m6JyoRv4ktvRVTcYp/mSyUSGP4A6tc6jNSZjDY+T8n19FFjDrUeKYf+8ZXOBmqOjjoB9EC+lr8nJEnE9wmZMkb1YcAfYu33h/7SWrWJwZw+WUoQsbhdzUywYb5UC/jcyW2D8x1NWWLA9k8kI8TeOSuHRC63HTN5pubfekHeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720961909; c=relaxed/simple;
	bh=Ah56fshfOW+guMs7BQPsoc2doCK6l0nxKHQYGdJhLQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrCot4HGZlQ/rF8jO65+QyMDtB+QkKxxq3Ora+TwW9viiByeXSSMTKb/tCRt1B/YNXz+JZAYXBtAhbmQrCd1t+vvvvOtXOO2c6SYKG6NIs+DFYe4NHvSPtFxPhE4UhhyOCsV1okEIICP86nQzbzCKC9CZ50dKd1g+nMQUBoCx+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=plMF9s5I; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KLp5o2UecGEjtPu5Gg7n2OPTHRCP0urlfQJP5C8EPyg=; b=plMF9s5I328G7Pg8BUz8hubRj8
	zApsImh/Bo+FDHGVkfP3wFCOAJUAe2Qm4viu7XVYH4g1xFB54ENvTSxTxGeb4ECQ0Xl6be49iymPE
	pOXCsDzioXAd9xgx7dHBWRrWqsua2XmCfCfh7Ff5c/d/V+9d7ILvVXULwZNlyHbj/Nam3TVb/46bx
	UbZjZKGYtw4qesV1U2mqr/dk/hnHRB3ItIfyY+CClAdt+PZZXc55/wFckisnor7Ya2Hs2q2nKJToQ
	6KnOMloHfRZjmclbRGFOrof5VtSPH5SzsLdpXLVwjHSTlRIkgZGcTCX0q5RHnt4itLUtRIKB7Aj3n
	gByQ52Vg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSyo5-00000004Slk-2q6b;
	Sun, 14 Jul 2024 12:58:25 +0000
Message-ID: <535254d9-f9fe-492d-a5ab-33da01106b0e@infradead.org>
Date: Sun, 14 Jul 2024 05:58:22 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: remove redundant 'if HAVE_ARCH_KASAN' in Kconfig
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20240714105848.1844400-1-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240714105848.1844400-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/14/24 3:58 AM, Masahiro Yamada wrote:
> The condition 'select HAVE_ARCH_KASAN' is always true because
> there is 'select HAVE_ARCH_KASAN' statement above.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>  arch/arm64/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c87d16b12e9b..d37cbfc3031e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -167,9 +167,9 @@ config ARM64
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  	select HAVE_ARCH_KASAN
> -	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
> -	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
> -	select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
> +	select HAVE_ARCH_KASAN_VMALLOC
> +	select HAVE_ARCH_KASAN_SW_TAGS
> +	select HAVE_ARCH_KASAN_HW_TAGS if ARM64_MTE
>  	# Some instrumentation may be unsound, hence EXPERT
>  	select HAVE_ARCH_KCSAN if EXPERT
>  	select HAVE_ARCH_KFENCE

-- 
~Randy

