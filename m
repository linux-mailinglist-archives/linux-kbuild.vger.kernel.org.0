Return-Path: <linux-kbuild+bounces-5860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2480A40203
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 22:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D21CD7A5A52
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 21:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429A820127D;
	Fri, 21 Feb 2025 21:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ON91Etgl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1150A1E9B29;
	Fri, 21 Feb 2025 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173169; cv=none; b=QHgLduRAbeZvqHM6AQmKHyO37gx9cAPJ08xK68EFCIfN/bMP1d189qDoDLY+pV2nHTYcyVtRe+qsqYdzG4SYQvlFi4bOvQDDT3BS2Pkrf0PNKOieHkLkGr7e0ALSdiaMSthrf2Erxdr53JaFQ/5KTAZEaDVV7pk0MUxb9DhNlf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173169; c=relaxed/simple;
	bh=e6FP5rMsM9QldxBxgKUh/Xlk2sImzDtlxWc7RP2v5vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MN8E3QLvZGr4cWEWiy5psHDrDvGO+p8X8KX5D+B6EeJJs3xJT+aDXvbtvdzGeqH/TOeZxbFSkKvuz5Y+9Xgjyvz2CYHx2JYyMxxQ1+uleqvy0ogK21fTVPQ0ZxWgDbudXaLKdyhL2fnY0lFNKpThlulldqp31JeT8wtLc3l92RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ON91Etgl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BF8C4CED6;
	Fri, 21 Feb 2025 21:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740173168;
	bh=e6FP5rMsM9QldxBxgKUh/Xlk2sImzDtlxWc7RP2v5vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ON91Etglnvbjw8rrlaZw4oBZTVdnKCEPRQQbOFv1KN8zemGOCitRgkWR6TC7MD/6T
	 MMEBk0StzOyjqR+EdnEyos0o6DhTAcegQ1lEF1LoPnXMQMHK/SC9R4+CQQMMQiHEfJ
	 X7jmBSnivKLlnjmQanQYxC1vYaFkl3So/4ueVLPTva54kGvpK9bNCcgABmtSwBE4xI
	 Ix7vHK0Kfb3eRaabGFWSDUrwnITjQWuK9Srt158Q0PDmZuDtnlSZ4pFkPOxSD8L9Ge
	 Rl8tiGrUiHoc6REySVeS2GIu4WlXQSkblmpLodnje78nwvkpO+ETXHqO/caB13jDNY
	 xqHOy+1aMISbQ==
Date: Fri, 21 Feb 2025 13:26:03 -0800
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: hdrcheck: fix cross build with clang
Message-ID: <20250221212603.GA3561672@ax162>
References: <20250221212017.809382-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221212017.809382-1-arnd@kernel.org>

On Fri, Feb 21, 2025 at 10:20:07PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The headercheck tries to call clang with a mix of compiler arguments
> that don't include the target architecture. When building e.g. x86
> headers on arm64, this produces a warning like
> 
>    clang: warning: unknown platform, assuming -mfloat-abi=soft
> 
> Add in the CLANG_FLAGS, which contain the target, in order to make it
> build properly.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This looks like a similar problem as the one fixed by
commit 1b71c2fb04e7 ("kbuild: userprogs: fix bitsize and target
detection on clang"), should it be addressed in the same manner
(especially since I think the Fixes commit would be the same)? Given
that the filter expression is the same, maybe it would be possible to
unify them but that could happen as a follow up.

> ---
>  usr/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index 58a9cbe4eba4..99f9e904adcd 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -10,7 +10,7 @@ UAPI_CFLAGS := -std=c90 -Wall -Werror=implicit-function-declaration
>  
>  # In theory, we do not care -m32 or -m64 for header compile tests.
>  # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
> -UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> +UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS) $(CLANG_FLAGS))
>  
>  # USERCFLAGS might contain sysroot location for CC.
>  UAPI_CFLAGS += $(USERCFLAGS)
> -- 
> 2.39.5
> 

