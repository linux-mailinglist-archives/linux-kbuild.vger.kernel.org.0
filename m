Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B602287D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jul 2020 19:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbgGUR4D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jul 2020 13:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729176AbgGUR4C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jul 2020 13:56:02 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7827C0619DA
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jul 2020 10:56:02 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a14so11098913pfi.2
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jul 2020 10:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jzIH5N8X89auq1yzOeN+/XIVI9FfDEkSMipXnUL9KwI=;
        b=K2vAwTSirJJQPZG/CYaqut1fiZefV7wpVLDUtpTY0a0OD4d6BfcTvOSfiZ8AGVfkwt
         oEbEBxsKFM4JtoIJiiV0D9UjHTn1jHYQ0sqzypvamxqa5HNnw/zjsVmSq3ztmZ/np9Q6
         TrXqEpW00t8D8nTQFNc5xmFBygK3rPi+wGeEu2H4S4HhhNEcvX7lNta53rW7f1pxdL7A
         pGi98fo49S30iAzg1eT5+5fIQ/AkUXyBUAWa+8uQVwCL3wavkoSIbxWQkAixjIuBb2ps
         p5bawOd5RpRWRdEy3gU1Y6S4CeA2vTjbzYnpMuDUydTMZTZDMmgF4mGf8KniQoJrNqZI
         IPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jzIH5N8X89auq1yzOeN+/XIVI9FfDEkSMipXnUL9KwI=;
        b=RZt3w32CvXYaX2xga5aPo06m/ME1KbCXHB6rRIlAr9LRitH9ErgPgM+7YLACbUW/Yg
         f7Phs7IlhCLRGF28vyyZKUEeajNPOaw0ByQ/zayIFIjTjuj4LB7MwlapCy2RtgbVQVhA
         UMRti00Lk3Zn+w65l7taHvDI4LcDiOCC1MBB3XQEClo21d9L7NbSClWrYclcpgeMe0Th
         FGsvwtXDUeGyJ5b3zcd5xe1MmNpakLhdLCGTVewySI91cSdoIETqz06Z61yMWHHQDEtf
         BlMxPzvjW5fzgAj+W1tE1Wn6OY5XG4RQMJXkDastA9MeehNNz+Z6/Z20MQ9f/pCFm8ps
         ZFWw==
X-Gm-Message-State: AOAM533Ry6uzAsjl/iTCPQ7LphkfbYPqxYaPqfpHMQ5/79jM97X0xMJn
        cE2y339XS6mCIV9urR9I3t2yY16GC/Sri2KqbZAYNg==
X-Google-Smtp-Source: ABdhPJzJ26/bO98FgRARdj7k4qHQ/IfXEN4zDqIUfRjmtDca4nUXGzoP/9ck2GkJ0/MMWGhuXJj+F6BjlNpL5An3HD8=
X-Received: by 2002:aa7:84d7:: with SMTP id x23mr4452563pfn.169.1595354161941;
 Tue, 21 Jul 2020 10:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200721173125.1273884-1-maskray@google.com>
In-Reply-To: <20200721173125.1273884-1-maskray@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 21 Jul 2020 10:55:50 -0700
Message-ID: <CAKwvOdkXs+Z28XmNA5i35Bun4kZM1fn5j9msPo8ajSi7JjMyCw@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
To:     Fangrui Song <maskray@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jian Cai <jiancai@google.com>,
        Bill Wendling <morbo@google.com>,
        Manoj Gupta <manojgupta@google.com>,
        "# 3.4.x" <stable@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 21, 2020 at 10:31 AM Fangrui Song <maskray@google.com> wrote:
>
> When CROSS_COMPILE is set (e.g. aarch64-linux-gnu-), if
> $(CROSS_COMPILE)elfedit is found at /usr/bin/aarch64-linux-gnu-elfedit,
> GCC_TOOLCHAIN_DIR will be set to /usr/bin/.  --prefix= will be set to
> /usr/bin/ and Clang as of 11 will search for both
> $(prefix)aarch64-linux-gnu-$needle and $(prefix)$needle.
>
> GCC searchs for $(prefix)aarch64-linux-gnu/$version/$needle,
> $(prefix)aarch64-linux-gnu/$needle and $(prefix)$needle. In practice,
> $(prefix)aarch64-linux-gnu/$needle rarely contains executables.
>
> To better model how GCC's -B/--prefix takes in effect in practice, newer
> Clang (since
> https://github.com/llvm/llvm-project/commit/3452a0d8c17f7166f479706b293caf6ac76ffd90)
> only searches for $(prefix)$needle. Currently it will find /usr/bin/as
> instead of /usr/bin/aarch64-linux-gnu-as.
>
> Set --prefix= to $(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
> (/usr/bin/aarch64-linux-gnu-) so that newer Clang can find the
> appropriate cross compiling GNU as (when -no-integrated-as is in
> effect).
>
> Cc: stable@vger.kernel.org
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Link: https://github.com/ClangBuiltLinux/linux/issues/1099
> ---
> Changes in v2:
> * Updated description to add tags and the llvm-project commit link.
> * Fixed a typo.
>
> Changes in v3:
> * Add Cc: stable@vger.kernel.org
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
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> -CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)
> +CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
>  GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
>  ifneq ($(GCC_TOOLCHAIN),)
> --
> 2.28.0.rc0.105.gf9edc3c819-goog
>


-- 
Thanks,
~Nick Desaulniers
