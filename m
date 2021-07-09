Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6A53C2A7D
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 22:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhGIUq4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jul 2021 16:46:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhGIUqz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jul 2021 16:46:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00ADB613B2;
        Fri,  9 Jul 2021 20:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625863451;
        bh=CQ1uaoyjJxIqi5KhvkuC3UnaAu1VcgMADpeocbtDAQM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qPTyyP4rMGxwAfln56HZ+XI48oPphnsEb01PmcQC5Xn1eLhZIPhsoGyhrSfqub1bI
         91GOsmWA1d7UNOMjtQRW1dcKSqXhrvWz1antqN3+ZktA5jOZiPt35qaPfSODNagGHu
         ygNyDlUDiErvlPZWqci69IqgzJQ7tRXICKYYXVHZsY2+JnMgHlcFCsHqMU0+ShmD+8
         g65r1duNkKCFLDOhizJZnW9Ib2NKTmNoKT7Bgqfka8A+Y5WBfR1WmKdnL0/E/PEECS
         AZLboic1uZy/yW79CDhfKsVKcBemxvEUwoxu8nZnnVlsbyYF1pcK8GAOo6kJMQ8ibR
         D55E6qVk+VDdA==
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <d0c3d556-9348-f3ff-e932-8fe247da4213@kernel.org>
Date:   Fri, 9 Jul 2021 13:44:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708232522.3118208-3-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/8/2021 4:25 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> We get constant feedback that the command line invocation of make is too
> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> target triple, or is an absolute path outside of $PATH, but it's mostly
> redundant for a given SRCARCH. SRCARCH itself is derived from ARCH
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
I tested arm, arm64, i386, riscv, and x86_64 and verified that the error 
fired for an unsupported arch. Consider this:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
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
>   Documentation/kbuild/llvm.rst |  5 +++++
>   scripts/Makefile.clang        | 34 ++++++++++++++++++++++++++++++++--
>   2 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index b18401d2ba82..80c63dd9a6d1 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -46,6 +46,11 @@ example: ::
>   
>   	clang --target=aarch64-linux-gnu foo.c
>   
> +When both ``LLVM=1`` and ``LLVM_IAS=1`` are used, ``CROSS_COMPILE`` becomes
> +unnecessary and can be inferred from ``ARCH``. Example: ::
> +
> +	ARCH=arm64 make LLVM=1 LLVM_IAS=1
> +
>   LLVM Utilities
>   --------------
>   
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 297932e973d4..956603f56724 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -1,6 +1,36 @@
> -ifneq ($(CROSS_COMPILE),)
> +# Individual arch/{arch}/Makfiles should use -EL/-EB to set intended endianness
> +# and -m32/-m64 to set word size based on Kconfigs instead of relying on the
> +# target triple.
> +ifeq ($(CROSS_COMPILE),)
> +ifneq ($(LLVM),)
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
> +endif # LLVM
> +else
>   CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
> -endif
> +endif # CROSS_COMPILE
> +
>   ifeq ($(LLVM_IAS),1)
>   CLANG_FLAGS	+= -integrated-as
>   else
> 
