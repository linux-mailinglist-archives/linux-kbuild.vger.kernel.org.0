Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2973E2FEA
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Aug 2021 21:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhHFTxT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Aug 2021 15:53:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:37184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232086AbhHFTxT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Aug 2021 15:53:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B09361050;
        Fri,  6 Aug 2021 19:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628279582;
        bh=BcLDKj7BNKRtjpjR5WcTLxkB9iMSb4PMd3ghgcahvXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BVzg6QCVo4RumqCV4MtsueL+OHKlz8ZkExb9h5a2zbbm6visuE/f+XcBNWUj7BIcP
         2qMMvGvBMnkHNbDqR7qWxBQimBsm1PFgPDrI3/xYckDEILuPZvalxOgWqHKW7vcTun
         zByk+jQCrO3YLut3VT0AbNbX4Xt8MAwp5i+w3pdlTFH7N1/fVUc/oREBsleEVP/6bU
         3U7JuHQj4EHpQN6GVtxHmODxmnjX6CvRInqgZx4hZPrsZ/MuIbYxDAyAkAl06u5Wa+
         41bvylD8pQ4dXoaiTVBcbfwbwbTqy81yTYbSjcemD2fN99yGzafUOAc98k1wOwWiBr
         SbbhWhs9XLTKg==
Date:   Fri, 6 Aug 2021 12:52:56 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Khem Raj <raj.khem@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v2] scripts/Makefile.clang: default to LLVM_IAS=1
Message-ID: <YQ2TGPwjvn8w4rKs@archlinux-ax161>
References: <20210806172701.3993843-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806172701.3993843-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 06, 2021 at 10:27:01AM -0700, Nick Desaulniers wrote:
> LLVM_IAS=1 controls enabling clang's integrated assembler via
> -integrated-as. This was an explicit opt in until we could enable
> assembler support in Clang for more architecures. Now we have support
> and CI coverage of LLVM_IAS=1 for all architecures except a few more
> bugs affecting s390 and powerpc.

The powerpc and s390 folks have been testing with clang, I think they
should have been on CC for this change (done now).

> This commit flips the default from opt in via LLVM_IAS=1 to opt out via
> LLVM_IAS=0.  CI systems or developers that were previously doing builds
> with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
> explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
> opted-in.
> 
> This finally shortens the command line invocation when cross compiling
> with LLVM to simply:
> 
> $ make ARCH=arm64 LLVM=1
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

I am still not really sure how I feel about this. I would prefer not to
break people's builds but I suppose this is inevitabile eventually.

A little support matrix that I drafted up where based on ARCH and clang
version for LLVM_IAS=1 support:

             | 10.x | 11.x | 12.x | 13.x | 14.x |
ARCH=arm     |  NO  |  NO  |  NO  |  YES |  YES |
ARCH=arm64   |  NO  |  YES |  YES |  YES |  YES |
ARCH=i386    |  YES |  YES |  YES |  YES |  YES |
ARCH=mips*   |  YES |  YES |  YES |  YES |  YES |
ARCH=powerpc |  NO  |  NO  |  NO  |  NO  |  NO  |
ARCH=s390    |  NO  |  NO  |  NO  |  NO  |  NO  |
ARCH=x86_64  |  NO  |  YES |  YES |  YES |  YES |

The main issue that I have with this change is that all of these
architectures work fine with CC=clang and their build commands that used
to work fine will not with this change, as they will have to specify
LLVM_IAS=0. I think that making this change for LLVM=1 makes sense but
changing the default for just CC=clang feels like a bit much at this
point in time. I would love to hear from others on this though, I am not
going to object much further than this.

Regardless of that concern, this patch does what it says so:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Changes v1 -> v2:
> * Drop "Currently" from Documentation/, as per Matthew.
> * Drop Makefile and riscv Makefile, rebase on
>   https://lore.kernel.org/lkml/20210805150102.131008-1-masahiroy@kernel.org/
>   as per Masahiro.
> * Base is kbuild/for-next, plus
>   https://lore.kernel.org/lkml/20210802183910.1802120-1-ndesaulniers@google.com/
>   https://lore.kernel.org/lkml/20210805150102.131008-1-masahiroy@kernel.org/.
> 
>  Documentation/kbuild/llvm.rst | 14 ++++++++------
>  scripts/Makefile.clang        |  6 +++---
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index f8a360958f4c..e87ed5479963 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
>  	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>  	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
>  
> -Currently, the integrated assembler is disabled by default. You can pass
> -``LLVM_IAS=1`` to enable it.
> +The integrated assembler is enabled by default. You can pass ``LLVM_IAS=0`` to
> +disable it.
>  
>  Omitting CROSS_COMPILE
>  ----------------------
>  
>  As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
>  
> -Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> -``--prefix=<path>`` to search for the GNU assembler and linker.
> -
>  If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
>  from ``ARCH``.
>  
> @@ -78,7 +75,12 @@ That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
>  
>  For example, to cross-compile the arm64 kernel::
>  
> -	make ARCH=arm64 LLVM=1 LLVM_IAS=1
> +	make ARCH=arm64 LLVM=1
> +
> +If ``LLVM_IAS=0`` is specified, ``CROSS_COMPILE`` is also used to derive
> +``--prefix=<path>`` to search for the GNU assembler and linker. ::
> +
> +	make ARCH=arm64 LLVM=1 LLVM_IAS=0 CROSS_COMPILE=aarch64-linux-gnu-
>  
>  Supported Architectures
>  -----------------------
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 1f4e3eb70f88..3ae63bd35582 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -22,12 +22,12 @@ else
>  CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
>  endif # CROSS_COMPILE
>  
> -ifeq ($(LLVM_IAS),1)
> -CLANG_FLAGS	+= -integrated-as
> -else
> +ifeq ($(LLVM_IAS),0)
>  CLANG_FLAGS	+= -no-integrated-as
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +else
> +CLANG_FLAGS	+= -integrated-as
>  endif
>  CLANG_FLAGS	+= -Werror=unknown-warning-option
>  KBUILD_CFLAGS	+= $(CLANG_FLAGS)
> 
> base-commit: d7a86429dbc691bf540688fcc8542cc20246a85b
> prerequisite-patch-id: 0d3072ecb5fd06ff6fd6ea81fe601f6c54c23910
> prerequisite-patch-id: 2654829756eb8a094a0ffad1679caa75a4d86619
> prerequisite-patch-id: a51e7885ca2376d008bbf146a5589da247806f7b
> prerequisite-patch-id: 6a0342755115ec459610657edac1075f069faa3d
> -- 
> 2.32.0.605.g8dce9f2422-goog
> 
