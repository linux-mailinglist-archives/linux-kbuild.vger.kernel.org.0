Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC3132C90C
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 02:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353066AbhCDBCK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 20:02:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:56630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1386545AbhCDAbl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 19:31:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58C3F64E67;
        Thu,  4 Mar 2021 00:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614817859;
        bh=cG2NMExV7RKwp4loVOfSt61stR3Ekjm51xkrLH9YtKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mYbLPZ8ppcXg7nNOUTIPI93C6nUkkEjnZiT4kEfVyjSbF90gVFNd+gS8MucV4OzxR
         aE5FL8fbIs2Sptm5uiWb1dgHctrZbql6xBb1DOJ9R4hfcTA0SVxbOrJcYCeIu28iLE
         PEp/vOZjFgeHM1fv20FYZCuXfUzvK16AY6S/AClduuy/oaFDzY2jH5uXDaZyJ0Mv7A
         Js8m2/1q7wibXLjKZU7kGOQLkOKxsEaawBIuX8eO6vKMX9C+bmqOkS+oRCqI4JZx5T
         6tUb5PAecLGyGltgGHenPki9CGDxaD8HJbDmvf8r/1kJSu6KxetlieFgAPPMN3SNvV
         WQL2aFp5JVIpg==
Date:   Wed, 3 Mar 2021 17:30:55 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] kbuild: dwarf: use AS_VERSION instead of
 test_dwarf5_support.sh
Message-ID: <20210304003055.tsrqewikdekbhhax@archlinux-ax161>
References: <20210303183333.46543-1-masahiroy@kernel.org>
 <20210303183333.46543-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303183333.46543-4-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 04, 2021 at 03:33:33AM +0900, Masahiro Yamada wrote:
> The test code in scripts/test_dwarf5_support.sh is somewhat difficult
> to understand, but after all, we want to check binutils >= 2.35.2
> 
> >From the former discussion, the requrement for generating DRAWF v5 from
> C code is as follows:
> 
>  - gcc + binutils as     -> requires gcc 5.0+ (but 7.0+ for full support)
>  - clang + binutils as   -> requires binutils 2.35.2+
>  - clang + integrated as -> OK
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  lib/Kconfig.debug              | 3 +--
>  scripts/test_dwarf5_support.sh | 8 --------
>  2 files changed, 1 insertion(+), 10 deletions(-)
>  delete mode 100755 scripts/test_dwarf5_support.sh
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 2779c29d9981..f3337a38925d 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -284,8 +284,7 @@ config DEBUG_INFO_DWARF4
>  
>  config DEBUG_INFO_DWARF5
>  	bool "Generate DWARF Version 5 debuginfo"
> -	depends on GCC_VERSION >= 50000 || CC_IS_CLANG
> -	depends on CC_IS_GCC || $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
> +	depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && AS_IS_GNU && AS_VERSION >= 23502) || (CC_IS_CLANG && AS_IS_LLVM)
>  	depends on !DEBUG_INFO_BTF
>  	help
>  	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
> diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> deleted file mode 100755
> index c46e2456b47a..000000000000
> --- a/scripts/test_dwarf5_support.sh
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -# Test that the assembler doesn't need -Wa,-gdwarf-5 when presented with DWARF
> -# v5 input, such as `.file 0` and `md5 0x00`. Should be fixed in GNU binutils
> -# 2.35.2. https://sourceware.org/bugzilla/show_bug.cgi?id=25611
> -echo '.file 0 "filename" md5 0x7a0b65214090b6693bd1dc24dd248245' | \
> -  $* -gdwarf-5 -Wno-unused-command-line-argument -c -x assembler -o /dev/null -
> -- 
> 2.27.0
> 
