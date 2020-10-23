Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD20B2976BA
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Oct 2020 20:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464910AbgJWSSJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Oct 2020 14:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373222AbgJWSSJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Oct 2020 14:18:09 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D186C0613CE;
        Fri, 23 Oct 2020 11:18:09 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id k9so2043325qki.6;
        Fri, 23 Oct 2020 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ApmfhOk09K1c2h42K2OFIKlhksWgTdh0h8R2DYpKkGg=;
        b=M74xl8cYZSW0prcIqN7ut2RW7gUef6hRHZUtdYXmWenCI8kT2/007Ghy3Mrdi9iigB
         4VE1XBPu9F67xCjKCd2fMYwbIqPiRdV4BEOG27bbrxE1AQVuooKre/Fdg0ybBYHA6FTb
         u65jpA9e30UACimGxh4X7eD807T0FNjv6VSdGcR6FcuXkoaq68HabDbflLJSuHI9QnRX
         JB5CvNgyucygA77M8KwrS3aHkb2V4GHzJifwlATJqysjm1DE2RjpQUJ3ChXL99vUlOB+
         P80OshneXOkR01/AVozsgWNvSLdd/wo3WSJ0sF0r8URRVb3ELgahRINkbLyykZya75U/
         fzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ApmfhOk09K1c2h42K2OFIKlhksWgTdh0h8R2DYpKkGg=;
        b=frOzA4IraJ/uUkV7Tlg0MGFjgY5nYhZiN9MNi9p7YHt95KqUgcH+et/QhF2QMs5imS
         HZVi9qx+cM4CcAICFBYCWvKxK2jPoOxw6FFw3UcQM31oH+bYQ5t5PXe9PH0VAL+bJer7
         2kUgbW9iZVH5I3Xy8dIAzXLvRU+fwYqdAymgvmsSGQV0hfafuMbPwizVfAbml6Yse50H
         uAH8FFpH/WjHS16C5SiW7ZquVIkYuoaH7ssNr1jXkeMaaOA9pzm7gYg2zbyygzeyPnwI
         hoB7lDOYxAzgUNBQg6XYD+2Pe1Av/5jn8KxFGlRsItD0nQbrIOKAoG/wsRRAj621+sA4
         S6XQ==
X-Gm-Message-State: AOAM530pG+jpBpqRonaB8IgzLJ7xVNEWwncKytdM+9p1eouk5mpeCx73
        6mHFK7/+ELEmz+PtHXCLU0s=
X-Google-Smtp-Source: ABdhPJzL+Y/Y3v+RNMx6QZ7ufhfNcHgfgtL1CtQE+JhXLIEePvrmgG8+UqwAvHHf62Ohb9pq7QzyVA==
X-Received: by 2002:a37:2c07:: with SMTP id s7mr3521015qkh.297.1603477088197;
        Fri, 23 Oct 2020 11:18:08 -0700 (PDT)
Received: from ubuntu-m3-large-x86 ([2604:1380:45d1:2600::3])
        by smtp.gmail.com with ESMTPSA id z13sm1280146qkl.2.2020.10.23.11.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:18:07 -0700 (PDT)
Date:   Fri, 23 Oct 2020 11:18:05 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove unused OBJSIZE
Message-ID: <20201023181805.GA3852821@ubuntu-m3-large-x86>
References: <patch.git-ef02981ce9bc.your-ad-here.call-01603453662-ext-3714@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <patch.git-ef02981ce9bc.your-ad-here.call-01603453662-ext-3714@work.hours>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 23, 2020 at 01:57:32PM +0200, Vasily Gorbik wrote:
> The "size" tool has been solely used by s390 to enforce .bss section usage
> restrictions in early startup code. Since commit 980d5f9ab36b ("s390/boot:
> enable .bss section for compressed kernel") and commit 2e83e0eb85ca
> ("s390: clean .bss before running uncompressed kernel") these restrictions
> have been lifted for the decompressor and uncompressed kernel and the
> size tool is now unused.
> 
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch!

> ---
>  Documentation/kbuild/llvm.rst | 5 ++---
>  Makefile                      | 4 +---
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index cf3ca236d2cc..21c847890d03 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -57,9 +57,8 @@ to enable them. ::
>  They can be enabled individually. The full list of the parameters: ::
>  
>  	make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
> -	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \
> -	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \
> -	  HOSTLD=ld.lld
> +	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
> +	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
>  
>  Currently, the integrated assembler is disabled by default. You can pass
>  ``LLVM_IAS=1`` to enable it.
> diff --git a/Makefile b/Makefile
> index d35a59f98e83..d2123c2c829a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -433,7 +433,6 @@ NM		= llvm-nm
>  OBJCOPY		= llvm-objcopy
>  OBJDUMP		= llvm-objdump
>  READELF		= llvm-readelf
> -OBJSIZE		= llvm-size
>  STRIP		= llvm-strip
>  else
>  CC		= $(CROSS_COMPILE)gcc
> @@ -443,7 +442,6 @@ NM		= $(CROSS_COMPILE)nm
>  OBJCOPY		= $(CROSS_COMPILE)objcopy
>  OBJDUMP		= $(CROSS_COMPILE)objdump
>  READELF		= $(CROSS_COMPILE)readelf
> -OBJSIZE		= $(CROSS_COMPILE)size
>  STRIP		= $(CROSS_COMPILE)strip
>  endif
>  PAHOLE		= pahole
> @@ -509,7 +507,7 @@ KBUILD_LDFLAGS :=
>  CLANG_FLAGS :=
>  
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
> -export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> +export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> -- 
> 2.25.4
