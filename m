Return-Path: <linux-kbuild+bounces-10536-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C46D15C32
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 00:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 812F13009282
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 23:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7737325B2F4;
	Mon, 12 Jan 2026 23:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8dwzBLw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513D423D2A3;
	Mon, 12 Jan 2026 23:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768259789; cv=none; b=Z8XJcTdd6Rj49WRLDofFWYylc+QuXKo4boQ4fXPEyDxhLrl8hgJbGfoXV2PQrpd0GE+rFfZ1FJXzRbWrNmL9Xh3bTwH8wqivV4smwWeyBaWL4WZOm3BZ/dqNbvCBVhKYQnc9BaDkoZwMlTwOWymTGQeMlgDZvkJ04NKoV/jZ01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768259789; c=relaxed/simple;
	bh=rKHeyzseh0s9gnL1L1fbmVyKpPR6NF8aEZ7uuKcE1Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+9be0efqObbjFebn1d8tau23YfKa7QmPrEfpTuqSit71P+TbJKAul+YI8mfcS53alFtSkb0MTtBqH/t38DJjbgH4u5WspxSGT2tWXG5OdKL6HpYcGLZWf2YxT6j7IstZxsyZ2QJ32ggM/k2Z/mjXU4DuPkGdr/OGHer4lvbagY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8dwzBLw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F493C116D0;
	Mon, 12 Jan 2026 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768259788;
	bh=rKHeyzseh0s9gnL1L1fbmVyKpPR6NF8aEZ7uuKcE1Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8dwzBLwrlJ3Wr9IBw+8FsNVzbfeQg4edj98vtu1cVHtBBEWADDtbV2bpNvjkKDUC
	 3oxCWn737YSigqBRQxksPQI2ZUUYajKljpCIWzib5OJSptq44cC47MAvl2BuW1lRdS
	 RFoH9M4EfTJQboqnkLPj21EO/+LUNwuw6x6yyeaoWYtLi2kA+7AJeFLK/6kScKndVt
	 dnao7SeHf6JZc83cyq7vJUbKzhcZPsjFTeufeFvwlwQTQUvB4xD2z+UnEG0SG/AMJ+
	 35QXcUjrC02MBgQogHZdO/KW3Uy26M7362u0HX2OOaAXzVdFriL3MP2+SIZZmDUHpV
	 aI1hZSH5Q6BHA==
Date: Mon, 12 Jan 2026 16:16:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Reject unexpected values for LLVM=
Message-ID: <20260112231624.GA2272167@ax162>
References: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>

On Mon, Jan 12, 2026 at 07:43:52AM +0100, Thomas Weiﬂschuh wrote:
> The LLVM argument is documented to accept one of three forms:
> * a literal '1' to use the default 'clang',
> * a toolchain prefix path, ending in a trailing '/',
> * a version suffix.
> 
> All other values are silently treated as '1'. If for example
> the user accidentally forgets the trailing '/' of a toolchain prefix,
> kbuild will unexpectedly and silently fall back to the system toolchain.

Yeah, I do not think falling back to the system toolchain is great here.
This would also catch misuse of LLVM=0, since that is treated as LLVM=1,
rather than reverting to GCC + binutils.

> Instead report an error if the user specified an invalid value for LLVM.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index e404e4767944..2a085a1b6875 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -447,6 +447,8 @@ ifneq ($(filter %/,$(LLVM)),)
>  LLVM_PREFIX := $(LLVM)
>  else ifneq ($(filter -%,$(LLVM)),)
>  LLVM_SUFFIX := $(LLVM)
> +else ifneq ($(LLVM),1)
> +$(error Invalid value for LLVM=)

If having a hard error is untenable (I am not sure that it is), we could
just warn. Pointing to Documentation/kbuild/llvm.rst might be worthwhile
in the message as well.

>  endif
>  
>  HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260111-kbuild-llvm-arg-c7346a4f2b3a
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> 

