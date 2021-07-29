Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACE63DADFB
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jul 2021 23:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhG2VAp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Jul 2021 17:00:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229738AbhG2VAp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jul 2021 17:00:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0683060F46;
        Thu, 29 Jul 2021 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627592442;
        bh=HmJYde0Ikwk3SEQB8+ORc71r8eGZUocfLxfK0gO2i8w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AaP0k8yOi+fuz/VKaCSzD0h7sS7r2aBhNur9XETaJFRr6cF/YjKLFwO7JGdoNC0MO
         PQq67DZKmMMHUydY2gd3pIXU0befmUj9hsmGBJch3oOZEmG/jITCw7g9A1dL70dICd
         qE6mVV5dwFMAUQqNMTzFAN+1YebIgBHUOgYCuDuSVKVm4pcfXa4BbP7+u7Xtjz/E0M
         sKVldZBxHqQ+xBjzZptNmBTmgknmJREVJKg2K0uzgfA/oN/6KgDO/JJ52sh39pNimQ
         sm/qWWTnSPEbVwvZpPixykizIhgI2qSf70NLV9YrKS4K2GWemb/4NV/hmAD+CbtSvd
         AJhh3Y6gxQS4A==
Subject: Re: [PATCH v3 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 CC=clang LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210729165039.23896-1-ndesaulniers@google.com>
 <20210729165039.23896-3-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <44117d0c-51b7-1f68-f752-ba53de503b14@kernel.org>
Date:   Thu, 29 Jul 2021 14:00:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729165039.23896-3-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I realized that the title of this commit is not really right. We are not 
inferring CROSS_COMPILE, we are inferring '--target='.

On 7/29/2021 9:50 AM, Nick Desaulniers wrote:
> We get constant feedback that the command line invocation of make is too
> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> target triple, or is an absolute path outside of $PATH, but it's mostly
> redundant for a given SRCARCH. SRCARCH itself is derived from ARCH

I feel like the beginning of this needs a little work.

1. "...invocation of make is too long when compiling with LLVM" would be 
a little more accurate.

2. "it's mostly redundant for a given SRCARCH" is not quite true in my 
eyes. For example, you could have aarch64-linux-, aarch64-elf-, or 
aarch64-linux-gnu-, and to my knowledge, all of these can compile a 
working Linux kernel. Again, saying "with LLVM", even mentioning its 
multitargeted nature, might make it a little more accurate to the casual 
passerby.

> (normalized for a few different targets).
> 
> If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
> KBUILD_CFLAGS, and KBUILD_AFLAGS based on $SRCARCH.
> 
> Previously, we'd cross compile via:
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1
> Now:
> $ ARCH=arm64 make LLVM=1 LLVM_IAS=1
> 
> For native builds (not involving cross compilation) we now explicitly
> specify a target triple rather than rely on the implicit host triple.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1399
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Changes v2 -> v3:
> * Drop check/requirement for LLVM=1, as per Masahiro.
> * Change oneliner from LLVM=1 LLVM_IAS=1 to CC=clang LLVM_IAS=1.
> * Don't carry forward Nathan's RB/TB tags. :( Sorry Nathan, but thank
>    you for testing+reviewing v2.
> * Update wording of docs slightly.
> 
> Changes v1 -> v2:
> * Fix typos in commit message as per Geert and Masahiro.
> * Use SRCARCH instead of ARCH, simplifying x86 handling, as per
>    Masahiro. Add his sugguested by tag.
> * change commit oneline from 'drop' to 'infer.'
> * Add detail about explicit host --target and relationship of ARCH to
>    SRCARCH, as per Masahiro.
> 
> Changes RFC -> v1:
> * Rebase onto linux-kbuild/for-next
> * Keep full target triples since missing the gnueabi suffix messes up
>    32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
>    drop references to arm64.
> * Flush out TODOS.
> * Add note about -EL/-EB, -m32/-m64.
> * Add note to Documentation/.
> 
>   Documentation/kbuild/llvm.rst |  6 ++++++
>   scripts/Makefile.clang        | 32 ++++++++++++++++++++++++++++++--
>   2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index b18401d2ba82..aef1587fc09b 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -46,6 +46,12 @@ example: ::
>   
>   	clang --target=aarch64-linux-gnu foo.c
>   
> +When both ``CC=clang`` (set via ``LLVM=1``) and ``LLVM_IAS=1`` are used,
> +``CROSS_COMPILE`` becomes unnecessary and can be inferred from ``ARCH``.

I am not a fan of this sentence because it implies that something like 
'make ARCH=arm64 CC=clang LLVM_IAS=1' will work fine, which is not true. 
We still need CROSS_COMPILE for binutils in this configuration.

CROSS_COMPILE provides the value for '--target=' and the prefix for the 
GNU tools such as ld, objcopy, and readelf. I think this direction is a 
regression because we are just talking about the first use of 
CROSS_COMPILE rather than the second at the same time.

With LLVM=1 LLVM_IAS=1, we KNOW that the user will be using all LLVM 
tools. Sure, they are free to override LD, OBJCOPY, READELF, etc with 
the GNU variants but they have to provide the prefix because LLVM=1 
overrides the $(CROSS_COMPILE)<tool> assignments so it is irrelevant to 
us. As Masahiro mentioned, the user is free to individually specify all 
the tools by their individual variables such as LD=ld.lld BUT at that 
point, the user should be aware of what they are doing and specify 
CROSS_COMPILE.

While I understand that the LLVM=1 LLVM_IAS=1 case works perfectly fine 
with this series, I am of the belief that making it work for CC=clang 
LLVM_IAS=1 is a mistake because there is no way for that configuration 
to work for cross compiling without CROSS_COMPILE.

At the same time, not a hill I am willing to die on, hence the tags above.

> +Example: ::
> +
> +	ARCH=arm64 make LLVM=1 LLVM_IAS=1
> +
>   LLVM Utilities
>   --------------
>   
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 297932e973d4..a1b46811bdc6 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -1,6 +1,34 @@
> -ifneq ($(CROSS_COMPILE),)
> +# Individual arch/{arch}/Makfiles should use -EL/-EB to set intended endianness

Makefiles

> +# and -m32/-m64 to set word size based on Kconfigs instead of relying on the
> +# target triple.
> +ifeq ($(CROSS_COMPILE),)
> +ifeq ($(LLVM_IAS),1)
> +ifeq ($(SRCARCH),arm)
> +CLANG_FLAGS	+= --target=arm-linux-gnueabi
> +else ifeq ($(SRCARCH),arm64)
> +CLANG_FLAGS	+= --target=aarch64-linux-gnu
> +else ifeq ($(SRCARCH),hexagon)
> +CLANG_FLAGS	+= --target=hexagon-linux-gnu
> +else ifeq ($(SRCARCH),m68k)
> +CLANG_FLAGS	+= --target=m68k-linux-gnu
> +else ifeq ($(SRCARCH),mips)
> +CLANG_FLAGS	+= --target=mipsel-linux-gnu
> +else ifeq ($(SRCARCH),powerpc)
> +CLANG_FLAGS	+= --target=powerpc64le-linux-gnu
> +else ifeq ($(SRCARCH),riscv)
> +CLANG_FLAGS	+= --target=riscv64-linux-gnu
> +else ifeq ($(SRCARCH),s390)
> +CLANG_FLAGS	+= --target=s390x-linux-gnu
> +else ifeq ($(SRCARCH),x86)
> +CLANG_FLAGS	+= --target=x86_64-linux-gnu
> +else
> +$(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)
> +endif # SRCARCH
> +endif # LLVM_IAS
> +else
>   CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
> -endif
> +endif # CROSS_COMPILE
> +
>   ifeq ($(LLVM_IAS),1)
>   CLANG_FLAGS	+= -integrated-as
>   else
> 
