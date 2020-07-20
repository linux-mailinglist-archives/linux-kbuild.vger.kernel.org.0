Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56179226E1E
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jul 2020 20:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbgGTSQt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jul 2020 14:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728589AbgGTSQt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jul 2020 14:16:49 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E172C061794;
        Mon, 20 Jul 2020 11:16:49 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id 6so13932488qtt.0;
        Mon, 20 Jul 2020 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ETJ2D0RbiCTVneTSz7ImUhHwcWQNimPW4gdoAxG1jvE=;
        b=PYgaz8ukGAJrO6cA5oTxnIS53aYb3fJhzOeAkexz/UxcBdr6P4T5kR+qKJWQZrLh7D
         bDil8t25gf5MSVTnF4qsRMbCmax7Ml1CDS2eokpstjKFL1gPvXr+GUDSfzgGaDPYI2gi
         RSadCKyTXgpGaiJRsu55njmyNzKJxGCplQaGDLiToDN9ls5OxazEgtVH+qujZhfSDAv5
         iNO5m7nE7GEF6xIIWmB1LPyF3lO17zZZIY+/w07ASoCLSHJqOcTi+Z4/2bFccCtn9v0C
         CCN8W7vNFi8P8HV6UWSI5K8yNosK37EO+tlsQkHZkkrxwRASUmzB8QsZrWn/4IrtHv1B
         zv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ETJ2D0RbiCTVneTSz7ImUhHwcWQNimPW4gdoAxG1jvE=;
        b=HKmmeEIZXQzF4SqoU8Nsw6mIbL/18Gu60c56/Q4MtgdTqFgNBc5MJ6stbVhuA5PkgP
         DIFgQzYY5eonGlXlpTpSKvADw3mddJUnNH5iNJ6O6BREOnvaxBk5gaydxRZEmsD4kfLy
         5WvyBd6HFsP+XCNW5Mpa1BSNqULoONoudhWaZkv1a4k0rHP0AKT+rJqVu/7U3Zi06kYA
         fTsu8IdLmAU2TwW/hrOc5vQ6ottHG8BoYFXIxN6O76nL3DNE3/73cod9l/04XbZJpbyo
         rz9u66CvFNqP9tzwo3fMLcmudvlP5CDjf1Csx5Y9IX85FQhvv1H0hRsTZTqmJJo9YRZ5
         QAig==
X-Gm-Message-State: AOAM533W6RRyvUos+ar1FmjdAqJxmCYynrU/WmdFUHs7OxQC85dJN9SI
        thDVxWewAQRI6ATkjEdnNbg=
X-Google-Smtp-Source: ABdhPJxuKmiOBhS2e3Ag7EVXg+6hjOcuxmyrJ8VeIq9qo/oboTy9yy0MyhEIysugJGUhfRaYjiAU9g==
X-Received: by 2002:ac8:6602:: with SMTP id c2mr25099661qtp.243.1595269008281;
        Mon, 20 Jul 2020 11:16:48 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id h81sm299996qke.76.2020.07.20.11.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 11:16:47 -0700 (PDT)
Date:   Mon, 20 Jul 2020 11:16:46 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Fangrui Song <maskray@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross
 compilation
Message-ID: <20200720181646.GA6160@ubuntu-n2-xlarge-x86>
References: <20200720181237.3015826-1-maskray@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720181237.3015826-1-maskray@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 20, 2020 at 11:12:22AM -0700, Fangrui Song wrote:
> When CROSS_COMPILE is set (e.g. aarch64-linux-gnu-), if
> $(CROSS_COMPILE)elfedit is found at /usr/bin/aarch64-linux-gnu-,
> GCC_TOOLCHAIN_DIR will be set to /usr/bin/.  --prefix= will be set to
> /usr/bin/ and Clang as of 11 will search for both
> $(prefix)aarch64-linux-gnu-$needle and $(prefix)$needle.
> 
> GCC searchs for $(prefix)aarch64-linux-gnu/$version/$needle,
> $(prefix)aarch64-linux-gnu/$needle and $(prefix)$needle. In practice,
> $(prefix)aarch64-linux-gnu/$needle rarely contains executables.
> 
> To better model how GCC's -B/--prefix takes in effect in practice, newer
> Clang only searches for $(prefix)$needle and for example it will find
> /usr/bin/as instead of /usr/bin/aarch64-linux-gnu-as.
> 
> Set --prefix= to $(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
> (/usr/bin/aarch64-linux-gnu-) so that newer Clang can find the
> appropriate cross compiling GNU as (when -no-integrated-as is in
> effect).
> 
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Fangrui Song <maskray@google.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1099

Sorry that I did not pay attention before but this needs

Cc: stable@vger.kernel.org

in the body so that it gets automatically backported into all of our
stable branches. I am not sure if Masahiro is okay with adding that
after the fact or if he will want a v2.

I am fine with having my signed-off-by on the patch but I did not really
do much :) I am fine with having that downgraded to

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

if people find it odd.

Thanks for sending this along!

Cheers,
Nathan

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 0b5f8538bde5..3ac83e375b61 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -567,7 +567,7 @@ ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> -CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)
> +CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
>  GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
>  ifneq ($(GCC_TOOLCHAIN),)
> -- 
> 2.28.0.rc0.105.gf9edc3c819-goog
> 
