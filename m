Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4D332C90B
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 02:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241533AbhCDBCE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 20:02:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346274AbhCDARF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 19:17:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4CC864F23;
        Wed,  3 Mar 2021 23:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614814676;
        bh=QCCQHrxj18Ela26CMOkkAHtcJIjeecbSIqJn3aghvGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oOxS63Mv3+Ue7LtrTZDn0Hkpt2HXFchTv0kaM+nSyyyqQUBfBACIPtegIG3xMeI3x
         63XSKFLcCTqAsbL5LBiDga/iUBy9KLkSbCqfXT2y5vcrWlUmal5AXbmIoYhtorjKgR
         fOQqq5/scBG+oBexGS9XRh0xeXvA/sSysahsm1mNWo3E3dT/5FX/vHuEdbeJ32gGD3
         cFc960EgqGEbt13uOUh8Th6IkJl0m/YToHrZIfaDwMAjtwSEgOAtGwWKwRkgIgXDJB
         FpfW5HPDbbCiXVl8MTsdk3EGMDdVP9mX7Jxbr/Y2QDnLzpWehlmj1ZO1h6ot3xXINj
         RZkxDu45j+N6A==
Date:   Wed, 3 Mar 2021 16:37:51 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] kbuild: remove LLVM=1 test from HAS_LTO_CLANG
Message-ID: <20210303233751.k5tkmjdt627oucn3@archlinux-ax161>
References: <20210303183333.46543-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303183333.46543-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 04, 2021 at 03:33:30AM +0900, Masahiro Yamada wrote:
> This guarding is wrong. As Documentation/kbuild/llvm.rst notes, LLVM=1
> switches the default of tools, but you can still override CC, LD, etc.
> individually.
> 
> BTW, LLVM is not 1/0 flag. If LLVM is not passed in, it is empty.
> 
> Non-zero return code is all treated as failure anyway.
> 
> So, $(success,test $(LLVM) -eq 1) and $(success,test "$(LLVM)" = 1)
> works equivalently in the sense that both are expanded to 'n' if LLVM
> is not given. The difference is that the former internally fails due
> to syntax error.
> 
>   $ test ${LLVM} -eq 1
>   bash: test: -eq: unary operator expected
>   $ echo $?
>   2
> 
>   $ test "${LLVM}" -eq 1
>   bash: test: : integer expression expected
>   $ echo $?
>   2
> 
>   $ test "${LLVM}" = 1
>   echo $?
>   1
> 
>   $ test -n "${LLVM}"
>   $ echo $?
>   1
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Yes, there is not too much point of checking if $(LLVM) is set or not
because we already check for the other tools.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  arch/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 2bb30673d8e6..2af10ebe5ed0 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -632,7 +632,6 @@ config HAS_LTO_CLANG
>  	def_bool y
>  	# Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
>  	depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD
> -	depends on $(success,test $(LLVM) -eq 1)
>  	depends on $(success,test $(LLVM_IAS) -eq 1)
>  	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
>  	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
> -- 
> 2.27.0
> 
