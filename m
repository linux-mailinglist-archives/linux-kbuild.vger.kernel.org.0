Return-Path: <linux-kbuild+bounces-10261-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34829CD1B7D
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F924305DCF6
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 20:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29DE33C53A;
	Fri, 19 Dec 2025 20:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHGX5mCv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AB933B6D2;
	Fri, 19 Dec 2025 20:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766175155; cv=none; b=McNAOVRvWmW3vTkukG6WkqbGv9ZdG4fB2OiSc0mfmQx9GRzFXJ5MrMtCG3pVDfU6tTzT8Nj1rCh1PfATwTUlbjdrqnJiVftuVrwU+P+yeyZlfTOrMhGKwdEJFfFxUJHcMJxUAlBxfgHjETgB8XwpwC/a/y5mKCxJS1417rMN950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766175155; c=relaxed/simple;
	bh=Gr5pezIU+Fq4Rna/0uP5EqxFSBA4aUqqWVBenzozi2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnAnliMwwzUi2GM5M6cYEn+K2sZb0hViJGYlfHOm0KvqNDLgQFAxLER/LomONmUDtT50SbnufmVRsiKdArl5Db7AJhNKG7JSbVuvlAA2/PIf4BK8uIWFARmkDElBZYE85DtcF8vTQX9jkzRz0j7SqIJO/b7rJm0h4ol7jFlWF+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHGX5mCv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035E1C116D0;
	Fri, 19 Dec 2025 20:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766175155;
	bh=Gr5pezIU+Fq4Rna/0uP5EqxFSBA4aUqqWVBenzozi2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHGX5mCv+seuLpNap9Ndy0UeJgad5WFPNkIfvg2k/akqV0GbZoooFOf3gtCp8WnpD
	 MnpEO6KLTFNdpDK/p69polICYhdM3l88FYKnG+YusLsnSVYUa23NGBRgEDvRzmH2+d
	 cby0Ny3m2ImYSuK3B1iMD8eHHcbpeafT3aOcu/AGxb0jHZ1bMJDoJYDCsdil3UCLLE
	 Di4NPYHKwfcQ9D06SvPDMt8PrydztIe+DcEJ05MkeELwXvqDK3bZXRnh1o8GpuolYR
	 xCoB04C6RxUjplnvtCAD5c/TwahuiCJ5ypl5mlzj2/qK1maHAU90T6i+5x1nIA6kOq
	 W83UJYrvfhw2g==
Date: Fri, 19 Dec 2025 13:12:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: david.laight.linux@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] kbuild: Only enable
 -Wtautological-constant-out-of-range-compare for W=2
Message-ID: <20251219201231.GB1404453@ax162>
References: <20251214131528.3648-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214131528.3648-1-david.laight.linux@gmail.com>

Hi David,

On Sun, Dec 14, 2025 at 01:15:28PM +0000, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> The kernel code style is to use !(expr) rather that (expr) == 0.
> But clang complains that converting some constant expressions
> (eg (0xffffu << 16)) to a boolean always evalutes to true.
> This happens often in the validity checks in #defines.
> Move tautological-constant-out-of-range-compare to W=2 (along with the
> similar type-limits).
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

I would like Arnd to comment on this before applying because the
reasoning of this change does not feel good enough to disable this
warning. It is not like '== 0' is inherently uncommon in the kernel or
hard to write to avoid the implicit conversion warning. To be honest, I
am a bit surprised -Wtautological-constant-out-of-range-compare fires
for that instead of some sort of -Wconversion warning...

> ---
>  scripts/Makefile.warn | 2 +-I
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
> index 68e6fafcb80c..e2d467835c5b 100644
> --- a/scripts/Makefile.warn
> +++ b/scripts/Makefile.warn
> @@ -151,7 +151,6 @@ KBUILD_CFLAGS += -Wformat-insufficient-args
>  endif
>  endif
>  KBUILD_CFLAGS += $(call cc-option, -Wno-pointer-to-enum-cast)
> -KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
>  KBUILD_CFLAGS += $(call cc-option, -Wno-unaligned-access)
>  KBUILD_CFLAGS += -Wno-enum-compare-conditional
>  endif
> @@ -179,6 +178,7 @@ KBUILD_CFLAGS += -Wno-shift-negative-value
>  
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-enum-enum-conversion
> +KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
>  endif
>  
>  ifdef CONFIG_CC_IS_GCC
> -- 
> 2.39.5
> 

