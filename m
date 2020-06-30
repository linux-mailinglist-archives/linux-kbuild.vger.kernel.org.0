Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B5620FE89
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 23:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbgF3VOK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 17:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbgF3VOK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 17:14:10 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DB2C061755;
        Tue, 30 Jun 2020 14:14:09 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j12so9950336pfn.10;
        Tue, 30 Jun 2020 14:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rrnIKGMCcN3FaQ+YKppUj+YDfioa23faYyjA6ZKxr3M=;
        b=H7H4y/LdOn+yOX8kEqxuRQuJtzbMzdw4cghREjOaS/b/JXw3HJ9nkgAAxJVvLy5NzI
         vDCX56b5PPCPve6naZHImhnIsNIV8GEpQ5dPagZJECpOraOsEZqtt1BTzJ/wImqbrvAA
         Zk5CchJOVpWKLB3KPJ3Qa/56s0Iw5P0zZE2qQ0mDpgJJ0dRrd6DLSKmCms7aJC/+big4
         v+0kYCDxj+J+lKGjWbD83wUjXuQHsRH9cksrwXMxmWZME7K56t7uQOn9epEoxIBheMbS
         N8aV7EcSABtOMmqyH63kzrz/BJuuYsFK8ZzydorydChJ2+1Ij/oJ7gMSTJ/IhFfO1w9r
         8O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rrnIKGMCcN3FaQ+YKppUj+YDfioa23faYyjA6ZKxr3M=;
        b=q0CNggGPh0eO+14uIvyDGNlVPUSA/cX7o25LzU6gYv52ouCXVRZ3nQ35F41O4rj0A3
         d9kWVyWtpq9beYdQOXqzgG3+jYyFqgP0dwwb9E7mFmIwu/JEJ7YYmK4lhf36czcfzztg
         84eypSjUTP8+CLNIH/rFyZmhuj4lGuv8xRXe4FS0fxqkRLTf5DDFA/nGy/B3mWZz0mD/
         JTQG801Lbo+F+XA56Phreu4pR9DfJK9PlbZQT2/XMddCgWMy4L4m4tlR8dPriQQ8cXP9
         nYXJJq905MOj9cEshWfM6aIEC8cQ00OAeHPGFXUUwSD17YUj36JoK1BlCahE4WEKc9eX
         6tIQ==
X-Gm-Message-State: AOAM532IBJeoeXNk+/FJ/eLq5RGv/fomvigYdCwOtXvf7KzcYFhf8+Hc
        BKcizV1vrGfV0lXJkHD/EFpODN/m
X-Google-Smtp-Source: ABdhPJwAb4XWqAz2Ol4ut0ENiZ1C+KiERkuIVNfMrje0qJwxanqf92CGbLdboklhdCvfPxRbXjL4sw==
X-Received: by 2002:aa7:8555:: with SMTP id y21mr4532301pfn.75.1593551649467;
        Tue, 30 Jun 2020 14:14:09 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:1000:7a00::1])
        by smtp.gmail.com with ESMTPSA id c30sm3490561pfj.213.2020.06.30.14.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:14:08 -0700 (PDT)
Date:   Tue, 30 Jun 2020 14:14:07 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v2 1/2] kbuild: fix CONFIG_CC_CAN_LINK(_STATIC) for
 cross-compilation with Clang
Message-ID: <20200630211407.GA4163361@ubuntu-s3-xlarge-x86>
References: <20200630150625.12056-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630150625.12056-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 01, 2020 at 12:06:24AM +0900, Masahiro Yamada wrote:
> scripts/cc-can-link.sh tests if the compiler can link userspace
> programs.
> 
> When $(CC) is GCC, it is checked against the target architecture
> because the toolchain prefix is specified as a part of $(CC).
> 
> When $(CC) is Clang, it is checked against the host architecture
> because --target option is missing.
> 
> Pass $(CLANG_FLAGS) to scripts/cc-can-link.sh to evaluate the link
> capability for the target architecture.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
> Changes in v2:
>   - New patch
> 
>  init/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index a46aa8f3174d..d0313e7725fa 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -49,13 +49,13 @@ config CLANG_VERSION
>  
>  config CC_CAN_LINK
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m32-flag))
> +	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> +	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>  
>  config CC_CAN_LINK_STATIC
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m32-flag))
> +	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) -static $(m64-flag)) if 64BIT
> +	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) -static $(m32-flag))
>  
>  config CC_HAS_ASM_GOTO
>  	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> -- 
> 2.25.1
> 
