Return-Path: <linux-kbuild+bounces-9272-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 84498C0337B
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 21:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D1CA74E1571
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 19:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48B8348448;
	Thu, 23 Oct 2025 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="x5y3C8Qc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C223F40D;
	Thu, 23 Oct 2025 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761248970; cv=none; b=j+4fn+BlTz9Idg4ugR1V/voFDH2Lxud2ZIlXURkdmFPxYye9PHMxV9VmA5y2U4jZXWWSsqjjA+x8Ma8hjf8ZwdY+JmzbJIPkL+THrWj04rK6wRWXGdxii/D1nFlFe52kSRFW9UVbF7+qPhVCYR8VfHuq45bzPNQPi2ucSl6DBtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761248970; c=relaxed/simple;
	bh=sVAXNS8VVOg1sqn3ahIlI4cJKsmwAKKnazyvKn5zQzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnAMXZpiTAj0QpDwLLAx0cPExd2ptIg4mU2oUXo1uGZ558whL0g5ltUYyqPklmh/NlEF6oMvRLIFzYlK+u8G80QCqFLv1JIiGZjFWtSejLF5RTU67f40h9t6SOdzuJ6SBZa2EoEzkRI8JORRqN+g/r7j08+tNhkLeLlR9d+3fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=x5y3C8Qc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KLl9/dCuK0w4mJ7Q+6xgoL3IKQDuogfp3O2fQm9Eoi8=; b=x5y3C8QcP8g/wFK9Eq+U38axHC
	OuKa0K+A16nhiOWkPsLLi43vAFTfqoQoNcTol5UqW5A2sYbb3ARernbyukxfJAUYiznO5FGDC9yje
	X3cceNxq1wSADDc7bp7/5Z/00BB/BRiM4lsximj4eXWD/AMHjTRFSk9/HPe5Bf/mk4jcTincf9gT2
	wBef5oOJcVmdg/rkGkqnuA+FqvkQideqbDvn7MlrXeEjWZMnXOYFIJpsbj69WSTNY3TFP2nIdKl+d
	FqGGO1qXn2WoZ7wcLGyNHGuEjrrkxiW/uqlFHLe9f9V1k7JMPacZxiTwjlP1yEZptwcd/6Oh7jgq1
	pMdcT1xQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1JL-00000007PLZ-3ow4;
	Thu, 23 Oct 2025 19:49:23 +0000
Message-ID: <31ddd30f-300e-416e-83d6-2e18bda632c4@infradead.org>
Date: Thu, 23 Oct 2025 12:49:23 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Kconfig section
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251023-update-kconfig-maintainers-v1-1-0ebd5b4ecced@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251023-update-kconfig-maintainers-v1-1-0ebd5b4ecced@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/23/25 12:25 PM, Nathan Chancellor wrote:
> Masahiro Yamada stepped down as Kbuild and Kconfig maintainer in
> commit 8d6841d5cb20 ("MAINTAINERS: hand over Kbuild maintenance"),
> leaving Kconfig officially orphaned and handing Kbuild over to Nicolas
> and myself. Since then, there have been a few simple patches to Kconfig
> that have ended up on the linux-kbuild mailing list without clear
> direction on who will take them, as they are not really sent to anybody
> officially, although the list is obviously watched by the Kbuild
> maintainers.
> 
> Make Nicolas and I official maintainers of Kconfig in "Odd Fixes"
> status, similiar to Kbuild, so that the subsystem has clear points of
> contact for contributors, even if significant contributions may not be
> accepted.
> 
> Additionally, add the Kbuild tree to this section.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> We are going to de facto maintain this so we might as well make it
> official :) I will take this via kbuild-fixes at some point.
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 545a4776795e..1471e1bf1510 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13415,9 +13415,12 @@ F:	mm/kasan/
>  F:	scripts/Makefile.kasan
>  
>  KCONFIG
> +M:	Nathan Chancellor <nathan@kernel.org>
> +M:	Nicolas Schier <nicolas@fjasle.eu>
>  L:	linux-kbuild@vger.kernel.org
> -S:	Orphan
> +S:	Odd Fixes
>  Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
>  F:	Documentation/kbuild/kconfig*
>  F:	scripts/Kconfig.include
>  F:	scripts/kconfig/
> 
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251023-update-kconfig-maintainers-d637e7abb2fd
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 
> 

-- 
~Randy

