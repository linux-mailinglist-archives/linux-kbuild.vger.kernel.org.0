Return-Path: <linux-kbuild+bounces-7356-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF6CACBD07
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Jun 2025 00:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B1501890331
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 22:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D81424DD1B;
	Mon,  2 Jun 2025 22:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwoxjXT2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8CC19F48D;
	Mon,  2 Jun 2025 22:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901876; cv=none; b=c6UqlrGZkfPTrqvySK7rjRsqy4py8O9ia5Kirkp/5i45WFVciW2Q0fTbHWS7LR71/lMifvZ5CjH45LurfvLaQBlzEd05EANF6Bb96eqaAoCGhZz474/953EUMKK7bLj2fxpp9v18+PXfVPS/9DBYDEmsGSTuxwe1JQ8Mb4fUBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901876; c=relaxed/simple;
	bh=hzkud8Wfv+5IkBqVKmVQ+LgfshqDcFjpQEtX3pBzTkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ehjw7PB625ReRnAxlEh2HOicKANwinwrcUVCCgrLMTiDW4Yzg3y5Qp/2irHO0VoytHUyBNiiGpC+f90vv2X+rj2+lbgsRU+wwFzVcoMLIwSd12x5PIRn/hf1Ib9H1czuVnO7aZfuxmpVjjO8qb/kb1CkD+tVEDfCtK2j27PLpCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwoxjXT2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED897C4CEEB;
	Mon,  2 Jun 2025 22:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748901875;
	bh=hzkud8Wfv+5IkBqVKmVQ+LgfshqDcFjpQEtX3pBzTkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwoxjXT2szQLGChzjUOCESjdIm76sHIFm7Qleso0AgOC4+4szjnNtsEMfCAAT0Yk/
	 o4jWqmYBm+I2ldhWkv9WTIyPrJ0FvCzeu7wiIpvon68Ijn3yDg1qusxzp4Od06yu/6
	 lhRlbkAdnR0TTVsng/uExVxZli8DNY8WTFutoKCbFmt31UHulwMA5Zi7IYl0d2skXd
	 ayOZyAcR3bzgYO6jsbz2iBQG36H9W7ITxf4JD0jQ5xf2Gmol9fvDn0EckIdjRbqmSa
	 Kz3wj++6KrcN0oA57qycSF43I00JHcHwppN/xdX/XuE1AtmmBRp2R+pJgrfMfOyW56
	 IgTcglYA6Rg8w==
Date: Mon, 2 Jun 2025 15:04:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: set y instead of 1 to
 KBUILD_{BUILTIN,MODULES}
Message-ID: <20250602220431.GA924363@ax162>
References: <20250602181256.529033-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602181256.529033-1-masahiroy@kernel.org>

On Tue, Jun 03, 2025 at 03:12:53AM +0900, Masahiro Yamada wrote:
> KBUILD_BUILTIN is set to 1 unless you are building only modules.
> 
> KBUILT_MODULES is set to 1 when you are building only modules
> (a typical use case is "make modules").
> 
> It is more useful to set them to 'y' instead, so we can do
> something like:
> 
>     always-$(KBUILD_BUILTIN) += vmlinux.lds
> 
> This works equivalently to:
> 
>     extra-y                  += vmlinux.lds
> 
> This allows us to deprecate extra-y. extra-y and always-y are quite
> similar, and we do not need both.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  Documentation/kbuild/makefiles.rst |  8 ++++++--
>  Makefile                           | 16 ++++++++--------
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 3b9a8bc671e2..264b83182509 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -273,8 +273,8 @@ It is good practice to use a ``CONFIG_`` variable when assigning directory
>  names. This allows kbuild to totally skip the directory if the
>  corresponding ``CONFIG_`` option is neither "y" nor "m".
>  
> -Non-builtin vmlinux targets - extra-y
> --------------------------------------
> +Non-builtin vmlinux targets - extra-y (DEPRECATED)
> +--------------------------------------------------
>  
>  extra-y specifies targets which are needed for building vmlinux,
>  but not combined into built-in.a.
> @@ -291,6 +291,10 @@ Example::
>    # arch/x86/kernel/Makefile
>    extra-y	+= vmlinux.lds
>  
> +extra-y is now deprecated because this is equivalent to:
> +
> +  always-$(KBUILD_BUILTIN) += vmlinux.lds
> +
>  $(extra-y) should only contain targets needed for vmlinux.
>  
>  Kbuild skips extra-y when vmlinux is apparently not a final goal.
> diff --git a/Makefile b/Makefile
> index 7a52be3a4b80..72e75a0caa32 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -749,7 +749,7 @@ targets :=
>  # Normally, just do built-in.
>  
>  KBUILD_MODULES :=
> -KBUILD_BUILTIN := 1
> +KBUILD_BUILTIN := y
>  
>  # If we have only "make modules", don't compile built-in objects.
>  ifeq ($(MAKECMDGOALS),modules)
> @@ -761,11 +761,11 @@ endif
>  # Just "make" or "make all" shall build modules as well
>  
>  ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
> -  KBUILD_MODULES := 1
> +  KBUILD_MODULES := y
>  endif
>  
>  ifeq ($(MAKECMDGOALS),)
> -  KBUILD_MODULES := 1
> +  KBUILD_MODULES := y
>  endif
>  
>  export KBUILD_MODULES KBUILD_BUILTIN
> @@ -1193,7 +1193,7 @@ export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
>  # For the kernel to actually contain only the needed exported symbols,
>  # we have to build modules as well to determine what those symbols are.
> -KBUILD_MODULES := 1
> +KBUILD_MODULES := y
>  endif
>  
>  PHONY += vmlinux_a
> @@ -1529,7 +1529,7 @@ all: modules
>  # the built-in objects during the descend as well, in order to
>  # make sure the checksums are up to date before we record them.
>  ifdef CONFIG_MODVERSIONS
> -  KBUILD_BUILTIN := 1
> +  KBUILD_BUILTIN := y
>  endif
>  
>  # Build modules
> @@ -1538,7 +1538,7 @@ endif
>  # *.ko are usually independent of vmlinux, but CONFIG_DEBUG_INFO_BTF_MODULES
>  # is an exception.
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
> -KBUILD_BUILTIN := 1
> +KBUILD_BUILTIN := y
>  modules: vmlinux
>  endif
>  
> @@ -1855,7 +1855,7 @@ filechk_kernel.release = echo $(KERNELRELEASE)
>  
>  # We are always building only modules.
>  KBUILD_BUILTIN :=
> -KBUILD_MODULES := 1
> +KBUILD_MODULES := y
>  
>  build-dir := .
>  
> @@ -1983,7 +1983,7 @@ endif
>  
>  single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
>  
> -KBUILD_MODULES := 1
> +KBUILD_MODULES := y
>  
>  endif
>  
> -- 
> 2.43.0
> 

