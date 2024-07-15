Return-Path: <linux-kbuild+bounces-2518-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BBE930CCC
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 04:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7044A1F211EA
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 02:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500E26FC2;
	Mon, 15 Jul 2024 02:41:18 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38F64A35;
	Mon, 15 Jul 2024 02:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721011278; cv=none; b=TTBYWyVahOXbRm3VBYtWaeWpY2mGbBQp4OoHXXy9rrzWMwcFjnlacpI8sDbFzSyrKTFaeAwrv6wlTJR08+VCQVc5Bt3+Y45uyfklX/5WJWStHBGSxZY6R3Jp5YiT4vsH5ZeEnB0XQ585maURpmUiPjk7lRtREI1FLUxtF0fmPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721011278; c=relaxed/simple;
	bh=CcuJ6zalw48fPT60jgM+/sKMTg6u/KrFTffpyNv1ZbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1WWbIpoAhFqkbgEiA7Ad74qVZTXVqZ7HW7CJ3RIZO6FzGTKdVm2R0I5CLvVKxHLzRyy0Y3Pwvu1L3EYFK/Gx2HVnCiTUTCgxPsl9sPXUtmtc1BgS1vd1Mx4pdJRBQJESAhbtuSHipo0R5oTyIRbr2UTFmx1rY0N9xqu0tZReg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06D84FEC;
	Sun, 14 Jul 2024 19:41:39 -0700 (PDT)
Received: from [10.162.16.42] (unknown [10.162.16.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D30CF3F762;
	Sun, 14 Jul 2024 19:41:11 -0700 (PDT)
Message-ID: <87d70313-9c8c-4cdf-a040-7ea31804cad7@arm.com>
Date: Mon, 15 Jul 2024 08:11:08 +0530
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
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240714105848.1844400-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/24 16:28, Masahiro Yamada wrote:
> The condition 'select HAVE_ARCH_KASAN' is always true because
> there is 'select HAVE_ARCH_KASAN' statement above.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
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

There is another similar instance with HAVE_FUNCTION_GRAPH_TRACER as well.
Just wondering if the following change should be folded in here ?

--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -210,8 +210,8 @@ config ARM64
        select HAVE_FTRACE_MCOUNT_RECORD
        select HAVE_FUNCTION_TRACER
        select HAVE_FUNCTION_ERROR_INJECTION
-       select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
        select HAVE_FUNCTION_GRAPH_TRACER
+       select HAVE_FUNCTION_GRAPH_RETVAL
        select HAVE_GCC_PLUGINS
        select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
                HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI

