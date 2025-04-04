Return-Path: <linux-kbuild+bounces-6406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66899A7BB74
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD3553B9D6C
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 11:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA701E1DEE;
	Fri,  4 Apr 2025 11:21:18 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB21DACB8;
	Fri,  4 Apr 2025 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765678; cv=none; b=h5IkQgGxft/uPTBu0LFtvcWnXTLlhO8Qa4gWNEJBdwAdaMQWYHrIx62FnOeZ94VLCbtMnHyBFHNCV/5hMnGis3sYPPezEIP2woebDK/PrECnzw3jWIYCwPSMsonEznksKDNXQqWF3S7rOTINF74jxVo3jVh9QZlIXMNnGbUMIw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765678; c=relaxed/simple;
	bh=l/OadT8320Y3LIrPo8Ym8SCsWbWBmZQGOyyP0O3orTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0IS4R7y00fl56bAf4n/nG1yTiixYBkeUmYH1ov+C1/PQhzuBFEdvdcfTpI/MabqWsF3jIW9uOdvn7X6z2c+L+8QaFS4vRPjdH+5aOxSu2KL+JcrUckU2mhgD8GTp99NfDyFt6irEHSYwSwY3jYWvBYwz1s9aFNL6G6YHHMlgkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.43] (g43.guest.molgen.mpg.de [141.14.220.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id C2A6961E64782;
	Fri, 04 Apr 2025 13:20:59 +0200 (CEST)
Message-ID: <874cb5c4-d767-4744-bec2-2c89e3b98d82@molgen.mpg.de>
Date: Fri, 4 Apr 2025 13:20:59 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250404102535.705090-1-ubizjak@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250404102535.705090-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Uros,


Am 04.04.25 um 12:24 schrieb Uros Bizjak:
> Current version of genksyms doesn't know anything about __typeof_unqual__()
> operator.  Avoid the usage of __typeof_unqual__() with genksyms to prevent
> errors when symbols are versioned.
> 
> There were no problems with gendwarfksyms.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL() macro")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de/
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>   include/linux/compiler.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 27725f1ab5ab..98057f93938c 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -229,10 +229,10 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
>   /*
>    * Use __typeof_unqual__() when available.
>    *
> - * XXX: Remove test for __CHECKER__ once
> - * sparse learns about __typeof_unqual__().
> + * XXX: Remove test for __GENKSYMS__ once "genksyms" handles
> + * __typeof_unqual__(), and test for __CHECKER__ once "sparse" handles it.
>    */
> -#if CC_HAS_TYPEOF_UNQUAL && !defined(__CHECKER__)
> +#if CC_HAS_TYPEOF_UNQUAL && !defined(__GENKSYMS__) && !defined(__CHECKER__)
>   # define USE_TYPEOF_UNQUAL 1
>   #endif

Thank you for your patch, that fixes my reported issue.

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de> # warning `cryptd: no 
symbol version for this_cpu_off is gone`


Kind regards,

Paul

