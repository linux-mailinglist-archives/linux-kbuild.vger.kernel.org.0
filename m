Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA5028295E
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 09:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgJDHQx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 03:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDHQx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 03:16:53 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7F5C0613CE;
        Sun,  4 Oct 2020 00:16:52 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id p21so3659633pju.0;
        Sun, 04 Oct 2020 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wTu6mV8M0PZGhZvk2kb+ZcD1dw1mw7y+tx+MmFTk1ow=;
        b=CGdVC3cyTGmWUQQF7nbfsccUqGk3PsUBtBPAlIEdVo8rtQjBGX3nPMBuDMKfOZ7YvJ
         drxCEbEOnMtiQetfr7nAfC6wnON7Zlvk+o0a+iZ5fcCwkzY6xsHR635YkcITTOPvT6KI
         O+GIUwloWcYGmFCBv8re7J51EhaOpjKaM8jaUuloq0zvQ74X1R+PMIshG2T+/FwaQH5O
         MyZnfj3SZhFxjEHYv58BRX53YcmU0CiKgsKJ3H1HaLcARggRNvVUJ+8Gev2n82LYv7k/
         nMkx5wRXk4fYFllz3j4gISROcnpqI1G2AaDICZA+Xx9x4YzDF8Ivst6lBGr2mfoAKaQt
         TLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wTu6mV8M0PZGhZvk2kb+ZcD1dw1mw7y+tx+MmFTk1ow=;
        b=IqVj5X52wWhNC/TGFFanTTMUZQ4AFfK4CA7jc70a8G815YSxq3AvA44meCO58uR24N
         bapF4wLw+V13C2v9L5PfX9BgSQtm2/VIYxnLI5JC4JYKf4CZjzOqaOePAmaig17XqzRT
         sFPjSrElCQD91qJ7Re0zZlIzr/PZ7ZUMq2C/wRgVhhROt96CsiZXAhLf7zCmiqrVzmyc
         W8k9vHxQ5bbhULCs8eF91eXuq+ret7RnyLr6Ia8CVHH5JrBAKpU1cEGNSsihfZz7m/6S
         3jMLklF4UfiDR6VbL2VtIUAetWcMLmlIFdOFfZ3+VXkb9a09Xm0N/qTMhVCqJSotVbKq
         ZQFg==
X-Gm-Message-State: AOAM532VUvReTBcd46iggtMrQuDG7kv5Dnu3lIsxHfvGrMx/HThjiIMA
        +rXkFLRzWNMnJ+40gtPbCqc=
X-Google-Smtp-Source: ABdhPJzB6lbS+zcp60SMSO6Fjy5MFZNMhbB3nz3nR6XXtD0vSb39ubadiIN1OSv5SyM2MCoeO+DZNQ==
X-Received: by 2002:a17:90b:4303:: with SMTP id ih3mr9933863pjb.14.1601795812431;
        Sun, 04 Oct 2020 00:16:52 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain (ip68-3-136-221.ph.ph.cox.net. [68.3.136.221])
        by smtp.gmail.com with ESMTPSA id b22sm117630pff.131.2020.10.04.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 00:16:51 -0700 (PDT)
Date:   Sun, 4 Oct 2020 00:16:48 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ubsan: Disable UBSAN_TRAP for all*config
Message-ID: <20201004071648.GD1650@Ryzen-9-3900X.localdomain>
References: <20201002221527.177500-1-keescook@chromium.org>
 <20201002221527.177500-5-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002221527.177500-5-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 02, 2020 at 03:15:27PM -0700, Kees Cook wrote:
> Doing all*config builds attempts build as much as possible. UBSAN_TRAP
> effectively short-circuits lib/usban.c, so it should be disabled for
> COMPILE_TEST so that the lib/ubsan.c code gets built.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  lib/Kconfig.ubsan | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 1fc07f936e06..b5b9da0b635a 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -14,6 +14,7 @@ if UBSAN
>  
>  config UBSAN_TRAP
>  	bool "On Sanitizer warnings, abort the running kernel code"
> +	depends on !COMPILE_TEST
>  	depends on $(cc-option, -fsanitize-undefined-trap-on-error)
>  	help
>  	  Building kernels with Sanitizer features enabled tends to grow
> -- 
> 2.25.1
