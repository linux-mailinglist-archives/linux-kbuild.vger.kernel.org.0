Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B928F28296E
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 09:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJDHht (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 03:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgJDHht (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 03:37:49 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1D4C0613CE;
        Sun,  4 Oct 2020 00:37:48 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x22so4404910pfo.12;
        Sun, 04 Oct 2020 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WfCbCO1Ao7anoEBmTDmMuxXQu7QeWRK6G03kQt12ZFU=;
        b=OffVEwzk5rWoDFgvuWzdXLhu4jOQ8cNgoiW4XmVFPkjqhY1t6d853/dAmIUPxImWBn
         QO1LuG62Lvv9pWLJ3lETIQjMOapNbwHJ/ION/X0kTchfnEwSwQqX6AJoFHYjlygwm38h
         9Xh9+8Y18FG25ENDFXw44gvp0OTHyea0SzKyP6GSVBZVihPvrkLkSQtoT2OVkx+EuCj0
         QVPbvcdCMWPn1ho90VrvQguO2suyFftIr7hGdPlSfoRn5Oq16aO9Vfu9SJfgYmr2Qfnb
         eanYhreeIU86bNc4iy275YpYSNzs8Kai4eN1nVOlmhl5UrREwyOtOQt1FFnqp4inPPdm
         vG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WfCbCO1Ao7anoEBmTDmMuxXQu7QeWRK6G03kQt12ZFU=;
        b=ELO6zVj8SDvkVuaOH7aOKK8hHK8EaExiPIwYWo0jVO3Y0xfPx6bTYFNJeGIuazHIof
         w7kOm8o1U4h0eeECfnBb+equkObQp9N4TFlkKIMbwIDcYG/zCGTwUnWc6LHQ0eiCH9wV
         XPvbTNJ9q5Z6YExNwSboVNEZrNfhxv4mMr+1Asg9Ft9qWSbPMdeLzaPHwTu4uBYewTkP
         GEC7vRVltVUeBdBZ/FTWis8bm5qV29Xs3nBnqvsj1k8y+dwKmfkyZAOFhFA0IecG9we+
         ORjuqOFUzhY2uD1sPHZTezXIGdsT8QQeqwU1do7/891IE113n0r+/ZotziMVGdLNQlkJ
         OFrw==
X-Gm-Message-State: AOAM530YC/CbWZHe8sscsyscLOiy0S49ymnMWg0RpWj7z/zKSJKm7GIX
        LG16cwgroskmOQaDE1k224w=
X-Google-Smtp-Source: ABdhPJxEpvyqMNGI4mta5dKV03BltD2crZS1TfUy42HTMCK33lGoq7cjYrelzKeNdW5nWmi334LwQg==
X-Received: by 2002:a63:f746:: with SMTP id f6mr9198685pgk.128.1601797067284;
        Sun, 04 Oct 2020 00:37:47 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain (ip68-3-136-221.ph.ph.cox.net. [68.3.136.221])
        by smtp.gmail.com with ESMTPSA id ie13sm6668209pjb.5.2020.10.04.00.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 00:37:46 -0700 (PDT)
Date:   Sun, 4 Oct 2020 00:37:43 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH RFC 1/2] kconfig: use interpreters to invoke scripts
Message-ID: <20201004073743.GA31645@Ryzen-9-3900X.localdomain>
References: <d398ec09-2146-1fef-c594-643a9c868b06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d398ec09-2146-1fef-c594-643a9c868b06@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 03, 2020 at 08:50:10PM +0530, Ujjwal Kumar wrote:
> We cannot rely on execute bits to be set on files in the repository.
> The build script should use the explicit interpreter when invoking any
> script from the repository.
> 
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  init/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 91456ac0ef20..524f6b555945 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -30,12 +30,12 @@ config CC_IS_GCC
>  
>  config GCC_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>  	default 0
>  
>  config LD_VERSION
>  	int
> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> +	default $(shell,$(LD) --version | $(AWK) -f $(srctree)/scripts/ld-version.sh)
>  
>  config CC_IS_CLANG
>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> @@ -45,20 +45,20 @@ config LD_IS_LLD
>  
>  config CLANG_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/clang-version.sh $(CC))
>  
>  config CC_CAN_LINK
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>  
>  config CC_CAN_LINK_STATIC
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>  
>  config CC_HAS_ASM_GOTO
> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> +	def_bool $(success,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))
>  
>  config CC_HAS_ASM_GOTO_OUTPUT
>  	depends on CC_HAS_ASM_GOTO
> -- 
> 2.26.2
> 
