Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0325B3E1BA3
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 20:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241251AbhHESqZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 14:46:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:40796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241583AbhHESqZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 14:46:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B215F60F01;
        Thu,  5 Aug 2021 18:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628189170;
        bh=Bdu1IVhpkrpzTBly0e81WLlBUlSkIup7ZFwVra1sxac=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RIRPV49xtzJE48PquQUEG1on9n+WPaEfO6ZM8Psb5nUIv//tzxPvAh6o5Hy8zcxea
         g8e/hmPbBLrL8WQ9dYcb8TKph1uOrBUGtzqM0ERjQE/nS0YXUyIQkVbbPrufayqkd/
         yBL2y54hnLK2pZWplhf8bm00fYRQs5qDMHfAh85kp9CnHbzOeoR3XuBMWO6MQioR3t
         xPgxiyr3nqAGKLurgeml3OmuCnWTZz4SUVxnf4Tgit5IMuv6SBMr8BZDcWtJLAlFtm
         yjqasM3MbExKqZJIBOGykkuxwS7hQ43o/45vmafKgm+qrbfxTtQvC2jLUB7CZw+cg+
         f7kIJt6ZnVHRw==
Subject: Re: [PATCH] kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20210805150102.131008-1-masahiroy@kernel.org>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <59ce441e-8deb-39ff-700f-4e1c4e871177@kernel.org>
Date:   Thu, 5 Aug 2021 11:46:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805150102.131008-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/5/2021 8:01 AM, Masahiro Yamada wrote:
> LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
> and it should be used only for that purpose.
> 
> LLVM_IAS is checked in some places to determine the assembler type,
> but it is not precise.
> 
>   $ make CC=gcc LLVM_IAS=1
> 
> ... will use the GNU assembler since LLVM_IAS=1 is effective only when
> $(CC) is clang.
> 
> Of course, the combination of CC=gcc and LLVM_IAS=1 does not make
> sense, but the build system can be more robust against such insane
> input.
> 
> Commit ba64beb17493a ("kbuild: check the minimum assembler version in
> Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
> because Kconfig checks the version string from the assembler in use.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>   Makefile            | 2 +-
>   arch/riscv/Makefile | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4ab151060931..8b56c9692c3c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -844,7 +844,7 @@ else
>   DEBUG_CFLAGS	+= -g
>   endif
>   
> -ifneq ($(LLVM_IAS),1)
> +ifndef CONFIG_AS_IS_LLVM
>   KBUILD_AFLAGS	+= -Wa,-gdwarf-2
>   endif
>   
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..dcfbd2a87d41 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -41,7 +41,7 @@ endif
>   ifeq ($(CONFIG_LD_IS_LLD),y)
>   	KBUILD_CFLAGS += -mno-relax
>   	KBUILD_AFLAGS += -mno-relax
> -ifneq ($(LLVM_IAS),1)
> +ifndef CONFIG_AS_IS_LLVM
>   	KBUILD_CFLAGS += -Wa,-mno-relax
>   	KBUILD_AFLAGS += -Wa,-mno-relax
>   endif
> 
