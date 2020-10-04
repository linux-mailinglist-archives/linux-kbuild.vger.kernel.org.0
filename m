Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3760A282946
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 08:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJDGyK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 02:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDGyK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 02:54:10 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FF0C0613CE;
        Sat,  3 Oct 2020 23:54:09 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id n22so6124834edt.4;
        Sat, 03 Oct 2020 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=EPLwvj5pya/JFWydy8L2Gp24s9uoCH6NbYu2uRRH6ik=;
        b=UG4DnuWuqE6SNkZ5M9hwm9iv1P4o4gLy5ReBNtNlbStSNV/RfwSPM1CzXqSYuQHzDb
         OiWhQQIBIvlUIuAv+4kKBcyLNIdnmTi/4+FXaCdwsW5NtFArKBHf0SgAR78thGCGYIty
         1423smC0NAJevTWU4kHKW2+fPLrxM+OVMKp3O3QPmx2zw79B/x8wwM0z0AgUyIeBut5J
         dTXu0AepR08jsr/AXzTLmplBGQr12f61wq+6dujLJlcAFhpxYUAyi+rC4oBi38W7lpJ4
         PIy4987RpSSFAdYaeSFT+ezfRumdUfnX6UHQmhTxkt0Iu/AmvSpwuWd0ZOqark6tU9Yf
         kySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=EPLwvj5pya/JFWydy8L2Gp24s9uoCH6NbYu2uRRH6ik=;
        b=ZCgRHC5J52AbCvOYdEqjIwOi700FA2kuaaD8Eq2KKzVPreOzmCw6r99wcXMdTIqdJ2
         XyD6btXzcfyd6wAKNYsvRk5pVI/JHBwUxB7XsC6kUtbO14CdF4ov+OJcJOk/F2bRufC/
         hyqrumHoK20THSVBFw2f7JvfnY8QC9nWA+zv+XO/s7N3qBF+akBX3i5ZNkB77SKm/RJL
         KUr1nWjucslj0xMP3pNA4Jfian8T7sVd5IOEbhmkIcqjUGpKswbj7STAAFDGBJlFfNo1
         TH3oy6NI/ldGMasKuU075cv3Lk3jK2lzuofRIO2Xc+nW7FAcl3OLAlPTDIRuL5AaayNh
         E0FA==
X-Gm-Message-State: AOAM530h27mVaunNCT6GB8JNiS5WS8wZmdOEk4tYnjnYTp4e67kpbqne
        ltatn9P6mOApEwOxymAl3PQ=
X-Google-Smtp-Source: ABdhPJzI48R2EuzLCKnqeLePDQ2Dv05WLcSgKkMSb9kmFpHlLInEpkzuSRIfJllzfN1l2U+/csG/Ww==
X-Received: by 2002:a05:6402:b68:: with SMTP id cb8mr11568608edb.350.1601794447224;
        Sat, 03 Oct 2020 23:54:07 -0700 (PDT)
Received: from felia ([2001:16b8:2d26:f700:8d52:b46b:d125:e62a])
        by smtp.gmail.com with ESMTPSA id k18sm4876538ejk.42.2020.10.03.23.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 23:54:06 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Sun, 4 Oct 2020 08:54:05 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH RFC 1/2] kconfig: use interpreters to invoke scripts
In-Reply-To: <d398ec09-2146-1fef-c594-643a9c868b06@gmail.com>
Message-ID: <alpine.DEB.2.21.2010040852150.28226@felia>
References: <d398ec09-2146-1fef-c594-643a9c868b06@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Sat, 3 Oct 2020, Ujjwal Kumar wrote:

> We cannot rely on execute bits to be set on files in the repository.
> The build script should use the explicit interpreter when invoking any
> script from the repository.
> 
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>

Reproduced the setup described in the cover letter on next-20201002.

The issue for make defconfig was resolved with this patch. So:

Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Lukas
 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
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
> 
