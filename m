Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 076F619D2C8
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2020 10:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389263AbgDCI5W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 04:57:22 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36613 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbgDCI5V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 04:57:21 -0400
Received: by mail-oi1-f194.google.com with SMTP id k18so5501120oib.3;
        Fri, 03 Apr 2020 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C4Cc3e3DiPb3eBwNbjf2uE1eQf9O0o8a3T9Uq54vf3c=;
        b=XhpBRE/wxAJ+lesMndcQLAFLKZqy37YsCBpBI+saa/A8fbn/O6jEcTPJySE0HfwYYX
         zGxO4AxTF8P0U/NUoztaPD9a0s870qIH5E715ynnWDsSxHP28xI7gE+orX1/5ovhNhWn
         q5hAAEwPas8wtGnIAhs0ZCeIvXdeKNJ5u06dv3kQuXPHrMCUC16nbqjba78OCFgrBQrS
         Dhg6uXZjPF3w1z07tMmgn1MRlJYl9vb6+HZh6PGPgPeWvansvt01gUTNmjH0cQu0GTwS
         3R/G6oXKFiyNU5DEWsVG/1CYl94KEcWn5IZyvo+x+niwZnh1S/MOS6QKBgfcEPoO8sn/
         67eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C4Cc3e3DiPb3eBwNbjf2uE1eQf9O0o8a3T9Uq54vf3c=;
        b=IlElZ4KHDrubQeMtFjdQ8dHddNVUoDy27Bm7Cy6UlPujqI9bJT1CxF7IqSmFC7yp4f
         3G9t1vEEW3p5ZQM7ZQyOL2cDJ3uDMx3OYJ5Qw5ujJyzWYbMleFOXvWHLEEC1SELy7/ET
         Dzy1iIJ5p8duldOJMBcoqRCG7i2htybuJLKQbbJrpt1WDYs84ITYqoRNtWRxMxs5yOFd
         G0ZIGG5V/QLwKdVbzs4YGNzjT5ZWG33fvXaHmqWDxh6Qmo+GdEdaioqFaFvGwS1UYTnn
         xQ3Q6qAu4/eD47MXnjACdvPDL4OS/kxjrQJVk2z5uicRCznX1wJCXOCjf6qt/sQJNJUM
         V9sQ==
X-Gm-Message-State: AGi0PuYHlolbuS67L9A2kREvn5okIMa80Lj5EG9VuX/Tq2c2YFQ4c5yO
        j4azJ0kRSBKnQdFwmeuUG7A=
X-Google-Smtp-Source: APiQypLUivYF4yk6PsrH1Gmc2ZiaD0Dp5rCnUH1vbaut+RNz2omE1RD7Itl+CmRYe+BIaZya8pkKng==
X-Received: by 2002:aca:4e47:: with SMTP id c68mr2318714oib.16.1585904240942;
        Fri, 03 Apr 2020 01:57:20 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id m20sm1966298otj.37.2020.04.03.01.57.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 01:57:20 -0700 (PDT)
Date:   Fri, 3 Apr 2020 01:57:19 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to
 Clang/LLVM
Message-ID: <20200403085719.GA9282@ubuntu-m2-xlarge-x86>
References: <20200403051709.22407-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403051709.22407-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Fri, Apr 03, 2020 at 02:17:09PM +0900, Masahiro Yamada wrote:
> As Documentation/kbuild/llvm.rst implies, building the kernel with a
> full set of LLVM tools gets very verbose and unwieldy.
> 
> Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> GCC and Binutils. You can pass LLVM=1 from the command line or as an
> environment variable. Then, Kbuild will use LLVM toolchains in your
> PATH environment.
> 
> Please note LLVM=1 does not turn on the LLVM integrated assembler.
> You need to explicitly pass AS=clang to use it. When the upstream
> kernel is ready for the integrated assembler, I think we can make
> it default.

I agree this should be the default but I think it should probably be
called out somewhere in the documentation as well since users might not
expect to have to have a cross assembler installed.

