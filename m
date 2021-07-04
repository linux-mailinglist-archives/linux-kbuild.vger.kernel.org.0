Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F32B3BAAB0
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 02:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhGDATd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Jul 2021 20:19:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:53590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhGDATd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Jul 2021 20:19:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 359CB61443;
        Sun,  4 Jul 2021 00:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625357819;
        bh=PPAPh8PB3Qid66l3SUdSzjh88YZamPtSAuWf0trnz2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P5xzEo6sSeADfmDQCXV/fKLBfMbZkI9/Vk+wpJVQA+AEPrR+e+d1DPXCG6Orki76F
         u9NxfL1g9CUqAD8bN15NnGmIYkhkfhD/RQQt3p249U2p8EKpsw8ipyb3pHEsHcjvI4
         0yWPPuGKIgugwf2S8PWVPDdjPhI3MLaWpX1yhsYO8ayYxpeME/d2cnZWkffkKDLLlB
         w0SEl2fYPGDumsyikmt4pg2foHGPe3XbIxm9Pvjkoak9K2eDoXvs+3b3WfB1ZZ1wYK
         djU5OR8Sqmn49fkjNy6pvc2WvGzx+T0fDnfBNLLEhmehffTq6neMQWpnKM8T84IQ8x
         f7ujKJujd5qEA==
Date:   Sat, 3 Jul 2021 17:16:55 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     ndesaulniers@google.com, keescook@chromium.org,
        samitolvanen@google.com, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        yj.chiang@mediatek.com, masahiroy@kernel.org,
        michal.lkml@markovi.net
Subject: Re: [PATCH v3 2/2] Kbuild: lto: add make version checking
Message-ID: <YOD998U8ekXX7IYh@Ryzen-9-3900X.localdomain>
References: <20210702032943.7865-1-lecopzer.chen@mediatek.com>
 <20210702032943.7865-3-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702032943.7865-3-lecopzer.chen@mediatek.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 02, 2021 at 11:29:43AM +0800, Lecopzer Chen wrote:
> LTO with MODVERSIONS will fail in generating correct CRC because
> the makefile rule doesn't work for make with version 3.8X.[1]
> 
> Thus we need to check make version during selecting on LTO Kconfig.
> and the suitable version should be 4.2(40200) which released in 2016[2].
> 
> [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> [2] https://ftp.gnu.org/gnu/make/
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 129df498a8e1..beee68149da8 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -639,6 +639,7 @@ config HAS_LTO_CLANG
>  	def_bool y
>  	# Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
>  	depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
> +	depends on !MODVERSIONS || MAKE_VERSION >= 40200
>  	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
>  	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
>  	depends on ARCH_SUPPORTS_LTO_CLANG
> -- 
> 2.18.0
