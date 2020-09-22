Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4492274A43
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 22:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIVUn0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Sep 2020 16:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgIVUnZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Sep 2020 16:43:25 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB63C061755;
        Tue, 22 Sep 2020 13:43:25 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id t76so22531629oif.7;
        Tue, 22 Sep 2020 13:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=KdCQLUMa1BgVZhsRlZXkLIR/4+CcJfKxnEY9x+jQRmk=;
        b=PkNwp1g+DfRahyIWhD63SmIwidf1fXHTQOV2anX2v0IQwE2fRl2qeMv6FbFsYiOUsA
         UEGNVCLLdJz0HCUBHg2+DvmnPpzjhgMJWHaicL3jgAJ6nPhZ64POjJqslTWAyrq04bUW
         mzLEMOHs0M7IgcQH6K3o3z/cOdh7HwkxMt3lk2ms92Ah07D4HbwsmYHKQvCxWsJToanr
         q0fNau/QQK60GOxyLw63GCJ0gf9lVYiNxp46jzW5JH3ix3Vh61ed9RyXbdMLv8/KEffA
         go69hlyyiFECutPE0NMojm61w5EGhxB6xap2iAkWlp8GviB64dJjFj4hbQ+h1Ri7U4dV
         W/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=KdCQLUMa1BgVZhsRlZXkLIR/4+CcJfKxnEY9x+jQRmk=;
        b=l3YDk/zTWVJozD9bXJF6QXCdf62V6DWpLfPyHX9BG1rsPdmxxFRfgUphw8FL+m5/dm
         63+Q1Ye3qbnDpkTtlqGwFIo2L5gTSa95e2UWHJz4ja3dIfzC/2MLgH1JJqHbArXD9e3l
         tU9POXoKttK6vObo1qSPKm2V+amL1P1yfTi7ECcSt8GCIPiTxBmApR9ZAAqO1dBzk0cf
         UASy1uCQgHVYlxpyZfjkYdhMh31TbvqllH4uLEHrOt9QtdBcpekBBjstwBeQX7jDCQvd
         zAUe9i8Waur1ukQbijb7LGq8sTuld7hNUt3A8MvhVzQrLr9/MnYGSy000dO183loy68d
         2o8Q==
X-Gm-Message-State: AOAM530hiyHfp/AfKQXBdFVkCjP8ETxUyioDhq/JrHyzBQ6tK/2C0Dvx
        FMKZOm2b3z8JhZyGQWK18ZzyG8GCtx8=
X-Google-Smtp-Source: ABdhPJxbsAYPQ56Lk0sXT2lUFLdKqOY2rgEUGFWL+w7UhoO5s2LxpjBejbHbjFnRVl/bF48HiMcNWQ==
X-Received: by 2002:a05:6808:3d0:: with SMTP id o16mr3740023oie.156.1600807405030;
        Tue, 22 Sep 2020 13:43:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x21sm7746352oie.49.2020.09.22.13.43.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Sep 2020 13:43:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 22 Sep 2020 13:43:23 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/kallsyms: skip ppc compiler stub *.long_branch.*
 / *.plt_branch.*
Message-ID: <20200922204323.GA244571@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 23, 2020 at 02:48:56AM +0900, Masahiro Yamada wrote:
> PowerPC allmodconfig often fails to build as follows:
> 
>     LD      .tmp_vmlinux.kallsyms1
>     KSYM    .tmp_vmlinux.kallsyms1.o
>     LD      .tmp_vmlinux.kallsyms2
>     KSYM    .tmp_vmlinux.kallsyms2.o
>     LD      .tmp_vmlinux.kallsyms3
>     KSYM    .tmp_vmlinux.kallsyms3.o
>     LD      vmlinux
>     SORTTAB vmlinux
>     SYSMAP  System.map
>   Inconsistent kallsyms data
>   Try make KALLSYMS_EXTRA_PASS=1 as a workaround
>   make[2]: *** [../Makefile:1162: vmlinux] Error 1
> 
> Setting KALLSYMS_EXTRA_PASS=1 does not help.
> 
> This is caused by the compiler inserting stubs such as *.long_branch.*
> and *.plt_branch.*
> 
>   $ powerpc-linux-nm -n .tmp_vmlinux.kallsyms2
>    [ snip ]
>   c00000000210c000 T __init_begin
>   c00000000210c000 T _sinittext
>   c00000000210c010 t 00000075.plt_branch.da9:19
>   c00000000210c020 t 00000075.plt_branch.1677:5
>   c00000000210c030 t 00000075.long_branch.memmove
>   c00000000210c034 t 00000075.plt_branch.9e0:5
>   c00000000210c044 t 00000075.plt_branch.free_initrd_mem
>     ...
> 
> Actually, the problem mentioned in scripts/link-vmlinux.sh comments;
> "In theory it's possible this results in even more stubs, but unlikely"
> is happening here, and ends up with another kallsyms step required.
> 
> scripts/kallsyms.c already ignores various compiler stubs. Let's do
> similar to make kallsysms for PowerPC always succeed in 2 steps.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> ---
> 
>  scripts/kallsyms.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 0096cd965332..306b9b38150f 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -120,17 +120,25 @@ static bool is_ignored_symbol(const char *name, char type)
>  		NULL
>  	};
>  
> +	static const char * const ignored_matches[] = {
> +		".long_branch.",	/* ppc stub */
> +		".plt_branch.",		/* ppc stub */
> +		NULL
> +	};
> +
>  	const char * const *p;
>  
> -	/* Exclude symbols which vary between passes. */
> +	/* ignore symbol names that exactly match to a particular string. */
>  	for (p = ignored_symbols; *p; p++)
>  		if (!strcmp(name, *p))
>  			return true;
>  
> +	/* ignore symbol names that start with a particular string. */
>  	for (p = ignored_prefixes; *p; p++)
>  		if (!strncmp(name, *p, strlen(*p)))
>  			return true;
>  
> +	/* ignore symbol names that end with a particular string. */
>  	for (p = ignored_suffixes; *p; p++) {
>  		int l = strlen(name) - strlen(*p);
>  
> @@ -138,6 +146,12 @@ static bool is_ignored_symbol(const char *name, char type)
>  			return true;
>  	}
>  
> +	/* ignore symbol names that contain a particular string. */
> +	for (p = ignored_matches; *p; p++) {
> +		if (strstr(name, *p))
> +			return true;
> +	}
> +
>  	if (type == 'U' || type == 'u')
>  		return true;
>  	/* exclude debugging symbols */
> -- 
> 2.25.1
> 
