Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D5B2F697B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 19:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbhANSYC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 13:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbhANSYB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 13:24:01 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7B3C061757;
        Thu, 14 Jan 2021 10:23:21 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id 186so9189307qkj.3;
        Thu, 14 Jan 2021 10:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bwCHUuSRmaWekKnX014v+7s9HPNcRa88oAwARjFSB8U=;
        b=qnq4z5CJmwVBFSSas9MB/9kAteV/uUk+ZxBqVX1X+VuXXRBS6KVoLg/hRNaWqPfxhJ
         utchaQj7zrlooLcFajjAuukaEL+dN/Mp56VBwyWwNtSmQUU/5ypYmLMziG4P3e1BtzEx
         si14yPJoWwR4U0Amk5YeNIVJ8eWWTQGj7+rbU+aucxt6UIPdipEGUASjN7ZQlbFAjwLZ
         cDi1AuQKo4kd2jJ3fRV/S41e+0vY8b9fNYXVhHeillaqmzelR5T3D6eOfhCL7HzXjtYB
         oeUfT7Y1TpQWlIm8DX19n+nerypWQXGsX6T2vbkuu37AQVZUHo37Oeh1v8qJqRxnU8i2
         DC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bwCHUuSRmaWekKnX014v+7s9HPNcRa88oAwARjFSB8U=;
        b=miSwywtfzATePmLLPP/rH6Jycv7wbKPLIqmZdc+PzwULyTo7S7+x4FNTqq8aLb7TJf
         LyrhLrMSl1yYX4rpyMIdafSEsfl7D/4V/FUgyuzbib/aLLK0XKy34Zcp/hUQbKVGjUoS
         h0kI0SkzIs1dvVQUOPCj3ip8YOkeSc29Fj3n4Hs6OzEIVbx58/5QTNqO0PiCSt8ZOg9Z
         9FMz1Q/CoSN2LZNI+0h+5SB2E8pupz/jikLcnz3yt0yWr4FHfOr8bExJEIHr2plkJ6D6
         /l12iA20rBNGAW4c6JEkFg6GM/6DBELim+fiZV+OlXoyRPVScC1IODzYk5cjb8PLuKNQ
         uEeQ==
X-Gm-Message-State: AOAM530d40KgRAhjagrpbIHqe46BtBfZlHeRsf33eLLnzrTR5GdizFxX
        cIeQuOn+zRATMRpGNY9IYY4=
X-Google-Smtp-Source: ABdhPJyc13gsVaGjx6bsrqDjwepwjEeJ8dN1p9v/J+dgNQvTgc3w+gS+0q8pmanr/Y4WMsIQ48ygsA==
X-Received: by 2002:a05:620a:a05:: with SMTP id i5mr8319670qka.148.1610648600686;
        Thu, 14 Jan 2021 10:23:20 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id x49sm3445054qtx.6.2021.01.14.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 10:23:19 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:23:18 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: check the minimum compiler version in Kconfig
Message-ID: <20210114182318.GA967110@ubuntu-m3-large-x86>
References: <20210114180709.303370-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114180709.303370-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 15, 2021 at 03:07:09AM +0900, Masahiro Yamada wrote:
> Paul Gortmaker reported a regression in the GCC version check [1].
> If you use GCC 4.8, the build breaks before showing the error message
> "error Sorry, your version of GCC is too old - please use 4.9 or newer."
> 
> I do not want to apply his fix-up since it implies we would not be able
> to remove any cc-option test. Anyway, I admit checking the GCC version
> in <linux/compiler-gcc.h> is too late.
> 
> Almost at the same time, Linus also suggested to move the compiler
> version error to Kconfig time. [2]
> 
> I unified the similar two scripts, gcc-version.sh and clang-version.sh
> into the new cc-version.sh. The old scripts invoked the compiler multiple
> times (3 times for gcc-version.sh, 4 times for clang-version.sh). I
> refactored the code so the new one invokes the compiler just once, and
> also tried my best to use shell-builtin commands where possible.
> 
> The new script runs faster.
> 
>   $ time ./scripts/clang-version.sh clang
>   120000
> 
>   real    0m0.029s
>   user    0m0.012s
>   sys     0m0.021s
> 
>   $ time ./scripts/cc-version.sh clang
>   Clang 120000
> 
>   real    0m0.009s
>   user    0m0.006s
>   sys     0m0.004s
> 
> The cc-version.sh also shows the error if the compiler is old:
> 
>   $ make defconfig CC=clang-9
>   *** Default configuration is based on 'x86_64_defconfig'
>   ***
>   *** Compiler is too old.
>   ***   Your Clang version:    9.0.1
>   ***   Minimum Clang version: 10.0.1
>   ***
>   scripts/Kconfig.include:46: Sorry, this compiler is not supported.
>   make[1]: *** [scripts/kconfig/Makefile:81: defconfig] Error 1
>   make: *** [Makefile:602: defconfig] Error 2
> 
> I removed the clang version check from <linux/compiler-clang.h>
> 
> For now, I did not touch <linux/compiler-gcc.h> in order to avoid
> merge conflict with [3], which has been queued up in the arm64 tree.
> We will be able to clean it up later.
> 
> The new script takes care of ICC because we have <linux/compiler-intel.h>
> although I am not sure if building the kernel with ICC is well-supported.
> 
> [1] https://lkml.org/lkml/2021/1/10/250
> [2] https://lkml.org/lkml/2021/1/12/1708
> [3] https://lkml.org/lkml/2021/1/12/1533
> 
> Fixes: 87de84c9140e ("kbuild: remove cc-option test of -Werror=date-time")
> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
