Return-Path: <linux-kbuild+bounces-2399-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1474928C8F
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 18:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6901F252D7
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 16:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F4F16DC3E;
	Fri,  5 Jul 2024 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwiOfBew"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F002F5E;
	Fri,  5 Jul 2024 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720198733; cv=none; b=LG0IRjViMcpIbeizkpeerJk7pIkWbQLQK+OJrzwPxHkB6hEEOThIuvdM7LScaYLdkvBur71zYU7m34OxfLuNmpEdfRIBnCGC/lhX+tMb4FRd0CQlGGfUIiepwlCvgqvYv1Hs3AZC6eAwjA/a+xv1uYoGGfllMqMYaovqUzIdAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720198733; c=relaxed/simple;
	bh=8FCxqMkEPkGSY0x+vVfNdaj4SPYYSyIOaGsFsTYl6l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HovwZaebIX6FUEklnTG7+7NWydDb6iegyfjS9CYPWPUjcN4OPMuU2a53oB3+8d0HWenOJ2ti9Pa3xg3NrHHEL8QpZA3nOrjeLEuDvfiKhPWEY2sZDM9CiatJBkAGAN39SGAK+aSkXCniKhMog+5ODuQKVVap6GsGExm56quWQxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwiOfBew; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B088C116B1;
	Fri,  5 Jul 2024 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720198733;
	bh=8FCxqMkEPkGSY0x+vVfNdaj4SPYYSyIOaGsFsTYl6l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwiOfBew1KTAlG8mZbyx9t5n+tohGisfPZGmnXhSyH4joGzfGQOB6SI0iZbx647eb
	 GsRwO250fwwB6gQzz0VMJFWa9FzhfTZQmYvi2KDXtWzFmYcQftgqemuztSwo2DxWQz
	 TuNhS9QGD3rMNV86aQF9jrV7mTcR4gIepSSUV0qKLr72mUloxtChOH4shoPSt2c/4I
	 hnpHWkQ6FNq6EXntTXJUI/41RvOuGy/29GbulzTvwbcLetrI3hz/x/AKa7yJhngd3s
	 ja1ARyq8Yy1O+AP5KmB/biWYaD5FyGse8rI8kEqWI1NZK2/Yre33sj9WzkYzxX+Sms
	 /xsdf+hVpiPbw==
Date: Fri, 5 Jul 2024 09:58:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 2/3] modpost: remove self-definitions of R_ARM_* macros
Message-ID: <20240705165851.GB987634@thelio-3990X>
References: <20240704134812.1511315-1-masahiroy@kernel.org>
 <20240704134812.1511315-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704134812.1511315-2-masahiroy@kernel.org>

On Thu, Jul 04, 2024 at 10:47:56PM +0900, Masahiro Yamada wrote:
> Commit f5983dab0ead ("modpost: define more R_ARM_* for old
> distributions") added self-definitions for the R_ARM_* macros to fix
> build errors on CentOS 7.
> 
> RHEL/CentOS 7 were retired at the end of June.
> 
> Remove all the R_ARM_* definitions (except for R_ARM_THM_CALL), which
> should be available in recent distributions.
> 
> Glibc added most of R_ARM_* macros in 2013. [1]
> 
> [1]: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=08cbd996d33114ca50644d060fbe3a08260430fb

So did musl by virtue of a glibc elf.h update:

https://git.musl-libc.org/cgit/musl/commit/?id=268375c1c017c0bdefeed1a330811e433c4dfaef

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I can't imagine this will need to be reverted but in case it does, would
it make sense to place patch 3 before this one (such that it is just
renaming R_ARM_THM_CALL to R_ARM_THM_PC22) so that fix remains around
and the revert can be easy?

Regardless:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/mod/modpost.c | 30 ------------------------------
>  1 file changed, 30 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 11731fc62140..e9aae1b7ff77 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1168,39 +1168,9 @@ static Elf_Addr addend_386_rel(uint32_t *location, unsigned int r_type)
>  	return (Elf_Addr)(-1);
>  }
>  
> -#ifndef R_ARM_CALL
> -#define R_ARM_CALL	28
> -#endif
> -#ifndef R_ARM_JUMP24
> -#define R_ARM_JUMP24	29
> -#endif
> -
>  #ifndef	R_ARM_THM_CALL
>  #define	R_ARM_THM_CALL		10
>  #endif
> -#ifndef	R_ARM_THM_JUMP24
> -#define	R_ARM_THM_JUMP24	30
> -#endif
> -
> -#ifndef R_ARM_MOVW_ABS_NC
> -#define R_ARM_MOVW_ABS_NC	43
> -#endif
> -
> -#ifndef R_ARM_MOVT_ABS
> -#define R_ARM_MOVT_ABS		44
> -#endif
> -
> -#ifndef R_ARM_THM_MOVW_ABS_NC
> -#define R_ARM_THM_MOVW_ABS_NC	47
> -#endif
> -
> -#ifndef R_ARM_THM_MOVT_ABS
> -#define R_ARM_THM_MOVT_ABS	48
> -#endif
> -
> -#ifndef	R_ARM_THM_JUMP19
> -#define	R_ARM_THM_JUMP19	51
> -#endif
>  
>  static int32_t sign_extend32(int32_t value, int index)
>  {
> -- 
> 2.43.0
> 

