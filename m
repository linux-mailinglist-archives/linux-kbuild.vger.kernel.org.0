Return-Path: <linux-kbuild+bounces-2400-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B341928C94
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 19:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2487B2614D
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 17:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB3F1465B3;
	Fri,  5 Jul 2024 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbNQpUkt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02002433CD;
	Fri,  5 Jul 2024 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720198837; cv=none; b=Ys13/GgKGkX8IZAqrNfcTjyX9JzX8U4m1MKtNqISOHqF6LG7qk2ZuEgIBMUZASpDohtXF1RfUz7TXFWm/af1ceJtaKUlnH6Bn7RN4liL8UjuHR1QcBgXUaCvI5WcxaBOQgTcnpn1caUJZ//aLKe1yWdPasw12vkpGBgBTRFr74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720198837; c=relaxed/simple;
	bh=tDA8X0x8jKESLBsMJ1g3GIsXJliAL7Bz+JWVilUwX5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoR4Nnvj17tDqb/+yD4NExxe/rLz30CJTe3cGulANb+l86vmm849sNIfFtfJl5JSq/PYjEdlhK7d7hYeTiHCKqHoDgQhuyzv5XEyWPvX180Jy/f5aj7Xt+DG8eoH5qN2yCgSt7nJ/yUZi+xBgn29WSfdtT4QJLHyNYNew909HrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbNQpUkt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89337C116B1;
	Fri,  5 Jul 2024 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720198836;
	bh=tDA8X0x8jKESLBsMJ1g3GIsXJliAL7Bz+JWVilUwX5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbNQpUktQsy9Xw5Z9oCL9lEu+9cj1FwtIL8rQj56bl0BqXTekt5A9CoZP4T/ucTKk
	 SLm0o49iITQ7tuuyYF6/ZbRoQRlZUnUkXzc6IZEjc6csnNIK43ylsgNbZhmmyc4hhD
	 /c4hLyUSCM2V5Pybn/XmX1Fe5uGGRU8sE+9XQ/Rf2swo0DlZOZqEgms+zvh3H8r9QH
	 8KYp/NjZVOOxFKUkGjlkPjwmG11jtS++EhG3lfysvetbx3VovTrUSP9/7CjXnTtIqV
	 j4BBq5FDHdnLiHGqG5ZX7fyCrd3PVOwhcsVZqF7tJRjgN3f19Qb1RN2Hy/93YJKyCD
	 DG/w7iyQQt24g==
Date: Fri, 5 Jul 2024 10:00:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 3/3] modpost: rename R_ARM_THM_CALL to R_ARM_THM_PC22
Message-ID: <20240705170034.GC987634@thelio-3990X>
References: <20240704134812.1511315-1-masahiroy@kernel.org>
 <20240704134812.1511315-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704134812.1511315-3-masahiroy@kernel.org>

On Thu, Jul 04, 2024 at 10:47:57PM +0900, Masahiro Yamada wrote:
> R_ARM_THM_CALL does not exist in /usr/include/elf.h, which originates
> from the Glibc project.
> 
> Instead, the following line exists:
> 
>   #define R_ARM_THM_PC22          10      /* PC relative 24 bit (Thumb32 BL).  */
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Like I point out on patch 2, I think making this change a pure rename
and moving the removal into the patch that removes the rest of the
defines would probably be a little better but that's up to you.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/mod/modpost.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index e9aae1b7ff77..3e5313ed6065 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1168,10 +1168,6 @@ static Elf_Addr addend_386_rel(uint32_t *location, unsigned int r_type)
>  	return (Elf_Addr)(-1);
>  }
>  
> -#ifndef	R_ARM_THM_CALL
> -#define	R_ARM_THM_CALL		10
> -#endif
> -
>  static int32_t sign_extend32(int32_t value, int index)
>  {
>  	uint8_t shift = 31 - index;
> @@ -1232,7 +1228,7 @@ static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, unsigned int r_type)
>  				       ((lower & 0x07ff) << 1),
>  				       20);
>  		return offset + sym->st_value + 4;
> -	case R_ARM_THM_CALL:
> +	case R_ARM_THM_PC22:
>  	case R_ARM_THM_JUMP24:
>  		/*
>  		 * Encoding T4:
> -- 
> 2.43.0
> 

