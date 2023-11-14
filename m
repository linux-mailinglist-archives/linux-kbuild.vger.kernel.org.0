Return-Path: <linux-kbuild+bounces-26-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA07EB72D
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Nov 2023 21:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8983E1F221FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Nov 2023 20:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121BC35EE3;
	Tue, 14 Nov 2023 20:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6TuzT8X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471F26AC4;
	Tue, 14 Nov 2023 20:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312B6C433C8;
	Tue, 14 Nov 2023 20:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699992310;
	bh=oDLylzWb9XOoeGUg7Wqz1W9FNvhlRbijO4lCH9ddguU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6TuzT8X6+03MokWu0xHLXoYfuNFNOUHWCCbEP5apxtlsI4P7WOXmDToB2DZVwY5E
	 42VbgFxJGkTfeEOxBD4F0bN+dh92e8Q/Pj80FFVsl2Ni+MXU508TjNxsIqmQoo6uk4
	 AC+o1d8VIPN/K0oXlVo+JBPKSMNqEQDOWsWwVnj7wLwV1FoJrkqyVyVD+Mt1x0ayd7
	 QdPA/IPxbV+3Z2xIsla3v3RutMH9sS3i/bmJzXzQN7gGfnR4jk/XXPcGEKkX2uhW9A
	 KqKc3La7Y9mBJfDn4r55tn2HyRHbKpqwd3Q98XzxfKPngoJrjZ19ajZ2ZXzsBnbaYa
	 ssIccWziYhMDQ==
Date: Tue, 14 Nov 2023 13:05:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, Helge Deller <deller@gmx.de>,
	linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] linux/export: clean up the IA-64 KSYM_FUNC macro
Message-ID: <20231114200508.GA3378955@dev-arch.thelio-3990X>
References: <20231110120722.15907-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110120722.15907-1-lukas.bulwahn@gmail.com>

On Fri, Nov 10, 2023 at 01:07:22PM +0100, Lukas Bulwahn wrote:
> With commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture"),
> there is no need to keep the IA-64 definition of the KSYM_FUNC macro.
> 
> Clean up the IA-64 definition of the KSYM_FUNC macro.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I see you sent a patch for the other instance of CONFIG_IA64 that I see
in tree still. LGTM.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  include/linux/export-internal.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
> index 45fca09b2319..69501e0ec239 100644
> --- a/include/linux/export-internal.h
> +++ b/include/linux/export-internal.h
> @@ -50,9 +50,7 @@
>  	    "	.previous"						"\n"	\
>  	)
>  
> -#ifdef CONFIG_IA64
> -#define KSYM_FUNC(name)		@fptr(name)
> -#elif defined(CONFIG_PARISC) && defined(CONFIG_64BIT)
> +#if defined(CONFIG_PARISC) && defined(CONFIG_64BIT)
>  #define KSYM_FUNC(name)		P%name
>  #else
>  #define KSYM_FUNC(name)		name
> -- 
> 2.17.1
> 

