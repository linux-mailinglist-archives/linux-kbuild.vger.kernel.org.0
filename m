Return-Path: <linux-kbuild+bounces-91-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE87F2139
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 00:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2A4282810
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 23:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2623B281;
	Mon, 20 Nov 2023 23:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pm0ocCOu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B5F38DF8;
	Mon, 20 Nov 2023 23:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B7BC433C8;
	Mon, 20 Nov 2023 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700521699;
	bh=CFqoX8V2WNEiSzZISkGpjZgqDIO60dgqCnVyQdufY0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pm0ocCOuOM935pl00FZ7y8WqMAQHOpgOGaD6c9Umz3wSPv+b+ywRvOFVrGqJDsjpe
	 MOsKExWGV46pb4wNHQhYNdmWdwFDRVCR/NvTlAfJC8ZM0zlAVG239yHgDJBfDTh0wJ
	 5LibP1FfBpF5Cnazh/45hzIPRACn0/CDLcwOYP6Iqmd1SaJ5Oc2HzW07QFFy7Nslwn
	 Tn0X8yTzXAP70Gn8/WJ9CKIXnxzSTXPbukl5EMSXBQ6uXbqxGX11uklzQfh/I/Hux8
	 f4kJEYXAQR/Hsg36Qvqtp9TMUhuYYzAyQubKIN/oQJclZXgxyXYXTm0EuwEnbzWrhY
	 YXmhg5H72w8Jw==
Date: Mon, 20 Nov 2023 16:08:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: WANG Rui <wangrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Jinyang He <hejinyang@loongson.cn>, Xi Ruoyao <xry111@xry111.site>,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] LoongArch: Record pc instead of offset in la-abs
 relocation
Message-ID: <20231120230817.GA2116806@dev-arch.thelio-3990X>
References: <20231116130331.241395-1-wangrui@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116130331.241395-1-wangrui@loongson.cn>

Hi Rui,

On Thu, Nov 16, 2023 at 09:03:31PM +0800, WANG Rui wrote:
> To clarify, the previous version functioned flawlessly. However, it's
> worth noting that the LLVM's LoongArch backend currently lacks support
> for cross-section label calculations. With this patch, we enable the use
> of clang to compile relocatable kernels.
> 
> Signed-off-by: WANG Rui <wangrui@loongson.cn>

Thanks a lot for the patch! This fixes the CONFIG_RELOCATABLE build for
me as well.

Tested-by: Nathan Chancellor <nathan@kernel.org>

Something I noticed while testing is that a kernel linked with ld.lld
does not boot while one linked with ld.bfd did. I think this might be
the same issue that Xuerui filed on our issue tracker but I figured I
would mention it in case not:
https://github.com/ClangBuiltLinux/linux/issues/1883

Cheers,
Nathan

> ---
>  arch/loongarch/include/asm/asmmacro.h | 3 +--
>  arch/loongarch/include/asm/setup.h    | 2 +-
>  arch/loongarch/kernel/relocate.c      | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/asmmacro.h b/arch/loongarch/include/asm/asmmacro.h
> index c9544f358c33..655db7d7a427 100644
> --- a/arch/loongarch/include/asm/asmmacro.h
> +++ b/arch/loongarch/include/asm/asmmacro.h
> @@ -609,8 +609,7 @@
>  	lu32i.d	\reg, 0
>  	lu52i.d	\reg, \reg, 0
>  	.pushsection ".la_abs", "aw", %progbits
> -	768:
> -	.dword	768b-766b
> +	.dword	766b
>  	.dword	\sym
>  	.popsection
>  #endif
> diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
> index a0bc159ce8bd..ee52fb1e9963 100644
> --- a/arch/loongarch/include/asm/setup.h
> +++ b/arch/loongarch/include/asm/setup.h
> @@ -25,7 +25,7 @@ extern void set_merr_handler(unsigned long offset, void *addr, unsigned long len
>  #ifdef CONFIG_RELOCATABLE
>  
>  struct rela_la_abs {
> -	long offset;
> +	long pc;
>  	long symvalue;
>  };
>  
> diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
> index 6c3eff9af9fb..288b739ca88d 100644
> --- a/arch/loongarch/kernel/relocate.c
> +++ b/arch/loongarch/kernel/relocate.c
> @@ -52,7 +52,7 @@ static inline void __init relocate_absolute(long random_offset)
>  	for (p = begin; (void *)p < end; p++) {
>  		long v = p->symvalue;
>  		uint32_t lu12iw, ori, lu32id, lu52id;
> -		union loongarch_instruction *insn = (void *)p - p->offset;
> +		union loongarch_instruction *insn = (void *)p->pc;
>  
>  		lu12iw = (v >> 12) & 0xfffff;
>  		ori    = v & 0xfff;
> -- 
> 2.42.1
> 
> 

