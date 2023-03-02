Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30ABC6A865A
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Mar 2023 17:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjCBQbE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Mar 2023 11:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjCBQbD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Mar 2023 11:31:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FB523DBE
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Mar 2023 08:30:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8986C615B0
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Mar 2023 16:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B138CC433A0;
        Thu,  2 Mar 2023 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677774656;
        bh=QIonlbD+hXkvNAyStSdE1u4PetKuURzYyfmJzPvCvSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tvNMYOyZWzQEFhxa79ksh+dfMNGVc8pw/xk/hzZyL2N90zi7KtUKYaO9KIKpU4NGz
         1WV9aP7QCEyjagZW/pVhPdZfv9iUWuBSmX0ceoo/eW2ZruQT3q2V3Yk2+Z+6Rihl8/
         vXBliFiiRFqTzIlXP8KVuaW9E7/SHX7tCjaWbmXLucf9Qxdofd7k8CSq4t0iLSH0cb
         0UOl6yjjszW/6mAbGfIKShprsyJZfmR5soN3avzj3O9r4CIc6DjJy/RUe9ZatQFx/g
         ApMtvT3oPKQA6IhUbdfId+S91ahrjzOB9m75BeY8bylrgiqK6/46nGEsDn6VzAamBf
         h78ap67e2sL9Q==
Date:   Thu, 2 Mar 2023 09:30:55 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc/64: Move CPU -mtune options into Kconfig
Message-ID: <20230302163055.GA3010526@dev-arch.thelio-3990X>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302131656.50626-1-mpe@ellerman.id.au>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 03, 2023 at 12:16:55AM +1100, Michael Ellerman wrote:
> Currently the -mtune options are set in the Makefile, depending on what
> is the compiler supports.
> 
> One downside of doing it that way is that the chosen -mtune option is
> not recorded in the .config.
> 
> Another downside is that doing more complicated logic to calculate the
> correct option gets messy in the Makefile.
> 
> So move the determination of which -mtune option to use into Kconfig
> logic.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/Makefile                  | 4 +---
>  arch/powerpc/platforms/Kconfig.cputype | 6 ++++++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 87d6ac27eebd..779956007f0c 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -156,9 +156,7 @@ endif
>  CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
>  AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
>  
> -CFLAGS-$(CONFIG_POWERPC64_CPU) += $(call cc-option,-mtune=power10,	\
> -				  $(call cc-option,-mtune=power9,	\
> -				  $(call cc-option,-mtune=power8)))
> +CFLAGS-y += $(CONFIG_TUNE_CPU)
>  
>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
>  
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 046b571496b1..7d7477b73951 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -273,6 +273,12 @@ config TARGET_CPU
>  	default "e500mc" if E500MC_CPU
>  	default "powerpc" if POWERPC_CPU
>  
> +config TUNE_CPU
> +	string
> +	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
> +	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
> +	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)

Would it be cleaner to hoist the POWERPC64_CPU dependency?

config TUNE_CPU
	string
	default "-mtune=power10" if CC_IS_GCC   && $(cc-option,-mtune=power10)
	default "-mtune=power9"  if CC_IS_GCC   && $(cc-option,-mtune=power9)
	default "-mtune=power8"  if CC_IS_GCC   && $(cc-option,-mtune=power8)
	depends on POWERPC64_CPU

> +
>  config PPC_BOOK3S
>  	def_bool y
>  	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64
> -- 
> 2.39.2
> 
