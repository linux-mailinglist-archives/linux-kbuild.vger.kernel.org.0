Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B963322C51B
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 14:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgGXM0q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 08:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgGXM0p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 08:26:45 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C82C0619D3;
        Fri, 24 Jul 2020 05:26:45 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c2so1056071edx.8;
        Fri, 24 Jul 2020 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gy1q05EbLC446DJAoDUBvWjQth0m12qcMrvkxBoMzzE=;
        b=DeSavU288Owa8gjV9JzGVfV+pHp/XKG/rc9xVt09J3oTuSG7P1wJ9RKHjIiMF3IU7H
         84YkMCKQEh7zD2bdrjw66r8nSHxZwlVQUTwx/ePG3NvutdKjsoBEBye6WjJ1zqRxlgvS
         3G1JTLV7DbbeoKz7CAXPoKxIPM/RWgbAzpcTlBgWgC/JtZJTqPTFP4UORb0hqzgGVhx1
         1m55ep3AzBvH9KsLCRxNg7g3jv6n4UT3WQ83Fx95eQPcJXGnyJ8VkxCOqJH8Rw7AFiqw
         R6BvfBmXvvZYLC9xla63QWaFHdyr6omjesnLtUhW3/tN0vWjVAKIevU6UaSBEUzBVxS/
         vXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Gy1q05EbLC446DJAoDUBvWjQth0m12qcMrvkxBoMzzE=;
        b=g912yXbwD10Q/N4XWao5Ahn+R2gA7ayElCtMyBwbaELMBercmCc4RHSo84kommv39O
         yDE3vl77dfxyBKGKpR2eFKVkXEyZKg9bSgDUFqsIVpn5QuiFR/MJi6zU8ZE69xjuSAR4
         kz4UGEfLhFSWaYv7030YD0kE4gEzL/lxHvxtdyRuq3eGLZt/guDyM5DmAZWbwQxS7wM7
         bxZQVN8sKqHzmYlyXOli+bH6KLGYH5R9IiBd0DiBf/kWQy2VuiAWEwkSb+wjVecqkaIc
         WzCCbvJD/SjToF348GYS/yzjWWyCT8MZb/i2JE+Z4r7waKNso2B50drHuOYI2g4pH0HA
         9Ifw==
X-Gm-Message-State: AOAM533nt8wKwrVx3950c0HxbqLZ8Z1hmHl7z6Scw1luEfDc+ySxpZbc
        96e+sSGZWi1knQ+ChFl3CmM=
X-Google-Smtp-Source: ABdhPJymBL57dTLCS+IX/rfuYm9otLnF0e5t+0pW88G2LQsmG33ccaHq6GOzQq9jmclBPlgHPFxe/A==
X-Received: by 2002:a50:e1cc:: with SMTP id m12mr971177edl.378.1595593603913;
        Fri, 24 Jul 2020 05:26:43 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id bs18sm633777edb.38.2020.07.24.05.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 05:26:43 -0700 (PDT)
Date:   Fri, 24 Jul 2020 14:26:40 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Message-ID: <20200724122640.GC632343@gmail.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-7-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723192801.351114-7-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Nick Terrell <nickrterrell@gmail.com> wrote:

> --- a/arch/x86/boot/compressed/misc.c
> +++ b/arch/x86/boot/compressed/misc.c
> @@ -12,6 +12,11 @@
>   * High loaded stuff by Hans Lermen & Werner Almesberger, Feb. 1996
>   */
>  
> +/* decompressors bring in EXPORT_SYMBOL which is meaningless and will
> + * cause compiler errors in some cases.
> + */
> +#define __DISABLE_EXPORTS
> +
>  #include "misc.h"
>  #include "error.h"
>  #include "pgtable.h"
> @@ -77,6 +82,10 @@ static int lines, cols;
>  #ifdef CONFIG_KERNEL_LZ4
>  #include "../../../../lib/decompress_unlz4.c"
>  #endif
> +
> +#ifdef CONFIG_KERNEL_ZSTD
> +#include "../../../../lib/decompress_unzstd.c"
> +#endif
>  /*
>   * NOTE: When adding a new decompressor, please update the analysis in
>   * ../header.S.
> diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
> index 680c320363db..d6dd43d25d9f 100644
> --- a/arch/x86/include/asm/boot.h
> +++ b/arch/x86/include/asm/boot.h
> @@ -24,9 +24,11 @@
>  # error "Invalid value for CONFIG_PHYSICAL_ALIGN"
>  #endif
>  
> -#ifdef CONFIG_KERNEL_BZIP2
> +#if defined(CONFIG_KERNEL_BZIP2)
>  # define BOOT_HEAP_SIZE		0x400000
> -#else /* !CONFIG_KERNEL_BZIP2 */
> +#elif defined(CONFIG_KERNEL_ZSTD)
> +# define BOOT_HEAP_SIZE		 0x30000
> +#else
>  # define BOOT_HEAP_SIZE		 0x10000
>  #endif

So the other patches explain why the decompression buffer extra space 
was increased from 64k to 128k, but is there a similar 
calculation/estimate for bumping BOOT_HEAD_SIZE from 64k to 192k?

Admittedly the BZ2 exception doesn't set a good example, but maybe we 
can do this for ZSTD?

Thanks,

	Ingo
