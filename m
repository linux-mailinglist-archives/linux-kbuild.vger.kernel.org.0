Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C0835053F
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 19:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbhCaRM4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 13:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbhCaRMl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 13:12:41 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42605C061574;
        Wed, 31 Mar 2021 10:12:41 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso19651765otp.0;
        Wed, 31 Mar 2021 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w2cvXnnxd0+xbsJfw5qYmahus1rTtIjuVdQ1q65Qp7g=;
        b=RouYoUMyBqd/CGIRp4op57mvOpBeFgtLvhLDDjgv3zvb19f/Ugp3LecBDuhMbmdRhk
         BUzoO4WwLnurLk9Xz29+q5GCEJ8QjZhghsJ/T0d/If9sYgshgYvL2kziGJX/6t2uaz4k
         cZCh/rNaXzcBODco2P1K3LfXJcv67ZJuW8/0x7M2McN0qwes3t/NO1JDOZuL+JJlsk7a
         QjXWMg5zqOgbF9sCK116Kh/cY6Qbd/LM/rFS/674DebCmupD59wCZQ4P5G6kHXCB36YD
         E7uaK3DTD0bhbhVY/gkpT8h0fBSpzR4e1dwILL24rtFe6gctk3nnPg9mBlXDCYpOT14b
         8bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=w2cvXnnxd0+xbsJfw5qYmahus1rTtIjuVdQ1q65Qp7g=;
        b=bJ4qTHpfcUh2ydoLV5VbqLokSNBFkerhtEgAOye/cxV6EVrvAW0DsjJIdiAydVZRQg
         HjEviQWYgWUx4LDTt3Bxk4Jror6DGJD2e7fpQl0UNfjaDUM+xTAHlpYijHrL4Ytsg8Fd
         O8hM/+t2dtibXcupD/Y2er9EKrjzszBTJPrVfuKnwRXdM11DWi1OIChv1EzN2UQZ1L6j
         sMG6eoxBFIcxplSmK2Tg+O3kwFY3NKqPXdjnXWy2lE+ylL9+MiKB3DYbGOf1QKdBQUbC
         E8ImdT/G16EVM+aX7ddQkwrXHrQEE5D91NNsJ260bKa6po1Y0Y7hEbWtQjZtJj+qNxUM
         /ImQ==
X-Gm-Message-State: AOAM530Xq+0RO2dWB1CDU7VqwwoAaj8t/R49z8bbbMkOO1g00sZgb0VK
        VeovAfrq3uOzjfIen6b4nyI=
X-Google-Smtp-Source: ABdhPJw7FudBIgM5AnOpG7ZL4VkuwsUovuIwpfhyXr5EV0hSfnACoaBjk6yQ3z+Fg4FmK9MuPYnhzg==
X-Received: by 2002:a05:6830:c1:: with SMTP id x1mr3545320oto.87.1617210760636;
        Wed, 31 Mar 2021 10:12:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e15sm568000otk.64.2021.03.31.10.12.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 10:12:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 31 Mar 2021 10:12:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] kconfig: do not use allnoconfig_y option
Message-ID: <20210331171238.GA141362@roeck-us.net>
References: <20210313194836.372585-1-masahiroy@kernel.org>
 <20210313194836.372585-11-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313194836.372585-11-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 14, 2021 at 04:48:34AM +0900, Masahiro Yamada wrote:
> allnoconfig_y is a bad hack that sets a symbol to 'y' by allnoconfig.
> 
> allnoconfig does not mean a minimum set of CONFIG options because a
> bunch of prompts are hidden by 'if EMBEDDED' or 'if EXPERT', but I do
> not like to do a workaround this way.
> 
> Use the pre-existing feature, KCONFIG_ALLCONFIG, to provide a one
> liner config fragment. CONFIG_EMBEDDED=y is still forced under
> allnoconfig.
> 
> No change in the .config file produced by 'make tinyconfig'.
> 
> The output of 'make allnoconfig' will be changed; we will get
> CONFIG_EMBEDDED=n because allnoconfig literally sets all symbols to n.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

With this patch in place, mips:allnoconfig fails to build with
the following error.

Error log:
WARNING: modpost: vmlinux.o(.text+0x9c70): Section mismatch in reference from the function reserve_exception_space() to the function .meminit.text:memblock_reserve()
The function reserve_exception_space() references
the function __meminit memblock_reserve().
This is often because reserve_exception_space lacks a __meminit
annotation or the annotation of memblock_reserve is wrong.
ERROR: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
make[2]: *** [scripts/Makefile.modpost:62: vmlinux.symvers] Error 1
make[2]: *** Deleting file 'vmlinux.symvers'
make[1]: *** [Makefile:1292: vmlinux] Error 2
make: *** [Makefile:222: __sub-make] Error 2

Guenter

> ---
> 
>  init/Kconfig                    | 1 -
>  kernel/configs/tiny-base.config | 1 +
>  scripts/kconfig/Makefile        | 3 ++-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>  create mode 100644 kernel/configs/tiny-base.config
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 46b87ad73f6a..beb8314fdf96 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1769,7 +1769,6 @@ config DEBUG_RSEQ
>  
>  config EMBEDDED
>  	bool "Embedded system"
> -	option allnoconfig_y
>  	select EXPERT
>  	help
>  	  This option should be enabled if compiling the kernel for
> diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
> new file mode 100644
> index 000000000000..2f0e6bf6db2c
> --- /dev/null
> +++ b/kernel/configs/tiny-base.config
> @@ -0,0 +1 @@
> +CONFIG_EMBEDDED=y
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 7df3c0e4c52e..46f2465177f0 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -102,7 +102,8 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
>  
>  PHONY += tinyconfig
>  tinyconfig:
> -	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
> +	$(Q)KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config $(MAKE) -f $(srctree)/Makefile allnoconfig
> +	$(Q)$(MAKE) -f $(srctree)/Makefile tiny.config
>  
>  # CHECK: -o cache_dir=<path> working?
>  PHONY += testconfig
> -- 
> 2.27.0
> 
