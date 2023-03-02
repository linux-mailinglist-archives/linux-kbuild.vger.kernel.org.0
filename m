Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2439F6A8713
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Mar 2023 17:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjCBQnb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Mar 2023 11:43:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjCBQna (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Mar 2023 11:43:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5C37DA6
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Mar 2023 08:43:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 80A5EB811F8
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Mar 2023 16:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDEFC4339B;
        Thu,  2 Mar 2023 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677775406;
        bh=/3EG9mCgYljy/AeNWULKubu7iLxYcPdrWpi0iqQTytY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C1V38pM6W0R0c4lmN/gk2Mx8h/SqlsjawPWMlCSIv8hZ9pB/m7y0UzuDUVuLP/OFe
         CExGzW77LyaF8WISi8o3nE7QTvY+XLe1fx22+jLoEMI9pBSE6a3xVBqcz3xIN7WTRy
         YycmUDrVoA73rZeiT8jdUoh7R02yjc421jVDD+c3vPumzHioshg/naG6t/75sTQmKQ
         XnHhugdZq143WrmcNLLjeTfpAVC75ISekxuGCzKaHQxUTEed3l+bD6q4ofU37hXO94
         4QFlZgzfncjEBLKT15uWJkU0v5OjaW+KkvjMVUgWOJGxhaQEjHUxrxvE/Z/55jNt6j
         EQdf9k+nbJybg==
Date:   Thu, 2 Mar 2023 09:43:24 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] powerpc/64: Use -mtune=pwr10/9/8 for clang
Message-ID: <20230302164324.GB3010526@dev-arch.thelio-3990X>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
 <20230302131656.50626-2-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302131656.50626-2-mpe@ellerman.id.au>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Michael,

Thanks for the workaround and sorry this has come to bite us :/

On Fri, Mar 03, 2023 at 12:16:56AM +1100, Michael Ellerman wrote:
> For the -mtune option clang doesn't accept power10/9/8, instead it
> accepts pwr10/9/8. That will be fixed in future versions of clang, but
> the kernel must support the clang versions in the wild.
> 
> So add support for the "pwr" spelling if clang is in use.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>

I think that should actually be

Reported-by: Nick Desaulniers <ndesaulniers@google.com>

> BugLink: https://github.com/ClangBuiltLinux/linux/issues/1799
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/platforms/Kconfig.cputype | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> Need to confirm the clang <= 16 statement is correct.

Currently, this is indeed the case. It is possible that Nemanja's patch
will get applied to release/16.x before 16.0.0 final but it might not.
We can always update it later. I think we do want to push to get that
patch applied because I forgot that it is only in 16.0.0 that '-mtune'
starts to do something on PowerPC:

https://github.com/llvm/llvm-project/commit/1dc26b80b872a94c581549a21943756a8c3448a3

Prior to that change, '-mtune' was accepted but did nothing. It is only
once it was hooked up to the backend that we got the spew of warnings. I
think that warrants us trying to get Nemanja's patch into 16.0.0, which
may allow us to drop this workaround altogether...

> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 7d7477b73951..e4e0e81be7de 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -278,6 +278,10 @@ config TUNE_CPU
>  	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
>  	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
>  	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)
> +	# clang <= 16 only supports the "pwr" names
> +	default "-mtune=pwr10"   if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr10)
> +	default "-mtune=pwr9"    if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr9)
> +	default "-mtune=pwr8"    if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr8)
>  
>  config PPC_BOOK3S
>  	def_bool y
> -- 
> 2.39.2
> 