> We discussed what we need, and we agreed to go with a simple boolean
> switch (https://lkml.org/lkml/2020/3/28/494).
> 
> Some items in the discussion:
> 
> - LLVM_DIR
> 
>   When multiple versions of LLVM are installed, I just thought supporting
>   LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
> 
>   CC      = $(LLVM_DIR)clang
>   LD      = $(LLVM_DIR)ld.lld
>     ...
> 
>   However, we can handle this by modifying PATH. So, we decided to not do
>   this.
> 
> - LLVM_SUFFIX
> 
>   Some distributions (e.g. Debian) package specific versions of LLVM with
>   naming conventions that use the version as a suffix.
> 
>   CC      = clang$(LLVM_SUFFIX)
>   LD      = ld.lld(LLVM_SUFFIX)
>     ...
> 
>   will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
>   but the suffixed versions in /usr/bin/ are symlinks to binaries in
>   /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
> 
> - HOSTCC, HOSTCXX, etc.
> 
>   We can switch the host compilers in the same way:
> 
>   ifneq ($(LLVM),)
>   HOSTCC       = clang
>   HOSTCXX      = clang++
>   else
>   HOSTCC       = gcc
>   HOSTCXX      = g++
>   endif

I would personally like to see this but I do not have the strongest
opinion.

>   This may the right thing to do, but I could not make up my mind.
>   Because we do not frequently switch the host compiler, a counter
>   solution I had in my mind was to leave it to the default of the
>   system.
> 
>   HOSTCC       = cc
>   HOSTCXX      = c++
> 
>   Many distributions support update-alternatives to switch the default
>   to GCC, Clang, or whatever, but reviewers were opposed to this
>   approach. So, this commit does not touch the host tools.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/kbuild.rst |  5 +++++
>  Documentation/kbuild/llvm.rst   |  5 +++++
>  Makefile                        | 20 ++++++++++++++++----
>  3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 510f38d7e78a..2d1fc03d346e 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -262,3 +262,8 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
>  These two variables allow to override the user@host string displayed during
>  boot and in /proc/version. The default value is the output of the commands
>  whoami and host, respectively.
> +
> +LLVM
> +----
> +If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
> +of GCC and GNU binutils to build the kernel.
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index d6c79eb4e23e..4602369f6a4f 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -55,6 +55,11 @@ additional parameters to `make`.
>  	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
>  	  HOSTLD=ld.lld
>  
> +You can use a single switch `LLVM=1` to use LLVM utilities by default (except
> +for building host programs).
> +
> +	make LLVM=1 HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> +
>  Getting Help
>  ------------
>  
> diff --git a/Makefile b/Makefile
> index c91342953d9e..6db89ecdd942 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -409,16 +409,28 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>  KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>  
>  # Make variables (CC, etc...)
> -LD		= $(CROSS_COMPILE)ld
> -CC		= $(CROSS_COMPILE)gcc
>  CPP		= $(CC) -E
> +ifneq ($(LLVM),)
> +CC		= clang
> +LD		= ld.lld
> +AR		= llvm-ar
> +NM		= llvm-nm
> +OBJCOPY		= llvm-objcopy
> +OBJDUMP		= llvm-objdump
> +READELF		= llvm-readelf
> +OBJSIZE		= llvm-size
> +STRIP		= llvm-strip
> +else
> +CC		= $(CROSS_COMPILE)gcc
> +LD		= $(CROSS_COMPILE)ld
>  AR		= $(CROSS_COMPILE)ar
>  NM		= $(CROSS_COMPILE)nm
> -STRIP		= $(CROSS_COMPILE)strip
>  OBJCOPY		= $(CROSS_COMPILE)objcopy
>  OBJDUMP		= $(CROSS_COMPILE)objdump
> -OBJSIZE		= $(CROSS_COMPILE)size
>  READELF		= $(CROSS_COMPILE)readelf
> +OBJSIZE		= $(CROSS_COMPILE)size
> +STRIP		= $(CROSS_COMPILE)strip
> +endif
>  PAHOLE		= pahole
>  LEX		= flex
>  YACC		= bison
> -- 
> 2.17.1
> 

I have verified that the variables get their correct value with LLVM=1
and that they are still overridable.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
