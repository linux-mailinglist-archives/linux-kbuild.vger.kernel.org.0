Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60CD34E6E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Mar 2021 13:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhC3Lui (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Mar 2021 07:50:38 -0400
Received: from vulcan.natalenko.name ([104.207.131.136]:51662 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbhC3Lu2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Mar 2021 07:50:28 -0400
Received: from localhost (kaktus.kanapka.ml [151.237.229.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id C253DA097EB;
        Tue, 30 Mar 2021 13:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1617105023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2qLsWX1x+rTNov0mLCK2bfYYZ/19Z9kvWQ6aFEEfiuk=;
        b=YlB63PuC7AhJe1TaGiPRB3Ogxf1xILpkhnnXiqsDMkHcW25lbskYWW/C3XVCAI5vBiWGYL
        8YoPpUxZDgVwqsaAksG/vB6iNGCxzgaaamIrvlbvzNE7HD3amFmOCbW9Lz0LhzYuiFY9CV
        HKhXCYnZYjUt6pEo8vQiLdH6ZEpDAiA=
Date:   Tue, 30 Mar 2021 13:50:23 +0200
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     Piotr Gorski <lucjan.lucjanov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Valentin Schneider <valentin.schneider@arm.com>,
        "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>,
        Nick Terrell <terrelln@fb.com>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH] init: add support for zstd compressed modules
Message-ID: <20210330115023.qt742qsdekwiroey@spock.localdomain>
References: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 30, 2021 at 01:32:35PM +0200, Piotr Gorski wrote:
> kmod 28 supports modules compressed in zstd format so let's add this possibility to kernel.
> 
> Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> ---
>  Makefile     | 7 +++++--
>  init/Kconfig | 9 ++++++---
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5160ff8903c1..82f4f4cc2955 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1156,8 +1156,8 @@ endif # INSTALL_MOD_STRIP
>  export mod_strip_cmd
>  
>  # CONFIG_MODULE_COMPRESS, if defined, will cause module to be compressed
> -# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP
> -# or CONFIG_MODULE_COMPRESS_XZ.
> +# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP,
> +# CONFIG_MODULE_COMPRESS_XZ, or CONFIG_MODULE_COMPRESS_ZSTD.
>  
>  mod_compress_cmd = true
>  ifdef CONFIG_MODULE_COMPRESS
> @@ -1167,6 +1167,9 @@ ifdef CONFIG_MODULE_COMPRESS
>    ifdef CONFIG_MODULE_COMPRESS_XZ
>      mod_compress_cmd = $(XZ) --lzma2=dict=2MiB -f
>    endif # CONFIG_MODULE_COMPRESS_XZ
> +  ifdef CONFIG_MODULE_COMPRESS_ZSTD
> +    mod_compress_cmd = $(ZSTD) -T0 --rm -f -q
> +  endif # CONFIG_MODULE_COMPRESS_ZSTD
>  endif # CONFIG_MODULE_COMPRESS
>  export mod_compress_cmd
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index 8c2cfd88f6ef..86a452bc2747 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2250,8 +2250,8 @@ config MODULE_COMPRESS
>  	bool "Compress modules on installation"
>  	help
>  
> -	  Compresses kernel modules when 'make modules_install' is run; gzip or
> -	  xz depending on "Compression algorithm" below.
> +	  Compresses kernel modules when 'make modules_install' is run; gzip,
> +	  xz, or zstd depending on "Compression algorithm" below.
>  
>  	  module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
>  
> @@ -2273,7 +2273,7 @@ choice
>  	  This determines which sort of compression will be used during
>  	  'make modules_install'.
>  
> -	  GZIP (default) and XZ are supported.
> +	  GZIP (default), XZ, and ZSTD are supported.
>  
>  config MODULE_COMPRESS_GZIP
>  	bool "GZIP"
> @@ -2281,6 +2281,9 @@ config MODULE_COMPRESS_GZIP
>  config MODULE_COMPRESS_XZ
>  	bool "XZ"
>  
> +config MODULE_COMPRESS_ZSTD
> +	bool "ZSTD"
> +
>  endchoice
>  
>  config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
> -- 
> 2.31.0.97.g1424303384
> 

Great!

Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>

This works perfectly fine in Arch Linux if accompanied by the
following mkinitcpio amendment: [1].

I'm also Cc'ing other people from get_maintainers output just
to make this submission more visible.

Thanks.

[1] https://github.com/archlinux/mkinitcpio/pull/43

-- 
  Oleksandr Natalenko (post-factum)
